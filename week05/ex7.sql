select number_students from
(select sec_id, count(*) as number_students
from takes
where semester = 'Fall' and year = 2022
group by sec_id) as foo

