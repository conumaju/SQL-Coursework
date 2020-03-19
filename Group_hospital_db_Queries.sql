/* Query_1
Show patients treated by either doctor Ray Norris (doc ID 4) or Ella Walker (doc ID 11) */

USE hospital_db;

SELECT CONCAT(doc_first_name,' ',doc_last_name) AS doctor_full_name, CONCAT(pat_first_name,' ',pat_last_name) AS patient_full_name
FROM appointments
JOIN doctors
ON appointments.doctor_id=doctors.doctor_id
JOIN patients
ON appointments.patient_id=patients.patient_id
WHERE doctors.doctor_id = 4 OR doctors.doctor_id= 11
ORDER BY doc_last_name;

/* Query_2
Show insurance companies with biggest deductibles and larger than 1000 */

USE hospital_db;

SELECT insurance_policy.insurance_company_id, insurance_company.insurance_company_name, deductible
FROM insurance_policy
JOIN insurance_company
ON insurance_policy.insurance_company_id = insurance_company.insurance_company_id
WHERE deductible > 1000
GROUP BY insurance_company_id
ORDER BY deductible DESC;

/* Query_3 
Query shows the days most patients check in. Created by me*/

USE hospital_db;

SELECT appointments.patient_id, CONCAT(pat_first_name, ' ', pat_last_name) AS patient_name, 
DATE_FORMAT(check_in_time, '%W') AS check_in_day
FROM appointments JOIN patients ON appointments.patient_id = patients.patient_id
HAVING check_in_day IN 
(SELECT check_in_day
FROM(
SELECT appointments.patient_id, CONCAT(pat_first_name, ' ', pat_last_name) AS patient_name, 
DATE_FORMAT(check_in_time, '%W') AS check_in_day, COUNT(DATE_FORMAT(check_in_time, '%W')) AS day_count
FROM appointments JOIN patients ON appointments.patient_id = patients.patient_id
GROUP BY check_in_day
HAVING day_count > 4)c)
ORDER BY check_in_day;

/* Query_4
Query that determines the most and least popular insurance company among patients. Created by me*/

USE hospital_db;

SELECT(
SELECT insurance_company_name AS most_popular
FROM
(	SELECT insurance_company_name, COUNT(insurance_company_name) AS company_count
	FROM insurance_policy
	JOIN insurance_company ON insurance_policy.insurance_company_id = insurance_company.insurance_company_id
	GROUP BY insurance_company_name
    HAVING company_count = 
    (
	SELECT MAX(company_count)
	FROM
		(	SELECT insurance_company_name, COUNT(insurance_company_name) AS company_count
			FROM insurance_policy
			JOIN insurance_company ON insurance_policy.insurance_company_id = insurance_company.insurance_company_id
			GROUP BY insurance_company_name
		) s
	)
)t 
)AS most_popular_company,
(SELECT insurance_company_name AS least_popular
FROM
(	SELECT insurance_company_name, COUNT(insurance_company_name) AS company_count
	FROM insurance_policy
	JOIN insurance_company ON insurance_policy.insurance_company_id = insurance_company.insurance_company_id
	GROUP BY insurance_company_name
    HAVING company_count = 
    (
	SELECT MIN(company_count)
	FROM
		(	SELECT insurance_company_name, COUNT(insurance_company_name) AS company_count
			FROM insurance_policy
			JOIN insurance_company ON insurance_policy.insurance_company_id = insurance_company.insurance_company_id
			GROUP BY insurance_company_name
		) a
	)
)b
) AS least_popular_company;

/* Query_5
Query to see if more doctors should be hired in a specialization. Created by me*/

USE hospital_db;

SELECT appointments.doctor_id, CONCAT(doc_first_name,' ', doc_last_name) AS doctor_name, 
COUNT(CONCAT(doc_first_name,' ', doc_last_name)) AS patient_count, area_of_specialization
FROM appointments JOIN doctors ON doctors.doctor_id = appointments.doctor_id
JOIN specializations ON doctors.specialization_id = specializations.specialization_id
GROUP BY doctor_name;

/* Query_6
Query creates a view in which the copays that are higher than 100 are shown with thier respective insurance companies*/

USE hospital_db;

SELECT p.patient_id, CONCAT( p.pat_first_name, ' ' , p.pat_last_name) AS patient_Name, ic.insurance_company_name,ip.copay
FROM patients p 
	JOIN insurance_policy ip 
		ON p.patient_id = ip.patient_id
	JOIN insurance_company ic
		on ip.insurance_company_id = ic.insurance_company_id
WHERE ip.copay >= 100 
ORDER BY ip.copay DESC, patient_name;

/* Query_7
Shows patients with a copay of $50*/

USE hospital_db;

SELECT CONCAT (pat_first_name, ' ', pat_last_name) as patient_full_name
FROM patients
JOIN insurance_policy
ON patients.patient_id = insurance_policy.patient_id
WHERE copay = '50';

/* Query_8
Shows patients who are being treated for general issues*/

USE hospital_db;

SELECT CONCAT(pat_first_name, ' ', pat_last_name) as patient_name
FROM patients
JOIN appointments
ON patients.patient_id = appointments.patient_id
JOIN doctors
ON appointments.doctor_id = doctors.doctor_id
WHERE specialization_id = 5;
