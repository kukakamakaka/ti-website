-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:8889
-- Время создания: Янв 31 2025 г., 09:56
-- Версия сервера: 5.7.39
-- Версия PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `template-october`
--

-- --------------------------------------------------------

--
-- Структура таблицы `backend_access_log`
--

CREATE TABLE `backend_access_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_access_log`
--

INSERT INTO `backend_access_log` (`id`, `user_id`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 1, '185.215.160.200', '2021-04-22 23:42:41', '2021-04-22 23:42:41'),
(2, 1, '185.215.160.200', '2021-12-09 02:30:04', '2021-12-09 02:30:04'),
(3, 1, '185.215.160.200', '2022-03-16 21:02:58', '2022-03-16 21:02:58'),
(4, 1, '185.215.160.200', '2022-04-29 22:09:35', '2022-04-29 22:09:35'),
(5, 1, '127.0.0.1', '2023-12-13 08:23:06', '2023-12-13 08:23:06');

-- --------------------------------------------------------

--
-- Структура таблицы `backend_users`
--

CREATE TABLE `backend_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_users`
--

INSERT INTO `backend_users` (`id`, `first_name`, `last_name`, `login`, `email`, `password`, `activation_code`, `persist_code`, `reset_password_code`, `permissions`, `is_activated`, `role_id`, `activated_at`, `last_login`, `created_at`, `updated_at`, `deleted_at`, `is_superuser`) VALUES
(1, 'Zhalgas', 'Kabdulov', 'admin', 'zhalgas@abcdesign.kz', '$2a$12$49UdCaeuu5ZeCKx7TSdxLOHHS/W1geLRSUgZiRMZ4MRA76yfRQnCW', NULL, '$2y$10$EOXUOpHiPhAc463CxhDmXuTmHItloVpHap1XOQqF.Y2YMYKAVQWGq', NULL, '', 1, 2, NULL, '2023-12-13 08:23:06', '2021-04-22 23:38:12', '2023-12-13 08:29:20', NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `backend_users_groups`
--

CREATE TABLE `backend_users_groups` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_users_groups`
--

INSERT INTO `backend_users_groups` (`user_id`, `user_group_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `backend_user_groups`
--

CREATE TABLE `backend_user_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_user_groups`
--

INSERT INTO `backend_user_groups` (`id`, `name`, `created_at`, `updated_at`, `code`, `description`, `is_new_user_default`) VALUES
(1, 'Owners', '2021-04-22 23:38:12', '2021-04-22 23:38:12', 'owners', 'Default group for website owners.', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `backend_user_preferences`
--

CREATE TABLE `backend_user_preferences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_user_preferences`
--

INSERT INTO `backend_user_preferences` (`id`, `user_id`, `namespace`, `group`, `item`, `value`) VALUES
(1, 1, 'backend', 'backend', 'preferences', '{\"locale\":\"ru\",\"fallback_locale\":\"en\",\"timezone\":\"Asia\\/Almaty\",\"editor_font_size\":\"12\",\"editor_word_wrap\":\"fluid\",\"editor_code_folding\":\"markbegin\",\"editor_tab_size\":\"2\",\"editor_theme\":\"merbivore_soft\",\"editor_show_invisibles\":\"0\",\"editor_highlight_active_line\":\"1\",\"editor_use_hard_tabs\":\"1\",\"editor_show_gutter\":\"1\",\"editor_auto_closing\":\"1\",\"editor_autocompletion\":\"live\",\"editor_enable_snippets\":\"1\",\"editor_display_indent_guides\":\"1\",\"editor_show_print_margin\":\"1\",\"user_id\":1,\"rounded_avatar\":\"1\",\"topmenu_label\":\"0\",\"sidebar_description\":\"0\",\"sidebar_search\":\"0\",\"focus_searchfield\":\"0\",\"context_menu\":\"0\",\"virtual_keyboard\":\"0\"}'),
(2, 1, 'backend', 'reportwidgets', 'dashboard', '{\"welcome\":{\"class\":\"Backend\\\\ReportWidgets\\\\Welcome\",\"sortOrder\":50,\"configuration\":{\"ocWidgetWidth\":7}},\"systemStatus\":{\"class\":\"System\\\\ReportWidgets\\\\Status\",\"sortOrder\":60,\"configuration\":{\"ocWidgetWidth\":7}},\"report_container_dashboard_3\":{\"class\":\"Romanov\\\\ClearCacheWidget\\\\ReportWidgets\\\\ClearCache\",\"configuration\":{\"title\":\"romanov.clearcachewidget::lang.plugin.label\",\"radius\":\"200\",\"delthumbs\":false,\"ocWidgetWidth\":\"5\"},\"sortOrder\":61}}');

-- --------------------------------------------------------

--
-- Структура таблицы `backend_user_roles`
--

CREATE TABLE `backend_user_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_user_roles`
--

INSERT INTO `backend_user_roles` (`id`, `name`, `code`, `description`, `permissions`, `is_system`, `created_at`, `updated_at`) VALUES
(1, 'Publisher', 'publisher', 'Site editor with access to publishing tools.', '', 1, '2021-04-22 23:38:12', '2021-04-22 23:38:12'),
(2, 'Developer', 'developer', 'Site administrator with access to developer tools.', '', 1, '2021-04-22 23:38:12', '2021-04-22 23:38:12');

-- --------------------------------------------------------

--
-- Структура таблицы `backend_user_throttle`
--

CREATE TABLE `backend_user_throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `backend_user_throttle`
--

INSERT INTO `backend_user_throttle` (`id`, `user_id`, `ip_address`, `attempts`, `last_attempt_at`, `is_suspended`, `suspended_at`, `is_banned`, `banned_at`) VALUES
(1, 1, '185.215.160.200', 0, NULL, 0, NULL, 0, NULL),
(2, 1, '127.0.0.1', 0, NULL, 0, NULL, 0, NULL),
(3, 1, '::1', 0, NULL, 0, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_theme_data`
--

CREATE TABLE `cms_theme_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_theme_logs`
--

CREATE TABLE `cms_theme_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `old_content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cms_theme_templates`
--

CREATE TABLE `cms_theme_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int(10) UNSIGNED NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `deferred_bindings`
--

CREATE TABLE `deferred_bindings` (
  `id` int(10) UNSIGNED NOT NULL,
  `master_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `master_field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci,
  `failed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `indikator_backend_trash`
--

CREATE TABLE `indikator_backend_trash` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `lovata_buddies_addition_properties`
--

CREATE TABLE `lovata_buddies_addition_properties` (
  `id` int(10) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'input',
  `settings` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `lovata_buddies_groups`
--

CREATE TABLE `lovata_buddies_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `lovata_buddies_socialite_tokens`
--

CREATE TABLE `lovata_buddies_socialite_tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `external_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `lovata_buddies_throttle`
--

CREATE TABLE `lovata_buddies_throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT '0',
  `banned_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `lovata_buddies_users`
--

CREATE TABLE `lovata_buddies_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci,
  `phone_short` text COLLATE utf8mb4_unicode_ci,
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT '0',
  `property` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `vdomah_role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `lovata_buddies_users_groups`
--

CREATE TABLE `lovata_buddies_users_groups` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `martin_forms_records`
--

CREATE TABLE `martin_forms_records` (
  `id` int(10) UNSIGNED NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '(Empty)',
  `form_data` text COLLATE utf8mb4_unicode_ci,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_10_01_000001_Db_Deferred_Bindings', 1),
(2, '2013_10_01_000002_Db_System_Files', 1),
(3, '2013_10_01_000003_Db_System_Plugin_Versions', 1),
(4, '2013_10_01_000004_Db_System_Plugin_History', 1),
(5, '2013_10_01_000005_Db_System_Settings', 1),
(6, '2013_10_01_000006_Db_System_Parameters', 1),
(7, '2013_10_01_000007_Db_System_Add_Disabled_Flag', 1),
(8, '2013_10_01_000008_Db_System_Mail_Templates', 1),
(9, '2013_10_01_000009_Db_System_Mail_Layouts', 1),
(10, '2014_10_01_000010_Db_Jobs', 1),
(11, '2014_10_01_000011_Db_System_Event_Logs', 1),
(12, '2014_10_01_000012_Db_System_Request_Logs', 1),
(13, '2014_10_01_000013_Db_System_Sessions', 1),
(14, '2015_10_01_000014_Db_System_Mail_Layout_Rename', 1),
(15, '2015_10_01_000015_Db_System_Add_Frozen_Flag', 1),
(16, '2015_10_01_000016_Db_Cache', 1),
(17, '2015_10_01_000017_Db_System_Revisions', 1),
(18, '2015_10_01_000018_Db_FailedJobs', 1),
(19, '2016_10_01_000019_Db_System_Plugin_History_Detail_Text', 1),
(20, '2016_10_01_000020_Db_System_Timestamp_Fix', 1),
(21, '2017_08_04_121309_Db_Deferred_Bindings_Add_Index_Session', 1),
(22, '2017_10_01_000021_Db_System_Sessions_Update', 1),
(23, '2017_10_01_000022_Db_Jobs_FailedJobs_Update', 1),
(24, '2017_10_01_000023_Db_System_Mail_Partials', 1),
(25, '2017_10_23_000024_Db_System_Mail_Layouts_Add_Options_Field', 1),
(26, '2013_10_01_000001_Db_Backend_Users', 2),
(27, '2013_10_01_000002_Db_Backend_User_Groups', 2),
(28, '2013_10_01_000003_Db_Backend_Users_Groups', 2),
(29, '2013_10_01_000004_Db_Backend_User_Throttle', 2),
(30, '2014_01_04_000005_Db_Backend_User_Preferences', 2),
(31, '2014_10_01_000006_Db_Backend_Access_Log', 2),
(32, '2014_10_01_000007_Db_Backend_Add_Description_Field', 2),
(33, '2015_10_01_000008_Db_Backend_Add_Superuser_Flag', 2),
(34, '2016_10_01_000009_Db_Backend_Timestamp_Fix', 2),
(35, '2017_10_01_000010_Db_Backend_User_Roles', 2),
(36, '2018_12_16_000011_Db_Backend_Add_Deleted_At', 2),
(37, '2014_10_01_000001_Db_Cms_Theme_Data', 3),
(38, '2016_10_01_000002_Db_Cms_Timestamp_Fix', 3),
(39, '2017_10_01_000003_Db_Cms_Theme_Logs', 3),
(40, '2018_11_01_000001_Db_Cms_Theme_Templates', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `offline_sitesearch_query_logs`
--

CREATE TABLE `offline_sitesearch_query_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `query` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useragent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `rainlab_blog_categories`
--

CREATE TABLE `rainlab_blog_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `rainlab_blog_categories`
--

INSERT INTO `rainlab_blog_categories` (`id`, `name`, `slug`, `code`, `description`, `parent_id`, `nest_left`, `nest_right`, `nest_depth`, `created_at`, `updated_at`) VALUES
(1, 'Без категории', 'uncategorized', NULL, NULL, NULL, 1, 2, 0, '2021-04-22 23:45:30', '2021-04-22 23:45:30');

-- --------------------------------------------------------

--
-- Структура таблицы `rainlab_blog_posts`
--

CREATE TABLE `rainlab_blog_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `content_html` longtext COLLATE utf8mb4_unicode_ci,
  `published_at` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_keywords` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canonical_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `robot_index` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `robot_follow` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `rainlab_blog_posts_categories`
--

CREATE TABLE `rainlab_blog_posts_categories` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `rainlab_sitemap_definitions`
--

CREATE TABLE `rainlab_sitemap_definitions` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `rainlab_translate_attributes`
--

CREATE TABLE `rainlab_translate_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_data` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `rainlab_translate_attributes`
--

INSERT INTO `rainlab_translate_attributes` (`id`, `locale`, `model_id`, `model_type`, `attribute_data`) VALUES
(1, 'kz', '1', 'Zhalgas\\Catalog\\Models\\Category', '{\"title\":\"\"}'),
(2, 'kz', '2', 'Zhalgas\\Catalog\\Models\\Category', '{\"title\":\"\"}'),
(3, 'kz', '3', 'Zhalgas\\Catalog\\Models\\Category', '{\"title\":\"\"}'),
(4, 'kz', '4', 'Zhalgas\\Catalog\\Models\\Category', '{\"title\":\"\"}'),
(5, 'kz', '5', 'Zhalgas\\Catalog\\Models\\Category', '{\"title\":\"\"}'),
(6, 'kz', '6', 'Zhalgas\\Catalog\\Models\\Category', '{\"title\":\"\"}'),
(7, 'kz', '7', 'Zhalgas\\Catalog\\Models\\Category', '{\"title\":\"\"}'),
(8, 'kz', '1', 'Zhalgas\\Catalog\\Models\\Product', '{\"title\":\"\",\"excerpt\":\"\",\"items\":null,\"desc_items\":null}');

-- --------------------------------------------------------

--
-- Структура таблицы `rainlab_translate_indexes`
--

CREATE TABLE `rainlab_translate_indexes` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `rainlab_translate_locales`
--

CREATE TABLE `rainlab_translate_locales` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `rainlab_translate_locales`
--

INSERT INTO `rainlab_translate_locales` (`id`, `code`, `name`, `is_default`, `is_enabled`, `sort_order`) VALUES
(1, 'ru', 'Rus', 1, 1, 2),
(2, 'kz', 'Kaz', 0, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `rainlab_translate_messages`
--

CREATE TABLE `rainlab_translate_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(384) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `found` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `rainlab_translate_messages`
--

INSERT INTO `rainlab_translate_messages` (`id`, `code`, `message_data`, `found`) VALUES
(1, 'поиск.по.сайту', '{\"x\":\"\\u041f\\u043e\\u0438\\u0441\\u043a \\u043f\\u043e \\u0441\\u0430\\u0439\\u0442\\u0443\"}', NULL),
(2, 'каталог.товаров', '{\"x\":\"\\u041a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433 \\u0442\\u043e\\u0432\\u0430\\u0440\\u043e\\u0432\"}', NULL),
(3, 'где.купить', '{\"x\":\"\\u0413\\u0434\\u0435 \\u043a\\u0443\\u043f\\u0438\\u0442\\u044c\"}', NULL),
(4, 'будни.бренда', '{\"x\":\"\\u0411\\u0443\\u0434\\u043d\\u0438 \\u0431\\u0440\\u0435\\u043d\\u0434\\u0430\"}', NULL),
(5, 'о.нас', '{\"x\":\"\\u041e \\u043d\\u0430\\u0441\"}', NULL),
(6, 'главная', '{\"x\":\"\\u0413\\u043b\\u0430\\u0432\\u043d\\u0430\\u044f\"}', NULL),
(7, 'каталог', '{\"x\":\"\\u043a\\u0430\\u0442\\u0430\\u043b\\u043e\\u0433\"}', NULL),
(8, 'навигация', '{\"x\":\"\\u043d\\u0430\\u0432\\u0438\\u0433\\u0430\\u0446\\u0438\\u044f\"}', NULL),
(9, 'о.компании', '{\"x\":\"\\u041e \\u043a\\u043e\\u043c\\u043f\\u0430\\u043d\\u0438\\u0438\"}', NULL),
(10, 'разработано.в', '{\"x\":\"\\u0420\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u043d\\u043e \\u0432\"}', NULL),
(11, 'создание.сайтов.в.астане', '{\"x\":\"- \\u0441\\u043e\\u0437\\u0434\\u0430\\u043d\\u0438\\u0435 \\u0441\\u0430\\u0439\\u0442\\u043e\\u0432 \\u0432 \\u0410\\u0441\\u0442\\u0430\\u043d\\u0435\"}', NULL),
(12, 'алтайские.травы', '{\"x\":\"\\u0410\\u043b\\u0442\\u0430\\u0439\\u0441\\u043a\\u0438\\u0435 \\u0442\\u0440\\u0430\\u0432\\u044b\"}', NULL),
(13, 'мини.описание.это.текст.о.компании.он.необходим.для.дальнейшего.продвижения.вашего.сайта.вам.будет.необходимо.предоставить.исходные.данные.по.которым.наши.копирайтеры.составят.правильный.текст', '{\"x\":\"\\u041c\\u0438\\u043d\\u0438-\\u043e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435. \\u042d\\u0442\\u043e \\u0442\\u0435\\u043a\\u0441\\u0442 \\u043e \\u043a\\u043e\\u043c\\u043f\\u0430\\u043d\\u0438\\u0438. \\u041e\\u043d \\u043d\\u0435\\u043e\\u0431\\u0445\\u043e\\u0434\\u0438\\u043c \\n\\u0434\\u043b\\u044f \\u0434\\u0430\\u043b\\u044c\\u043d\\u0435\\u0439\\u0448\\u0435\\u0433\\u043e \\u043f\\u0440\\u043e\\u0434\\u0432\\u0438\\u0436\\u0435\\u043d\\u0438\\u044f \\u0412\\u0430\\u0448\\u0435\\u0433\\u043e \\u0441\\u0430\\u0439\\u0442\\u0430. \\u0412\\u0430\\u043c \\n\\u0431\\u0443\\u0434\\u0435\\u0442 \\u043d\\u0435\\u043e\\u0431\\u0445\\u043e\\u0434\\u0438\\u043c\\u043e \\u043f\\u0440\\u0435\\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u0438\\u0442\\u044c \\u0438\\u0441\\u0445\\u043e\\u0434\\u043d\\u044b\\u0435 \\u0434\\u0430\\u043d\\u043d\\u044b\\u0435, \\n\\u043f\\u043e \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u043c \\u043d\\u0430\\u0448\\u0438 \\u043a\\u043e\\u043f\\u0438\\u0440\\u0430\\u0439\\u0442\\u0435\\u0440\\u044b \\u0441\\u043e\\u0441\\u0442\\u0430\\u0432\\u044f\\u0442 \\u043f\\u0440\\u0430\\u0432\\u0438\\u043b\\u044c\\u043d\\u044b\\u0439 \\u0442\\u0435\\u043a\\u0441\\u0442.\"}', NULL),
(14, 'подробнее', '{\"x\":\"\\u041f\\u043e\\u0434\\u0440\\u043e\\u0431\\u043d\\u0435\\u0435\"}', NULL),
(15, 'разработано.экспертами.в.области.питания', '{\"x\":\"\\u0420\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u043d\\u043e \\u044d\\u043a\\u0441\\u043f\\u0435\\u0440\\u0442\\u0430\\u043c\\u0438 \\u0432 \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u0438 \\u043f\\u0438\\u0442\\u0430\\u043d\\u0438\\u044f\"}', NULL),
(16, 'натуральные.ингредиенты.овощи.фрукты.и.целебные.травы', '{\"x\":\"\\u041d\\u0430\\u0442\\u0443\\u0440\\u0430\\u043b\\u044c\\u043d\\u044b\\u0435 \\u0438\\u043d\\u0433\\u0440\\u0435\\u0434\\u0438\\u0435\\u043d\\u0442\\u044b: \\u043e\\u0432\\u043e\\u0449\\u0438, \\u0444\\u0440\\u0443\\u043a\\u0442\\u044b \\u0438 \\u0446\\u0435\\u043b\\u0435\\u0431\\u043d\\u044b\\u0435 \\u0442\\u0440\\u0430\\u0432\\u044b\"}', NULL),
(17, 'эффективность.применения.доказана.25.летним.опытом', '{\"x\":\"\\u042d\\u0444\\u0444\\u0435\\u043a\\u0442\\u0438\\u0432\\u043d\\u043e\\u0441\\u0442\\u044c \\u043f\\u0440\\u0438\\u043c\\u0435\\u043d\\u0435\\u043d\\u0438\\u044f \\u0434\\u043e\\u043a\\u0430\\u0437\\u0430\\u043d\\u0430 25-\\u043b\\u0435\\u0442\\u043d\\u0438\\u043c \\u043e\\u043f\\u044b\\u0442\\u043e\\u043c\"}', NULL),
(18, 'разработано.экспертами.в.областиnbspпитания', '{\"x\":\"\\u0420\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u043d\\u043e \\u044d\\u043a\\u0441\\u043f\\u0435\\u0440\\u0442\\u0430\\u043c\\u0438 \\u0432 \\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u0438&nbsp;\\u043f\\u0438\\u0442\\u0430\\u043d\\u0438\\u044f\"}', NULL),
(19, 'разработано.экспертами.вnbspобластиnbspпитания', '{\"x\":\"\\u0420\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u0430\\u043d\\u043e \\u044d\\u043a\\u0441\\u043f\\u0435\\u0440\\u0442\\u0430\\u043c\\u0438 \\u0432&nbsp;\\u043e\\u0431\\u043b\\u0430\\u0441\\u0442\\u0438&nbsp;\\u043f\\u0438\\u0442\\u0430\\u043d\\u0438\\u044f\"}', NULL),
(20, 'эффективность.применения.доказанаnbsp25.летним.опытом', '{\"x\":\"\\u042d\\u0444\\u0444\\u0435\\u043a\\u0442\\u0438\\u0432\\u043d\\u043e\\u0441\\u0442\\u044c \\u043f\\u0440\\u0438\\u043c\\u0435\\u043d\\u0435\\u043d\\u0438\\u044f \\u0434\\u043e\\u043a\\u0430\\u0437\\u0430\\u043d\\u0430&nbsp;25-\\u043b\\u0435\\u0442\\u043d\\u0438\\u043c \\u043e\\u043f\\u044b\\u0442\\u043e\\u043c\"}', NULL),
(21, 'наша.продукция', '{\"x\":\"\\u041d\\u0430\\u0448\\u0430 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u044f\"}', NULL),
(22, 'лидеры.продаж.и.новинки', '{\"x\":\"\\u041b\\u0438\\u0434\\u0435\\u0440\\u044b \\u043f\\u0440\\u043e\\u0434\\u0430\\u0436 \\u0438 \\u043d\\u043e\\u0432\\u0438\\u043d\\u043a\\u0438\"}', NULL),
(23, '', '{\"x\":\"\"}', NULL),
(24, 'смотреть.все', '{\"x\":\"\\u0421\\u041c\\u041e\\u0422\\u0420\\u0415\\u0422\\u042c \\u0412\\u0421\\u0415\"}', NULL),
(25, 'купить.у.партнеров', '{\"x\":\"\\u041a\\u0443\\u043f\\u0438\\u0442\\u044c \\u0443 \\u043f\\u0430\\u0440\\u0442\\u043d\\u0435\\u0440\\u043e\\u0432\"}', NULL),
(26, 'подпишитесь.на.нашу.еженедельную.рассылку', '{\"x\":\"\\u041f\\u043e\\u0434\\u043f\\u0438\\u0448\\u0438\\u0442\\u0435\\u0441\\u044c \\u043d\\u0430 \\u043d\\u0430\\u0448\\u0443 \\u0435\\u0436\\u0435\\u043d\\u0435\\u0434\\u0435\\u043b\\u044c\\u043d\\u0443\\u044e \\u0440\\u0430\\u0441\\u0441\\u044b\\u043b\\u043a\\u0443!\"}', NULL),
(27, 'будьте.в.курсе.всех.новостей.алтайских.трав', '{\"x\":\"\\u0411\\u0443\\u0434\\u044c\\u0442\\u0435 \\u0432 \\u043a\\u0443\\u0440\\u0441\\u0435 \\u0432\\u0441\\u0435\\u0445 \\u043d\\u043e\\u0432\\u043e\\u0441\\u0442\\u0435\\u0439 \\u0410\\u043b\\u0442\\u0430\\u0439\\u0441\\u043a\\u0438\\u0445 \\u0442\\u0440\\u0430\\u0432!\"}', NULL),
(28, 'введите.вашу.почту', '{\"x\":\"\\u0412\\u0432\\u0435\\u0434\\u0438\\u0442\\u0435 \\u0432\\u0430\\u0448\\u0443 \\u043f\\u043e\\u0447\\u0442\\u0443\"}', NULL),
(29, 'отправить', '{\"x\":\"\\u041e\\u0442\\u043f\\u0440\\u0430\\u0432\\u0438\\u0442\\u044c\"}', NULL),
(30, 'назад', '{\"x\":\"\\u041d\\u0430\\u0437\\u0430\\u0434\"}', NULL),
(31, 'цены.уточняйте.в.магазинах.партнеров', '{\"x\":\"\\u0426\\u0435\\u043d\\u044b \\u0443\\u0442\\u043e\\u0447\\u043d\\u044f\\u0439\\u0442\\u0435 \\u0432 \\u043c\\u0430\\u0433\\u0430\\u0437\\u0438\\u043d\\u0430\\u0445 \\u043f\\u0430\\u0440\\u0442\\u043d\\u0435\\u0440\\u043e\\u0432:\"}', NULL),
(32, 'о.продукте', '{\"x\":\"\\u041e \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0435\"}', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `renatio_dynamicpdf_pdf_layouts`
--

CREATE TABLE `renatio_dynamicpdf_pdf_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_css` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `renatio_dynamicpdf_pdf_templates`
--

CREATE TABLE `renatio_dynamicpdf_pdf_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `layout_id` int(10) UNSIGNED DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orientation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `last_activity` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_event_logs`
--

CREATE TABLE `system_event_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `details` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_event_logs`
--

INSERT INTO `system_event_logs` (`id`, `level`, `message`, `details`, `created_at`, `updated_at`) VALUES
(1, 'error', 'Symfony\\Component\\Debug\\Exception\\FatalThrowableError: Call to a member function getFileName() on null in /home/abctask/domeny/bolashak.abc-task.kz/modules/cms/classes/Controller.php:1362\nStack trace:\n#0 /home/abctask/domeny/bolashak.abc-task.kz/modules/cms/classes/Controller.php(1329): Cms\\Classes\\Controller->currentPageUrl(Array, true)\n#1 /home/abctask/domeny/bolashak.abc-task.kz/modules/cms/classes/Page.php(130): Cms\\Classes\\Controller->pageUrl(NULL, Array, true)\n#2 /home/abctask/domeny/bolashak.abc-task.kz/plugins/mohsin/txt/routes.php(10): Cms\\Classes\\Page::url(NULL)\n#3 /home/abctask/domeny/bolashak.abc-task.kz/vendor/laravel/framework/src/Illuminate/Routing/Route.php(198): System\\Classes\\PluginManager->{closure}()\n#4 /home/abctask/domeny/bolashak.abc-task.kz/vendor/laravel/framework/src/Illuminate/Routing/Route.php(172): Illuminate\\Routing\\Route->runCallable()\n#5 /home/abctask/domeny/bolashak.abc-task.kz/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#6 /home/abctask/domeny/bolashak.abc-task.kz/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#7 /home/abctask/domeny/bolashak.abc-task.kz/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#8 /home/abctask/domeny/bolashak.abc-task.kz/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#9 /home/abctask/domeny/bolashak.abc-task.kz/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#10 /home/abctask/domeny/bolashak.abc-task.kz/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#11 /home/abctask/domeny/bolashak.abc-task.kz/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#12 /home/abctask/domeny/bolashak.abc-task.kz/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#13 /home/abctask/domeny/bolashak.abc-task.kz/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#14 /home/abctask/domeny/bolashak.abc-task.kz/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#15 /home/abctask/domeny/bolashak.abc-task.kz/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#16 /home/abctask/domeny/bolashak.abc-task.kz/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 /home/abctask/domeny/bolashak.abc-task.kz/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /home/abctask/domeny/bolashak.abc-task.kz/vendor/october/rain/src/Http/Middleware/TrustHosts.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 /home/abctask/domeny/bolashak.abc-task.kz/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): October\\Rain\\Http\\Middleware\\TrustHosts->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 /home/abctask/domeny/bolashak.abc-task.kz/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 /home/abctask/domeny/bolashak.abc-task.kz/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /home/abctask/domeny/bolashak.abc-task.kz/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 /home/abctask/domeny/bolashak.abc-task.kz/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#24 /home/abctask/domeny/bolashak.abc-task.kz/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#25 {main}', NULL, '2021-12-09 02:28:04', '2021-12-09 02:28:04'),
(2, 'error', 'ErrorException: Undefined property: October\\Rain\\Database\\Builder::$slug in /Applications/MAMP/htdocs/altai/storage/cms/cache/83/f7/catalog.htm.php:13\nStack trace:\n#0 /Applications/MAMP/htdocs/altai/storage/cms/cache/83/f7/catalog.htm.php(13): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Undefined prope...\', \'/Applications/M...\', 13, Array)\n#1 /Applications/MAMP/htdocs/altai/modules/cms/Classes/Controller.php(500): Cms6784004a2a817572539349_82b312de0a36419f710c7f80cc7ca8b2Class->onStart()\n#2 /Applications/MAMP/htdocs/altai/modules/cms/Classes/Controller.php(394): Cms\\Classes\\Controller->execPageCycle()\n#3 /Applications/MAMP/htdocs/altai/modules/cms/Classes/Controller.php(225): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 /Applications/MAMP/htdocs/altai/modules/cms/Classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'catalog/podderz...\')\n#5 [internal function]: Cms\\Classes\\CmsController->run(\'catalog/podderz...\')\n#6 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#7 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#8 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#9 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#10 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#11 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#12 /Applications/MAMP/htdocs/altai/plugins/rainlab/translate/classes/LocaleMiddleware.php(29): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#13 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): RainLab\\Translate\\Classes\\LocaleMiddleware->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#14 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#15 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#16 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(68): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#33 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#34 /Applications/MAMP/htdocs/altai/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#35 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#36 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /Applications/MAMP/htdocs/altai/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 /Applications/MAMP/htdocs/altai/vendor/october/rain/src/Http/Middleware/TrustHosts.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#42 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): October\\Rain\\Http\\Middleware\\TrustHosts->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#45 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#46 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#47 /Applications/MAMP/htdocs/altai/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#48 {main}', NULL, '2025-01-12 12:50:23', '2025-01-12 12:50:23'),
(3, 'error', 'ErrorException: Undefined property: October\\Rain\\Database\\Builder::$slug in /Applications/MAMP/htdocs/altai/storage/cms/cache/83/f7/catalog.htm.php:13\nStack trace:\n#0 /Applications/MAMP/htdocs/altai/storage/cms/cache/83/f7/catalog.htm.php(13): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Undefined prope...\', \'/Applications/M...\', 13, Array)\n#1 /Applications/MAMP/htdocs/altai/modules/cms/Classes/Controller.php(500): Cms6784004a2a817572539349_82b312de0a36419f710c7f80cc7ca8b2Class->onStart()\n#2 /Applications/MAMP/htdocs/altai/modules/cms/Classes/Controller.php(394): Cms\\Classes\\Controller->execPageCycle()\n#3 /Applications/MAMP/htdocs/altai/modules/cms/Classes/Controller.php(225): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 /Applications/MAMP/htdocs/altai/modules/cms/Classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'catalog/podderz...\')\n#5 [internal function]: Cms\\Classes\\CmsController->run(\'catalog/podderz...\')\n#6 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#7 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#8 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#9 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#10 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#11 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#12 /Applications/MAMP/htdocs/altai/plugins/rainlab/translate/classes/LocaleMiddleware.php(29): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#13 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): RainLab\\Translate\\Classes\\LocaleMiddleware->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#14 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#15 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#16 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(68): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#33 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#34 /Applications/MAMP/htdocs/altai/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#35 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#36 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /Applications/MAMP/htdocs/altai/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 /Applications/MAMP/htdocs/altai/vendor/october/rain/src/Http/Middleware/TrustHosts.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#42 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): October\\Rain\\Http\\Middleware\\TrustHosts->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#45 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#46 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#47 /Applications/MAMP/htdocs/altai/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#48 {main}', NULL, '2025-01-12 12:50:23', '2025-01-12 12:50:23'),
(4, 'error', 'ErrorException: Undefined property: October\\Rain\\Database\\Builder::$id in /Applications/MAMP/htdocs/altai/storage/cms/cache/83/f7/catalog.htm.php:13\nStack trace:\n#0 /Applications/MAMP/htdocs/altai/storage/cms/cache/83/f7/catalog.htm.php(13): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Undefined prope...\', \'/Applications/M...\', 13, Array)\n#1 /Applications/MAMP/htdocs/altai/modules/cms/Classes/Controller.php(500): Cms67841348125f3089688549_4e503499de3d02580527d2d86f35394aClass->onStart()\n#2 /Applications/MAMP/htdocs/altai/modules/cms/Classes/Controller.php(394): Cms\\Classes\\Controller->execPageCycle()\n#3 /Applications/MAMP/htdocs/altai/modules/cms/Classes/Controller.php(225): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 /Applications/MAMP/htdocs/altai/modules/cms/Classes/CmsController.php(50): Cms\\Classes\\Controller->run(\'catalog/podderz...\')\n#5 [internal function]: Cms\\Classes\\CmsController->run(\'catalog/podderz...\')\n#6 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Controller.php(54): call_user_func_array(Array, Array)\n#7 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#8 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#9 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Route.php(169): Illuminate\\Routing\\Route->runController()\n#10 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Router.php(658): Illuminate\\Routing\\Route->run()\n#11 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#12 /Applications/MAMP/htdocs/altai/plugins/rainlab/translate/classes/LocaleMiddleware.php(29): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#13 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): RainLab\\Translate\\Classes\\LocaleMiddleware->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#14 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#15 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Middleware/SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#16 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/View/Middleware/ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Cookie/Middleware/EncryptCookies.php(68): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#29 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#30 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#31 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#32 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#33 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#34 /Applications/MAMP/htdocs/altai/vendor/october/rain/src/Router/CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#35 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#36 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#37 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Foundation/Http/Middleware/CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#38 /Applications/MAMP/htdocs/altai/vendor/october/rain/src/Foundation/Http/Middleware/CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#39 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 /Applications/MAMP/htdocs/altai/vendor/october/rain/src/Http/Middleware/TrustHosts.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#42 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(149): October\\Rain\\Http\\Middleware\\TrustHosts->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#43 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Routing/Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#44 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#45 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#46 /Applications/MAMP/htdocs/altai/vendor/laravel/framework/src/Illuminate/Foundation/Http/Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#47 /Applications/MAMP/htdocs/altai/index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#48 {main}', NULL, '2025-01-12 14:08:58', '2025-01-12 14:08:58');

-- --------------------------------------------------------

--
-- Структура таблицы `system_files`
--

CREATE TABLE `system_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `disk_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_files`
--

INSERT INTO `system_files` (`id`, `disk_name`, `file_name`, `file_size`, `content_type`, `title`, `description`, `field`, `attachment_id`, `attachment_type`, `is_public`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, '675a945d6dde3819149983.jpg', '5bd84528fcf88b38bcb49e0d0f5ee539.jpg', 10596, 'image/jpeg', NULL, NULL, 'avatar', '1', 'Backend\\Models\\User', 1, 1, '2024-12-12 02:44:29', '2024-12-12 02:44:31');

-- --------------------------------------------------------

--
-- Структура таблицы `system_mail_layouts`
--

CREATE TABLE `system_mail_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `content_css` text COLLATE utf8mb4_unicode_ci,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_mail_layouts`
--

INSERT INTO `system_mail_layouts` (`id`, `name`, `code`, `content_html`, `content_text`, `content_css`, `is_locked`, `options`, `created_at`, `updated_at`) VALUES
(1, 'Default layout', 'default', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-default\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n\n        <!-- Header -->\n        {% partial \'header\' body %}\n            {{ subject|raw }}\n        {% endpartial %}\n\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n\n        <!-- Footer -->\n        {% partial \'footer\' body %}\n            &copy; {{ \"now\"|date(\"Y\") }} {{ appName }}. All rights reserved.\n        {% endpartial %}\n\n    </table>\n\n</body>\n</html>', '{{ content|raw }}', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2021-04-22 23:38:12', '2021-04-22 23:38:12'),
(2, 'System layout', 'system', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-system\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n\n                                        <!-- Subcopy -->\n                                        {% partial \'subcopy\' body %}\n                                            **This is an automatic message. Please do not reply to it.**\n                                        {% endpartial %}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n    </table>\n\n</body>\n</html>', '{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.', '@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}', 1, NULL, '2021-04-22 23:38:12', '2021-04-22 23:38:12');

-- --------------------------------------------------------

--
-- Структура таблицы `system_mail_partials`
--

CREATE TABLE `system_mail_partials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_mail_partials`
--

INSERT INTO `system_mail_partials` (`id`, `name`, `code`, `content_html`, `content_text`, `is_custom`, `created_at`, `updated_at`) VALUES
(1, 'Header', 'header', '<tr>\n    <td class=\"header\">\n        {% if url %}\n            <a href=\"{{ url }}\">\n                {{ body }}\n            </a>\n        {% else %}\n            <span>\n                {{ body }}\n            </span>\n        {% endif %}\n    </td>\n</tr>', '*** {{ body|trim }} <{{ url }}>', 0, '2023-12-13 08:31:57', '2023-12-13 08:31:57'),
(2, 'Footer', 'footer', '<tr>\n    <td>\n        <table class=\"footer\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n            <tr>\n                <td class=\"content-cell\" align=\"center\">\n                    {{ body|md_safe }}\n                </td>\n            </tr>\n        </table>\n    </td>\n</tr>', '-------------------\n{{ body|trim }}', 0, '2023-12-13 08:31:57', '2023-12-13 08:31:57'),
(3, 'Button', 'button', '<table class=\"action\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n    <tr>\n        <td align=\"center\">\n            <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n                <tr>\n                    <td align=\"center\">\n                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\n                            <tr>\n                                <td>\n                                    <a href=\"{{ url }}\" class=\"button button-{{ type ?: \'primary\' }}\" target=\"_blank\">\n                                        {{ body }}\n                                    </a>\n                                </td>\n                            </tr>\n                        </table>\n                    </td>\n                </tr>\n            </table>\n        </td>\n    </tr>\n</table>', '{{ body|trim }} <{{ url }}>', 0, '2023-12-13 08:31:57', '2023-12-13 08:31:57'),
(4, 'Panel', 'panel', '<table class=\"panel break-all\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n    <tr>\n        <td class=\"panel-content\">\n            <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                <tr>\n                    <td class=\"panel-item\">\n                        {{ body|md_safe }}\n                    </td>\n                </tr>\n            </table>\n        </td>\n    </tr>\n</table>', '{{ body|trim }}', 0, '2023-12-13 08:31:57', '2023-12-13 08:31:57'),
(5, 'Table', 'table', '<div class=\"table\">\n    {{ body|md_safe }}\n</div>', '{{ body|trim }}', 0, '2023-12-13 08:31:57', '2023-12-13 08:31:57'),
(6, 'Subcopy', 'subcopy', '<table class=\"subcopy\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n    <tr>\n        <td>\n            {{ body|md_safe }}\n        </td>\n    </tr>\n</table>', '-----\n{{ body|trim }}', 0, '2023-12-13 08:31:57', '2023-12-13 08:31:57'),
(7, 'Promotion', 'promotion', '<table class=\"promotion break-all\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n    <tr>\n        <td align=\"center\">\n            {{ body|md_safe }}\n        </td>\n    </tr>\n</table>', '{{ body|trim }}', 0, '2023-12-13 08:31:57', '2023-12-13 08:31:57');

-- --------------------------------------------------------

--
-- Структура таблицы `system_mail_templates`
--

CREATE TABLE `system_mail_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `content_text` text COLLATE utf8mb4_unicode_ci,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_mail_templates`
--

INSERT INTO `system_mail_templates` (`id`, `code`, `subject`, `description`, `content_html`, `content_text`, `layout_id`, `is_custom`, `created_at`, `updated_at`) VALUES
(1, 'martin.forms::mail.notification', NULL, NULL, NULL, NULL, 1, 0, '2023-12-13 08:31:57', '2023-12-13 08:31:57'),
(2, 'martin.forms::mail.autoresponse', NULL, NULL, NULL, NULL, 1, 0, '2023-12-13 08:31:57', '2023-12-13 08:31:57'),
(3, 'backend::mail.invite', NULL, 'Invite new admin to the site', NULL, NULL, 2, 0, '2023-12-13 08:31:57', '2023-12-13 08:31:57'),
(4, 'backend::mail.restore', NULL, 'Reset an admin password', NULL, NULL, 2, 0, '2023-12-13 08:31:57', '2023-12-13 08:31:57');

-- --------------------------------------------------------

--
-- Структура таблицы `system_parameters`
--

CREATE TABLE `system_parameters` (
  `id` int(10) UNSIGNED NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_parameters`
--

INSERT INTO `system_parameters` (`id`, `namespace`, `group`, `item`, `value`) VALUES
(1, 'system', 'update', 'count', '0'),
(2, 'system', 'core', 'hash', '\"6819ec80bb4951db1139f26ca9238dbd\"'),
(3, 'system', 'core', 'build', '\"476\"'),
(4, 'system', 'update', 'retry', '1737874474');

-- --------------------------------------------------------

--
-- Структура таблицы `system_plugin_history`
--

CREATE TABLE `system_plugin_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_plugin_history`
--

INSERT INTO `system_plugin_history` (`id`, `code`, `type`, `version`, `detail`, `created_at`) VALUES
(1, 'October.Demo', 'comment', '1.0.1', 'First version of Demo', '2021-04-22 23:38:12'),
(26, 'RainLab.Sitemap', 'comment', '1.0.1', 'First version of Sitemap', '2021-04-22 23:45:04'),
(27, 'RainLab.Sitemap', 'script', '1.0.2', 'create_definitions_table.php', '2021-04-22 23:45:04'),
(28, 'RainLab.Sitemap', 'comment', '1.0.2', 'Create definitions table', '2021-04-22 23:45:04'),
(29, 'RainLab.Sitemap', 'comment', '1.0.3', 'Minor improvements to the code.', '2021-04-22 23:45:04'),
(30, 'RainLab.Sitemap', 'comment', '1.0.4', 'Fixes issue where correct headers not being sent.', '2021-04-22 23:45:04'),
(31, 'RainLab.Sitemap', 'comment', '1.0.5', 'Minor back-end styling fix.', '2021-04-22 23:45:04'),
(32, 'RainLab.Sitemap', 'comment', '1.0.6', 'Minor fix to internal API.', '2021-04-22 23:45:04'),
(33, 'RainLab.Sitemap', 'comment', '1.0.7', 'Added access premissions.', '2021-04-22 23:45:04'),
(34, 'RainLab.Sitemap', 'comment', '1.0.8', 'Minor styling updates.', '2021-04-22 23:45:04'),
(35, 'RainLab.Sitemap', 'comment', '1.0.9', 'Replaced the 500 error with 404 when no definition is found. Added Czech translation. Improved Turkish, Hungarian and Portuguese (Brazil) translations.', '2021-04-22 23:45:04'),
(36, 'RainLab.Blog', 'script', '1.0.1', 'create_posts_table.php', '2021-04-22 23:45:30'),
(37, 'RainLab.Blog', 'script', '1.0.1', 'create_categories_table.php', '2021-04-22 23:45:30'),
(38, 'RainLab.Blog', 'script', '1.0.1', 'seed_all_tables.php', '2021-04-22 23:45:30'),
(39, 'RainLab.Blog', 'comment', '1.0.1', 'Initialize plugin.', '2021-04-22 23:45:30'),
(40, 'RainLab.Blog', 'comment', '1.0.2', 'Added the processed HTML content column to the posts table.', '2021-04-22 23:45:30'),
(41, 'RainLab.Blog', 'comment', '1.0.3', 'Category component has been merged with Posts component.', '2021-04-22 23:45:30'),
(42, 'RainLab.Blog', 'comment', '1.0.4', 'Improvements to the Posts list management UI.', '2021-04-22 23:45:30'),
(43, 'RainLab.Blog', 'comment', '1.0.5', 'Removes the Author column from blog post list.', '2021-04-22 23:45:30'),
(44, 'RainLab.Blog', 'comment', '1.0.6', 'Featured images now appear in the Post component.', '2021-04-22 23:45:30'),
(45, 'RainLab.Blog', 'comment', '1.0.7', 'Added support for the Static Pages menus.', '2021-04-22 23:45:30'),
(46, 'RainLab.Blog', 'comment', '1.0.8', 'Added total posts to category list.', '2021-04-22 23:45:30'),
(47, 'RainLab.Blog', 'comment', '1.0.9', 'Added support for the Sitemap plugin.', '2021-04-22 23:45:30'),
(48, 'RainLab.Blog', 'comment', '1.0.10', 'Added permission to prevent users from seeing posts they did not create.', '2021-04-22 23:45:30'),
(49, 'RainLab.Blog', 'comment', '1.0.11', 'Deprecate \"idParam\" component property in favour of \"slug\" property.', '2021-04-22 23:45:30'),
(50, 'RainLab.Blog', 'comment', '1.0.12', 'Fixes issue where images cannot be uploaded caused by latest Markdown library.', '2021-04-22 23:45:30'),
(51, 'RainLab.Blog', 'comment', '1.0.13', 'Fixes problem with providing pages to Sitemap and Pages plugins.', '2021-04-22 23:45:30'),
(52, 'RainLab.Blog', 'comment', '1.0.14', 'Add support for CSRF protection feature added to core.', '2021-04-22 23:45:30'),
(53, 'RainLab.Blog', 'comment', '1.1.0', 'Replaced the Post editor with the new core Markdown editor.', '2021-04-22 23:45:30'),
(54, 'RainLab.Blog', 'comment', '1.1.1', 'Posts can now be imported and exported.', '2021-04-22 23:45:30'),
(55, 'RainLab.Blog', 'comment', '1.1.2', 'Posts are no longer visible if the published date has not passed.', '2021-04-22 23:45:30'),
(56, 'RainLab.Blog', 'comment', '1.1.3', 'Added a New Post shortcut button to the blog menu.', '2021-04-22 23:45:30'),
(57, 'RainLab.Blog', 'script', '1.2.0', 'categories_add_nested_fields.php', '2021-04-22 23:45:30'),
(58, 'RainLab.Blog', 'comment', '1.2.0', 'Categories now support nesting.', '2021-04-22 23:45:30'),
(59, 'RainLab.Blog', 'comment', '1.2.1', 'Post slugs now must be unique.', '2021-04-22 23:45:30'),
(60, 'RainLab.Blog', 'comment', '1.2.2', 'Fixes issue on new installs.', '2021-04-22 23:45:30'),
(61, 'RainLab.Blog', 'comment', '1.2.3', 'Minor user interface update.', '2021-04-22 23:45:30'),
(62, 'RainLab.Blog', 'script', '1.2.4', 'update_timestamp_nullable.php', '2021-04-22 23:45:30'),
(63, 'RainLab.Blog', 'comment', '1.2.4', 'Database maintenance. Updated all timestamp columns to be nullable.', '2021-04-22 23:45:30'),
(64, 'RainLab.Blog', 'comment', '1.2.5', 'Added translation support for blog posts.', '2021-04-22 23:45:30'),
(65, 'RainLab.Blog', 'comment', '1.2.6', 'The published field can now supply a time with the date.', '2021-04-22 23:45:30'),
(66, 'RainLab.Blog', 'comment', '1.2.7', 'Introduced a new RSS feed component.', '2021-04-22 23:45:30'),
(67, 'RainLab.Blog', 'comment', '1.2.8', 'Fixes issue with translated `content_html` attribute on blog posts.', '2021-04-22 23:45:30'),
(68, 'RainLab.Blog', 'comment', '1.2.9', 'Added translation support for blog categories.', '2021-04-22 23:45:30'),
(69, 'RainLab.Blog', 'comment', '1.2.10', 'Added translation support for post slugs.', '2021-04-22 23:45:30'),
(70, 'RainLab.Blog', 'comment', '1.2.11', 'Fixes bug where excerpt is not translated.', '2021-04-22 23:45:30'),
(71, 'RainLab.Blog', 'comment', '1.2.12', 'Description field added to category form.', '2021-04-22 23:45:30'),
(72, 'RainLab.Blog', 'comment', '1.2.13', 'Improved support for Static Pages menus, added a blog post and all blog posts.', '2021-04-22 23:45:30'),
(73, 'RainLab.Blog', 'comment', '1.2.14', 'Added post exception property to the post list component, useful for showing related posts.', '2021-04-22 23:45:30'),
(74, 'RainLab.Blog', 'comment', '1.2.15', 'Back-end navigation sort order updated.', '2021-04-22 23:45:30'),
(75, 'RainLab.Blog', 'comment', '1.2.16', 'Added `nextPost` and `previousPost` to the blog post component.', '2021-04-22 23:45:30'),
(76, 'RainLab.Blog', 'comment', '1.2.17', 'Improved the next and previous logic to sort by the published date.', '2021-04-22 23:45:30'),
(77, 'RainLab.Blog', 'comment', '1.2.18', 'Minor change to internals.', '2021-04-22 23:45:30'),
(78, 'RainLab.Blog', 'comment', '1.2.19', 'Improved support for Build 420+', '2021-04-22 23:45:30'),
(79, 'RainLab.Blog', 'script', '1.3.0', 'posts_add_metadata.php', '2021-04-22 23:45:30'),
(80, 'RainLab.Blog', 'comment', '1.3.0', 'Added metadata column for plugins to store data in', '2021-04-22 23:45:30'),
(81, 'RainLab.Blog', 'comment', '1.3.1', 'Fixed metadata column not being jsonable', '2021-04-22 23:45:30'),
(82, 'RainLab.Blog', 'comment', '1.3.2', 'Allow custom slug name for components, add 404 handling for missing blog posts, allow exporting of blog images.', '2021-04-22 23:45:30'),
(83, 'RainLab.Blog', 'comment', '1.3.3', 'Fixed \'excluded categories\' filter from being run when value is empty.', '2021-04-22 23:45:30'),
(84, 'RainLab.Blog', 'comment', '1.3.4', 'Allow post author to be specified. Improved translations.', '2021-04-22 23:45:30'),
(85, 'RainLab.Blog', 'comment', '1.3.5', 'Fixed missing user info from breaking initial seeder in migrations. Fixed a PostgreSQL issue with blog exports.', '2021-04-22 23:45:30'),
(86, 'RainLab.Blog', 'comment', '1.3.6', 'Improved French translations.', '2021-04-22 23:45:30'),
(87, 'RainLab.Blog', 'comment', '1.4.0', 'Stability improvements. Rollback custom slug names for components', '2021-04-22 23:45:30'),
(88, 'RainLab.Blog', 'comment', '1.4.1', 'Fixes potential security issue with unsafe Markdown. Allow blog bylines to be translated.', '2021-04-22 23:45:30'),
(89, 'RainLab.Blog', 'comment', '1.4.2', 'Fix 404 redirects for missing blog posts. Assign current category to the listed posts when using the Posts component on a page with the category parameter available.', '2021-04-22 23:45:30'),
(90, 'RainLab.Blog', 'comment', '1.4.3', 'Fixes incompatibility with locale switching when plugin is used in conjunction with the Translate plugin. Fixes undefined category error.', '2021-04-22 23:45:30'),
(91, 'RainLab.Blog', 'comment', '1.4.4', 'Rollback translated bylines, please move or override the default component markup instead.', '2021-04-22 23:45:30'),
(92, 'RainLab.Blog', 'comment', '1.5.0', 'Implement support for October CMS v2.0', '2021-04-22 23:45:30'),
(120, 'Martin.Forms', 'script', '1.0.0', 'create_records_table.php', '2021-04-22 23:48:06'),
(121, 'Martin.Forms', 'comment', '1.0.0', 'First version of Magic Forms', '2021-04-22 23:48:06'),
(122, 'Martin.Forms', 'comment', '1.0.1', 'Added CSRF protection', '2021-04-22 23:48:06'),
(123, 'Martin.Forms', 'comment', '1.1.0', 'Added reCAPTCHA', '2021-04-22 23:48:06'),
(124, 'Martin.Forms', 'comment', '1.1.1', 'Fix when using reCAPTCHA + allowed fields', '2021-04-22 23:48:06'),
(125, 'Martin.Forms', 'script', '1.1.2', 'add_group_field.php', '2021-04-22 23:48:06'),
(126, 'Martin.Forms', 'comment', '1.1.2', 'Filter forms records', '2021-04-22 23:48:06'),
(127, 'Martin.Forms', 'comment', '1.1.2', 'Search inside stored data', '2021-04-22 23:48:06'),
(128, 'Martin.Forms', 'comment', '1.1.2', 'Organize your forms on custom groups', '2021-04-22 23:48:06'),
(129, 'Martin.Forms', 'comment', '1.2.0', 'Export stored data in CSV format', '2021-04-22 23:48:06'),
(130, 'Martin.Forms', 'comment', '1.2.1', 'Auto-response email on form submit', '2021-04-22 23:48:06'),
(131, 'Martin.Forms', 'comment', '1.2.1', 'Added Turkish language', '2021-04-22 23:48:06'),
(132, 'Martin.Forms', 'comment', '1.2.2', 'Override notifications and auto-response email subjects', '2021-04-22 23:48:06'),
(133, 'Martin.Forms', 'comment', '1.2.3', 'New option to reset form after successfully submit', '2021-04-22 23:48:06'),
(134, 'Martin.Forms', 'comment', '1.2.3', 'Fixed Empty AJAX Form template', '2021-04-22 23:48:06'),
(135, 'Martin.Forms', 'comment', '1.2.3', 'Support for Translate plugin', '2021-04-22 23:48:06'),
(136, 'Martin.Forms', 'comment', '1.2.3', 'Added plugin documentation', '2021-04-22 23:48:06'),
(137, 'Martin.Forms', 'comment', '1.2.4', 'Added detailed reCAPTCHA help', '2021-04-22 23:48:06'),
(138, 'Martin.Forms', 'comment', '1.3.0', 'AJAX file uploads', '2021-04-22 23:48:06'),
(139, 'Martin.Forms', 'comment', '1.3.1', 'Added lang pt-br', '2021-04-22 23:48:06'),
(140, 'Martin.Forms', 'comment', '1.3.2', 'Fixed multiples reCAPTCHAs on same page', '2021-04-22 23:48:06'),
(141, 'Martin.Forms', 'comment', '1.3.3', 'Fixed record detail page when form data contains an array', '2021-04-22 23:48:06'),
(142, 'Martin.Forms', 'comment', '1.3.3', 'Updated documentations', '2021-04-22 23:48:06'),
(143, 'Martin.Forms', 'comment', '1.3.4', 'New \"Anonymize IP\" option', '2021-04-22 23:48:06'),
(144, 'Martin.Forms', 'comment', '1.3.5', 'New option \"Redirect on successful submit\"', '2021-04-22 23:48:06'),
(145, 'Martin.Forms', 'comment', '1.3.6', 'French translation', '2021-04-22 23:48:06'),
(146, 'Martin.Forms', 'comment', '1.3.6', 'Support Translate plugin on reCAPTCHA', '2021-04-22 23:48:06'),
(147, 'Martin.Forms', 'comment', '1.3.6', 'reCAPTCHA validation enhancements', '2021-04-22 23:48:06'),
(148, 'Martin.Forms', 'comment', '1.3.7', 'Displaying errors with fields (inline errors)', '2021-04-22 23:48:06'),
(149, 'Martin.Forms', 'comment', '1.3.7', 'Show uploads as list', '2021-04-22 23:48:06'),
(150, 'Martin.Forms', 'comment', '1.3.8', 'Fixed handling arrays (radio inputs) in notification email', '2021-04-22 23:48:06'),
(151, 'Martin.Forms', 'comment', '1.3.9', 'Use custom mail templates', '2021-04-22 23:48:06'),
(152, 'Martin.Forms', 'comment', '1.3.9', 'Execute custom JavaScript on form success or error', '2021-04-22 23:48:06'),
(153, 'Martin.Forms', 'comment', '1.4.0', 'Added Events (please, refer to docs) [thanks to therealkevinard]', '2021-04-22 23:48:06'),
(154, 'Martin.Forms', 'comment', '1.4.1', 'New option \"Reply To\"', '2021-04-22 23:48:06'),
(155, 'Martin.Forms', 'comment', '1.4.2', 'Escape HTML characters on the view records page [thanks to Andre]', '2021-04-22 23:48:06'),
(156, 'Martin.Forms', 'comment', '1.4.2', 'New option to sanitize form data (check security docs for more info)', '2021-04-22 23:48:06'),
(157, 'Martin.Forms', 'comment', '1.4.2', 'Added option to send blind carbon copy in notifications email', '2021-04-22 23:48:06'),
(158, 'Martin.Forms', 'script', '1.4.3', 'add_unread_field.php', '2021-04-22 23:48:06'),
(159, 'Martin.Forms', 'comment', '1.4.3', 'Fixes related to October Build 420', '2021-04-22 23:48:06'),
(160, 'Martin.Forms', 'comment', '1.4.3', 'Added \"Unread Records\" counter', '2021-04-22 23:48:06'),
(161, 'Martin.Forms', 'comment', '1.4.3', 'Fixed errors when only BCC addresses are supplied', '2021-04-22 23:48:06'),
(162, 'Martin.Forms', 'comment', '1.4.3', 'New setting \"hide navigation item\"', '2021-04-22 23:48:06'),
(163, 'Martin.Forms', 'comment', '1.4.4', 'Use custom partials for Success and Error messages', '2021-04-22 23:48:06'),
(164, 'Martin.Forms', 'comment', '1.4.4.1', 'Fix with notifications emails', '2021-04-22 23:48:06'),
(165, 'Martin.Forms', 'comment', '1.4.5', 'Mail class code refactoring', '2021-04-22 23:48:06'),
(166, 'Martin.Forms', 'comment', '1.4.5', 'Access submited data on auto-response email template', '2021-04-22 23:48:06'),
(167, 'Martin.Forms', 'comment', '1.4.5.1', 'Store form data without escaping unicode [thanks to panakour]', '2021-04-22 23:48:06'),
(168, 'Martin.Forms', 'comment', '1.4.6', 'New option to skip saving forms data on database.', '2021-04-22 23:48:06'),
(169, 'Martin.Forms', 'comment', '1.4.6', 'Possibility to change the text on the remove file popup [thanks to ShiroeSama]', '2021-04-22 23:48:06'),
(170, 'Martin.Forms', 'comment', '1.4.6.1', 'Changed database field from json to text to support MySQL 5.5', '2021-04-22 23:48:06'),
(171, 'Martin.Forms', 'comment', '1.4.7', 'you can use your form variables on notification mail subject [thanks to Alex360hd]', '2021-04-22 23:48:06'),
(172, 'Martin.Forms', 'comment', '1.4.7', 'fix custom subject on email template [Thanks to matteotrubini]', '2021-04-22 23:48:06'),
(173, 'Martin.Forms', 'comment', '1.4.7', 'fix email bug when not storing on db [Thanks JurekRaben]', '2021-04-22 23:48:06'),
(174, 'Martin.Forms', 'comment', '1.4.7', 'skip url redirect validation [Thanks to EleRam]', '2021-04-22 23:48:06'),
(175, 'Martin.Forms', 'comment', '1.4.8', 'added GDPR cleanup feature [thanks to Alex360hd]', '2021-04-22 23:48:06'),
(176, 'Martin.Forms', 'comment', '1.4.9', 'fix on replaceToken function when replacement is null [thanks to leonaze]', '2021-04-22 23:48:06'),
(177, 'Martin.Forms', 'comment', '1.4.9.1', 'fix a nullable type error on PHP 7.0', '2021-04-22 23:48:06'),
(178, 'Martin.Forms', 'comment', '1.4.9.2', 'bugfix when a form field array has more than 2 levels of depth', '2021-04-22 23:48:06'),
(179, 'Martin.Forms', 'comment', '1.4.10', 'improvements related to event functionality', '2021-04-22 23:48:06'),
(180, 'Martin.Forms', 'comment', '1.4.11', 'added Laravel custom attributes to form validation [thanks to geekfil]', '2021-04-22 23:48:06'),
(181, 'Martin.Forms', 'comment', '1.4.11', 'updated french translation [thanks to FelixINX]', '2021-04-22 23:48:06'),
(182, 'Martin.Forms', 'comment', '1.4.12', 'use form variables on auto-response mail subject [thanks to jiargei]', '2021-04-22 23:48:06'),
(183, 'Martin.Forms', 'comment', '1.4.13', 'pass an array with form errors to JavaScript [thanks to multiwebinc]', '2021-04-22 23:48:06'),
(184, 'Martin.Forms', 'comment', '1.4.14', 'fixed error with empty auto-response subject', '2021-04-22 23:48:06'),
(185, 'Martin.Forms', 'comment', '1.4.15', 'enhancements related to saving record and events [thanks to boxxroom]', '2021-04-22 23:48:06'),
(186, 'Martin.Forms', 'comment', '1.4.16', 'added chinese translation [thanks to everyx]', '2021-04-22 23:48:06'),
(187, 'Martin.Forms', 'comment', '1.4.17', 'allowing sanitize to work recursively [thanks to multiwebinc]', '2021-04-22 23:48:06'),
(188, 'Martin.Forms', 'comment', '1.4.18', 'export records enhancements [thanks to Fosphatic]', '2021-04-22 23:48:06'),
(189, 'Martin.Forms', 'comment', '1.4.18', 'recaptcha locale fix [thanks to MaTToX3]', '2021-04-22 23:48:06'),
(190, 'Martin.Forms', 'comment', '1.4.19', 'added russian translation [thanks to FlusherDock1]', '2021-04-22 23:48:06'),
(191, 'Martin.Forms', 'comment', '1.4.19', 'sort records by date fix [thanks to mjauvin]', '2021-04-22 23:48:06'),
(192, 'Martin.Forms', 'comment', '1.4.20', 'added invisible reCAPTCHA [thanks to mjauvin]', '2021-04-22 23:48:06'),
(193, 'Martin.Forms', 'comment', '1.4.20', 'new option to set custom date format on emails subject', '2021-04-22 23:48:06'),
(194, 'Martin.Forms', 'comment', '1.5.0', 'fixes related to October Build 469 [thanks to mjauvin]', '2021-04-22 23:48:06'),
(195, 'Martin.Forms', 'comment', '1.5.0', 'fix when CSRF check is disabled [thanks to rechik]', '2021-04-22 23:48:06'),
(196, 'Martin.Forms', 'comment', '1.5.0', 'php linting and cleanup', '2021-04-22 23:48:06'),
(197, 'Martin.Forms', 'comment', '1.5.1', 'email templates improvemenrs [thanks to mjauvin]', '2021-04-22 23:48:06'),
(198, 'Martin.Forms', 'comment', '1.5.1', 'added german translation [thanks to Fosphatic]', '2021-04-22 23:48:06'),
(199, 'RainLab.Translate', 'script', '1.0.1', 'create_messages_table.php', '2021-04-22 23:48:27'),
(200, 'RainLab.Translate', 'script', '1.0.1', 'create_attributes_table.php', '2021-04-22 23:48:27'),
(201, 'RainLab.Translate', 'script', '1.0.1', 'create_locales_table.php', '2021-04-22 23:48:27'),
(202, 'RainLab.Translate', 'comment', '1.0.1', 'First version of Translate', '2021-04-22 23:48:27'),
(203, 'RainLab.Translate', 'comment', '1.0.2', 'Languages and Messages can now be deleted.', '2021-04-22 23:48:27'),
(204, 'RainLab.Translate', 'comment', '1.0.3', 'Minor updates for latest October release.', '2021-04-22 23:48:27'),
(205, 'RainLab.Translate', 'comment', '1.0.4', 'Locale cache will clear when updating a language.', '2021-04-22 23:48:27'),
(206, 'RainLab.Translate', 'comment', '1.0.5', 'Add Spanish language and fix plugin config.', '2021-04-22 23:48:27'),
(207, 'RainLab.Translate', 'comment', '1.0.6', 'Minor improvements to the code.', '2021-04-22 23:48:27'),
(208, 'RainLab.Translate', 'comment', '1.0.7', 'Fixes major bug where translations are skipped entirely!', '2021-04-22 23:48:27'),
(209, 'RainLab.Translate', 'comment', '1.0.8', 'Minor bug fixes.', '2021-04-22 23:48:27'),
(210, 'RainLab.Translate', 'comment', '1.0.9', 'Fixes an issue where newly created models lose their translated values.', '2021-04-22 23:48:27'),
(211, 'RainLab.Translate', 'comment', '1.0.10', 'Minor fix for latest build.', '2021-04-22 23:48:27'),
(212, 'RainLab.Translate', 'comment', '1.0.11', 'Fix multilingual rich editor when used in stretch mode.', '2021-04-22 23:48:27'),
(213, 'RainLab.Translate', 'comment', '1.1.0', 'Introduce compatibility with RainLab.Pages plugin.', '2021-04-22 23:48:27'),
(214, 'RainLab.Translate', 'comment', '1.1.1', 'Minor UI fix to the language picker.', '2021-04-22 23:48:27'),
(215, 'RainLab.Translate', 'comment', '1.1.2', 'Add support for translating Static Content files.', '2021-04-22 23:48:27'),
(216, 'RainLab.Translate', 'comment', '1.1.3', 'Improved support for the multilingual rich editor.', '2021-04-22 23:48:27'),
(217, 'RainLab.Translate', 'comment', '1.1.4', 'Adds new multilingual markdown editor.', '2021-04-22 23:48:27'),
(218, 'RainLab.Translate', 'comment', '1.1.5', 'Minor update to the multilingual control API.', '2021-04-22 23:48:27'),
(219, 'RainLab.Translate', 'comment', '1.1.6', 'Minor improvements in the message editor.', '2021-04-22 23:48:27'),
(220, 'RainLab.Translate', 'comment', '1.1.7', 'Fixes bug not showing content when first loading multilingual textarea controls.', '2021-04-22 23:48:27'),
(221, 'RainLab.Translate', 'comment', '1.2.0', 'CMS pages now support translating the URL.', '2021-04-22 23:48:27'),
(222, 'RainLab.Translate', 'comment', '1.2.1', 'Minor update in the rich editor and code editor language control position.', '2021-04-22 23:48:27'),
(223, 'RainLab.Translate', 'comment', '1.2.2', 'Static Pages now support translating the URL.', '2021-04-22 23:48:27'),
(224, 'RainLab.Translate', 'comment', '1.2.3', 'Fixes Rich Editor when inserting a page link.', '2021-04-22 23:48:27'),
(225, 'RainLab.Translate', 'script', '1.2.4', 'create_indexes_table.php', '2021-04-22 23:48:27'),
(226, 'RainLab.Translate', 'comment', '1.2.4', 'Translatable attributes can now be declared as indexes.', '2021-04-22 23:48:27'),
(227, 'RainLab.Translate', 'comment', '1.2.5', 'Adds new multilingual repeater form widget.', '2021-04-22 23:48:27'),
(228, 'RainLab.Translate', 'comment', '1.2.6', 'Fixes repeater usage with static pages plugin.', '2021-04-22 23:48:27'),
(229, 'RainLab.Translate', 'comment', '1.2.7', 'Fixes placeholder usage with static pages plugin.', '2021-04-22 23:48:27'),
(230, 'RainLab.Translate', 'comment', '1.2.8', 'Improvements to code for latest October build compatibility.', '2021-04-22 23:48:27'),
(231, 'RainLab.Translate', 'comment', '1.2.9', 'Fixes context for translated strings when used with Static Pages.', '2021-04-22 23:48:27'),
(232, 'RainLab.Translate', 'comment', '1.2.10', 'Minor UI fix to the multilingual repeater.', '2021-04-22 23:48:27'),
(233, 'RainLab.Translate', 'comment', '1.2.11', 'Fixes translation not working with partials loaded via AJAX.', '2021-04-22 23:48:27'),
(234, 'RainLab.Translate', 'comment', '1.2.12', 'Add support for translating the new grouped repeater feature.', '2021-04-22 23:48:27'),
(235, 'RainLab.Translate', 'comment', '1.3.0', 'Added search to the translate messages page.', '2021-04-22 23:48:27'),
(236, 'RainLab.Translate', 'script', '1.3.1', 'builder_table_update_rainlab_translate_locales.php', '2021-04-22 23:48:27'),
(237, 'RainLab.Translate', 'script', '1.3.1', 'seed_all_tables.php', '2021-04-22 23:48:27'),
(238, 'RainLab.Translate', 'comment', '1.3.1', 'Added reordering to languages', '2021-04-22 23:48:27'),
(239, 'RainLab.Translate', 'comment', '1.3.2', 'Improved compatibility with RainLab.Pages, added ability to scan Mail Messages for translatable variables.', '2021-04-22 23:48:27'),
(240, 'RainLab.Translate', 'comment', '1.3.3', 'Fix to the locale picker session handling in Build 420 onwards.', '2021-04-22 23:48:27'),
(241, 'RainLab.Translate', 'comment', '1.3.4', 'Add alternate hreflang elements and adds prefixDefaultLocale setting.', '2021-04-22 23:48:27'),
(242, 'RainLab.Translate', 'comment', '1.3.5', 'Fix MLRepeater bug when switching locales.', '2021-04-22 23:48:27'),
(243, 'RainLab.Translate', 'comment', '1.3.6', 'Fix Middleware to use the prefixDefaultLocale setting introduced in 1.3.4', '2021-04-22 23:48:27'),
(244, 'RainLab.Translate', 'comment', '1.3.7', 'Fix config reference in LocaleMiddleware', '2021-04-22 23:48:27'),
(245, 'RainLab.Translate', 'comment', '1.3.8', 'Keep query string when switching locales', '2021-04-22 23:48:27'),
(246, 'RainLab.Translate', 'comment', '1.4.0', 'Add importer and exporter for messages', '2021-04-22 23:48:27'),
(247, 'RainLab.Translate', 'comment', '1.4.1', 'Updated Hungarian translation. Added Arabic translation. Fixed issue where default texts are overwritten by import. Fixed issue where the language switcher for repeater fields would overlap with the first repeater row.', '2021-04-22 23:48:27'),
(248, 'RainLab.Translate', 'comment', '1.4.2', 'Add multilingual MediaFinder', '2021-04-22 23:48:27'),
(249, 'RainLab.Translate', 'comment', '1.4.3', '!!! Please update OctoberCMS to Build 444 before updating this plugin. Added ability to translate CMS Pages fields (e.g. title, description, meta-title, meta-description)', '2021-04-22 23:48:27'),
(250, 'RainLab.Translate', 'comment', '1.4.4', 'Minor improvements to compatibility with Laravel framework.', '2021-04-22 23:48:27'),
(251, 'RainLab.Translate', 'comment', '1.4.5', 'Fixed issue when using the language switcher', '2021-04-22 23:48:27'),
(252, 'RainLab.Translate', 'comment', '1.5.0', 'Compatibility fix with Build 451', '2021-04-22 23:48:27'),
(253, 'RainLab.Translate', 'comment', '1.6.0', 'Make File Upload widget properties translatable. Merge Repeater core changes into MLRepeater widget. Add getter method to retrieve original translate data.', '2021-04-22 23:48:27'),
(254, 'RainLab.Translate', 'comment', '1.6.1', 'Add ability for models to provide translated computed data, add option to disable locale prefix routing', '2021-04-22 23:48:27'),
(255, 'RainLab.Translate', 'comment', '1.6.2', 'Implement localeUrl filter, add per-locale theme configuration support', '2021-04-22 23:48:27'),
(256, 'RainLab.Translate', 'comment', '1.6.3', 'Add eager loading for translations, restore support for accessors & mutators', '2021-04-22 23:48:27'),
(257, 'RainLab.Translate', 'comment', '1.6.4', 'Fixes PHP 7.4 compatibility', '2021-04-22 23:48:27'),
(258, 'RainLab.Translate', 'comment', '1.6.5', 'Fixes compatibility issue when other plugins use a custom model morph map', '2021-04-22 23:48:27'),
(259, 'RainLab.Translate', 'script', '1.6.6', 'migrate_morphed_attributes.php', '2021-04-22 23:48:27'),
(260, 'RainLab.Translate', 'comment', '1.6.6', 'Introduce migration to patch existing translations using morph map', '2021-04-22 23:48:27'),
(261, 'RainLab.Translate', 'script', '1.6.7', 'migrate_morphed_indexes.php', '2021-04-22 23:48:27'),
(262, 'RainLab.Translate', 'comment', '1.6.7', 'Introduce migration to patch existing indexes using morph map', '2021-04-22 23:48:27'),
(263, 'RainLab.Translate', 'comment', '1.6.8', 'Add support for transOrderBy; Add translation support for ThemeData; Update russian localization.', '2021-04-22 23:48:27'),
(264, 'RainLab.Translate', 'comment', '1.6.9', 'Clear Static Page menu cache after saving the model; CSS fix for Text/Textarea input fields language selector.', '2021-04-22 23:48:27'),
(265, 'RainLab.Translate', 'comment', '1.6.10', 'Add option to purge deleted messages when scanning messages, Add Scan error column on Messages page, update_messages_table.php, Fix translations that were lost when clicking locale twice while holding ctrl key, Fix error with nested fields default locale value, Escape Message translate params value.', '2021-04-22 23:48:27'),
(266, 'RainLab.Translate', 'comment', '1.7.0', '!!! Breaking change for the Message::trans() method (params are now escaped), fix message translation documentation, fix string translation key for scan errors column header.', '2021-04-22 23:48:27'),
(267, 'RainLab.Translate', 'comment', '1.7.1', 'Fix YAML issue with previous tag/release.', '2021-04-22 23:48:27'),
(268, 'RainLab.Translate', 'comment', '1.7.2', 'Fix regex when \"|_\" filter is followed by another filter, Try locale without country before returning default translation, Allow exporting default locale, Fire \'rainlab.translate.themeScanner.afterScan\' event in the theme scanner for extendability.', '2021-04-22 23:48:27'),
(269, 'RainLab.Translate', 'comment', '1.7.3', 'Make plugin ready for Laravel 6 update, Add support for translating RainLab.Pages MenuItem properties (requires RainLab.Pages v1.3.6), Restore multilingual button position for textarea, Fix translatableAttributes.', '2021-04-22 23:48:27'),
(270, 'RainLab.Translate', 'comment', '1.7.4', 'Faster version of transWhere, Mail templates/views can now be localized, Fix messages table layout on mobile, Fix scopeTransOrderBy duplicates, Polish localization updates, Turkish localization updates, Add Greek language localization.', '2021-04-22 23:48:27'),
(271, 'RainLab.Translate', 'comment', '1.8.0', 'Adds initial support for October v2.0', '2021-04-22 23:48:27'),
(272, 'RainLab.Translate', 'comment', '1.8.1', 'Minor bugfix', '2021-04-22 23:48:27'),
(273, 'RainLab.Translate', 'comment', '1.8.2', 'Fixes translated file models and theme data for v2.0. The parent model must implement translatable behavior for their related file models to be translated.', '2021-04-22 23:48:27'),
(274, 'RainLab.Builder', 'comment', '1.0.1', 'Initialize plugin.', '2021-04-22 23:48:48'),
(275, 'RainLab.Builder', 'comment', '1.0.2', 'Fixes the problem with selecting a plugin. Minor localization corrections. Configuration files in the list and form behaviors are now autocomplete.', '2021-04-22 23:48:48'),
(276, 'RainLab.Builder', 'comment', '1.0.3', 'Improved handling of the enum data type.', '2021-04-22 23:48:48'),
(277, 'RainLab.Builder', 'comment', '1.0.4', 'Added user permissions to work with the Builder.', '2021-04-22 23:48:48'),
(278, 'RainLab.Builder', 'comment', '1.0.5', 'Fixed permissions registration.', '2021-04-22 23:48:48'),
(279, 'RainLab.Builder', 'comment', '1.0.6', 'Fixed front-end record ordering in the Record List component.', '2021-04-22 23:48:48'),
(280, 'RainLab.Builder', 'comment', '1.0.7', 'Builder settings are now protected with user permissions. The database table column list is scrollable now. Minor code cleanup.', '2021-04-22 23:48:48'),
(281, 'RainLab.Builder', 'comment', '1.0.8', 'Added the Reorder Controller behavior.', '2021-04-22 23:48:48'),
(282, 'RainLab.Builder', 'comment', '1.0.9', 'Minor API and UI updates.', '2021-04-22 23:48:48'),
(283, 'RainLab.Builder', 'comment', '1.0.10', 'Minor styling update.', '2021-04-22 23:48:48'),
(284, 'RainLab.Builder', 'comment', '1.0.11', 'Fixed a bug where clicking placeholder in a repeater would open Inspector. Fixed a problem with saving forms with repeaters in tabs. Minor style fix.', '2021-04-22 23:48:48'),
(285, 'RainLab.Builder', 'comment', '1.0.12', 'Added support for the Trigger property to the Media Finder widget configuration. Names of form fields and list columns definition files can now contain underscores.', '2021-04-22 23:48:48'),
(286, 'RainLab.Builder', 'comment', '1.0.13', 'Minor styling fix on the database editor.', '2021-04-22 23:48:48'),
(287, 'RainLab.Builder', 'comment', '1.0.14', 'Added support for published_at timestamp field', '2021-04-22 23:48:48'),
(288, 'RainLab.Builder', 'comment', '1.0.15', 'Fixed a bug where saving a localization string in Inspector could cause a JavaScript error. Added support for Timestamps and Soft Deleting for new models.', '2021-04-22 23:48:48'),
(289, 'RainLab.Builder', 'comment', '1.0.16', 'Fixed a bug when saving a form with the Repeater widget in a tab could create invalid fields in the form\'s outside area. Added a check that prevents creating localization strings inside other existing strings.', '2021-04-22 23:48:48'),
(290, 'RainLab.Builder', 'comment', '1.0.17', 'Added support Trigger attribute support for RecordFinder and Repeater form widgets.', '2021-04-22 23:48:48'),
(291, 'RainLab.Builder', 'comment', '1.0.18', 'Fixes a bug where \'::class\' notations in a model class definition could prevent the model from appearing in the Builder model list. Added emptyOption property support to the dropdown form control.', '2021-04-22 23:48:48'),
(292, 'RainLab.Builder', 'comment', '1.0.19', 'Added a feature allowing to add all database columns to a list definition. Added max length validation for database table and column names.', '2021-04-22 23:48:48'),
(293, 'RainLab.Builder', 'comment', '1.0.20', 'Fixes a bug where form the builder could trigger the \"current.hasAttribute is not a function\" error.', '2021-04-22 23:48:48'),
(294, 'RainLab.Builder', 'comment', '1.0.21', 'Back-end navigation sort order updated.', '2021-04-22 23:48:48'),
(295, 'RainLab.Builder', 'comment', '1.0.22', 'Added scopeValue property to the RecordList component.', '2021-04-22 23:48:48'),
(296, 'RainLab.Builder', 'comment', '1.0.23', 'Added support for balloon-selector field type, added Brazilian Portuguese translation, fixed some bugs', '2021-04-22 23:48:48'),
(297, 'RainLab.Builder', 'comment', '1.0.24', 'Added support for tag list field type, added read only toggle for fields. Prevent plugins from using reserved PHP keywords for class names and namespaces', '2021-04-22 23:48:48'),
(298, 'RainLab.Builder', 'comment', '1.0.25', 'Allow editing of migration code in the \"Migration\" popup when saving changes in the database editor.', '2021-04-22 23:48:48'),
(299, 'RainLab.Builder', 'comment', '1.0.26', 'Allow special default values for columns and added new \"Add ID column\" button to database editor.', '2021-04-22 23:48:48'),
(300, 'RainLab.Builder', 'comment', '1.0.27', 'Added ability to use \'scope\' in a form relation field, added ability to change the sort order of versions and added additional properties for repeater widget in form builder. Added Polish translation.', '2021-04-22 23:48:48'),
(323, 'AnandPatel.SeoExtension', 'script', '1.0.1', 'create_blog_posts_table.php', '2021-04-22 23:49:27'),
(324, 'AnandPatel.SeoExtension', 'comment', '1.0.1', 'First version of Seo Extension', '2021-04-22 23:49:27'),
(325, 'AnandPatel.SeoExtension', 'comment', '1.0.2', 'Bug fixes', '2021-04-22 23:49:27'),
(326, 'AnandPatel.SeoExtension', 'comment', '1.0.3', 'Backend Settings added to configure meta tags & Open Graph tags added', '2021-04-22 23:49:27'),
(327, 'AnandPatel.SeoExtension', 'comment', '1.0.4', 'Code clean up and change path naming in settings model', '2021-04-22 23:49:27'),
(328, 'AnandPatel.SeoExtension', 'comment', '1.0.5', 'Add Turkish, Russian, cs_CZ locale', '2021-04-22 23:49:27'),
(329, 'AnandPatel.SeoExtension', 'comment', '1.0.6', 'Fix issue of SEO Settings Errors', '2021-04-22 23:49:27'),
(330, 'Mey.Breadcrumbs', 'comment', '1.0.1', 'First version of Breadcrumbs', '2021-04-22 23:49:41'),
(331, 'Mey.Breadcrumbs', 'comment', '1.0.2', 'Update how the menu works', '2021-04-22 23:49:41'),
(332, 'Mey.Breadcrumbs', 'comment', '1.0.3', 'Add the option to set the crumb title using a DOM element that lives on the page. This is helpful for pages that use :slug type routing.', '2021-04-22 23:49:41'),
(333, 'Mey.Breadcrumbs', 'comment', '1.0.4', 'Pages are now sorted by title in the dropdown menu in the breadcrumbs tab.', '2021-04-22 23:49:41'),
(334, 'Mey.Breadcrumbs', 'comment', '1.0.5', 'Update to fix the page sorting issue. Pages now sort alphabetically in the dropdown menu. Also a better icon choice.', '2021-04-22 23:49:41'),
(335, 'Mey.Breadcrumbs', 'comment', '1.0.6', 'Internal updates and bug fixes.', '2021-04-22 23:49:41'),
(336, 'Mey.Breadcrumbs', 'comment', '1.0.7', 'Bug fix for those who use element titles. Now no error will be thrown if the element does not exist on the page.', '2021-04-22 23:49:41'),
(337, 'Mey.Breadcrumbs', 'comment', '1.0.8', 'Updated menu to be much more logical. Also gave some more context to he menu dropdown.', '2021-04-22 23:49:41'),
(338, 'Mey.Breadcrumbs', 'comment', '1.0.9', 'Update to be compatible with the latest october build.', '2021-04-22 23:49:41'),
(339, 'Mey.Breadcrumbs', 'comment', '1.0.10', 'Fix for compatibility with 286 build.', '2021-04-22 23:49:41'),
(449, 'Lovata.Buddies', 'script', '1.0.0', 'table_create_addition_properties.php', '2021-04-22 23:50:47'),
(450, 'Lovata.Buddies', 'script', '1.0.0', 'table_create_groups.php', '2021-04-22 23:50:47'),
(451, 'Lovata.Buddies', 'script', '1.0.0', 'table_create_throttle.php', '2021-04-22 23:50:47'),
(452, 'Lovata.Buddies', 'script', '1.0.0', 'table_create_users.php', '2021-04-22 23:50:47'),
(453, 'Lovata.Buddies', 'comment', '1.0.0', 'Initialize plugin.', '2021-04-22 23:50:47'),
(454, 'Lovata.Buddies', 'comment', '1.0.1', '$casts property is replaced with $jsonable property in the User model', '2021-04-22 23:50:47'),
(455, 'Lovata.Buddies', 'comment', '1.1.0', 'Added the ability to edit the user\'s properties using the UserPage component on different pages and forms. For example, for pages: personal data, company legal data, etc.', '2021-04-22 23:50:47'),
(456, 'Lovata.Buddies', 'comment', '1.2.0', 'Added onCheckEmail() method in Registration component. Added the ability to add custom fields to email templates. Added events: \"lovata.buddies::mail.registration.template.data\", \"lovata.buddies::mail.restore.template.data\". Added support for multilanguage for sending emails. Settings for sending emails are moved to the Toolbox plugin. Requires Toolbox plugin version 1.6.0 and later.', '2021-04-22 23:50:47'),
(457, 'Lovata.Buddies', 'comment', '1.3.0', 'Update logic for new version of CResult class. Add TraitCached to User model. Requires Toolbox plugin version 1.9.1 and later.', '2021-04-22 23:50:47'),
(458, 'Lovata.Buddies', 'comment', '1.3.1', 'Add force logout for all users.', '2021-04-22 23:50:47'),
(459, 'Lovata.Buddies', 'comment', '1.3.2', 'Adds flag to avoid auto logging in newly registered users. Fixes', '2021-04-22 23:50:47'),
(460, 'Lovata.Buddies', 'comment', '1.4.0', 'Refactoring UserItem class. Add annotations for integration with \"Orders for Shopaholic\" plugin. Refactoring fields and columns files. Requires Toolbox plugin version 1.10.0 and later.', '2021-04-22 23:50:47'),
(461, 'Lovata.Buddies', 'script', '1.5.0', 'table_create_socialite_tokens.php', '2021-04-22 23:50:47'),
(462, 'Lovata.Buddies', 'comment', '1.5.0', 'Add integration with laravel/socialite package. Add SocialiteLogin component, SocialiteToken model. Added onSocialiteLogin() method to Login component. Added force_login, redirect_on, redirect_page properties to ActivationPage component. Added login_page property to UserPage component. Add possibility to extend query from user model while finding user by credentials.', '2021-04-22 23:50:47'),
(463, 'Lovata.Buddies', 'comment', '1.6.0', 'Added french language. Thanks for contribution Félix Desjardins.', '2021-04-22 23:50:47'),
(464, 'Lovata.Buddies', 'comment', '1.7.0', 'Added supported types of user properties: number, rich editor, single checkbox, switch, balloon selector, tag list, radio.', '2021-04-22 23:50:47'),
(465, 'Lovata.Buddies', 'comment', '1.7.1', 'Added SoftDelete trait to User model.', '2021-04-22 23:50:47'),
(466, 'Lovata.Buddies', 'comment', '1.7.2', 'Fixed login method, after updating OctoberCMS v1.0.455', '2021-04-22 23:50:47'),
(467, 'Lovata.Buddies', 'comment', '1.8.0', 'Added lovata.buddies.before.login, lovata.buddies.after.login, lovata.buddies.logout events', '2021-04-22 23:50:47'),
(468, 'Lovata.Buddies', 'comment', '1.8.1', 'Added avatar field to fillable array in User model.', '2021-04-22 23:50:47'),
(469, 'ToughDeveloper.ImageResizer', 'comment', '1.0.1', 'First version of ImageResizer', '2021-04-22 23:54:08'),
(470, 'ToughDeveloper.ImageResizer', 'comment', '1.0.2', 'Fixes bug where url set in config/app.php affecting rendering of image.', '2021-04-22 23:54:08'),
(471, 'ToughDeveloper.ImageResizer', 'comment', '1.0.3', 'Adds Hungarian translation - thanks to Szabó Gergő', '2021-04-22 23:54:08'),
(472, 'ToughDeveloper.ImageResizer', 'comment', '1.1.0', 'Adds default settings to admin - thanks to Szabó Gergő', '2021-04-22 23:54:08'),
(473, 'ToughDeveloper.ImageResizer', 'comment', '1.2.0', 'Adds optional PNG compression support via Tiny PNG', '2021-04-22 23:54:08'),
(474, 'ToughDeveloper.ImageResizer', 'comment', '1.2.1', 'Updates translations and allows jpg files to be compressed with Tiny PNG', '2021-04-22 23:54:08'),
(475, 'ToughDeveloper.ImageResizer', 'comment', '1.2.2', 'Ensures false can be passed to auto width/height. Also improves URL parsing so different formats of app.url work as expected. Thanks to Emerge.', '2021-04-22 23:54:08'),
(476, 'ToughDeveloper.ImageResizer', 'comment', '1.3.0', 'Adds TinyPNG API key validation, TinyPNG usage statistics and provides thumb backend list column type', '2021-04-22 23:54:08'),
(477, 'ToughDeveloper.ImageResizer', 'comment', '1.3.1', 'Ensures plugin works as expected when October is installed to a sub-directory.', '2021-04-22 23:54:08'),
(478, 'ToughDeveloper.ImageResizer', 'comment', '1.3.2', 'Adds option to skip compression of certain images, helpful to save credits.', '2021-04-22 23:54:08'),
(479, 'ToughDeveloper.ImageResizer', 'comment', '1.3.3', 'Updates Hungarian translations - thanks to Szabó Gergő', '2021-04-22 23:54:08'),
(480, 'ToughDeveloper.ImageResizer', 'comment', '1.3.4', 'Adds German translation - thanks to Christoph (emptynick)', '2021-04-22 23:54:08'),
(481, 'ToughDeveloper.ImageResizer', 'comment', '1.3.5', '!!! Changes path to cached image for builds of October 420+. Thanks to that0n3guy', '2021-04-22 23:54:08'),
(482, 'ToughDeveloper.ImageResizer', 'comment', '1.3.6', 'Prevent infinite loop when custom not found image does not exist. Thanks to yapsr', '2021-04-22 23:54:08'),
(483, 'ToughDeveloper.ImageResizer', 'comment', '1.4.0', 'Add imageWidth() and imageHeight() filters - @matteotrubini', '2021-04-22 23:54:08'),
(484, 'ToughDeveloper.ImageResizer', 'comment', '1.4.0', 'Adds fr translations - @FelixINX', '2021-04-22 23:54:08'),
(485, 'ToughDeveloper.ImageResizer', 'comment', '1.4.0', 'composer.json fixes - @DieterHolvoet and @LukeTowers', '2021-04-22 23:54:08'),
(486, 'ToughDeveloper.ImageResizer', 'comment', '1.4.0', 'Regenerate cached image if original has a different mtime - @kevinkoenen', '2021-04-22 23:54:08'),
(487, 'ToughDeveloper.ImageResizer', 'comment', '1.4.0', 'Delete temporary image copy - @multiwebinc', '2021-04-22 23:54:08'),
(488, 'ToughDeveloper.ImageResizer', 'comment', '1.4.0', 'Adds zh-cn translations - @everyx', '2021-04-22 23:54:08'),
(489, 'ToughDeveloper.ImageResizer', 'comment', '1.4.0', 'Spaces in filename are now handled properly - @mauserrifle', '2021-04-22 23:54:08'),
(490, 'ToughDeveloper.ImageResizer', 'comment', '1.4.1', 'Only attempt to delete temp files if they still exist - @LukeTowers', '2021-04-22 23:54:08'),
(513, 'RainLab.BlogVideo', 'comment', '1.0.1', 'First version of Blog Video plugin', '2021-04-23 00:14:16'),
(514, 'RainLab.BlogVideo', 'comment', '1.0.2', 'Fixes issue where videos cannot be uploaded caused by latest Markdown library.', '2021-04-23 00:14:16'),
(515, 'RainLab.BlogVideo', 'comment', '1.1.0', 'Adds a new Video button to the Markdown editor toolbar.', '2021-04-23 00:14:16'),
(516, 'RainLab.BlogVideo', 'comment', '1.1.1', 'Minor styling update.', '2021-04-23 00:14:16'),
(517, 'RainLab.BlogVideo', 'comment', '1.1.2', 'Update toolbar icon.', '2021-04-23 00:14:16'),
(518, 'OFFLINE.SiteSearch', 'comment', '1.0.1', 'First version of SiteSearch', '2021-04-23 00:15:38'),
(519, 'OFFLINE.SiteSearch', 'comment', '1.0.2', 'Added experimental CMS pages results provider', '2021-04-23 00:15:38'),
(520, 'OFFLINE.SiteSearch', 'comment', '1.0.3', 'Added missing component', '2021-04-23 00:15:38'),
(521, 'OFFLINE.SiteSearch', 'comment', '1.0.4', 'Added support for RadiantWeb.ProBlog', '2021-04-23 00:15:38'),
(522, 'OFFLINE.SiteSearch', 'comment', '1.0.5', 'Moved configuration to the backend', '2021-04-23 00:15:38'),
(523, 'OFFLINE.SiteSearch', 'comment', '1.0.6', 'Fixed hardcoded url in pagination', '2021-04-23 00:15:38'),
(524, 'OFFLINE.SiteSearch', 'comment', '1.0.7', 'Add function for getting last page number (Thanks to vojtasvoboda)', '2021-04-23 00:15:38'),
(525, 'OFFLINE.SiteSearch', 'comment', '1.0.8', 'Add cs_CZ locale (Thanks to vojtasvoboda)', '2021-04-23 00:15:38'),
(526, 'OFFLINE.SiteSearch', 'comment', '1.0.9', 'Added support for ArrizalAmin.Portfolio plugin', '2021-04-23 00:15:38'),
(527, 'OFFLINE.SiteSearch', 'comment', '1.0.10', 'Removed unused component', '2021-04-23 00:15:38'),
(528, 'OFFLINE.SiteSearch', 'comment', '1.1.0', 'Added support for translated contents in RainLab.Pages, ArrizalAmin.Portfolio and RadiantWeb.ProBlog', '2021-04-23 00:15:38'),
(529, 'OFFLINE.SiteSearch', 'comment', '1.1.0', 'Fixed bug where RainLab.Pages results were displayed twice', '2021-04-23 00:15:38'),
(530, 'OFFLINE.SiteSearch', 'comment', '1.1.0', 'Honor disabled plugins setting', '2021-04-23 00:15:38'),
(531, 'OFFLINE.SiteSearch', 'comment', '1.1.0', 'Generate absolute URLs in search results by default', '2021-04-23 00:15:38'),
(532, 'OFFLINE.SiteSearch', 'comment', '1.1.1', 'Added optimized siteSearchInclude component for cms pages search', '2021-04-23 00:15:38'),
(533, 'OFFLINE.SiteSearch', 'comment', '1.1.2', 'Fixed backend permissions', '2021-04-23 00:15:38'),
(534, 'OFFLINE.SiteSearch', 'comment', '1.1.3', 'Added ru_RU locale (Thanks to mokeev1995)', '2021-04-23 00:15:38'),
(535, 'OFFLINE.SiteSearch', 'comment', '1.2.1', 'Added support for Feegleweb.Octoshop (Thanks to billyzduke)', '2021-04-23 00:15:38'),
(536, 'OFFLINE.SiteSearch', 'comment', '1.2.1', 'Refactored search providers and results page', '2021-04-23 00:15:38'),
(537, 'OFFLINE.SiteSearch', 'comment', '1.2.2', 'Minor bugfix in Feegleweb.Octoshop settings page translation', '2021-04-23 00:15:38'),
(538, 'OFFLINE.SiteSearch', 'comment', '1.2.3', 'Fixed bug where the search results sometimes broke the page layout', '2021-04-23 00:15:38'),
(539, 'OFFLINE.SiteSearch', 'comment', '1.2.4', 'Fixed bug where unavailable thumbnails lead to an error', '2021-04-23 00:15:38'),
(540, 'OFFLINE.SiteSearch', 'comment', '1.2.5', 'Fixed bug where the provider badge is not displayed for custom search providers', '2021-04-23 00:15:38'),
(541, 'OFFLINE.SiteSearch', 'comment', '1.2.6', 'Added support for Responsiv.Showcase (Thanks to MichiReich)', '2021-04-23 00:15:38'),
(542, 'OFFLINE.SiteSearch', 'comment', '1.2.7', 'Fixed bug where custom url settings were ignored in search results for some providers', '2021-04-23 00:15:38'),
(543, 'OFFLINE.SiteSearch', 'comment', '1.2.8', 'Added support for viewBag properties in RainLab.Pages', '2021-04-23 00:15:38'),
(544, 'OFFLINE.SiteSearch', 'comment', '1.2.9', 'Added support for static page component hosts', '2021-04-23 00:15:38'),
(545, 'OFFLINE.SiteSearch', 'comment', '1.2.10', 'Added support for multiple variables in Rainlab.Blog urls (Thanks to graker)', '2021-04-23 00:15:38'),
(546, 'OFFLINE.SiteSearch', 'comment', '1.2.11', 'Optimized handling of multibyte strings', '2021-04-23 00:15:38'),
(547, 'OFFLINE.SiteSearch', 'comment', '1.2.12', 'Added support for Jiri.Jkshop', '2021-04-23 00:15:38'),
(548, 'OFFLINE.SiteSearch', 'comment', '1.2.13', 'Minor bugfixes for marked queries in search results and Rainlab.Blog provider (Thanks to graker)', '2021-04-23 00:15:38'),
(549, 'OFFLINE.SiteSearch', 'comment', '1.2.14', 'Fixed bug in Jiri.JKShop provider', '2021-04-23 00:15:38'),
(550, 'OFFLINE.SiteSearch', 'comment', '1.2.15', 'Added a new meta property for search results (thanks to cracki)', '2021-04-23 00:15:38'),
(551, 'OFFLINE.SiteSearch', 'comment', '1.2.16', 'Added Persian (Farsi) translations (thanks to cracki)', '2021-04-23 00:15:38'),
(552, 'OFFLINE.SiteSearch', 'comment', '1.2.17', 'Added support for Indikator.News (thanks to gergo85)', '2021-04-23 00:15:38'),
(553, 'OFFLINE.SiteSearch', 'comment', '1.2.18', 'Fixed bug where titles of static pages where not searched (thanks to beenen445)', '2021-04-23 00:15:38'),
(554, 'OFFLINE.SiteSearch', 'comment', '1.2.19', 'Added support for OFFLINE.SnipcartShop', '2021-04-23 00:15:38'),
(555, 'OFFLINE.SiteSearch', 'comment', '1.2.20', 'Added support for VojtaSvoboda.Brands (thanks to vojtasvoboda)', '2021-04-23 00:15:38'),
(556, 'OFFLINE.SiteSearch', 'comment', '1.2.21', 'Added Portuguese translations (thanks to ribsousa)', '2021-04-23 00:15:38'),
(557, 'OFFLINE.SiteSearch', 'comment', '1.2.22', 'Fixed Portuguese translations', '2021-04-23 00:15:38'),
(558, 'OFFLINE.SiteSearch', 'comment', '1.2.23', 'Fixed support for translated Rainlab.Blog contents', '2021-04-23 00:15:38'),
(559, 'OFFLINE.SiteSearch', 'comment', '1.2.24', 'Added composer.json to allow loading plugin as dependency (thanks to adduc)', '2021-04-23 00:15:38'),
(560, 'OFFLINE.SiteSearch', 'comment', '1.2.25', 'Fixed bug that sometimes lead to broken html in search results (thanks to graker)', '2021-04-23 00:15:38'),
(561, 'OFFLINE.SiteSearch', 'comment', '1.2.26', 'Exclude hidden static pages from search results (thanks to plyusninva)', '2021-04-23 00:15:38'),
(562, 'OFFLINE.SiteSearch', 'comment', '1.2.27', 'Added support for Graker.PhotoAlbums (thanks to graker)', '2021-04-23 00:15:38'),
(563, 'OFFLINE.SiteSearch', 'comment', '1.2.28', 'Added new result.identifier property', '2021-04-23 00:15:38'),
(564, 'OFFLINE.SiteSearch', 'comment', '1.2.29', 'Optimized thumbnail generation for Graker.PhotoAlbums results (thanks to graker)', '2021-04-23 00:15:38'),
(565, 'OFFLINE.SiteSearch', 'comment', '1.2.30', 'The searchResults component\'s resultsCollection is now publically accessible', '2021-04-23 00:15:38'),
(566, 'OFFLINE.SiteSearch', 'comment', '1.2.31', 'Added model property for each search result to retreive the original model the result was generated from', '2021-04-23 00:15:38'),
(567, 'OFFLINE.SiteSearch', 'comment', '1.2.32', 'Added support for custom ResultsProvider classes', '2021-04-23 00:15:38'),
(568, 'OFFLINE.SiteSearch', 'comment', '1.2.33', 'Fix the use of multiple custom ResultsProvider for a plugin', '2021-04-23 00:15:38'),
(569, 'OFFLINE.SiteSearch', 'comment', '1.3.1', 'Added new searchInput component with search-as-you-type feature', '2021-04-23 00:15:38'),
(570, 'OFFLINE.SiteSearch', 'comment', '1.3.2', 'Fixed bug in AutoCompleteComponent', '2021-04-23 00:15:38'),
(571, 'OFFLINE.SiteSearch', 'comment', '1.3.3', '!!! All results are now returned with a relative URL to prevent problems with translated contents. Make sure to pass your result.url throught the \"app\" filter if you are using your own search result partials', '2021-04-23 00:15:38'),
(572, 'OFFLINE.SiteSearch', 'comment', '1.3.4', 'Fixed undefined index error when a static page doesn\'t have a title set', '2021-04-23 00:15:38'),
(573, 'OFFLINE.SiteSearch', 'comment', '1.3.5', 'Added ability to edit the user\'s query before searching', '2021-04-23 00:15:38'),
(574, 'OFFLINE.SiteSearch', 'comment', '1.3.6', '!!! Using RadiantWeb.ProBlog\'s internal settings to get the correct parent page for a blog post result. This enables support for multiple blogs on the same website. If your blog search results have wrong URLs after this update make sure to configure your default page for rendering blog posts via the ProBlog backend settings.', '2021-04-23 00:15:38'),
(575, 'OFFLINE.SiteSearch', 'comment', '1.3.7', 'Added the ability to add age penalties to search results. This can be used to show newer results higher up in your search results.', '2021-04-23 00:15:38'),
(576, 'OFFLINE.SiteSearch', 'comment', '1.3.8', 'Optimized support for multiple SearchInput components on a single page.', '2021-04-23 00:15:38'),
(577, 'OFFLINE.SiteSearch', 'comment', '1.3.9', 'Added Chinese language support (thanks to Ckend)', '2021-04-23 00:15:38'),
(578, 'OFFLINE.SiteSearch', 'comment', '1.3.10', 'Fixed link to search result in default results partial (thanks to wizzard94)', '2021-04-23 00:15:38');
INSERT INTO `system_plugin_history` (`id`, `code`, `type`, `version`, `detail`, `created_at`) VALUES
(579, 'OFFLINE.SiteSearch', 'comment', '1.3.11', 'Trim query before searching', '2021-04-23 00:15:38'),
(580, 'OFFLINE.SiteSearch', 'comment', '1.3.12', 'Stability improvements', '2021-04-23 00:15:38'),
(581, 'OFFLINE.SiteSearch', 'comment', '1.3.13', 'Pre-populate search query in searchInput field', '2021-04-23 00:15:38'),
(582, 'OFFLINE.SiteSearch', 'comment', '1.3.14', 'Include placeholders on Rainlab.Pages pages in search results', '2021-04-23 00:15:38'),
(583, 'OFFLINE.SiteSearch', 'comment', '1.3.15', 'Catch invalid markup errors when searching RainLab.Pages', '2021-04-23 00:15:38'),
(584, 'OFFLINE.SiteSearch', 'comment', '1.3.16', 'Only search RainLab.Blog contents of current locale', '2021-04-23 00:15:38'),
(585, 'OFFLINE.SiteSearch', 'comment', '1.3.17', 'Fixed pagination links when using RainLab.Translate', '2021-04-23 00:15:38'),
(586, 'OFFLINE.SiteSearch', 'comment', '1.3.18', 'Updated persian translations (thanks to @sajjad-ser)', '2021-04-23 00:15:38'),
(587, 'OFFLINE.SiteSearch', 'comment', '1.3.19', 'Added finnish translations (thank to @mediaclinic)', '2021-04-23 00:15:39'),
(588, 'OFFLINE.SiteSearch', 'comment', '1.3.20', 'Added bulgarian translations (thank to @NGavanozov)', '2021-04-23 00:15:39'),
(589, 'OFFLINE.SiteSearch', 'comment', '1.3.21', 'Fixed RainLab.Blog published_at date handling', '2021-04-23 00:15:39'),
(590, 'OFFLINE.SiteSearch', 'comment', '1.3.22', 'Fixed problem with queries that contain only spaces', '2021-04-23 00:15:39'),
(591, 'OFFLINE.SiteSearch', 'comment', '1.4.0', 'SiteSearch can now log all search queries. Enable via backend settings.', '2021-04-23 00:15:39'),
(592, 'OFFLINE.SiteSearch', 'script', '1.4.1', 'create_offline_sitesearch_query_logs.php', '2021-04-23 00:15:39'),
(593, 'OFFLINE.SiteSearch', 'comment', '1.4.1', 'Minor bugfixes', '2021-04-23 00:15:39'),
(594, 'OFFLINE.SiteSearch', 'comment', '1.4.2', 'Added User-Agent to list view', '2021-04-23 00:15:39'),
(595, 'OFFLINE.SiteSearch', 'comment', '1.4.3', 'Fixed bug where empty queries resulted in an Exception', '2021-04-23 00:15:39'),
(596, 'OFFLINE.SiteSearch', 'comment', '1.4.4', 'Optimized support for cms pages search: Your Twig markup is now completely rendered and searched!', '2021-04-23 00:15:39'),
(597, 'OFFLINE.SiteSearch', 'comment', '1.4.5', 'Use meta_title for RainLab.Pages results if available', '2021-04-23 00:15:39'),
(598, 'OFFLINE.SiteSearch', 'comment', '1.4.6', 'Made getAgePenalty method static so it can be re-used in simple Event providers', '2021-04-23 00:15:39'),
(599, 'OFFLINE.SiteSearch', 'comment', '1.4.7', 'Optimized searchResults component so it can be used in partials and static pages', '2021-04-23 00:15:39'),
(600, 'OFFLINE.SiteSearch', 'comment', '1.4.8', 'Allow custom penalty parameters in ResultsProvider::agePenaltyForDays method', '2021-04-23 00:15:39'),
(601, 'OFFLINE.SiteSearch', 'comment', '1.4.9', 'Moved query log link from main navbar to backend settings', '2021-04-23 00:15:39'),
(602, 'OFFLINE.SiteSearch', 'comment', '1.4.10', 'Improved Czech translations', '2021-04-23 00:15:39'),
(603, 'OFFLINE.SiteSearch', 'comment', '1.5.0', 'Added `offline.sitesearch.results` event to allow customization (filter, sort) of the results collection before it is displayed', '2021-04-23 00:15:39'),
(604, 'OFFLINE.SiteSearch', 'comment', '1.5.1', 'Fixed typo in the newly added event name', '2021-04-23 00:15:39'),
(605, 'OFFLINE.SiteSearch', 'comment', '1.5.2', 'Made Result::markQuery method public for easier extension', '2021-04-23 00:15:39'),
(606, 'OFFLINE.SiteSearch', 'comment', '1.5.3', 'Fixed result order in searchInput component', '2021-04-23 00:15:39'),
(607, 'OFFLINE.SiteSearch', 'comment', '1.5.4', 'Fixed handling of invalid page url parameter', '2021-04-23 00:15:39'),
(608, 'OFFLINE.SiteSearch', 'comment', '1.5.5', 'Fixed handling of invalid offline.sitesearch.results event returns', '2021-04-23 00:15:39'),
(609, 'OFFLINE.SiteSearch', 'comment', '1.5.6', 'Updated russian translations (thanks to @Web-VPF)', '2021-04-23 00:15:39'),
(706, 'Ribsousa.Featuredimages', 'comment', '1.0.1', 'First version of Featuredimages', '2021-04-23 00:21:34'),
(707, 'AnandPatel.WysiwygEditors', 'comment', '1.0.1', 'First version of Wysiwyg Editors.', '2021-04-23 00:27:49'),
(708, 'AnandPatel.WysiwygEditors', 'comment', '1.0.2', 'Automatic Injection to CMS & other code editors and October CMS`s Rich Editor added.', '2021-04-23 00:27:49'),
(709, 'AnandPatel.WysiwygEditors', 'comment', '1.0.3', 'Automatic Injection to RainLab Static Pages & other plugin`s option is appear only if installed.', '2021-04-23 00:27:49'),
(710, 'AnandPatel.WysiwygEditors', 'comment', '1.0.4', 'New Froala editor added (on request from emzero439), Height & width property added for editor, setting moved to My Setting tab and minor changes in settings.', '2021-04-23 00:27:49'),
(711, 'AnandPatel.WysiwygEditors', 'comment', '1.0.5', 'Automatic Injection to Radiantweb`s Problog and ProEvents (option available in settings-content).', '2021-04-23 00:27:49'),
(712, 'AnandPatel.WysiwygEditors', 'comment', '1.0.6', 'CKEditor updated and bug fixes.', '2021-04-23 00:27:49'),
(713, 'AnandPatel.WysiwygEditors', 'comment', '1.0.7', 'Integrated elFinder (file browser) with TinyMCE & CKEditor, Image upload/delete for Froala Editor.', '2021-04-23 00:27:49'),
(714, 'AnandPatel.WysiwygEditors', 'comment', '1.0.8', 'Added security to File Browser`s route (Authenticate users can only access File Browser).', '2021-04-23 00:27:49'),
(715, 'AnandPatel.WysiwygEditors', 'comment', '1.0.9', 'Updated CKEditor, Froala and TinyMCE.', '2021-04-23 00:27:49'),
(716, 'AnandPatel.WysiwygEditors', 'comment', '1.1.0', 'Support multilanguage, update elFinder and cleanup code.', '2021-04-23 00:27:49'),
(717, 'AnandPatel.WysiwygEditors', 'comment', '1.1.1', 'Added Turkish language.', '2021-04-23 00:27:49'),
(718, 'AnandPatel.WysiwygEditors', 'comment', '1.1.2', 'Added Hungarian language.', '2021-04-23 00:27:49'),
(719, 'AnandPatel.WysiwygEditors', 'comment', '1.1.3', 'Fixed issue related to RC (Elfinder fix remaining).', '2021-04-23 00:27:49'),
(720, 'AnandPatel.WysiwygEditors', 'comment', '1.1.4', 'Fixed Elfinder issue.', '2021-04-23 00:27:49'),
(721, 'AnandPatel.WysiwygEditors', 'comment', '1.1.5', 'Updated CKEditor, Froala and TinyMCE.', '2021-04-23 00:27:49'),
(722, 'AnandPatel.WysiwygEditors', 'comment', '1.1.6', 'Changed destination folder.', '2021-04-23 00:27:49'),
(723, 'AnandPatel.WysiwygEditors', 'comment', '1.1.7', 'Added Czech language.', '2021-04-23 00:27:49'),
(724, 'AnandPatel.WysiwygEditors', 'comment', '1.1.8', 'Added Russian language.', '2021-04-23 00:27:49'),
(725, 'AnandPatel.WysiwygEditors', 'comment', '1.1.9', 'Fix hook and other issues (thanks to Vojta Svoboda).', '2021-04-23 00:27:49'),
(726, 'AnandPatel.WysiwygEditors', 'comment', '1.2.0', 'Put settings inside CMS sidemenu (thanks to Amanda Tresbach).', '2021-04-23 00:27:49'),
(727, 'AnandPatel.WysiwygEditors', 'comment', '1.2.1', 'Remove el-finder (Which fix issue of composer), added OC media manager support for image in TinyMCE & CkEditor, TinyMCE version updated, Fix Image upload for froala editor', '2021-04-23 00:27:49'),
(728, 'AnandPatel.WysiwygEditors', 'comment', '1.2.2', 'Add multilingual support, Add new languages, Update the Hungarian language, Add the missing English language files (Special thanks to Szabó Gergő)', '2021-04-23 00:27:49'),
(729, 'AnandPatel.WysiwygEditors', 'comment', '1.2.3', 'Added toolbar customization option (Special thanks to Szabó Gergő).', '2021-04-23 00:27:49'),
(730, 'AnandPatel.WysiwygEditors', 'comment', '1.2.4', 'Added support for Content Plus Plugin & News and Newsletter plugin (thanks to Szabó Gergő)', '2021-04-23 00:27:49'),
(731, 'AnandPatel.WysiwygEditors', 'comment', '1.2.5', 'Minor improvements and bugfixes.', '2021-04-23 00:27:49'),
(732, 'AnandPatel.WysiwygEditors', 'comment', '1.2.6', 'Updated the CKEditor and TinyMCE editors.', '2021-04-23 00:27:49'),
(733, 'AnandPatel.WysiwygEditors', 'comment', '1.2.7', 'Show locale switcher when using multilocale editor.', '2021-04-23 00:27:49'),
(734, 'AnandPatel.WysiwygEditors', 'comment', '1.2.8', 'Added French language', '2021-04-23 00:27:49'),
(735, 'AnandPatel.WysiwygEditors', 'comment', '1.2.9', 'Added permission for preferences', '2021-04-23 00:27:49'),
(736, 'Renatio.DynamicPDF', 'script', '1.0.1', 'create_pdf_layouts_table.php', '2021-04-23 00:30:37'),
(737, 'Renatio.DynamicPDF', 'script', '1.0.1', 'create_pdf_templates_table.php', '2021-04-23 00:30:37'),
(738, 'Renatio.DynamicPDF', 'comment', '1.0.1', 'Initialize plugin.', '2021-04-23 00:30:37'),
(739, 'Renatio.DynamicPDF', 'comment', '1.0.2', 'Minor changes.', '2021-04-23 00:30:37'),
(740, 'Renatio.DynamicPDF', 'comment', '1.1.0', '!!! Important update.', '2021-04-23 00:30:37'),
(741, 'Renatio.DynamicPDF', 'comment', '1.1.1', 'Use Twig::parse() facade. Only update for October build 300 and above.', '2021-04-23 00:30:37'),
(742, 'Renatio.DynamicPDF', 'comment', '1.1.2', 'Minor changes.', '2021-04-23 00:30:37'),
(743, 'Renatio.DynamicPDF', 'comment', '1.1.3', 'Add stream parameters and Czech locale. Thanks to @vojtasvoboda.', '2021-04-23 00:30:37'),
(744, 'Renatio.DynamicPDF', 'comment', '1.1.4', 'Add Spanish and Spanish-Argentina locale. Thanks to @kocholes.', '2021-04-23 00:30:37'),
(745, 'Renatio.DynamicPDF', 'comment', '1.1.5', 'UI improvements. Thanks to @kocholes.', '2021-04-23 00:30:37'),
(746, 'Renatio.DynamicPDF', 'comment', '2.0.0', '!!! This is an important update that contains breaking changes.', '2021-04-23 00:30:37'),
(747, 'Renatio.DynamicPDF', 'comment', '2.0.1', 'Add preview HTML buttons.', '2021-04-23 00:30:37'),
(748, 'Renatio.DynamicPDF', 'comment', '2.1.0', '!!! This is an important update that contains breaking changes.', '2021-04-23 00:30:37'),
(749, 'Renatio.DynamicPDF', 'comment', '2.1.1', 'Upgrade to DomPDF 0.7.', '2021-04-23 00:30:37'),
(750, 'Renatio.DynamicPDF', 'comment', '2.1.2', 'Database maintenance. Updated all timestamp columns to be nullable.', '2021-04-23 00:30:37'),
(751, 'Renatio.DynamicPDF', 'comment', '2.1.3', 'Upgrade to DomPDF 0.8.', '2021-04-23 00:30:37'),
(752, 'Renatio.DynamicPDF', 'comment', '2.1.4', 'German language. Thanks to @TimFoerster.', '2021-04-23 00:30:37'),
(753, 'Renatio.DynamicPDF', 'comment', '2.1.5', 'Fix open_basedir restriction on some hostings. Set isRemoteEnabled flag to allow absolute paths.', '2021-04-23 00:30:37'),
(754, 'Renatio.DynamicPDF', 'comment', '2.1.6', 'Allow Laravel 5.5.', '2021-04-23 00:30:37'),
(755, 'Renatio.DynamicPDF', 'comment', '3.0.0', '!!! Add support for Laravel 5.5.', '2021-04-23 00:30:37'),
(756, 'Renatio.DynamicPDF', 'comment', '3.0.1', 'Add support for RainLab.Translate plugin.', '2021-04-23 00:30:37'),
(757, 'Renatio.DynamicPDF', 'comment', '3.0.2', 'Fix creating fonts directory.', '2021-04-23 00:30:37'),
(758, 'Renatio.DynamicPDF', 'comment', '3.0.3', 'Allow to use CMS partials and filters.', '2021-04-23 00:30:37'),
(759, 'Renatio.DynamicPDF', 'script', '3.0.4', 'add_paper_configuration_to_templates_table.php', '2021-04-23 00:30:37'),
(760, 'Renatio.DynamicPDF', 'comment', '3.0.4', 'Add paper size and orientation configuration.', '2021-04-23 00:30:37'),
(761, 'Renatio.DynamicPDF', 'comment', '3.0.5', 'Support LESS in PDF layouts.', '2021-04-23 00:30:37'),
(762, 'Renatio.DynamicPDF', 'comment', '4.0.0', '!!! Require PHP 7.1. Please see upgrade guide before update.', '2021-04-23 00:30:37'),
(763, 'Renatio.DynamicPDF', 'comment', '4.0.1', 'Fix error when active theme is not set.', '2021-04-23 00:30:37'),
(764, 'Renatio.DynamicPDF', 'script', '4.0.2', 'add_is_custom_to_templates_table.php', '2021-04-23 00:30:37'),
(765, 'Renatio.DynamicPDF', 'script', '4.0.2', 'add_is_locked_to_layouts_table.php', '2021-04-23 00:30:37'),
(766, 'Renatio.DynamicPDF', 'comment', '4.0.2', 'Allow to register mail templates and layouts.', '2021-04-23 00:30:37'),
(767, 'Renatio.DynamicPDF', 'script', '4.0.3', 'fix_custom_templates_error.php', '2021-04-23 00:30:37'),
(768, 'Renatio.DynamicPDF', 'comment', '4.0.3', 'Fix custom templates error.', '2021-04-23 00:30:37'),
(769, 'Renatio.DynamicPDF', 'comment', '4.0.4', 'Fix composer installation.', '2021-04-23 00:30:37'),
(770, 'Renatio.DynamicPDF', 'comment', '4.0.5', 'Fix custom template error.', '2021-04-23 00:30:37'),
(771, 'Renatio.DynamicPDF', 'comment', '4.0.6', 'Allow to reset view template to default.', '2021-04-23 00:30:37'),
(772, 'Renatio.DynamicPDF', 'comment', '4.0.7', 'Add Polish translation.', '2021-04-23 00:30:37'),
(773, 'Renatio.DynamicPDF', 'comment', '4.0.8', 'Allow to set dompdf option with dynamic method.', '2021-04-23 00:30:37'),
(774, 'Vdomah.Roles', 'script', '1.0.0', 'builder_table_create_vdomah_roles_roles.php', '2021-04-23 00:38:17'),
(775, 'Vdomah.Roles', 'script', '1.0.0', 'builder_table_create_vdomah_roles_permissions.php', '2021-04-23 00:38:17'),
(776, 'Vdomah.Roles', 'script', '1.0.0', 'users_add_role_id_column.php', '2021-04-23 00:38:17'),
(777, 'Vdomah.Roles', 'comment', '1.0.0', 'Initialize plugin.', '2021-04-23 00:38:17'),
(778, 'Vdomah.Roles', 'comment', '1.0.1', 'Permission name transaltable. Readme update. Move static methods to Helper', '2021-04-23 00:38:17'),
(779, 'Vdomah.Roles', 'comment', '1.0.2', 'Soft implementation of RainLab.Translate', '2021-04-23 00:38:17'),
(780, 'Vdomah.Roles', 'comment', '1.0.3', 'SimpleTree trait implemented, fixed roles dropdown in user form', '2021-04-23 00:38:17'),
(781, 'Vdomah.Roles', 'comment', '1.0.4', 'Replaced hardcoded backend urls with dynamic links in view (thanks to Damian Verhaar)', '2021-04-23 00:38:17'),
(782, 'Vdomah.Roles', 'comment', '1.0.5', 'Replaced hardcoded backend urls with dynamic links in controller (thanks to Damian Verhaar)', '2021-04-23 00:38:17'),
(783, 'Vdomah.Roles', 'comment', '1.1.0', 'CMS Pages access managment by assigning roles and permissions', '2021-04-23 00:38:17'),
(784, 'Vdomah.Roles', 'comment', '1.1.1', 'CMS Pages access managment moved to separate tab', '2021-04-23 00:38:17'),
(785, 'Vdomah.Roles', 'comment', '1.1.2', 'Fixed bug wich prevented returning the whole ancestor tree in a role (thanks Daniel Tamas). En translations updated', '2021-04-23 00:38:17'),
(786, 'Vdomah.Roles', 'comment', '1.1.3', '\"Logged only\" CMS page parameter added', '2021-04-23 00:38:17'),
(787, 'Vdomah.Roles', 'comment', '1.2.0', 'Lovata.Buddies plugin integration', '2021-04-23 00:38:17'),
(788, 'Vdomah.Roles', 'script', '1.2.1', 'buddies_add_role_id_column.php', '2021-04-23 00:38:17'),
(789, 'Vdomah.Roles', 'comment', '1.2.1', 'Check if users table exists in migrations before altering it', '2021-04-23 00:38:17'),
(790, 'Vdomah.Roles', 'comment', '1.2.2', 'Add fillable to Role model', '2021-04-23 00:38:17'),
(791, 'Vdomah.Roles', 'comment', '1.2.3', 'role_id field nullable', '2021-04-23 00:38:17'),
(792, 'Vdomah.Roles', 'comment', '1.2.4', 'Check role_id exists in users table and add if no', '2021-04-23 00:38:17'),
(793, 'Vdomah.Roles', 'comment', '1.2.5', 'Added isRole and able methods to user object', '2021-04-23 00:38:17'),
(794, 'Vdomah.Roles', 'comment', '1.2.6', 'Added roleByCode twig helper and corresponding Helper::roleByCode php helper', '2021-04-23 00:38:17'),
(795, 'Vdomah.Roles', 'comment', '1.2.7', 'Page role and permission are stored as codes. Backwards compatibility for id (int) so no changes are mandatory for existing projects', '2021-04-23 00:38:17'),
(796, 'Vdomah.Roles', 'comment', '1.2.8', 'Fixed roleByCode helper.', '2021-04-23 00:38:17'),
(797, 'Vdomah.Roles', 'script', '1.3.0', 'builder_table_update_buddies_rename_role_id_column.php', '2021-04-23 00:38:17'),
(798, 'Vdomah.Roles', 'script', '1.3.0', 'builder_table_update_users_rename_role_id_column.php', '2021-04-23 00:38:17'),
(799, 'Vdomah.Roles', 'comment', '1.3.0', '!!! Rename role_id to vdomah_roles_role_id (needed by guidelines).', '2021-04-23 00:38:17'),
(800, 'Vdomah.Roles', 'comment', '1.3.1', 'vdomah_roles_role_id made fillable', '2021-04-23 00:38:17'),
(801, 'Vdomah.Roles', 'script', '1.3.2', 'builder_table_update_buddies_rename_role_id_column.php', '2021-04-23 00:38:17'),
(802, 'Vdomah.Roles', 'script', '1.3.2', 'builder_table_update_users_rename_role_id_column.php', '2021-04-23 00:38:17'),
(803, 'Vdomah.Roles', 'comment', '1.3.2', 'Fixed v1.3.0 migrations declarations', '2021-04-23 00:38:17'),
(804, 'Vdomah.Roles', 'comment', '1.3.3', 'Permissions type:relation removed', '2021-04-23 00:38:17'),
(805, 'Vdomah.Roles', 'script', '1.3.4', 'builder_table_update_buddies_rename_role_id_column2.php', '2021-04-23 00:38:17'),
(806, 'Vdomah.Roles', 'script', '1.3.4', 'builder_table_update_users_rename_role_id_column2.php', '2021-04-23 00:38:17'),
(807, 'Vdomah.Roles', 'comment', '1.3.4', 'Rename vdomah_roles_role_id column to vdomah_role_id', '2021-04-23 00:38:17'),
(808, 'Vdomah.Roles', 'comment', '1.3.5', 'Fix class names in migrations from v1.3.4', '2021-04-23 00:38:17'),
(809, 'Vdomah.Roles', 'comment', '1.3.6', 'isRole fix error when user not logged in', '2021-04-23 00:38:17'),
(810, 'Vdomah.Roles', 'comment', '1.3.7', 'Helper::iterateChildren fix. Documented Helper class.', '2021-04-23 00:38:17'),
(811, 'Vdomah.Roles', 'script', '1.3.8', 'builder_table_update_role_id_nullable.php', '2021-04-23 00:38:17'),
(812, 'Vdomah.Roles', 'comment', '1.3.8', 'Make sure vdomah_role_id column in users/lovata_buddies_users is nullable.', '2021-04-23 00:38:17'),
(813, 'Vdomah.Roles', 'comment', '1.3.9', 'Roles list as tree.', '2021-04-23 00:38:17'),
(814, 'Vdomah.Roles', 'comment', '1.3.10', 'emptyOption added in user form role dropdown.', '2021-04-23 00:38:17'),
(815, 'Vdomah.Roles', 'comment', '1.3.11', 'Role field extended - prevent from appearing in repeater of the same model form.', '2021-04-23 00:38:17'),
(816, 'Zen.Robots', 'comment', '1.0.1', 'First version of robots.txt', '2021-12-09 02:40:01'),
(817, 'Zen.Robots', 'script', '1.0.2', 'robots_init.php', '2021-12-09 02:40:01'),
(818, 'Zen.Robots', 'comment', '1.0.2', 'Set default settings after install', '2021-12-09 02:40:01'),
(819, 'Zen.Robots', 'comment', '1.0.3', 'Added translations and permission control', '2021-12-09 02:40:01'),
(820, 'Zen.Robots', 'comment', '1.0.4', 'Added Hungarian translate (thanks to Szabó Gergő)', '2021-12-09 02:40:01'),
(821, 'Zen.Robots', 'comment', '1.0.5', 'Small fixes', '2021-12-09 02:40:01'),
(822, 'RainLab.Translate', 'comment', '1.8.4', 'Fixes the multilingual mediafinder to work with the media module.', '2022-04-29 22:12:23'),
(823, 'RainLab.Translate', 'comment', '1.8.6', 'Fixes invisible checkboxes when scanning for messages.', '2022-04-29 22:12:23'),
(824, 'RainLab.Translate', 'comment', '1.8.7', 'Fixes Markdown editor translation.', '2022-04-29 22:12:23'),
(825, 'RainLab.Translate', 'comment', '1.8.8', 'Fixes Laravel compatibility in custom Repeater.', '2022-04-29 22:12:23'),
(826, 'RainLab.Translate', 'comment', '1.9.0', 'Restores ability to translate URLs with CMS Editor in October v2.0', '2022-04-29 22:12:23'),
(827, 'RainLab.Translate', 'comment', '1.9.1', 'Minor styling improvements', '2022-04-29 22:12:23'),
(828, 'RainLab.Translate', 'comment', '1.9.2', 'Fixes issue creating new content in CMS Editor', '2022-04-29 22:12:23'),
(829, 'RainLab.Translate', 'comment', '1.9.3', 'Improves support when using child themes', '2022-04-29 22:12:24'),
(830, 'RainLab.Translate', 'comment', '1.10.0', 'Adds new multilingual nested form widget. Adds withFallbackLocale method.', '2022-04-29 22:12:24'),
(831, 'RainLab.Translate', 'comment', '1.10.1', 'Improve support with October v2.0', '2022-04-29 22:12:24'),
(832, 'RainLab.Translate', 'comment', '1.10.2', 'Improve support with October v2.2', '2022-04-29 22:12:24'),
(833, 'RainLab.Translate', 'comment', '1.10.3', 'Multilingual control improvements', '2022-04-29 22:12:24'),
(834, 'RainLab.Translate', 'comment', '1.10.4', 'Improve media finder support with October v2.2', '2022-04-29 22:12:24'),
(835, 'RainLab.Translate', 'comment', '1.10.5', 'Fixes media finder when only 1 locale is available', '2022-04-29 22:12:24'),
(836, 'Indikator.Backend', 'comment', '1.0.0', 'First version of Backend Plus.', '2024-12-12 02:35:27'),
(837, 'Indikator.Backend', 'comment', '1.0.1', 'Fixed the update count issue.', '2024-12-12 02:35:27'),
(838, 'Indikator.Backend', 'comment', '1.0.2', 'Added Last logins widget.', '2024-12-12 02:35:27'),
(839, 'Indikator.Backend', 'comment', '1.0.3', 'Added RSS viewer widget.', '2024-12-12 02:35:27'),
(840, 'Indikator.Backend', 'comment', '1.0.4', 'Minor improvements and bugfix.', '2024-12-12 02:35:27'),
(841, 'Indikator.Backend', 'comment', '1.0.5', 'Added Random images widget.', '2024-12-12 02:35:27'),
(842, 'Indikator.Backend', 'comment', '1.0.6', 'Added virtual keyboard option.', '2024-12-12 02:35:27'),
(843, 'Indikator.Backend', 'comment', '1.1.0', 'Added Lorem ipsum components (image and text).', '2024-12-12 02:35:27'),
(844, 'Indikator.Backend', 'comment', '1.1.0', 'Improving the Random images widget with slideshow.', '2024-12-12 02:35:27'),
(845, 'Indikator.Backend', 'comment', '1.1.0', 'Added Turkish translation (thanks to mahony0).', '2024-12-12 02:35:27'),
(846, 'Indikator.Backend', 'comment', '1.1.0', 'Fixed the URL path issue by virtual keyboard.', '2024-12-12 02:35:27'),
(847, 'Indikator.Backend', 'comment', '1.1.1', 'Hide the \"Find more themes\" link.', '2024-12-12 02:35:27'),
(848, 'Indikator.Backend', 'comment', '1.1.2', 'Added German translation.', '2024-12-12 02:35:27'),
(849, 'Indikator.Backend', 'comment', '1.1.3', 'The widgets work on localhost too.', '2024-12-12 02:35:27'),
(850, 'Indikator.Backend', 'comment', '1.1.4', 'Added Spanish translation.', '2024-12-12 02:35:27'),
(851, 'Indikator.Backend', 'comment', '1.2.0', 'All features are working on the whole backend.', '2024-12-12 02:35:27'),
(852, 'Indikator.Backend', 'comment', '1.2.1', 'Rounded profile image is optional in top menu.', '2024-12-12 02:35:27'),
(853, 'Indikator.Backend', 'comment', '1.2.2', 'Fixed the authenticated user bug.', '2024-12-12 02:35:27'),
(854, 'Indikator.Backend', 'comment', '1.2.3', 'Hide the Media menu optional in top menu.', '2024-12-12 02:35:27'),
(855, 'Indikator.Backend', 'comment', '1.2.4', 'Minor improvements and bugfix.', '2024-12-12 02:35:27'),
(856, 'Indikator.Backend', 'comment', '1.2.5', 'Renamed the name of backend widgets.', '2024-12-12 02:35:27'),
(857, 'Indikator.Backend', 'comment', '1.2.6', 'Improved the automatic search focus.', '2024-12-12 02:35:27'),
(858, 'Indikator.Backend', 'comment', '1.2.7', 'Minor improvements.', '2024-12-12 02:35:27'),
(859, 'Indikator.Backend', 'comment', '1.2.8', 'Fixed the hiding Media menu issue.', '2024-12-12 02:35:27'),
(860, 'Indikator.Backend', 'comment', '1.2.9', 'Improved the widget exception handling.', '2024-12-12 02:35:27'),
(861, 'Indikator.Backend', 'comment', '1.3.0', 'Added 2 new options for Settings.', '2024-12-12 02:35:27'),
(862, 'Indikator.Backend', 'comment', '1.3.1', 'Fixed the search field hide issue.', '2024-12-12 02:35:27'),
(863, 'Indikator.Backend', 'comment', '1.3.2', 'Delete only demo folder instead of october.', '2024-12-12 02:35:27'),
(864, 'Indikator.Backend', 'comment', '1.3.3', 'Added clear button option to form fields.', '2024-12-12 02:35:27'),
(865, 'Indikator.Backend', 'comment', '1.3.4', 'Improved the Media menu hiding.', '2024-12-12 02:35:27'),
(866, 'Indikator.Backend', 'comment', '1.3.5', 'Fixed the automatically focus option.', '2024-12-12 02:35:27'),
(867, 'Indikator.Backend', 'comment', '1.3.6', 'Added the Cache dashboard widget.', '2024-12-12 02:35:27'),
(868, 'Indikator.Backend', 'comment', '1.4.0', 'Added 2 new form widgets.', '2024-12-12 02:35:27'),
(869, 'Indikator.Backend', 'comment', '1.4.1', 'Added new colorpicker form widget.', '2024-12-12 02:35:27'),
(870, 'Indikator.Backend', 'comment', '1.4.2', 'Minor improvements.', '2024-12-12 02:35:27'),
(871, 'Indikator.Backend', 'comment', '1.4.3', 'Improved the Cache dashboard widget.', '2024-12-12 02:35:27'),
(872, 'Indikator.Backend', 'comment', '1.4.4', 'Updated for latest October.', '2024-12-12 02:35:27'),
(873, 'Indikator.Backend', 'comment', '1.4.5', 'Minor improvements and bugfix.', '2024-12-12 02:35:27'),
(874, 'Indikator.Backend', 'comment', '1.4.6', 'Improved the UI and fixed bug.', '2024-12-12 02:35:27'),
(875, 'Indikator.Backend', 'comment', '1.4.7', 'Hide the label in top menu.', '2024-12-12 02:35:27'),
(876, 'Indikator.Backend', 'comment', '1.4.8', 'Enable the gzip compression.', '2024-12-12 02:35:27'),
(877, 'Indikator.Backend', 'script', '1.5.0', 'create_trash_table.php', '2024-12-12 02:35:27'),
(878, 'Indikator.Backend', 'comment', '1.5.0', 'Delete the unused files and folders.', '2024-12-12 02:35:27'),
(879, 'Indikator.Backend', 'comment', '1.5.1', 'Minor improvements and bugfix.', '2024-12-12 02:35:27'),
(880, 'Indikator.Backend', 'comment', '1.5.2', 'Improved the Trash items page.', '2024-12-12 02:35:27'),
(881, 'Indikator.Backend', 'comment', '1.5.3', 'Expanded the Trash items page.', '2024-12-12 02:35:27'),
(882, 'Indikator.Backend', 'comment', '1.5.4', 'Minor improvements.', '2024-12-12 02:35:27'),
(883, 'Indikator.Backend', 'comment', '1.5.5', 'Added tooltip when hiding the labels.', '2024-12-12 02:35:27'),
(884, 'Indikator.Backend', 'comment', '1.5.6', 'Fixed the page overflow issue.', '2024-12-12 02:35:27'),
(885, 'Indikator.Backend', 'comment', '1.5.7', 'Added the context menu feature.', '2024-12-12 02:35:27'),
(886, 'Indikator.Backend', 'comment', '1.5.8', 'Improved the context menu.', '2024-12-12 02:35:27'),
(887, 'Indikator.Backend', 'comment', '1.6.0', 'Available the Elite version.', '2024-12-12 02:35:27'),
(888, 'Indikator.Backend', 'comment', '1.6.1', 'Added the Russian translation.', '2024-12-12 02:35:27'),
(889, 'Indikator.Backend', 'comment', '1.6.2', 'Added the Brazilian Portuguese lang.', '2024-12-12 02:35:27'),
(890, 'Indikator.Backend', 'comment', '1.6.3', 'Minor improvements.', '2024-12-12 02:35:27'),
(891, 'Indikator.Backend', 'comment', '1.6.4', 'Fixed the German translation.', '2024-12-12 02:35:27'),
(892, 'Indikator.Backend', 'comment', '1.6.5', 'Fixed the Cache widget issue.', '2024-12-12 02:35:27'),
(893, 'Indikator.Backend', 'comment', '1.6.6', '!!! Updated for October 420+.', '2024-12-12 02:35:27'),
(894, 'Indikator.Backend', 'comment', '1.6.7', 'Added more trash items.', '2024-12-12 02:35:27'),
(895, 'Indikator.Backend', 'comment', '1.6.8', 'Minor improvements.', '2024-12-12 02:35:27'),
(896, 'Indikator.Backend', 'comment', '1.6.9', 'Added permission to Dashboard widgets.', '2024-12-12 02:35:27'),
(897, 'Indikator.Backend', 'comment', '1.6.10', 'Added Polish translation.', '2024-12-12 02:35:27'),
(898, 'Indikator.Backend', 'comment', '1.6.11', 'Updated the trash file list.', '2024-12-12 02:35:27'),
(899, 'Indikator.Backend', 'comment', '1.6.12', 'Added more trash items.', '2024-12-12 02:35:27'),
(900, 'Indikator.Backend', 'comment', '1.6.13', 'Added Slovenian translation.', '2024-12-12 02:35:27'),
(901, 'RainLab.Translate', 'comment', '1.11.0', 'Update to latest Media Finder changes in October v2.2', '2024-12-12 02:37:28'),
(902, 'RainLab.Translate', 'comment', '1.11.1', 'Improve support with October v3.0', '2024-12-12 02:37:28'),
(903, 'RainLab.Translate', 'comment', '1.12.0', 'Adds scopeTransWhereNoFallback method', '2024-12-12 02:37:28'),
(904, 'Zhalgas.Content', 'comment', '1.0.1', 'Initialize plugin.', '2025-01-12 04:04:50'),
(905, 'Zhalgas.Catalog', 'comment', '1.0.1', 'Initialize plugin.', '2025-01-12 08:29:12'),
(906, 'Zhalgas.Catalog', 'script', '1.0.2', 'builder_table_create_zhalgas_catalog_categories.php', '2025-01-12 08:29:52'),
(907, 'Zhalgas.Catalog', 'comment', '1.0.2', 'Created table zhalgas_catalog_categories', '2025-01-12 08:29:52'),
(908, 'Zhalgas.Catalog', 'script', '1.0.3', 'builder_table_create_zhalgas_catalog_products.php', '2025-01-12 08:37:06'),
(909, 'Zhalgas.Catalog', 'comment', '1.0.3', 'Created table zhalgas_catalog_products', '2025-01-12 08:37:06'),
(910, 'Zhalgas.Content', 'script', '1.0.2', 'builder_table_create_zhalgas_content_home.php', '2025-01-23 04:50:57'),
(911, 'Zhalgas.Content', 'comment', '1.0.2', 'Created table zhalgas_content_home', '2025-01-23 04:50:57'),
(912, 'Zhalgas.Content', 'script', '1.0.3', 'builder_table_create_zhalgas_content_about.php', '2025-01-23 06:36:00'),
(913, 'Zhalgas.Content', 'comment', '1.0.3', 'Created table zhalgas_content_about', '2025-01-23 06:36:00');

-- --------------------------------------------------------

--
-- Структура таблицы `system_plugin_versions`
--

CREATE TABLE `system_plugin_versions` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `is_frozen` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_plugin_versions`
--

INSERT INTO `system_plugin_versions` (`id`, `code`, `version`, `created_at`, `is_disabled`, `is_frozen`) VALUES
(1, 'October.Demo', '1.0.1', '2021-04-22 23:38:12', 0, 1),
(3, 'RainLab.Sitemap', '1.0.9', '2021-04-22 23:45:04', 0, 1),
(4, 'RainLab.Blog', '1.5.0', '2021-04-22 23:45:30', 0, 1),
(7, 'Martin.Forms', '1.5.1', '2021-04-22 23:48:06', 0, 1),
(8, 'RainLab.Translate', '1.12.0', '2024-12-12 02:37:28', 0, 0),
(9, 'RainLab.Builder', '1.0.27', '2021-04-22 23:48:48', 0, 1),
(11, 'AnandPatel.SeoExtension', '1.0.6', '2021-04-22 23:49:27', 0, 1),
(12, 'Mey.Breadcrumbs', '1.0.10', '2021-04-22 23:49:41', 0, 1),
(16, 'Lovata.Buddies', '1.8.1', '2021-04-22 23:50:47', 1, 1),
(17, 'ToughDeveloper.ImageResizer', '1.4.1', '2021-04-22 23:54:08', 0, 1),
(20, 'RainLab.BlogVideo', '1.1.2', '2021-04-23 00:14:16', 1, 1),
(21, 'OFFLINE.SiteSearch', '1.5.6', '2021-04-23 00:15:39', 1, 1),
(25, 'Ribsousa.Featuredimages', '1.0.1', '2021-04-23 00:21:34', 0, 1),
(26, 'AnandPatel.WysiwygEditors', '1.2.9', '2021-04-23 00:27:49', 0, 1),
(27, 'Renatio.DynamicPDF', '4.0.8', '2021-04-23 00:30:37', 1, 1),
(28, 'Vdomah.Roles', '1.3.11', '2021-04-23 00:38:17', 0, 1),
(29, 'Zen.Robots', '1.0.5', '2021-12-09 02:40:01', 0, 1),
(30, 'Indikator.Backend', '1.6.13', '2024-12-12 02:35:27', 0, 0),
(31, 'Zhalgas.Content', '1.0.1', '2025-01-31 04:55:08', 0, 0),
(32, 'Zhalgas.Catalog', '1.0.3', '2025-01-12 08:37:06', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `system_request_logs`
--

CREATE TABLE `system_request_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_revisions`
--

CREATE TABLE `system_revisions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cast` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `item` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `system_settings`
--

INSERT INTO `system_settings` (`id`, `item`, `value`) VALUES
(1, 'mohsin_txt_settings', '{\"human_fields\":[{\"human_field\":\"Team\"},{\"human_field\":\"Site\"},{\"human_field\":\"Thanks\"},{\"human_field\":\"Technology\"}]}'),
(3, 'zen_robots_settings', '{\"content\":\"User-agent: *\\r\\nDisallow: \\/\\r\\nHost: $domain\\r\\nSitemap: $domain\\/sitemap.xml\"}'),
(4, 'system_mail_settings', '{\"send_mode\":\"mail\",\"sender_name\":\"Website\",\"sender_email\":\"noreply@abcdesign.kz\",\"sendmail_path\":\"\\/usr\\/sbin\\/sendmail -bs\",\"smtp_address\":\"smtp.mailgun.org\",\"smtp_port\":\"587\",\"smtp_user\":\"\",\"smtp_password\":\"\",\"smtp_authorization\":\"0\",\"smtp_encryption\":\"tls\",\"mailgun_domain\":\"\",\"mailgun_secret\":\"\",\"mandrill_secret\":\"\",\"ses_key\":\"\",\"ses_secret\":\"\",\"ses_region\":\"\",\"sparkpost_secret\":\"\"}'),
(5, 'rainlab_builder_settings', '{\"author_name\":\"Zhalgas\",\"author_namespace\":\"Zhalgas\"}'),
(6, 'anandpatel_wysiwygeditors_settings', '{\"editor\":\"tinymce\",\"editor_width\":\"\",\"editor_height\":\"\",\"toolbar_tinymce\":\"undo redo | bold italic underline | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image media ocmediamanager\",\"toolbar_ckeditor\":\"[\'Undo\', \'Redo\'], [\'Cut\', \'Copy\', \'Paste\', \'PasteText\', \'PasteFromWord\'], [\'Format\', \'FontSize\'], [\'ShowBlocks\', \'SelectAll\', \'RemoveFormat\'], [\'Source\'], [\'Maximize\'], \'\\/\', [\'Bold\', \'Italic\', \'Underline\', \'Strike\'], [\'JustifyLeft\', \'JustifyCenter\', \'JustifyRight\', \'JustifyBlock\'], [\'BulletedList\', \'NumberedList\', \'Outdent\', \'Indent\'], [\'TextColor\', \'BGColor\'], [\'Link\', \'Unlink\', \'Anchor\'], [\'Image\', \'Table\', \'oembed\', \'SpecialChar\', \'OcMediaManager\']\",\"cms_page_as_wysiwyg\":\"0\",\"cms_content_as_wysiwyg\":\"0\",\"cms_partial_as_wysiwyg\":\"0\",\"cms_layout_as_wysiwyg\":\"0\",\"others_as_wysiwyg\":\"0\",\"blog_as_wysiwyg\":\"0\"}'),
(7, 'backend_brand_settings', '{\"app_name\":\"October CMS\",\"app_tagline\":\"\\u0412\\u043e\\u0437\\u0432\\u0440\\u0430\\u0449\\u0435\\u043d\\u0438\\u0435 \\u043a \\u0438\\u0441\\u0442\\u043e\\u043a\\u0430\\u043c\",\"primary_color\":\"#1e1e2f\",\"secondary_color\":\"#1e1e2f\",\"accent_color\":\"#28a745\",\"menu_mode\":\"inline\",\"custom_css\":\"\"}');

-- --------------------------------------------------------

--
-- Структура таблицы `vdomah_roles_permissions`
--

CREATE TABLE `vdomah_roles_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `vdomah_roles_roles`
--

CREATE TABLE `vdomah_roles_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `backend_access_log`
--
ALTER TABLE `backend_access_log`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `backend_users`
--
ALTER TABLE `backend_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login_unique` (`login`),
  ADD UNIQUE KEY `email_unique` (`email`),
  ADD KEY `act_code_index` (`activation_code`),
  ADD KEY `reset_code_index` (`reset_password_code`),
  ADD KEY `admin_role_index` (`role_id`);

--
-- Индексы таблицы `backend_users_groups`
--
ALTER TABLE `backend_users_groups`
  ADD PRIMARY KEY (`user_id`,`user_group_id`);

--
-- Индексы таблицы `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_unique` (`name`),
  ADD KEY `code_index` (`code`);

--
-- Индексы таблицы `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`);

--
-- Индексы таблицы `backend_user_roles`
--
ALTER TABLE `backend_user_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_unique` (`name`),
  ADD KEY `role_code_index` (`code`);

--
-- Индексы таблицы `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `backend_user_throttle_user_id_index` (`user_id`),
  ADD KEY `backend_user_throttle_ip_address_index` (`ip_address`);

--
-- Индексы таблицы `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Индексы таблицы `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_data_theme_index` (`theme`);

--
-- Индексы таблицы `cms_theme_logs`
--
ALTER TABLE `cms_theme_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_logs_type_index` (`type`),
  ADD KEY `cms_theme_logs_theme_index` (`theme`),
  ADD KEY `cms_theme_logs_user_id_index` (`user_id`);

--
-- Индексы таблицы `cms_theme_templates`
--
ALTER TABLE `cms_theme_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cms_theme_templates_source_index` (`source`),
  ADD KEY `cms_theme_templates_path_index` (`path`);

--
-- Индексы таблицы `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deferred_bindings_master_type_index` (`master_type`),
  ADD KEY `deferred_bindings_master_field_index` (`master_field`),
  ADD KEY `deferred_bindings_slave_type_index` (`slave_type`),
  ADD KEY `deferred_bindings_slave_id_index` (`slave_id`),
  ADD KEY `deferred_bindings_session_key_index` (`session_key`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `indikator_backend_trash`
--
ALTER TABLE `indikator_backend_trash`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Индексы таблицы `lovata_buddies_addition_properties`
--
ALTER TABLE `lovata_buddies_addition_properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lovata_buddies_addition_properties_name_index` (`name`),
  ADD KEY `lovata_buddies_addition_properties_slug_index` (`slug`),
  ADD KEY `lovata_buddies_addition_properties_code_index` (`code`),
  ADD KEY `lovata_buddies_addition_properties_sort_order_index` (`sort_order`);

--
-- Индексы таблицы `lovata_buddies_groups`
--
ALTER TABLE `lovata_buddies_groups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `lovata_buddies_socialite_tokens`
--
ALTER TABLE `lovata_buddies_socialite_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lovata_buddies_socialite_tokens_user_id_index` (`user_id`),
  ADD KEY `lovata_buddies_socialite_tokens_code_index` (`code`),
  ADD KEY `lovata_buddies_socialite_tokens_external_id_index` (`external_id`);

--
-- Индексы таблицы `lovata_buddies_throttle`
--
ALTER TABLE `lovata_buddies_throttle`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `lovata_buddies_users`
--
ALTER TABLE `lovata_buddies_users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `lovata_buddies_users_groups`
--
ALTER TABLE `lovata_buddies_users_groups`
  ADD PRIMARY KEY (`user_id`,`group_id`);

--
-- Индексы таблицы `martin_forms_records`
--
ALTER TABLE `martin_forms_records`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `offline_sitesearch_query_logs`
--
ALTER TABLE `offline_sitesearch_query_logs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rainlab_blog_categories`
--
ALTER TABLE `rainlab_blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_blog_categories_slug_index` (`slug`),
  ADD KEY `rainlab_blog_categories_parent_id_index` (`parent_id`);

--
-- Индексы таблицы `rainlab_blog_posts`
--
ALTER TABLE `rainlab_blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_blog_posts_user_id_index` (`user_id`),
  ADD KEY `rainlab_blog_posts_slug_index` (`slug`);

--
-- Индексы таблицы `rainlab_blog_posts_categories`
--
ALTER TABLE `rainlab_blog_posts_categories`
  ADD PRIMARY KEY (`post_id`,`category_id`);

--
-- Индексы таблицы `rainlab_sitemap_definitions`
--
ALTER TABLE `rainlab_sitemap_definitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_sitemap_definitions_theme_index` (`theme`);

--
-- Индексы таблицы `rainlab_translate_attributes`
--
ALTER TABLE `rainlab_translate_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_translate_attributes_locale_index` (`locale`),
  ADD KEY `rainlab_translate_attributes_model_id_index` (`model_id`),
  ADD KEY `rainlab_translate_attributes_model_type_index` (`model_type`);

--
-- Индексы таблицы `rainlab_translate_indexes`
--
ALTER TABLE `rainlab_translate_indexes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_translate_indexes_locale_index` (`locale`),
  ADD KEY `rainlab_translate_indexes_model_id_index` (`model_id`),
  ADD KEY `rainlab_translate_indexes_model_type_index` (`model_type`),
  ADD KEY `rainlab_translate_indexes_item_index` (`item`);

--
-- Индексы таблицы `rainlab_translate_locales`
--
ALTER TABLE `rainlab_translate_locales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_translate_locales_code_index` (`code`),
  ADD KEY `rainlab_translate_locales_name_index` (`name`);

--
-- Индексы таблицы `rainlab_translate_messages`
--
ALTER TABLE `rainlab_translate_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rainlab_translate_messages_code_index` (`code`);

--
-- Индексы таблицы `renatio_dynamicpdf_pdf_layouts`
--
ALTER TABLE `renatio_dynamicpdf_pdf_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `renatio_dynamicpdf_pdf_layouts_code_index` (`code`);

--
-- Индексы таблицы `renatio_dynamicpdf_pdf_templates`
--
ALTER TABLE `renatio_dynamicpdf_pdf_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `renatio_dynamicpdf_pdf_templates_layout_id_index` (`layout_id`),
  ADD KEY `renatio_dynamicpdf_pdf_templates_code_index` (`code`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Индексы таблицы `system_event_logs`
--
ALTER TABLE `system_event_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_event_logs_level_index` (`level`);

--
-- Индексы таблицы `system_files`
--
ALTER TABLE `system_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_files_field_index` (`field`),
  ADD KEY `system_files_attachment_id_index` (`attachment_id`),
  ADD KEY `system_files_attachment_type_index` (`attachment_type`);

--
-- Индексы таблицы `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `system_mail_partials`
--
ALTER TABLE `system_mail_partials`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_mail_templates_layout_id_index` (`layout_id`);

--
-- Индексы таблицы `system_parameters`
--
ALTER TABLE `system_parameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_index` (`namespace`,`group`,`item`);

--
-- Индексы таблицы `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_history_code_index` (`code`),
  ADD KEY `system_plugin_history_type_index` (`type`);

--
-- Индексы таблицы `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_plugin_versions_code_index` (`code`);

--
-- Индексы таблицы `system_request_logs`
--
ALTER TABLE `system_request_logs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `system_revisions`
--
ALTER TABLE `system_revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  ADD KEY `system_revisions_user_id_index` (`user_id`),
  ADD KEY `system_revisions_field_index` (`field`);

--
-- Индексы таблицы `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_settings_item_index` (`item`);

--
-- Индексы таблицы `vdomah_roles_permissions`
--
ALTER TABLE `vdomah_roles_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `vdomah_roles_roles`
--
ALTER TABLE `vdomah_roles_roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `backend_access_log`
--
ALTER TABLE `backend_access_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `backend_users`
--
ALTER TABLE `backend_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `backend_user_groups`
--
ALTER TABLE `backend_user_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `backend_user_preferences`
--
ALTER TABLE `backend_user_preferences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `backend_user_roles`
--
ALTER TABLE `backend_user_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `backend_user_throttle`
--
ALTER TABLE `backend_user_throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `cms_theme_data`
--
ALTER TABLE `cms_theme_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cms_theme_logs`
--
ALTER TABLE `cms_theme_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cms_theme_templates`
--
ALTER TABLE `cms_theme_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `deferred_bindings`
--
ALTER TABLE `deferred_bindings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `indikator_backend_trash`
--
ALTER TABLE `indikator_backend_trash`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `lovata_buddies_addition_properties`
--
ALTER TABLE `lovata_buddies_addition_properties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `lovata_buddies_groups`
--
ALTER TABLE `lovata_buddies_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `lovata_buddies_socialite_tokens`
--
ALTER TABLE `lovata_buddies_socialite_tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `lovata_buddies_throttle`
--
ALTER TABLE `lovata_buddies_throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `lovata_buddies_users`
--
ALTER TABLE `lovata_buddies_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `martin_forms_records`
--
ALTER TABLE `martin_forms_records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT для таблицы `offline_sitesearch_query_logs`
--
ALTER TABLE `offline_sitesearch_query_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `rainlab_blog_categories`
--
ALTER TABLE `rainlab_blog_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `rainlab_blog_posts`
--
ALTER TABLE `rainlab_blog_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `rainlab_sitemap_definitions`
--
ALTER TABLE `rainlab_sitemap_definitions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `rainlab_translate_attributes`
--
ALTER TABLE `rainlab_translate_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `rainlab_translate_indexes`
--
ALTER TABLE `rainlab_translate_indexes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `rainlab_translate_locales`
--
ALTER TABLE `rainlab_translate_locales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `rainlab_translate_messages`
--
ALTER TABLE `rainlab_translate_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT для таблицы `renatio_dynamicpdf_pdf_layouts`
--
ALTER TABLE `renatio_dynamicpdf_pdf_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `renatio_dynamicpdf_pdf_templates`
--
ALTER TABLE `renatio_dynamicpdf_pdf_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `system_event_logs`
--
ALTER TABLE `system_event_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `system_files`
--
ALTER TABLE `system_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `system_mail_layouts`
--
ALTER TABLE `system_mail_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `system_mail_partials`
--
ALTER TABLE `system_mail_partials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `system_mail_templates`
--
ALTER TABLE `system_mail_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `system_parameters`
--
ALTER TABLE `system_parameters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `system_plugin_history`
--
ALTER TABLE `system_plugin_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=914;

--
-- AUTO_INCREMENT для таблицы `system_plugin_versions`
--
ALTER TABLE `system_plugin_versions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT для таблицы `system_request_logs`
--
ALTER TABLE `system_request_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `system_revisions`
--
ALTER TABLE `system_revisions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `vdomah_roles_permissions`
--
ALTER TABLE `vdomah_roles_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `vdomah_roles_roles`
--
ALTER TABLE `vdomah_roles_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
