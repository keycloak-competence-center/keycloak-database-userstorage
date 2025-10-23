-- Create table
CREATE TABLE userstorage.account (
                                     id VARCHAR2(100) NOT NULL UNIQUE,
                                     username VARCHAR2(100) NOT NULL UNIQUE,
                                     hash_pwd VARCHAR2(100),
                                     email VARCHAR2(255) NOT NULL UNIQUE,
                                     firstName VARCHAR2(100) NOT NULL,
                                     lastName VARCHAR2(100) NOT NULL,
                                     cpf VARCHAR2(14) NOT NULL UNIQUE,
                                     fullName VARCHAR2(300) GENERATED ALWAYS AS (firstName || ' ' || lastName) VIRTUAL,
                                     createdAt TIMESTAMP(0) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                                     updatedAt TIMESTAMP(0) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Insert data
INSERT INTO userstorage.account (id, username, hash_pwd, email, firstName, lastName, cpf)
VALUES
    ('1', 'jsilva', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'joao.silva@example.com', 'João', 'Silva', '123.456.789-01');

INSERT INTO userstorage.account (id, username, hash_pwd, email, firstName, lastName, cpf)
VALUES
    ('2', 'mferreira', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'maria.ferreira@example.com', 'Maria', 'Ferreira', '987.654.321-09');

INSERT INTO userstorage.account (id, username, hash_pwd, email, firstName, lastName, cpf)
VALUES
    ('3', 'psantos', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'pedro.santos@example.com', 'Pedro', 'Santos', '45678912345');

COMMIT;