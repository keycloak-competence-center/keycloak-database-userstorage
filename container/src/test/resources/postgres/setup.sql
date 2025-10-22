--

DROP SCHEMA IF EXISTS "userstorage" CASCADE;
CREATE SCHEMA "userstorage"

CREATE TABLE account (
   "id" VARCHAR(100) NOT NULL UNIQUE,
   "username" VARCHAR(100) NOT NULL UNIQUE,
   "hash_pwd" VARCHAR(100),
   "email" VARCHAR(255) NOT NULL UNIQUE,
   "firstName" VARCHAR(100) NOT NULL,
   "lastName" VARCHAR(100) NOT NULL,
   "cpf" VARCHAR(14) NOT NULL UNIQUE,
   "fullName" VARCHAR(200) GENERATED ALWAYS AS ("firstName" || ' ' || "lastName") STORED,
   "createdAt" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
   "updatedAt" TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO userstorage.account ("id", "username", "hash_pwd", "email", "firstName", "lastName", "cpf")
VALUES
    ('1', 'jsilva', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'joao.silva@example.com', 'João', 'Silva', '123.456.789-01'),
    ('2', 'mferreira', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'maria.ferreira@example.com', 'Maria', 'Ferreira', '987.654.321-09'),
    ('3', 'psantos', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'pedro.santos@example.com', 'Pedro', 'Santos', '45678912345')
;
