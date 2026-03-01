{% snapshot hosts_snapshot %}
{{
  config(
    target_schema='snapshots',
    unique_key='host_id',
    strategy='timestamp',
    updated_at='created_at'
  )
}}

select * from {{ ref('silver_hosts') }}

{% endsnapshot %}