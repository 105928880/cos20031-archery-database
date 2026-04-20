
CREATE TABLE IF NOT EXISTS Archer(
	archerId INTEGER AUTO_INCREMENT PRIMARY KEY,
	archerName VARCHAR(64) NOT NULL,
	
);

CREATE TABLE IF NOT EXISTS RoundDefinition(
	roundName VARCHAR(24) PRIMARY KEY,
	endsPerRange ENUM('5', '6') NOT NULL DEFAULT '6'
);

CREATE TABLE IF NOT EXISTS RangeDefinition(
	roundName VARCHAR(24) NOT NULL,
	rangeNumber TINYINT NOT NULL,
	rangeDistance ENUM('10m', '20m', '30m', '40m', '50m', '60m', '70m', '90m') NOT NULL,
	boardSize ENUM('80cm', '120cm') NOT NULL,

	PRIMARY KEY (roundName, rangeNumber),
	FOREIGN KEY (roundName) REFERENCES RoundDefinition(roundName)
);

CREATE TABLE IF NOT EXISTS EquivalentRound(
	roundName VARCHAR(24) NOT NULL,
	
);

CREATE TABLE IF NOT EXISTS Competition(
	competitionId INTEGER AUTO_INCREMENT PRIMARY KEY,
	baseRoundName VARCHAR(24) NOT NULL,

	FOREIGN KEY (baseRoundName) REFERENCES RoundDefinition(roundName)
);

CREATE TABLE IF NOT EXISTS CompetitionScore(
	competitionId INTEGER NOT NULL,
	archerId INTEGER NOT NULL,
	roundName VARCHAR(24) NOT NULL,
	rangeNumber TINYINT NOT NULL,

	PRIMARY KEY (competitionId, archerId),
	FOREIGN KEY (competitionId) REFERENCES Competition(competitionId),
	FOREIGN KEY (archerId) REFERENCES Archer(archerId),
	FOREIGN KEY (roundName) REFERENCES RoundDefinition(roundName)
);

CREATE TABLE IF NOT EXISTS EndShot(
	endId INTEGER AUTO_INCREMENT PRIMARY KEY,
	bullseyeCount TINYINT NOT NULL
);

CREATE TABLE IF NOT EXISTS Arrow(
	endId INTEGER NOT NULL,
	arrowId TINYINT NOT NULL,
	score TINYINT NOT NULL,

	PRIMARY KEY (endId, arrowId),
	FOREIGN KEY (endId) REFERENCES EndShot(endId)
);

