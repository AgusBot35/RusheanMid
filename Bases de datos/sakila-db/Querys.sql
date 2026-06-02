/* ---

-- ### 1. Alquileres de BARBARA JONES

-- **Enunciado:** Obtener el nombre de la película, idioma original, fecha de alquiler y fecha de devolución de todos los alquileres realizados por la cliente **BARBARA JONES**.

-- **Filas esperadas:** 22

*/

SELECT 
    f.title AS pelicula,
    l.name AS idioma_original,
    r.rental_date,
    r.return_date
FROM customer c
JOIN rental r 
    ON c.customer_id = r.customer_id
JOIN inventory i 
    ON r.inventory_id = i.inventory_id
JOIN film f 
    ON i.film_id = f.film_id
JOIN language l 
    ON f.language_id = l.language_id
WHERE UPPER(c.first_name) = 'BARBARA'
  AND UPPER(c.last_name) = 'JONES'
ORDER BY r.rental_date;

/*

---

-- ### 2. Actores de películas Comedy (con y sin repetición)

-- **Enunciado:** Mostrar apellido y nombre de los actores que participan en películas de la categoría **Comedy**. Resolver de dos formas:
-- - **Con repetición:** 286 filas
-- - **Sin repetición:** 147 filas (usando `DISTINCT`)

-- **Filas esperadas:** 286 con repetición / 147 sin repetición

*/

SELECT 
	a.first_name AS Nombre,
	a.last_name AS Apellido
FROM film f
JOIN film_category fc
	ON f.film_id = fc.film_id
JOIN category c
	ON c.category_id = fc.category_id
JOIN film_actor fa
	ON f.film_id = fa.film_id
JOIN actor a
	ON fa.actor_id = a.actor_id
WHERE UPPER(c.name) = 'COMEDY'
ORDER BY Nombre

-- Sin repetición:

SELECT DISTINCT
	a.first_name AS Nombre,
	a.last_name AS Apellido
FROM film f
JOIN film_category fc
	ON f.film_id = fc.film_id
JOIN category c
	ON c.category_id = fc.category_id
JOIN film_actor fa
	ON f.film_id = fa.film_id
JOIN actor a
	ON fa.actor_id = a.actor_id
WHERE UPPER(c.name) = 'COMEDY'
ORDER BY Nombre

/*

---

-- ### 3. Películas del actor RAY

-- **Enunciado:** Obtener **todos los datos** de las películas en las que participó el actor de nombre **RAY**.

-- **Filas esperadas:** 30

*/

SELECT *
FROM film f
JOIN film_actor fa
	ON f.film_id = fa.film_id
JOIN actor a
	ON fa.actor_id = a.actor_id
WHERE UPPER(a.first_name) = 'RAY'

