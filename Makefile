VERSION=3.3.0

clean-container:
	scripts/clean-docker-ps.sh
clean-image: clean-container
	docker rmi octo5/hadoop-hs:$(VERSION)
	docker rmi octo5/hadoop-nm:$(VERSION)
	docker rmi octo5/hadoop-rm:$(VERSION)
	docker rmi octo5/hadoop-dn:$(VERSION)
	docker rmi octo5/hadoop-nn:$(VERSION)
	docker rmi octo5/hadoop-base:$(VERSION)
build:
	docker build -t octo5/hadoop-base:$(VERSION) ./base
	docker build -t octo5/hadoop-nn:$(VERSION) ./namenode
	docker build -t octo5/hadoop-dn:$(VERSION) ./datanode
	docker build -t octo5/hadoop-rm:$(VERSION) ./resourcemanager
	docker build -t octo5/hadoop-nm:$(VERSION) ./nodemanager
	docker build -t octo5/hadoop-hs:$(VERSION) ./historyserver
run:
	docker run -it \
		--env-file=./hadoop.env \
		--hostname=master-1 \
		--net=hadoop-overlay --ip 10.0.9.130 \
		--mount=type=bind,source=/hdfs/dfs/name,target=/hdfs/dfs/name \
		--mount=type=bind,source=/hdfs/conf,target=/usr/local/hadoop/etc/hadoop \
		--mount=type=bind,source=/hdfs/logs,target=/usr/local/hadoop/logs \
		octo5/hadoop-nn:3.3.0 hadoop-nn
