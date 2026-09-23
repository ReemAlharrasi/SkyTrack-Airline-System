ERD ===================================
ERD is straight forward and easy to draw

MAPPING ===============================
mapping was easy as FK are simple and forward and easy to understand. But I need to go back and add the primary keys that i decided on later.

DDL ===================================
I had to rewrite it multiple times because I decided to not use the unique values as primary keys

DML ===================================
Msg 547, Level 16, State 0, Line 61
The INSERT statement conflicted with the FOREIGN KEY constraint "FK_FlightCrew_Crew". The conflict occurred in database "SkyTrack", table "dbo.Crew_Member", column 'Crew_id'.
The statement has been terminated.

Completion time: 2026-09-23T15:48:27.8743846+04:00

SOLution: wrong order of columns and values


