create table OAuth_OAuthApplication (
	oAuthApplicationId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	name varchar(75) null,
	description text null,
	consumerKey varchar(75) null,
	consumerSecret varchar(75) null,
	accessLevel integer,
	logoId bigint,
	shareableAccessToken bool,
	callbackURI text null,
	websiteURL text null
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
