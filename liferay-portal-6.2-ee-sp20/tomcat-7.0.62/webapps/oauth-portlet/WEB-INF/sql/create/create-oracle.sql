drop user &1 cascade;
create user &1 identified by &2;
grant connect,resource to &1;
connect &1/&2;
set define off;

create table OAuth_OAuthApplication (
	oAuthApplicationId number(30,0) not null primary key,
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(75 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name VARCHAR2(75 CHAR) null,
	description varchar2(4000) null,
	consumerKey VARCHAR2(75 CHAR) null,
	consumerSecret VARCHAR2(75 CHAR) null,
	accessLevel number(30,0),
	logoId number(30,0),
	shareableAccessToken number(1, 0),
	callbackURI varchar2(4000) null,
	websiteURL varchar2(4000) null
);

create table OAuth_OAuthUser (
	oAuthUserId number(30,0) not null primary key,
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(75 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	oAuthApplicationId number(30,0),
	accessToken VARCHAR2(75 CHAR) null,
	accessSecret VARCHAR2(75 CHAR) null
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



quit