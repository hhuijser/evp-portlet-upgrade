create table Marketplace_App (
	uuid_ varchar(75),
	appId int8 not null primary key,
	companyId int8,
	userId int8,
	userName varchar(75),
	createDate datetime YEAR TO FRACTION,
	modifiedDate datetime YEAR TO FRACTION,
	remoteAppId int8,
	title varchar(75),
	description lvarchar,
	category varchar(75),
	iconURL lvarchar,
	version varchar(75)
)
extent size 16 next size 16
lock mode row;

create table Marketplace_Module (
	uuid_ varchar(75),
	moduleId int8 not null primary key,
	appId int8,
	bundleSymbolicName lvarchar(500),
	bundleVersion varchar(75),
	contextName varchar(75)
)
extent size 16 next size 16
lock mode row;
