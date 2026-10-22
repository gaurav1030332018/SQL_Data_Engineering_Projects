Create database if not exists jobs_mart;
drop database if exists jobs_mart;
create database jobs_mart;
show databases;

Create schema if not exists jobs_mart;

select * from information_schema.schemata;

 
use jobs_mart;

 Create table staging.preferred_roles(
     role_id Integer primary key,
     ROle_name VarCHAR
 );
drop table staging.preferred_roles;
 select * from information_schema.tables where table_catalog='jobs_mart';

 insert into staging.preferred_roles values(1,'Data Engineer'),(2,'Data Analyst'),(3,'Data Scientist');

 select * from staging.priority_roles;

 Alter table staging.preferred_roles add preffered_role Boolean;

 Drop column preffered_role from staging.preferred_role;

 update staging.preferred_roles set preffered_role=True where role_id=1 or role_id=2;

 alter table staging.preferred_roles rename to priority_roles;

 alter table staging.priority_roles rename column preffered_role to priority_role;

alter table staging.priority_roles alter column priority_role type Integer;
----------------------------------------------------------------