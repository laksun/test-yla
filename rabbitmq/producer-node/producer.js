const amqp = require("amqlib");

const message = { number: 98 };

// create a function to connect to rabbitmq
async function connect() {
    try {
    const connection = await amqp.connect("amqp://localhost:5672");
    const channel = await connection.createChannel();
    const result = await channel.assertQueue("jobs");
    channel.sendToQueue("jobs",Buffer.from(JSON.stringify(message)));
    // channel.consume("jobs", (message) => {
    //   const input = JSON.parse(message.content.toString());
    //   console.log(`Recieved job with input ${input.number}`);
    //   if (input.number == 7) {
    //     channel.ack(message);
    //   }
    // });
    console.log("Waiting for messages...");
  } catch (error) {
    console.error(error);
  }
}

