create table OAuth_OAuthApplication (
	oAuthApplicationId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate date null,
	modifiedDate date null,
	name varchar(75) null,
	description long varchar null,
	consumerKey varchar(75) null,
	consumerSecret varchar(75) null,
	accessLevel integer,
	logoId bigint,
	shareableAccessToken boolean,
	callbackURI long varchar null,
	websiteURL long varchar null
);

create table OAuth_OAuthUser (
	oAuthUserId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate date null,
	modifiedDate date null,
	oAuthApplicationId bigint,
	accessToken varchar(75) null,
	accessSecret varchar(75) null
);
