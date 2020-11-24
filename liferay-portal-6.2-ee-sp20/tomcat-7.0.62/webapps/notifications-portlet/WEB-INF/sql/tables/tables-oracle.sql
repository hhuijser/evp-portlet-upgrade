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
