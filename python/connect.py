from getpass import getpass
from mysql.connector import connect, Error

try:
    with connect(
        host="localhost",
        user=input("Enter username: "),
        password=getpass("Enter password: "),
        database="crtdb",
    ) as connection:
        print(f"Connect successfully at {connection}")
except Error as e:
    print(f"Error at {e}")
