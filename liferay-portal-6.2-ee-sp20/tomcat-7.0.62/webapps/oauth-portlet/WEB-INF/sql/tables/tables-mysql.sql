create table OAuth_OAuthApplication (
	oAuthApplicationId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	name varchar(75) null,
	description longtext null,
	consumerKey varchar(75) null,
	consumerSecret varchar(75) null,
	accessLevel integer,
	logoId bigint,
	shareableAccessToken tinyint,
	callbackURI longtext null,
	websiteURL longtext null
) engine InnoDB;

create table OAuth_OAuthUser (
	oAuthUserId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	oAuthApplicationId bigint,
	accessToken varchar(75) null,
	accessSecret varchar(75) null
) engine InnoDB;
