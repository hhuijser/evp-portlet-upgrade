create table KaleoProcess (
	kaleoProcessId number(30,0) not null primary key,
	groupId number(30,0),
	companyId number(30,0),
	userId number(30,0),
	userName VARCHAR2(75 CHAR) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	DDLRecordSetId number(30,0),
	DDMTemplateId number(30,0),
	workflowDefinitionName VARCHAR2(75 CHAR) null,
	workflowDefinitionVersion number(30,0)
);

create table KaleoProcessLink (
	kaleoProcessLinkId number(30,0) not null primary key,
	kaleoProcessId number(30,0),
	workflowTaskName VARCHAR2(75 CHAR) null,
	DDMTemplateId number(30,0)
);
