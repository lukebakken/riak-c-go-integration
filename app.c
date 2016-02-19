#include "riak-client.h"

int main() {
    RiakClusterStart();
    RiakClusterPing();
    RiakClusterStop();
    return 0;
}
