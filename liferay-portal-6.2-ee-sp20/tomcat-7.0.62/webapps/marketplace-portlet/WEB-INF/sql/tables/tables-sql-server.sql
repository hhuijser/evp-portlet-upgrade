create table Marketplace_App (
	uuid_ nvarchar(75) null,
	appId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userName nvarchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	remoteAppId bigint,
	title nvarchar(75) null,
	description nvarchar(2000) null,
	category nvarchar(75) null,
	iconURL nvarchar(2000) null,
	version nvarchar(75) null
);

create table Marketplace_Module (
	uuid_ nvarchar(75) null,
	moduleId bigint not null primary key,
	appId bigint,
	bundleSymbolicName nvarchar(500) null,
	bundleVersion nvarchar(75) null,
	contextName nvarchar(75) null
);
