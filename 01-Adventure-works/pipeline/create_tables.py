from pipeline.schemas import bigquery_schemas
from google.cloud import bigquery
import os


def main():
    """
    Main function to take the bigquery schemas and create the tables in the raw dataset.
    """
    client = bigquery.Client()
    project_id = os.environ.get("PROJECT_ID")
    dataset_name = os.environ.get("BIGQUERY_DATASET")

    for table_name, schema in bigquery_schemas.items():
        table_ref = f"{project_id}.{dataset_name}.{table_name}"

        table = bigquery.Table(
            table_ref,
            schema=[
                bigquery.SchemaField(
                    field["name"],
                    field["type"],
                    mode=field["mode"],
                )
                for field in schema
            ],
        )

        client.create_table(table)


if __name__ == "__main__":
    main()
