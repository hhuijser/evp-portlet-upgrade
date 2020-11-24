create database 'lportal.gdb' page_size 8192 user 'sysdba' password 'masterkey';
connect 'lportal.gdb' user 'sysdba' password 'masterkey';
create table OAuth_OAuthApplication (oAuthApplicationId int64 not null primary key,companyId int64,userId int64,userName varchar(75),createDate timestamp,modifiedDate timestamp,name varchar(75),description varchar(4000),consumerKey varchar(75),consumerSecret varchar(75),accessLevel integer,logoId int64,shareableAccessToken smallint,callbackURI varchar(4000),websiteURL varchar(4000));
create table OAuth_OAuthUser (oAuthUserId int64 not null primary key,companyId int64,userId int64,userName varchar(75),createDate timestamp,modifiedDate timestamp,oAuthApplicationId int64,accessToken varchar(75),accessSecret varchar(75));
