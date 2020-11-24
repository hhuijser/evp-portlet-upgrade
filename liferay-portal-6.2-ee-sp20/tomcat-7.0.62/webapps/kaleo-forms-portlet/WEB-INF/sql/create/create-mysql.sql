drop database if exists lportal;
create database lportal character set utf8;
use lportal;

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


create index IX_65CA6CC9 on KaleoProcess (DDLRecordSetId);
create index IX_A29A06D5 on KaleoProcess (groupId);

create index IX_3F378B4D on KaleoProcessLink (kaleoProcessId);
create unique index IX_10E0E9D0 on KaleoProcessLink (kaleoProcessId, workflowTaskName);


