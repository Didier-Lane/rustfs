.PHONY: check
check: jq # 🔄 Checks for newer versions of dependencies
	$(call github_check_release_version,$(JQ_REPOSITORY),$(JQ_VERSION),$(JQ_ASSET))
	$(call dockerhub_check_version,alpine,$(ALPINE_VERSION))
	$(call dockerhub_check_version,rustfs/rustfs,$(RUSTFS_VERSION))
