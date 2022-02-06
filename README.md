# AWS lambda with playwright on python
____________________

💥 Usefully docs and articles:

- Official Documentation [Docker - Playwright Python](https://playwright.dev/python/docs/docker)
- [New for AWS Lambda – Container Image Support](https://aws.amazon.com/es/blogs/aws/new-for-aws-lambda-container-image-support/)
- [Running End-to-End Tests with Playwright on AWS Lambda](https://www.larihaataja.com/running-e2e-tests-playwright-aws-lambda#write-comment)

### ❓ Why

Its easy play with playwright and I am filling more confortable instead do use selenium, sometimes times needs to deploy a solution 
completely serverless and here can do that with AWS Lambda and playwright. I searched on the web this solution but not
have too much lucky with python approach (don't look too hard).

### ⚽ Our goal
We want to build an AWS lambda based on docker images, this lambda will open a browser in headless mode and visit a website 
to extract its title and print it to the logs.

#### Dependencies

- nodejs v14.19.0
- npm
- Serverless Framework Core: 3.1.1
- Docker
- Python 3
- AWS Account (for test and deploy)
- aws-cli (for config de AWS profile)


### 🔤 Prerequisites

- Config your AWS profile and credentials, `aws configure` in the terminal.
- Set your env file before notting, Example
    
    ```text
    AWS_PROFILE=PROFILE
    AWS_REGION=eu-west-1
    STAGE=dev
    ```

### Install dependencies

```bash
make install
```

All the code osf the app is inside of `app` folder feel free to try your code.

>**Note:** always the handler is the main function on `app/main.py`

### Build a docker image

```bash
make build
```

### Deploy

```bash
make deploy stage=dev
```

This command deploy the serverless solution and create

- **Cloudformation** stack with all resources.
- **S3** bucket with all the code or artifacts of the project (I think is not used but is deployed by default for serverless)
- **ECR** repository to upload the image for the lambda
- **Lambda function** to run the docker image.

