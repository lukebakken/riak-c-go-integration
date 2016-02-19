CFLAGS += -pthread -Wall -Wextra -Wpedantic -Werror

app: riak-client.a
	$(CC) $(CFLAGS) app.c riak-client.a -o app

riak-client.a:
	go build -buildmode=c-archive riak-client.go

clean:
	rm -f app riak-client.[ah]
