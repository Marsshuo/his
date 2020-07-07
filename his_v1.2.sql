/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/7/7 9:48:29                             */
/*==============================================================*/


drop table if exists ConstantItem;

drop table if exists ConstantType;

drop table if exists Department;

drop table if exists RegistLevel;

drop table if exists menu;

drop table if exists role_menu;

drop table if exists trole;

drop table if exists user_role;

drop table if exists 用户表;

/*==============================================================*/
/* Table: ConstantItem                                          */
/*==============================================================*/
create table ConstantItem
(
   constantitemid       int not null,
   constantTypeID       int,
   ContantCode          varchar(20),
   ContantName          varchar(20),
   delMark              int,
   primary key (constantitemid)
);

/*==============================================================*/
/* Table: ConstantType                                          */
/*==============================================================*/
create table ConstantType
(
   constanttypeid       int not null,
   constantTypeCode     varchar(20),
   constantTypeName     varchar(50),
   delMark              int,
   primary key (constanttypeid)
);

/*==============================================================*/
/* Table: Department                                            */
/*==============================================================*/
create table Department
(
   departmentid         int not null,
   deptCode             varchar(20),
   deptName             varchar(20),
   DeptCategoryID       int,
   deptType             int,
   delMark              int,
   primary key (departmentid)
);

/*==============================================================*/
/* Table: RegistLevel                                           */
/*==============================================================*/
create table RegistLevel
(
   registlevelid        int not null,
   RegistCode           varchar(20),
   RegistName           varchar(20),
   SequenceNo           int,
   RegistFee            double(8,2),
   RegistQuota          int,
   delMark              int,
   primary key (registlevelid)
);

/*==============================================================*/
/* Table: menu                                                  */
/*==============================================================*/
create table menu
(
   menuid               int not null,
   mname                varchar(50),
   icon                 varchar(50),
   url                  varchar(100),
   delmark              int,
   primary key (menuid)
);

/*==============================================================*/
/* Table: role_menu                                             */
/*==============================================================*/
create table role_menu
(
   rmid                 int not null,
   roleid               int,
   menuid               int,
   delmark              int,
   primary key (rmid)
);

/*==============================================================*/
/* Table: trole                                                 */
/*==============================================================*/
create table trole
(
   roleid               int not null,
   rolename             varchar(50),
   delmark              int,
   primary key (roleid)
);

alter table trole comment '角色表';

/*==============================================================*/
/* Table: user_role                                             */
/*==============================================================*/
create table user_role
(
   userroleid           int not null,
   userid               int,
   roleid               int,
   delmark              int,
   primary key (userroleid)
);

/*==============================================================*/
/* Table: 用户表                                                   */
/*==============================================================*/
create table 用户表
(
   userid               int not null,
   username             varchar(20),
   password             varchar(20),
   realname             varchar(20),
   userType             int,
   docTitleId           int,
   IsScheduling         int,
   depttid              int,
   RegistLeID           int,
   delMark              int,
   primary key (userid)
);

alter table Department add constraint FK_Department_contantitem_departmentCategoryid foreign key (DeptCategoryID)
      references ConstantItem (constantitemid) on delete restrict on update restrict;

alter table role_menu add constraint FK_Reference_8 foreign key (roleid)
      references trole (roleid) on delete restrict on update restrict;

alter table role_menu add constraint FK_Reference_9 foreign key (menuid)
      references menu (menuid) on delete restrict on update restrict;

alter table user_role add constraint FK_Reference_6 foreign key (userid)
      references 用户表 (userid) on delete restrict on update restrict;

alter table user_role add constraint FK_Reference_7 foreign key (roleid)
      references trole (roleid) on delete restrict on update restrict;

alter table 用户表 add constraint FK_user_constantItem_docTitleId foreign key (docTitleId)
      references ConstantItem (constantitemid) on delete restrict on update restrict;

alter table 用户表 add constraint FK_user_department_deptid foreign key (depttid)
      references Department (departmentid) on delete restrict on update restrict;

alter table 用户表 add constraint FK_user_registLevel_registleaveId foreign key (RegistLeID)
      references RegistLevel (registlevelid) on delete restrict on update restrict;

