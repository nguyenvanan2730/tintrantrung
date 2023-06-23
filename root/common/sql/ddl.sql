-- Project Name : BUS SYSTEM
-- Date/Time    : 5/19/2023 9:35:38 PM
-- Author       : Admin
-- RDBMS Type   : PostgreSQL
-- Application  : A5:SQL Mk-2

/*
  << CAUTION !! >>
  BackupToTempTable, RestoreFromTempTable directive is attached.
 This preserve data after drop table and create table.
 This function temporarily creates temporary table like $$TableName.
  This feature is only available in A5:SQL Mk-2.
*/

--* RestoreFromTempTable
create table RESERVATION_DETAIL (
  reservation_no integer not null
  , reservation_detail_no serial not null
  , seat_name varchar(3) not null
  , constraint RESERVATION_DETAIL_PKC primary key (reservation_detail_no)
) ;

--* RestoreFromTempTable
create table BUS_STOP (
  bus_stop_id serial not null
  , bus_stop_name varchar(10) not null
  , constraint BUS_STOP_PKC primary key (bus_stop_id)
) ;

--* RestoreFromTempTable
create table MEMBER (
  member_id serial not null
  , last_name varchar(20) not null
  , first_name varchar(20) not null
  , tel varchar(13) not null
  , email varchar(100) not null
  , password varchar(64) not null
  , constraint MEMBER_PKC primary key (member_id)
) ;

--* RestoreFromTempTable
create table RESERVATION (
  reservation_no serial not null
  , reservation_datetime timestamp not null
  , user_id integer not null
  , route_id integer not null
  , constraint RESERVATION_PKC primary key (reservation_no)
) ;

--* RestoreFromTempTable
create table BUS (
  bus_id serial not null
  , number_place varchar(10) not null
  , number_division char(2) not null
  , number_kana char(1) not null
  , number_first_half char(2) not null
  , number_latter_half char(2) not null
  , row_num integer not null
  , column_num integer not null
  , constraint BUS_PKC primary key (bus_id)
) ;

--* RestoreFromTempTable
create table MANAGER (
  manager_id serial not null
  , login_id varchar(30) not null
  , password varchar(64) not null
  , constraint MANAGER_PKC primary key (manager_id)
) ;

--* RestoreFromTempTable
create table ROUTE (
  route_id serial not null
  , departure_bus_stop_id integer not null
  , departure_time varchar(5) not null
  , arrival_bus_stop_id integer not null
  , arrival_time varchar(5) not null
  , run_start_date timestamp not null
  , run_end_date timestamp
  , bus_id integer not null
  , price integer not null
  , constraint ROUTE_PKC primary key (route_id)
) ;

comment on table RESERVATION_DETAIL is '予約詳細';
comment on column RESERVATION_DETAIL.reservation_no is '予約番号';
comment on column RESERVATION_DETAIL.reservation_detail_no is '予約詳細番号';
comment on column RESERVATION_DETAIL.seat_name is '座席名';

comment on table BUS_STOP is 'バス停留所';
comment on column BUS_STOP.bus_stop_id is 'バス停留所ID';
comment on column BUS_STOP.bus_stop_name is 'バス停留所名';

comment on table MEMBER is '会員';
comment on column MEMBER.member_id is '会員ID';
comment on column MEMBER.last_name is '姓';
comment on column MEMBER.first_name is '名';
comment on column MEMBER.tel is '電話番号';
comment on column MEMBER.email is 'メール';
comment on column MEMBER.password is 'パスワード';

comment on table RESERVATION is '予約';
comment on column RESERVATION.reservation_no is '予約番号';
comment on column RESERVATION.reservation_datetime is '予約日時';
comment on column RESERVATION.user_id is '会員ID';
comment on column RESERVATION.route_id is '路線ID';

comment on table BUS is 'バス';
comment on column BUS.bus_id is 'バスID';
comment on column BUS.number_place is 'ナンバー（地名）';
comment on column BUS.number_division is 'ナンバー（分類番号）';
comment on column BUS.number_kana is 'ナンバー（かな）';
comment on column BUS.number_first_half is 'ナンバー（一連指定番号前半）';
comment on column BUS.number_latter_half is 'ナンバー（一連指定番号後半）';
comment on column BUS.row_num is '１列あたりシート数';
comment on column BUS.column_num is 'シート列数';

comment on table MANAGER is '運用管理者';
comment on column MANAGER.manager_id is '管理者ID';
comment on column MANAGER.login_id is 'ログインID';
comment on column MANAGER.password is 'パスワード';

comment on table ROUTE is '路線';
comment on column ROUTE.route_id is '路線ID';
comment on column ROUTE.departure_bus_stop_id is '出発停留所ID';
comment on column ROUTE.departure_time is '出発時刻';
comment on column ROUTE.arrival_bus_stop_id is '到着停留所ID';
comment on column ROUTE.arrival_time is '到着時刻';
comment on column ROUTE.run_start_date is '運行開始日';
comment on column ROUTE.run_end_date is '運行終了日';
comment on column ROUTE.bus_id is 'バスID';
comment on column ROUTE.price is '料金';