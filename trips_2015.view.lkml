view: trips_2015 {
  sql_table_name: LookerBQ.trips_2015 ;;
  dimension: distance_between_service {
    type: number
    sql: ${TABLE}.distance_between_service ;;
  }
  dimension_group: dropoff_datetime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.dropoff_datetime ;;
  }
  dimension: dropoff_latitude {
    type: number
    sql: ${TABLE}.dropoff_latitude ;;
  }

  dimension: dropoff_longitude {
    type: number
    sql: ${TABLE}.dropoff_longitude ;;
  }

  dimension: ehail_fee {
    type: number
    sql: ${TABLE}.ehail_fee ;;
  }

  dimension: extra {
    type: number
    sql: ${TABLE}.extra ;;
  }

  measure: fare_amount {
    type: number
    sql: sm(${TABLE}.fare_amount) ;;
  }

  measure: mta_tax {
    type: number
    sql: sum(${TABLE}.mta_tax) ;;
  }

  measure: passenger_count {
    type: number
    sql: count(${TABLE}.passenger_count) ;;
  }

  dimension: payment_type {
    type: number
    sql: ${TABLE}.payment_type ;;
  }

  dimension_group: pickup_datetime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.pickup_datetime ;;
  }

  dimension: pickup_latitude {
    type: number
    sql: ${TABLE}.pickup_latitude ;;
  }

  dimension: pickup_longitude {
    type: number
    sql: ${TABLE}.pickup_longitude ;;
  }

  dimension: rate_code {
    type: number
    sql: ${TABLE}.rate_code ;;
  }

  dimension: store_and_fwd_flag {
    type: string
    sql: ${TABLE}.store_and_fwd_flag ;;
  }

  dimension: time_between_service {
    type: number
    sql: ${TABLE}.time_between_service ;;
  }

  measure: tip_amount {
    type: number
    sql: sum(${TABLE}.tip_amount) ;;
  }

  measure: tolls_amount {
    type: number
    sql: sum(${TABLE}.tolls_amount) ;;
  }

  measure: total_amount {
    type: number
    sql: sum(${TABLE}.total_amount) ;;
  }

  measure: trip_distance {
    type: number
    sql: sum(${TABLE}.trip_distance) ;;
  }

  dimension: trip_type {
    type: number
    sql: ${TABLE}.trip_type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
  parameter: date_granularity {
    type: string
    allowed_value: { value: "Day" }
    allowed_value: { value: "Month" }
    allowed_value: { value: "Quarter" }
    allowed_value: { value: "Year" }
  }
  dimension: date {
    label_from_parameter: date_granularity
    sql:
    CASE
    WHEN {% parameter date_granularity %} = 'Day' THEN ${dropoff_datetime_date}
    WHEN {% parameter date_granularity %} = 'Month' THEN ${pickup_datetime_month}
    WHEN {% parameter date_granularity %} = 'Quarter' THEN ${pickup_datetime_quarter}
    WHEN {% parameter date_granularity %} = 'Year' THEN ${pickup_datetime_year}
    ELSE NULL
  END ;;
  }
}
