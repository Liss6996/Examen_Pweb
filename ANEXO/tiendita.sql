-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-07-2022 a las 04:52:23
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tiendita`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_interface_theme`
--

CREATE TABLE `admin_interface_theme` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_visible` tinyint(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `logo_visible` tinyint(1) NOT NULL,
  `css_header_background_color` varchar(10) NOT NULL,
  `title_color` varchar(10) NOT NULL,
  `css_header_text_color` varchar(10) NOT NULL,
  `css_header_link_color` varchar(10) NOT NULL,
  `css_header_link_hover_color` varchar(10) NOT NULL,
  `css_module_background_color` varchar(10) NOT NULL,
  `css_module_text_color` varchar(10) NOT NULL,
  `css_module_link_color` varchar(10) NOT NULL,
  `css_module_link_hover_color` varchar(10) NOT NULL,
  `css_module_rounded_corners` tinyint(1) NOT NULL,
  `css_generic_link_color` varchar(10) NOT NULL,
  `css_generic_link_hover_color` varchar(10) NOT NULL,
  `css_save_button_background_color` varchar(10) NOT NULL,
  `css_save_button_background_hover_color` varchar(10) NOT NULL,
  `css_save_button_text_color` varchar(10) NOT NULL,
  `css_delete_button_background_color` varchar(10) NOT NULL,
  `css_delete_button_background_hover_color` varchar(10) NOT NULL,
  `css_delete_button_text_color` varchar(10) NOT NULL,
  `list_filter_dropdown` tinyint(1) NOT NULL,
  `related_modal_active` tinyint(1) NOT NULL,
  `related_modal_background_color` varchar(10) NOT NULL,
  `related_modal_rounded_corners` tinyint(1) NOT NULL,
  `logo_color` varchar(10) NOT NULL,
  `recent_actions_visible` tinyint(1) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `related_modal_background_opacity` varchar(5) NOT NULL,
  `env_name` varchar(50) NOT NULL,
  `env_visible_in_header` tinyint(1) NOT NULL,
  `env_color` varchar(10) NOT NULL,
  `env_visible_in_favicon` tinyint(1) NOT NULL,
  `related_modal_close_button_visible` tinyint(1) NOT NULL,
  `language_chooser_active` tinyint(1) NOT NULL,
  `language_chooser_display` varchar(10) NOT NULL,
  `list_filter_sticky` tinyint(1) NOT NULL,
  `form_pagination_sticky` tinyint(1) NOT NULL,
  `form_submit_sticky` tinyint(1) NOT NULL,
  `css_module_background_selected_color` varchar(10) NOT NULL,
  `css_module_link_selected_color` varchar(10) NOT NULL,
  `logo_max_height` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_height` >= 0),
  `logo_max_width` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_width` >= 0),
  `foldable_apps` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `admin_interface_theme`
--

INSERT INTO `admin_interface_theme` (`id`, `name`, `active`, `title`, `title_visible`, `logo`, `logo_visible`, `css_header_background_color`, `title_color`, `css_header_text_color`, `css_header_link_color`, `css_header_link_hover_color`, `css_module_background_color`, `css_module_text_color`, `css_module_link_color`, `css_module_link_hover_color`, `css_module_rounded_corners`, `css_generic_link_color`, `css_generic_link_hover_color`, `css_save_button_background_color`, `css_save_button_background_hover_color`, `css_save_button_text_color`, `css_delete_button_background_color`, `css_delete_button_background_hover_color`, `css_delete_button_text_color`, `list_filter_dropdown`, `related_modal_active`, `related_modal_background_color`, `related_modal_rounded_corners`, `logo_color`, `recent_actions_visible`, `favicon`, `related_modal_background_opacity`, `env_name`, `env_visible_in_header`, `env_color`, `env_visible_in_favicon`, `related_modal_close_button_visible`, `language_chooser_active`, `language_chooser_display`, `list_filter_sticky`, `form_pagination_sticky`, `form_submit_sticky`, `css_module_background_selected_color`, `css_module_link_selected_color`, `logo_max_height`, `logo_max_width`, `foldable_apps`) VALUES
(1, 'Django', 1, 'Django administration', 1, '', 1, '#0C4B33', '#F5DD5D', '#44B78B', '#FFFFFF', '#C9F0DD', '#44B78B', '#FFFFFF', '#FFFFFF', '#C9F0DD', 1, '#0C3C26', '#156641', '#0C4B33', '#0C3C26', '#FFFFFF', '#BA2121', '#A41515', '#FFFFFF', 1, 1, '#000000', 1, '#FFFFFF', 1, '', '0.3', '', 1, '#E74C3C', 1, 1, 1, 'code', 1, 0, 0, '#FFFFCC', '#FFFFFF', 100, 400, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(14, 1, 29),
(15, 1, 30),
(16, 1, 31),
(6, 1, 32),
(7, 1, 36),
(8, 1, 40),
(9, 1, 44),
(10, 1, 48),
(11, 1, 52),
(12, 1, 56),
(13, 1, 60),
(1, 1, 64),
(2, 1, 65),
(3, 1, 66),
(4, 1, 67),
(5, 1, 68);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add Theme', 1, 'add_theme'),
(2, 'Can change Theme', 1, 'change_theme'),
(3, 'Can delete Theme', 1, 'delete_theme'),
(4, 'Can view Theme', 1, 'view_theme'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add Cliente', 7, 'add_cliente'),
(26, 'Can change Cliente', 7, 'change_cliente'),
(27, 'Can delete Cliente', 7, 'delete_cliente'),
(28, 'Can view Cliente', 7, 'view_cliente'),
(29, 'Can add Donación', 8, 'add_donacion'),
(30, 'Can change Donación', 8, 'change_donacion'),
(31, 'Can delete Donación', 8, 'delete_donacion'),
(32, 'Can view Donación', 8, 'view_donacion'),
(33, 'Can add Estado Seguimiento', 9, 'add_estadoseguimiento'),
(34, 'Can change Estado Seguimiento', 9, 'change_estadoseguimiento'),
(35, 'Can delete Estado Seguimiento', 9, 'delete_estadoseguimiento'),
(36, 'Can view Estado Seguimiento', 9, 'view_estadoseguimiento'),
(37, 'Can add Tipos de Productos', 10, 'add_tipoproducto'),
(38, 'Can change Tipos de Productos', 10, 'change_tipoproducto'),
(39, 'Can delete Tipos de Productos', 10, 'delete_tipoproducto'),
(40, 'Can view Tipos de Productos', 10, 'view_tipoproducto'),
(41, 'Can add Tipo Usuario', 11, 'add_tipousuario'),
(42, 'Can change Tipo Usuario', 11, 'change_tipousuario'),
(43, 'Can delete Tipo Usuario', 11, 'delete_tipousuario'),
(44, 'Can view Tipo Usuario', 11, 'view_tipousuario'),
(45, 'Can add Producto', 12, 'add_producto'),
(46, 'Can change Producto', 12, 'change_producto'),
(47, 'Can delete Producto', 12, 'delete_producto'),
(48, 'Can view Producto', 12, 'view_producto'),
(49, 'Can add Pedido', 13, 'add_pedido'),
(50, 'Can change Pedido', 13, 'change_pedido'),
(51, 'Can delete Pedido', 13, 'delete_pedido'),
(52, 'Can view Pedido', 13, 'view_pedido'),
(53, 'Can add Historial de Compra', 14, 'add_historialcompra'),
(54, 'Can change Historial de Compra', 14, 'change_historialcompra'),
(55, 'Can delete Historial de Compra', 14, 'delete_historialcompra'),
(56, 'Can view Historial de Compra', 14, 'view_historialcompra'),
(57, 'Can add Detalle de Seguimiento', 15, 'add_detalleseguimiento'),
(58, 'Can change Detalle de Seguimiento', 15, 'change_detalleseguimiento'),
(59, 'Can delete Detalle de Seguimiento', 15, 'delete_detalleseguimiento'),
(60, 'Can view Detalle de Seguimiento', 15, 'view_detalleseguimiento'),
(61, 'Can add Detalle Pedido', 16, 'add_detallepedido'),
(62, 'Can change Detalle Pedido', 16, 'change_detallepedido'),
(63, 'Can delete Detalle Pedido', 16, 'delete_detallepedido'),
(64, 'Can view Detalle Pedido', 16, 'view_detallepedido'),
(65, 'Can add Carrito de Compra', 17, 'add_carrito'),
(66, 'Can change Carrito de Compra', 17, 'change_carrito'),
(67, 'Can delete Carrito de Compra', 17, 'delete_carrito'),
(68, 'Can view Carrito de Compra', 17, 'view_carrito'),
(69, 'Can add log entry', 18, 'add_logentry'),
(70, 'Can change log entry', 18, 'change_logentry'),
(71, 'Can delete log entry', 18, 'delete_logentry'),
(72, 'Can view log entry', 18, 'view_logentry');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$th1sEXylh6BZC6y7pfud03$ZgsFiO2yRIJAystcXgaNJ6NRXMqTv4dtMjTR4GUON7o=', '2022-07-09 02:40:48.095959', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2022-07-09 02:39:24.584120');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `id_cliente_id` bigint(20) NOT NULL,
  `id_producto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` bigint(20) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `estado_sub` tinyint(1) NOT NULL,
  `saldo` int(11) NOT NULL,
  `tipo_usuario_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `id_pedido_id` int(11) NOT NULL,
  `id_producto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_seguimiento`
