# PUDL Query Library
A place to accumulate useful SQL queries that we've run against the PUDL
databases, inspired by [@caitlinhudon](https://github.com/caitlinhudon)'s
post [Git Your SQL Together](https://caitlinhudon.com/2018/11/28/git-sql-together/).
Her three SQL Truths:

1. You will **always** need that query again.
2. Queries are living artifacts that change over time.
3. If it's useful to me, it's useful to others (and vice versa).

For now the repository is organized by which database the queries run on, the
PUDL DB or our multi-year clone of the FERC Form 1 Database. We distribute
these databases using SQLite, and host them live on our
[Datasette instance](https://data.catalyst.coop) where you ought to be able to
run any query you find in this library.
