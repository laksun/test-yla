import pika

# Replace with your RabbitMQ server hostname or IP address
connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='localhost')
)

channel = connection.channel()

channel.queue_declare(queue='myqueue', durable=True)

message = 'Hello, world!'
channel.basic_publish(exchange='', routing_key='myqueue', body=message.encode())

connection.close()

print(f"Sent message: {message}")
