create table OAuth_OAuthApplication (
	oAuthApplicationId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName nvarchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	name nvarchar(75) null,
	description nvarchar(2000) null,
	consumerKey nvarchar(75) null,
	consumerSecret nvarchar(75) null,
	accessLevel int,
	logoId bigint,
	shareableAccessToken bit,
	callbackURI nvarchar(2000) null,
	websiteURL nvarchar(2000) null
);

create table OAuth_OAuthUser (
	oAuthUserId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName nvarchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	oAuthApplicationId bigint,
	accessToken nvarchar(75) null,
	accessSecret nvarchar(75) null
);
