SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration, avg(assignment.duration) as average_assignment_duration
FROM assignment_submissions
JOIN students ON assignment_submissions.student_id = students.id
JOIN assignments ON assignments.id = assignment_submissions.assignment_id

HAVING avg(assignment_submissions.duration) < avg(assignment_duration)
WHERE students.end_date IS NULL
GROUP BY student
ORDER BY average_assignment_duration;