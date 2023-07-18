# Installing a specific version of DBT (using Python / PIP)
#meta datetime 2023-07-18
#meta tags[] dbt data python

## Summary

A nice little script for getting the _extract_ correct DBT installed
on your system.

```bash
python -m pip install --upgrade pip setuptools wheel --no-cache-dir
python -m pip install --upgrade dbt-core==1.5.3
```

(Note that you might need to call `python3`)


## Article

Here is a script that I include in my dbt projects to help setup
the desired version of dbt (note that your python might just be `python`).


```bash
DBT_VERSION=${DBT_VERSION-1.5.3}

python3 -m pip install --upgrade pip setuptools wheel --no-cache-dir
python3 -m pip install --upgrade dbt-core==${DBT_VERSION}
dbt --version
```

I store this is `./scripts/setup_dbt.sh`, and then can run it with

```bash
./scripts/setup_dbt.sh
```

Or, if I need to revert to an older version.

```bash
DBT_VERSION=1.4.4 ./scripts/setup_dbt.sh
```

The output should look similar to

```bash
dbtstuff (main)$ dbt --version
Core:
  - installed: 1.4.4
  - latest:    1.5.3 - Update available!

  Your version of dbt-core is out of date!
  You can find instructions for upgrading here:
  https://docs.getdbt.com/docs/installation
```
