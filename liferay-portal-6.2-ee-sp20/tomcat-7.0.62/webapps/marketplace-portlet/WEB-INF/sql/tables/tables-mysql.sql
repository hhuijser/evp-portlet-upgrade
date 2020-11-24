create table Marketplace_App (
	uuid_ varchar(75) null,
	appId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	remoteAppId bigint,
	title varchar(75) null,
	description longtext null,
	category varchar(75) null,
	iconURL longtext null,
	version varchar(75) null
) engine InnoDB;

create table Marketplace_Module (
	uuid_ varchar(75) null,
	moduleId bigint not null primary key,
	appId bigint,
	bundleSymbolicName varchar(500) null,
	bundleVersion varchar(75) null,
	contextName varchar(75) null
) engine InnoDB;
