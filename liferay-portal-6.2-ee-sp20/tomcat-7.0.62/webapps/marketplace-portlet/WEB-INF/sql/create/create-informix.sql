database sysmaster;
drop database lportal;
create database lportal WITH LOG;

create procedure 'lportal'.isnull(test_string varchar)
returning boolean;
IF test_string IS NULL THEN
	RETURN 't';
ELSE
	RETURN 'f';
END IF
end procedure;


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


