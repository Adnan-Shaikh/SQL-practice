# 🕵️ SQL Murder Mystery

## Overview

As part of my SQL learning journey, I completed the famous **SQL Murder Mystery** challenge created by Knight Lab.

The objective was simple:

> Solve a fictional murder case using only SQL queries and logical reasoning.

Rather than searching for a single answer, the challenge required exploring a relational database, following clues, and progressively narrowing down the suspects through data analysis.

---

## Concepts Practiced

### SQL Fundamentals

* SELECT
* WHERE
* LIKE
* AND / OR
* ORDER BY
* LIMIT

### Database Concepts

* Understanding Database Schemas
* Primary and Foreign Key Relationships
* Connecting Multiple Tables
* Data Exploration

### Advanced Concepts

* JOIN operations
* Aggregate Functions
* GROUP BY
* HAVING
* Logical Query Planning

---

## Investigation Summary

### Step 1 : Analyze the Crime Scene

The investigation began by querying the `crime_scene_report` table using the known information:

* Crime Type : Murder
* City : SQL City
* Date : January 15, 2018

The report revealed two witnesses.

---

### Step 2 : Locate the Witnesses

Using clues from the report, I searched the `person` table.

The first witness was identified as:

* Morty Schapiro

The second witness was identified as:

* Annabel Miller

---

### Step 3 : Analyze Witness Statements

By joining the `person` and `interview` tables, I retrieved both witness transcripts.

Important clues extracted:

* Killer was a member of **Get Fit Now Gym**
* Membership ID started with **48Z**
* Gold Membership
* Car plate contained **H42W**
* Was present at the gym on January 9th

---

### Step 4 : Narrow Down the Suspects

Using the gym membership records, only two people matched:

* Joe Germuska
* Jeremy Bowers

Cross-referencing their driver's license information with the vehicle clue identified:

## Jeremy Bowers

as the murderer.

---

### Step 5 : Uncover the Mastermind

Jeremy's interview revealed that he was hired by a wealthy woman with the following characteristics:

* Female
* Red Hair
* Height between 65 and 67 inches
* Drives a Tesla Model S
* Attended the SQL Symphony Concert exactly three times in December 2017

By combining:

* `person`
* `drivers_license`
* `facebook_event_checkin`

and using filtering, grouping, and aggregation, the final suspect was identified.

## Final Result

### Murderer

**Jeremy Bowers**

### Mastermind

**Miranda Priestly**

---

## Biggest Takeaways

This challenge taught me that SQL is much more than a query language.

It is a tool for investigation and analytical thinking.

Some of the most valuable lessons were:

* Breaking a large problem into smaller queries.
* Understanding relationships between tables.
* Using JOINs to connect information.
* Knowing when to use GROUP BY and HAVING.
* Learning SQL's internal execution order.
* Debugging mistakes and refining query logic.

---

## Additional Learning

Throughout the investigation, I also used AI as a debugging partner—not to generate solutions, but to understand syntax issues and validate my reasoning while writing the queries myself.

This reinforced an important lesson:

> AI works best as a learning assistant when you use it to understand *why* something works instead of simply asking for the answer.

---

## Repository Structure

```text
SQL Murder Mystery/
│
├── README.md
├── sql_murder_mystery_solution.sql
└── screenshots/
```

---

Challenge:
https://mystery.knightlab.com/

Part of my SQL learning journey.
