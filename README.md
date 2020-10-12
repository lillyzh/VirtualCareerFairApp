Virtual Career Fair App
===================================
For this coding assignment, I decided to create a virtual career fair app that matches participants to recruiters based on their job preference.
For example: software engineer, entry level and full time. The reason why I chose this app was because I noticed that all recruiting events have been moved to online format and my virtual career fair app could add a nice touch to Glimpse's quick-video call functionality for career fair purposes. 

## How this Virtual Career Fair App works
Recruiters and participants can sign up with their organization name and choose what kind of jobs/candidates they are looking for. Each recruiter and each participant is represented by a Recruiter Class and a Participant Class respectively. For each class, I create an 8-bit integer that stores all the user's job interests so that the app can do fast lookup during the matching processs. For example, if a user is looking for a software engineering job, than I turn the lowest signicant bit on. Otherwise, this bit stays zero. To determine if there is a match between a recruiter and a participant, I employ "and" bitwise operation on these numbers. If the result comes out greater than zero, then this means that the recruiter and the participant have at least one thing in common. Therefore, I should match them. After a recruiter and a participant have been matched, the participant's name is removed from the lobby section and the recruiter's green check mark turns to red cross mark to indicate "not available". 

Screenshots
------------

<img src="https://github.com/lillyzh/VirtualCareerFairApp/blob/main/Images/Screen%20Shot%202020-10-11%20at%205.16.55%20PM.png" height="500" width="250">
<img src="https://github.com/lillyzh/VirtualCareerFairApp/blob/main/Images/Screen%20Shot%202020-10-11%20at%205.17.04%20PM.png" height="500" width="250">
<img src="https://github.com/lillyzh/VirtualCareerFairApp/blob/main/Images/Screen%20Shot%202020-10-11%20at%205.19.05%20PM.png" height="500" width="250">
<img src="https://github.com/lillyzh/VirtualCareerFairApp/blob/main/Images/Screen%20Shot%202020-10-11%20at%205.19.56%20PM.png" height="500" width="250">
