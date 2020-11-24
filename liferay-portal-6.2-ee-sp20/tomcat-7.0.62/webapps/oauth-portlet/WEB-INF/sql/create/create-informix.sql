database sysmaster;
drop database lportal;
create database lportal WITH LOG;

create procedure 'lportal'.isnull(test_string varchar)
returning boolean;
IF test_string IS NULL THEN
	RETURN 't';
ELSE
	RETURN 'f';
END IF
end procedure;


create table OAuth_OAuthApplication (
	oAuthApplicationId int8 not null primary key,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	name varchar(75),
	description lvarchar,
	consumerKey varchar(75),
	consumerSecret varchar(75),
	accessLevel int,
	logoId int8,
	shareableAccessToken boolean,
	callbackURI lvarchar,
	websiteURL lvarchar
)
extent size 16 next size 16
lock mode row;

create table OAuth_OAuthUser (
	oAuthUserId int8 not null primary key,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	oAuthApplicationId int8,
	accessToken varchar(75),
	accessSecret varchar(75)
)
extent size 16 next size 16
lock mode row;


create index IX_78A82761 on OAuth_OAuthApplication (companyId);
create index IX_DD85AA60 on OAuth_OAuthApplication (companyId, name);
create unique index IX_B12A5172 on OAuth_OAuthApplication (consumerKey);
create index IX_FA67A7A1 on OAuth_OAuthApplication (userId);
create index IX_2B33FAA0 on OAuth_OAuthApplication (userId, name);

create unique index IX_84260D45 on OAuth_OAuthUser (accessToken);
create index IX_4167B528 on OAuth_OAuthUser (oAuthApplicationId);
create index IX_CBA598DA on OAuth_OAuthUser (userId);
create unique index IX_7B260C62 on OAuth_OAuthUser (userId, oAuthApplicationId);


