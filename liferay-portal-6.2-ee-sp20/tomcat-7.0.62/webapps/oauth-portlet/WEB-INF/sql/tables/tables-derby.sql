create table OAuth_OAuthApplication (
	oAuthApplicationId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	name varchar(75),
	description varchar(4000),
	consumerKey varchar(75),
	consumerSecret varchar(75),
	accessLevel integer,
	logoId bigint,
	shareableAccessToken smallint,
	callbackURI varchar(4000),
	websiteURL varchar(4000)
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
