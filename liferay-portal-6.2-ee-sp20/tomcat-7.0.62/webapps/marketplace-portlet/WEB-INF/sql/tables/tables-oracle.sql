create table Marketplace_App (
	uuid_ VARCHAR2(75 CHAR) null,
	appId number(30,0) not null primary key,
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(75 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	remoteAppId number(30,0),
	title VARCHAR2(75 CHAR) null,
	description varchar2(4000 char) null,
	category VARCHAR2(75 CHAR) null,
	iconURL varchar2(4000 char) null,
	version VARCHAR2(75 CHAR) null
);

create table Marketplace_Module (
	uuid_ VARCHAR2(75 CHAR) null,
	moduleId number(30,0) not null primary key,
	appId number(30,0),
	bundleSymbolicName VARCHAR2(500 CHAR) null,
	bundleVersion VARCHAR2(75 CHAR) null,
	contextName VARCHAR2(75 CHAR) null
);
