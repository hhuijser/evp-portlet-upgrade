create table OpenSocial_Gadget (
	uuid_ varchar(75) null,
	gadgetId bigint not null primary key,
	companyId bigint,
	createDate date null,
	modifiedDate date null,
	name varchar(75) null,
	url long varchar null,
	portletCategoryNames long varchar null
);

create table OpenSocial_OAuthConsumer (
	oAuthConsumerId bigint not null primary key,
	companyId bigint,
	createDate date null,
	modifiedDate date null,
	gadgetKey varchar(75) null,
	serviceName varchar(75) null,
	consumerKey varchar(75) null,
	consumerSecret long varchar null,
	keyType varchar(75) null
);

create table OpenSocial_OAuthToken (
	oAuthTokenId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate date null,
	modifiedDate date null,
	gadgetKey varchar(75) null,
	serviceName varchar(75) null,
	moduleId bigint,
	accessToken varchar(75) null,
	tokenName varchar(75) null,
	tokenSecret varchar(75) null,
	sessionHandle varchar(75) null,
	expiration bigint
);
