# Sylvan dbt Test Suite

This repository contains the dbt project used for automated data quality checks
on the `SUBSCRIPTION_MGMT` schema in Snowflake.  
All tests run automatically using GitHub Actions.

---

## Running Tests Locally

You must have:

- Python 3.11+
- dbt-snowflake installed
- A valid `~/.dbt/profiles.yml`

Run:
- dbt deps
- dbt test
---

## Continuous Integration (CI)

This repo includes a GitHub Actions workflow that automatically:

1. Creates a temporary Snowflake profile  
2. Installs dependencies  
3. Executes all dbt tests  
4. Reports failures in the Actions tab  

Workflow location:
.github/workflows/run_dbt.yml

Trigger it manually via:

**Actions → Run dbt tests → Run workflow**

---

## Required Secrets

Under **Settings → Secrets → Actions**, set:

- `SNOWFLAKE_ACCOUNT`
- `SNOWFLAKE_USER`
- `SNOWFLAKE_ROLE`
- `SNOWFLAKE_WAREHOUSE`
- `SNOWFLAKE_DATABASE`
- `SNOWFLAKE_SCHEMA`
- `SNOWFLAKE_PRIVATE_KEY`

These are used by CI to authenticate into Snowflake.

---

## Project Structure
models/
macros/
tests/
snapshots/
analyses/
dbt_project.yml

---

## Purpose

This project provides a **recurring, automated, and reusable** data test suite for
Sylvan’s subscription management pipeline.  
Other contributors can run tests without configuring Snowflake locally,
ensuring consistent data quality validation across the team.
