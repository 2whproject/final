drop table tbl_com_cpu;

create table tbl_com_cpu
	( 	cbrand		varchar(5) NOT NULL,
		ccode		varchar(20) NOT NULL,
		cname		varchar(16) NOT NULL,
		csocket		varchar(10) NOT NULL,
		ccore		int(2) NOT NULL,
		cthread		int(4) NOT NULL,
		cclock		varchar(8) NOT NULL,
		cmaxclock	varchar(8) ,
		cvalue		int(3) NOT NULL,
		cold		BOOLEAN NOT NULL,
		cgraphic	boolean NOT NULL
		);
		
	
insert into tbl_com_cpu values ('intel', 'SandyBridge', 'i5-2400', 'LGA1155', '4', '4', '3.1GHZ', '3.4GHZ', '5', '1', '1');
insert into tbl_com_cpu values ('intel', 'SandyBridge', 'i3-2120', 'LGA1155', '2', '4', '3.3GHZ', '', '5', '1', '1');
insert into tbl_com_cpu values ('intel', 'SkyLake',  'i5-6600', 'LGA1151', '4', '4', '3.3GHZ', '3.9GHZ', '20', '0', '1');
insert into tbl_com_cpu values ('AMD', 'Deneb', 'PhenomIIX4-955', 'AM3+', '4', '4', '3.2GHZ', '', '5', '1', '0');
insert into tbl_com_cpu values ('AMD', 'Regor', 'AthlonIIX2-250', 'AM3+', '2', '2', '3.0GHZ', '', '5', '1', '0');
insert into tbl_com_cpu values ('AMD', 'Vishera',  'FX8300', 'AM3+', '8', '8', '3.3GHZ', '4.2GHZ', '10', '0', '1');