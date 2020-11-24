create table Marketplace_App (
	uuid_ varchar(75) null,
	appId decimal(20,0) not null primary key,
	companyId decimal(20,0),
	userId decimal(20,0),
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	remoteAppId decimal(20,0),
	title varchar(75) null,
	description varchar(1000) null,
	category varchar(75) null,
	iconURL varchar(1000) null,
	version varchar(75) null
)
go

create table Marketplace_Module (
	uuid_ varchar(75) null,
	moduleId decimal(20,0) not null primary key,
	appId decimal(20,0),
	bundleSymbolicName varchar(500) null,
	bundleVersion varchar(75) null,
	contextName varchar(75) null
)
go
