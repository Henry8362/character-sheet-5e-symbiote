-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 17, 2023 at 11:24 PM
-- Server version: 5.7.24
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `symbiote_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `id` int(10) NOT NULL,
  `Name` varchar(255) NOT NULL COMMENT 'Name of character',
  `player_id` int(10) DEFAULT NULL COMMENT 'ID of player who owns character',
  `picture` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`id`, `Name`, `player_id`, `picture`) VALUES
INSERT INTO `characters` (`id`, `Name`, `player_id`, `picture`) VALUES
(2, 'Chef', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(10) NOT NULL COMMENT 'System ID for player',
  `talespire_id` varchar(255) NOT NULL COMMENT 'Player ID from Talespire',
  `name` varchar(255) NOT NULL COMMENT 'name of player'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `talespire_id`, `name`) VALUES
(1, '1', 'Henry');

-- --------------------------------------------------------

--
-- Table structure for table `sheets`
--

CREATE TABLE `sheets` (
  `id` int(11) NOT NULL,
  `character_id` int(10) NOT NULL,
  `class` varchar(50) NOT NULL,
  `level` int(11) NOT NULL,
  `race` varchar(50) NOT NULL,
  `alignment` varchar(20) DEFAULT NULL,
  `background` varchar(50) DEFAULT NULL,
  `experience` int(11) DEFAULT NULL,
  `prof_bonus` int(2) DEFAULT NULL,
  `personality_traits` text,
  `ideals` text,
  `bonds` text,
  `features` text,
  `current_hit_points` int(11) DEFAULT NULL,
  `armour_class` int(11) DEFAULT NULL,
  `hit_dice` int(3) DEFAULT NULL,
  `max_hit_points` int(3) DEFAULT NULL,
  `hit_dice_total` int(3) DEFAULT NULL,
  `speed` int(11) DEFAULT NULL,
  `initiative` int(3) DEFAULT NULL,
  `strength` int(11) DEFAULT NULL,
  `dexterity` int(11) DEFAULT NULL,
  `constitution` int(11) DEFAULT NULL,
  `intelligence` int(11) DEFAULT NULL,
  `wisdom` int(11) DEFAULT NULL,
  `charisma` int(11) DEFAULT NULL,
  `skills` json DEFAULT NULL,
  `equipment` json DEFAULT NULL,
  `spells` json DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sheets`
--

