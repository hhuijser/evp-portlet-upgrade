create table OpenSocial_Gadget (
	uuid_ varchar(75),
	gadgetId bigint not null primary key,
	companyId bigint,
	createDate timestamp,
	modifiedDate timestamp,
	name varchar(75),
	url varchar(4000),
	portletCategoryNames varchar(4000)
);

create table OpenSocial_OAuthConsumer (
	oAuthConsumerId bigint not null primary key,
	companyId bigint,
	createDate timestamp,
	modifiedDate timestamp,
	gadgetKey varchar(75),
	serviceName varchar(75),
	consumerKey varchar(75),
	consumerSecret clob,
	keyType varchar(75)
);

create table OpenSocial_OAuthToken (
	oAuthTokenId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	gadgetKey varchar(75),
	serviceName varchar(75),
	moduleId bigint,
	accessToken varchar(75),
	tokenName varchar(75),
	tokenSecret varchar(75),
	sessionHandle varchar(75),
	expiration bigint
);
