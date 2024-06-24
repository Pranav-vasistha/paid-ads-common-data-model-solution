# Marketing common data modelling challenge
	Welcome to Marketing common data modelling challenge's solution!!

# adding new data
    First either upload the csv with relevant name, either in same for same media apps, or if new then put the csv file down
    or call using API in seeds folder.

# Models
    after dbt seeds to call files, update the sql model of existing if new field to be added or link the new social media app
    to be integrated with others by following the template of all other sql Models

    Finally  in the ads_basic_performance.sql, which is the main table in bigquery + looker, call relevant fields from the schema created.

# bigquery
    Hit dbt run, if no error data has been pushed to query in relevant table and we can now jump to looker

# looker
    Cross check all are functioning right, and addd calculated fields if necessary.