INSERT INTO `sheets` (`id`, `character_id`, `class`, `level`, `race`, `alignment`, `background`, `experience`, `prof_bonus`, `personality_traits`, `ideals`, `bonds`, `features`, `current_hit_points`, `armour_class`, `hit_dice`, `max_hit_points`, `hit_dice_total`, `speed`, `initiative`, `strength`, `dexterity`, `constitution`, `intelligence`, `wisdom`, `charisma`, `skills`, `equipment`, `spells`, `created_at`, `updated_at`) VALUES
(1, 1, 'Wizard', 2, 'Totally a Drow', 'Neutral Good', 'Goff', 0, 2, 'I see omens in every event and action. The gods try to speak to us, we just need to listen.', 'Faith. I trust that my deity will guide my actions. I have faith that if I work hard, things will go well. \r\n\r\nLay on Hands\r\nYour blessed touch can heal wounds. You have a pool of healing power that replenishes when you take a long rest. With that pool, you can restore a total number of hit points equal to your paladin level × 5.\r\n\r\nAs an action, you can touch a creature and draw power from the pool to restore a number of hit points to that creature, up to the maximum amount remaining in your pool.\r\n\r\nAlternatively, you can expend 5 hit points from your pool of healing to cure the target of one disease or neutralize one poison affecting it. You can cure multiple diseases and neutralize multiple poisons with a single use of Lay on Hands, expending hit points separately for each one.\r\n\r\nThis feature has no effect on undead and constructs.', 'A powerful person killed someone I love. Some day soon, I\'ll have my revenge.\n', 'Divine Sense\nThe presence of strong evil registers on your senses like a noxious odor, and powerful good rings like heavenly music in your ears. As an action, you can open your awareness to detect such forces. Until the end of your next turn, you know the location of any celestial, fiend, or undead within 60 feet of you that is not behind total cover. You know the type (celestial, fiend, or undead) of any being whose presence you sense, but not its identity (the vampire Count Strahd von Zarovich, for instance). Within the same radius, you also detect the presence of any place or object that has been consecrated or desecrated, as with the hallow spell.\n\nYou can use this feature a number of times equal to 1 + your Charisma modifier. When you finish a long rest, you regain all expended uses.', 28, 15, NULL, NULL, NULL, 30, NULL, 12, 12, 12, 12, 12, 12, '[{\"id\": 1, \"name\": \"Acrobatics\", \"is_proficient\": \"Y\"}, {\"id\": 2, \"name\": \"Animal Handling\", \"is_proficient\": \"Y\"}, {\"id\": 3, \"name\": \"Arcana\", \"is_proficient\": \"Y\"}]', NULL, NULL, '2023-08-17 12:36:55', '2023-08-17 23:04:00'),
(2, 2, 'Rogue', 3, 'Elf', 'Chaotic Neutral', 'Criminal', 1200, NULL, 'I idolize a particular hero of my faith and constantly refer to that person\'s deeds and example.', NULL, NULL, NULL, 20, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-17 12:36:55', '2023-08-17 22:31:31'),
(3, 3, 'Fighter', 4, 'Dwarf', 'Lawful Good', 'Soldier', 1800, NULL, NULL, NULL, NULL, NULL, 35, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-17 12:36:55', '2023-08-17 14:44:35');

-- --------------------------------------------------------

--
-- Table structure for table `sheet_data_types`
--

CREATE TABLE `sheet_data_types` (
  `id` int(10) NOT NULL,
  `sheets_field_name` varchar(255) NOT NULL,
  `field_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sheet_data_types`
--

INSERT INTO `sheet_data_types` (`id`, `sheets_field_name`, `field_type`) VALUES
(1, 'class', 'B'),
(2, 'level', 'B'),
(4, 'background', 'B'),
(5, 'alignment', 'B'),
(6, 'experience', 'B'),
(7, 'race', 'B'),
(8, 'strength', 'C'),
(9, 'dexterity', 'C'),
(10, 'constitution', 'C'),
(11, 'intelligence', 'C'),
(12, 'wisdom', 'C'),
(13, 'charisma', 'C'),
(14, 'personality_traits', 'F'),
(15, 'ideals', 'F'),
(16, 'bonds', 'F'),
(17, 'features', 'F'),
(18, 'prof_bonus', 'B'),
(19, 'armour_class', 'M'),
(20, 'speed', 'M'),
(21, 'initiative', 'M'),
(22, 'current_hit_points', 'M'),
(23, 'hit_dice', 'M'),
(24, 'max_hit_points', 'M'),
(25, 'hit_dice_total', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `associated_stat` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `name`, `description`, `associated_stat`) VALUES
(1, 'Acrobatics', 'Dexerity-based skill that involves balance and agility.', 'Dexterity'),
(2, 'Animal Handling', 'Wisdom-based skill that involves interacting with animals.', 'Wisdom'),
(3, 'Arcana', 'Intelligence-based skill that involves knowledge of magic and the arcane.', 'Intelligence'),
(4, 'Athletics', 'Strength-based skill that involves physical exertion and athleticism.', 'Strength'),
(5, 'Deception', 'Charisma-based skill that involves lying and trickery.', 'Charisma'),
(6, 'History', 'Intelligence-based skill that involves knowledge of historical events.', 'Intelligence'),
(7, 'Insight', 'Wisdom-based skill that involves reading people and situations.', 'Wisdom'),
(8, 'Intimidation', 'Charisma-based skill that involves asserting dominance and fear.', 'Charisma'),
(9, 'Investigation', 'Intelligence-based skill that involves searching for clues and information.', 'Intelligence'),
(10, 'Medicine', 'Wisdom-based skill that involves providing medical care and healing.', 'Wisdom'),
(11, 'Nature', 'Intelligence-based skill that involves knowledge of the natural world.', 'Intelligence'),
(12, 'Perception', 'Wisdom-based skill that involves noticing details and spotting hidden things.', 'Wisdom'),
(13, 'Performance', 'Charisma-based skill that involves entertaining and captivating an audience.', 'Charisma'),
(14, 'Persuasion', 'Charisma-based skill that involves convincing others and swaying opinions.', 'Charisma'),
(15, 'Religion', 'Intelligence-based skill that involves knowledge of religious practices and beliefs.', 'Intelligence'),
(16, 'Sleight of Hand', 'Dexterity-based skill that involves manual dexterity and trickery.', 'Dexterity'),
(17, 'Stealth', 'Dexterity-based skill that involves moving silently and staying hidden.', 'Dexterity'),
(18, 'Survival', 'Wisdom-based skill that involves tracking and surviving in the wild.', 'Wisdom');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `player_id` (`talespire_id`);

--
-- Indexes for table `sheets`
--
ALTER TABLE `sheets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sheet_data_types`
--
ALTER TABLE `sheet_data_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'System ID for player', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sheets`
--
ALTER TABLE `sheets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sheet_data_types`
--
ALTER TABLE `sheet_data_types`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;