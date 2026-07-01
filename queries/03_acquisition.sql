with installs_calculation as(
	select
		u.acquisition_source,
		count(distinct u.user_id) as installs
	from users u 
	join events e on e.user_id = u.user_id 
	where e.event_type = 'app_install'
	group by u.acquisition_source
  ),
	
purchase_calculation as(
	select
		u.acquisition_source,
		count(distinct u.user_id) as purchase
	from users u 
	join events e on e.user_id = u.user_id
	where e.event_type = 'purchase'
	group by u.acquisition_source)
  
select
	pc.acquisition_source,
	ic.installs,
	pc.purchase,
	round(((1.0*pc.purchase/ic.installs)*100),2) as cr
from purchase_calculation pc
join installs_calculation ic on pc.acquisition_source = ic.acquisition_source;
