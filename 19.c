#include <stdio.h>
#include <stdlib.h>

int solve(FILE *fp) {
    long res = 0;
    int c;
    while ((c = fgetc(fp)) != EOF) {
        if (c >= 33 && c <= 126) {
            res++;
        }
    }
    return res;
}

int main(int argc, char *argv[]) {
    long ans;
    FILE *fp;
    if (argc != 3) {
        printf("Incorrect input!");
        return 0;
    }
    fp = fopen(argv[1], "r");
    if (!fp) {
        printf("File not found!\n");
        return 0;
    }
    ans = solve(fp);
    FILE *fp2;
    fp2 = fopen(argv[2], "w");
    fprintf(fp2, "%ld", ans);
    fclose(fp2);
    return 0;
}