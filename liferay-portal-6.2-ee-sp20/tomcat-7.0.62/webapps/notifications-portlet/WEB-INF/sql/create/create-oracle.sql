drop user &1 cascade;
create user &1 identified by &2;
grant connect,resource to &1;
connect &1/&2;
set define off;

create table Ntfctns_UserNotificationEvent (
	notificationEventId number(30,0) not null primary key,
	companyId number(30,0),
	userId number(30,0),
	userNotificationEventId number(30,0),
	timestamp number(30,0),
	delivered number(1, 0),
	actionRequired number(1, 0),
	archived number(1, 0)
);


create index IX_61F3E3E4 on Ntfctns_UserNotificationEvent (userId, actionRequired);
create index IX_911E393A on Ntfctns_UserNotificationEvent (userId, actionRequired, archived);
create index IX_5EC15E51 on Ntfctns_UserNotificationEvent (userId, archived);
create index IX_20DFA99 on Ntfctns_UserNotificationEvent (userId, delivered);
create index IX_609938C2 on Ntfctns_UserNotificationEvent (userId, delivered, actionRequired);
create unique index IX_D448A02E on Ntfctns_UserNotificationEvent (userNotificationEventId);



quit