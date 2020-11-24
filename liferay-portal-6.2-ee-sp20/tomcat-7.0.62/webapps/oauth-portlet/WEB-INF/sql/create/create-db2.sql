drop database lportal;
create database lportal pagesize 8192;
connect to lportal;
create table OAuth_OAuthApplication (
	oAuthApplicationId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	name varchar(75),
	description varchar(750),
	consumerKey varchar(75),
	consumerSecret varchar(75),
	accessLevel integer,
	logoId bigint,
	shareableAccessToken smallint,
	callbackURI varchar(750),
	websiteURL varchar(750)
);

create table OAuth_OAuthUser (
	oAuthUserId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	oAuthApplicationId bigint,
	accessToken varchar(75),
	accessSecret varchar(75)
);


create index IX_78A82761 on OAuth_OAuthApplication (companyId);
create index IX_DD85AA60 on OAuth_OAuthApplication (companyId, name);
create unique index IX_B12A5172 on OAuth_OAuthApplication (consumerKey);
create index IX_FA67A7A1 on OAuth_OAuthApplication (userId);
create index IX_2B33FAA0 on OAuth_OAuthApplication (userId, name);

create unique index IX_84260D45 on OAuth_OAuthUser (accessToken);
create index IX_4167B528 on OAuth_OAuthUser (oAuthApplicationId);
create index IX_CBA598DA on OAuth_OAuthUser (userId);
create unique index IX_7B260C62 on OAuth_OAuthUser (userId, oAuthApplicationId);


