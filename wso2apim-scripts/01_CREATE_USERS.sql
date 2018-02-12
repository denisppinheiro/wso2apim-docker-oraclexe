
-- 01 - CREATE USERS
-- 
-- @author: Denis Pinheiro
-- @date: 20 Jan 2018
-- @email: denisppinheiro@gmail.com
--
-- Script which creates the users and schemas for each required database on WSO2 API Management and Analytics

create tablespace wso2apim_ts datafile 'wso2apim_ts.dat' size 10M autoextend on;
create temporary tablespace wso2apim_tmp_ts tempfile 'wso2apim_tmp_ts.dat' size 5M autoextend on;

-- WSO2_CARBON_DB -- wso2carbon
create user wso2carbon identified by wso2carbon account unlock default tablespace wso2apim_ts temporary tablespace wso2apim_tmp_ts;
grant create session, create table, create sequence, create trigger to wso2carbon;
grant unlimited tablespace to wso2carbon;
grant connect, resource to wso2carbon with admin option;

-- WSO2_APIM_DB -- wso2apim
create user wso2apim identified by wso2apim account unlock default tablespace wso2apim_ts temporary tablespace wso2apim_tmp_ts;
grant create session, create table, create sequence, create trigger to wso2apim;
grant unlimited tablespace to wso2apim;
grant connect, resource to wso2apim with admin option;

-- WSO2_MB_STORE_DB -- Message Brocker -- wso2mbstore
create user wso2mbstore identified by wso2mbstore account unlock default tablespace wso2apim_ts temporary tablespace wso2apim_tmp_ts;
grant create session, create table, create sequence, create trigger to wso2mbstore;
grant unlimited tablespace to wso2mbstore;
grant connect, resource to wso2mbstore with admin option;-- GRANT CONNECT,RESOURCE to apimuser WITH ADMIN OPTION; 

-- WSO2_METRICS_DB -- wso2metrics
create user wso2metrics identified by wso2metrics account unlock default tablespace wso2apim_ts temporary tablespace wso2apim_tmp_ts;
grant create session, create table, create sequence, create trigger to wso2metrics;
grant unlimited tablespace to wso2metrics;
grant connect, resource to wso2metrics with admin option;

-- WSO2_AM_STATS_DB -- wso2amstats
create user wso2amstats identified by wso2amstats account unlock default tablespace wso2apim_ts temporary tablespace wso2apim_tmp_ts;
grant create session, create table, create sequence, create trigger to wso2amstats;
grant unlimited tablespace to wso2amstats;
grant connect, resource to wso2amstats with admin option;

-- WSO2_ANALYTICS_EVENT_STORE_DB -- wso2events
create user wso2events identified by wso2events account unlock default tablespace wso2apim_ts temporary tablespace wso2apim_tmp_ts;
grant create session, create table, create sequence, create trigger to wso2events;
grant unlimited tablespace to wso2events;
grant connect, resource to wso2events with admin option;

-- WSO2_ANALYTICS_PROCESSED_DATA_STORE_DB -- wso2procdata
create user wso2procdata identified by wso2procdata account unlock default tablespace wso2apim_ts temporary tablespace wso2apim_tmp_ts;
grant create session, create table, create sequence, create trigger to wso2procdata;
grant unlimited tablespace to wso2procdata;
grant connect, resource to wso2procdata with admin option;

-- WSO2_UM_DB -- User Management -- wso2userm
create user wso2userm identified by wso2userm account unlock default tablespace wso2apim_ts temporary tablespace wso2apim_tmp_ts;
grant create session, create table, create sequence, create trigger to wso2userm;
grant unlimited tablespace to wso2userm;
grant connect, resource to wso2userm with admin option;

-- WSO2_REG_DB  -- wso2registry
create user wso2registry identified by wso2registry account unlock default tablespace wso2apim_ts temporary tablespace wso2apim_tmp_ts;
grant create session, create table, create sequence, create trigger to wso2registry;
grant unlimited tablespace to wso2registry;
grant connect, resource to wso2registry with admin option;

-- GEO_LOCATION_DATA -- wso2geolocation
create user wso2geolocation identified by wso2geolocation account unlock default tablespace wso2apim_ts temporary tablespace wso2apim_tmp_ts;
grant create session, create table, create sequence, create trigger to wso2geolocation;
grant unlimited tablespace to wso2geolocation;
grant connect, resource to wso2geolocation with admin option;

exit;