
drop table test1;

create table test1 ( year number,   created_date timestamp default systimestamp,
constraint year_ck CHECK ( year <= extract( year from created_date))
);
insert into test1  ( year) values ( 2019);
insert into test1  ( year) values ( 2020);


create table test2 ( ticket_booking_date date,  created_date timestamp default systimestamp,
constraint date_ck CHECK ( ticket_booking_date <= created_date)
);
insert into test2  ( ticket_booking_date ) values (sysdate -1); -- works
insert into test2  ( ticket_booking_date ) values (sysdate); -- works
insert into test2  ( ticket_booking_date ) values (sysdate +1); -- constraint error.

