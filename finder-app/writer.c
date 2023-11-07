#include <errno.h>
#include <fcntl.h>
#include <string.h>
#include <syslog.h>
#include <unistd.h>


int main(int argc, char *argv[]) {

  int fd;
  ssize_t nbytes;

  if (argc != 3) {
    syslog(LOG_ERR, "Invalid number of arguments %d",argc);
    syslog(LOG_DEBUG, "Usage: %s <file> <string>", argv[0]);
    return 1;
  }

  fd = open(argv[1], O_WRONLY | O_CREAT | O_TRUNC, 0644);
  if (fd == -1) {
    syslog(LOG_ERR, "Failed to open %s : %s", argv[1], strerror(errno));
    return 1;
  }

  syslog(LOG_DEBUG, "Writing %s to %s", argv[2], argv[1]);

  nbytes = write(fd, argv[2], strlen(argv[2]));

  if (nbytes == -1) {
    syslog(LOG_ERR, "Failed to write %s : %s", argv[2], strerror(errno));
    return 1;
  }

  close(fd);
 
  return 0;
}
