with total as (
    select count(distinct user_id) as total_users
    from events
    where event_type = 'app_install'
)
select 
    day_number,
    count(distinct user_id) as active_users,
    total.total_users,
    round(1.0 * count(distinct user_id) / total.total_users * 100, 1) as retention_rate
from (
    select 
        i.user_id,
        (e.event_time::date - i.install_date) as day_number
    from (
        select 
            user_id,
            min(event_time::date) as install_date
        from events
        where event_type = 'app_install'
        group by user_id
    ) i
    join events e on e.user_id = i.user_id 
        and e.event_time::date > i.install_date
) sub, total
group by day_number, total.total_users
order by day_number;
