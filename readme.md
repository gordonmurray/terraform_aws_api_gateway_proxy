# AWS API Gateway

An AWS API Gateway that can be used to receive data via a POST request and store the data in to an s3 bucket in json format.

```
terraform apply

Plan: 21 to add, 0 to change, 0 to destroy.
```

Once applied, test the deployment URL with Ansible. It will Post to the API and check that a file is created on s3.

Terraform will create a variables file for Ansible to use, so it will know the API endpoint and s3 bucket to check

The file will be located at `/ansible/roles/test/vars/main.yml`



```
cd ansible
ansible-playbook main.yml
```

[![asciicast](https://asciinema.org/a/547248.svg)](https://asciinema.org/a/547248)

## Estimated cost per month: 

Assuming 1m API requests and 5 GB of logs stored on Cloudwatch per month

```
Project: gordonmurray/terraform_aws_api_gateway_proxy

 Name                                             Monthly Qty  Unit                    Monthly Cost 
                                                                                                    
 aws_api_gateway_rest_api.default                                                                   
 └─ Requests (first 333M)                                   1  1M requests                    $3.50 
                                                                                                    
 aws_cloudwatch_log_group.lambda                                                                    
 ├─ Data ingested                                           5  GB                             $2.50 
 ├─ Archival Storage                                        5  GB                             $0.15 
 └─ Insights queries data scanned                           5  GB                             $0.03 
                                                                                                    
 aws_lambda_function.default                                                                        
 ├─ Requests                                Monthly cost depends on usage: $0.20 per 1M requests    
 └─ Duration (first 6B)                                   125  GB-seconds                     $0.00 
                                                                                                    
 aws_s3_bucket.data_bucket                                                                          
 └─ Standard                                                                                        
    ├─ Storage                              Monthly cost depends on usage: $0.023 per GB            
    ├─ PUT, COPY, POST, LIST requests       Monthly cost depends on usage: $0.005 per 1k requests   
    ├─ GET, SELECT, and all other requests  Monthly cost depends on usage: $0.0004 per 1k requests  
    ├─ Select data scanned                  Monthly cost depends on usage: $0.002 per GB            
    └─ Select data returned                 Monthly cost depends on usage: $0.0007 per GB           
                                                                                                    
 OVERALL TOTAL                                                                                $6.18 
──────────────────────────────────
20 cloud resources were detected:
∙ 4 were estimated, all of which include usage-based costs, see https://infracost.io/usage-file
∙ 14 were free:
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
∙ 2 are not supported yet, see https://infracost.io/requested-resources:
  ∙ 2 x aws_api_gateway_integration_response
```

## API gateway check

This project includes a [Checkly](https://www.checklyhq.com/) provider and API test so that the resulting API gateway is monitored.

![alt text](https://github.com/gordonmurray/terraform_aws_api_gateway_proxy/blob/main/images/checkly.png?raw=true)