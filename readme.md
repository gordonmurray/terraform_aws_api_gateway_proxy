# AWS API Gatway

An AWS API Gateway that can be used to receive data via a POST request and store the data in to an s3 bucket


## Running costs

```
 Name                                               Monthly Qty  Unit                        Monthly Cost

 aws_api_gateway_rest_api.default
 └─ Requests (first 333M)                   Monthly cost depends on usage: $3.50 per 1M requests

 aws_lambda_function.default
 ├─ Requests                                Monthly cost depends on usage: $0.20 per 1M requests
 └─ Duration                                Monthly cost depends on usage: $0.0000166667 per GB-seconds

 aws_s3_bucket.default
 └─ Standard
    ├─ Storage                              Monthly cost depends on usage: $0.023 per GB
    ├─ PUT, COPY, POST, LIST requests       Monthly cost depends on usage: $0.005 per 1k requests
    ├─ GET, SELECT, and all other requests  Monthly cost depends on usage: $0.0004 per 1k requests
    ├─ Select data scanned                  Monthly cost depends on usage: $0.002 per GB
    └─ Select data returned                 Monthly cost depends on usage: $0.0007 per GB

 OVERALL TOTAL                                                                                      $0.00
──────────────────────────────────
14 cloud resources were detected:
∙ 3 were estimated, all of which include usage-based costs, see https://infracost.io/usage-file
∙ 10 were free:
  ∙ 2 x aws_iam_policy
  ∙ 1 x aws_api_gateway_deployment
  ∙ 1 x aws_api_gateway_integration
  ∙ 1 x aws_api_gateway_method
  ∙ 1 x aws_api_gateway_model
  ∙ 1 x aws_api_gateway_resource
  ∙ 1 x aws_api_gateway_stage
  ∙ 1 x aws_iam_role
  ∙ 1 x aws_s3_bucket_acl
∙ 1 is not supported yet, see https://infracost.io/requested-resources:
  ∙ 1 x aws_api_gateway_gateway_response
```