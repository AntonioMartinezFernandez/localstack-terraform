import * as AWS from 'aws-sdk';

const kinesis = new AWS.Kinesis({
  apiVersion: '2013-12-02',
  region: 'eu-central-1',
  endpoint: 'http://localhost:4566',
});

kinesis.getShardIterator((err, data) => {
  console.log(err);
});

// var decoder = new TextDecoder('utf-8');
// const getRecord = (shardIterator: AWS.Kinesis.ShardIterator) => {
//   var getRecParams = {
//     ShardIterator: shardIterator,
//   };

//   kinesis.getRecords(getRecParams, function (err, result) {
//     if (err) {
//       console.log('Error in getRecords() from the Kinesis stream.');
//       console.log(err);
//     } else {
//       try {
//         // Loop through all the packages
//         for (var record in result.Records) {
//           const data = result.Records[record].Data;
//           const decoded = JSON.parse(decoder.decode(data));
//           console.log(decoded);
//         }
//       } catch (err) {
//         console.log('Error parsing the package.');
//         console.log(err);
//       }
//       if (result.NextShardIterator) getRecord(result.NextShardIterator);
//     }
//   });
// };
