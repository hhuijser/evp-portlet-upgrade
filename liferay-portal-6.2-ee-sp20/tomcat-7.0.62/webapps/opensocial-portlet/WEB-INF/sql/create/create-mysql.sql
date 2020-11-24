drop database if exists lportal;
create database lportal character set utf8;
use lportal;

create table OpenSocial_Gadget (
	uuid_ varchar(75) null,
	gadgetId bigint not null primary key,
	companyId bigint,
	createDate datetime null,
	modifiedDate datetime null,
	name varchar(75) null,
	url longtext null,
	portletCategoryNames longtext null
) engine InnoDB;

create table OpenSocial_OAuthConsumer (
	oAuthConsumerId bigint not null primary key,
	companyId bigint,
	createDate datetime null,
	modifiedDate datetime null,
	gadgetKey varchar(75) null,
	serviceName varchar(75) null,
	consumerKey varchar(75) null,
	consumerSecret longtext null,
	keyType varchar(75) null
) engine InnoDB;

create table OpenSocial_OAuthToken (
	oAuthTokenId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	gadgetKey varchar(75) null,
	serviceName varchar(75) null,
	moduleId bigint,
	accessToken varchar(75) null,
	tokenName varchar(75) null,
	tokenSecret varchar(75) null,
	sessionHandle varchar(75) null,
	expiration bigint
) engine InnoDB;


create index IX_729869EE on OpenSocial_Gadget (companyId);
create unique index IX_A6A89EB1 on OpenSocial_Gadget (companyId, url);
create index IX_E1F8627A on OpenSocial_Gadget (uuid_);
create index IX_3C79316E on OpenSocial_Gadget (uuid_, companyId);

create index IX_47206618 on OpenSocial_OAuthConsumer (gadgetKey);
create index IX_8E715BF8 on OpenSocial_OAuthConsumer (gadgetKey, serviceName);

create index IX_6C8CCC3D on OpenSocial_OAuthToken (gadgetKey, serviceName);
create index IX_CDD35402 on OpenSocial_OAuthToken (userId, gadgetKey, serviceName, moduleId, tokenName);


