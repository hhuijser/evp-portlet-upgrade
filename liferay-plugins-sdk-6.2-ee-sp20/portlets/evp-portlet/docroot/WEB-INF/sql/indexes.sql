create index IX_FD82FC7F on EVPDivision (companyId, type_);

create unique index IX_7F4A2B1B on EVPEmployee (employeeUserId);

create index IX_BBF5CB96 on EVPGrantRequest (companyId, status);

create index IX_F4BED85F on EVPRequestOrganization (companyId);

create index IX_D78D656F on EVPServiceRequest (companyId, status);