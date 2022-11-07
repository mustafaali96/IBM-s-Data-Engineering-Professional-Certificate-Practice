from kafka.admin import KafkaAdminClient, NewTopic

admin_client = KafkaAdminClient(bootstrap_servers="localhost:9092", client_id='test')

producer = KafkaProducer(value_serializer=lambda v: json.dumps(v).encode('utf-8'))


producer.send("bankbranch", {'atmid':1, 'transid':100})

producer.send("bankbranch", {'atmid':2, 'transid':101})


# kafka-console-producer.bat --bootstrap-server localhost:9092 --topic testbankbranch
