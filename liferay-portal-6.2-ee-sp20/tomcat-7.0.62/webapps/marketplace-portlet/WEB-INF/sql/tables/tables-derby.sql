create table Marketplace_App (
	uuid_ varchar(75),
	appId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	remoteAppId bigint,
	title varchar(75),
	description varchar(4000),
	category varchar(75),
	iconURL varchar(4000),
	version varchar(75)
);

create table Marketplace_Module (
	uuid_ varchar(75),
	moduleId bigint not null primary key,
	appId bigint,
	bundleSymbolicName varchar(500),
	bundleVersion varchar(75),
	contextName varchar(75)
);
