create database 'lportal.gdb' page_size 8192 user 'sysdba' password 'masterkey';
connect 'lportal.gdb' user 'sysdba' password 'masterkey';
create table OpenSocial_Gadget (uuid_ varchar(75),gadgetId int64 not null primary key,companyId int64,createDate timestamp,modifiedDate timestamp,name varchar(75),url varchar(4000),portletCategoryNames varchar(4000));
create table OpenSocial_OAuthConsumer (oAuthConsumerId int64 not null primary key,companyId int64,createDate timestamp,modifiedDate timestamp,gadgetKey varchar(75),serviceName varchar(75),consumerKey varchar(75),consumerSecret blob,keyType varchar(75));
create table OpenSocial_OAuthToken (oAuthTokenId int64 not null primary key,companyId int64,userId int64,userName varchar(75),createDate timestamp,modifiedDate timestamp,gadgetKey varchar(75),serviceName varchar(75),moduleId int64,accessToken varchar(75),tokenName varchar(75),tokenSecret varchar(75),sessionHandle varchar(75),expiration int64);
