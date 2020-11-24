create table KaleoProcess (
	kaleoProcessId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate timestamp null,
	modifiedDate timestamp null,
	DDLRecordSetId bigint,
	DDMTemplateId bigint,
	workflowDefinitionName varchar(75) null,
	workflowDefinitionVersion int
);

create table KaleoProcessLink (
	kaleoProcessLinkId bigint not null primary key,
	kaleoProcessId bigint,
	workflowTaskName varchar(75) null,
	DDMTemplateId bigint
);
