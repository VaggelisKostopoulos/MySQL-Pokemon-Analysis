-- 1. Open and view the table
SELECT * FROM pokemon_data;

-- 2. Find the 100th pokemon
SELECT * FROM pokemon_data WHERE id = 100;

-- 3. Find the first and the last pokemon
SELECT * FROM pokemon_data ORDER BY id ASC LIMIT 1;

SELECT * FROM pokemon_data ORDER BY id DESC LIMIT 1;

-- 4. How many pokemon are in total?
SELECT COUNT(*) FROM pokemon_data;

-- 5. Select the pokemon with the highest base experience
SELECT id,name, base_experience FROM pokemon_data ORDER BY base_experience DESC;

-- 6. How many pokemon have base_experience over 150?
SELECT COUNT(*) FROM pokemon_data WHERE base_experience > 150;

-- 7. Select the pokemon with the biggest and lowest height
SELECT id,name,height FROM pokemon_data WHERE height = (SELECT MIN(height) FROM pokemon_data);

SELECT id,name,height FROM pokemon_data WHERE height = (SELECT MAX(height) FROM pokemon_data);

-- 8. Select the pokemon with the biggest and lowest weight. What type of pokemon is it?
SELECT id,name,weight,types FROM pokemon_data WHERE weight = (SELECT MIN(weight) FROM pokemon_data);

SELECT id,name,weight,types FROM pokemon_data WHERE weight = (SELECT MAX(weight) FROM pokemon_data);

-- 9 . How many pokemon have weight over 2000 and height over 100?
SELECT COUNT(*) FROM pokemon_data WHERE (weight > 2000) AND (height > 100);

-- 10. Which pokemon have dragon type as primary or secondary type?
SELECT id,name,types FROM pokemon_data WHERE types LIKE '%dragon%';

-- 11. Which pokemon have the ability blaze,magician? and how many are they?
SELECT id,name,abilities FROM pokemon_data WHERE abilities = 'blaze, magician';

SELECT COUNT(*) FROM pokemon_data WHERE abilities = 'blaze, magician';
-- 12. How many and which pokemon have the ability pickup?
SELECT COUNT(*) FROM pokemon_data WHERE abilities LIKE '%pickup%';

SELECT name,abilities FROM pokemon_data WHERE abilities LIKE '%pickup%';

-- 13. Which is the most common type/types? group by type order by count
SELECT types, COUNT(id) as 'Times seen'
FROM pokemon_data
GROUP BY types
ORDER BY COUNT(id) DESC;

-- 14. Which pokemon have the move flamethrower? and how many are they?
SELECT id, name, types, moves FROM pokemon_data WHERE moves LIKE '%flamethrower%';

SELECT COUNT(*) FROM pokemon_data WHERE moves LIKE '%flamethrower%';

-- 15. Which pokemon have attack=59? How many are they?
SELECT * FROM pokemon_data WHERE stats LIKE '%attack=59%' AND stats NOT LIKE '%special-attack=59%';

-- 16. Find the pokemon that have either dark as their only type or psychic as their only type
SELECT id,name,types,height,weight FROM pokemon_data WHERE (types = 'dark' AND height > 10) XOR (types='dark' AND weight <200);

-- 17. Which pokemon names end with gmax? And how many are they?
SELECT id,name FROM pokemon_data WHERE name LIKE '%gmax';

SELECT COUNT(*) FROM pokemon_data WHERE name LIKE '%gmax';

-- 18. Which pokemon names have just 1 a in them?
Select id,name,types FROM pokemon_data WHERE name LIKE '%a%' AND name NOT LIKE '%a%a%';

-- 19. Which pokemon type have the biggest average weight?
SELECT types,AVG(weight) FROM pokemon_data GROUP BY types ORDER BY AVG(weight) DESC;

-- 20. Which types have over 30 pokemon?
SELECT types,COUNT(id) FROM pokemon_data GROUP BY types HAVING COUNT(id) > 30;