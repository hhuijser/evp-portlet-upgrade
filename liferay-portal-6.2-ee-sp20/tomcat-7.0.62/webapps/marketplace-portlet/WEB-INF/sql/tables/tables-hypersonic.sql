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
	description longvarchar null,
	category varchar(75) null,
	iconURL longvarchar null,
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
