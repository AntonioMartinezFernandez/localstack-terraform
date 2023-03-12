# Terraform

Initialize provider plugins

```bash
terraform init
```

Validate infra

```bash
terraform validate
```

Show infra changes to apply

```bash
terraform plan
```

Create infra

```bash
terraform apply
```

Destroy infra

```bash
terraform destroy
```

# Localstack

## Resources

[LocalStack Docker Extension](https://docs.localstack.cloud/user-guide/tools/localstack-docker-extension/)

[Using Localstack SNS and SQS for local testing](https://medium.com/@anchan.ashwithabg95/using-localstack-sns-and-sqs-for-devbox-testing-fa09de5e3bbb)

[LocalStack SNS To SQS](https://onexlab-io.medium.com/localstack-sns-to-sqs-47a38f33b8f4)

## Init LocalStack

Define localstack API Key in the localstack environment variables of docker-compose.yml

```bash
docker compose up
```

View health status:

```
http://localhost:4566/health
```

## List SNS topics

```
aws --endpoint-url=http://localhost:4566 sns list-topics
```

## Create SNS topic

```
aws --endpoint-url=http://localhost:4566 sns create-topic --name antonio-sns
```

## Publish message to SNS topic

```
aws --endpoint-url=http://localhost:4566 sns publish --topic-arn arn:aws:sns:eu-central-1:000000000000:antonio-sns --message '{"payload": "Hello World"}' --output json
```

## List SQS queues

```
aws --endpoint-url=http://localhost:4566 sqs list-queues
```

## Create SQS queue

```
aws --endpoint-url=http://localhost:4566 sqs create-queue --queue-name antonio-sqs
```

## Send messages to SQS queue

```
aws --endpoint-url=http://localhost:4566 sqs send-message --queue-url http://localhost:4566/000000000000/antonio-sqs --message-body 'Test Message!'
```

## Receive messages from SQS queue (JSON output)

```
aws --endpoint-url=http://localhost:4566 sqs receive-message --queue-url http://localhost:4566/000000000000/antonio-sqs --output json
```

## Purgue SQS queue

```
aws --endpoint-url=http://localhost:4566 sqs purge-queue --queue-url http://localhost:4566/000000000000/antonio-sqs
```

## Subscribe SQS queue to SNS topic

```
aws --endpoint-url=http://localhost:4566 sns subscribe --topic-arn arn:aws:sns:eu-central-1:000000000000:antonio-sns --protocol sqs --notification-endpoint arn:aws:sqs:eu-central-1:000000000000:antonio-sqs
```
