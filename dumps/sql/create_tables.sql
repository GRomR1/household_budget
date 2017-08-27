CREATE TABLE `household_budget_kind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `household_budget_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `plan` int(11) NOT NULL,
  `closing_date` date DEFAULT NULL,
  `kind_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `household_budget_ite_kind_id_2d179d8c_fk_household` (`kind_id`),
  CONSTRAINT `household_budget_ite_kind_id_2d179d8c_fk_household` FOREIGN KEY (`kind_id`) REFERENCES `household_budget_kind` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;


CREATE TABLE `household_budget_estimate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `value` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `household_budget_est_item_id_80709942_fk_household` (`item_id`),
  CONSTRAINT `household_budget_est_item_id_80709942_fk_household` FOREIGN KEY (`item_id`) REFERENCES `household_budget_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO `household_budget_kind` (`id`, `name`) VALUES
(1, 'Расход'),
(2, 'Доход');
