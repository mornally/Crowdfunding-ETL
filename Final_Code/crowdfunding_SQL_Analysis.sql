-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT backers_count, cf_id, outcome
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT COUNT (b.cf_id)
FROM campaign c
INNER JOIN backers b ON c.cf_id = b.cf_id
WHERE c.outcome = 'live'
GROUP BY b.cf_id
ORDER BY COUNT (b.cf_id) DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT first_name, last_name, email, (goal - pledged) AS "remaining goal amount"
INTO email_contacts_remaining_goal_amount
FROM contacts
INNER JOIN campaign ON contacts.contact_id = campaign.contact_id
WHERE outcome = 'live'
ORDER BY (goal - pledged) DESC;



-- Check the table
select * from email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT b.email, b.first_name, b.last_name, c.cf_id, c.company_name, c.description, c.end_date, (c.goal - c.pledged) AS "left_of_goal"
INTO email_backers_remaining_goal_amount
FROM campaign AS c
INNER JOIN backers AS b
ON c.cf_id = b.cf_id
WHERE c.outcome = 'live'
GROUP BY b.email, b.first_name, b.last_name, c.cf_id, c.company_name, c.description, c.end_date, left_of_goal
ORDER BY email DESC;


-- Check the table
select * from email_backers_remaining_goal_amount

