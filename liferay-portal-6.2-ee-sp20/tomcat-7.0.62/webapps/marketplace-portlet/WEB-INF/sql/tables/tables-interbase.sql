create table Marketplace_App (
	uuid_ varchar(75),
	appId int64 not null primary key,
	companyId int64,
	userId int64,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	remoteAppId int64,
	title varchar(75),
	description varchar(4000),
	category varchar(75),
	iconURL varchar(4000),
	version varchar(75)
);

create table Marketplace_Module (
	uuid_ varchar(75),
	moduleId int64 not null primary key,
	appId int64,
	bundleSymbolicName varchar(500),
	bundleVersion varchar(75),
	contextName varchar(75)
);
