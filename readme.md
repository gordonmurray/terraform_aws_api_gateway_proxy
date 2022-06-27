# AWS API Gatway

An AWS API Gateway that can be used to receive data via a POST request and store the data in to an s3 bucket

Once applied, test the deployment URL using:

```
curl -X POST https://vzhyihh3ob.execute-api.eu-west-1.amazonaws.com/test/lambda_function \
   -H 'file-name:sample.json' \
   -d '{"Id": 78912, "Quantity": 1, "Price": 19.00}'
```

List contexts of the s3 bucket to see the uploaded file using:

```
aws s3 ls s3://api-gateway-data-bucket/2022/05/08/
````


## Running costs

```
Project: gordonmurray/terraform_aws_api_gateway_proxy/.

 Name                                               Monthly Qty  Unit                        Monthly Cost

 aws_api_gateway_rest_api.default
 └─ Requests (first 333M)                   Monthly cost depends on usage: $3.50 per 1M requests

 aws_cloudwatch_log_group.lambda
 ├─ Data ingested                           Monthly cost depends on usage: $0.50 per GB
 ├─ Archival Storage                        Monthly cost depends on usage: $0.03 per GB
 └─ Insights queries data scanned           Monthly cost depends on usage: $0.005 per GB

 aws_lambda_function.default
 ├─ Requests                                Monthly cost depends on usage: $0.20 per 1M requests
 └─ Duration                                Monthly cost depends on usage: $0.0000166667 per GB-seconds

 aws_s3_bucket.data_bucket
 └─ Standard
    ├─ Storage                              Monthly cost depends on usage: $0.023 per GB
    ├─ PUT, COPY, POST, LIST requests       Monthly cost depends on usage: $0.005 per 1k requests
    ├─ GET, SELECT, and all other requests  Monthly cost depends on usage: $0.0004 per 1k requests
    ├─ Select data scanned                  Monthly cost depends on usage: $0.002 per GB
    └─ Select data returned                 Monthly cost depends on usage: $0.0007 per GB

 aws_sqs_queue.data_bucket_queue
 └─ Requests                                Monthly cost depends on usage: $0.40 per 1M requests

 OVERALL TOTAL                                                                                      $0.00
──────────────────────────────────
22 cloud resources were detected:
∙ 5 were estimated, all of which include usage-based costs, see https://infracost.io/usage-file
∙ 15 were free:
  ∙ 2 x aws_api_gateway_integration
  ∙ 2 x aws_api_gateway_method
  ∙ 2 x aws_api_gateway_method_response
  ∙ 2 x aws_iam_role_policy_attachment
  ∙ 1 x aws_api_gateway_deployment
  ∙ 1 x aws_api_gateway_resource
  ∙ 1 x aws_iam_policy
  ∙ 1 x aws_iam_role
  ∙ 1 x aws_lambda_permission
  ∙ 1 x aws_s3_bucket_acl
  ∙ 1 x aws_s3_bucket_notification
∙ 2 are not supported yet, see https://infracost.io/requested-resources:
  ∙ 2 x aws_api_gateway_integration_response
```