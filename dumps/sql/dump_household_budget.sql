-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Хост: sql11.freesqldatabase.com
-- Время создания: Авг 27 2017 г., 12:40
-- Версия сервера: 5.5.53-0ubuntu0.14.04.1
-- Версия PHP: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `household_budget`
--
CREATE DATABASE IF NOT EXISTS `GRomR1$household_budget` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `GRomR1$household_budget`;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add estimate', 1, 'add_estimate'),
(2, 'Can change estimate', 1, 'change_estimate'),
(3, 'Can delete estimate', 1, 'delete_estimate'),
(4, 'Can add item', 2, 'add_item'),
(5, 'Can change item', 2, 'change_item'),
(6, 'Can delete item', 2, 'delete_item'),
(7, 'Can add kind', 3, 'add_kind'),
(8, 'Can change kind', 3, 'change_kind'),
(9, 'Can delete kind', 3, 'delete_kind'),
(10, 'Can add log entry', 4, 'add_logentry'),
(11, 'Can change log entry', 4, 'change_logentry'),
(12, 'Can delete log entry', 4, 'delete_logentry'),
(13, 'Can add permission', 5, 'add_permission'),
(14, 'Can change permission', 5, 'change_permission'),
(15, 'Can delete permission', 5, 'delete_permission'),
(16, 'Can add group', 6, 'add_group'),
(17, 'Can change group', 6, 'change_group'),
(18, 'Can delete group', 6, 'delete_group'),
(19, 'Can add user', 7, 'add_user'),
(20, 'Can change user', 7, 'change_user'),
(21, 'Can delete user', 7, 'delete_user'),
(22, 'Can add content type', 8, 'add_contenttype'),
(23, 'Can change content type', 8, 'change_contenttype'),
(24, 'Can delete content type', 8, 'delete_contenttype'),
(25, 'Can add session', 9, 'add_session'),
(26, 'Can change session', 9, 'change_session'),
(27, 'Can delete session', 9, 'delete_session');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$36000$U2mNdgEOjFB1$YesqlLNrfPXKInsntA4ns7T1hfcYhs50zS/9kV+FOpw=', '2017-08-26 08:38:52', 1, 'admin', '', '', '', 1, 1, '2017-08-26 08:38:21'),
(2, 'pbkdf2_sha256$36000$BJ9RPWsQs462$g795zqmg81DZ6NEOJTnFGb7IveR9bnwMU4or7sT3m0A=', '2017-08-27 10:45:56', 0, 'Мама', '', '', '', 0, 1, '2017-08-26 08:40:01'),
(3, 'pbkdf2_sha256$36000$6wxGYD7El2k7$ddgLmQSQkfR0iMUEfoyT6N0mlrQBNoe+Epkz2FJjAfk=', NULL, 0, 'Папа', '', '', '', 0, 1, '2017-08-26 08:41:45'),
(4, 'pbkdf2_sha256$36000$TagQXabm7L0r$lpljvLwjlCm/7kGPQWAvf3apvqYX6PIEEXs7Yqk24J8=', NULL, 0, 'Бабушка', '', '', '', 0, 1, '2017-08-26 08:42:27'),
(5, 'pbkdf2_sha256$36000$awvF5Xzx7mjD$mgX6rkSYsxhZcrVKz3ZeoQmGAknByR5fp6krxbf7oeg=', NULL, 0, 'Сын', '', '', '', 0, 1, '2017-08-26 08:42:54'),
(6, 'pbkdf2_sha256$36000$S0ZKYB7pSKe9$UHZgzjRBT4ilyEMFC1vcCKbTc/XfN7vw9qg4ssI2bcI=', NULL, 0, 'Дочь', '', '', '', 0, 1, '2017-08-26 08:43:21');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2017-08-26 08:40:01', '2', 'Мама', 1, '[{\"added\": {}}]', 7, 1),
(2, '2017-08-26 08:41:46', '3', 'Папа', 1, '[{\"added\": {}}]', 7, 1),
(3, '2017-08-26 08:42:27', '4', 'Бабушка', 1, '[{\"added\": {}}]', 7, 1),
(4, '2017-08-26 08:42:54', '5', 'Сын', 1, '[{\"added\": {}}]', 7, 1),
(5, '2017-08-26 08:43:21', '6', 'Дочь', 1, '[{\"added\": {}}]', 7, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(4, 'admin', 'logentry'),
(6, 'auth', 'group'),
(5, 'auth', 'permission'),
(7, 'auth', 'user'),
(8, 'contenttypes', 'contenttype'),
(1, 'household_budget', 'estimate'),
(2, 'household_budget', 'item'),
(3, 'household_budget', 'kind'),
(9, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Структура таблицы `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2017-08-26 08:36:28'),
(2, 'auth', '0001_initial', '2017-08-26 08:36:37'),
(3, 'admin', '0001_initial', '2017-08-26 08:36:40'),
(4, 'admin', '0002_logentry_remove_auto_add', '2017-08-26 08:36:40'),
(5, 'contenttypes', '0002_remove_content_type_name', '2017-08-26 08:36:42'),
(6, 'auth', '0002_alter_permission_name_max_length', '2017-08-26 08:36:42'),
(7, 'auth', '0003_alter_user_email_max_length', '2017-08-26 08:36:43'),
(8, 'auth', '0004_alter_user_username_opts', '2017-08-26 08:36:43'),
(9, 'auth', '0005_alter_user_last_login_null', '2017-08-26 08:36:44'),
(10, 'auth', '0006_require_contenttypes_0002', '2017-08-26 08:36:45'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2017-08-26 08:36:45'),
(12, 'auth', '0008_alter_user_username_max_length', '2017-08-26 08:36:46'),
(13, 'household_budget', '0001_initial', '2017-08-26 08:36:50'),
(14, 'sessions', '0001_initial', '2017-08-26 08:36:51');

-- --------------------------------------------------------

--
-- Структура таблицы `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ohl8xq2ae8j8mzw40i0k065bbldu8zen', 'Njc1NmE4NmRiNTQ1YjYxZDk2YzVhNDZkMGM2NzE5NzQ3YWI1MDY5Njp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0ZTJhZDUyNGM5NjNhZGMxYjIzOThlYWE1ZWRlZjZkZWZkMWJlZmJlIn0=', '2017-09-10 10:45:56');

-- --------------------------------------------------------

--
-- Структура таблицы `household_budget_estimate`
--

CREATE TABLE `household_budget_estimate` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `value` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `household_budget_estimate`
--

INSERT INTO `household_budget_estimate` (`id`, `date`, `value`, `item_id`) VALUES
(1, '2017-08-01 09:33:00', 30000, 1),
(2, '2017-08-10 09:33:00', 5000, 3),
(3, '2017-08-04 07:00:00', 15500, 2),
(4, '2017-08-06 05:00:00', 2000, 9),
(5, '2017-08-15 09:12:00', 8000, 4),
(6, '2017-08-16 11:00:00', 10000, 5),
(7, '2017-08-25 11:00:00', 11000, 6),
(8, '2017-08-10 09:16:00', 5000, 11),
(9, '2017-08-31 09:16:00', 10000, 11);

-- --------------------------------------------------------

--
-- Структура таблицы `household_budget_item`
--

CREATE TABLE `household_budget_item` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `plan` int(11) NOT NULL,
  `closing_date` date DEFAULT NULL,
  `kind_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `household_budget_item`
--

INSERT INTO `household_budget_item` (`id`, `name`, `plan`, `closing_date`, `kind_id`) VALUES
(1, 'Зарплата мамы', 30000, NULL, 2),
(2, 'Зарплата папы', 15000, NULL, 2),
(3, 'Оплата ЖКХ', 5000, NULL, 1),
(4, 'Пенсия бабушки', 8000, NULL, 2),
(5, 'Стипендия дочери', 10000, NULL, 2),
(6, 'Стажировка сына', 10000, '2017-08-31', 2),
(7, 'Проценты по вкладу в банке', 5000, '2017-12-30', 2),
(8, 'Пенсия папы по инвалидности', 10000, NULL, 2),
(9, 'Кредит iPhone 7 дочери', 2000, '2018-12-31', 1),
(10, 'Кредит XBox сына', 5000, '2017-07-31', 1),
(11, 'Продукты питания домой', 15000, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `household_budget_kind`
--

CREATE TABLE `household_budget_kind` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `household_budget_kind`
--

INSERT INTO `household_budget_kind` (`id`, `name`) VALUES
(1, 'Расход'),
(2, 'Доход');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Индексы таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Индексы таблицы `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Индексы таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Индексы таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Индексы таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Индексы таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Индексы таблицы `household_budget_estimate`
--
ALTER TABLE `household_budget_estimate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `household_budget_est_item_id_80709942_fk_household` (`item_id`);

--
-- Индексы таблицы `household_budget_item`
--
ALTER TABLE `household_budget_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `household_budget_ite_kind_id_2d179d8c_fk_household` (`kind_id`);

--
-- Индексы таблицы `household_budget_kind`
--
ALTER TABLE `household_budget_kind`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT для таблицы `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `household_budget_estimate`
--
ALTER TABLE `household_budget_estimate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `household_budget_item`
--
ALTER TABLE `household_budget_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `household_budget_kind`
--
ALTER TABLE `household_budget_kind`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `household_budget_estimate`
--
ALTER TABLE `household_budget_estimate`
  ADD CONSTRAINT `household_budget_est_item_id_80709942_fk_household` FOREIGN KEY (`item_id`) REFERENCES `household_budget_item` (`id`);

--
-- Ограничения внешнего ключа таблицы `household_budget_item`
--
ALTER TABLE `household_budget_item`
  ADD CONSTRAINT `household_budget_ite_kind_id_2d179d8c_fk_household` FOREIGN KEY (`kind_id`) REFERENCES `household_budget_kind` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
