-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2023 a las 01:44:27
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_virtual`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `imagen` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `imagen`) VALUES
(1, 'Samsung', 'https://cdn.cyberpuerta.mx/storage/brands/samsung.png'),
(2, 'HP', 'https://cdn.cyberpuerta.mx/storage/brands/e6fc8ce107f2bdf0955f021a391514ce_hp.png'),
(3, 'Intel', 'https://cdn.cyberpuerta.mx/storage/brands/intellogo.png'),
(4, 'AMD', 'https://cdn.cyberpuerta.mx/storage/brands/48af4341f745163f945fa838eeabb062_amdlogo.png'),
(5, 'Kingston', 'https://cdn.cyberpuerta.mx/storage/brands/KingstonLogo_KTC_Logo_hi_res_18_05_201711_37.jpg'),
(6, 'Logitech', 'https://cdn.cyberpuerta.mx/storage/brands/43ee0a7ff98dae4ebf41c6bec8a4ae0e_logitech.png'),
(7, 'Hyperx', 'https://cdn.cyberpuerta.mx/storage/brands/56cc7ce04fbbd_HYPERX.png'),
(8, 'Asus', 'https://cdn.cyberpuerta.mx/storage/brands/asuslogoa5705fdb70seeklogo.com.png'),
(9, 'Adata', 'https://cdn.cyberpuerta.mx/storage/brands/f976fb2ecf4847ecb507697a8d02ed3d_ADATA.png'),
(10, 'XPG', 'https://cdn.cyberpuerta.mx/storage/brands/Red_XPG_LOGO.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `perfil` varchar(100) NOT NULL DEFAULT 'default.png',
  `token` varchar(100) DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `correo`, `clave`, `perfil`, `token`, `verify`) VALUES
(1, 'Rene Alejandro Villanueva Moreno', '999999999.ravm@gmail.com', '$2y$10$ohod1GqEIXzHEdcmErRxy.slpeqf2azEH9RMlO3sw1ewGDgH27.1W', 'default.png', NULL, 1),
(2, 'Victor Manuel Treviño Villa', 'victortrevinovilla@gmail.com', '$2y$10$64Bsy5CX8zkv8OpzgMYHqOp3Q4TQ0/UO3v9NsV9pT5kGNv/0IOkXC', 'default.png', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id` int(11) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`id`, `producto`, `precio`, `cantidad`, `id_pedido`) VALUES
(1, 'God of War: Ragnarök', 1200.00, 1, 1),
(2, 'Final Fantasy XVI', 1200.00, 1, 1),
(3, 'God of War: Ragnarök', 1200.00, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `id_transaccion` varchar(80) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `fecha` datetime NOT NULL,
  `email` varchar(80) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `email_user` varchar(80) NOT NULL,
  `proceso` enum('1','2','3','') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `id_transaccion`, `monto`, `estado`, `fecha`, `email`, `nombre`, `apellido`, `direccion`, `ciudad`, `email_user`, `proceso`) VALUES
