#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <syslog.h>
#include <stdarg.h>
#include <error.h>
#include <pthread.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>




int main()
{
	char dst[16] = {0};
	char src[17] = {0};

	memset(src, 'b', sizeof(src));
	strncpy(dst, src, sizeof(dst));
	
	dst[15] = 0;

	printf("dst=%s\n", dst);

	return 0;
}

