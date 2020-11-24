create table KaleoProcess (
	kaleoProcessId bigint not null primary key,
	groupId bigint,
	companyId bigint,
	userId bigint,
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	DDLRecordSetId bigint,
	DDMTemplateId bigint,
	workflowDefinitionName varchar(75) null,
	workflowDefinitionVersion integer
) engine InnoDB;

create table KaleoProcessLink (
	kaleoProcessLinkId bigint not null primary key,
	kaleoProcessId bigint,
	workflowTaskName varchar(75) null,
	DDMTemplateId bigint
) engine InnoDB;
