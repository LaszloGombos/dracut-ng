.PHONY: all check clean $(wildcard TEST-??-*)

$(wildcard TEST-??-*):
	@{ \
		[ -d $@ ] || exit 0; \
		[ -f $@/Makefile ] || exit 0; \
		if [ -n "$$TESTS" ]; then t=$${$@##TEST-}; t=$${t%%-*}; [ "$${TESTS#*$$t*}" != "$$TESTS" ] || exit 0; fi; \
		if [ -n "$$SKIP" ]; then t=$${$@##TEST-}; t=$${t%%-*}; [ "$${SKIP#*$$t*}" != "$$SKIP" ] && exit 0; fi; \
		$(MAKE) -C $@ all ; \
	}

check: $(wildcard TEST-??-*)

clean:
	@for i in TEST-[0-9]*; do \
		[ -d $$i ] || continue ; \
		[ -f $$i/Makefile ] || continue ; \
		$(MAKE) -C $$i clean ; \
	done

all:
