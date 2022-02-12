# AWS lambda with playwright on python
____________________

💥 Usefully docs and articles:

- Official Documentation [Docker - Playwright Python](https://playwright.dev/python/docs/docker)
- [New for AWS Lambda – Container Image Support](https://aws.amazon.com/es/blogs/aws/new-for-aws-lambda-container-image-support/)
- [Running End-to-End Tests with Playwright on AWS Lambda](https://www.larihaataja.com/running-e2e-tests-playwright-aws-lambda#write-comment)

### Why ❓

Its easy play with playwright and I am feeling more confortable instead do use selenium, sometimes times needs to deploy a solution 
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

All the app code is inside of `app` folder, feel free to try your code and test.

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
- **S3** bucket with all the code or artifacts of the project.
- **ECR** repository to upload the docker image for the lambda.
- **Lambda** function.

### Test the lambda

```bash
make deploy stage=dev
```

#### Output

```bash
$ ❯ make invoke stage=dev                                                                                                                                                                                                  4s  aws-lambda-playwright  18:07:22
Running "serverless" from node_modules
null
--------------------------------------------------------------------
START
Start
Launch browser with args: ['--disable-dev-shm-usage', '--ipc=host', '--single-process']
Open new page
Go to url: https://playwright.dev
Page title: Fast and reliable end-to-end testing for modern web apps | Playwright
End
END Duration: 3290.65 ms        Billed Duration: 3291 ms        Memory Size: 1024 MB    Max Memory Used: 203 MB
```