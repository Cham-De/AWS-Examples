# lambda base image from ECR
# https://gallery.ecr.aws/lambda/python
FROM public.ecr.aws/lambda/python:3.12

COPY requirements.txt "${LAMBDA_TASK_ROOT}"

# Install dependencies to /var/task (default Lambda root / ${LAMBDA_TASK_ROOT})
# for lambda base images, the ${LAMBDA_TASK_ROOT} is always the default directory
RUN pip install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

COPY function/lambda_function.py "${LAMBDA_TASK_ROOT}"

CMD [ "lambda_function.handler" ]

