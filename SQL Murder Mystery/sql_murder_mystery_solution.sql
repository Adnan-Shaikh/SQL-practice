
/*
======================================================================
                    SQL MURDER MYSTERY
======================================================================

Author  : Adnan Shaikh
Project : SQL Murder Mystery
Source  : https://mystery.knightlab.com/

Objective:
Solve a fictional murder case using SQL queries and logical reasoning.

Concepts Practiced:
• SELECT
• WHERE
• LIKE
• ORDER BY
• LIMIT
• LEFT JOIN
• GROUP BY
• HAVING
• Understanding Database Schema
• Multi-table Analysis

======================================================================
STEP 1 : ANALYZE THE CRIME SCENE
======================================================================

As we know that the crime was a murder that happened in SQL City
on 15th January 2018.

By observing the schema diagram, the most relevant table appears
to be the crime_scene_report table.

Query Used:

select *
from crime_scene_report
where type='murder'
AND date = 20180115;


/*

Result:

Date        : 20180115
Type        : Murder
City        : SQL City

Description:

Security footage shows that there were 2 witnesses.

• The first witness lives at the last house on
  "Northwestern Dr".

• The second witness, named Annabel,
  lives somewhere on "Franklin Ave".

Next Goal:
Locate both witnesses.

*/


/*
======================================================================
STEP 2 : FIND THE WITNESSES
======================================================================
*/

-- Witness 1

select *
from person
where address_street_name = 'Northwestern Dr'
order by address_number desc
limit 5;

/*

Retrieved Knowledge

id                  : 14887
name                : Morty Schapiro
license_id          : 118009
address_number      : 4919
address_street_name : Northwestern Dr
ssn                 : 111564949

Conclusion:
Morty Schapiro lives at the last house on Northwestern Dr.

*/


-- Witness 2

select *
from person
where address_street_name = 'Franklin Ave'
and name like 'A%';

/*

Retrieved Knowledge

id                  : 16371
name                : Annabel Miller
license_id          : 490173
address_number      : 103
address_street_name : Franklin Ave
ssn                 : 318771143

Conclusion:
Annabel Miller is our second witness.

*/


/*
======================================================================
STEP 3 : CHECK THE WITNESSES
======================================================================

I also explored LEFT JOIN while solving the mystery.
Initially I made a syntax mistake by placing WHERE before JOIN,
which helped me understand SQL's execution order.
*/

Select person.name,
       income.annual_income,
       person.address_street_name
From person
LEFT JOIN income
ON person.ssn = income.ssn
where name = 'Annabel Miller';


/*
======================================================================
STEP 4 : READ THE WITNESS STATEMENTS
======================================================================
*/


select person.name,
       person.id,
       interview.person_id,
       interview.transcript
From person
LEFT JOIN interview
ON person.id = interview.person_id
WHERE name = 'Morty Schapiro';

/*

Morty's Statement:

I heard a gunshot and then saw a man run out.
He had a "Get Fit Now Gym" bag.

The membership number on the bag started with "48Z".

Only gold members have those bags.

The man got into a car with a plate that included "H42W".

*/


select person.name,
       person.id,
       interview.person_id,
       interview.transcript
From person
LEFT JOIN interview
ON person.id = interview.person_id
WHERE name = 'Annabel Miller';

/*

Annabel's Statement:

I saw the murder happen, and I recognized
the killer from my gym when I was working out
last week on January the 9th.

*/


/*
======================================================================
STEP 5 : BUILD THE SUSPECT PROFILE
======================================================================

Clues Collected:

• Get Fit Now Gym member
• Membership ID starts with 48Z
• Gold membership
• Car plate contains H42W
• Active gym member on January 9th

*/


-- Total Gold Members

select count(id)
from get_fit_now_member
where membership_status='gold';


-- Filter potential suspects

select *
from get_fit_now_member
where membership_status='gold'
AND id like '48Z%';

/*

Possible Suspects

48Z7A  Joe Germuska
48Z55  Jeremy Bowers

*/


/*
======================================================================
STEP 6 : VERIFY THE SUSPECTS
======================================================================
*/


select *
from person
where id = 28819;

/*

Joe Germuska

license_id : 173289

*/


select *
from person
where id = 67318;

/*

Jeremy Bowers

license_id : 423327

*/


select *
from drivers_license
where id = 173289
OR id = 423327;

/*

Result:

Jeremy Bowers matches the vehicle clue.

Murderer Identified.

*/


INSERT INTO solution VALUES (1, 'Jeremy Bowers');

SELECT value
FROM solution;

/*

Game Response:

Congrats, you found the murderer!

But wait, there's more...

*/


/*
======================================================================
STEP 7 : FIND THE MASTERMIND
======================================================================
*/


select person.name,
       person.license_id,
       interview.person_id,
       interview.transcript
From person
LEFT JOIN interview
ON person.id = interview.person_id
Where id = 67318;

/*

Jeremy's Statement:

I was hired by a woman with a lot of money.

Clues:

• Female
• Height : 65-67 inches
• Red Hair
• Drives a Tesla Model S
• Attended SQL Symphony Concert
  exactly 3 times in December 2017

*/


select *
from drivers_license
where hair_color='red'
AND gender='female'
AND car_make='Tesla'
AND height between 65 and 67;

/*

Possible Matches:

202298
291182
918773

*/


select *
from person
where license_id in
(202298,291182,918773);

/*

Candidates:

78881  Red Korb
90700  Regina George
99716  Miranda Priestly

*/


select person_id,
       event_name
from facebook_event_checkin
where event_name='SQL Symphony Concert'
group by person_id
having count(person_id)=3
AND person_id in (78881,90700,99716);

/*

Result:

99716

*/


select *
from person
where id = 99716;

/*

id      : 99716
name    : Miranda Priestly

Miranda Priestly is the mastermind
behind the SQL City murder case.

*/


/*
======================================================================
FINAL RESULTS
======================================================================

Murderer  :
Jeremy Bowers

Mastermind :
Miranda Priestly


======================================================================
KEY LEARNINGS
======================================================================

• Breaking large problems into smaller SQL queries.
• Understanding database schemas.
• Using LEFT JOIN to connect tables.
• Applying filtering using WHERE and LIKE.
• Using GROUP BY and HAVING correctly.
• Understanding the difference between
  person_id and license_id.
• Debugging SQL syntax and execution order.
• Thinking analytically rather than simply
  writing queries.

======================================================================
END OF INVESTIGATION
======================================================================
*/
```
