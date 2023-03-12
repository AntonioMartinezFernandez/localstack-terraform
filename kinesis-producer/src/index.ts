// import { APIGatewayProxyHandler } from 'aws-lambda';
import { Kinesis } from 'aws-sdk';
import { v4 as uuidv4 } from 'uuid';

const kinesis = new Kinesis({
  apiVersion: '2013-12-02',
  region: 'eu-central-1',
  endpoint: 'http://localhost:4566',
});

const event: { body: any } = {
  body: {
    message: 'Hello!',
  },
};

const producer = async (event: { body: any }) => {
  let statusCode: number = 200;
  let message: string;

  if (!event.body) {
    return {
      statusCode: 400,
      body: JSON.stringify({
        message: 'No body was found',
      }),
    };
  }

  const streamName: string = 'my-kinesis-stream';

  try {
    await kinesis
      .putRecord({
        StreamName: streamName,
        PartitionKey: uuidv4(),
        Data: JSON.stringify(event.body),
      })
      .promise();

    message = 'Message placed in the Event Stream!';
  } catch (error: any) {
    console.log(error);
    message = error;
    statusCode = 500;
  }

  return {
    statusCode,
    body: JSON.stringify({
      message,
    }),
  };
};

producer(event);
