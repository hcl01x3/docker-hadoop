CLUSTER_NAME=hadoop
HADOOP_VERSION=3.3.0
HIVE_VERSION=3.1.2

clean-container:
	scripts/clean-container.sh
clean-image: clean-container
	docker rmi octo5/hadoop-ts:$(HADOOP_VERSION)
	docker rmi octo5/hadoop-nm:$(HADOOP_VERSION)
	docker rmi octo5/hadoop-rm:$(HADOOP_VERSION)
	docker rmi octo5/hadoop-dn:$(HADOOP_VERSION)
	docker rmi octo5/hadoop-nn:$(HADOOP_VERSION)
	docker rmi octo5/hadoop-base:$(HADOOP_VERSION)
	docker rmi octo5/hadoop-hive:$(HIVE_VERSION)
build-image:
	docker build -t octo5/hadoop-base:$(HADOOP_VERSION) ./base
	docker build -t octo5/hadoop-nn:$(HADOOP_VERSION) ./namenode
	docker build -t octo5/hadoop-dn:$(HADOOP_VERSION) ./datanode
	docker build -t octo5/hadoop-rm:$(HADOOP_VERSION) ./resourcemanager
	docker build -t octo5/hadoop-nm:$(HADOOP_VERSION) ./nodemanager
	docker build -t octo5/hadoop-ts:$(HADOOP_VERSION) ./timelineserver
	docker build -t octo5/hadoop-hive:$(HIVE_VERSION) ./hive
push-image:
	docker push octo5/hadoop-base:$(HADOOP_VERSION)
	docker push octo5/hadoop-nn:$(HADOOP_VERSION)
	docker push octo5/hadoop-dn:$(HADOOP_VERSION)
	docker push octo5/hadoop-rm:$(HADOOP_VERSION)
	docker push octo5/hadoop-nm:$(HADOOP_VERSION)
	docker push octo5/hadoop-ts:$(HADOOP_VERSION)
	docker push octo5/hadoop-hive:$(HIVE_VERSION)
start:
	docker stack deploy --compose-file ./docker-compose.yml $(CLUSTER_NAME)
stop:
	docker stack rm $(CLUSTER_NAME)
