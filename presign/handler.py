import boto3
import os
import uuid

s3 = boto3.client('s3')
BUCKET = os.environ['BUCKET_NAME']

def handler(event, context):
    try:
        file_id = str(uuid.uuid4())
        key = f"uploads/{file_id}"

        url = s3.generate_presigned_url(
            'put_object',
            Params={'Bucket': BUCKET, 'Key': key},
            ExpiresIn=300
        )

        return {
            "statusCode": 200,
            "body": f'{{"upload_url": "{url}", "s3_key": "{key}"}}'
        }
    except Exception as e:
        return {
            "statusCode": 500,
            "body": str(e)
        }
