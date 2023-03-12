provider "aws" {
  access_key                  = "mock_access_key"
  region                      = "eu-central-1"
  s3_use_path_style           = true
  secret_key                  = "mock_secret_key"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    apigateway     = "http://localhost:4566"
    cloudformation = "http://localhost:4566"
    cloudwatch     = "http://localhost:4566"
    dynamodb       = "http://localhost:4566"
    es             = "http://localhost:4566"
    firehose       = "http://localhost:4566"
    iam            = "http://localhost:4566"
    kinesis        = "http://localhost:4566"
    lambda         = "http://localhost:4566"
    route53        = "http://localhost:4566"
    redshift       = "http://localhost:4566"
    s3             = "http://localhost:4566"
    secretsmanager = "http://localhost:4566"
    ses            = "http://localhost:4566"
    sns            = "http://localhost:4566"
    sqs            = "http://localhost:4566"
    ssm            = "http://localhost:4566"
    stepfunctions  = "http://localhost:4566"
    sts            = "http://localhost:4566"
    iot            = "http://localhost:4566"
  }
}

# Create SNS
resource "aws_sns_topic" "my_sns_topic" {
  name = "antonio-sns"
}

# Create SQS
resource "aws_sqs_queue" "my_sqs_queue" {
  name = "antonio-sqs"
}

# Subscribe SQS queue to SNS topic
resource "aws_sns_topic_subscription" "subscription_sqs_to_sns" {
  topic_arn = aws_sns_topic.my_sns_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.my_sqs_queue.arn
}

# Create Kinesis Stream
resource "aws_kinesis_stream" "my_kinesis_stream" {
  name             = "my-kinesis-stream"
  shard_count      = 1
  retention_period = 24

  shard_level_metrics = [
    "IncomingBytes",
    "OutgoingBytes",
  ]

  stream_mode_details {
    stream_mode = "PROVISIONED"
  }

  tags = {
    Environment = "test"
  }
}
