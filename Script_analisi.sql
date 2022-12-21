-- Conteggio dei Paesi in esame
SELECT COUNT (DISTINCT country) AS count_of_country
FROM "Data";

-- Conteggio dei metodi di collezione dei dati
SELECT method_data_collection, COUNT(method_data_collection) AS count
FROM "Data"
GROUP BY method_data_collection
ORDER BY count DESC;

-- Percentuale media di cibo sprecato nel tempo
SELECT year, AVG(loss_percentage_original) AS Percentuale_media
FROM "Data"
GROUP BY year
ORDER BY year;

-- Paesi in cui vengono sprecate più tipologie diverse di cibo
SELECT country, COUNT(DISTINCT commodity) AS kind_of_commodities_wasted
FROM "Data"
GROUP BY country 
ORDER BY kind_of_commodities_wasted DESC;

-- Cibi maggiormente sprecati negli ultimi 5 anni
SELECT commodity, COUNT(commodity) AS wasted_food
FROM "Data" 
WHERE year >= '2017'
GROUP BY commodity
ORDER BY wasted_food DESC;

-- Paesi che contribuiscono maggiormente allo spreco di mais negli ultimi 5 anni
SELECT country, COUNT(commodity) AS maize_wasted
FROM "Data" 
WHERE commodity = 'Maize (corn)' AND year >= '2017'
GROUP BY country
ORDER BY maize_wasted DESC;

-- Fasi in cui viene sprecato più cibo
SELECT food_supply_stage, COUNT(food_supply_stage) AS count
FROM "Data"
WHERE year >= '2017'
GROUP BY food_supply_stage
ORDER BY count DESC;

-- Paesi in cui viene sprecato piu cibo durante la fase 'farm'
SELECT country, COUNT(food_supply_stage) AS wasted_food_in_farm
FROM "Data" 
WHERE food_supply_stage = 'Farm' AND year >= '2017'
GROUP BY country
ORDER BY wasted_food_in_farm DESC;

-- Paesi in cui viene sprecato piu cibo durante la fase 'Harvest'
SELECT country, COUNT(food_supply_stage) AS wasted_food_in_Harvest
FROM "Data" 
WHERE food_supply_stage = 'Harvest' AND year >= '2017'
GROUP BY country
ORDER BY wasted_food_in_Harvest DESC;

-- Paesi in cui viene sprecato piu cibo durante la fase 'Whole supply chain'
SELECT country, COUNT(food_supply_stage) AS wasted_food_in_Whole_supply_chain
FROM "Data" 
WHERE food_supply_stage = 'Whole supply chain' AND year >= '2017'
GROUP BY country
ORDER BY wasted_food_in_Whole_supply_chain DESC;

/* Le attività responsabili dello spreco alimentare durante le fasi di 'Farm' 
 oppure 'Harvest' negli ultimi 5 anni */
SELECT activity, COUNT(activity) AS count
FROM "Data" 
WHERE (food_supply_stage = 'Farm' OR food_supply_stage = 'Harvest') AND year >= '2017'
GROUP BY activity 
ORDER BY count DESC;

-- Le attività responsabili dello spreco alimentare durante l'intera supply chain
SELECT activity, COUNT(activity) AS count
FROM "Data" 
WHERE food_supply_stage = 'Whole supply chain' 
GROUP BY activity
ORDER BY count DESC;
