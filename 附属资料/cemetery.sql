/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016-10-20 12:55:57                          */
/*==============================================================*/


drop table if exists backpack;

drop table if exists cemetery;

drop table if exists cemetery_id_build;

drop table if exists community;

drop table if exists eulogy;

drop table if exists goods_official;

drop table if exists goods_personage;

drop table if exists integral_detail;

drop table if exists leave_message;

drop table if exists life_works;

drop table if exists life_works_collection;

drop table if exists master;

drop table if exists member_account;

drop table if exists member_account_id_build;

drop table if exists member_authorization;

drop table if exists member_role;

drop table if exists member_role_relate;

drop table if exists memorial_record;

drop table if exists model;

drop table if exists model_classify;

drop table if exists music;

drop table if exists notice;

drop table if exists park;

drop table if exists photo;

drop table if exists photo_album;

drop table if exists plants_and_animals;

drop table if exists public_figures_temporary_manage;

drop table if exists purchase_order;

drop table if exists special_holiday;

drop table if exists system_menu;

drop table if exists system_role;

drop table if exists system_role_menu_relate;

drop table if exists system_user;

drop table if exists system_user_role_relate;

drop table if exists tombstone;

drop table if exists town;

drop table if exists trading_detail;

drop table if exists video;

drop table if exists video_album;

drop table if exists village;

