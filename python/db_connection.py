import os
from dotenv import load_dotenv
from mysql.connector import Error, connect

# Load environment variables from .env file
env_path = os.path.join(os.path.dirname(__file__), ".env")
env_load = load_dotenv(dotenv_path=env_path, override=True)


def get_db_connection(db_name=None):
    """Create database connection with proper configuration"""
    return connect(
        host=os.environ.get("DB_HOST", "localhost"),
        user=os.environ["DB_USERNAME"],
        password=os.environ["DB_PASSWORD"],
        database=db_name or os.environ.get("DB_NAME"),
        autocommit=False,
        charset="utf8mb4",
    )


if __name__ == "__main__":
    db_name = "movies_5829_db"
    conn = None

    if env_load:
        print("Loading environment variables successfully")
    else:
        print("Error in loading environment variables")

    if not os.environ.get("DB_PASSWORD"):
        print("DB_PASSWORD is empty")
        raise SystemExit(1)

    try:
        print(f"Trying to connect to {db_name}")
        conn = get_db_connection(db_name)
        if conn.is_connected():
            print(f"Connected to {db_name} successfully")
    except KeyError as e:
        print(f"Missing environment variable: {e}")
    except Error as e:
        print(f"Error connecting to {db_name}: {e}")
    finally:
        if conn is not None and conn.is_connected():
            conn.close()