--

CREATE TABLE `detalle_seguimiento` (
  `id` int(11) NOT NULL,
  `fecha_proceso` date NOT NULL,
  `id_estado_id` int(11) NOT NULL,
  `id_pedido_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-07-09 02:48:43.929627', '1', 'cliente', 1, '[{\"added\": {}}]', 3, 1),
(2, '2022-07-09 02:48:54.846262', '1', 'admin', 1, '[{\"added\": {}}]', 11, 1),
(3, '2022-07-09 02:49:02.786706', '2', 'cliente', 1, '[{\"added\": {}}]', 11, 1),
(4, '2022-07-09 02:49:15.953738', '1', 'TipoProducto object (1)', 1, '[{\"added\": {}}]', 10, 1),
(5, '2022-07-09 02:49:21.874021', '2', 'TipoProducto object (2)', 1, '[{\"added\": {}}]', 10, 1),
(6, '2022-07-09 02:49:27.775452', '3', 'TipoProducto object (3)', 1, '[{\"added\": {}}]', 10, 1),
(7, '2022-07-09 02:49:35.540492', '4', 'TipoProducto object (4)', 1, '[{\"added\": {}}]', 10, 1),
(8, '2022-07-09 02:50:55.638336', '1', 'EstadoSeguimiento object (1)', 1, '[{\"added\": {}}]', 9, 1),
(9, '2022-07-09 02:51:04.803088', '2', 'EstadoSeguimiento object (2)', 1, '[{\"added\": {}}]', 9, 1),
(10, '2022-07-09 02:51:22.668256', '3', 'EstadoSeguimiento object (3)', 1, '[{\"added\": {}}]', 9, 1),
(11, '2022-07-09 02:51:28.023536', '4', 'EstadoSeguimiento object (4)', 1, '[{\"added\": {}}]', 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(18, 'admin', 'logentry'),
(1, 'admin_interface', 'theme'),
(17, 'app', 'carrito'),
(7, 'app', 'cliente'),
(16, 'app', 'detallepedido'),
(15, 'app', 'detalleseguimiento'),
(8, 'app', 'donacion'),
(9, 'app', 'estadoseguimiento'),
(14, 'app', 'historialcompra'),
(13, 'app', 'pedido'),
(12, 'app', 'producto'),
(10, 'app', 'tipoproducto'),
(11, 'app', 'tipousuario'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-07-09 02:38:57.021717'),
(2, 'auth', '0001_initial', '2022-07-09 02:38:57.362804'),
(3, 'admin', '0001_initial', '2022-07-09 02:38:57.466914'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-07-09 02:38:57.479916'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-07-09 02:38:57.495916'),
(6, 'admin_interface', '0001_initial', '2022-07-09 02:38:57.515921'),
(7, 'admin_interface', '0002_add_related_modal', '2022-07-09 02:38:57.629925'),
(8, 'admin_interface', '0003_add_logo_color', '2022-07-09 02:38:57.660927'),
(9, 'admin_interface', '0004_rename_title_color', '2022-07-09 02:38:57.678930'),
(10, 'admin_interface', '0005_add_recent_actions_visible', '2022-07-09 02:38:57.705932'),
(11, 'admin_interface', '0006_bytes_to_str', '2022-07-09 02:38:57.813031'),
(12, 'admin_interface', '0007_add_favicon', '2022-07-09 02:38:57.849614'),
(13, 'admin_interface', '0008_change_related_modal_background_opacity_type', '2022-07-09 02:38:57.898618'),
(14, 'admin_interface', '0009_add_enviroment', '2022-07-09 02:38:57.954624'),
(15, 'admin_interface', '0010_add_localization', '2022-07-09 02:38:57.976465'),
(16, 'admin_interface', '0011_add_environment_options', '2022-07-09 02:38:58.060472'),
(17, 'admin_interface', '0012_update_verbose_names', '2022-07-09 02:38:58.070472'),
(18, 'admin_interface', '0013_add_related_modal_close_button', '2022-07-09 02:38:58.098475'),
(19, 'admin_interface', '0014_name_unique', '2022-07-09 02:38:58.117480'),
(20, 'admin_interface', '0015_add_language_chooser_active', '2022-07-09 02:38:58.146482'),
(21, 'admin_interface', '0016_add_language_chooser_display', '2022-07-09 02:38:58.195487'),
(22, 'admin_interface', '0017_change_list_filter_dropdown', '2022-07-09 02:38:58.206484'),
(23, 'admin_interface', '0018_theme_list_filter_sticky', '2022-07-09 02:38:58.236485'),
(24, 'admin_interface', '0019_add_form_sticky', '2022-07-09 02:38:58.288490'),
(25, 'admin_interface', '0020_module_selected_colors', '2022-07-09 02:38:58.353504'),
(26, 'admin_interface', '0021_file_extension_validator', '2022-07-09 02:38:58.364506'),
(27, 'admin_interface', '0022_add_logo_max_width_and_height', '2022-07-09 02:38:58.419510'),
(28, 'admin_interface', '0023_theme_foldable_apps', '2022-07-09 02:38:58.448513'),
(29, 'admin_interface', '0024_remove_theme_css', '2022-07-09 02:38:58.465516'),
(30, 'app', '0001_initial', '2022-07-09 02:38:59.035564'),
(31, 'app', '0002_alter_donacion_usuario', '2022-07-09 02:38:59.258850'),
(32, 'contenttypes', '0002_remove_content_type_name', '2022-07-09 02:38:59.368858'),
(33, 'auth', '0002_alter_permission_name_max_length', '2022-07-09 02:38:59.413863'),
(34, 'auth', '0003_alter_user_email_max_length', '2022-07-09 02:38:59.439864'),
(35, 'auth', '0004_alter_user_username_opts', '2022-07-09 02:38:59.453866'),
(36, 'auth', '0005_alter_user_last_login_null', '2022-07-09 02:38:59.500870'),
(37, 'auth', '0006_require_contenttypes_0002', '2022-07-09 02:38:59.504870'),
(38, 'auth', '0007_alter_validators_add_error_messages', '2022-07-09 02:38:59.519871'),
(39, 'auth', '0008_alter_user_username_max_length', '2022-07-09 02:38:59.543873'),
(40, 'auth', '0009_alter_user_last_name_max_length', '2022-07-09 02:38:59.567876'),
(41, 'auth', '0010_alter_group_name_max_length', '2022-07-09 02:38:59.595876'),
(42, 'auth', '0011_update_proxy_permissions', '2022-07-09 02:38:59.618879'),
(43, 'auth', '0012_alter_user_first_name_max_length', '2022-07-09 02:38:59.642881'),
(44, 'sessions', '0001_initial', '2022-07-09 02:38:59.676883');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0hsjhb8a3a3iuzi65bs7ei607pucarw2', '.eJxVjDsOwjAQBe_iGlmOteA1JT1nsPYHCSBbyqeKuDtESgHtm5m3ukLL3JdlsrEM6s6uc4ffjUmeVjegD6r35qXVeRzYb4rf6eSvTe112d2_g56m_lvHnABFGc1QQ1YCCiDQRQTIxrfEmSzYMRAlDCIsSTgywokJTdS9P_vhOSA:1oA0Om:nxHLUvvW02dKuWyonYdXDTUZujcIUF6j7YXJ4J1HjlA', '2022-07-23 02:40:48.099417');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `donacion`
--

CREATE TABLE `donacion` (
  `id` bigint(20) NOT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `donacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_seguimiento`
--

CREATE TABLE `estado_seguimiento` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado_seguimiento`
--

INSERT INTO `estado_seguimiento` (`id`, `descripcion`) VALUES
(4, 'Entregado'),
(2, 'Preparación'),
(3, 'Reparto'),
(1, 'Validación');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_compra`
--

CREATE TABLE `historial_compra` (
  `id` int(11) NOT NULL,
  `id_pedido_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `id_cliente_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `precio` int(11) NOT NULL,
  `descripcion` varchar(40) NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_actualizacion` date NOT NULL,
  `id_tipo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `id_tipo` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_producto`
--

INSERT INTO `tipo_producto` (`id_tipo`, `tipo`) VALUES
(3, 'exoticos'),
(4, 'farmacia'),
(2, 'gatos'),
(1, 'perros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id` int(11) NOT NULL,
  `tipo_usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `tipo_usuario`) VALUES
(1, 'admin'),
(2, 'cliente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_interface_theme_name_30bda70f_uniq` (`name`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carrito_id_cliente_id_56f91302_fk_cliente_id` (`id_cliente_id`),
  ADD KEY `carrito_id_producto_id_66c0a9ab_fk_producto_codigo` (`id_producto_id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_tipo_usuario_id_ef9d2594_fk_tipo_usuario_id` (`tipo_usuario_id`),
  ADD KEY `cliente_usuario_id_ff892797_fk_auth_user_id` (`usuario_id`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_pedido_id_pedido_id_829ebbd4_fk_pedido_id` (`id_pedido_id`),
  ADD KEY `detalle_pedido_id_producto_id_a170aa3b_fk_producto_codigo` (`id_producto_id`);

--
-- Indices de la tabla `detalle_seguimiento`
--
ALTER TABLE `detalle_seguimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle_seguimiento_id_estado_id_d0188f8a_fk_estado_se` (`id_estado_id`),
  ADD KEY `detalle_seguimiento_id_pedido_id_3cf18a06_fk_pedido_id` (`id_pedido_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `donacion`
--
ALTER TABLE `donacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_seguimiento`
--
ALTER TABLE `estado_seguimiento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `descripcion` (`descripcion`);

--
-- Indices de la tabla `historial_compra`
--
ALTER TABLE `historial_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historial_compra_id_pedido_id_5f97191f_fk_pedido_id` (`id_pedido_id`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id_cliente_id_fcd9c6e9_fk_cliente_id` (`id_cliente_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `producto_id_tipo_id_0fe8ec8d_fk_tipo_producto_id_tipo` (`id_tipo_id`);

--
-- Indices de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`id_tipo`),
  ADD UNIQUE KEY `tipo` (`tipo`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_seguimiento`
--
ALTER TABLE `detalle_seguimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `donacion`
--
ALTER TABLE `donacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_seguimiento`
--
ALTER TABLE `estado_seguimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `historial_compra`
--
ALTER TABLE `historial_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_id_cliente_id_56f91302_fk_cliente_id` FOREIGN KEY (`id_cliente_id`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `carrito_id_producto_id_66c0a9ab_fk_producto_codigo` FOREIGN KEY (`id_producto_id`) REFERENCES `producto` (`codigo`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_tipo_usuario_id_ef9d2594_fk_tipo_usuario_id` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipo_usuario` (`id`),
  ADD CONSTRAINT `cliente_usuario_id_ff892797_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_id_pedido_id_829ebbd4_fk_pedido_id` FOREIGN KEY (`id_pedido_id`) REFERENCES `pedido` (`id`),
  ADD CONSTRAINT `detalle_pedido_id_producto_id_a170aa3b_fk_producto_codigo` FOREIGN KEY (`id_producto_id`) REFERENCES `producto` (`codigo`);

--
-- Filtros para la tabla `detalle_seguimiento`
--
ALTER TABLE `detalle_seguimiento`
  ADD CONSTRAINT `detalle_seguimiento_id_estado_id_d0188f8a_fk_estado_se` FOREIGN KEY (`id_estado_id`) REFERENCES `estado_seguimiento` (`id`),
  ADD CONSTRAINT `detalle_seguimiento_id_pedido_id_3cf18a06_fk_pedido_id` FOREIGN KEY (`id_pedido_id`) REFERENCES `pedido` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `historial_compra`
--
ALTER TABLE `historial_compra`
  ADD CONSTRAINT `historial_compra_id_pedido_id_5f97191f_fk_pedido_id` FOREIGN KEY (`id_pedido_id`) REFERENCES `pedido` (`id`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_id_cliente_id_fcd9c6e9_fk_cliente_id` FOREIGN KEY (`id_cliente_id`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_id_tipo_id_0fe8ec8d_fk_tipo_producto_id_tipo` FOREIGN KEY (`id_tipo_id`) REFERENCES `tipo_producto` (`id_tipo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