/*==============================================================*/
/* Table: backpack                                              */
/*==============================================================*/
create table backpack
(
   id                   varchar(32) not null,
   member_id            integer,
   source               integer comment '��Ʒ������������Ʒ�����ˣ�����ֲ��԰',
   count                integer default 1,
   goods_id             varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: cemetery                                              */
/*==============================================================*/
create table cemetery
(
   id                   integer not null comment 'UUID32λ���',
   name                 varchar(100) comment '��԰����',
   province_id          varchar(11) comment '�����ʡ���',
   county_id            varchar(20) comment '����������',
   city_id              varchar(20) comment '������б��',
   town_id              varchar(32),
   village_id           varchar(32),
   community_id         varchar(32),
   password             varchar(14) comment '��������',
   member_id            varchar(32) comment '������Ա���',
   is_open              integer default 1 comment '1�������� 0��������',
   remaining_storage_size integer default 0,
   storage_size         integer default 0,
   create_time          integer comment '����ʱ��',
   primary key (id)
);

alter table cemetery comment '��԰��Ϣ��';

/*==============================================================*/
/* Table: cemetery_id_build                                     */
/*==============================================================*/
create table cemetery_id_build
(
   id                   integer not null auto_increment,
   status               integer default 1 comment '1��δʹ�á�2����ʹ��',
   primary key (id)
)
auto_increment = 100000;

/*==============================================================*/
/* Table: community                                             */
/*==============================================================*/
create table community
(
   id                   varchar(32) not null,
   name                 varchar(64) not null,
   village_id           varchar(32) not null,
   rename_count         integer,
   create_time          integer,
   primary key (id)
);

/*==============================================================*/
/* Table: eulogy                                                */
/*==============================================================*/
create table eulogy
(
   id                   varchar(32) not null,
   member_id            varchar(32),
   marster_id           varchar(32),
   content              text,
   create_time          integer,
   primary key (id)
);

alter table eulogy comment '���ĵ���';

/*==============================================================*/
/* Table: goods_official                                        */
/*==============================================================*/
create table goods_official
(
   id                   varchar(32) not null,
   name                 varchar(30),
   price                double,
   images               varchar(300),
   description          text,
   type                 integer comment '���š�Ĺ��������...',
   extend_attribute     text,
   primary key (id)
);

/*==============================================================*/
/* Table: goods_personage                                       */
/*==============================================================*/
create table goods_personage
(
   id                   varchar(32) not null,
   price                double,
   repertory            integer,
   member_id            integer,
   plants_and_animals_id varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: integral_detail                                       */
/*==============================================================*/
create table integral_detail
(
   id                   varchar(32) not null,
   instructions         integer,
   integral             integer,
   type                 integer comment '1����ã� 2������',
   create_time          integer,
   member_id            integer,
   primary key (id)
);

/*==============================================================*/
/* Table: leave_message                                         */
/*==============================================================*/
create table leave_message
(
   id                   varchar(32) not null comment 'UUID32λ���',
   member_id            varchar(32),
   marster_id           varchar(32),
   content              text,
   reply_id             varchar(32),
   create_time          integer,
   primary key (id)
);

alter table leave_message comment '��������';

/*==============================================================*/
/* Table: life_works                                            */
/*==============================================================*/
create table life_works
(
   id                   varchar(32) not null comment 'UUID32λ���',
   name                 varchar(100),
   content              text,
   collection_id        varchar(32),
   create_time          integer,
   primary key (id)
);

alter table life_works comment '��ǰ��Ʒ';

/*==============================================================*/
/* Table: life_works_collection                                 */
/*==============================================================*/
create table life_works_collection
(
   id                   varchar(32) not null comment 'UUID32λ���',
   name                 varchar(100),
   marster_id           varchar(32) comment 'Ĺ�����˱��',
   remark               varchar(300) comment '��ע',
   create_time          integer comment '����ʱ��',
   primary key (id)
);

alter table life_works_collection comment '��ǰ��Ʒ��';

/*==============================================================*/
/* Table: master                                                */
/*==============================================================*/
create table master
(
   id                   varchar(32) not null comment 'UUID32λ���',
   name                 varchar(30) comment '����',
   portrait             varchar(300) comment '����',
   tombstone_id         varchar(32) comment 'Ĺ�����',
   birthday             integer,
   death_time           integer comment '����ʱ��',
   sort                 integer,
   life_introduce       text,
   last_wish            text,
   primary key (id)
);

alter table master comment '��԰Ĺ��������Ϣ';

/*==============================================================*/
/* Table: member_account                                        */
/*==============================================================*/
create table member_account
(
   member_id            integer not null comment '���ݹ����Զ����ɣ������Ե�¼ϵͳ',
   mobile_number        bigint not null comment '�ƶ��绰����',
   login_password       varchar(32) not null comment 'ϵͳ��¼����',
   nick_name            varchar(30) comment 'ϵͳ�ǳ�',
   inviter_id           integer,
   integral             integer default 0,
   trading_amount       double default 0,
   trading_password     varchar(32),
   construction_count   integer,
   create_time          integer not null,
   primary key (member_id)
);

alter table member_account comment '��¼��Աע���˺���Ϣ';

/*==============================================================*/
/* Table: member_account_id_build                               */
/*==============================================================*/
create table member_account_id_build
(
   id                   integer not null auto_increment,
   status               integer default 1 comment '1��δʹ�á�2����ʹ��',
   primary key (id)
)
auto_increment = 100000;

/*==============================================================*/
/* Table: member_authorization                                  */
/*==============================================================*/
create table member_authorization
(
   id                   varchar(32) not null,
   cemetery_id          integer,
   member_id            integer not null comment '���ݹ����Զ����ɣ������Ե�¼ϵͳ',
   primary key (id)
);

alter table member_authorization comment '��Ȩ��Ա������԰';

/*==============================================================*/
/* Table: member_role                                           */
/*==============================================================*/
create table member_role
(
   id                   varchar(32) not null,
   name                 varchar(30),
   type                 integer comment '1����ͨ��Ա��2�����ù���Ա��3�������¼�������ʱ����',
   primary key (id)
);

/*==============================================================*/
/* Table: member_role_relate                                    */
/*==============================================================*/
create table member_role_relate
(
   id                   varchar(32) not null,
   member_id            integer,
   role_id              varchar(32),
   remaining_number     integer default 0,
   primary key (id)
);

/*==============================================================*/
/* Table: memorial_record                                       */
/*==============================================================*/
create table memorial_record
(
   id                   varchar(32) not null comment 'UUID32λ���',
   member_id            integer,
   marster_id           varchar(32),
   model_id             varchar(32),
   create_time          integer,
   primary key (id)
);

alter table memorial_record comment '��԰�����¼';

/*==============================================================*/
/* Table: model                                                 */
/*==============================================================*/
create table model
(
   id                   varchar(32) not null,
   name                 varchar(60),
   classify_id          varchar(32),
   file_address         varchar(300),
   primary key (id)
);

/*==============================================================*/
/* Table: model_classify                                        */
/*==============================================================*/
create table model_classify
(
   id                   varchar(32) not null,
   name                 varchar(60),
   parent_id            varchar(32),
   can_edit             integer comment '1����ֹ�༭��2������༭',
   primary key (id)
);

/*==============================================================*/
/* Table: music                                                 */
/*==============================================================*/
create table music
(
   id                   varchar(32) not null,
   name                 varchar(60),
   file_address         varchar(300),
   file_size            integer,
   type                 integer comment '1����˾�ڲ���������������ͳ�ƣ���2����Աά�� ',
   cemetery_id          integer,
   primary key (id)
);

/*==============================================================*/
/* Table: notice                                                */
/*==============================================================*/
create table notice
(
   id                   varchar(32) not null,
   content              text,
   cemetery_id          integer,
   create_time          integer,
   primary key (id)
);

/*==============================================================*/
/* Table: park                                                  */
/*==============================================================*/
create table park
(
   id                   varchar(32) not null,
   cemetery_id          varchar(32),
   growing_days         integer,
   life_value           integer,
   goods_id             varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: photo                                                 */
/*==============================================================*/
create table photo
(
   id                   varchar(32) not null comment 'UUID32λ���',
   name                 varchar(100) comment '��Ƭ����',
   url                  varchar(300) comment '��Ƭ��ַ',
   album_id             varchar(32) comment '���������',
   create_time          integer comment '�ϴ�ʱ��',
   file_size            integer,
   primary key (id)
);

alter table photo comment '��԰�����Ƭ��Ϣ';

/*==============================================================*/
/* Table: photo_album                                           */
/*==============================================================*/
create table photo_album
(
   id                   varchar(32) not null comment 'UUID32λ���',
   name                 varchar(100) comment '�������',
   marster_id           varchar(32) comment 'Ĺ�����˱��',
   remark               varchar(300) comment '��ע',
   create_time          integer comment '����ʱ��',
   primary key (id)
);

alter table photo_album comment '��԰�����Ϣ';

/*==============================================================*/
/* Table: plants_and_animals                                    */
/*==============================================================*/
create table plants_and_animals
(
   id                   varchar(32) not null,
   name                 varchar(30),
   price                double,
   images               varchar(300),
   description          text,
   model_id             varchar(32),
   type                 integer comment 'ֲ�����',
   grouping             integer,
   phase                integer,
   primary key (id)
);

/*==============================================================*/
/* Table: public_figures_temporary_manage                       */
/*==============================================================*/
create table public_figures_temporary_manage
(
   id                   varchar(32) not null,
   member_id            integer,
   bewrite              text,
   audit_opinion        varchar(300),
   status               integer comment '1��ͬ�⡢2����ͬ��',
   system_user_id       varchar(32),
   create_time          integer,
   dispose_time         integer,
   primary key (id)
);

/*==============================================================*/
/* Table: purchase_order                                        */
/*==============================================================*/
create table purchase_order
(
   id                   varchar(32) not null,
   member_id            integer,
   create_time          integer,
   price                double,
   goods                text comment 'JSON{[��Ʒ���ơ�������������Ʒ����]}',
   primary key (id)
);

/*==============================================================*/
/* Table: special_holiday                                       */
/*==============================================================*/
create table special_holiday
(
   id                   varchar(32) not null,
   date_month           integer,
   data_day             integer,
   message              varchar(300),
   type                 integer comment '1��������2������',
   primary key (id)
);

/*==============================================================*/
/* Table: system_menu                                           */
/*==============================================================*/
create table system_menu
(
   id                   varchar(32) not null comment 'UUID32λ���',
   name                 varchar(30) comment '�˵�����',
   url                  varchar(300) comment '���ӵ�ַ',
   sort                 int(2) comment 'ͬ������˳��',
   parent_id            varchar(32) default '0' comment '���˵���ţ�Ĭ��Ϊ����˵�0��',
   primary key (id)
);

alter table system_menu comment 'ϵͳ�˵���Ϣ';

/*==============================================================*/
/* Table: system_role                                           */
/*==============================================================*/
create table system_role
(
   id                   varchar(32) not null comment 'UUID32λ���',
   name                 varchar(30) comment '��ɫ����',
   remark               varchar(300) comment '��ע��Ϣ',
   primary key (id)
);

alter table system_role comment 'ϵͳ�û���ɫ��';

/*==============================================================*/
/* Table: system_role_menu_relate                               */
/*==============================================================*/
create table system_role_menu_relate
(
   id                   varchar(32) not null comment 'UUID32λ���',
   role_id              varchar(32) not null comment 'ϵͳ��ɫ���',
   menu_id              varchar(32) not null comment 'ϵͳ�˵����',
   primary key (id)
);

alter table system_role_menu_relate comment 'ϵͳ��ɫ��˵���ϵ��';

/*==============================================================*/
/* Table: system_user                                           */
/*==============================================================*/
create table system_user
(
   id                   varchar(32) not null comment 'UUID32λ���',
   login_name           varchar(30) comment '��¼�û���',
   login_password       varchar(32) comment '����',
   real_name            varchar(30) comment '��ʵ����',
   mobile               bigint comment '�ֻ�����',
   create_time          integer comment '����ʱ��',
   primary key (id)
);

alter table system_user comment 'ϵͳ�����û���Ϣ��';

/*==============================================================*/
/* Table: system_user_role_relate                               */
/*==============================================================*/
create table system_user_role_relate
(
   id                   varchar(32) not null comment 'UUID32λ���',
   user_id              varchar(32) not null comment 'ϵͳ�û����',
   role_id              varchar(32) not null comment 'ϵͳ�û���ɫ���',
   primary key (id)
);

alter table system_user_role_relate comment 'ϵͳ�û����ɫ��ϵ��';

/*==============================================================*/
/* Table: tombstone                                             */
/*==============================================================*/
create table tombstone
(
   id                   varchar(32) not null comment 'UUID32λ���',
   sort                 integer comment 'Ĺ������˳��',
   cemetery_id          integer comment '������԰���',
   member_id            varchar(30) comment '������',
   type                 integer comment 'Ĺ�����ͣ�1�����˱���2��˫�˱���',
   species              integer comment '1�����࣬2������',
   create_time          integer comment '����ʱ��',
   primary key (id)
);

alter table tombstone comment '��԰Ĺ����Ϣ��';

/*==============================================================*/
/* Table: town                                                  */
/*==============================================================*/
create table town
(
   id                   varchar(32) not null,
   name                 varchar(64) not null,
   county_id            varchar(20) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: trading_detail                                        */
/*==============================================================*/
create table trading_detail
(
   id                   varchar(32) not null,
   instructions         integer,
   trading              integer,
   type                 integer comment '1����ã� 2������',
   create_time          integer,
   member_id            integer,
   primary key (id)
);

/*==============================================================*/
/* Table: video                                                 */
/*==============================================================*/
create table video
(
   id                   varchar(32) not null comment 'UUID32λ���',
   name                 varchar(100) comment '��ý������',
   url                  varchar(300) comment '�ļ���ַ',
   album_id             varchar(32) comment '���������',
   create_time          integer comment '�ϴ�ʱ��',
   file_size            integer,
   primary key (id)
);

alter table video comment '��԰��ý��';

/*==============================================================*/
/* Table: video_album                                           */
/*==============================================================*/
create table video_album
(
   id                   varchar(32) not null comment 'UUID32λ���',
   name                 varchar(100) comment '�������',
   marster_id           varchar(32) comment 'Ĺ�����˱��',
   remark               varchar(300) comment '��ע',
   create_time          integer comment '����ʱ��',
   primary key (id)
);

alter table video_album comment '��Ƶר��';

/*==============================================================*/
/* Table: village                                               */
/*==============================================================*/
create table village
(
   id                   varchar(32) not null,
   name                 varchar(64) not null,
   town_id              varchar(32) not null,
   primary key (id)
);

