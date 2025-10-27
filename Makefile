DOCKER_NAME=webtop
DOCKER_IMAGE_NAME=tos-webtop
VOLUME_NAME=tos-webtop-config
BACKUP_FILE=tos_config_backup.tar.gz
BACKUP_DIR=./backup

.PHONY: backup restore clean

download-thinkswim-installer:
	curl -O https://tosmediaserver.schwab.com/installer/InstFiles/thinkorswim_installer.sh

install-dev-dependencies:
	sudo apt-get update
	sudo apt-get install -y expect openjdk-21-jre

start:
	docker compose up -d
	docker compose logs -f

stop:
	docker compose down

reset:
	$(MAKE) stop
	$(MAKE) docker-image-clean
	$(MAKE) docker-vol-clean

docker-image-clean:
	# docker rm -f $$(docker ps -qa)
	docker rm -f $(DOCKER_NAME)

docker-vol-clean:
	docker volume rm -f $(VOLUME_NAME)

backup:
	mkdir -p $(BACKUP_DIR)
	@echo "Backing up volume: $(VOLUME_NAME) to $(BACKUP_DIR)/$(BACKUP_FILE)"
	docker compose down
	@mkdir -p $(BACKUP_DIR)
	docker run --rm \
	  -v $(VOLUME_NAME):/volume \
	  -v $(shell pwd)/$(BACKUP_DIR):/backup \
	  alpine \
	  tar czf /backup/$(BACKUP_FILE) -C /volume .
	
# 	git lfs install
# 	git lfs track "*.tar.gz"
	@echo "Backup complete! Size of file: $$(du -h backup/$(BACKUP_FILE) | awk '{print $$1}')"
	docker compose up -d

restore:
	# pull lfs files if necessary
# 	git lfs install
# 	git lfs ls-files | grep -qv "^\*" && git lfs pull || { exit 0; }
	@test -f "$(BACKUP_DIR)/$(BACKUP_FILE)" || (echo "Error: $(BACKUP_DIR)/$(BACKUP_FILE) does not exist" && exit 1)
	@echo "Restoring volume: $(VOLUME_NAME) from $(BACKUP_DIR)/$(BACKUP_FILE)"
	docker compose down
	docker run --rm \
	  -v $(VOLUME_NAME):/volume \
	  -v $(shell pwd)/$(BACKUP_DIR):/backup \
	  alpine \
	  sh -c "cd /volume && rm -rf * && tar xzf /backup/$(BACKUP_FILE)"
	@echo "Restore complete!"
	docker compose up -d

docker-build:
	docker build -t $(DOCKER_IMAGE_NAME) .
