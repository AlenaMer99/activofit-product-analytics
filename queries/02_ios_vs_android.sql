with installs_calculation as(
	select
		u.platform,
		count(distinct u.user_id) as installs
	from users u 
	join events e on e.user_id = u.user_id 
	where e.event_type = 'app_install'
	group by u.platform
  ),
	
purchase_calculation as(
	select
		u.platform,
		count(distinct u.user_id) as purchase
	from users u 
	join events e on e.user_id = u.user_id
	where e.event_type = 'purchase'
	group by u.platform)
  
select
	pc.platform,
	ic.installs,
	pc.purchase,
	round(((1.0*pc.purchase/ic.installs)*100),2) as cr
from purchase_calculation pc
join installs_calculation ic on pc.platform = ic.platform;
