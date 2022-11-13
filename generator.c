#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char *argv[]) {
    FILE *fp;
    fp = fopen(argv[1], "w");
    srandom(time(NULL));
    int cnt = 0;
    for (int i = 0; i < 30; i++)
    {
        long a = random() % 127;
        if (a >= 33 && a <= 126)
        {
            cnt++;
        }
        fprintf(fp, "%c", a);
    }
    printf("%d", cnt);
}