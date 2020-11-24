create table OAuth_OAuthApplication (
	oAuthApplicationId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name varchar(75) null,
	description varchar null,
	consumerKey varchar(75) null,
	consumerSecret varchar(75) null,
	accessLevel int,
	logoId bigint,
	shareableAccessToken boolean,
	callbackURI varchar null,
	websiteURL varchar null
);

create table OAuth_OAuthUser (
	oAuthUserId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	oAuthApplicationId bigint,
	accessToken varchar(75) null,
	accessSecret varchar(75) null
);
