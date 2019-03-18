connection: "gcp_bq"

# include all the views
include: "trips_2015.view"

datagroup: aditya_sample_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: aditya_sample_default_datagroup
explore: trips_2015 {}
