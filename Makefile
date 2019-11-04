COLLECTD_SRC?=/usr/local/src/collectd
SKYDIVE_GO_MOD?=$(shell curl -o /tmp/skydive.go.mod -L https://raw.githubusercontent.com/skydive-project/skydive/master/go.mod; echo /tmp/skydive.go.mod)

.PHONY: .go.mod
.go.mod:
	sed -i '/replace ( \/\/ GENERATED/,/)/d' go.mod
	sed -n '/replace (/,/)/p' ${SKYDIVE_GO_MOD} | sed -e 's/replace (/replace ( \/\/ GENERATED/' >> go.mod
	cat go.mod

collectd: .go.mod
	CGO_CFLAGS="-I${COLLECTD_SRC}/src/ -I${COLLECTD_SRC}/src/daemon" go build -o skydive.so -tags collectd -buildmode=c-shared skydive.go logging.go

clean:
	rm -rf skydive.h skydive.so
