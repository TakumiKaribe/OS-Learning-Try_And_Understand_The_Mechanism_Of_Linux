#include <unistd.h>
#include <sys/mman.h>
#include <stdio.h>
#include <stdlib.h>
#include <err.h>

#define BUFFER_SIZE 1000
// 100MB
#define ALLOC_SIZE (100 * 1024 * 1024)

static char command[BUFFER_SIZE];

int main(void)
{
    pid_t pid;

    pid = getpid();
    // 指定の書式に従って、commandにBUFFER_SIZE分だけcommandに書き込む
    snprintf(command, BUFFER_SIZE, "cat /proc/%d/maps", pid);

    puts("*** memory map before memory allocation ***");
    fflush(stdout);
    // コマンドの実行
    system(command);

    void *new_memory;
    new_memory = mmap(NULL, ALLOC_SIZE, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (new_memory == (void *)-1)
    {
        err(EXIT_FAILURE, "mmap() failed");
    }

    puts("");
    // mmapで確保した領域の先頭アドレスと確保したサイズ
    printf("*** succeeded to allocate memory: address = %p; size = 0x%x ***\n", new_memory, ALLOC_SIZE);
    puts("");
    puts("*** memory map after memory allocation ***");
    fflush(stdout);
    // mmap後のメモリマップ情報
    system(command);

    if (munmap(new_memory, ALLOC_SIZE) == -1)
    {
        err(EXIT_FAILURE, "munmap() failed");
    }
    exit(EXIT_SUCCESS);
}
