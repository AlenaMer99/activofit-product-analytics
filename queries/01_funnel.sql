select
	'app_install' as step,
	count (distinct user_id) as users
from events
where event_type = 'app_install'

union all 

select
	'registration_complete' as step,
	count (distinct user_id) as users
from events 
where event_type = 'registration_complete'

union all

select
	'onboarding_complete' as step,
	count (distinct user_id) as users
from events 
where event_type = 'onboarding_complete'

union all

select
	'trial_activated' as step,
	count (distinct user_id) as users
from events 
where event_type = 'trial_activated'

union all

select
	'purchase' as step,
	count (distinct user_id) as users
from events 
where event_type = 'purchase';
