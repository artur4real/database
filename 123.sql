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
-- База данных: `123`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Хирургия');

-- --------------------------------------------------------

--
-- Структура таблицы `doctor`
--

CREATE TABLE `doctor` (
  `id` int NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `middle_name` varchar(32) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `passport` varchar(20) DEFAULT NULL,
  `education` varchar(64) DEFAULT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  `position_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `doctor`
--

INSERT INTO `doctor` (`id`, `first_name`, `last_name`, `middle_name`, `phone`, `email`, `passport`, `education`, `username`, `password`, `position_id`, `category_id`) VALUES
(1, 'Оганджанян', 'Самвел', 'Суренович', '88005553535', 'samo@mail.com', '8888888888', 'Высшее образование', 'samik', '12345', 1, 1),
(2, 'Артур', 'Эдгарович', 'Есаян', '77777777777', 'esayan@gmail.com', '9999999999', 'Черный пояс', 'boss', '777', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `office`
--

CREATE TABLE `office` (
  `id` int NOT NULL,
  `number` int NOT NULL,
  `category` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `office`
--

INSERT INTO `office` (`id`, `number`, `category`) VALUES
(1, 777, 'Хирургический кабинет');

-- --------------------------------------------------------

--
-- Структура таблицы `patient`
--

CREATE TABLE `patient` (
  `id` int NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `middle_name` varchar(32) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `policy_number` varchar(15) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `patient`
--

INSERT INTO `patient` (`id`, `last_name`, `first_name`, `middle_name`, `phone`, `policy_number`, `birth_date`, `address`, `username`, `password`) VALUES
(1, 'Пашаев', 'Шачир', 'Зазорович', '88005553535', '188-963-123-00', '1999-07-07', 'ул. Канделаки, 22', 'shachir', 'password1'),
(2, 'Джульпаев', 'Равшан', 'Нематович', '89037097171', '450-081-232-34', '1991-03-20', 'Проспект Вернадского, 7', 'ravan', 'password2');

-- --------------------------------------------------------

--
-- Структура таблицы `position`
--

CREATE TABLE `position` (
  `id` int NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `position`
--

INSERT INTO `position` (`id`, `name`) VALUES
(1, 'Хирург');

-- --------------------------------------------------------

--
-- Структура таблицы `record`
--

CREATE TABLE `record` (
  `id` int NOT NULL,
  `schedule_id` int DEFAULT NULL,
  `patient_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `record`
--

INSERT INTO `record` (`id`, `schedule_id`, `patient_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `rec_serv`
--

CREATE TABLE `rec_serv` (
  `id` int NOT NULL,
  `record_id` int NOT NULL,
  `service_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `rec_serv`
--

INSERT INTO `rec_serv` (`id`, `record_id`, `service_id`) VALUES
(4, 1, 1),
(5, 2, 2),
(6, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `schedule`
--

CREATE TABLE `schedule` (
  `id` int NOT NULL,
  `doctor_id` int DEFAULT NULL,
  `office_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `schedule`
--

INSERT INTO `schedule` (`id`, `doctor_id`, `office_id`, `date`, `start_time`, `end_time`) VALUES
(1, 1, 1, '2023-10-11', '12:00:00', '15:00:00'),
(2, 1, 1, '2023-10-12', '14:00:00', '15:00:00'),
(3, 1, 1, '2023-10-12', '15:00:00', '16:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `subcategory_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `name`, `price`, `subcategory_id`) VALUES
(1, 'Пломба', '100.00', 1),
(2, 'Чистка', '150.00', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `category_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `subcategory`
--

INSERT INTO `subcategory` (`id`, `name`, `category_id`) VALUES
(1, 'Подкатегория 1', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `position_id` (`position_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `record`
--
ALTER TABLE `record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Индексы таблицы `rec_serv`
--
ALTER TABLE `rec_serv`
  ADD PRIMARY KEY (`id`),
  ADD KEY `record_id` (`record_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Индексы таблицы `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `office_id` (`office_id`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategory_id` (`subcategory_id`);

--
-- Индексы таблицы `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `office`
--
ALTER TABLE `office`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `patient`
--
ALTER TABLE `patient`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `position`
--
ALTER TABLE `position`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `record`
--
ALTER TABLE `record`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `rec_serv`
--
ALTER TABLE `rec_serv`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`),
  ADD CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Ограничения внешнего ключа таблицы `record`
--
ALTER TABLE `record`
  ADD CONSTRAINT `record_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`),
  ADD CONSTRAINT `record_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`);

--
-- Ограничения внешнего ключа таблицы `rec_serv`
--
ALTER TABLE `rec_serv`
  ADD CONSTRAINT `rec_serv_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `record` (`id`),
  ADD CONSTRAINT `rec_serv_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Ограничения внешнего ключа таблицы `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  ADD CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`office_id`) REFERENCES `office` (`id`);

--
-- Ограничения внешнего ключа таблицы `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`id`);

--
-- Ограничения внешнего ключа таблицы `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
