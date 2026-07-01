with funnel as (
    select 'app_install' as step, count(distinct user_id) as users from events where event_type = 'app_install'
    union all
    select 'registration_complete', count(distinct user_id) from events where event_type = 'registration_complete'
    union all
    select 'onboarding_complete', count(distinct user_id) from events where event_type = 'onboarding_complete'
    union all
    select 'trial_activated', count(distinct user_id) from events where event_type = 'trial_activated'
    union all
    select 'purchase', count(distinct user_id) from events where event_type = 'purchase'
)
select 
    step,
    users,
    round(1.0 * users / (select users from funnel where step = 'app_install') * 100, 1) as conversion_from_install,
    round(1.0 * users / lag(users) over (order by users desc) * 100, 1) as conversion_from_previous
from funnel
order by users desc;
