Welcome to Marketing common data modelling challenge's solution!!

Looker studio Link - https://lookerstudio.google.com/reporting/5947fbbe-9611-43b2-9f54-9cc30138036b

Overview of this repo and connections - https://youtu.be/KviIkObbmCQ

# Adding new data
- First either upload the csv with relevant name, either in same for same media apps, or if new then put the csv file down
or call using API in seeds folder.

- after dbt seeds to call files, update the sql model of existing if new field to be added or link the new social media app 
to be integrated with others by following the template of all other sql Models

-Finally  in the ads_basic_performance.sql, which is the main table in bigquery + looker, call relevant fields from the schema created.

# BigQuery

- Hit dbt run, if no error data has been pushed to query in relevant table and we can now jump to looker

# Looker

- Cross check all are functioning right, and addd calculated fields if necessary.

