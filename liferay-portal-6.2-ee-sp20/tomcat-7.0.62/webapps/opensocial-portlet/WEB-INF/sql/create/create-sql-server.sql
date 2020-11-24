drop database lportal;
create database lportal;

go

use lportal;

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


create index IX_729869EE on OpenSocial_Gadget (companyId);
create unique index IX_A6A89EB1 on OpenSocial_Gadget (companyId, url);
create index IX_E1F8627A on OpenSocial_Gadget (uuid_);
create index IX_3C79316E on OpenSocial_Gadget (uuid_, companyId);

create index IX_47206618 on OpenSocial_OAuthConsumer (gadgetKey);
create index IX_8E715BF8 on OpenSocial_OAuthConsumer (gadgetKey, serviceName);

create index IX_6C8CCC3D on OpenSocial_OAuthToken (gadgetKey, serviceName);
create index IX_CDD35402 on OpenSocial_OAuthToken (userId, gadgetKey, serviceName, moduleId, tokenName);


