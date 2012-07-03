CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `secret` text NOT NULL,
  `type` enum('user','admin') NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

INSERT INTO `users` (`id`, `name`, `password`, `email`, `secret`, `type`, `data`) VALUES
(1, 'Sumocoders', '57bf7fd2449834188ee1497644294a27c93f0faa', 'accounts@sumocoders.be', 'b6b8968b9ffc307e727fe3a437d967db', 'admin', 'a:1:{s:8:"settings";a:0:{}}');

CREATE TABLE IF NOT EXISTS `users_sessions` (
  `session_id` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `edited_on` datetime NOT NULL,
  PRIMARY KEY (`session_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;