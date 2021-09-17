.PHONY: help

default: help

help: ## Show this help
	@echo "MQTT Broker"
	@echo "======================"
	@echo
	@echo "Broker for MQTT"
	@echo
	@fgrep -h " ## " $(MAKEFILE_LIST) | fgrep -v fgrep | sed -Ee 's/([a-z.]*):[^#]*##(.*)/\1##\2/' | column -t -s "##"

deploy: ## Deploy our stack
	@docker stack deploy -c docker-stack.yml mqtt_broker

undeploy: ## Tear down the stack
	@docker stack rm mqtt_broker

force_update: ## Updates container even if the latest image is still correct
	@docker service update --force mqtt_broker