/*
---

-- ### 4. Películas de 61 a 99 minutos en Francés

-- **Enunciado:** Listar todas las películas cuya duración esté entre **61 y 99 minutos** (inclusive) y cuyo **lenguaje original** sea **French**.

-- **Filas esperadas:** 9

---

-- ### 5. Ciudades de Austria, Chile y France

-- **Enunciado:** Mostrar el nombre de la ciudad y el nombre del país (en **MAYÚSCULAS**) de todas las ciudades pertenecientes a **Austria**, **Chile** y **France**. Ordenar por país y luego por ciudad.

-- **Filas esperadas:** 10

---

-- ### 6. Actores con "SS" en el apellido

-- **Enunciado:** Mostrar el apellido (en **minúsculas**) concatenado al nombre (en **MAYÚSCULAS**) de los actores cuyo apellido contenga **"SS"**. Incluir también el apellido y nombre originales como referencia.

-- **Filas esperadas:** 7

---

-- ### 7. Alquileres del día 26 en Woodridge

-- **Enunciado:** Mostrar el número de ejemplar y el nombre de la película de todos los alquileres realizados el **día 26** (de cualquier mes) que pertenezcan al almacén de la ciudad **Woodridge**.

-- **Filas esperadas:** 99

---

-- ### 8. Segunda página de películas más caras

-- **Enunciado:** Mostrar la **segunda página** (10 películas por página) de un listado con nombre de la película, **lenguaje original** y **valor de reposición**, ordenadas por valor de reposición del más caro al más barato.

-- **Filas esperadas:** 10

---

-- ### 9. Ejemplares devueltos después de 7 días

-- **Enunciado:** Mostrar las películas, clientes, ejemplares, fechas de alquiler y devolución de aquellos ejemplares que **demoraron más de 7 días** en ser devueltos.

-- **Filas esperadas:** 3557

---

-- ## Consultas intermedias

> Ejercicios con agrupación (`GROUP BY`), funciones de agregación (`COUNT`, `SUM`, `AVG`, `MAX`), subconsultas y operadores de conjunto.

---

### 10. Películas actualmente alquiladas (no devueltas)

**Enunciado:** Mostrar las películas que están **actualmente alquiladas** (alquiladas y no devueltas). Incluir: nombre de la película, número de ejemplar, nombre del cliente (formato "Apellido, Nombre") y fecha de alquiler.

---

### 11. Top 10 películas más alquiladas

**Enunciado:** Mostrar las **10 películas más alquiladas** de la historia, ordenadas de mayor a menor cantidad de alquileres.

---

### 12. Películas alquiladas por OWENS, CARMEN

**Enunciado:** Listar las películas que fueron alquiladas por la cliente **CARMEN OWENS**.

---

### 13. Pagos no asignados a ningún alquiler

**Enunciado:** Buscar los pagos registrados que **no tienen un alquiler asociado**.

---

### 14. Películas en Mandarín

**Enunciado:** Seleccionar todas las películas cuyo **idioma original** sea **Mandarin**, listadas alfabéticamente. Mostrar el título y el idioma en **minúsculas**.

**Nota:** Prestar atención a qué columna de idioma usar (`language_id` vs `original_language_id`).

---

### 15. Clientes que alquilaron la misma película más de una vez

**Enunciado:** Mostrar los clientes que hayan alquilado **la misma película más de 1 vez**. Incluir cuántas veces la alquilaron.

---

### 16. Totales de alquileres por mes (2005)

**Enunciado:** Mostrar la cantidad total de alquileres por mes del **año 2005**. Incluir año y mes.

---

### 17. Monto total por categoría

**Enunciado:** Mostrar el **monto total recaudado** (suma de pagos) por cada categoría de película. Ordenar de mayor a menor monto. El campo calculado debe llamarse **`monto_total`**.

---

### 18. Actores de películas alquiladas en julio 2005

**Enunciado:** Listar todos los actores que participaron en películas alquiladas durante el **mes 7 del año 2005**. Ordenados alfabéticamente en formato **"APELLIDO, nombre"**. Renombrar el campo como **Actor**.

---

### 19. Monto gastado por CLARA SHAW

**Enunciado:** Mostrar el **monto total gastado** por la cliente **CLARA SHAW** en todos sus alquileres.

---

### 20. Mayor pago del año 2005

**Enunciado:** Mostrar el **valor más alto** registrado en pagos durante el **año 2005**, indicando qué **cliente** realizó ese pago y la **fecha**.

---

### 21. Clientes que gastaron más de $40 en junio 2005

**Enunciado:** Listar los clientes que gastaron **más de $40** en el **mes 6 del año 2005**. Mostrar el monto total gastado.

---

### 22. Cantidad de clientes por ciudad

**Enunciado:** Mostrar la **cantidad de clientes** registrados en cada ciudad, ordenado de mayor a menor.

---

### 23. Top 5 películas con más actores

**Enunciado:** Mostrar las **5 películas** con mayor cantidad de actores en el reparto.

---

### 24. Días con más de 10 alquileres de Drama

**Enunciado:** Mostrar los días en que se alquilaron **más de 10 películas** de la categoría **Drama**. Incluir la fecha y la cantidad.

---

### 25. Actores sin películas

**Enunciado:** Mostrar los actores que **no están asignados a ninguna película**.

---

## Consultas avanzadas

> Ejercicios con operadores de conjunto (`UNION ALL`, `UNION`, `INTERSECT`), subconsultas múltiples y análisis de datos.

---

### 26. Clientes de la más y menos alquilada (con repeticiones)

**Enunciado:** Mostrar los clientes que alquilaron la **película más alquilada** junto con los que alquilaron la **menos alquilada**, **con repeticiones**. Ordenar alfabéticamente.

---

### 27. Clientes de la más y menos alquilada (sin repeticiones)

**Enunciado:** Ídem consulta 26, pero **sin repeticiones**.

---

### 28. Clientes que alquilaron ambas (la más y la menos alquilada)

**Enunciado:** Mostrar los clientes que hayan alquilado **tanto** la película más alquilada **como** la menos alquilada.

---

### 29. Clientes de categoría 'New' en días pico

**Enunciado:** Mostrar los clientes que alquilaron películas de la categoría **'New'** exclusivamente en los días donde se alquilaron **más de 40 ejemplares** de dicha categoría.

**Días pico:** 2005-07-31, 2005-08-02, 2005-08-19

---

### 30. Días sobre la media de alquileres

**Enunciado:** Mostrar los días en que la **cantidad de alquileres** superó el **promedio diario histórico**. Ordenar de mayor a menor cantidad.

---

*Documento actualizado — Todos los ejercicios verificados sobre la base `videoclub` en PostgreSQL.* */

