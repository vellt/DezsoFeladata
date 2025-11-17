-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Nov 17. 22:21
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `telapo_korut`
--
CREATE DATABASE IF NOT EXISTS `telapo_korut` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `telapo_korut`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `korut`
--

DROP TABLE IF EXISTS `korut`;
CREATE TABLE `korut` (
  `id` int(11) NOT NULL,
  `orszag` varchar(50) NOT NULL,
  `varos` varchar(50) NOT NULL,
  `gyerek_nev` varchar(50) NOT NULL,
  `viselkedes` enum('Jó','Rossz','Változó') NOT NULL,
  `kivant_ajandek` varchar(100) NOT NULL,
  `kapott_ajandek` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `korut`
--

INSERT INTO `korut` (`id`, `orszag`, `varos`, `gyerek_nev`, `viselkedes`, `kivant_ajandek`, `kapott_ajandek`) VALUES
(1, 'Magyarország', 'Budapest', 'Duró Csongor', 'Jó', 'Lego City készlet', 'Lego City készlet'),
(2, 'Magyarország', 'Szeged', 'Kóka Máté', 'Rossz', 'játék konzol', 'szén'),
(3, 'Magyarország', 'Debrecen', 'Elek Márk', 'Változó', 'futball-labda', 'plüss unikornis'),
(4, 'Magyarország', 'Pécs', 'Fülöp Attila', 'Jó', 'távirányítós autó', 'unikornisos pizsama'),
(5, 'Németország', 'Berlin', 'Győri Patrik', 'Rossz', 'lego készlet', 'csillámos körömlakk készlet'),
(6, 'Németország', 'München', 'Májer Antal', 'Jó', 'futball-labda', 'futball-labda'),
(7, 'Finnország', 'Rovaniemi', 'Kiss Richárd', 'Jó', 'snowboard', 'rúd párizsi'),
(8, 'Finnország', 'Oulu', 'Molnár Ádám', 'Változó', 'gaming egér', 'barbie baba'),
(9, 'Spanyolország', 'Barcelona', 'Sajtos István', 'Jó', 'strandlabda', 'barbie baba'),
(10, 'Olaszország', 'Róma', 'Kocsis Róbert', 'Rossz', 'roller', 'szén'),
(11, 'Svédország', 'Stockholm', 'Szanyi Balázs', 'Jó', 'csillámos körömlakk készlet', 'csillámos körömlakk készlet'),
(12, 'Norvégia', 'Oslo', 'Timári Bianka', 'Változó', 'drón', 'elektromos fűnyíró'),
(13, 'Franciaország', 'Párizs', 'Veres István', 'Jó', 'képregény', 'képregény'),
(14, 'Egyesült Királyság', 'London', 'Horváth Miklós', 'Rossz', 'gaming szék', 'szén'),
(15, 'Szlovákia', 'Pozsony', 'Szabó Attila', 'Jó', 'társasjáték', 'társasjáték'),
(16, 'Ausztria', 'Bécs', 'Haba Vanessza', 'Változó', 'Netflix előfizetés', 'Lego City készlet');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `korut`
--
ALTER TABLE `korut`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
