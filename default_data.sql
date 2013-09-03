CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `secret` text NOT NULL,
  `type` enum('user','admin') NOT NULL,
  `data` text NOT NULL,
  `blocked` enum('N','Y') NOT NULL,
  `created_on` datetime NOT NULL,
  `edited_on` datetime DEFAULT NULL,
  `blocked_on` datetime DEFAULT NULL,
	`deleted` enum('N','Y') NOT NULL DEFAULT 'N',
	`forgot_password` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

INSERT INTO `users` (`id`, `name`, `password`, `email`, `secret`, `type`, `data`, `blocked`, `created_on`, `edited_on`, `blocked_on`, `deleted_on`) VALUES
(1, 'Sumocoders', '57bf7fd2449834188ee1497644294a27c93f0faa', 'accounts@sumocoders.be', 'b6b8968b9ffc307e727fe3a437d967db', 'admin', 'a:1:{s:8:"settings";a:0:{}}', 'N', '2012-06-20 13:37:00', NULL, NULL, 'N');

CREATE TABLE IF NOT EXISTS `users_sessions` (
  `session_id` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `edited_on` datetime NOT NULL,
  PRIMARY KEY (`session_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `users_login_attempts` (
  `login` varchar(255) NOT NULL,
  `attempts` int(11) NOT NULL,
  `last_attempt` datetime NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `settings` (
  `key` varchar(255) NOT NULL,
  `value` text,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;