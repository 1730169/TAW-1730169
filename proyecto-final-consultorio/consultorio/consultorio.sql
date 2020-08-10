-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 10-08-2020 a las 13:00:01
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.8

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
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `paciente_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `fecha_cita` datetime NOT NULL,
  `motivo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id`, `paciente_id`, `doctor_id`, `fecha_cita`, `motivo`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '2020-07-18 19:00:00', 'REVISIÓN DE ESTUDIOS', '2020-07-16 10:59:36', '2020-07-16 11:43:36'),
(2, 3, 2, '2020-08-10 04:55:00', 'EXAMEN DE VISTA', '2020-08-04 12:51:23', '2020-08-04 12:51:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compartirs`
--

CREATE TABLE `compartirs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `consulta_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_afiliado_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `compartirs`
--

INSERT INTO `compartirs` (`id`, `consulta_id`, `doctor_afiliado_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2020-08-08 05:17:53', '2020-08-08 05:17:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `paciente_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `resumen` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `diagnostico` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `prescripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagada` tinyint(1) NOT NULL DEFAULT 0,
  `terminada` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `consultas`
--

INSERT INTO `consultas` (`id`, `paciente_id`, `doctor_id`, `resumen`, `diagnostico`, `prescripcion`, `pagada`, `terminada`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 'El paciente presenta una lesión en el hombro izquierdo', 'lesión', 'Diclofenaco', 1, 1, '2020-08-03 04:55:41', '2020-08-03 12:21:33'),
(2, 2, 1, 'El paciente presenta cegera parcial', 'Ceguera parcial', 'Cada 8 horas', 1, 1, '2020-08-03 07:19:58', '2020-08-03 11:09:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cortecajas`
--

CREATE TABLE `cortecajas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `monto_corte` decimal(10,2) NOT NULL,
  `fecha_corte` datetime NOT NULL,
  `usuario_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctores`
--

CREATE TABLE `doctores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `especialidad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cedula` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consultorio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `doctores`
--

INSERT INTO `doctores` (`id`, `nombre`, `apellidos`, `direccion`, `telefono`, `fecha_nacimiento`, `titulo`, `especialidad`, `cedula`, `consultorio`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Dr. Asin', 'Cardiel', 'desconocida', '897987', '2020-07-15', 'CARDIOLOGÍA', 'CARDIOLOGÍA', '00000000000000', 'A-1', 12, '2020-07-16 08:31:13', '2020-08-04 05:27:46'),
(2, 'Dr. Rául', 'Villacorta', 'desconocida', '8312343', '1971-09-11', 'CIRUGÍA GENERAL', 'CIRUGÍA GENERAL', '0000000000000', 'A2', 13, '2020-07-16 09:35:08', '2020-08-04 05:29:36');

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
(1, NULL, NULL, 'Magni occaecati nulla sit vero.', 'Provident in corrupti est reprehenderit natus quis aut. Sapiente nulla vitae eos vel occaecati assumenda.', 3),
(2, NULL, NULL, 'Voluptas quisquam vel qui ex tenetur.', 'Eos possimus ipsa deserunt aperiam est quia. Aut enim sit voluptatem id vel quidem. Dolor quibusdam vitae esse laudantium nisi illo explicabo.', 3),
(3, NULL, NULL, 'Earum minus ipsa.', 'Nemo distinctio tempora debitis fugit. Dolores dolorum natus dolorum assumenda esse non ipsum.', 2),
(4, NULL, NULL, 'Dolores consequatur qui vitae.', 'Dolor magnam facilis dolorem magni animi porro dolore. Explicabo corporis quia consectetur necessitatibus ut magnam. Minima explicabo beatae corrupti.', 3),
(5, NULL, NULL, 'Distinctio minima aut debitis voluptas iusto.', 'Molestiae dolore aut non rem. Consequatur architecto repellat enim reiciendis qui ut. Qui vitae commodi aliquid.', 2),
(6, NULL, NULL, 'Suscipit necessitatibus aut magni quia.', 'Saepe vel laboriosam aut et. Qui dolores praesentium quas voluptas.', 3),
(7, NULL, NULL, 'Libero similique temporibus veritatis voluptas ut.', 'Ducimus recusandae iure quidem et reprehenderit nesciunt. Et est sunt porro eaque itaque assumenda repellendus.', 2),
(8, NULL, NULL, 'Odio tempora nobis perspiciatis.', 'Reprehenderit aliquam explicabo et laborum soluta. Placeat soluta unde provident nulla sint omnis corrupti. Sint saepe et ipsa id accusamus totam. Est quo dolor dolore.', 4),
(9, NULL, NULL, 'In debitis debitis.', 'Non laborum corporis at. Autem doloremque voluptatibus recusandae et ipsum sed reprehenderit. Autem facilis repellendus ex qui consectetur. Hic labore explicabo ea velit animi.', 1),
(10, NULL, NULL, 'Similique deserunt eos fugiat est.', 'Expedita et repellat esse expedita minus amet est. Doloremque fugit eius dolores repudiandae fuga omnis itaque. Qui sequi culpa ipsum ea sapiente cupiditate. Neque rerum officia ipsam consectetur consequatur.', 3),
(11, NULL, NULL, 'Voluptatem consectetur minus sint officiis rerum.', 'Ipsam hic veritatis sit excepturi. Esse quam deleniti et sit non.', 2),
(12, NULL, NULL, 'Vel corporis repellat.', 'Est et commodi neque quia. Doloribus velit quis distinctio totam rem assumenda. Ut totam officia placeat earum sed deserunt aut.', 4),
(13, NULL, NULL, 'Sint deleniti id delectus vel.', 'Ut ut sequi pariatur. Quasi qui facilis corrupti eos error dignissimos vel. Vel non assumenda quibusdam est velit. Distinctio blanditiis ratione est iusto aspernatur placeat.', 4),
(14, NULL, NULL, 'Sed aperiam perspiciatis iste sed.', 'Atque at a veniam magni recusandae. Quam quis provident harum provident iste quae enim. Molestiae fuga accusamus dolores earum quae dolor et.', 3),
(15, NULL, NULL, 'Tenetur voluptatem odit.', 'Aut est aut et voluptas autem fuga. Sapiente animi odit voluptatem rerum autem qui eligendi quidem. Explicabo blanditiis repellendus consequatur sapiente labore esse.', 1),
(16, NULL, NULL, 'Nihil doloribus ut vel.', 'Architecto harum nihil tempora vel modi beatae. Cum ipsam omnis magni ut. Aut reprehenderit eum non est corporis deserunt.', 4),
(17, NULL, NULL, 'Ex eaque dolore tenetur.', 'Modi quia consequatur vel quaerat et. Aut officiis molestiae in minus et. Dolor ipsam aut accusamus quia et quibusdam alias.', 1),
(18, NULL, NULL, 'Error et et ut rerum aut.', 'Voluptatem sed dolor non eos eum illum. Nesciunt aut sint qui facilis delectus. Rem laudantium quia consequatur.', 2),
(19, NULL, NULL, 'Omnis alias aperiam.', 'Libero alias ea quod sit voluptatem odio. Earum quia dolorum voluptatibus et doloribus consequatur. Earum temporibus molestiae sit sit atque nisi.', 4),
(20, NULL, NULL, 'Animi autem et maiores.', 'Commodi dolorum suscipit aperiam in consequatur rerum eos. Nobis aut reprehenderit facilis dolor. In laborum minus architecto ab. Quam ipsam voluptates ut eos.', 1),
(21, NULL, NULL, 'Sit iste deserunt.', 'Et veritatis aut ipsum tenetur dolorum hic ut. Asperiores recusandae explicabo aut velit consequuntur quibusdam facere iusto. Suscipit voluptas dolores est quidem cupiditate sed magni. Eum impedit eius voluptatum libero repellendus nam officia.', 2),
(22, NULL, NULL, 'Aspernatur adipisci rerum velit aut temporibus.', 'Nam asperiores nemo recusandae natus qui. Ea nemo temporibus omnis veniam quae aperiam quibusdam culpa. Dolore totam expedita cum. Odit dolor consectetur quibusdam aut sed qui.', 3),
(23, NULL, NULL, 'Blanditiis nemo eum commodi minus eum.', 'Fuga suscipit officiis non eligendi odit voluptatum eos quia. Minus cum et voluptatem minus sit. Nam voluptatem enim unde placeat. Ea commodi architecto dolores modi cupiditate iure asperiores.', 4),
(24, NULL, NULL, 'Sit omnis officiis earum.', 'Veritatis voluptatem est voluptates fuga. Temporibus qui et sapiente ratione et.', 3),
(25, NULL, NULL, 'In aspernatur suscipit sit iure.', 'Iure vitae adipisci qui sequi. Architecto porro sunt blanditiis sint. Totam impedit recusandae error ipsam repudiandae.', 1);

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
(3, 'Registrar', '/register', 'cil-account-logout', 'link', 6, 1, 6),
(6, 'Usuarios', '/users', NULL, 'dropdown', NULL, 1, 29),
(15, 'Breadcrumb', '/base/breadcrumb', NULL, 'link', 14, 1, 3),
(16, 'Cards', '/base/cards', NULL, 'link', 14, 1, 15),
(17, 'Carousel', '/base/carousel', NULL, 'link', 14, 1, 16),
(18, 'Collapse', '/base/collapse', NULL, 'link', 14, 1, 17),
(19, 'Forms', '/base/forms', NULL, 'link', 14, 1, 18),
(20, 'Jumbotron', '/base/jumbotron', NULL, 'link', 14, 1, 19),
(21, 'List group', '/base/list-group', NULL, 'link', 14, 1, 20),
(22, 'Navs', '/base/navs', NULL, 'link', 14, 1, 21),
(23, 'Pagination', '/base/pagination', NULL, 'link', 14, 1, 22),
(24, 'Popovers', '/base/popovers', NULL, 'link', 14, 1, 23),
(25, 'Progress', '/base/progress', NULL, 'link', 14, 1, 24),
(26, 'Switches', '/base/switches', NULL, 'link', 14, 1, 25),
(27, 'Tables', '/base/tables', NULL, 'link', 14, 1, 26),
(28, 'Tabs', '/base/tabs', NULL, 'link', 14, 1, 27),
(29, 'Tooltips', '/base/tooltips', NULL, 'link', 14, 1, 28),
(31, 'Buttons', '/buttons/buttons', NULL, 'link', 30, 1, 31),
(32, 'Buttons Group', '/buttons/button-group', NULL, 'link', 30, 1, 32),
(33, 'Dropdowns', '/buttons/dropdowns', NULL, 'link', 30, 1, 33),
(34, 'Brand Buttons', '/buttons/brand-buttons', NULL, 'link', 30, 1, 34),
(37, 'CoreUI Icons', '/icon/coreui-icons', NULL, 'link', 36, 1, 37),
(38, 'Flags', '/icon/flags', NULL, 'link', 36, 1, 38),
(39, 'Brands', '/icon/brands', NULL, 'link', 36, 1, 39),
(41, 'Alerts', '/notifications/alerts', NULL, 'link', 40, 1, 41),
(42, 'Badge', '/notifications/badge', NULL, 'link', 40, 1, 42),
(43, 'Modals', '/notifications/modals', NULL, 'link', 40, 1, 43),
(53, 'Pages', NULL, NULL, 'dropdown', NULL, 2, 53),
(54, 'Dashboard', '/', NULL, 'link', 53, 2, 54),
(55, 'Notes', '/notes', NULL, 'link', 53, 2, 55),
(56, 'Users', '/users', NULL, 'link', 53, 2, 56),
(57, 'Settings', NULL, NULL, 'dropdown', NULL, 2, 57),
(58, 'Edit menu', '/menu', NULL, 'link', 57, 2, 58),
(59, 'Edit roles', '/roles', NULL, 'link', 57, 2, 59),
(60, 'Media', '/media', NULL, 'link', 57, 2, 60),
(61, 'BREAD', '/bread', NULL, 'link', 57, 2, 61),
(62, 'E-mail', '/email', NULL, 'link', 57, 2, 62),
(63, 'Pacientes', '/pacientes', NULL, 'link', 0, 1, 45),
(64, 'Pacientes', '/pacientes', 'cil-contact', 'link', 0, 1, 46),
(65, 'Pacientes', '/pacientes', 'cil-contact', 'link', 0, 1, 47),
(66, 'Pacientes', '/pacientes', 'cil-contact', 'link', 0, 2, 63),
(67, 'Pacientes', NULL, NULL, 'dropdown', 0, 1, 44),
(74, 'Consultar', '/pacientes', NULL, 'link', 67, 1, 49),
(75, 'Registrar', '/pacientes/registrar', NULL, 'link', 67, 1, 48),
(76, 'Doctores', NULL, NULL, 'dropdown', 0, 1, 50),
(77, 'Registrar', '/doctores/registrar', NULL, 'link', 76, 1, 51),
(78, 'Consultar', '/doctores', NULL, 'link', 76, 1, 52),
(79, 'Citas', NULL, NULL, 'dropdown', 0, 1, 53),
(80, 'Registrar', '/citas/registrar', NULL, 'link', 79, 1, 54),
(81, 'Consultar', '/citas', NULL, 'link', 79, 1, 55),
(82, 'Consultar', '/users', NULL, 'link', 6, 1, 56),
(83, 'Servicios', NULL, NULL, 'dropdown', 0, 1, 57),
(84, 'Registrar', '/servicios/registrar', NULL, 'link', 83, 1, 58),
(85, 'Consultar', '/servicios', NULL, 'link', 83, 1, 59),
(86, 'Consultas', NULL, NULL, 'dropdown', 0, 1, 60),
(87, 'Registrar', '/consultas/registrar', NULL, 'link', 86, 1, 61),
(88, 'Historial', '/consultas', NULL, 'link', 86, 1, 62),
(89, 'Caja', NULL, NULL, 'dropdown', 0, 1, 63),
(90, 'Pagos', '/pagos', NULL, 'link', 89, 1, 64);

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
(4, 'guest', 2),
(23, 'admin', 15),
(25, 'admin', 16),
(27, 'admin', 17),
(29, 'admin', 18),
(31, 'admin', 19),
(33, 'admin', 20),
(35, 'admin', 21),
(37, 'admin', 22),
(39, 'admin', 23),
(41, 'admin', 24),
(43, 'admin', 25),
(45, 'admin', 26),
(47, 'admin', 27),
(49, 'admin', 28),
(51, 'admin', 29),
(55, 'admin', 31),
(57, 'admin', 32),
(59, 'admin', 33),
(61, 'admin', 34),
(67, 'admin', 37),
(69, 'admin', 38),
(71, 'admin', 39),
(75, 'admin', 41),
(77, 'admin', 42),
(79, 'admin', 43),
(110, 'admin', 58),
(111, 'admin', 59),
(112, 'admin', 60),
(113, 'admin', 61),
(114, 'admin', 62),
(115, 'admin', 63),
(116, 'admin', 64),
(117, 'admin', 65),
(118, 'admin', 66),
(195, 'admin', 6),
(196, 'admin', 76),
(197, 'admin', 89),
(198, 'secretaria', 89),
(199, 'admin', 86),
(200, 'doctor', 86),
(204, 'admin', 67),
(205, 'doctor', 67),
(206, 'secretaria', 67),
(207, 'admin', 75),
(208, 'doctor', 75),
(209, 'secretaria', 75),
(210, 'admin', 74),
(211, 'doctor', 74),
(212, 'secretaria', 74),
(214, 'admin', 3),
(215, 'admin', 82),
(222, 'admin', 77),
(223, 'admin', 78),
(227, 'admin', 79),
(228, 'doctor', 79),
(229, 'secretaria', 79),
(230, 'admin', 81),
(231, 'doctor', 81),
(232, 'secretaria', 81),
(233, 'admin', 83),
(234, 'doctor', 83),
(235, 'admin', 84),
(236, 'doctor', 84),
(237, 'admin', 85),
(238, 'doctor', 85),
(239, 'admin', 87),
(240, 'doctor', 87),
(241, 'admin', 88),
(242, 'doctor', 88),
(243, 'admin', 90),
(244, 'secretaria', 90),
(245, 'admin', 53),
(246, 'admin', 54),
(247, 'admin', 55),
(248, 'admin', 56),
(249, 'admin', 57),
(250, 'admin', 1),
(251, 'guest', 1),
(252, 'secretaria', 1),
(253, 'admin', 80),
(254, 'secretaria', 80);

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_10_11_085455_create_notes_table', 1),
(5, '2019_10_12_115248_create_status_table', 1),
(6, '2019_11_08_102827_create_menus_table', 1),
(7, '2019_11_13_092213_create_menurole_table', 1),
(8, '2019_12_11_091036_create_menulist_table', 1),
(9, '2019_12_18_092518_create_role_hierarchy_table', 1),
(10, '2020_01_07_093259_create_folder_table', 1),
(11, '2020_01_21_150250_create_media_table', 1),
(12, '2020_01_21_161241_create_form_field_table', 1),
(13, '2020_01_21_161242_create_form_table', 1),
(14, '2020_01_21_161243_create_example_table', 1),
(15, '2020_02_12_104545_create_permission_tables', 1),
(16, '2020_03_12_111400_create_email_template_table', 1),
(17, '2020_07_12_204421_create_paciente_table', 2),
(18, '2020_07_12_204623_create_cita_table', 2),
(19, '2020_07_12_204745_create_doctor_table', 2),
(20, '2020_07_12_215708_create_consulta_table', 2),
(21, '2020_07_12_223120_create_servicio_table', 2),
(22, '2020_07_12_223508_create_servicio_consulta_table', 2),
(23, '2020_07_12_231316_create_pagos_table', 2),
(24, '2020_07_12_231343_create_compartir_table', 2),
(25, '2020_07_12_232430_create_cortecaja_table', 2);

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
(1, 'Voluptatem vel nostrum.', 'Deleniti deserunt minima consequuntur. Aliquid a sed eligendi qui aperiam. Rem aut ipsam dignissimos soluta rerum consequatur dolorem. Quibusdam nemo praesentium velit et.', 'et', '2002-12-31', 9, 4, NULL, NULL),
(2, 'Accusantium est provident exercitationem.', 'Ipsum delectus voluptatem dolor omnis quaerat. Impedit et ut in.', 'quasi rerum', '2006-12-25', 10, 1, NULL, NULL),
(3, 'Laudantium sit hic nihil voluptatem.', 'Dolorem ut occaecati cumque provident. Ab facere repellendus incidunt enim magnam est dolores. Id quia dolore rerum ut nostrum nam. Rerum quam numquam numquam enim laboriosam minus delectus esse.', 'qui aliquam', '2004-07-31', 3, 2, NULL, NULL),
(4, 'Distinctio hic rerum modi.', 'Neque atque eius voluptas amet perspiciatis iusto. Aut accusantium voluptatem dolor expedita quis non. Aspernatur voluptatem quia illum et labore maiores. Sed provident dolorum et.', 'natus amet', '1978-10-12', 4, 4, NULL, NULL),
(5, 'Vero et ut nisi aut.', 'Dolorum quis magni dicta ad in sapiente nesciunt. Quam explicabo excepturi magnam. Culpa aut reprehenderit quidem id corrupti dolores sed.', 'et nobis', '2013-12-03', 8, 3, NULL, NULL),
(6, 'Esse aut ea harum.', 'Ut fugiat aperiam numquam eum. Sint voluptatibus quos ea esse sunt rerum magni. Velit blanditiis ex modi quibusdam quod sit. Nemo quibusdam quam in quia.', 'quos', '1976-08-17', 11, 3, NULL, NULL),
(7, 'Ut velit temporibus tempora vel.', 'Laborum reiciendis delectus necessitatibus molestiae dolorem. Nesciunt qui sed natus omnis dolor rerum sequi. Et eos hic rerum. Molestias earum tempora molestiae et.', 'iure', '2013-02-10', 3, 3, NULL, NULL),
(8, 'Ex velit a doloremque libero.', 'Rem vel veritatis a quas. Commodi totam aut eligendi adipisci enim ut. Asperiores qui quo illum occaecati et adipisci.', 'impedit voluptatibus', '1970-08-06', 10, 2, NULL, NULL),
(9, 'Sed ullam cumque animi.', 'Provident dolores magni consequatur minus voluptatum facere ut. Sunt dolores sequi impedit vero id dolorem. Molestiae voluptatem dignissimos aut laborum.', 'minus', '1988-07-12', 3, 1, NULL, NULL),
(10, 'Dolore quia placeat consequuntur.', 'Eaque cum incidunt aut est ratione dignissimos consequatur. Dolores quis id ab a ullam at ut animi. Necessitatibus eum consequatur nostrum sit nam.', 'officia quod', '1976-02-28', 2, 3, NULL, NULL),
(11, 'Et quaerat magni.', 'Et et explicabo accusamus porro quia excepturi id. Enim ex est aspernatur labore. Culpa labore eaque officia officiis.', 'optio molestiae', '2019-08-23', 9, 2, NULL, NULL),
(12, 'Ducimus voluptatem tempora et ex est.', 'Eos delectus laborum quis molestiae. Autem mollitia recusandae dignissimos quos. Nobis est ut ullam voluptas debitis necessitatibus voluptas. Maiores culpa error sed qui vel magnam.', 'omnis', '1971-05-06', 7, 1, NULL, NULL),
(13, 'Qui quod animi.', 'Est numquam ex rerum sapiente. Ducimus et sed explicabo ducimus debitis magni est exercitationem. Dolorem molestiae commodi qui labore sit quos inventore vitae.', 'molestiae', '1998-02-24', 2, 3, NULL, NULL),
(14, 'Nostrum nihil consequatur fuga.', 'Corporis tenetur molestiae dolorem voluptas. Ab totam iusto modi et magni. At non doloremque accusantium est voluptas.', 'voluptatum et', '2011-11-14', 10, 2, NULL, NULL),
(15, 'Totam et architecto in fugiat et.', 'Dolores aut vel enim ut. Reiciendis fuga optio sunt. Repellendus asperiores id aperiam eligendi corporis illum sit. Sunt hic omnis minima totam.', 'nobis earum', '1985-10-29', 7, 4, NULL, NULL),
(16, 'Officiis doloribus nihil officiis sint ab.', 'Nisi vero excepturi iste ipsam vitae ut aperiam. Ea cum eius quia occaecati sunt rerum. Dignissimos qui eveniet facilis optio sed. Dolorem facilis eum explicabo sit aspernatur modi quia consequatur. Sit officiis dolorem quod quis.', 'sapiente dolorem', '1978-08-26', 2, 4, NULL, NULL),
(17, 'Provident nulla provident.', 'Doloremque velit est sit suscipit vitae officia. Id sint inventore fugit et sint. Deleniti dolorem eveniet iure cupiditate officiis a.', 'modi temporibus', '1977-08-14', 8, 1, NULL, NULL),
(18, 'Quam porro ipsum architecto.', 'Excepturi maiores dolor veritatis. Quo dicta vel odit corporis. Quaerat et tempore rerum in soluta ipsam.', 'voluptas iste', '1982-10-21', 6, 1, NULL, NULL),
(19, 'Sed cupiditate non.', 'Iusto repudiandae rerum pariatur tenetur delectus. Quia quia asperiores laudantium qui ea quia autem. Dolorem in recusandae eligendi eveniet sapiente atque quaerat.', 'et et', '1997-03-17', 6, 3, NULL, NULL),
(20, 'Possimus et omnis.', 'Veritatis aliquid tempora pariatur odio iure et quis sunt. Quia quaerat magni quia inventore ullam et harum. Quos placeat laborum molestiae doloribus quaerat et. Quisquam voluptas unde maxime odit.', 'excepturi', '2014-11-02', 2, 4, NULL, NULL),
(21, 'At officiis aspernatur voluptatem praesentium recusandae.', 'Quia quo deserunt aut sint nisi earum. Consequatur aut iusto voluptas sit eveniet rerum. Pariatur non cupiditate repellendus.', 'eos', '1996-01-30', 2, 4, NULL, NULL),
(22, 'Dolores excepturi in doloremque id sapiente.', 'Voluptates minima officia consequatur voluptas et. Nemo optio eos et dolore. Recusandae ex doloribus sunt quibusdam ut velit fugit.', 'mollitia', '2006-09-04', 7, 2, NULL, NULL),
(23, 'Occaecati sed praesentium cum officiis.', 'Aspernatur mollitia soluta beatae beatae sequi autem laborum. Dolores animi dolore est rerum qui doloribus porro. Explicabo corrupti reiciendis beatae quos necessitatibus.', 'labore ullam', '2010-10-08', 5, 3, NULL, NULL),
(24, 'Quia doloremque veritatis sunt dolorum omnis.', 'Ducimus rerum et consequatur et blanditiis voluptatum deleniti. Qui sint sint non quo aliquid ipsum. Quia qui qui assumenda optio et quae.', 'dolor sit', '1986-08-07', 8, 1, NULL, NULL),
(25, 'Odio quas aliquam omnis.', 'Non distinctio hic quod cumque et ipsum dolore ullam. Est mollitia voluptate vero omnis. Quod id debitis reiciendis voluptatem sit aut impedit quam. Magni suscipit repellat veritatis optio ut delectus enim.', 'officiis repellendus', '1986-01-07', 10, 2, NULL, NULL),
(26, 'Quis culpa unde ipsum quia.', 'Deserunt corrupti deserunt dignissimos qui nihil. Qui iusto deleniti aliquam nihil et aut corporis. Voluptate quo enim id.', 'aut', '1975-07-18', 7, 3, NULL, NULL),
(27, 'Enim et ipsum excepturi perferendis.', 'Laboriosam rerum aut qui eos magnam. Voluptatibus voluptatum suscipit et aut. Ut est voluptatem eligendi eius facere repudiandae minima. Facere alias itaque atque iure quae ducimus ea.', 'qui voluptatibus', '1989-06-19', 10, 3, NULL, NULL),
(28, 'Sint et est quia blanditiis reprehenderit.', 'Quia occaecati non est odio. Tenetur et officiis ut ducimus nihil inventore. Ad et totam minus mollitia.', 'aut sint', '1995-11-16', 11, 3, NULL, NULL),
(29, 'Totam vitae quibusdam adipisci impedit.', 'Vero sit suscipit nisi provident possimus cum assumenda facere. Exercitationem aliquid excepturi et nihil beatae.', 'et temporibus', '1995-01-30', 6, 1, NULL, NULL),
(30, 'Repellat velit enim commodi enim.', 'Eius repellendus omnis voluptates neque aut. Voluptas distinctio suscipit cumque et eos. Maxime delectus et quisquam excepturi sed ratione atque. Harum ut quia et minima dolorum ut quisquam.', 'quibusdam enim', '2014-05-14', 3, 2, NULL, NULL),
(31, 'Labore repudiandae hic.', 'Enim voluptates perspiciatis culpa amet voluptatem dolorum quia reprehenderit. Nobis culpa in id odio esse atque. Quod dolor eum sunt pariatur. Qui corporis ducimus cum eaque maxime odit eum.', 'quas et', '2019-10-23', 11, 4, NULL, NULL),
(32, 'Libero veniam sint officiis totam.', 'Repellat alias tenetur voluptatem eius est harum reprehenderit. Aut tempora nihil laudantium autem voluptatem eum voluptate.', 'deleniti recusandae', '1983-07-29', 6, 3, NULL, NULL),
(33, 'Aut recusandae deserunt qui magnam.', 'Aut cumque error quo nam fuga. Maiores cupiditate ut labore totam.', 'qui aut', '1995-01-20', 10, 4, NULL, NULL),
(34, 'Sit ut harum est ut.', 'Enim perspiciatis neque quia cupiditate. Aut et saepe sit qui atque. Recusandae facere dignissimos rem et officia. Quo et eos eligendi molestiae quis.', 'quis', '1983-03-17', 5, 1, NULL, NULL),
(35, 'Esse voluptates excepturi placeat.', 'Minus tenetur harum doloremque. Est quia repellat inventore. Et quas corporis qui sit quasi molestias velit totam.', 'et ea', '2020-03-21', 4, 2, NULL, NULL),
(36, 'Nihil vel eum et rerum.', 'Culpa ab qui consequatur voluptatem. Et reiciendis ut quam non.', 'accusamus voluptatem', '1976-05-18', 6, 2, NULL, NULL),
(37, 'Consequatur doloribus dicta doloribus alias.', 'Quos harum sequi ut recusandae nobis. Autem sunt aperiam tempora recusandae officiis. Exercitationem voluptatum non earum ut nemo et. Omnis quos consequatur ad voluptates id. Saepe quia amet sapiente.', 'cumque voluptate', '1998-12-27', 11, 3, NULL, NULL),
(38, 'Non id unde earum.', 'Molestias cupiditate voluptas id voluptates facere eum et. Suscipit sint commodi atque consequatur. Qui eum reiciendis cum.', 'natus', '1980-07-03', 6, 4, NULL, NULL),
(39, 'Non voluptatum atque.', 'Accusamus officia eligendi deserunt sed vero. Impedit velit unde labore voluptatem ut autem nobis. Corporis omnis eos et sint quo eos aspernatur. Consequatur doloremque non et voluptas quia dolor autem.', 'soluta', '1996-01-07', 4, 4, NULL, NULL),
(40, 'Quo a dignissimos.', 'Voluptatem nisi quasi tempora et quisquam. Non porro minima quia sint enim in at placeat. Id eaque sit doloremque aut eius.', 'perspiciatis', '1983-07-04', 2, 4, NULL, NULL),
(41, 'Magnam aut quia quasi illum vel.', 'Ipsa consequatur inventore qui eius dolore quibusdam. Et sed ab et asperiores expedita. Perferendis blanditiis ratione enim molestiae est sunt aut. Sit quo rerum incidunt.', 'ut explicabo', '1994-03-18', 11, 3, NULL, NULL),
(42, 'Iusto sunt id distinctio et nihil.', 'A dicta deserunt inventore. Facere nobis sed cum sapiente voluptas qui. Id est accusamus minima aut sint assumenda.', 'qui', '1979-12-25', 8, 3, NULL, NULL),
(43, 'Perferendis in et et.', 'Dolorem nihil porro enim hic nostrum est et veniam. Ipsam quas ullam aut numquam. Rerum earum sequi sed eum doloribus aut.', 'quam et', '2004-01-17', 7, 2, NULL, NULL),
(44, 'Est veniam eveniet sequi.', 'Aut ducimus culpa consequuntur et. Blanditiis quo ut molestiae ut iure. Deleniti numquam enim voluptatum harum nihil. Et molestias fugit minima.', 'dolore', '1995-09-18', 6, 4, NULL, NULL),
(45, 'Harum illo sint ab nesciunt.', 'Odio omnis doloribus beatae nihil ex et et. Debitis aut non eos adipisci magni ad officia. Corrupti tempora exercitationem et incidunt et nostrum autem. Aspernatur alias suscipit ab ut.', 'omnis', '2012-02-07', 8, 3, NULL, NULL),
(46, 'Ut aut est quasi ab.', 'Facere voluptatem magni ullam qui assumenda. Mollitia eum suscipit voluptatem ipsum est. Animi voluptas quia repellendus assumenda quis mollitia omnis laborum. Omnis voluptatem odio a inventore debitis consequatur asperiores reprehenderit.', 'qui', '1982-09-27', 9, 1, NULL, NULL),
(47, 'Molestiae cupiditate nihil aut ullam.', 'Dolorem accusantium provident provident ipsam quidem voluptatem perferendis. Rerum est eum delectus provident qui totam aut. Porro voluptatem est ipsum non facilis omnis sint. Quod iste perferendis ad tenetur minus veniam distinctio excepturi.', 'suscipit', '2005-11-27', 5, 3, NULL, NULL),
(48, 'Fuga ea eos sed quidem minima.', 'Omnis aperiam aut odio voluptates ea. Perferendis expedita eos minima. Accusantium atque quia est ut optio reiciendis est atque. Assumenda qui non optio.', 'mollitia ea', '2001-12-17', 10, 3, NULL, NULL),
(49, 'Et perferendis adipisci ut alias.', 'Deleniti eos porro qui et voluptatem. Voluptatem dolore praesentium deleniti veritatis eos nisi dolores. Accusantium id vel sequi tempore modi expedita quibusdam quaerat.', 'id', '2016-11-22', 5, 4, NULL, NULL),
(50, 'Minus nam vitae consequatur id.', 'Autem dolorum qui id qui hic veritatis voluptates. Et dolorem ducimus voluptatibus qui deserunt. Voluptatum aliquam ut maxime assumenda ex aut.', 'nemo', '2015-10-14', 5, 1, NULL, NULL),
(51, 'Sunt iusto voluptas quia tenetur temporibus.', 'Vel autem accusantium necessitatibus fugiat quo. Totam ad illo quasi. Rerum voluptatem error ut fugiat odio dolores tenetur. Eos et neque quam laborum perferendis ea voluptas.', 'facilis laboriosam', '1981-10-12', 11, 1, NULL, NULL),
(52, 'Necessitatibus est ut error doloremque.', 'Deserunt provident quasi sequi mollitia. Et ut quas ducimus veniam culpa sed ipsum. Voluptas unde consectetur dolorem doloribus ab omnis. Magnam rerum eveniet eos cum nam eaque. Libero illum soluta sint rerum et et ut.', 'ducimus nihil', '1986-11-04', 4, 3, NULL, NULL),
(53, 'Quae ad ea doloremque beatae.', 'Recusandae quod maiores fuga omnis. Impedit quo sint aut deleniti.', 'voluptas voluptas', '2001-01-28', 7, 3, NULL, NULL),
(54, 'Assumenda illo facilis suscipit.', 'Quisquam possimus iste debitis molestias accusamus nihil aperiam. Dolorum illum quos quod aperiam quis. Corrupti doloribus est eum officia libero maxime. Assumenda rerum molestiae enim consectetur tenetur sint assumenda.', 'voluptatem aut', '2020-04-07', 7, 3, NULL, NULL),
(55, 'Delectus optio sint consequuntur.', 'Ea accusamus exercitationem magnam rerum blanditiis hic accusantium. A id ut odio omnis debitis dolorum earum. Eum voluptate consequuntur voluptates qui et eos.', 'iste deleniti', '2011-11-16', 6, 1, NULL, NULL),
(56, 'Aut provident autem sed.', 'Voluptate sequi iste iste saepe. Beatae qui voluptatem nulla quia nihil. Qui est veritatis voluptatum eos et optio.', 'asperiores esse', '1992-09-01', 9, 2, NULL, NULL),
(57, 'Ducimus odit voluptatem unde nemo consequatur.', 'Amet vitae delectus aperiam nesciunt omnis facere eaque modi. Voluptatibus in aliquam non. Ea et id eius. Nam nihil autem excepturi sequi odio quia omnis.', 'fugiat aut', '1982-10-07', 3, 1, NULL, NULL),
(58, 'Fugiat et qui.', 'Ea molestias et assumenda laboriosam fugit reiciendis ad. Aperiam facilis expedita hic id consequatur odit. Nulla at impedit rem assumenda eaque expedita vel. Omnis porro eligendi ut magni voluptatem temporibus.', 'et repellat', '1970-06-07', 9, 4, NULL, NULL),
(59, 'Iste deserunt similique aspernatur.', 'Distinctio quos aut laudantium. Ex quia voluptas nihil quos aperiam in esse. Sapiente illum animi numquam et. Nihil omnis vitae saepe sit ut.', 'error', '1982-10-08', 8, 1, NULL, NULL),
(60, 'Quia ut qui dolorem ducimus nisi.', 'Neque amet repellendus inventore placeat tempora aut iusto quisquam. Quis autem laudantium dolores sunt. Placeat enim et at sapiente. Veniam magnam animi impedit quo.', 'consequuntur', '1976-06-27', 10, 4, NULL, NULL),
(61, 'Ut autem deserunt quo provident.', 'Exercitationem aut qui deserunt nesciunt qui provident tempora. Dolorem et quo quam aliquid autem qui earum. Et laborum sint quo asperiores non.', 'quia sequi', '1981-12-05', 7, 3, NULL, NULL),
(62, 'Deserunt quis alias ea.', 'Magnam doloribus et soluta in nostrum velit fugiat sapiente. Quia quis dolorem ut libero ad. Animi et dolores maxime sint dolor at.', 'non', '1995-09-29', 9, 1, NULL, NULL),
(63, 'Voluptas perferendis sed quo.', 'Quos ducimus minus sunt rem accusantium fugiat. Dolor aliquam nobis quis id illo vero aliquid. Dolores iure ducimus ratione laboriosam.', 'qui doloremque', '2006-11-28', 5, 2, NULL, NULL),
(64, 'Atque iste temporibus.', 'Ut culpa dolorem fugit optio veniam. Eum itaque consequatur dignissimos voluptate repudiandae et. Dolores sapiente animi sapiente non autem explicabo quod nesciunt.', 'in', '2010-07-30', 4, 2, NULL, NULL),
(65, 'Consequuntur eos omnis cupiditate provident mollitia.', 'Porro quae qui doloribus earum voluptas officia. Eveniet laborum excepturi aut voluptates. Vel esse et quo omnis. Ea quibusdam ut porro eos odit voluptatum aut explicabo. Est ut aliquam in voluptatibus enim neque tempora dolorum.', 'et', '1985-11-05', 4, 4, NULL, NULL),
(66, 'Quam ut repellendus id.', 'Eos ipsa aperiam voluptatum illum. Iste distinctio minima provident quo. Ut aliquid vero labore qui.', 'aut sint', '1980-12-16', 11, 4, NULL, NULL),
(67, 'Unde voluptas dolore.', 'Et natus delectus earum nihil. Suscipit nesciunt tenetur animi ea asperiores. Voluptas et adipisci dolore.', 'doloremque quo', '2001-05-29', 10, 4, NULL, NULL),
(68, 'Accusamus asperiores dolor tempora vel.', 'Dolorem voluptas dolorum dolor ex eum et. Adipisci nam sapiente consequatur excepturi. Voluptatum vero odio tenetur quia tempora iusto deleniti. Nemo consequatur reiciendis nihil sapiente molestiae libero.', 'natus odit', '1977-11-04', 7, 4, NULL, NULL),
(69, 'Dolorem delectus est placeat.', 'Temporibus ab nisi in veritatis architecto. Officiis adipisci aut culpa quae aut ut. Eos eius aliquam voluptas fugit accusamus pariatur.', 'facilis', '2009-02-21', 3, 2, NULL, NULL),
(70, 'Ut maiores id est numquam quae.', 'Voluptas nihil eaque ad est provident. Sint molestias temporibus totam sit consectetur occaecati. Occaecati facere maxime quia consequuntur beatae rerum nam dignissimos.', 'voluptates', '2010-09-11', 8, 2, NULL, NULL),
(71, 'Et omnis cupiditate voluptas nihil.', 'Rem ut in ab. Dolorem eos eos earum magni voluptatum. Aut quo libero cupiditate et. Doloremque quo cupiditate et quis suscipit.', 'rerum', '2014-10-30', 7, 1, NULL, NULL),
(72, 'Est itaque nihil sequi voluptatem excepturi.', 'Iusto magni incidunt possimus eos consequatur. Ut reiciendis doloremque sunt velit porro qui similique. Sunt rerum cum at modi quidem.', 'officia ea', '2018-07-11', 6, 2, NULL, NULL),
(73, 'Corporis qui adipisci similique laboriosam vel.', 'Omnis odio incidunt laboriosam alias eligendi in ullam. Suscipit vitae dolorum facilis reiciendis voluptate rem reiciendis. Voluptatem iure rem animi molestiae consequuntur ex commodi. Harum aperiam tempora quo delectus nam et ducimus.', 'nulla omnis', '1992-12-29', 2, 2, NULL, NULL),
(74, 'Sint aperiam libero veritatis corrupti.', 'Unde odio voluptatem ducimus tempore minus. Labore ea perspiciatis sed et consectetur. Expedita at dolorem quas ipsum quia. Sapiente illo voluptatem saepe eum minima sed distinctio. Quia voluptatem iste voluptas ipsam.', 'tenetur porro', '1983-05-30', 3, 2, NULL, NULL),
(75, 'Aut quos quasi fuga.', 'Magni ut sit dolorem eveniet. Molestiae quis perferendis nisi repudiandae cumque et esse odio. Quos repellendus qui esse iste eum.', 'accusantium', '2003-03-03', 5, 3, NULL, NULL),
(76, 'Veniam consequatur qui.', 'Ut distinctio quis vel soluta laborum est. Aliquam magni eveniet aut possimus dolores eligendi sit et. Dolor animi illo eligendi illo incidunt repellat quis officia. Voluptatem aut inventore architecto quas aut tempore eos.', 'inventore', '2010-06-11', 3, 3, NULL, NULL),
(77, 'Id rerum qui reprehenderit.', 'Praesentium inventore possimus ut aut ut mollitia voluptas. Cumque id vel at officiis. Commodi et rerum voluptatem dignissimos explicabo assumenda voluptatem. In vel itaque saepe cum molestiae fuga.', 'quis quia', '1996-02-19', 9, 3, NULL, NULL),
(78, 'Autem omnis tenetur molestias perspiciatis.', 'Quo et autem modi. Sunt eos quis itaque perferendis esse. Consequatur et eum tempore temporibus hic possimus velit. Debitis voluptas ipsum hic numquam architecto qui.', 'illo', '1993-10-11', 5, 3, NULL, NULL),
(79, 'Vel harum perspiciatis.', 'Et a ipsam consequatur consequatur. Exercitationem libero qui labore qui debitis quia delectus. Occaecati corporis nihil sunt reiciendis.', 'ducimus reiciendis', '1985-08-04', 6, 2, NULL, NULL),
(80, 'Fugiat dolorem fuga sunt.', 'Ea eaque autem facere ipsa. Reiciendis doloremque sit architecto laborum praesentium delectus sequi. Omnis doloribus voluptatem voluptas expedita voluptas laborum laudantium. Dolorem quas veritatis et consequatur.', 'repudiandae perspiciatis', '1983-08-20', 7, 1, NULL, NULL),
(81, 'Esse ipsa sint vel.', 'Porro quia harum enim enim. Voluptatem eos consequatur harum eos. Voluptatem autem quia sit consequatur iste quia eos.', 'repudiandae cum', '2010-02-07', 7, 1, NULL, NULL),
(82, 'Eos debitis ratione quidem earum.', 'Molestiae velit error qui nihil a accusamus iusto eos. Et ea dicta a accusamus. Quia magni ut amet expedita necessitatibus maxime nisi. Placeat velit autem incidunt sed.', 'nihil', '2002-03-14', 5, 3, NULL, NULL),
(83, 'Rerum non unde id.', 'Veniam voluptas voluptas amet voluptatem ad soluta expedita. Iure ut est voluptatem nobis rerum. Id iste impedit quia necessitatibus unde dicta sint est.', 'in', '1993-10-24', 10, 3, NULL, NULL),
(84, 'Ut voluptas placeat inventore hic impedit.', 'Quam ad quos dolores ut nulla corrupti. Quos veritatis nesciunt vel esse maxime consectetur possimus. Consectetur eum quia neque.', 'voluptatem', '2014-09-17', 4, 1, NULL, NULL),
(85, 'Non est dolores minima omnis suscipit.', 'Excepturi repellat vitae optio distinctio incidunt. Architecto accusantium harum laboriosam neque voluptatum perspiciatis occaecati. Ea a ut temporibus modi. Omnis vitae fuga maxime adipisci quasi harum. Quo ratione voluptas voluptate.', 'nulla eos', '2015-09-19', 4, 3, NULL, NULL),
(86, 'Quae sint numquam.', 'Facere blanditiis quae est error repudiandae. Sapiente voluptatem quia illum a dolor. Qui quam eos voluptatem occaecati. Consequuntur quia quos amet sit.', 'corrupti earum', '1988-06-25', 4, 1, NULL, NULL),
(87, 'Et vel ducimus nostrum.', 'Quod quo animi magni eum. Ad delectus qui et quia vitae rem consequatur. Omnis aut ex ut autem culpa ut expedita.', 'aut et', '1991-02-27', 2, 1, NULL, NULL),
(88, 'Eos illo minima quod.', 'Omnis qui numquam ratione accusamus. Cum unde ratione ex illum laborum. Illo similique et expedita sunt velit ad.', 'perferendis deserunt', '2002-12-07', 5, 2, NULL, NULL),
(89, 'Eius voluptatum quod repudiandae.', 'Id quos vero autem repudiandae aspernatur. Quis distinctio necessitatibus repellat sit. Minima veniam et quos neque ut numquam.', 'totam', '1996-07-30', 3, 3, NULL, NULL),
(90, 'Quis dignissimos non.', 'Ut dolore modi et. Est quo voluptatem quidem maxime. Vel itaque voluptatem voluptates ea. Aperiam nam ut qui atque nihil iure sit.', 'et', '2002-09-07', 7, 4, NULL, NULL),
(91, 'Id enim facilis consectetur.', 'Tempore ea et eaque quibusdam nostrum enim. Dolorum labore nostrum earum molestiae vitae provident iure. Nesciunt eius reiciendis quod harum aut.', 'ipsam et', '2019-04-11', 11, 2, NULL, NULL),
(92, 'Vel voluptatem maxime ex ducimus.', 'Qui saepe magnam nam sint. Minima explicabo doloribus sunt at veniam. Reprehenderit necessitatibus blanditiis laborum. Et deleniti excepturi laborum debitis qui.', 'amet ut', '1980-08-22', 9, 1, NULL, NULL),
(93, 'Adipisci aut quod esse sequi.', 'Tempora odio et nulla dolor minima quod. Ipsam aut cum repellat ut laboriosam. Quo eius quisquam perspiciatis deserunt et.', 'ut', '1991-08-22', 9, 4, NULL, NULL),
(94, 'Placeat provident asperiores.', 'Aliquid in veniam quam maiores. Commodi et tempore sequi nisi rerum vero corrupti. Cum iure sed dolore accusamus dolore ratione magnam. Iusto repellendus necessitatibus cumque placeat dolor.', 'amet', '2016-07-04', 11, 2, NULL, NULL),
(95, 'Ducimus et dolor et.', 'Veniam sed reiciendis totam qui eaque. Ab et omnis expedita dolor optio molestias. Repudiandae reiciendis vitae quis velit. Deleniti enim ab eum quaerat animi.', 'autem', '2004-10-01', 3, 4, NULL, NULL),
(96, 'Odit aut sint magni corporis sed.', 'In sit repudiandae sit dolorem voluptatem dolor excepturi. Consequatur adipisci odio delectus eum repellendus ea.', 'ipsam distinctio', '1978-04-17', 9, 2, NULL, NULL),
(97, 'Cupiditate aliquid et.', 'Quo ut molestiae vel quia in. Qui totam nemo quo. Et dolor tempore sequi deleniti enim placeat est. Doloribus quam unde laboriosam. Provident consectetur et sed repellendus et omnis et.', 'perferendis', '1980-12-06', 3, 3, NULL, NULL),
(98, 'Molestiae iure sed aliquid ut.', 'Vel modi pariatur minima nemo possimus. Repudiandae accusamus quia id numquam quod quam. Et autem debitis fuga doloribus sunt quis velit eaque.', 'iure', '2004-09-04', 10, 3, NULL, NULL),
(99, 'Placeat velit consequuntur ipsam.', 'Inventore rerum optio sit. Quae reprehenderit atque eius ut illo sed. Laudantium non sunt ut delectus sint placeat voluptatem. Veniam deserunt a asperiores tenetur sed aut.', 'neque', '2006-07-19', 3, 3, NULL, NULL),
(100, 'Laboriosam debitis sunt quidem quidem soluta.', 'Aut odio illo dolores dolore. Quis rerum possimus et excepturi in. Asperiores reiciendis et qui quaerat commodi nulla. Aut sed incidunt modi accusamus. Quas blanditiis voluptas quas dolorem explicabo commodi voluptatem.', 'voluptatibus', '2007-03-03', 4, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexo` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `alergias` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enfermedades_cronicas` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `nombre`, `apellidos`, `direccion`, `telefono`, `sexo`, `fecha_nacimiento`, `alergias`, `enfermedades_cronicas`, `created_at`, `updated_at`) VALUES
(2, 'Roman de Jesún', 'Vazquez Almazan', 'ifeoiefwoifeonfeow', '83412343234', 'M', '1999-08-04', 'no', 'no', '2020-07-16 04:59:03', '2020-07-16 12:04:06'),
(3, 'Edwin', 'Hernandez Martinez', '25 y 26 refinería', '83412345', 'M', '1998-08-04', 'No', 'Asma', '2020-07-16 07:39:30', '2020-07-16 12:04:17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `consulta_id` bigint(20) UNSIGNED NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id`, `consulta_id`, `monto`, `created_at`, `updated_at`) VALUES
(1, 2, '3480.00', '2020-08-03 11:09:01', '2020-08-03 11:09:01'),
(2, 1, '2610.00', '2020-08-03 12:21:33', '2020-08-03 12:21:33');

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
(1, 'browse bread 1', 'api', '2020-07-12 21:13:19', '2020-07-12 21:13:19'),
(2, 'read bread 1', 'api', '2020-07-12 21:13:19', '2020-07-12 21:13:19'),
(3, 'edit bread 1', 'api', '2020-07-12 21:13:19', '2020-07-12 21:13:19'),
(4, 'add bread 1', 'api', '2020-07-12 21:13:19', '2020-07-12 21:13:19'),
(5, 'delete bread 1', 'api', '2020-07-12 21:13:20', '2020-07-12 21:13:20');

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
(1, 'admin', 'api', '2020-07-12 21:13:03', '2020-07-12 21:13:03'),
(2, 'user', 'api', '2020-07-12 21:13:04', '2020-07-12 21:13:04'),
(3, 'guest', 'api', '2020-07-12 21:13:04', '2020-07-12 21:13:04'),
(4, 'doctor', 'api', '2020-08-02 10:31:31', '2020-08-02 10:32:05'),
(5, 'secretaria', 'api', '2020-08-04 05:31:04', '2020-08-04 05:31:04');

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
(3, 3, 5),
(4, 4, 3),
(5, 5, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicioconsultas`
--

CREATE TABLE `servicioconsultas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `consulta_id` bigint(20) UNSIGNED NOT NULL,
  `servicio_id` bigint(20) UNSIGNED NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `servicioconsultas`
--

INSERT INTO `servicioconsultas` (`id`, `consulta_id`, `servicio_id`, `cantidad`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, '2020-08-03 04:55:41', '2020-08-03 04:55:41'),
(2, 2, 1, 4, '2020-08-03 07:19:58', '2020-08-03 07:19:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `doctor_id`, `nombre`, `descripcion`, `costo`, `created_at`, `updated_at`) VALUES
(1, 1, 'Consulta General', 'Consulta', '750.00', '2020-08-01 23:48:39', '2020-08-02 00:09:50'),
(2, 1, 'Valoración de estudios', 'Valorar estudios realizados', '850.00', '2020-08-03 12:23:04', '2020-08-03 12:23:04');

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
(1, 'admin', 'admin@admin.com', '2020-07-12 21:13:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'admin', 'Active', 'VajmfgZr8U', '2020-07-12 21:13:04', '2020-08-08 04:17:23', NULL),
(2, 'Melyssa Howell', 'felicia31@example.org', '2020-07-12 21:13:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', 'Pending', 'gvGnY0NbLn', '2020-07-12 21:13:04', '2020-08-04 02:27:37', '2020-08-04 02:27:37'),
(3, 'Miss Bethel Davis Jr.', 'yschoen@example.com', '2020-07-12 21:13:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', 'Pending', 'fG0c6f2QgW', '2020-07-12 21:13:04', '2020-08-04 02:27:36', '2020-08-04 02:27:36'),
(4, 'Talia Muller PhD', 'hilbert54@example.com', '2020-07-12 21:13:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', 'Inactive', '6SPpLXHPUJ', '2020-07-12 21:13:05', '2020-08-04 02:27:29', '2020-08-04 02:27:29'),
(5, 'Nigel Frami Sr.', 'filomena45@example.com', '2020-07-12 21:13:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', 'Active', '7Mo8v0P7gX', '2020-07-12 21:13:05', '2020-08-04 02:27:23', '2020-08-04 02:27:23'),
(6, 'Niko Vandervort', 'klocko.ima@example.net', '2020-07-12 21:13:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', 'Inactive', 'UozRCiVJLB', '2020-07-12 21:13:05', '2020-08-04 02:27:27', '2020-08-04 02:27:27'),
(7, 'Kara Bode II', 'sheila.howe@example.com', '2020-07-12 21:13:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', 'Inactive', 'fWo04wtae4', '2020-07-12 21:13:05', '2020-08-04 02:27:30', '2020-08-04 02:27:30'),
(8, 'Jerry Koelpin', 'steuber.isabel@example.com', '2020-07-12 21:13:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', 'Active', '0ZDFn4EDee', '2020-07-12 21:13:05', '2020-08-04 02:27:31', '2020-08-04 02:27:31'),
(9, 'Maybell Legros', 'cielo11@example.org', '2020-07-12 21:13:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', 'Pending', 'bFU30rUV4y', '2020-07-12 21:13:05', '2020-08-04 02:27:32', '2020-08-04 02:27:32'),
(10, 'Arlene Nienow', 'pstark@example.net', '2020-07-12 21:13:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', 'Banned', 'GGrInGkLNF', '2020-07-12 21:13:05', '2020-08-04 02:27:34', '2020-08-04 02:27:34'),
(11, 'Prof. Adrien Parisian I', 'zoie61@example.org', '2020-07-12 21:13:05', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 'user', 'Banned', 'S3lI2zX7p1', '2020-07-12 21:13:05', '2020-08-04 02:27:35', '2020-08-04 02:27:35'),
(12, 'doctor1', 'doctor1@doctor.com', NULL, '$2y$10$Y8ornJurM912hdwq4Rpe9.t0CKJ2XA6e6Az53srS7HdJdLsR4zfYm', NULL, 'doctor', 'Active', NULL, '2020-08-04 02:26:21', '2020-08-04 02:38:21', NULL),
(13, 'doctor2', 'doctor2@doctor.com', NULL, '$2y$10$1Q6YxkSX6HEQXWMGeT5fweniX4wHcgeARqZT5hPizDH9mALhCefHO', NULL, 'doctor', 'Active', NULL, '2020-08-04 05:21:01', '2020-08-04 05:45:53', NULL),
(14, 'secretaria1', 'secretaria@secre.com', NULL, '$2y$10$SUb.CL1JNxE37C9n0zvYXObMuxIrpMceOe3tlkUtYvZF41Ng/29fa', NULL, 'secretaria', 'Active', NULL, '2020-08-04 05:32:04', '2020-08-04 05:43:55', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compartirs`
--
ALTER TABLE `compartirs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cortecajas`
--
ALTER TABLE `cortecajas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `doctores`
--
ALTER TABLE `doctores`
  ADD PRIMARY KEY (`id`);

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
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
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
-- Indices de la tabla `servicioconsultas`
--
ALTER TABLE `servicioconsultas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
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
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `compartirs`
--
ALTER TABLE `compartirs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cortecajas`
--
ALTER TABLE `cortecajas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `doctores`
--
ALTER TABLE `doctores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT de la tabla `menu_role`
--
ALTER TABLE `menu_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=255;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `role_hierarchy`
--
ALTER TABLE `role_hierarchy`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `servicioconsultas`
--
ALTER TABLE `servicioconsultas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `status`
--
ALTER TABLE `status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
