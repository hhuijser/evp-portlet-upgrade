create table KaleoProcess (
	kaleoProcessId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75),
	createDate timestamp,
	modifiedDate timestamp,
	DDLRecordSetId bigint,
	DDMTemplateId bigint,
	workflowDefinitionName varchar(75),
	workflowDefinitionVersion integer
);

create table KaleoProcessLink (
	kaleoProcessLinkId bigint not null primary key,
	kaleoProcessId bigint,
	workflowTaskName varchar(75),
	DDMTemplateId bigint
);
