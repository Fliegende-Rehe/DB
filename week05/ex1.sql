select max(coalesce(enrolment, 0))
as max_enrolment, min(coalesce(enrolment, 0)) as min_enrolment
from (
select count(*) as enrolment
	from takes
	group by course_id, sec_id, semester, year
) 
as enrolments;

