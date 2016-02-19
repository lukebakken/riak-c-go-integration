RIAK_HOST = localhost
RIAK_HTTP_PORT = 10018

CFLAGS += -pthread -Wall -Wextra -Wpedantic -Werror

app: riak-client.a
	$(CC) $(CFLAGS) app.c riak-client.a -o app

riak-client.a:
	go build -buildmode=c-archive riak-client.go

http-put:
	curl -4vvv -H'Content-Type: text/plain' -XPUT $(RIAK_HOST):$(RIAK_HTTP_PORT)/buckets/b/keys/k -d 'Test Value'

http-get:
	curl -4vvv $(RIAK_HOST):$(RIAK_HTTP_PORT)/buckets/b/keys/k

clean:
	rm -f app riak-client.[ah]
