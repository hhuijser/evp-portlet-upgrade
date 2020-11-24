create table OpenSocial_Gadget (
	uuid_ nvarchar(75) null,
	gadgetId bigint not null primary key,
	companyId bigint,
	createDate datetime null,
	modifiedDate datetime null,
	name nvarchar(75) null,
	url nvarchar(2000) null,
	portletCategoryNames nvarchar(2000) null
);

create table OpenSocial_OAuthConsumer (
	oAuthConsumerId bigint not null primary key,
	companyId bigint,
	createDate datetime null,
	modifiedDate datetime null,
	gadgetKey nvarchar(75) null,
	serviceName nvarchar(75) null,
	consumerKey nvarchar(75) null,
	consumerSecret nvarchar(max) null,
	keyType nvarchar(75) null
);

create table OpenSocial_OAuthToken (
	oAuthTokenId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName nvarchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	gadgetKey nvarchar(75) null,
	serviceName nvarchar(75) null,
	moduleId bigint,
	accessToken nvarchar(75) null,
	tokenName nvarchar(75) null,
	tokenSecret nvarchar(75) null,
	sessionHandle nvarchar(75) null,
	expiration bigint
);
