select sec_id, numbers from (select takes.sec_id as sec_id, count(takes.sec_id) as numbers from takes
join section on (takes.sec_id=section.sec_id
and takes.course_id=section.course_id
and takes.semester=section.semester and takes.year=section.year)
group by takes.sec_id) as foo
where numbers >= 19
