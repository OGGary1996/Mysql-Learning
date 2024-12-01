CREATE DATABASE Wine;
CREATE TABLE Country(
	country_id INT,
    country_name varchar(50) NOT NULL,
    PRIMARY KEY (country_id)
);
INSERT INTO Country()
VALUES
	(1,'France'),
    (2,'Spain'),
    (3,'U.S.A');

CREATE TABLE Region(
	region_id INT,
    region_name VARCHAR(50) NOT NULL,
    country_id INT,
    PRIMARY KEY (region_id),
    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);
INSERT INTO Region()
VALUES
	(1,'Napa Valley',3),
    (2,'Walla Walla Valley',3),
    (3,'Texas Hill',3);
    
CREATE TABLE Viticultural_area(
	viticultural_area_id INT,
    viticultural_area_name VARCHAR(50) NOT NULL,
    region_id INT,
    PRIMARY KEY (viticultural_area_id),
    FOREIGN KEY (region_id) REFERENCES Region(region_id)
);
INSERT INTO Viticultural_area()
VALUES
	(1,'Atlas Peak',1),
    (2,'Calistoga',1),
    (3,'Wild Horse Valley',1);

CREATE TABLE Wine_type(
	wine_type_id INT,
    wine_type_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (wine_type_id)
);
INSERT INTO Wine_type()
VALUES
	(1,'Chardonnay'),
    (2,'Cabernet Sauvignon'),
    (3,'Merlot');
    
CREATE TABLE Winery(
	winery_id INT,
    winery_name VARCHAR(50) NOT NULL,
    viticultural_area_id INT,
    Offering_tours_flag INT NOT NULL,
    PRIMARY KEY (winery_id),
    FOREIGN KEY (viticultural_area_id) REFERENCES Viticultural_area(viticultural_area_id)
);
INSERT INTO Winery()
VALUES
	(1,'Silva vineyards',1,0),
    (2,'Chateau Traileur Parc',2,1),
    (3,'Winosaur Estate',3,1);
    
CREATE TABLE Portfolio(
	winery_id INT,
    wine_type_id INT,
    in_season_flag INT NOT NULL
);
INSERT INTO Portfolio()
VALUES 
	(1,1,1),
    (1,2,1),
    (1,3,0),
    (2,1,1),
    (2,2,1),
    (2,3,1),
    (3,1,1),
    (3,2,1),
    (3,3,1);
    
SELECT 
	C.country_name,
    R.region_name,
    V.viticultural_area_name,
    W.winery_name
FROM Winery W
JOIN Viticultural_area V USING (viticultural_area_id)
JOIN Region R USING (region_id)
JOIN Country C USING (country_id)
JOIN Portfolio P ON W.winery_id = P.winery_id
JOIN Wine_type WP ON P.wine_type_id = WP.wine_type_id
WHERE C.country_id = 3 AND P.in_season_flag = 1 AND P.wine_type_id = 3 AND W.Offering_tours_flag = 1;