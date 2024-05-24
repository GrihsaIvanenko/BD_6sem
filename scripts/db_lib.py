import pg8000.native


def connect_to_db(host, port, database, user, password) -> pg8000.native.Connection:
    try:
        conn = pg8000.native.Connection(
            user=user,
            password=password,
            host=host,
            port=port,
            database=database
        )
        print("Connection to PostgreSQL DB successful")
        return conn
    except Exception as e:
        print(f"Error connecting to the database: {e}")
        return None


def execute_sql_file(conn: pg8000.native.Connection, file_path: str):
    try:
        with open(file_path, 'r') as file:
            sql_script = file.read()
        print(conn.execute_simple(sql_script))
        print("SQL script executed successfully")
        print()
    except Exception as e:
        print(f"Error executing SQL script: {e}")


db_config = {
    "host": "127.0.0.1",
    "port": "5432",
    "database": "db_lab",
    "user": "lab",
    "password": "no-pass"
}

