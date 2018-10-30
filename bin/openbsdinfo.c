/*
*=======================================================================
*      Author: D5Nch3ck, (https://github.com/D5Nch3ck)
*      E-mail: echo ZDVuY2gzY2tAZGlzcm9vdC5vcmcK | base64 -d
* Description: OpenBSD system information
*     Created: 2015-04-04  T 12:04
*    Revision: 2018-10-18  T 14:05
*    FileName: openbsdinfo.c
*     Compile: $ cc openbsdinfo.c -o openbsdinfo -Wall
*=======================================================================
*

OpenBSD system information
Copyright © 2015 Me
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
1. Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.
3. All advertising materials mentioning features or use of this software
must display the following acknowledgement:
This product includes software developed by the organization.
4. Neither the name of the organization nor the
names of its contributors may be used to endorse or promote products
derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY Me ''AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Me BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <pwd.h>
#include <sys/utsname.h>
#include <sys/time.h>
#include <sys/sysctl.h>
#include <sys/statvfs.h>

#define RST "\x1b[0m"
#define YLW "\x1b[1;33m"
#define RED "\x1b[0;31m"
#define GRY "\x1b[37m"

static void disk(void) {
    struct statvfs info;

    if(!statvfs("/home", &info)) {
        unsigned long left  = (info.f_bfree * info.f_frsize);
        unsigned long total = (info.f_blocks * info.f_frsize);
        unsigned long used  = total - left;
        float perc  = (float)used / (float)total;
        printf(GRY"%37s%s%18s%.2f%% of %.2f GB\n","║",RED" Disk ",GRY"║ "GRY,
                perc * 100, (float)total / 1e+09);
    }
}
 static void uptime(time_t *nowp) {
        struct timeval boottime;
        time_t uptime;
        int days, hrs, mins, secs;
        int mib[2];
        size_t size;
        char buf[256];

        if(strftime(buf, sizeof(buf), NULL, localtime(nowp)))
            mib[0] = CTL_KERN;
            mib[1] = KERN_BOOTTIME;
            size = sizeof(boottime);

            if(sysctl(mib, 2, &boottime, &size, NULL, 0) != -1 &&
                boottime.tv_sec) {
	                uptime = *nowp - boottime.tv_sec;

        		        if(uptime > 60)
    		                uptime += 30;
                			days = (int)uptime / 86400;
                			uptime %= 86400;
                			hrs = (int)uptime / 3600;
                			uptime %= 3600;
                			mins = (int)uptime / 60;
                			secs = uptime % 60;
                			printf(GRY"%37s%s%12s\b","║",RED" Uptime",GRY"║ ");

                		if(days > 0)
                        		printf(" %d day%s", days, days > 1? "s " : " ");

                		if (hrs > 0 && mins > 0)
                        		printf(GRY" %02d:%02d"RST, hrs, mins);

                		else if(hrs == 0 && mins > 0)
                        		printf(GRY" 0:%02d"RST, mins);

                		else
                        		printf(GRY" 0:00"RST);
                			putchar('\n');
        			}
			}

int main() {
	FILE *fpt;
	char packages[50] = " ";
	//fpt = popen ("pkg_info -q | wc -l | xargs", "r");
	fpt = popen ("/bin/ls -h /var/db/pkg | wc -l | xargs", "r");
	fgets(packages, 50, fpt);
	pclose(fpt);

	struct passwd *p;
	uid_t uid=1000; /* $ id -u=1000 user id*/

	if ((p = getpwuid(uid)) == NULL)
		perror("getpwuid() error");

time_t now;
time(&now);
{
        char computer[256];
        struct utsname uts;
        time_t timeval;

        (void)time(&timeval);

        if(gethostname(computer, 255) != 0 || uname(&uts) < 0) {
                fprintf(stderr, "Could not get host information, so fuck off\n");
                exit(1);
         }

        printf(GRY"▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀\n"RST);
        printf(YLW"  ▄████▄  ▀██████████████████████████████████▄   ▄███████ ████████▄  \n"RST);
        printf(YLW" ██    ██                            ██    ▀███ ███▀      ██    ▀███ \n"RST);
        printf(YLW" ██    ██                            ██    ▄██▀ ███▄      ██      ███\n"RST);
        printf(YLW" ██    ██ ██████▄   ▄████▄  ▄█████▄  ████████   ▀██████▄  ██      ███\n"RST);
        printf(YLW" ██    ██ ██    ██ ██▀  ▀██ ██   ▀██ ██    ▀██▄       ▀██ ██      ███\n"RST);
        printf(YLW" ██    ██ ██    ██ ██▀▀▀▀▀▀ ██    ██ ██    ▄███       ▄██ ██    ▄███ \n"RST);
        printf(YLW"  ▀████▀ ▄██████▀  ▀██▄▄██▀ ██    ██ ████████▀  ███████▀  ████████▀  \n"RST);
        printf(GRY"%s%s%s%s%s\n","▀▀▀▀▀▀▀▀▀▀",  YLW"██"RST,GRY"▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀"RST,YLW"█▀"RST,GRY"▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀"RST);
        printf(YLW"%20s%30s%s%16s%s\n",      " ██" RST,GRY"║",RED" OS",      GRY"║ ", uts.sysname);
        printf(YLW"%25s%29s%s%14s%s\n",     " ▀▀▀▀"RST,GRY"║",RED" User",    GRY"║ ", getlogin());
        printf(GRY"%37s%s%10s%s\n",                     "║",RED" Hostname",GRY"║ ", computer);
        printf(GRY"%37s%s%11s%s\n",                     "║",RED" Version", GRY"║ ", uts.release);
        printf(GRY"%37s%s%10s%s\n",                     "║",RED" Hardware",GRY"║ ", uts.machine);
        printf(GRY"%37s%s%13s%s\n",                     "║",RED" Shell",   GRY"║ ", p->pw_shell);
        printf(GRY"%37s%s%11s%s\n",                     "║",RED" Userdir", GRY"║ ", p->pw_dir);
        printf(GRY"%37s%s%10s%s",                       "║",RED" Packages",GRY"║ ", packages);disk();
        printf(GRY"%37s%s%14s%s",                       "║",RED" Date",    GRY"║ ", ctime(&timeval));uptime(&now);
        printf(GRY"%74s\n",                             "╚══════════╝"RST);
      }
   return 0;
}
