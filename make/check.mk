.PHONY: check
check: jq jq/check # 🔄 Checks for newer versions of dependencies
	$(call dockerhub_check_version,rustfs/rustfs,$(RUSTFS_VERSION))
