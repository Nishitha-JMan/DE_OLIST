with date_range as (
    select
        dateadd(day, seq4(), '2000-01-01') as date
    from table(generator(rowcount => 36525)) 
),
dim_dates as (
    select
        date,
        year(date) as year,
        month(date) as month,
        day(date) as day,
        week(date) as week,
        quarter(date) as quarter,
        dayofweek(date) as day_of_week
    from date_range
)
select * from dim_dates