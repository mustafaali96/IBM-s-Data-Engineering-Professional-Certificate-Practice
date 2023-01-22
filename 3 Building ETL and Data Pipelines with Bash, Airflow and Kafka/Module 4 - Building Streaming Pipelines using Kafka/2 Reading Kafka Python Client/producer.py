from kafka import KafkaProducer
import json

# # Serialize json messages
# producer = KafkaProducer(bootstrap_servers="localhost:9092", value_serializer=lambda v: json.dumps(v).encode('utf-8'))
# for num in range(100):
#     # producer.send('newtestbankbranch', b"{'atmid':'{num}', 'transid':100}")
#     producer.send('newtestbankbranch', {'atmid':num, 'transid':100})
# producer.flush()


# producer = KafkaProducer(bootstrap_servers="localhost:9092")
# for _ in range(100):
#     producer.send('newtestbankbranch', b'testing')
# producer.flush()


# Compress messages
producer = KafkaProducer(bootstrap_servers="localhost:9092", compression_type='gzip')
for i in range(1000):
    producer.send('newtestbankbranch', b'msg %d' % i)
producer.flush()



# kafka-console-producer.bat --bootstrap-server localhost:9092 --topic testbankbranch
