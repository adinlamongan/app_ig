-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for laravel
DROP DATABASE IF EXISTS `laravel`;
CREATE DATABASE IF NOT EXISTS `laravel` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `laravel`;

-- Dumping structure for table laravel.comments
DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_post_id_foreign` (`post_id`),
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel.comments: ~14 rows (approximately)
REPLACE INTO `comments` (`id`, `body`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
	(1, 'hghjgkjgh', 1, 1, '2022-11-08 00:24:23', '2022-11-08 00:24:23'),
	(2, 'fdsfd', 3, 1, '2022-11-08 08:26:51', '2022-11-08 08:26:51'),
	(3, 'fafad', 3, 1, '2022-11-08 08:26:53', '2022-11-08 08:26:53'),
	(6, 'dfasf', 3, 2, '2022-11-08 17:06:10', '2022-11-08 17:06:10'),
	(7, 'dsafasghhh', 3, 2, '2022-11-08 17:06:17', '2022-11-08 17:06:17'),
	(8, 'aaadaf', 3, 2, '2022-11-08 19:03:30', '2022-11-08 19:03:30'),
	(9, 'zzzzzzzzzz', 3, 2, '2022-11-08 19:03:35', '2022-11-08 19:03:35'),
	(10, 'adfasd', 3, 2, '2022-11-08 19:03:41', '2022-11-08 19:03:41'),
	(11, 'Bingung....', 9, 5, '2022-11-08 21:41:48', '2022-11-08 21:41:48'),
	(12, 'Hmm.....', 9, 4, '2022-11-08 21:42:03', '2022-11-08 21:42:03'),
	(13, 'komen juga', 9, 5, '2022-11-08 22:43:12', '2022-11-08 22:43:12'),
	(14, 'komen', 12, 5, '2022-11-08 22:45:57', '2022-11-08 22:45:57'),
	(15, 'komen....', 9, 6, '2022-11-08 22:50:40', '2022-11-08 22:50:40'),
	(16, 'komen disini', 13, 7, '2022-11-08 22:54:00', '2022-11-08 22:54:00');

-- Dumping structure for table laravel.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table laravel.likes
DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `State` tinyint(1) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_user_id_foreign` (`user_id`),
  KEY `likes_post_id_foreign` (`post_id`),
  CONSTRAINT `likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel.likes: ~12 rows (approximately)
REPLACE INTO `likes` (`id`, `State`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 3, 1, '2022-11-08 08:24:15', '2022-11-08 19:03:49'),
	(2, 1, 3, 2, '2022-11-08 13:56:30', '2022-11-08 19:03:25'),
	(4, 1, 11, 5, '2022-11-08 22:39:22', '2022-11-08 22:40:05'),
	(5, 0, 11, 4, '2022-11-08 22:39:53', '2022-11-08 22:39:59'),
	(6, 1, 9, 5, '2022-11-08 22:42:58', '2022-11-08 22:42:58'),
	(7, 1, 9, 4, '2022-11-08 22:43:03', '2022-11-08 22:43:03'),
	(8, 1, 12, 6, '2022-11-08 22:45:48', '2022-11-08 22:45:48'),
	(9, 1, 9, 6, '2022-11-08 22:50:33', '2022-11-08 22:50:33'),
	(10, 1, 13, 7, '2022-11-08 22:54:03', '2022-11-08 22:54:03'),
	(11, 1, 13, 6, '2022-11-08 22:54:07', '2022-11-08 22:54:07'),
	(12, 0, 13, 5, '2022-11-08 22:54:10', '2022-11-08 22:54:16'),
	(13, 0, 13, 4, '2022-11-08 22:54:13', '2022-11-08 22:54:14');

-- Dumping structure for table laravel.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel.migrations: ~9 rows (approximately)
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2020_03_10_093150_create_profiles_table', 1),
	(5, '2020_03_10_112448_create_posts_table', 1),
	(6, '2020_03_13_180815_creates_profile_user_pivot_table', 1),
	(7, '2020_06_25_194640_create_comments_table', 1),
	(8, '2020_08_12_154712_create_likes_table', 1),
	(9, '2020_08_20_164030_create_stories_table', 1);

-- Dumping structure for table laravel.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel.password_resets: ~0 rows (approximately)

-- Dumping structure for table laravel.posts
DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `caption` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `likes` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel.posts: ~6 rows (approximately)
REPLACE INTO `posts` (`id`, `user_id`, `caption`, `image`, `likes`, `created_at`, `updated_at`) VALUES
	(1, 1, 'jhjh', 'uploads/MYNkg1NqpyWUWnJmuLT7hRL0TXcxtMISU3nnkiMb.jpg', 0, '2022-11-08 00:24:13', '2022-11-08 00:24:13'),
	(2, 3, 'dasfadsf', 'uploads/AEjmrdalKNUAsx6WCeHBJLyx8hyzuRWGA0mRW00o.png', 0, '2022-11-08 11:51:09', '2022-11-08 11:51:09'),
	(4, 9, 'Kopi dulu....', 'uploads/KNtYMzymHwPgfSAhhHcMys5BY5WmaTl8Ku85d8ke.jpg', 0, '2022-11-08 21:37:04', '2022-11-08 21:37:04'),
	(5, 9, 'Hmm....', 'uploads/7aTUrLtaiugPztQYR0bnjeg0HAgOYuT5NLh6Oe4e.png', 0, '2022-11-08 21:37:43', '2022-11-08 21:37:43'),
	(6, 9, 'post ig', 'uploads/PNFH4GR78GSKro8B4l7nQwsPElDWQk03VzYVofSH.jpg', 0, '2022-11-08 22:43:58', '2022-11-08 22:43:58'),
	(7, 9, 'posting', 'uploads/9uzgWJT7CQ3AvIv2fC68Ovilm1FXqlZh04JeXGOq.png', 0, '2022-11-08 22:51:07', '2022-11-08 22:51:07');

-- Dumping structure for table laravel.profiles
DROP TABLE IF EXISTS `profiles`;
CREATE TABLE IF NOT EXISTS `profiles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profiles_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel.profiles: ~11 rows (approximately)
REPLACE INTO `profiles` (`id`, `user_id`, `bio`, `website`, `image`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, NULL, NULL, '2022-11-08 00:22:30', '2022-11-08 00:22:30'),
	(3, 3, 'fafsdf', 'https://getbootstrap.com/docs/5.0/components/buttons/', NULL, '2022-11-08 04:17:19', '2022-11-08 13:16:58'),
	(4, 5, NULL, NULL, NULL, '2022-11-08 04:23:25', '2022-11-08 04:23:25'),
	(5, 6, NULL, NULL, NULL, '2022-11-08 21:15:19', '2022-11-08 21:15:19'),
	(6, 7, NULL, NULL, NULL, '2022-11-08 21:21:24', '2022-11-08 21:21:24'),
	(7, 8, NULL, NULL, NULL, '2022-11-08 21:22:47', '2022-11-08 21:22:47'),
	(8, 9, '---', 'https://pixabay.com/id/illustrations/gelanggang-es-ice-skating-7564565/', 'profile/DUy7u6GKZ3YRtjpVGQNYw3Pdog8RJiqTjvK9LTr5.png', '2022-11-08 21:26:44', '2022-11-08 21:41:22'),
	(9, 10, NULL, NULL, NULL, '2022-11-08 21:55:13', '2022-11-08 21:55:13'),
	(10, 11, NULL, NULL, NULL, '2022-11-08 22:25:25', '2022-11-08 22:25:25'),
	(11, 12, NULL, NULL, NULL, '2022-11-08 22:45:04', '2022-11-08 22:45:04'),
	(12, 13, NULL, NULL, NULL, '2022-11-08 22:52:53', '2022-11-08 22:52:53');

