create table Ntfctns_UserNotificationEvent (
	notificationEventId bigint not null primary key,
	companyId bigint,
	userId bigint,
	userNotificationEventId bigint,
	timestamp bigint,
	delivered tinyint,
	actionRequired tinyint,
	archived tinyint
) engine InnoDB;
