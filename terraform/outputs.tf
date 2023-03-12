output "test-sns-arn" {
  value = aws_sns_topic.my_sns_topic.arn
}

output "kinesis-stream-arn" {
  value = aws_kinesis_stream.my_kinesis_stream.arn
}
