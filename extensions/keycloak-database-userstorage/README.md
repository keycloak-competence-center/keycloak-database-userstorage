Keycloak Database Userstorage
===

The `Keycloak Database Userstorage` extension makes it possible to use an existing database as the source of users. It provides an implementation of the [Keycloak User Storage SPI]. The code is mostly copied from [xsuchy09], which is a fork of a fork of [singular-keycloak-database-federation]. The following changes have been made:

- not all supported JDBC drivers are required during runtime, only the ones which are actually configured
- paging support for queries is fixed for Oracle

The following databases are supported:

- PostgreSQL
- Oracle
- MySQL
- Microsoft SQL Server

Features not yet implemented:

- add a new user
- remove a user
- update a user

Configuration
---

The configuration requires also 7 SQL queries to be specified for the following use cases:

- User count SQL query
- List All Users SQL query
- Find user by id SQL query
- Find user by username SQL query
- Find user by email SQL query
- Find user by search term SQL query
- Find password hash (blowfish or hash digest hex) SQL query



- `id`
- `username`
- `email`
- `firstName`
- `lastName`

If the `Unmanaged Attributes` option of the realm is enabled, the non-standard attributes are also shown in the Admin Console in the `Attributes` tab of the user detail page.

PostgreSQL
---

Example [setup.sql](../../container/src/test/resources/postgres/setup.sql) for a database setup to be used as the user storage with Postgres.

Oracle
---

Example [setup.sql](../../container/src/test/resources/oracle/setup.sql) for a database setup to be used as the user storage with Oracle.


[build-pipeline]: https://github.com/keycloak-competence-center/keycloak-database-userstorage/actions/workflows/build-pipeline.yml
[release-pipeline]: https://github.com/keycloak-competence-center/keycloak-database-userstorage/actions/workflows/release-pipeline.yml
[artifacts-staged]: https://artifacts.inventage.com/#browse/browse:kcc-maven-staging:com%2Finventage%2Fkeycloak-database-userstorage%2Fkeycloak-database-userstorage
[artifacts-released]: https://artifacts.inventage.com/#browse/browse:kcc-maven:com%2Finventage%2Fkeycloak-database-userstorage%2Fkeycloak-database-userstorage
[xsuchy09]: https://github.com/xsuchy09/singular-keycloak-database-federation
[t7tran]: https://github.com/t7tran/singular-keycloak-database-federation
[singular-keycloak-database-federation]: https://github.com/opensingular/singular-keycloak-database-federation
[Keycloak User Storage SPI]: https://www.keycloak.org/docs/latest/server_development/index.html#_user-storage-spi