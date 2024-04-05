-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 05 2024 г., 16:38
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `zoo`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Basket`
--

CREATE TABLE `Basket` (
  `id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `pet_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Basket`
--

INSERT INTO `Basket` (`id`, `customer_id`, `pet_id`, `quantity`) VALUES
(1, 1, 1, 2),
(2, 1, 2, 1),
(3, 2, 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `Category`
--

CREATE TABLE `Category` (
  `id` int NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `description` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Category`
--

INSERT INTO `Category` (`id`, `name`, `description`) VALUES
(1, 'Собака', 'Бульдог'),
(2, 'Кошка', 'Сибирскя'),
(3, 'Птица', 'Жако');

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `category_pets_view`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `category_pets_view` (
`age` int
,`name` varchar(32)
,`nickname` varchar(32)
,`price` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `check_customer_view`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `check_customer_view` (
`date` date
,`first_name` varchar(32)
,`id` int
,`last_name` varchar(32)
,`payment_type` varchar(32)
);

-- --------------------------------------------------------

--
-- Структура таблицы `Cheque`
--

CREATE TABLE `Cheque` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL,
  `payment_type` varchar(32) DEFAULT NULL,
  `customer_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Cheque`
--

INSERT INTO `Cheque` (`id`, `date`, `payment_type`, `customer_id`) VALUES
(1, '2023-05-15', 'Кредитной картой', 1),
(2, '2023-05-16', 'Наличными', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `Customer`
--

CREATE TABLE `Customer` (
  `id` int NOT NULL,
  `first_name` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `passport` varchar(32) DEFAULT NULL,
  `login` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Customer`
--

INSERT INTO `Customer` (`id`, `first_name`, `last_name`, `email`, `phone`, `passport`, `login`, `password`) VALUES
(1, 'Шамиль', 'Алиев', 'johndoe@example.com', '555-1234', '123456789', 'johndoe', 'password123'),
(2, 'Генри', 'Кавилл', 'janesmith@example.com', '555-5678', '987654321', 'janesmith', 'password456');

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `max_pets`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `max_pets` (
`breed` varchar(32)
,`nickname` varchar(32)
,`pets` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `most_pets`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `most_pets` (
`most_pets` varchar(32)
);

-- --------------------------------------------------------

--
-- Структура таблицы `Pets`
--

CREATE TABLE `Pets` (
  `id` int NOT NULL,
  `nickname` varchar(32) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(32) DEFAULT NULL,
  `breed` varchar(32) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `img` blob,
  `description` varchar(32) DEFAULT NULL,
  `category_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Pets`
--

INSERT INTO `Pets` (`id`, `nickname`, `age`, `gender`, `breed`, `price`, `img`, `description`, `category_id`) VALUES
(1, 'Бодди', 3, 'Мужской', 'Сибирская', '500.00', NULL, 'Лучший друг ', 1),
(2, 'Флиффу', 2, 'Женский', 'Будьдог', '300.00', NULL, 'Заботливая', 2),
(3, 'Твитти', 1, 'Женский', 'Красный', '50.00', NULL, 'Любит говорит ИДИ ВОН', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `Sales`
--

CREATE TABLE `Sales` (
  `id` int NOT NULL,
  `check_id` int DEFAULT NULL,
  `basket_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Sales`
--

INSERT INTO `Sales` (`id`, `check_id`, `basket_id`, `quantity`) VALUES
(1, 1, 1, 2),
(2, 1, 2, 1),
(3, 2, 3, 3);

-- --------------------------------------------------------

--
-- Структура для представления `category_pets_view`
--
DROP TABLE IF EXISTS `category_pets_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `category_pets_view`  AS SELECT `category`.`name` AS `name`, `pets`.`nickname` AS `nickname`, `pets`.`price` AS `price`, `pets`.`age` AS `age` FROM (`category` join `pets` on((`category`.`id` = `pets`.`category_id`)))  ;

-- --------------------------------------------------------

--
-- Структура для представления `check_customer_view`
--
DROP TABLE IF EXISTS `check_customer_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `check_customer_view`  AS SELECT `cheque`.`id` AS `id`, `cheque`.`date` AS `date`, `cheque`.`payment_type` AS `payment_type`, `customer`.`first_name` AS `first_name`, `customer`.`last_name` AS `last_name` FROM (`cheque` join `customer` on((`cheque`.`customer_id` = `customer`.`id`)))  ;

-- --------------------------------------------------------

--
-- Структура для представления `max_pets`
--
DROP TABLE IF EXISTS `max_pets`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `max_pets`  AS SELECT `pets`.`nickname` AS `nickname`, `pets`.`breed` AS `breed`, max(`pets`.`price`) AS `pets` FROM `pets``pets`  ;

-- --------------------------------------------------------

--
-- Структура для представления `most_pets`
--
DROP TABLE IF EXISTS `most_pets`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `most_pets`  AS SELECT max(`category`.`name`) AS `most_pets` FROM `category``category`  ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Basket`
--
ALTER TABLE `Basket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `pet_id` (`pet_id`);

--
-- Индексы таблицы `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Cheque`
--
ALTER TABLE `Cheque`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Индексы таблицы `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Pets`
--
ALTER TABLE `Pets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `Sales`
--
ALTER TABLE `Sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `check_id` (`check_id`),
  ADD KEY `basket_id` (`basket_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Basket`
--
ALTER TABLE `Basket`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Category`
--
ALTER TABLE `Category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Cheque`
--
ALTER TABLE `Cheque`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `Customer`
--
ALTER TABLE `Customer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `Pets`
--
ALTER TABLE `Pets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Sales`
--
ALTER TABLE `Sales`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Basket`
--
ALTER TABLE `Basket`
  ADD CONSTRAINT `basket_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`id`),
  ADD CONSTRAINT `basket_ibfk_2` FOREIGN KEY (`pet_id`) REFERENCES `Pets` (`id`);

--
-- Ограничения внешнего ключа таблицы `Cheque`
--
ALTER TABLE `Cheque`
  ADD CONSTRAINT `cheque_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`id`);

--
-- Ограничения внешнего ключа таблицы `Pets`
--
ALTER TABLE `Pets`
  ADD CONSTRAINT `pets_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `Category` (`id`);

--
-- Ограничения внешнего ключа таблицы `Sales`
--
ALTER TABLE `Sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`check_id`) REFERENCES `Cheque` (`id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`basket_id`) REFERENCES `Basket` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
