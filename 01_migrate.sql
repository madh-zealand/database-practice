CREATE TABLE "users"
(
    "id" integer PRIMARY KEY AUTOINCREMENT,
    "firstname" text NOT NULL,
    "lastname" text NOT NULL,
    "age" integer,
    "email" text UNIQUE NOT NULL
);

CREATE TABLE "books"
(
    "id" integer PRIMARY KEY AUTOINCREMENT,
    "title" text NOT NULL,
    "author" text NOT NULL,
    "year" integer,
    "pages" integer
);

CREATE TABLE "loans"
(
    "id" integer PRIMARY KEY AUTOINCREMENT,
    "user_id" integer NOT NULL,
    "book_id" integer NOT NULL,
    "created_at" DATETIME NOT NULL, -- 'YYYY-MM-DD HH:MM:SS' (lånet oprettes)
    "due_at" DATETIME NOT NULL,     -- 'YYYY-MM-DD HH:MM:SS' (forventet aflevering)
    "returned_at" DATETIME          -- 'YYYY-MM-DD HH:MM:SS' eller NULL (stadig udlånt)
);
