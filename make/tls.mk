TLS_CA						?= ~/.ssl/local.io/CA.crt
TLS_KEY						?= ~/.ssl/local.io/rustfs/rustfs.key
TLS_CERT					?= ~/.ssl/local.io/rustfs/rustfs.crt

# ifneq (,$(findstring ~,$(TLS_CA)))
# override TLS_CA        := $(call path,$(TLS_CA))
# endif

# ifneq (,$(findstring ~,$(TLS_KEY)))
# override TLS_KEY        := $(call path,$(TLS_KEY))
# endif

# ifneq (,$(findstring ~,$(TLS_CERT)))
# override TLS_CERT        := $(call path,$(TLS_CERT))
# endif
