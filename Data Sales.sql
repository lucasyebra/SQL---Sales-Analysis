create database portfolio;
use portfolio;
-- Inspeccionando la data
select * from sales_Data;

-- Check valores unicos
select distinct status from sales_Data;
select distinct year_id from sales_Data;
select distinct productline from sales_Data;
select distinct country from sales_Data;
select distinct dealsize from sales_Data;
select distinct territory from sales_Data;

-- Análisis variados
select productline, round(sum(sales),2) as Revenue
from sales_Data
group by productline
order by sum(sales) desc;
/* Los autos clásicos son la categoria con mayores ventas, seguido por Autos Vintage y Motos.*/

select year_id, round(sum(sales),2) as Revenue
from sales_Data
group by year_id
order by sum(sales) desc;
/* El mejor año en cuanto a ventas fue el 2004. Veamoslo por meses*/

select month_id, sum(sales) as Revenuebymonth
from sales_Data
where year_id = 2004
group by month_id
order by sum(sales) desc;
/* Se observa que noviembre de 2004 fue el mejor mes para las ventas*/

select productline, sum(quantityordered) as QuantitySold, count(ordernumber) as Frequency
from sales_Data
where year_id= 2004
group by productline
order by sum(sales) desc;
/*Los autos clásicos fueron la categoría más demandada en el 2004 con un total de 442 ordenes de compra*/

-- Mejor cliente
select customername, year_id, sum(sales) as TotalCompras, avg(sales) as Compras_promedio, count(ordernumber) as Frecuencia
from sales_Data
group by customername, year_id
order by TotalCompras desc;
/*Euro Shopping Channel fue el mejor cliente, siendo el mayor comprador de los años 2004 y 2005.*/

select distinct customername, count(ordernumber) as Frecuencia,
case when count(ordernumber) > 30 then 'Comprador cotidiano'
when count(ordernumber) between 10 and 30 then 'Comprador casual'
else 'Comprador inusual'
end as Tipo_Cliente
from sales_data
group by customername
order by Frecuencia desc;
/*Nuevamente Euro Shopping Channel es el comprador más frecuente*/

-- Cuales son las ciudades donde más se vende
select country, city, sum(sales) as Total_Ventas
from sales_Data
group by city
order by Total_Ventas desc, City;
/*Madrid, España. Es la ciudad más rentable para vender*/

-- Recomendación de producto
select country, productline, dealsize, sum(sales) as Total_Ventas, sum(quantityordered) as Cantidad_Vendidas
from sales_Data
group by country
order by sum(sales) desc limit 5;
/*Si habría que recomendar un producto ese serían motos pequeñas, principalmente en el mercado de los Estados unidos*/
