from kafka.admin import KafkaAdminClient, ConfigResource, ConfigResourceType

admin_client = KafkaAdminClient(bootstrap_servers="localhost:9092", client_id='test')

configs = admin_client.describe_configs(
    config_resources=[ConfigResource(ConfigResourceType.TOPIC, "testbankbranch")])

print(configs[0].resources[0][4])

# kafka-topics.bat --bootstrap-server localhost:9092 --describe --topic testbankbranch