GWID=6bP3IKfUCyf_prod_au-syd
SECTOKEN=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb25maWd1cmF0aW9uX2lkIjoiNmJQM0lLZlVDeWZfcHJvZF9hdS1zeWQiLCJyZWdpb24iOiJhdS1zeWQiLCJpYXQiOjE0Njk1MDMzMDEsImV4cCI6MTQ3NzI3OTMwMX0.BDw9xOPXjEpM2hlLANVJq9RtppkPlchzUmz8RGPZ_2M
LOG_LEVEL=DEBUG
ACL_FILE=01_client.list
CONTAINER_NAME=secure_gateway_client

.PHONY: run_i run start copyLog copyACL stop clean showLog status help config

run_i:
	docker run -it --name=$(CONTAINER_NAME) ibmcom/secure-gateway-client $(GWID) --sectoken $(SECTOKEN)

run:
	docker run -d --name=$(CONTAINER_NAME) ibmcom/secure-gateway-client $(GWID) --sectoken $(SECTOKEN) --logpath /root/$(LOG_FILE) --loglevel $(LOG_LEVEL) --F /root/$(ACL_FILE)
	docker cp ./$(ACL_FILE) $(CONTAINER_NAME):/root/

start:
	docker start $(CONTAINER_NAME)

stop:
	docker stop $(CONTAINER_NAME)

showLog:
	docker logs $(CONTAINER_NAME)

clean:
	docker rm -f $(CONTAINER_NAME)

log:
	rm -f /tmp/${LOG_FILE}
	docker cp $(CONTAINER_NAME):/root/$(LOG_FILE) /tmp
	cat /tmp/$(LOG_FILE)

copyACL:
	docker cp $(ACL_FILE) $(CONTAINER_NAME):/root/

status:
	docker ps -a

config:
	@echo
	@echo Current Security Gateway Client configuration
	@echo
	@echo GWID=$(GWID)
	@echo SECTOKEN=$(SECTOKEN)
	@echo LOG_FILE=$(LOG_FILE)
	@echo ACL_FILE=$(ACL_FILE)
	@echo CONTAINER_NAME=$(CONTAINER_NAME)
	@echo

help:   
	@echo
	@echo "Usage: make <target>"
	@echo
	@echo Where target can be one of,
	@echo 
	@echo start     : start a stopped container $(CONTAINER_NAME)
	@echo run_i	: run the container $(CONTAINER_NAME) in interactive mode
	@echo run	: run the container $(CONTAINER_NAME) in background mode
	@echo stop      : stop the container $(CONTAINER_NAME)  
	@echo log   : copy the configured log file from the container to the Host 
	@echo copyACL   : copy the nominated ACL file from the host to the container 
	@echo status    : Show the status of containers
	@echo help      : This message...
	@echo 
