create table "user"
(
    user_id   text                  not null,
    alias     text                  not null,
    avatar    text,
    is_public boolean default false not null
);

create table "identifier"
(
    user_id  text                  not null,
    medium   text                  not null,
    address  text                  not null,
    is_valid boolean default false not null
);

create table "credential"
(
    user_id text not null,
    hash    text not null
);

create table "room"
(
    room_id         text                  not null,
    alias           text                  not null,
    is_public       boolean default false not null,
    fx_member_count integer default 0     not null
);

create table "room_member"
(
    room_id text not null,
    user_id text not null
)