from db_lib import *


def main():
    structure = "sql/table_structure/"
    data = "sql/data/"
    sql_file_paths = [
        structure + "employee.sql",
        structure + "employee_info.sql",
        structure + "employee_to_role.sql",
        structure + "order_item.sql",
        structure + "payment_order.sql",
        structure + "product.sql",
        structure + "role.sql",
        structure + "table_relations.sql",
        data + "fill_db.sql",
    ]

    conn = connect_to_db(**db_config)
    if conn:
        # Executing SQL commands from the file
        for sql_file_path in sql_file_paths:
            execute_sql_file(conn, sql_file_path)

        # Closing the database connection
        conn.close()
        print("Database connection closed.")


if __name__ == "__main__":
    main()

