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

- User count SQL query : must return a number
- List All Users SQL query : must return at least the required managed attributes
- Find user by id SQL query : must return at least the required managed attributes
- Find user by username SQL query : must return at least the required managed attributes
- Find user by email SQL query : must return at least the required managed attributes
- Find user by search term SQL query : must return at least the required managed attributes
- Find password hash (blowfish or hash digest hex) SQL query : must return the hashed password

The managed attributes for a Keycloak user are:

- `id` (required)
- `username` (required)
- `email`
- `firstName`
- `lastName`

The names of the managed attributes are case-sensitive!

Beside the above managed attributes it is also possible to add additional attributes by returning them in the above SQL queries. If the `Unmanaged Attributes` option of the realm is enabled, the additional attributes are also shown in the Admin Console in the `Attributes` tab of the user detail page.

PostgreSQL
---

The [setup.sql](../../container/src/test/resources/postgres/setup.sql) contains an example setup of the database schema to be used as the user storage for Postgres.

For a script based configuration of Keycloak the [keycloak-config-cli] tool can be used. The [realm-postgresql.json](../../config/src/main/resources/keycloak/setup/realm-postgresql.json) file contains such an example configuration for the `Keycloak Database Userstorage` extension.

The [Keycloak Test Application configured for the postgresql realm](https://www.keycloak.org/app?url=http://localhost:8080&realm=postgresql&client=myclient) can be used to test the login.

Oracle
---

The [setup.sql](../../container/src/test/resources/oracle/setup.sql) contains an example setup of the database schema to be used as the user storage for Oracle.

For a script based configuration of Keycloak the [keycloak-config-cli] tool can be used. The [realm-oracle.json](../../config/src/main/resources/keycloak/setup/unused/realm-oracle.json) file contains such an example configuration for the `Keycloak Database Userstorage` extension.


The [Keycloak Test Application configured for the oracle realm](https://www.keycloak.org/app?url=http://localhost:8080&realm=oracle&client=myclient) can be used to test the login.


[build-pipeline]: https://github.com/keycloak-competence-center/keycloak-database-userstorage/actions/workflows/build-pipeline.yml
[release-pipeline]: https://github.com/keycloak-competence-center/keycloak-database-userstorage/actions/workflows/release-pipeline.yml
[artifacts-staged]: https://artifacts.inventage.com/#browse/browse:kcc-maven-staging:com%2Finventage%2Fkeycloak-database-userstorage%2Fkeycloak-database-userstorage
[artifacts-released]: https://artifacts.inventage.com/#browse/browse:kcc-maven:com%2Finventage%2Fkeycloak-database-userstorage%2Fkeycloak-database-userstorage
[xsuchy09]: https://github.com/xsuchy09/singular-keycloak-database-federation
[t7tran]: https://github.com/t7tran/singular-keycloak-database-federation
[singular-keycloak-database-federation]: https://github.com/opensingular/singular-keycloak-database-federation
[Keycloak User Storage SPI]: https://www.keycloak.org/docs/latest/server_development/index.html#_user-storage-spi
[keycloak-config-cli]: 