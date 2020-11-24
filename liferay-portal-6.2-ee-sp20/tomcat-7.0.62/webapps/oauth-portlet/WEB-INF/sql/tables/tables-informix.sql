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
