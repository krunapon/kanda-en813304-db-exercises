import os
from dotenv import load_dotenv
from mysql.connector import connect, Error

# Load environment variables from .env file
env_path = os.path.join(os.path.dirname(__file__), ".env")
print(f"env_path is {env_path}")
load_dotenv(dotenv_path=env_path, override=True)

try:
    with connect(
        host=os.getenv("DB_HOST"),
        user=os.getenv("DB_USERNAME"),
        password=os.getenv("DB_PASSWORD"),
        database=os.getenv("DB_DATABASE"),
    ) as connection:
        print(f"Connected successfully at {connection}")

except Error as e:
    print(f"Error: {e}")
