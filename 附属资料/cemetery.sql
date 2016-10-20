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
   source               integer comment '商品（官网）、商品（个人）、动植物园',
   count                integer default 1,
   goods_id             varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: cemetery                                              */
/*==============================================================*/
create table cemetery
(
   id                   integer not null comment 'UUID32位编号',
   name                 varchar(100) comment '陵园名称',
   province_id          varchar(11) comment '区域表：省编号',
   county_id            varchar(20) comment '区域表：区编号',
   city_id              varchar(20) comment '区域表：市编号',
   town_id              varchar(32),
   village_id           varchar(32),
   community_id         varchar(32),
   password             varchar(14) comment '访问密码',
   member_id            varchar(32) comment '所属会员编号',
   is_open              integer default 1 comment '1：公开， 0：不公开',
   remaining_storage_size integer default 0,
   storage_size         integer default 0,
   create_time          integer comment '创建时间',
   primary key (id)
);

alter table cemetery comment '陵园信息表';

/*==============================================================*/
/* Table: cemetery_id_build                                     */
/*==============================================================*/
create table cemetery_id_build
(
   id                   integer not null auto_increment,
   status               integer default 1 comment '1，未使用、2，已使用',
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

alter table eulogy comment '祭文悼词';

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
   type                 integer comment '大门、墓碑、人物...',
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
   type                 integer comment '1：获得， 2：消费',
   create_time          integer,
   member_id            integer,
   primary key (id)
);

/*==============================================================*/
/* Table: leave_message                                         */
/*==============================================================*/
create table leave_message
(
   id                   varchar(32) not null comment 'UUID32位编号',
   member_id            varchar(32),
   marster_id           varchar(32),
   content              text,
   reply_id             varchar(32),
   create_time          integer,
   primary key (id)
);

alter table leave_message comment '祭祀留言';

/*==============================================================*/
/* Table: life_works                                            */
/*==============================================================*/
create table life_works
(
   id                   varchar(32) not null comment 'UUID32位编号',
   name                 varchar(100),
   content              text,
   collection_id        varchar(32),
   create_time          integer,
   primary key (id)
);

alter table life_works comment '生前作品';

/*==============================================================*/
/* Table: life_works_collection                                 */
/*==============================================================*/
create table life_works_collection
(
   id                   varchar(32) not null comment 'UUID32位编号',
   name                 varchar(100),
   marster_id           varchar(32) comment '墓碑主人编号',
   remark               varchar(300) comment '备注',
   create_time          integer comment '创建时间',
   primary key (id)
);

alter table life_works_collection comment '生前作品集';

/*==============================================================*/
/* Table: master                                                */
/*==============================================================*/
create table master
(
   id                   varchar(32) not null comment 'UUID32位编号',
   name                 varchar(30) comment '姓名',
   portrait             varchar(300) comment '遗像',
   tombstone_id         varchar(32) comment '墓碑编号',
   birthday             integer,
   death_time           integer comment '辞世时间',
   sort                 integer,
   life_introduce       text,
   last_wish            text,
   primary key (id)
);

alter table master comment '陵园墓碑主人信息';

/*==============================================================*/
/* Table: member_account                                        */
/*==============================================================*/
create table member_account
(
   member_id            integer not null comment '根据规则自动生成，可用以登录系统',
   mobile_number        bigint not null comment '移动电话号码',
   login_password       varchar(32) not null comment '系统登录密码',
   nick_name            varchar(30) comment '系统昵称',
   inviter_id           integer,
   integral             integer default 0,
   trading_amount       double default 0,
   trading_password     varchar(32),
   construction_count   integer,
   create_time          integer not null,
   primary key (member_id)
);

alter table member_account comment '记录会员注册账号信息';

/*==============================================================*/
/* Table: member_account_id_build                               */
/*==============================================================*/
create table member_account_id_build
(
   id                   integer not null auto_increment,
   status               integer default 1 comment '1，未使用、2，已使用',
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
   member_id            integer not null comment '根据规则自动生成，可用以登录系统',
   primary key (id)
);

alter table member_authorization comment '授权会员管理陵园';

/*==============================================================*/
/* Table: member_role                                           */
/*==============================================================*/
create table member_role
(
   id                   varchar(32) not null,
   name                 varchar(30),
   type                 integer comment '1：普通会员、2：内置管理员、3：公众事件申请临时管理',
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
   id                   varchar(32) not null comment 'UUID32位编号',
   member_id            integer,
   marster_id           varchar(32),
   model_id             varchar(32),
   create_time          integer,
   primary key (id)
);

