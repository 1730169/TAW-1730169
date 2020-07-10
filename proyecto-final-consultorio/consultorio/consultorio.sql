-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 10-07-2020 a las 04:51:21
-- Versión del servidor: 10.4.12-MariaDB
-- Versión de PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `consultorio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `email_template`
--

CREATE TABLE `email_template` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `email_template`
--

INSERT INTO `email_template` (`id`, `created_at`, `updated_at`, `content`, `name`, `subject`) VALUES
(1, NULL, NULL, '<!DOCTYPE html>\n                <html lang=\"en\">\n                <head>\n                    <meta charset=\"utf-8\">\n                    <meta name=\"viewport\" content=\"width=device-width\">\n                    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"> \n                    <meta name=\"x-apple-disable-message-reformatting\">\n                    <title>Example</title>\n                    <style>\n                        body {\n                            background-color:#fff;\n                            color:#222222;\n                            margin: 0px auto;\n                            padding: 0px;\n                            height: 100%;\n                            width: 100%;\n                            font-weight: 400;\n                            font-size: 15px;\n                            line-height: 1.8;\n                        }\n                        .continer{\n                            width:400px;\n                            margin-left:auto;\n                            margin-right:auto;\n                            background-color:#efefef;\n                            padding:30px;\n                        }\n                        .btn{\n                            padding: 5px 15px;\n                            display: inline-block;\n                        }\n                        .btn-primary{\n                            border-radius: 3px;\n                            background: #0b3c7c;\n                            color: #fff;\n                            text-decoration: none;\n                        }\n                        .btn-primary:hover{\n                            border-radius: 3px;\n                            background: #4673ad;\n                            color: #fff;\n                            text-decoration: none;\n                        }\n                    </style>\n                </head>\n                <body>\n                    <div class=\"continer\">\n                        <h1>Lorem ipsum dolor</h1>\n                        <h4>Ipsum dolor cet emit amet</h4>\n                        <p>\n                            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea <strong>commodo consequat</strong>. \n                            Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \n                            Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n                        </p>\n                        <h4>Ipsum dolor cet emit amet</h4>\n                        <p>\n                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod <a href=\"#\">tempor incididunt ut labore</a> et dolore magna aliqua.\n                            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n                        </p>\n                        <h4>Ipsum dolor cet emit amet</h4>\n                        <p>\n                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n                            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n                        </p>\n                        <a href=\"#\" class=\"btn btn-primary\">Lorem ipsum dolor</a>\n                        <h4>Ipsum dolor cet emit amet</h4>\n                        <p>\n                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n                            Ut enim ad minim veniam, quis nostrud exercitation <a href=\"#\">ullamco</a> laboris nisi ut aliquip ex ea commodo consequat. \n                            Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \n                            Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n                        </p>\n                    </div>\n                </body>\n                </html>', 'Example E-mail', 'Example E-mail');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `example`
--

CREATE TABLE `example` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `example`
--

INSERT INTO `example` (`id`, `created_at`, `updated_at`, `name`, `description`, `status_id`) VALUES
(1, NULL, NULL, 'Hic est reprehenderit delectus minus quis.', 'Quas eaque ratione et saepe expedita. Sequi optio quia ea omnis id distinctio ut. Totam sapiente vel exercitationem voluptatem qui et aut. Quas quo quibusdam corrupti maiores aspernatur sunt molestias.', 3),
(2, NULL, NULL, 'Voluptas doloremque dolorem quidem.', 'Quo fuga placeat quas blanditiis molestias. Corrupti dolorem incidunt hic dignissimos. Beatae odio eum rerum dolorem ut eos. Necessitatibus vitae autem occaecati corporis.', 2),
(3, NULL, NULL, 'Velit iste reprehenderit libero.', 'Minus ut qui error esse quo. Doloribus iusto voluptas laborum non dolor. Est a nulla aut odit quidem ea. Est minima aspernatur sed nihil.', 4),
(4, NULL, NULL, 'Deleniti assumenda quidem sapiente consequatur.', 'Est ut consequatur minus officia. Veritatis et atque similique et. Est nesciunt et repudiandae neque voluptate.', 3),
(5, NULL, NULL, 'Modi laboriosam dolorum.', 'Et deleniti labore inventore illo. Et voluptates odio quia. Autem et dolore dolorem laboriosam non praesentium aliquid.', 3),
(6, NULL, NULL, 'Eligendi est nisi culpa.', 'Ex tempore libero aut voluptatem nostrum corrupti. Perspiciatis quis ipsum odit quam. Quaerat non accusantium dolores ea. Qui nulla sint nihil aut.', 3),
(7, NULL, NULL, 'Totam quia autem officia.', 'Dignissimos pariatur sit adipisci iste incidunt reprehenderit eos. Et et voluptatem tenetur earum quidem aut. Cum maxime consectetur culpa iste nihil. Ut consequatur non natus qui beatae. Aspernatur architecto necessitatibus odio ea nemo officiis sit.', 2),
(8, NULL, NULL, 'Ea hic expedita dicta quae.', 'Consequuntur quis dolores ut. Tempore fugit officiis ratione ad. Iure quisquam omnis harum iusto explicabo. Voluptatem aut eos aut corporis.', 3),
(9, NULL, NULL, 'Reprehenderit aperiam et soluta autem corporis.', 'Numquam omnis et voluptatibus sequi in. Atque nihil provident soluta. Facilis incidunt non voluptatibus. Corrupti consequuntur sed sunt eum ipsam voluptas.', 3),
(10, NULL, NULL, 'Error molestias ut voluptates ut quisquam.', 'Quia dolorem deleniti qui modi maiores repudiandae. Eos dolorem ea ducimus ea consequatur expedita atque laborum. Et ad autem et perspiciatis consequatur incidunt nemo magni. Inventore ratione dolore temporibus odio hic impedit natus.', 3),
(11, NULL, NULL, 'Quis quod et commodi.', 'Est ut ipsum minima voluptas. Tempore qui officia debitis laudantium architecto aliquam. Consectetur voluptatem aut quos consequatur consequatur vitae vel. Qui quaerat sequi eos assumenda omnis unde officia.', 2),
(12, NULL, NULL, 'Hic ut quam quia.', 'Nesciunt et suscipit deleniti dolorum sit animi placeat. Cupiditate unde aspernatur ex nihil id dignissimos perspiciatis. Assumenda eum non modi voluptate ea.', 1),
(13, NULL, NULL, 'Repellendus deserunt aperiam.', 'Enim minus autem libero quia consequatur itaque. Rerum sit non excepturi qui corporis quisquam odit.', 4),
(14, NULL, NULL, 'Magnam asperiores aut.', 'Delectus qui qui inventore id. Eos consequatur praesentium eos optio unde. Aut vitae quibusdam porro suscipit cumque aut qui.', 1),
(15, NULL, NULL, 'Est quis magni id nobis.', 'Est quas est quia hic quisquam. In pariatur saepe dolores quis consectetur natus. Rerum a sit quia ducimus et velit doloribus. Quaerat et voluptatem qui facere. Vel et dolore est quaerat praesentium non.', 3),
(16, NULL, NULL, 'Perspiciatis tenetur ipsum consectetur.', 'Quidem quod ut voluptate aut sed amet. Facere qui et veritatis adipisci ut. Eos sapiente at est accusamus. Dolorem voluptatum vel possimus voluptatem.', 4),
(17, NULL, NULL, 'Voluptate cumque expedita et ut.', 'Magni reprehenderit natus sapiente quia fuga voluptatibus facere. Qui quisquam ut aut facere voluptatem.', 2),
(18, NULL, NULL, 'Est autem corrupti.', 'Eum dolores quis sed officiis. Ipsum voluptas sit amet reprehenderit quibusdam sed. Possimus architecto cum sed cupiditate sit voluptatibus voluptate adipisci.', 3),
(19, NULL, NULL, 'Omnis omnis consequatur similique rem.', 'Et est quod adipisci voluptate saepe et. Aut dolorum dolores hic et. Ex sed deleniti recusandae unde omnis eveniet consequatur. Exercitationem non est debitis et eum.', 2),
(20, NULL, NULL, 'Nostrum iste cumque est laudantium minus.', 'Nihil assumenda minima dolore sequi sed. Omnis quibusdam quo nostrum. Ullam non quod eum tenetur reiciendis tempore.', 3),
(21, NULL, NULL, 'Dolores et suscipit id.', 'Ea quod minus fugiat et beatae. Est est eos tenetur exercitationem. Eum qui fugit est voluptatem ipsa delectus provident unde.', 1),
(22, NULL, NULL, 'Et nihil voluptatem hic asperiores sint.', 'Inventore rerum quis debitis consequatur quisquam cum aut. Et repellat nesciunt cum iusto nulla blanditiis temporibus. Libero ad sint illum.', 4),
(23, NULL, NULL, 'Perferendis voluptatem quo architecto deleniti.', 'Optio consequatur consectetur atque libero atque. Commodi magni voluptatibus mollitia vitae.', 3),
(24, NULL, NULL, 'Repudiandae et fugit consequatur.', 'Et enim culpa quia sed quia. Velit ex sed ex quae. Voluptas id voluptates optio amet voluptatem. Quis facere expedita aut aut.', 4),
(25, NULL, NULL, 'Deleniti hic eligendi sapiente.', 'Laudantium et dolor est delectus tempora quia iusto. Expedita ex voluptatem nemo dolor ut. Ut ea error explicabo dolore quisquam excepturi. Sit quam quis alias vitae a facere vel.', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `folder`
--

CREATE TABLE `folder` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_id` int(10) UNSIGNED DEFAULT NULL,
  `resource` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `folder`
