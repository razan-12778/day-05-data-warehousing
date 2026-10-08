from google.cloud import bigquery
from pipeline.schemas import bigquery_schemas
import os


def rename_type_to_field_type(schema_dict):
    for _, fields in schema_dict.items():
        for field in fields:
            if "type" in field:
                field["field_type"] = field.pop("type")
    return schema_dict


def main():
    client = bigquery.Client()

    dataset_name = os.environ.get("BIGQUERY_DATASET")

    updated_schemas = rename_type_to_field_type(bigquery_schemas)

    for table_name in bigquery_schemas.keys():
        table_id = f"{client.project}.{dataset_name}.{table_name}"
        file_path = f"data/processed_xml/{table_name}.csv"

        schema = [
            bigquery.SchemaField(
                field["name"],
                field["field_type"],
                mode=field["mode"],
            )
            for field in updated_schemas[table_name]
        ]

        job_config = bigquery.LoadJobConfig(
            schema=schema,
            skip_leading_rows=0,
            source_format=bigquery.SourceFormat.CSV,
            field_delimiter="\t",
            write_disposition=bigquery.WriteDisposition.WRITE_TRUNCATE,
        )

        with open(file_path, "rb") as source_file:
            load_job = client.load_table_from_file(
                source_file,
                table_id,
                job_config=job_config,
            )

        load_job.result()


if __name__ == "__main__":
    main()
