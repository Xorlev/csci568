/*
 Navicat SQLite Data Transfer

 Source Server         : DM project 9
 Source Server Version : 3007006
 Source Database       : main

 Target Server Version : 3007006
 File Encoding         : utf-8

 Date: 12/10/2011 13:46:28 PM
*/

PRAGMA foreign_keys = false;

-- ----------------------------
--  Table structure for `albums`
-- ----------------------------
DROP TABLE IF EXISTS `albums`;
CREATE TABLE `albums` (
	 `id` int NOT NULL,
	 `name` text,
	 `artist_id` int,
	PRIMARY KEY(`id`)
);

-- ----------------------------
--  Table structure for `albums_genres`
-- ----------------------------
DROP TABLE IF EXISTS `albums_genres`;
CREATE TABLE `albums_genres` (
	 `album_id` int NOT NULL,
	 `genre_id` int NOT NULL
);

-- ----------------------------
--  Table structure for `artists`
-- ----------------------------
DROP TABLE IF EXISTS `artists`;
CREATE TABLE `artists` (
	 `id` int NOT NULL,
	 `name` text,
	PRIMARY KEY(`id`)
);

-- ----------------------------
--  Table structure for `genres`
-- ----------------------------
DROP TABLE IF EXISTS `genres`;
CREATE TABLE `genres` (
	 `id` int NOT NULL,
	 `name` text,
	PRIMARY KEY(`id`)
);

-- ----------------------------
--  Table structure for `genres_tracks`
-- ----------------------------
DROP TABLE IF EXISTS `genres_tracks`;
CREATE TABLE `genres_tracks` (
	 `genre_id` int NOT NULL,
	 `track_id` int NOT NULL
);

-- ----------------------------
--  Table structure for `tracks`
-- ----------------------------
DROP TABLE IF EXISTS `tracks`;
CREATE TABLE `tracks` (
	 `id` int NOT NULL,
	 `name` text,
	 `album_id` int,
	 `artist_id` int,
	PRIMARY KEY(`id`)
);

PRAGMA foreign_keys = true;
