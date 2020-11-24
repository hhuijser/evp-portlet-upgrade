drop database lportal;
create database lportal encoding = 'UNICODE';
\c lportal;

create table Marketplace_App (
	uuid_ varchar(75) null,
	appId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	remoteAppId bigint,
	title varchar(75) null,
	description text null,
	category varchar(75) null,
	iconURL text null,
	version varchar(75) null
);

create table Marketplace_Module (
	uuid_ varchar(75) null,
	moduleId bigint not null primary key,
	appId bigint,
	bundleSymbolicName varchar(500) null,
	bundleVersion varchar(75) null,
	contextName varchar(75) null
);


create index IX_94A7EF25 on Marketplace_App (category);
create index IX_865B7BD5 on Marketplace_App (companyId);
create index IX_20F14D93 on Marketplace_App (remoteAppId);
create index IX_3E667FE1 on Marketplace_App (uuid_);
create index IX_A7807DA7 on Marketplace_App (uuid_, companyId);

create index IX_7DC16D26 on Marketplace_Module (appId);
create index IX_5848F52D on Marketplace_Module (appId, bundleSymbolicName, bundleVersion);
create index IX_C6938724 on Marketplace_Module (appId, contextName);
create index IX_DD03D499 on Marketplace_Module (bundleSymbolicName);
create index IX_F2F1E964 on Marketplace_Module (contextName);
create index IX_A7EFD80E on Marketplace_Module (uuid_);