alter table memorial_record comment '陵园纪念记录';

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
   can_edit             integer comment '1，禁止编辑、2，允许编辑',
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
   type                 integer comment '1：公司内部管理（不参与流量统计）、2：会员维护 ',
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
   id                   varchar(32) not null comment 'UUID32位编号',
   name                 varchar(100) comment '相片名称',
   url                  varchar(300) comment '相片地址',
   album_id             varchar(32) comment '所属相册编号',
   create_time          integer comment '上传时间',
   file_size            integer,
   primary key (id)
);

alter table photo comment '陵园相册相片信息';

/*==============================================================*/
/* Table: photo_album                                           */
/*==============================================================*/
create table photo_album
(
   id                   varchar(32) not null comment 'UUID32位编号',
   name                 varchar(100) comment '相册名称',
   marster_id           varchar(32) comment '墓碑主人编号',
   remark               varchar(300) comment '备注',
   create_time          integer comment '创建时间',
   primary key (id)
);

alter table photo_album comment '陵园相册信息';

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
   type                 integer comment '植物、动物',
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
   status               integer comment '1：同意、2：不同意',
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
   goods                text comment 'JSON{[商品名称、购买数量、商品单价]}',
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
   type                 integer comment '1、阴历，2、阳历',
   primary key (id)
);

/*==============================================================*/
/* Table: system_menu                                           */
/*==============================================================*/
create table system_menu
(
   id                   varchar(32) not null comment 'UUID32位编号',
   name                 varchar(30) comment '菜单名称',
   url                  varchar(300) comment '链接地址',
   sort                 int(2) comment '同级排列顺序',
   parent_id            varchar(32) default '0' comment '父菜单编号（默认为顶层菜单0）',
   primary key (id)
);

alter table system_menu comment '系统菜单信息';

/*==============================================================*/
/* Table: system_role                                           */
/*==============================================================*/
create table system_role
(
   id                   varchar(32) not null comment 'UUID32位编号',
   name                 varchar(30) comment '角色名称',
   remark               varchar(300) comment '备注信息',
   primary key (id)
);

alter table system_role comment '系统用户角色表';

/*==============================================================*/
/* Table: system_role_menu_relate                               */
/*==============================================================*/
create table system_role_menu_relate
(
   id                   varchar(32) not null comment 'UUID32位编号',
   role_id              varchar(32) not null comment '系统角色编号',
   menu_id              varchar(32) not null comment '系统菜单编号',
   primary key (id)
);

alter table system_role_menu_relate comment '系统角色与菜单关系表';

/*==============================================================*/
/* Table: system_user                                           */
/*==============================================================*/
create table system_user
(
   id                   varchar(32) not null comment 'UUID32位编号',
   login_name           varchar(30) comment '登录用户名',
   login_password       varchar(32) comment '密码',
   real_name            varchar(30) comment '真实姓名',
   mobile               bigint comment '手机号码',
   create_time          integer comment '创造时间',
   primary key (id)
);

alter table system_user comment '系统操作用户信息表';

/*==============================================================*/
/* Table: system_user_role_relate                               */
/*==============================================================*/
create table system_user_role_relate
(
   id                   varchar(32) not null comment 'UUID32位编号',
   user_id              varchar(32) not null comment '系统用户编号',
   role_id              varchar(32) not null comment '系统用户角色编号',
   primary key (id)
);

alter table system_user_role_relate comment '系统用户与角色关系表';

/*==============================================================*/
/* Table: tombstone                                             */
/*==============================================================*/
create table tombstone
(
   id                   varchar(32) not null comment 'UUID32位编号',
   sort                 integer comment '墓碑排列顺序',
   cemetery_id          integer comment '所属陵园编号',
   member_id            varchar(30) comment '立碑人',
   type                 integer comment '墓碑类型（1：单人碑，2：双人碑）',
   species              integer comment '1：人类，2：宠物',
   create_time          integer comment '立碑时间',
   primary key (id)
);

alter table tombstone comment '陵园墓碑信息表';

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
   type                 integer comment '1：获得， 2：消费',
   create_time          integer,
   member_id            integer,
   primary key (id)
);

/*==============================================================*/
/* Table: video                                                 */
/*==============================================================*/
create table video
(
   id                   varchar(32) not null comment 'UUID32位编号',
   name                 varchar(100) comment '多媒体名称',
   url                  varchar(300) comment '文件地址',
   album_id             varchar(32) comment '所属相册编号',
   create_time          integer comment '上传时间',
   file_size            integer,
   primary key (id)
);

alter table video comment '陵园多媒体';

/*==============================================================*/
/* Table: video_album                                           */
/*==============================================================*/
create table video_album
(
   id                   varchar(32) not null comment 'UUID32位编号',
   name                 varchar(100) comment '相册名称',
   marster_id           varchar(32) comment '墓碑主人编号',
   remark               varchar(300) comment '备注',
   create_time          integer comment '创建时间',
   primary key (id)
);

alter table video_album comment '视频专辑';

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

