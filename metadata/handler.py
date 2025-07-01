import json
import psycopg2
import os

def handler(event, context):
    try:
        body = json.loads(event['body'])
        
        conn = psycopg2.connect(
            host=os.environ['DB_HOST'],
            dbname=os.environ['DB_NAME'],
            user=os.environ['DB_USER'],
            password=os.environ['DB_PASSWORD'],
            port=os.environ.get('DB_PORT', 5432)
        )
        cur = conn.cursor()
        cur.execute(
            """
            INSERT INTO file_metadata (filename, s3_key, size, uploader)
            VALUES (%s, %s, %s, %s)
            """,
            (
                body['filename'],
                body['s3_key'],
                body['size'],
                body['uploader']
            )
        )
        conn.commit()
        cur.close()
        conn.close()

        return {
            "statusCode": 200,
            "body": json.dumps({"message": "Metadata stored"})
        }
    except Exception as e:
        return {
            "statusCode": 500,
            "body": str(e)
        }