-- Dumping structure for table laravel.profile_user
DROP TABLE IF EXISTS `profile_user`;
CREATE TABLE IF NOT EXISTS `profile_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `profile_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel.profile_user: ~3 rows (approximately)
REPLACE INTO `profile_user` (`id`, `profile_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 3, '2022-11-08 04:17:33', '2022-11-08 04:17:33'),
	(29, 4, 3, '2022-11-08 19:26:01', '2022-11-08 19:26:01'),
	(38, 8, 11, '2022-11-08 22:39:17', '2022-11-08 22:39:17');

-- Dumping structure for table laravel.stories
DROP TABLE IF EXISTS `stories`;
CREATE TABLE IF NOT EXISTS `stories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` int(11) NOT NULL DEFAULT 3500,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stories_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel.stories: ~4 rows (approximately)
REPLACE INTO `stories` (`id`, `user_id`, `title`, `description`, `image`, `time`, `created_at`, `updated_at`) VALUES
	(1, 1, NULL, NULL, 'http://localhost:8000/storage/story/Kphs2i2t7lbkxaKI7qPABb9nvjJABDxDT3qiewzR.png', 3500, '2022-11-08 00:27:41', '2022-11-08 00:27:41'),
	(2, 3, NULL, NULL, 'http://localhost:8000/storage/story/me8IOol0Vcm3gB0PcQWU4SW4tvHFGabQh5zokEQf.png', 3500, '2022-11-08 15:52:08', '2022-11-08 15:52:08'),
	(3, 9, NULL, NULL, 'http://localhost:8000/storage/story/c2Wbtff7j8tF4BFGHMcrZgPiwgYS6o6HvF7AhI4x.jpg', 3500, '2022-11-08 22:43:32', '2022-11-08 22:43:32'),
	(4, 9, NULL, NULL, 'http://localhost:8000/storage/story/s85T9y9cDDNwv0tWsE7mYvqSaGC3d0joBL2w6hIP.png', 3500, '2022-11-08 22:51:27', '2022-11-08 22:51:27');

-- Dumping structure for table laravel.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table laravel.users: ~8 rows (approximately)
REPLACE INTO `users` (`id`, `email`, `name`, `username`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'mhp@gmail.com', 'adin', 'mhp', NULL, '$2y$10$eySWWLjBLgWTxXncGITT5.LyI.TZ8TJrl8j/Ar6qG5aeYP42K0XvC', NULL, '2022-11-08 00:22:30', '2022-11-08 00:22:30'),
	(3, 'admin@gmail.com', 'admin', 'admin', NULL, '$2y$10$houS6uH71O6doDBcw5UP/.pcGqvUFMpvAl9hU3Zqp2TBFXNoyxLt.', NULL, '2022-11-08 04:17:19', '2022-11-08 04:17:19'),
	(5, 'tes@gmail.com', 'tes', 'tes', NULL, '$2y$10$6I64m3pdRhXsWErBY6MNxOrVErw99F2qeWgtCgCHTd.MGLiXFD3hS', NULL, '2022-11-08 04:23:25', '2022-11-08 04:23:25'),
	(9, 'jmajid7@gmail.com', 'Adin', 'Adin', '2022-11-08 21:27:12', '$2y$10$N3vgT2MLElL07xoiaXRSoemwnaR6VSvF5DdBW2cG7eubzo3leyFGy', NULL, '2022-11-08 21:26:44', '2022-11-08 21:27:12'),
	(10, 'user@gmail.com', 'user', 'user', NULL, '$2y$10$ApQ0vDhZHxAC.hh522wrC.nH8iiGyIvoZ.Q9VAo03Mwk0mvW2/Rk2', NULL, '2022-11-08 21:55:13', '2022-11-08 21:55:13'),
	(11, 'coba@gmail.com', 'coba', 'coba', '2022-11-08 22:27:15', '$2y$10$NyEnPqotMfRjsxr3JkNBv.miqTTiqXHkNWTgMa3bAt8QjMJb/Nvym', NULL, '2022-11-08 22:25:25', '2022-11-08 22:27:15'),
	(12, 'tessapp@gmail.com', 'tesapp', 'tesapp', '2022-11-08 22:45:28', '$2y$10$sUSUlfEjjQ..zFmwXgdD.epGJ5CpaLy4u.QFzhBauxswUYUGGAYkm', NULL, '2022-11-08 22:45:04', '2022-11-08 22:45:28'),
	(13, 'cobaapp@gmail.com', 'cobaapp', 'cobaapp', '2022-11-08 22:53:29', '$2y$10$99DQMyJZBsxw4mvK9MYJuund1oK9LBNaIp/qXx1/TqNrKj08WlFZS', NULL, '2022-11-08 22:52:53', '2022-11-08 22:53:29');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
