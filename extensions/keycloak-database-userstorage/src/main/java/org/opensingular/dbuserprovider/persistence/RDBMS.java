package org.opensingular.dbuserprovider.persistence;


import org.hibernate.dialect.*;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import static org.opensingular.dbuserprovider.persistence.JdbcDriverClassName.*;

public enum RDBMS {

    POSTGRESQL("PostgreSQL 10+", POSTGRESQL_DRIVER_CLASS_NAME, "SELECT 1", new PostgreSQLDialect()),
    MYSQL("MySQL 5.7+", MYSQL_DRIVER_CLASS_NAME, "SELECT 1", new MySQLDialect()),
    ORACLE("Oracle 12+", ORACLE_DRIVER_CLASS_NAME, "SELECT 1 FROM DUAL", new OracleDialect()),
    SQL_SERVER("MS SQL Server 2012+ (jtds)", SQLSERVER_DRIVER_CLASS_NAME, "SELECT 1", new SQLServerDialect());

    private final String  desc;
    private final String  driver;
    private final String  testString;
    private final Dialect dialect;

    RDBMS(String desc, String driver, String testString, Dialect dialect) {
        this.desc = desc;
        this.driver = driver;
        this.testString = testString;
        this.dialect = dialect;
    }

    public static RDBMS getByDescription(String desc) {
        for (RDBMS value : values()) {
            if (value.desc.equals(desc)) {
                return value;
            }
        }
        return null;
    }

    public Dialect getDialect() {
        return dialect;
    }

    public static List<String> getAllDescriptions() {
        return Arrays.stream(values()).map(RDBMS::getDesc).collect(Collectors.toList());
    }

    public String getDesc() {
        return desc;
    }

    public String getDriver() {
        return driver;
    }

    public String getTestString() {
        return testString;
    }


}
