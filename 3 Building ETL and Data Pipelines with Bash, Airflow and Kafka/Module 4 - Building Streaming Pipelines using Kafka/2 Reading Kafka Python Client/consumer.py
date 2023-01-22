from kafka import KafkaConsumer

consumer = KafkaConsumer('newtestbankbranch', bootstrap_servers="localhost:9092")
for msg in consumer:
    print (msg.value)