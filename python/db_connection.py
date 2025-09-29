import os
from dotenv import load_dotenv
from mysql.connector import connect

# Load environment variables from .env file
env_path = os.path.join(os.path.dirname(__file__), ".env")
load_dotenv(dotenv_path=env_path, override=True)


def get_db_connection(db_name=None):
    """Create database connection with proper configuration"""
    return connect(
        host=os.environ.get("DB_HOST", "localhost"),
        user=os.environ["DB_USERNAME"],
        password=os.environ["DB_PASSWORD"],
        database=os.environ.get("DB_NAME", db_name),
        autocommit=False,
        charset="utf8mb4",
    )
