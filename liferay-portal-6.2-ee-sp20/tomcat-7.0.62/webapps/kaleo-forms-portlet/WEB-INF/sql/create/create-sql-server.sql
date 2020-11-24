drop database lportal;
create database lportal;

go

use lportal;

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


create index IX_65CA6CC9 on KaleoProcess (DDLRecordSetId);
create index IX_A29A06D5 on KaleoProcess (groupId);

create index IX_3F378B4D on KaleoProcessLink (kaleoProcessId);
create unique index IX_10E0E9D0 on KaleoProcessLink (kaleoProcessId, workflowTaskName);