--

INSERT INTO `folder` (`id`, `created_at`, `updated_at`, `name`, `folder_id`, `resource`) VALUES
(1, NULL, NULL, 'root', NULL, NULL),
(2, NULL, NULL, 'resource', 1, 1),
(3, NULL, NULL, 'documents', 1, NULL),
(4, NULL, NULL, 'graphics', 1, NULL),
(5, NULL, NULL, 'other', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `form`
--

CREATE TABLE `form` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL,
  `edit` tinyint(1) NOT NULL,
  `add` tinyint(1) NOT NULL,
  `delete` tinyint(1) NOT NULL,
  `pagination` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `form`
--

INSERT INTO `form` (`id`, `created_at`, `updated_at`, `name`, `table_name`, `read`, `edit`, `add`, `delete`, `pagination`) VALUES
(1, NULL, NULL, 'Example', 'example', 1, 1, 1, 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `form_field`
--

CREATE TABLE `form_field` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `browse` tinyint(1) NOT NULL,
  `read` tinyint(1) NOT NULL,
  `edit` tinyint(1) NOT NULL,
  `add` tinyint(1) NOT NULL,
  `relation_table` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relation_column` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_id` int(10) UNSIGNED NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `form_field`
--

INSERT INTO `form_field` (`id`, `created_at`, `updated_at`, `name`, `type`, `browse`, `read`, `edit`, `add`, `relation_table`, `relation_column`, `form_id`, `column_name`) VALUES
(1, NULL, NULL, 'Title', 'text', 1, 1, 1, 1, NULL, NULL, 1, 'name'),
(2, NULL, NULL, 'Description', 'text_area', 1, 1, 1, 1, NULL, NULL, 1, 'description'),
(3, NULL, NULL, 'Status', 'relation_select', 1, 1, 1, 1, 'status', 'name', 1, 'status_id');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menulist`
--

CREATE TABLE `menulist` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menulist`
--

INSERT INTO `menulist` (`id`, `name`) VALUES
(1, 'sidebar menu'),
(2, 'top_menu');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `href` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `sequence` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `name`, `href`, `icon`, `slug`, `parent_id`, `menu_id`, `sequence`) VALUES
(1, 'Dashboard', '/', 'cil-speedometer', 'link', NULL, 1, 1),
(2, 'Login', '/login', 'cil-account-logout', 'link', NULL, 1, 2),
(3, 'Register', '/register', 'cil-account-logout', 'link', NULL, 1, 3),
(4, 'Settings', '/', 'cil-puzzle', 'dropdown', NULL, 1, 4),
(5, 'Media', '/media', NULL, 'link', 4, 1, 5),
(6, 'Users', '/users', NULL, 'link', 4, 1, 6),
(7, 'Menu', '/menu', NULL, 'link', 4, 1, 7),
(8, 'BREAD', '/bread', NULL, 'link', 4, 1, 8),
(9, 'Email', '/email', NULL, 'link', 4, 1, 9),
(10, 'Theme', NULL, NULL, 'title', NULL, 1, 10),
(11, 'Colors', '/colors', 'cil-drop', 'link', NULL, 1, 11),
(12, 'Typography', '/typography', 'cil-pencil', 'link', NULL, 1, 12),
(13, 'Components', NULL, NULL, 'title', NULL, 1, 13),
(14, 'Base', '/base', 'cil-puzzle', 'dropdown', NULL, 1, 14),
(15, 'Breadcrumb', '/base/breadcrumb', NULL, 'link', 14, 1, 15),
(16, 'Cards', '/base/cards', NULL, 'link', 14, 1, 16),
(17, 'Carousel', '/base/carousel', NULL, 'link', 14, 1, 17),
(18, 'Collapse', '/base/collapse', NULL, 'link', 14, 1, 18),
(19, 'Forms', '/base/forms', NULL, 'link', 14, 1, 19),
(20, 'Jumbotron', '/base/jumbotron', NULL, 'link', 14, 1, 20),
(21, 'List group', '/base/list-group', NULL, 'link', 14, 1, 21),
(22, 'Navs', '/base/navs', NULL, 'link', 14, 1, 22),
(23, 'Pagination', '/base/pagination', NULL, 'link', 14, 1, 23),
(24, 'Popovers', '/base/popovers', NULL, 'link', 14, 1, 24),
(25, 'Progress', '/base/progress', NULL, 'link', 14, 1, 25),
(26, 'Switches', '/base/switches', NULL, 'link', 14, 1, 26),
(27, 'Tables', '/base/tables', NULL, 'link', 14, 1, 27),
(28, 'Tabs', '/base/tabs', NULL, 'link', 14, 1, 28),
(29, 'Tooltips', '/base/tooltips', NULL, 'link', 14, 1, 29),
(30, 'Buttons', '/buttons', 'cil-cursor', 'dropdown', NULL, 1, 30),
(31, 'Buttons', '/buttons/buttons', NULL, 'link', 30, 1, 31),
(32, 'Buttons Group', '/buttons/button-group', NULL, 'link', 30, 1, 32),
(33, 'Dropdowns', '/buttons/dropdowns', NULL, 'link', 30, 1, 33),
(34, 'Brand Buttons', '/buttons/brand-buttons', NULL, 'link', 30, 1, 34),
(35, 'Charts', '/charts', 'cil-chart-pie', 'link', NULL, 1, 35),
(36, 'Icons', '/icon', 'cil-star', 'dropdown', NULL, 1, 36),
(37, 'CoreUI Icons', '/icon/coreui-icons', NULL, 'link', 36, 1, 37),
(38, 'Flags', '/icon/flags', NULL, 'link', 36, 1, 38),
(39, 'Brands', '/icon/brands', NULL, 'link', 36, 1, 39),
(40, 'Notifications', '/notifications', 'cil-bell', 'dropdown', NULL, 1, 40),
(41, 'Alerts', '/notifications/alerts', NULL, 'link', 40, 1, 41),
(42, 'Badge', '/notifications/badge', NULL, 'link', 40, 1, 42),
(43, 'Modals', '/notifications/modals', NULL, 'link', 40, 1, 43),
(44, 'Widgets', '/widgets', 'cil-calculator', 'link', NULL, 1, 44),
(45, 'Extras', NULL, NULL, 'title', NULL, 1, 45),
(46, 'Pages', '/pages', 'cil-star', 'dropdown', NULL, 1, 46),
(47, 'Login', '/login', NULL, 'link', 46, 1, 47),
(48, 'Register', '/register', NULL, 'link', 46, 1, 48),
(49, 'Error 404', '/404', NULL, 'link', 46, 1, 49),
(50, 'Error 500', '/500', NULL, 'link', 46, 1, 50),
(51, 'Download CoreUI', 'https://coreui.io', 'cil-cloud-download', 'link', NULL, 1, 51),
(52, 'Try CoreUI PRO', 'https://coreui.io/pro/', 'cil-layers', 'link', NULL, 1, 52),
(53, 'Pages', '', '', 'dropdown', NULL, 2, 53),
(54, 'Dashboard', '/', NULL, 'link', 53, 2, 54),
(55, 'Notes', '/notes', NULL, 'link', 53, 2, 55),
(56, 'Users', '/users', NULL, 'link', 53, 2, 56),
(57, 'Settings', '', '', 'dropdown', NULL, 2, 57),
(58, 'Edit menu', '/menu', NULL, 'link', 57, 2, 58),
(59, 'Edit roles', '/roles', NULL, 'link', 57, 2, 59),
(60, 'Media', '/media', NULL, 'link', 57, 2, 60),
(61, 'BREAD', '/bread', NULL, 'link', 57, 2, 61),
(62, 'E-mail', '/email', NULL, 'link', 57, 2, 62);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_role`
--

CREATE TABLE `menu_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menus_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menu_role`
--

INSERT INTO `menu_role` (`id`, `role_name`, `menus_id`) VALUES
(1, 'guest', 1),
(2, 'user', 1),
(3, 'admin', 1),
(4, 'guest', 2),
(5, 'guest', 3),
(6, 'admin', 4),
(7, 'admin', 5),
(8, 'admin', 6),
(9, 'admin', 7),
(10, 'admin', 8),
(11, 'admin', 9),
(12, 'user', 10),
(13, 'admin', 10),
(14, 'user', 11),
(15, 'admin', 11),
(16, 'user', 12),
(17, 'admin', 12),
(18, 'user', 13),
(19, 'admin', 13),
(20, 'user', 14),
(21, 'admin', 14),
(22, 'user', 15),
(23, 'admin', 15),
(24, 'user', 16),
(25, 'admin', 16),
(26, 'user', 17),
(27, 'admin', 17),
(28, 'user', 18),
(29, 'admin', 18),
(30, 'user', 19),
(31, 'admin', 19),
(32, 'user', 20),
(33, 'admin', 20),
(34, 'user', 21),
(35, 'admin', 21),
(36, 'user', 22),
(37, 'admin', 22),
(38, 'user', 23),
(39, 'admin', 23),
(40, 'user', 24),
(41, 'admin', 24),
(42, 'user', 25),
(43, 'admin', 25),
(44, 'user', 26),
(45, 'admin', 26),
(46, 'user', 27),
(47, 'admin', 27),
(48, 'user', 28),
(49, 'admin', 28),
(50, 'user', 29),
(51, 'admin', 29),
(52, 'user', 30),
(53, 'admin', 30),
(54, 'user', 31),
(55, 'admin', 31),
(56, 'user', 32),
(57, 'admin', 32),
(58, 'user', 33),
(59, 'admin', 33),
(60, 'user', 34),
(61, 'admin', 34),
(62, 'user', 35),
(63, 'admin', 35),
(64, 'user', 36),
(65, 'admin', 36),
(66, 'user', 37),
(67, 'admin', 37),
(68, 'user', 38),
(69, 'admin', 38),
(70, 'user', 39),
(71, 'admin', 39),
(72, 'user', 40),
(73, 'admin', 40),
(74, 'user', 41),
(75, 'admin', 41),
(76, 'user', 42),
(77, 'admin', 42),
(78, 'user', 43),
(79, 'admin', 43),
(80, 'user', 44),
(81, 'admin', 44),
(82, 'user', 45),
(83, 'admin', 45),
(84, 'user', 46),
(85, 'admin', 46),
(86, 'user', 47),
(87, 'admin', 47),
(88, 'user', 48),
(89, 'admin', 48),
(90, 'user', 49),
(91, 'admin', 49),
(92, 'user', 50),
(93, 'admin', 50),
(94, 'guest', 51),
(95, 'user', 51),
(96, 'admin', 51),
(97, 'guest', 52),
(98, 'user', 52),
(99, 'admin', 52),
(100, 'guest', 53),
(101, 'user', 53),
(102, 'admin', 53),
(103, 'guest', 54),
(104, 'user', 54),
(105, 'admin', 54),
(106, 'user', 55),
(107, 'admin', 55),
(108, 'admin', 56),
(109, 'admin', 57),
(110, 'admin', 58),
(111, 'admin', 59),
(112, 'admin', 60),
(113, 'admin', 61),
(114, 'admin', 62);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(17, '2014_10_12_000000_create_users_table', 1),
(18, '2014_10_12_100000_create_password_resets_table', 1),
(19, '2019_08_19_000000_create_failed_jobs_table', 1),
(20, '2019_10_11_085455_create_notes_table', 1),
(21, '2019_10_12_115248_create_status_table', 1),
(22, '2019_11_08_102827_create_menus_table', 1),
(23, '2019_11_13_092213_create_menurole_table', 1),
(24, '2019_12_11_091036_create_menulist_table', 1),
(25, '2019_12_18_092518_create_role_hierarchy_table', 1),
(26, '2020_01_07_093259_create_folder_table', 1),
(27, '2020_01_21_150250_create_media_table', 1),
(28, '2020_01_21_161241_create_form_field_table', 1),
(29, '2020_01_21_161242_create_form_table', 1),
(30, '2020_01_21_161243_create_example_table', 1),
(31, '2020_02_12_104545_create_permission_tables', 1),
(32, '2020_03_12_111400_create_email_template_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(2, 'App\\User', 1),
(2, 'App\\User', 2),
(2, 'App\\User', 3),
(2, 'App\\User', 4),
(2, 'App\\User', 5),
(2, 'App\\User', 6),
(2, 'App\\User', 7),
(2, 'App\\User', 8),
(2, 'App\\User', 9),
(2, 'App\\User', 10),
(2, 'App\\User', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `note_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applies_to_date` date NOT NULL,
  `users_id` int(10) UNSIGNED NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notes`
--

INSERT INTO `notes` (`id`, `title`, `content`, `note_type`, `applies_to_date`, `users_id`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 'Aspernatur doloremque rerum delectus.', 'Itaque error minus vel voluptatem animi rem. Alias qui nesciunt veritatis. Alias velit maxime voluptas possimus cum est. Praesentium in est dignissimos quidem. Nobis omnis fugiat ea.', 'minima aliquam', '1999-08-30', 10, 4, NULL, NULL),
(2, 'Molestiae sint blanditiis nobis.', 'Consequatur sint labore unde voluptatem maiores ea. Minus eius repudiandae occaecati reiciendis. Quia rem voluptatum dicta nisi suscipit consequuntur dolores. Possimus provident ea quam impedit necessitatibus quia minus.', 'ut', '2000-08-29', 4, 4, NULL, NULL),
(3, 'Eaque aut occaecati veniam nisi.', 'Aspernatur architecto id ipsam non et voluptas quis sint. Est et magni expedita magni aut amet. Culpa error doloribus fuga sunt autem voluptates eum.', 'debitis autem', '2006-01-30', 4, 3, NULL, NULL),
(4, 'Nisi est nulla quia quia.', 'Sed repudiandae et eius iusto. Eaque quibusdam commodi sint facere beatae eius est. Dolor magnam cum cum perspiciatis quis.', 'ratione', '1971-02-28', 11, 4, NULL, NULL),
(5, 'Dolorem non inventore.', 'Natus voluptatem quos quis eos tempora exercitationem quia. Velit accusantium voluptatum culpa ut aperiam occaecati. Inventore est eius rem perspiciatis nihil corporis incidunt. Voluptate ut aut cum est est. Pariatur at delectus ducimus ex consequatur itaque ut fuga.', 'commodi et', '2001-03-03', 3, 2, NULL, NULL),
(6, 'Vel quis rerum voluptatem et.', 'Molestiae iusto inventore doloremque sit est a praesentium. Ut et recusandae aut dolor ducimus dolore aut aliquid. Sint maxime illo iste inventore perspiciatis.', 'aspernatur alias', '2000-05-09', 10, 3, NULL, NULL),
(7, 'Eveniet recusandae quia.', 'Sit beatae ducimus voluptates sed asperiores provident. Impedit animi voluptas cum dignissimos. Voluptatem quod corrupti sint molestiae ea. Nihil eius non voluptatem quae suscipit et.', 'ea', '1981-04-13', 6, 1, NULL, NULL),
(8, 'A vel ducimus ex autem consequatur.', 'Ea accusamus velit ratione itaque ut velit soluta. Quia nobis suscipit odio debitis voluptate accusamus. Magnam nostrum enim delectus ipsa. Atque quis voluptate tempora non amet qui.', 'minus', '1992-04-22', 8, 3, NULL, NULL),
(9, 'Cupiditate quo assumenda et nemo.', 'Nam provident aliquam consequatur. Similique eos eaque facere ducimus id hic. Voluptate fugiat commodi ullam culpa enim iusto nihil. Dolorem iure ea reiciendis praesentium ipsa quaerat.', 'et recusandae', '2000-06-30', 11, 3, NULL, NULL),
(10, 'Hic explicabo vero aut et ut.', 'Blanditiis in nisi excepturi soluta eius perspiciatis animi. Sit sint voluptatem dolor. Nostrum dolores voluptates molestiae aliquam sit cupiditate quas temporibus. Quia et saepe repellat ab illo.', 'nihil', '1993-05-21', 8, 3, NULL, NULL),
(11, 'Mollitia qui illum nobis est.', 'Qui voluptas qui doloremque doloribus harum harum. Earum sed odit laudantium rerum assumenda. Officiis magni ipsum minima aliquid et et.', 'asperiores', '1983-08-14', 4, 3, NULL, NULL),
(12, 'Nemo molestiae cum excepturi nisi.', 'Possimus asperiores consequatur dolore ad. Et blanditiis nostrum at. Laborum qui facilis optio qui laboriosam quo voluptatem ut. Et possimus recusandae porro distinctio iste odio.', 'enim', '1979-10-24', 11, 2, NULL, NULL),
(13, 'Quia quisquam sit quia voluptatibus.', 'Corporis similique aut veritatis nemo magnam provident. Dolorem omnis dolor voluptatem iure deleniti inventore modi rem.', 'occaecati architecto', '2013-11-20', 5, 3, NULL, NULL),
(14, 'Repudiandae sit est voluptate ut sapiente.', 'Et eaque facilis deleniti quasi corporis sed vel. Voluptas aut ipsam molestiae. Accusamus distinctio nihil deserunt et quaerat. Hic distinctio nobis molestiae et ipsa placeat eum. Quia dolore numquam sunt omnis sunt voluptatem.', 'et', '1980-02-03', 11, 2, NULL, NULL),
(15, 'Dolores quia ut.', 'Asperiores at dolor labore cumque iusto sed. Animi nostrum et ea provident beatae dicta in. Et magni et magni temporibus.', 'sit illum', '1975-08-20', 7, 2, NULL, NULL),
(16, 'Sit explicabo ut porro.', 'Eligendi vitae dolorem magnam inventore quam quis repellendus. Dignissimos dolor vel provident. Quia animi officia non incidunt. Est aut omnis asperiores autem. Facere ducimus repellat omnis ut at.', 'excepturi et', '2020-01-05', 11, 1, NULL, NULL),
(17, 'Sunt est accusantium qui aut.', 'Reiciendis quam deleniti voluptatem autem optio sed necessitatibus. Qui suscipit et et ratione repellendus eum qui facilis. Est incidunt expedita veniam nihil non et.', 'non soluta', '2012-05-18', 4, 1, NULL, NULL),
(18, 'Id veritatis atque.', 'Earum facilis sequi pariatur eum voluptatem et. Ex voluptatem tenetur quibusdam aut molestiae.', 'sapiente', '1984-12-24', 5, 1, NULL, NULL),
(19, 'Suscipit laborum quo doloribus totam magni.', 'Iusto ratione eos non aut iure deleniti est quod. Omnis nam veritatis rem et dolorum earum neque cumque. Reprehenderit sunt vel veritatis. Unde incidunt esse voluptatem.', 'voluptatem dolorum', '2007-11-19', 3, 4, NULL, NULL),
(20, 'Qui illum iusto.', 'Veritatis voluptatem iste architecto. Quisquam non voluptatem aliquid rerum consequuntur culpa. Et dolorem vel quia consequuntur adipisci odio eos. Fugit est ipsum minus ea eos illo amet iusto.', 'explicabo reprehenderit', '1995-11-05', 3, 3, NULL, NULL),
(21, 'Cupiditate dolores iure.', 'Architecto eaque aliquam rerum qui aut repellendus. Nulla est provident aut exercitationem. Et possimus eos voluptas ad error in quasi. Perferendis natus odit reprehenderit eveniet consequatur.', 'eius et', '1989-09-21', 10, 4, NULL, NULL),
(22, 'Possimus sint velit beatae vel.', 'Enim explicabo id voluptatum quam beatae. Perspiciatis corrupti est reiciendis reiciendis. Cupiditate minima aut voluptatem vel officiis laboriosam.', 'minima enim', '2002-10-18', 9, 2, NULL, NULL),
(23, 'Voluptas eligendi tenetur eaque corrupti.', 'Nisi ipsa laboriosam tempore optio fuga deserunt. Officiis maiores quaerat perferendis velit. Fuga nesciunt eveniet rem.', 'sit deleniti', '2011-03-20', 5, 3, NULL, NULL),
(24, 'Molestiae odit est qui impedit.', 'Nam numquam consequatur eius delectus quae officiis ea. Quas quidem repudiandae a aut facilis illo.', 'magni', '2016-04-26', 6, 1, NULL, NULL),
(25, 'Iure exercitationem necessitatibus repellendus praesentium.', 'Laboriosam iusto distinctio asperiores officia nostrum. Modi exercitationem dolor nulla. Qui eaque qui in cumque. Sint quo in voluptatem sunt dolorum voluptas.', 'a', '2002-10-03', 8, 1, NULL, NULL),
(26, 'Ut nostrum ipsum minus aut.', 'Qui laboriosam sunt id inventore fuga delectus. Consequatur architecto quaerat repellat quibusdam non eos. Magnam quaerat cupiditate neque et perspiciatis est fugit.', 'dolor et', '1980-01-24', 10, 3, NULL, NULL),
(27, 'Veniam maiores facere sint doloremque.', 'Est labore libero aut sint laudantium aut velit. Minima quisquam sunt tempora accusamus ex blanditiis. In aut ut assumenda. Aliquam cumque sint minima recusandae animi.', 'incidunt libero', '1996-03-01', 7, 4, NULL, NULL),
(28, 'Molestias consequatur hic.', 'Sed inventore sit fugiat voluptas commodi quis fuga. Suscipit debitis ut earum. Architecto et non aut. Ipsa asperiores molestiae sit placeat.', 'sed', '1999-08-14', 4, 1, NULL, NULL),
(29, 'Qui nesciunt nesciunt est.', 'Neque quo accusantium non enim dolorem ratione. In odio officia eligendi harum eos. Sapiente corporis et voluptatem voluptatem non sed dolor debitis. Hic neque facilis non tempore quis ipsa.', 'dolor', '2010-01-07', 9, 2, NULL, NULL),
(30, 'Debitis est labore rerum.', 'Veritatis deserunt qui architecto qui impedit dolore harum ipsum. Nobis eos et dicta aspernatur omnis doloremque. Consequatur enim ut rerum explicabo qui voluptates. Et doloribus perferendis unde voluptatem perspiciatis expedita dolorem.', 'cupiditate', '2014-12-10', 7, 3, NULL, NULL),
(31, 'Nostrum dolore neque debitis quaerat.', 'Doloremque sunt fugiat ipsa eius et. Voluptatem non impedit voluptas accusantium non voluptatibus. Placeat ut in nihil laborum facilis natus sit eos. Dolorem cupiditate corporis omnis et reiciendis.', 'omnis fugit', '1981-08-07', 3, 2, NULL, NULL),
(32, 'Dolores labore nihil quaerat quia.', 'Dolores est id quasi eveniet dolor corporis reiciendis odio. Ut quod dolores tenetur. Sunt esse consequatur maiores laborum quia.', 'quia', '1996-01-13', 3, 3, NULL, NULL),
(33, 'Aliquam quia a.', 'Laudantium non dicta odit. Aliquam rerum ullam et iusto. Recusandae tempore quaerat fugit esse illum voluptatum laboriosam nemo. Omnis corrupti est quae dolores.', 'veritatis', '1988-01-22', 10, 2, NULL, NULL),
(34, 'Accusamus voluptatibus beatae et.', 'Ad sit non eum repudiandae. Omnis labore voluptatem neque. Quas blanditiis nobis quisquam. Eos qui culpa aut accusamus aut sit.', 'est', '1992-11-27', 3, 1, NULL, NULL),
(35, 'Ut esse necessitatibus maiores quia rerum.', 'Voluptas consequatur sunt est quis. Autem iure dolores quo ipsa. Et laborum culpa veritatis unde quo. Praesentium sint iusto iusto velit ipsa saepe aut.', 'iusto iste', '1970-10-03', 3, 1, NULL, NULL),
(36, 'Voluptatem suscipit ullam odio amet.', 'Autem et saepe eius corporis unde et vel. Esse incidunt ea in aut provident. Facilis esse explicabo deserunt minima aliquid reprehenderit. Et et occaecati accusamus.', 'repellat illum', '2011-02-05', 10, 2, NULL, NULL),
(37, 'Qui enim cum qui asperiores.', 'Ratione ea numquam laborum sit eaque atque autem. Voluptatibus id sapiente omnis et. Impedit non non pariatur laudantium quis qui. Adipisci sed repellat debitis iusto itaque culpa qui doloribus.', 'molestiae', '1988-06-09', 5, 4, NULL, NULL),
(38, 'Dolorem eos deserunt.', 'Optio ea fugit sit praesentium sunt culpa. Deleniti aut vero ab vel earum qui quis. Dicta dolorum asperiores velit.', 'culpa dolores', '2005-07-05', 6, 2, NULL, NULL),
(39, 'Recusandae quas itaque quidem.', 'Nesciunt ipsam et dolore occaecati beatae. Voluptas quia aspernatur quis similique. Ab expedita neque illo necessitatibus consequatur inventore.', 'explicabo similique', '1974-06-02', 6, 4, NULL, NULL),
(40, 'Omnis at laudantium quia possimus asperiores.', 'Porro ratione quia quos veritatis nisi sint dignissimos non. Nesciunt laborum delectus animi dolor temporibus repudiandae enim. Doloribus a voluptates cum amet.', 'dolor', '1998-01-10', 7, 2, NULL, NULL),
(41, 'Vel quia harum facere.', 'Ea atque pariatur repudiandae fugit dolorem occaecati. Culpa voluptate aut sint quia. Enim aut aut molestiae tenetur aut est.', 'voluptatem voluptas', '1986-08-24', 7, 2, NULL, NULL),
(42, 'Necessitatibus at et asperiores.', 'Et quas adipisci quis sunt ut. Quia autem quia officia beatae corporis ex.', 'nihil et', '1993-08-12', 7, 3, NULL, NULL),
(43, 'Incidunt at ad dicta pariatur.', 'Dolor aut praesentium praesentium aperiam praesentium velit qui. Maiores veniam minus sit et. Nobis quia aspernatur doloremque omnis et velit quia.', 'doloribus', '1993-01-12', 3, 4, NULL, NULL),
(44, 'Modi quia nobis autem non voluptatum.', 'Magnam odit ratione culpa amet repellendus. Rerum ex eum ad voluptatibus quo dolorem neque. Ut suscipit officia eum facilis. Dolorum quod et ut ipsum odit tempora.', 'nihil blanditiis', '1980-01-15', 2, 1, NULL, NULL),
(45, 'Nam delectus nulla eum et.', 'Debitis dolor omnis sed nam. Voluptas ut perspiciatis sed ut est deserunt. Error atque expedita fugiat soluta et impedit. Sunt adipisci tenetur ad blanditiis consequatur.', 'enim iste', '2018-07-27', 2, 3, NULL, NULL),
(46, 'Quia earum doloremque similique omnis.', 'In reprehenderit enim minima et minima. Laboriosam vel unde necessitatibus aliquid quis eligendi. Et sint rem eius pariatur consequatur cumque occaecati.', 'maxime', '1971-03-18', 9, 3, NULL, NULL),
(47, 'Autem exercitationem et similique enim.', 'Iure aut et veniam. Ut eius et doloremque excepturi provident. Ratione nesciunt omnis doloribus quod sed.', 'atque amet', '1992-09-16', 9, 3, NULL, NULL),
(48, 'Minus blanditiis commodi repudiandae quia.', 'Alias quidem quae consectetur odio velit magni autem. Maiores qui perferendis eveniet rem consequatur possimus. Facilis rerum iste eos dolore. Tempore iusto iste maiores nihil est.', 'quia', '1972-06-25', 11, 3, NULL, NULL),
(49, 'Nihil molestias culpa.', 'Dicta illo culpa nisi dolores. Aperiam voluptatem quos sint facilis laboriosam totam. Ut ducimus sed nihil consequatur.', 'sit ullam', '1973-01-19', 7, 4, NULL, NULL),
(50, 'Facilis nobis laudantium sunt tempora.', 'Ut aut aperiam autem est. Quis a molestias id nesciunt vel. Rerum qui in et rerum et. Ex in ut et eius. Voluptas rem et aut quidem.', 'ut ipsum', '2007-08-06', 10, 3, NULL, NULL),
(51, 'Laudantium qui est dolore.', 'Ut similique eum praesentium. Id est reiciendis vero ducimus dolor. Ut asperiores excepturi ut consequatur aperiam.', 'ad aliquam', '2003-09-21', 2, 3, NULL, NULL),
(52, 'Alias at enim adipisci officia ratione.', 'Aut sed explicabo id atque. Voluptatem et est unde est voluptatem. Ut odio velit nihil a asperiores reiciendis inventore rerum. Provident et explicabo expedita. Ut facilis illo et repudiandae nostrum dolorem quis.', 'voluptatem', '2003-12-05', 9, 4, NULL, NULL),
(53, 'Quas molestias dolorem tempore debitis.', 'Ut perferendis est non dolor quo magni. Placeat atque id et consequatur voluptas dicta. Soluta repellat cumque vel et explicabo ullam doloribus. Atque ad animi aut quia pariatur molestiae.', 'facere unde', '1989-02-15', 10, 2, NULL, NULL),
(54, 'Maxime qui excepturi quibusdam.', 'Nam sed iure voluptatem et. Quis non repudiandae et sunt. Voluptatem aut sint architecto sed.', 'earum cumque', '1996-01-16', 8, 1, NULL, NULL),
(55, 'Nesciunt ducimus nihil deserunt minima.', 'Sit et ut doloribus. Ut et velit eos at quos dolore nihil. Ipsa rerum est sint possimus commodi ipsa amet.', 'adipisci corrupti', '2010-08-27', 9, 1, NULL, NULL),
(56, 'Nisi et impedit et sequi vel.', 'Asperiores quam nihil sed aperiam magni illo. Autem officia fugiat occaecati aspernatur. Dolorem vitae eos eos rerum rerum.', 'ex', '1979-04-06', 6, 4, NULL, NULL),
(57, 'Totam ut rem beatae autem.', 'Veniam occaecati earum iusto soluta non. Cumque ratione debitis asperiores excepturi et nemo error quibusdam. Ut sit maiores ut id ipsam dolores. Sed qui quia vel sunt dolorum est.', 'dolores', '2008-07-13', 3, 1, NULL, NULL),
(58, 'Itaque esse est natus.', 'Consequatur ut eum est voluptatum nostrum possimus. Labore optio illum deleniti deleniti consequuntur. Repellat at voluptas optio nesciunt. Cum illo laborum debitis fugiat sed eaque.', 'iste', '1970-06-22', 4, 2, NULL, NULL),
(59, 'Dignissimos ea molestias maiores ipsam.', 'Dolore rerum suscipit delectus corrupti quaerat et. Dolor fugit rem corporis beatae ut ratione. Qui unde omnis quasi sed dolorem sapiente assumenda. Ratione dolore quaerat totam libero autem.', 'autem', '2013-10-12', 9, 2, NULL, NULL),
(60, 'Eum qui accusamus voluptas.', 'Qui quis accusantium temporibus eius aut possimus esse. Provident reiciendis reiciendis quibusdam deleniti laudantium. Molestias fuga officia repellendus.', 'id', '1972-06-17', 7, 4, NULL, NULL),
(61, 'Fugiat est explicabo modi cupiditate.', 'Molestias dicta iure omnis facere ratione repellendus. Omnis magnam iusto beatae officiis quia. Dolor et consectetur modi molestiae voluptates id error voluptate. Omnis eum iste deserunt eum.', 'corrupti aspernatur', '2018-02-20', 4, 1, NULL, NULL),
(62, 'Voluptatem ex consequuntur doloribus sapiente.', 'Sunt illum a provident. Quis modi aperiam eos ex.', 'eveniet', '1971-08-14', 3, 3, NULL, NULL),
(63, 'Aut itaque expedita libero.', 'Ratione et voluptate nihil eligendi sed doloremque eum. Autem sunt in numquam a praesentium. Consequatur est voluptatem officia illum.', 'ut', '1983-12-30', 8, 3, NULL, NULL),
(64, 'Eum et magni aut delectus corrupti.', 'Deleniti fugiat quam et laborum ullam ipsum voluptas. Eum esse asperiores sed repellat. Corrupti non et eum ea eos. Delectus voluptas non repellat excepturi recusandae in. Temporibus necessitatibus nihil itaque odit suscipit.', 'asperiores officia', '1971-05-14', 9, 1, NULL, NULL),
(65, 'Saepe optio eum facilis.', 'Dicta quis eos et quia pariatur incidunt. Alias maiores et dolores consequatur consequatur id sint. Expedita possimus aspernatur nam et voluptas et. Rerum odio minima numquam libero rem tempora. Rem ut ipsum repellendus nesciunt aut est et.', 'quod nemo', '1973-05-12', 6, 2, NULL, NULL),
(66, 'Recusandae doloribus ratione vitae.', 'Non ad vel numquam eos a et eos molestias. Excepturi dolores dolore natus voluptatem. Praesentium iste corrupti quo. Dolor consectetur provident molestiae consequuntur soluta neque consequatur.', 'natus', '1989-02-26', 7, 4, NULL, NULL),
(67, 'Necessitatibus incidunt sit possimus qui saepe.', 'Deserunt assumenda qui rerum et odit et. Iste ipsum minus est aut omnis qui. Dignissimos omnis reprehenderit nisi. Natus excepturi repellendus fugit ipsum ut qui.', 'sint hic', '2019-12-04', 8, 2, NULL, NULL),
(68, 'Non soluta ipsum id animi iste.', 'Ratione ea sit omnis molestiae et. Aut nisi culpa consequatur accusantium. Culpa dicta sit magnam voluptas laudantium aperiam animi. Et omnis quia est.', 'velit', '2020-04-08', 8, 3, NULL, NULL),
(69, 'Architecto harum provident voluptate.', 'Sit velit nisi dolores perferendis nemo quo nesciunt molestias. Odit vel totam deleniti ut quo tempore mollitia. Harum qui voluptatem mollitia consequatur necessitatibus numquam eos rerum. Cum facere et voluptatibus similique.', 'velit', '1983-10-21', 5, 2, NULL, NULL),
(70, 'Accusantium et nam et et.', 'Magni aliquid voluptatem error error. Accusantium repudiandae facere facere necessitatibus dolorem dolores. At placeat rerum mollitia omnis esse qui alias. Labore velit atque possimus.', 'nulla excepturi', '1989-10-20', 9, 3, NULL, NULL),
(71, 'Quas harum accusantium et excepturi omnis.', 'Ut consequatur quidem facilis quidem consequatur quas. Repudiandae laboriosam nostrum alias labore ipsum.', 'placeat', '2006-05-07', 7, 4, NULL, NULL),
(72, 'Sed ea minima qui consequatur.', 'Debitis nulla nostrum placeat iusto. Et reiciendis velit illo voluptatem et dolor. Et ut praesentium dolore dolorem mollitia quos unde.', 'rerum', '2005-11-30', 11, 3, NULL, NULL),
(73, 'Nemo est commodi.', 'Voluptatem consequatur et velit totam. Ut eveniet in quis nesciunt qui. Eaque ea est minima tempore in.', 'asperiores sint', '1984-02-16', 5, 4, NULL, NULL),
(74, 'Nemo corporis sunt.', 'Illo commodi nostrum quis temporibus. Et velit optio nihil unde sequi voluptatem. Excepturi rerum soluta architecto exercitationem quis repudiandae exercitationem.', 'ut sapiente', '1984-04-04', 10, 4, NULL, NULL),
(75, 'Rerum odio in quidem quia temporibus.', 'Nobis repudiandae doloremque deserunt optio sint architecto. Id ut voluptatem ab. Saepe est earum soluta necessitatibus facilis voluptas adipisci. Laudantium sint dolorem est repudiandae enim quia.', 'natus distinctio', '2001-01-14', 10, 1, NULL, NULL),
(76, 'Veniam hic itaque ab porro vero.', 'Voluptatibus nulla est autem debitis. Tempore est sint eius sapiente. Ad quia nostrum laborum magni accusantium.', 'sed tempora', '1971-11-29', 8, 2, NULL, NULL),
(77, 'Laudantium reiciendis magnam rerum.', 'Dolorum aut qui voluptas quam sunt. Aliquam consectetur reiciendis omnis facere. Vero fugiat sed aut fugit.', 'ab', '1990-07-16', 9, 3, NULL, NULL),
(78, 'Sequi dolorem consectetur et a.', 'Voluptas at quibusdam doloribus earum. Et ipsam et sit impedit sunt dolore unde ex. Qui repellendus autem ipsum possimus et incidunt inventore.', 'neque', '2014-12-10', 7, 3, NULL, NULL),
(79, 'Non nulla qui necessitatibus.', 'Exercitationem ab magnam possimus et possimus hic. Culpa quibusdam est iste cum labore. Totam culpa dolor nam dolorem. Id qui numquam voluptatibus eligendi.', 'rem', '1986-07-18', 7, 2, NULL, NULL),
(80, 'Facere eligendi exercitationem voluptatem.', 'Quis commodi natus omnis. Quibusdam et laborum nam hic laborum unde magnam. Maxime praesentium placeat ipsa totam numquam voluptates et.', 'voluptatem', '2020-03-14', 4, 3, NULL, NULL),
(81, 'Impedit occaecati quisquam.', 'Nihil ullam ut dolores est voluptates. Iusto et sunt dolorem praesentium vel. Temporibus quis quis excepturi quidem recusandae.', 'nihil sequi', '2009-02-07', 9, 1, NULL, NULL),
(82, 'Aperiam beatae voluptatum.', 'Voluptas impedit et sunt omnis dolor reprehenderit consectetur. Pariatur sint aliquid maiores laboriosam. Aut enim soluta ea ducimus doloribus. Incidunt sequi earum voluptatem qui ipsa mollitia perspiciatis.', 'qui qui', '2019-05-01', 10, 2, NULL, NULL),
(83, 'Est magni voluptas.', 'Natus consequatur nesciunt qui nemo voluptas quis et et. Est aut fugit nemo ab. Et et enim expedita est amet. Animi nostrum voluptates tempore enim asperiores nihil beatae. Expedita labore similique nemo sapiente illo quam laboriosam.', 'rerum repudiandae', '2000-09-28', 6, 2, NULL, NULL),
(84, 'Animi perferendis aliquid voluptas voluptatum.', 'Pariatur qui eos beatae consequuntur quia. Temporibus ut quia est qui perspiciatis perspiciatis consequatur. Excepturi nam sunt dignissimos velit recusandae facilis optio vel. Nostrum consequatur corporis iure corporis aliquam saepe. Rerum dicta quia voluptatem consequuntur ipsam similique.', 'repellat modi', '1990-09-14', 4, 4, NULL, NULL),
(85, 'Neque voluptatem aperiam et.', 'Natus rerum sequi dolorum cum consequatur mollitia. Reiciendis dicta dicta amet laborum doloribus quia. Eligendi magni a nihil natus.', 'aut', '1999-02-20', 5, 2, NULL, NULL),
(86, 'Occaecati aspernatur quod voluptatem rerum.', 'Assumenda ab quia autem inventore quia. Eligendi dolor consectetur est voluptatem eum quibusdam. Dolorem aut est corporis qui. Nihil minus nihil nihil.', 'sint sed', '2018-10-06', 4, 2, NULL, NULL),
(87, 'Nulla quam perspiciatis culpa.', 'Nostrum cupiditate aliquam dolorem. Omnis ut amet et accusamus. Nostrum quidem doloremque fuga assumenda.', 'harum', '2018-08-15', 9, 3, NULL, NULL),
(88, 'Et rerum recusandae omnis.', 'Sit corrupti ex maiores rerum ratione deserunt natus impedit. Ut facilis perferendis vel aut et animi quo. Sed sit id qui.', 'et sit', '1976-09-08', 5, 1, NULL, NULL),
(89, 'Dignissimos amet autem et perspiciatis fuga.', 'Delectus sint repellat recusandae alias. Saepe perferendis doloremque deserunt dolores. Et sint earum assumenda. Atque voluptas est voluptas ut aperiam voluptas.', 'quos', '1974-09-19', 4, 4, NULL, NULL),
(90, 'Facere omnis unde omnis nesciunt voluptas.', 'Laudantium voluptas necessitatibus quidem voluptas sequi nemo ipsa. Quia eos temporibus reiciendis deleniti accusamus autem. Asperiores iure ratione non minus ab perspiciatis.', 'delectus ratione', '2014-03-15', 9, 4, NULL, NULL),
(91, 'Cumque quas et fugit.', 'Consequuntur cumque neque cupiditate et beatae qui omnis expedita. Veritatis laborum laudantium ipsam et eveniet esse veritatis. Adipisci illo omnis eaque provident doloremque et.', 'odit similique', '2011-02-27', 6, 3, NULL, NULL),
(92, 'Cupiditate maxime sit veniam consequatur.', 'Beatae voluptate et quam dolor. Nihil quia consequatur laborum et eos. Nemo quas natus sed autem totam est.', 'doloribus', '2011-05-12', 3, 1, NULL, NULL),
(93, 'Quia rerum maxime.', 'Voluptatem ex facilis ullam sequi natus et nobis blanditiis. Ut qui doloremque ut suscipit consequatur dolor quo. Dignissimos non est rerum aut sit culpa molestiae.', 'veritatis', '2008-08-03', 2, 4, NULL, NULL),
(94, 'Et tempora rem harum dolorem natus.', 'Ut harum impedit delectus. Aut magni corporis eum voluptas quam suscipit eum. Quam in consequatur qui.', 'voluptas hic', '2008-08-08', 9, 1, NULL, NULL),
(95, 'Maxime sit repellendus sed inventore.', 'Molestias laborum eaque vitae rerum qui voluptatem laudantium. Quis est quis accusamus deserunt vel consequatur. Est vel animi et voluptate eveniet.', 'quia provident', '1972-07-31', 9, 3, NULL, NULL),
(96, 'Eum nihil harum exercitationem.', 'Magnam nihil deserunt a dicta et et consequatur. Placeat et quo velit labore. Voluptatibus eum ullam et. Sit ex qui et molestiae sit.', 'voluptas quod', '1993-02-11', 8, 4, NULL, NULL),
(97, 'Delectus aut eius incidunt et ex.', 'Temporibus corrupti sed voluptatem similique. Voluptas rerum enim ut placeat harum.', 'cupiditate', '1976-07-17', 2, 1, NULL, NULL),
(98, 'Libero molestiae non qui hic.', 'Nemo et ratione architecto quo. Est saepe ullam veniam ex dolorem et veritatis. Sint numquam ex laboriosam non neque nulla. Minima est tempora architecto doloribus illum sequi.', 'eum temporibus', '1976-03-16', 3, 2, NULL, NULL),
(99, 'Laboriosam et aut consectetur.', 'Cum eum voluptas nemo odit laboriosam expedita porro. Voluptatem amet id quia quis.', 'rem inventore', '2002-06-17', 5, 1, NULL, NULL),
(100, 'Blanditiis quaerat sint voluptatem voluptas voluptatem.', 'Similique et iure architecto aut dicta sunt enim. Culpa error est praesentium est velit eligendi.', 'qui', '1987-05-03', 5, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'browse bread 1', 'api', '2020-07-10 08:29:13', '2020-07-10 08:29:13'),
(2, 'read bread 1', 'api', '2020-07-10 08:29:14', '2020-07-10 08:29:14'),
(3, 'edit bread 1', 'api', '2020-07-10 08:29:14', '2020-07-10 08:29:14'),
(4, 'add bread 1', 'api', '2020-07-10 08:29:14', '2020-07-10 08:29:14'),
(5, 'delete bread 1', 'api', '2020-07-10 08:29:14', '2020-07-10 08:29:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'api', '2020-07-10 08:28:49', '2020-07-10 08:28:49'),
(2, 'user', 'api', '2020-07-10 08:28:49', '2020-07-10 08:28:49'),
(3, 'guest', 'api', '2020-07-10 08:28:49', '2020-07-10 08:28:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_hierarchy`
--

CREATE TABLE `role_hierarchy` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `hierarchy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_hierarchy`
--

INSERT INTO `role_hierarchy` (`id`, `role_id`, `hierarchy`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

CREATE TABLE `status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `status`
--

INSERT INTO `status` (`id`, `name`, `class`) VALUES
(1, 'ongoing', 'primary'),
(2, 'stopped', 'secondary'),
(3, 'completed', 'success'),
(4, 'expired', 'warning');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menuroles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `api_token`, `menuroles`, `status`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'admin@admin.com', '2020-07-10 08:28:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user,admin', 'Active', 'ZRJepkvgTC', '2020-07-10 08:28:50', '2020-07-10 08:28:50', NULL),
(2, 'Iliana Vandervort', 'eleanora59@example.com', '2020-07-10 08:28:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', 'Active', 'Od9DrwCVr0', '2020-07-10 08:28:50', '2020-07-10 08:28:50', NULL),
(3, 'Myrna Bergnaum', 'ngoyette@example.org', '2020-07-10 08:28:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', 'Inactive', 'ectLNXlfqH', '2020-07-10 08:28:50', '2020-07-10 08:28:50', NULL),
(4, 'Mr. Domenick Bergnaum', 'rutherford.raheem@example.net', '2020-07-10 08:28:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', 'Pending', 'Sa9pruqsA6', '2020-07-10 08:28:50', '2020-07-10 08:28:50', NULL),
(5, 'Therese Wiza', 'hackett.serena@example.com', '2020-07-10 08:28:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', 'Banned', 'vTffFuQKkP', '2020-07-10 08:28:51', '2020-07-10 08:28:51', NULL),
(6, 'Carmel Stark', 'douglas.agustina@example.com', '2020-07-10 08:28:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', 'Pending', 'bQkTDWTtLe', '2020-07-10 08:28:51', '2020-07-10 08:28:51', NULL),
(7, 'Bernadine Daniel', 'gulgowski.brant@example.net', '2020-07-10 08:28:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', 'Banned', '2nFUwi2k0Q', '2020-07-10 08:28:51', '2020-07-10 08:28:51', NULL),
(8, 'Rasheed Johns', 'glover.aaliyah@example.com', '2020-07-10 08:28:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', 'Inactive', 'tdVv0gL7Xp', '2020-07-10 08:28:51', '2020-07-10 08:28:51', NULL),
(9, 'Dr. Loraine Jacobi PhD', 'fdach@example.net', '2020-07-10 08:28:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', 'Inactive', 'hYai4NP88A', '2020-07-10 08:28:51', '2020-07-10 08:28:51', NULL),
(10, 'Kirsten Miller', 'hagenes.urban@example.com', '2020-07-10 08:28:51', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', 'Banned', 'p8VNHKmpDz', '2020-07-10 08:28:51', '2020-07-10 08:28:51', NULL),
(11, 'Brayan Schamberger', 'macie.schuppe@example.net', '2020-07-10 08:28:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', 'Pending', 'lIAUTpSciU', '2020-07-10 08:28:52', '2020-07-10 08:28:52', NULL),
(12, 'jtrevino', 'jtrevinog72@gmail.com', NULL, '$2y$10$Sv0LaL62tiLrT.EETw.U8.AZ58ARQ4K2ZDE/6WlSWqtXgFDIOlWay', NULL, 'admin', 'Active', NULL, '2020-07-10 08:31:19', '2020-07-10 08:31:19', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `email_template`
--
ALTER TABLE `email_template`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `example`
--
ALTER TABLE `example`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `folder`
--
ALTER TABLE `folder`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `form`
--
ALTER TABLE `form`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `form_field`
--
ALTER TABLE `form_field`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indices de la tabla `menulist`
--
ALTER TABLE `menulist`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menu_role`
--
ALTER TABLE `menu_role`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `role_hierarchy`
--
ALTER TABLE `role_hierarchy`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `email_template`
--
ALTER TABLE `email_template`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `example`
--
ALTER TABLE `example`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `folder`
--
ALTER TABLE `folder`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `form`
--
ALTER TABLE `form`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `form_field`
--
ALTER TABLE `form_field`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `menulist`
--
ALTER TABLE `menulist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `menu_role`
--
ALTER TABLE `menu_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `role_hierarchy`
--
ALTER TABLE `role_hierarchy`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `status`
--
ALTER TABLE `status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
