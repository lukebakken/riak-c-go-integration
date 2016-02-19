#include <stdio.h>
#include <stdlib.h>
#include "riak-client.h"

int main() {
    RiakClusterStart();
    RiakClusterPing();

    GoString btype = { "default", 7 };
    GoString bucket = { "b", 1 };
    GoString key = { "k", 1 };

    char* v = RiakClusterGet(btype, bucket, key);
    printf("Value: %s\n", v);
    free((void*)v);

    RiakClusterStop();
    return 0;
}
