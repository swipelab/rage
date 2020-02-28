create table "user"
(
    id text not null,
    alias text not null,
    avatar text,
    email text not null,
    is_public bool default false not null
);