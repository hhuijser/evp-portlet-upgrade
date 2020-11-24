drop database lportal;
create database lportal pagesize 8192;
connect to lportal;
create table OpenSocial_Gadget (
	uuid_ varchar(75),
	gadgetId bigint not null primary key,
	companyId bigint,
	createDate timestamp,
	modifiedDate timestamp,
	name varchar(75),
	url varchar(750),
	portletCategoryNames varchar(750)
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


create index IX_729869EE on OpenSocial_Gadget (companyId);
create unique index IX_A6A89EB1 on OpenSocial_Gadget (companyId, url);
create index IX_E1F8627A on OpenSocial_Gadget (uuid_);
create index IX_3C79316E on OpenSocial_Gadget (uuid_, companyId);

create index IX_47206618 on OpenSocial_OAuthConsumer (gadgetKey);
create index IX_8E715BF8 on OpenSocial_OAuthConsumer (gadgetKey, serviceName);

create index IX_6C8CCC3D on OpenSocial_OAuthToken (gadgetKey, serviceName);
create index IX_CDD35402 on OpenSocial_OAuthToken (userId, gadgetKey, serviceName, moduleId, tokenName);


