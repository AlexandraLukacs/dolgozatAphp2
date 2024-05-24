
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;


--
-- Adatbázis: `sport`
--
CREATE DATABASE IF NOT EXISTS `sport` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `sport`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `csapat`
--

DROP TABLE IF EXISTS `csapat`;
CREATE TABLE `csapat` (
  `csapatAzon` int(11) NOT NULL,
  `nev` varchar(20) COLLATE utf8_hungarian_ci NOT NULL,
  `orszagAzon` int(11) NOT NULL,
  `kep` varchar(20) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `csapat`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orszag`
--

DROP TABLE IF EXISTS `orszag`;
CREATE TABLE `orszag` (
  `orszagAzon` int(11) NOT NULL,
  `nev` varchar(20) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `orszag`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tagAzon` int(11) NOT NULL,
  `csapatAzon` int(11) NOT NULL,
  `nev` varchar(20) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tag`
--



--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `csapat`
--
ALTER TABLE `csapat`
  ADD PRIMARY KEY (`csapatAzon`),
  ADD KEY `orszagAzon` (`orszagAzon`);

--
-- A tábla indexei `orszag`
--
ALTER TABLE `orszag`
  ADD PRIMARY KEY (`orszagAzon`);

--
-- A tábla indexei `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tagAzon`),
  ADD KEY `csapatAzon` (`csapatAzon`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `csapat`
--
ALTER TABLE `csapat`
  MODIFY `csapatAzon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `orszag`
--
ALTER TABLE `orszag`
  MODIFY `orszagAzon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `tag`
--
ALTER TABLE `tag`
  MODIFY `tagAzon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `csapat`
--
ALTER TABLE `csapat`
  ADD CONSTRAINT `csapat_ibfk_2` FOREIGN KEY (`orszagAzon`) REFERENCES `orszag` (`orszagAzon`);

--
-- Megkötések a táblához `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`csapatAzon`) REFERENCES `csapat` (`csapatAzon`);
COMMIT;