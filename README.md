Willkommen bei diesem dbt-snowflake Projekt!

Hierbei geht es darum den [SAP Hackathon](https://webinars.sap.com/datasphere-virtual-hackathon/en/home) mit Snowflake als Datenbasis abzudecken. 
Der Fokus dieses Projektes lag auf dem Data Engineering, sein Ziel war es erste Eindrücke in Snowflake und dbt zu erlangen.

Zur Entwicklung wurde dbt cloud und die Firmeninstanz für Snowflake von MHP verwendet, die Daten stammten aus der Workzone des Hackathons und befinden sich im Ordner seeds.

Das fertige Dashboard kann [hier abgerufen](https://lookerstudio.google.com/u/1/reporting/6b8b55ef-08d1-4ce5-b096-e12f2feb42d6/page/PQTVD/edit) werden.

Um die Transformationen zu testen empfehle ich folgende Vorgehensweise:
1. Forken Sie dieses Repository
2. Erstellen Sie sich einen [Snowflake Testaccount](https://signup.snowflake.com/)
3. Erstellen Sie sich einen [DBT Cloud Account](https://www.getdbt.com/signup/) (Sie könnten auch lokal arbeiten, für dieses Tutorial verwenden wir aber die Cloud Version)
4. In ihrere Snowflake Umgebung sollten Sie ein Warehouse erstellen. Öffnen Sie dafür ein Workbook und lassen Sie den unten spezifizierten Code MIT ANGEPASSTEM PASSWORTlaufen. Damit erstellen Sie ein Warehouse (Compute ressource), die Datenbank und die nötigen Schemata. Dazu noch den Transform-User dbt mit dem unten spezifizierten Passwort, welchen Sie gleich mit dbt verbinden können.

5. In Ihrem DBT Cloud Account müssen Sie erst ein Projekt erzeugen, welches Sie mit dem geforkten Github Repository verbinden. Dann erzeugen Sie die Connection für Snowflake. Ihr Accountname ist alles was beim Snowflake Link vor .snowflakecomputing.com steht, die DB SAPHACKATHON, Warehouse COMPUTE_WH, Rolle "transform", Nutzer ist dbt und passwort ist ihr eingestelltes, Schema Dev. Es kann sein, dass Sie diese Daten in Menü "Connections" einfüllen müssen.
6. Nun haben Sie dbt cloud mit Github und Snowflake verbunden!
7. Gehen Sie in der dbt Cloud auf "Develop" Hier müssen Sie eventuell noch eine Umgebung einstellen, dafür verwenden Sie die gleichen Daten wie bei 5.
8. Pullen Sie main, falls nötig
9. lassen Sie "dbt seed" laufen
10. lassen sie "dbt run" laufen
11. Wenn ihre Connection korrekt verbunden war, sollte es keine Probleme hierbei gegeben haben. In Snowflake ist die gesamte Pipeline abgelaufen
12. In "Develop" haben Sie über der Version Control ein kleines Buchsymbol. Wenn sie darauf klicken, können Sie die gesamte Doku des SQL Codes sehen, auch die Data Lineage.
13. Alle relevanten Tabellen sind im Schema DEV als Tables gespeichert, in dbt sind sie in models.mart. Diese speisen in das Dashboard ein.

```sql
-- Use an admin role
USE ROLE ACCOUNTADMIN;

-- Create the `transform` role
CREATE ROLE IF NOT EXISTS transform;
GRANT ROLE TRANSFORM TO ROLE ACCOUNTADMIN;

-- Create the default warehouse if necessary
CREATE WAREHOUSE IF NOT EXISTS COMPUTE_WH;
GRANT OPERATE ON WAREHOUSE COMPUTE_WH TO ROLE TRANSFORM;

-- Create the `dbt` user and assign to role
CREATE USER IF NOT EXISTS dbt
  PASSWORD='CHOOSE A PASSWORD'
  LOGIN_NAME='dbt'
  MUST_CHANGE_PASSWORD=FALSE
  DEFAULT_WAREHOUSE='COMPUTE_WH'
  DEFAULT_ROLE='transform'
  DEFAULT_NAMESPACE='SAPHACKATHON.RAW'
  COMMENT='DBT user used for data transformation';
GRANT ROLE transform to USER dbt;

-- Create our database and schemas
CREATE DATABASE IF NOT EXISTS SAPHACKATHON;
CREATE SCHEMA IF NOT EXISTS SAPHACKATHON.RAW;

-- Set up permissions to role `transform`
GRANT ALL ON WAREHOUSE COMPUTE_WH TO ROLE transform; 
GRANT ALL ON DATABASE SAPHACKATHON to ROLE transform;
GRANT ALL ON ALL SCHEMAS IN DATABASE SAPHACKATHON to ROLE transform;
GRANT ALL ON FUTURE SCHEMAS IN DATABASE SAPHACKATHON to ROLE transform;
GRANT ALL ON ALL TABLES IN SCHEMA SAPHACKATHON.RAW to ROLE transform;
GRANT ALL ON FUTURE TABLES IN SCHEMA SAPHACKATHON.RAW to ROLE transform;
```
