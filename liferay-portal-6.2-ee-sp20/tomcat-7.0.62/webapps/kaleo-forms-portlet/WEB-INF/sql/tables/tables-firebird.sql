create table KaleoProcess (
	kaleoProcessId int64 not null primary key,
	groupId int64,
	companyId int64,
	userId int64,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	DDLRecordSetId int64,
	DDMTemplateId int64,
	workflowDefinitionName varchar(75),
	workflowDefinitionVersion integer
);

create table KaleoProcessLink (
	kaleoProcessLinkId int64 not null primary key,
	kaleoProcessId int64,
	workflowTaskName varchar(75),
	DDMTemplateId int64
);
