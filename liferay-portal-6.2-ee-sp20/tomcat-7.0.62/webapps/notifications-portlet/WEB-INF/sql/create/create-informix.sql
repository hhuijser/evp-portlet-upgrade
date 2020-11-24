database sysmaster;
drop database lportal;
create database lportal WITH LOG;

create procedure 'lportal'.isnull(test_string varchar)
returning boolean;
IF test_string IS NULL THEN
	RETURN 't';
ELSE
	RETURN 'f';
END IF
end procedure;


create table Ntfctns_UserNotificationEvent (
	notificationEventId int8 not null primary key,
	companyId int8,
	userId int8,
	userNotificationEventId int8,
	timestamp int8,
	delivered boolean,
	actionRequired boolean,
	archived boolean
)
extent size 16 next size 16
lock mode row;


create index IX_61F3E3E4 on Ntfctns_UserNotificationEvent (userId, actionRequired);
create index IX_911E393A on Ntfctns_UserNotificationEvent (userId, actionRequired, archived);
create index IX_5EC15E51 on Ntfctns_UserNotificationEvent (userId, archived);
create index IX_20DFA99 on Ntfctns_UserNotificationEvent (userId, delivered);
create index IX_609938C2 on Ntfctns_UserNotificationEvent (userId, delivered, actionRequired);
create unique index IX_D448A02E on Ntfctns_UserNotificationEvent (userNotificationEventId);


