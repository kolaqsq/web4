--
-- Вывод свободных записей к офтальмологу во всех клиниках кроме Касимовского медицинского центра
--
select clinic_name, specialization_name, available_date, available_time
from electronic_registry.ELREG_available_dates Ead
         join electronic_registry.ELREG_available_times Eat
              on Ead.id = Eat.date_id
         join electronic_registry.ELREG_specializations Es
              on Es.id = Ead.specialization_id
         join electronic_registry.ELREG_clinics Ec
              on Ec.id = Ead.clinic_id
where specialization_name = 'Прием офтальмолога'
  and Ec.clinic_name !=
      'ГОСУДАРСТВЕННОЕ БЮДЖЕТНОЕ УЧРЕЖДЕНИЕ РЯЗАНСКОЙ ОБЛАСТИ "КАСИМОВСКИЙ МЕЖРАЙОННЫЙ МЕДИЦИНСКИЙ ЦЕНТР"'
  and Ead.available = 1
  and Eat.available = 1
order by clinic_name, available_date

-- --------------------------------------------------------

--
-- Формирование рейтинга больниц по количеству специализаций
--
select clinic_name, count(Ec.id) specializations
from electronic_registry.ELREG_clinics Ec
         join electronic_registry.ELREG_clinics_specializations Ecs
              on Ec.id = Ecs.clinic_id
         join electronic_registry.ELREG_specializations Es
              on Es.id = Ecs.specialization_id
group by clinic_name
order by specializations desc

-- --------------------------------------------------------

--
-- Создание таблицы категорий продуктов
--
create table product_categories
(
    id int,
    category_name varchar(255) not null
);

create unique index product_categories_id_uindex
	on product_categories (id);

alter table product_categories
    add constraint product_categories_pk
        primary key (id);

alter table product_categories modify id int auto_increment;

-- --------------------------------------------------------


--
-- Создание таблицы пользователей
--
create table users
(
    id int,
    first_name varchar(255) not null,
    surname varchar(255) not null,
    phone varchar(20) not null,
    `e-mail` varchar(255) null,
    registration_date date not null,
    confirmed_user bool default 0 not null,
    active_lots int default 0 not null,
    rating float default 0 null,
    reviews int default 0 null
);

create unique index `user_e-mail_uindex`
	on user (`e-mail`);

create unique index user_id_uindex
	on user (id);

create unique index user_phone_uindex
	on user (phone);

alter table user
    add constraint user_pk
        primary key (id);

alter table user modify id int auto_increment;

-- --------------------------------------------------------

--
-- Создание таблицы объявлений
--
create table lots
(
    id int,
    subcategory_id int not null,
    user_id int not null,
    geo varchar(255) not null,
    lot_name varchar(255) not null,
    lot_description varchar(2047) null,
    views int default 0 not null,
    favourites int default 0 not null,
    publication_date datetime not null
);

create unique index lots_id_uindex
	on lots (id);

alter table lots
    add constraint lots_pk
        primary key (id);

alter table lots modify id int auto_increment;

alter table lots
    add constraint lots_product_subcategories_id_fk
        foreign key (subcategory_id) references product_subcategories (id);

alter table lots
    add constraint lots_users_id_fk
        foreign key (user_id) references users (id);


-- --------------------------------------------------------

--
-- Вывод информации объявления
--
explain
select lot_name,
       price,
       geo,
       lot_description,
       category_name,
       subcategory_name,
       favourites,
       views,
       publication_date,
       first_name,
       surname,
       active_lots,
       registration_date,
       rating,
       reviews,
       confirmed_user
from lots
         join product_subcategories ps on lots.subcategory_id = ps.id
         join product_categories pc on pc.id = ps.category_id
         join users u on lots.user_id = u.id
where lots.id = 1

-- --------------------------------------------------------

--
-- Вывод дополнительных параметров объявления и их значений
--
explain
select parameter_name, value_name
from parameter_sets
         join lots l on l.id = parameter_sets.lot_id
         join product_parameters pp on pp.id = parameter_sets.parameter_id
         join parameter_values pv on pv.id = parameter_sets.value_id
where l.id = 1

-- --------------------------------------------------------

--
-- Вывод картинок объявления
--
explain
select path
from photos
         join lots l on l.id = photos.lot_id
where l.id = 1