(1, '1H096381CD033423M', 2400.00, 'COMPLETED', '2023-11-11 04:23:17', 'sb-urgnk28110696@personal.example.com', 'John', 'Doe', 'Calle Juarez 1', 'Miguel Hidalgo', '999999999.ravm@gmail.com', '1'),
(2, '8C657583LP7096403', 1200.00, 'COMPLETED', '2023-11-11 04:24:46', 'sb-urgnk28110696@personal.example.com', 'John', 'Doe', 'Calle Juarez 1', 'Miguel Hidalgo', '999999999.ravm@gmail.com', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `imagen`, `id_categoria`) VALUES
(3, 'Monitor Curvo Samsung LS27C360EALXZX LED 27\", Full HD, FreeSync, 75Hz, HDMI, Negro', 'El monitor curvo Samsung LS27C360EALXZX LED de 27 pulgadas, en color negro, ofrece una máxima velocidad de actualización de 75 Hz y cuenta con una pantalla curva que brinda mayor inmersión visual. Su display brightness (typical) es de 250 cd / m² y su peso sin base es de 3.7 kg.', 2869.00, 60, 'https://www.cyberpuerta.mx/img/product/M/CP-SAMSUNG-LS27C360EALXZX-2d59c1.jpg', 1),
(4, 'SSD Samsung 990 Pro NVMe, 2TB, PCI Express 4.0, M.2', ' SSD Samsung 990 Pro NVMe ofrece altas velocidades de lectura y escritura, gran capacidad de almacenamiento y características avanzadas como soporte DevSlp y algoritmos AES-256 bit para mayor seguridad. Es una opción ideal para aquellos que buscan mejorar el rendimiento y la confiabilidad de su PC.', 2939.00, 100, 'https://www.cyberpuerta.mx/img/product/M/CP-SAMSUNG-MZ-V9P2T0BAM-5db55a.jpg', 1),
(5, 'Monitor Samsung S33A LED 22\", Full HD, HDMI, Negro', 'El monitor Samsung S33A LED 22\" ofrece una resolución Full HD de 1920 x 1080 píxeles y un tamaño diagonal de pantalla de 55.9 cm (22\"). Con una razón de contraste típica de 3000:1, este dispositivo proporciona imágenes nítidas y detalladas con colores vibrantes gracias a su tecnología LED.', 1519.00, 200, 'https://www.cyberpuerta.mx/img/product/M/CP-SAMSUNG-LS22A336NHLXZX-886837.jpg', 1),
(6, 'Monitor HP P22v G5 21.4\", Full HD, HDMI, Negro', 'Amplía tu visión y tu productividad con este monitor FHD de 21,45 pulgadas en diagonal cuando trabajes desde tu casa u oficina. Este elegante monitor que permite ahorrar espacio facilita y completa el trabajo híbrido gracias a su pantalla de diseño simple con imágenes nítidas y perfectas. De esta manera, podrás hacer más todos los días.', 1899.00, 100, 'https://www.cyberpuerta.mx/img/product/M/CP-HP-64V81AA-aeb652.jpg', 2),
(7, 'Tóner HP 215A Negro Original, 1050 Páginas', 'Imprima todos sus documentos empresariales de forma rápida y eficiente, e iguale el rendimiento de su impresora HP LaserJet Pro a color con los cartuchos de tóner original HP con JetIntelligence. Confíe en la calidad y fiabilidad de HP para obtener unos resultados de impresión espectaculares.', 1019.00, 200, 'https://www.cyberpuerta.mx/img/product/M/CP-HP-W2310A-1.jpg', 2),
(8, 'Computadora HP Pro 400 G9 SFF, Intel Core i7-12700 2.10GHz, 8GB, 512GB SSD, Windows 11 Pro 64-bit', 'La computadora HP Pro 400 G9 SFF i7-12700 8GB, 7J3W5LA-512GB es una potente y eficiente máquina diseñada para satisfacer las necesidades de productividad en entornos empresariales. Con su procesador Intel® Core™ i7 de 12ma Generación y 12 núcleos, ofrece un rendimiento excepcional y una velocidad de procesamiento turbo de hasta 4.9 GHz.', 25309.00, 100, 'https://www.cyberpuerta.mx/img/product/M/CP-HP-7J3W5LA-512GB-985eee.jpg', 2),
(9, 'Procesador Intel Core i5-12400F Sin Gráficos, S-1700, 2.50GHz, Six-Core, 18MB Smart Cache (12va. Generación - Alder Lake)', 'El procesador Intel Core i5-12400F S-1700 es un dispositivo de alto rendimiento diseñado para satisfacer las necesidades del mercado de escritorio. Este modelo cuenta con una frecuencia base de 2.5 GHz y puede alcanzar una velocidad turbo máxima de hasta 4.4 GHz, lo que permite ejecutar aplicaciones exigentes sin problemas.', 2719.00, 20, 'https://www.cyberpuerta.mx/img/product/M/CP-INTEL-BX8071512400F-f001ce.jpg', 3),
(10, 'Tarjeta de Video Intel ARC A750, 8GB 256-bit GDDR6, PCI Express x16 4.0', 'La tarjeta de video Intel ARC A750 es una opción potente y eficiente para aquellos que buscan mejorar su experiencia gráfica. Con 8GB de memoria GDDR6, esta tarjeta ofrece un ancho de banda máximo de memoria de 512 GB/s, lo que permite un rendimiento rápido y fluido en aplicaciones exigentes.', 4839.00, 15, 'https://www.cyberpuerta.mx/img/product/M/CP-INTEL-21P02J00BA-1.jpg', 3),
(11, 'Procesador Intel Core i3-10100, S-1200, 3,60GHz, Quad-Core, 6MB Smart Caché (10ma. Generación - Comet Lake)', 'El procesador Intel Core i3-10100 S-1200 3,60GHz Comet Lake BX8070110100 es una solución de escritorio que pertenece a la familia de procesadores Intel® Core™ i3 de décima generación. Este procesador cuenta con cuatro núcleos y ocho hilos gracias a su tecnología Hyper-Threading de Intel, lo que permite un rendimiento eficiente en tareas multitarea.', 1959.00, 40, 'https://www.cyberpuerta.mx/img/product/M/CP-INTEL-BX8070110100-1.JPG', 3),
(12, 'Procesador AMD Ryzen 5 7600X, S-AM5, 4.70GHz, Six-Core, 32MB L3 Cache - no Incluye Disipador', 'El procesador AMD Ryzen 5 7600X S-AM5 es un componente de alta gama diseñado para ofrecer un rendimiento excepcional en aplicaciones exigentes. Con una velocidad base de reloj de 4,7 GHz y una frecuencia turbo máxima de hasta 5,3 GHz, este procesador cuenta con seis núcleos y doce hilos que permiten ejecutar múltiples tareas simultáneamente sin comprometer el desempeño.', 3969.00, 100, 'https://www.cyberpuerta.mx/img/product/M/CP-AMD-100-100000593WOF-d1a80a.jpg', 4),
(13, 'Procesador AMD Ryzen 7 5700G, S-AM4, 3.80GHz, 8-Core, 16MB L3 Caché - incluye Disipador Wraith Stealth', 'El procesador para ordenadores de sobremesa AMD Ryzen™ 7 5700G te lleva al campo de batalla en un abrir y cerrar de ojos con los gráficos más rápidos del mundo en un procesador para ordenadores de sobremesa1. Juega los mejores juegos en unos 1080p fluidos con 8 núcleos, 16 hilos, relojes de boost de hasta 4,6 GHz2,20 MB de caché total y 8 unidades de computación gráfica de hasta 2,0 GHz3.', 2939.00, 100, 'https://www.cyberpuerta.mx/img/product/M/CP-AMD-100-100000263BOX-1.jpg', 4),
(14, 'Procesador AMD Ryzen 9 5900X, S-AM4, 3.70GHz, 64MB L3 Cache - no incluye Disipador', 'El más veloz del juego Obtén ventaja competitiva con 12 núcleos, 24 subprocesos, aceleración de reloj de hasta 4,8 GHz2 y 70 MB de caché. AMD Ryzen™ 5900X es el procesador más potente para jugadores, creadores y para todos en general.', 5579.00, 30, 'https://www.cyberpuerta.mx/img/product/M/CP-AMD-100-100000061WOF-1.jpg', 4),
(17, 'Memoria RAM Kingston FURY Beast RGB DDR4, 2666MHz, 16GB, Non-ECC, CL16, XMP', 'Bríndale a tu estación de gaming una actualización con estilo, de la mano del disipador de calor actualizado Beast DDR4 RGB y de los asombrosos efectos RGB, suaves y personalizables. Usa el poderoso software Kingston FURY CTRL o el software del fabricante de la placa madre para crear tu propio look.', 519.00, 100, 'https://www.cyberpuerta.mx/img/product/M/CP-KINGSTON-KF426C16BB1A16-1.jpg', 5),
(18, 'SSD Kingston NV2 NVMe, 1TB, PCI Express 4.0, M.2', 'El SSD Kingston NV2 tiene un rendimiento PClE NVMe Gen 4x4 con velocidades de hasta 3.500mb/seg', 849.00, 100, 'https://www.cyberpuerta.mx/img/product/M/CP-KINGSTON-SNV2S1000G-1.jpg', 5),
(19, 'Memoria RAM Kingston FURY Renegade RGB DDR4, 3600MHz, 16GB, CL16, XMP', 'Obtén una memoria Ready for AMD Ryzen y que se integrará sin problemas con tu sistema basado en AMD. Un aumento de rendimiento confiable y compatible para tu equipo.', 909.00, 100, 'https://www.cyberpuerta.mx/img/product/M/CP-KINGSTON-KF436C16RB1A16-1.jpg', 5),
(21, 'Mouse Gamer Logitech Óptico G305, Inalámbrico, USB, 12.000DPI, Lila', 'G305 es un mouse inalámbrico para juegos LIGHTSPEED diseñado para un desempeño excelente con las innovaciones tecnológicas más recientes a un precio asequible.', 899.00, 35, 'https://www.cyberpuerta.mx/img/product/XL/CP-LOGITECH-910-006021-2.jpg', 6),
(22, 'Logitech Webcam C505 HD, 720p, 1280 x 720 Pixeles, USB, Negro', 'Logitech C505 ofrece una calidad de vídeo nítida con una resolución panorámica HD 720p / 30 fps, un campo de visión diagonal de 60 grados, un enfoque fijo y corrección automática de la luz. La webcam tiene un micrófono omnidireccional con tecnología de reducción de ruido y ofrece conversaciones claras a una distancia de hasta 3m, incluso en entornos muy concurridos', 182.00, 200, 'https://www.cyberpuerta.mx/img/product/M/CP-LOGITECH-960-001367-e7ebdb.jpg', 6),
(23, 'Teclado Gamer Logitech G213 Prodigy LED RGB, Alámbrico, Negro, (Inglés)', 'En gaming, no da lo mismo un teclado que otro. El G213 te ayuda a jugar con más rapidez que al usar un teclado estándar, con teclas que combinan en rendimiento,iluminación y comodidad de de juego.', 919.00, 200, 'https://www.cyberpuerta.mx/img/product/M/CP-LOGITECH-920-008084-1.jpg', 6),
(25, 'HyperX Micrófono QuadCast, Alámbrico, Negro/Rojo', 'El HyperX Micrófono QuadCast es un dispositivo alámbrico de color negro y rojo, con una potencia estimada RMS de 0.007 W y un peso total de 254 g. Su frecuencia de muestreo alcanza los 48 kHz, mientras que su THD o distorsión armónica total se sitúa en el 0.05%. Dispone además de puerto USB para facilitar la conexión a otros dispositivos.', 2879.00, 200, 'https://www.cyberpuerta.mx/img/product/M/CP-HYPERX-4P5P6AA-bafceb.jpg', 7),
(26, 'Teclado Gamer HyperX Alloy Origins Core RGB, Teclado Mecánico, HyperX Aqua Switch, Alámbrico, Negro (Inglés)', 'El teclado gamer HyperX Alloy Origins Core RGB Mecánico es compatible con el sistema operativo Windows, incluyendo versiones como Windows 10 y Windows 7. El color del producto es negro y cuenta con una altura de teclado ajustable para mayor comodidad durante su uso. El idioma del teclado es inglés de EE.UU.', 2319.00, 100, 'https://www.cyberpuerta.mx/img/product/M/CP-HYPERX-4P5P1AAABA-1.jpg', 7),
(27, 'Mouse Gamer Ergonómico HyperX Óptico Pulsefire Haste, Alámbrico, USB A, 16000DPI, Negro', 'El Mouse Gamer HyperX Óptico Pulsefire Haste es un dispositivo de alta calidad diseñado para satisfacer las necesidades de los jugadores más exigentes. Con una cantidad de botones igual a 6, este mouse ofrece una profundidad de 124.2 mm y una altura de 38.2 mm que lo hacen cómodo y fácil de usar.', 1049.00, 20, 'https://www.cyberpuerta.mx/img/product/M/CP-HYPERX-4P5P9AA-1.jpg', 7),
(29, 'Tarjeta de Video ASUS NVIDIA Dual GeForce RTX 4070, 12GB 192 bit GDDR6X, PCI Express 4.0', 'La tarjeta de video ASUS NVIDIA Dual GeForce RTX 4070 12GB,90YV0IZ3-M0NA0 es un componente informático que cuenta con una anchura de 269 mm y se presenta en un paquete cuyo ancho alcanza los 405 mm. Esta tarjeta posee dos ranuras, lo cual permite su fácil instalación en la mayoría de las placas base del mercado.', 12000.00, 5, 'https://www.cyberpuerta.mx/img/product/M/CP-ASUS-90YV0IZ3-M0NA00-773c3b.jpg', 8),
(30, 'Tarjeta Madre ASUS ATX PRIME X670-P, S-AM5, AMD X670, HDMI, 128GB DDR5 para AMD', 'La tarjeta madre ASUS ATX PRIME X670-P es compatible con procesadores AMD y admite hasta 128GB de memoria DDR5. Cuenta con seis conectores SATA III, tres conectores a ventilador de chasis y un conector eléctrico de 12V. Además, tiene una versión HDMI 2.1 y una versión DisplayPort 1.4 para ofrecer la mejor calidad en imagen.', 5000.00, 60, 'https://www.cyberpuerta.mx/img/product/M/CP-ASUS-90MB1BU0-M0EAY0-8db49a.jpg', 8),
(31, 'ASUS Rog Ally, 512GB, Wi-Fi, Bluetooth, Blanco', 'El Asus Rog Ally es un dispositivo de alta gama con características destacadas. Cuenta con una memoria interna LPDDR5 y cumple con los estándares Wi-Fi 6E (802.11ax). Su procesador tiene 8 núcleos y ofrece un rendimiento potente. Tiene un puerto USB Tipo C, así como también salida de auriculares/micrófono.', 50000.00, 5, 'https://www.cyberpuerta.mx/img/product/M/CP-ASUS-90NV0GY1-M00040-8a92ce.jpg', 8),
(33, 'Memoria Flash Adata Premier Pro, 512GB MicroSDXC UHS-I Clase 10, con Adaptador', 'Las tarjetas de memoria Premier Pro microSDXC/SDHC UHS-I soportan código automático de corrección de errores (ECC). Pasan rigurosas pruebas de resistencia al agua, a impactos, a rayos X, antiestática y temperaturas extremas para una mayor durabilidad y protección fiable.', 589.00, 100, 'https://www.cyberpuerta.mx/img/product/M/CP-ADATA-AUSDX512GUI3V30SA2-RA1-3.jpg', 9),
(34, 'SSD Adata Ultimate SU800, 512GB, SATA III, 2.5\'\', 7mm', 'EL SSD SU800 hace honor a su nombre de Ultimate con Flash NAND 3D que proporciona una mayor densidad de almacenamiento, eficiencia y fiabilidad que la NAND 2D tradicional. Incluye caché SLC inteligente y un búfer con caché DRAM para aumentar aún más el rendimiento de lectura/escritura. ', 619.00, 80, 'https://www.cyberpuerta.mx/img/product/M/CP-ADATA-ASU800SS-512GT-C-1.jpg', 9),
(35, 'Disco Duro Externo Adata HD330 2.5\'\', 4TB, USB 3.1, Negro, A Prueba de Golpes - para Mac/PC', 'La unidad de disco duro externa HD330 de ADATA, con una capacidad de hasta 5 TB, mantiene sus datos seguros con una carcasa de silicona en el exterior, y los sensores de impacto patentados de ADATA y el software Backup ToGo con cifrado AES de 256 bits en el interior.', 1579.00, 30, 'https://www.cyberpuerta.mx/img/product/M/CP-ADATA-AHD330-4TU31-CBK-1.jpg', 9),
(37, 'Kit Memoria Ram XPG Spectrix D50 DDR4, 3200MHz, 32GB (2 x 16GB)', 'Alcanzando velocidades de hasta 4133 MHz y con una capacidad máxima de 32 GB, el módulo XPG SPECTRIX D50 es un monstruo de módulo de memoria. También tiene aspecto impactante con un elegante estilo geométrico y una impresionante barra de luz RGB triangular.', 1449.00, 30, 'https://www.cyberpuerta.mx/img/product/M/CP-XPG-AX4U320016G16A-DW50-1.jpg', 10),
(38, 'Fuente de Poder XPG Cybercore 80 PLUS Platinum, 24-pin ATX, 120mm, 1300W', 'La serie XPG CYBERCORE PLATINUM ejemplifica la ambición de XPG y su dedicación a la comunidad entusiasta mediante la expansión de la línea de unidades de fuentes de alimentación (PSU, por sus siglas en inglés) de excelente calidad con un nuevo nivel de productos PLATINUM.', 2789.00, 200, 'https://www.cyberpuerta.mx/img/product/M/CP-XPG-CYBERCORE1300P-BKCUS-50222e.jpg', 10),
(39, 'Gabinete XPG Valor Mesh con Ventana, Midi-Tower, ATX/Mini-ITX/Micro-ATX, USB 3.2, sin Fuente, 4 Ventiladores Instalados, Negro', 'El Gabinete XPG Valor Mesh Midi-Tower s/Fuente es un producto de tipo PC que ofrece un diseño elegante y funcional en color negro. Con un ancho de 210 mm y una profundidad de 371 mm, este gabinete tiene un factor de forma de Midi Tower, lo que lo hace adecuado para diferentes tipos de tarjetas madre, como ATX, Micro ATX y Mini-ITX.', 919.00, 50, 'https://www.cyberpuerta.mx/img/product/M/CP-XPG-VALORMESHMT-BKCWW-e69cfb.jpg', 10);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
