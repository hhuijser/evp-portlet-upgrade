create table KaleoProcess (
	kaleoProcessId decimal(20,0) not null primary key,
	groupId decimal(20,0),
	companyId decimal(20,0),
	userId decimal(20,0),
	userName varchar(75) null,
	createDate datetime null,
	modifiedDate datetime null,
	DDLRecordSetId decimal(20,0),
	DDMTemplateId decimal(20,0),
	workflowDefinitionName varchar(75) null,
	workflowDefinitionVersion int
)
go

create table KaleoProcessLink (
	kaleoProcessLinkId decimal(20,0) not null primary key,
	kaleoProcessId decimal(20,0),
	workflowTaskName varchar(75) null,
	DDMTemplateId decimal(20,0)
)
go
