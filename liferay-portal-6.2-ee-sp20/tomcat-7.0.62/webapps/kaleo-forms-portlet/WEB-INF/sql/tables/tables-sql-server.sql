create table KaleoProcess (
	kaleoProcessId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName nvarchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	DDLRecordSetId bigint,
	DDMTemplateId bigint,
	workflowDefinitionName nvarchar(75) null,
	workflowDefinitionVersion int
);

create table KaleoProcessLink (
	kaleoProcessLinkId bigint not null primary key,
	kaleoProcessId bigint,
	workflowTaskName nvarchar(75) null,
	DDMTemplateId bigint
);
