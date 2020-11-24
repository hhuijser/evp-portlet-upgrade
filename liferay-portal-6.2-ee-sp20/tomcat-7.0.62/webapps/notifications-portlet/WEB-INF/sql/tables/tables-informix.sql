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
