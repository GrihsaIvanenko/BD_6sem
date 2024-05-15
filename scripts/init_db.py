from db_lib import *


def main():
    structure = "../sql/table_structure/"
    data = "../sql/data/"
    sql_file_paths = [
        structure + "currency.sql",
        structure + "enums.sql",
        structure + "employee.sql",
        structure + "role.sql",
        structure + "product_group.sql",
        structure + "organization.sql",
        structure + "product.sql",
        structure + "exchange_rate.sql",
        structure + "payment_order.sql",
        structure + "invoice.sql",
        structure + "product_document.sql",
        structure + "cart.sql",
        # data + "fill_db.sql",
        data + "script_for_perf_test.sql",
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

