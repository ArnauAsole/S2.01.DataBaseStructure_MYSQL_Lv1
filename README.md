# 👓🍕🍷 S2.01.DataBaseStrucute_MYSQL_Lv1

## 🧾 Òptica "Cul d'Ampolla" & Pizzeria Delivery System
Aquest projecte conté dos models de base de dades desenvolupats per practicar disseny relacional i consultes SQL complexes en contextos del món real. Es tracta de l'òptica "Cul d'Ampolla" i un sistema de comandes per a una pizzeria.

## 📚 Project Overview
Aquest projecte inclou:

Disseny de dues bases de dades independents:

Òptica: per a la gestió de proveïdors, ulleres, clients i vendes.

Pizzeria: per gestionar comandes, productes, repartiments, clients i botigues.

Modelatge de dades amb clau primària i clau forana.

Casos d’ús reals per practicar consultes SQL amb joins, subconsultes, agregats, i clàusules avançades.

## 🧱 Entity Overview
👓 Òptica “Cul d’Ampolla”
Taules principals:

## 🏭 proveidor
id (PK)

nom

carrer, numero, pis, porta, ciutat, codi_postal, pais

telefon

fax

nif

🕶️ ullera
id (PK)

marca

graduacio_vidre_esquerre

graduacio_vidre_dret

tipus_muntura (flotant, pasta, metàl·lica)

color_muntura

color_vidre_esquerre

color_vidre_dret

preu

proveidor_id (FK)

👤 client
id (PK)

nom

adreça_postal

telefon

email

data_registre

recomanat_per_id (FK cap a client)

👨‍💼 empleat
id (PK)

nom

cognoms

🧾 venda
id (PK)

data_venda

client_id (FK)

empleat_id (FK)

ullera_id (FK)

🍕 Pizzeria Delivery
Taules principals:

👤 client
id (PK)

nom, cognoms

adreça, codi_postal

localitat_id (FK)

telefon

🗺️ localitat
id (PK)

nom

provincia_id (FK)

🗺️ provincia
id (PK)

nom

🧾 comanda
id (PK)

data_hora

tipus_entrega (domicili / recollida)

quantitat_total

preu_total

client_id (FK)

botiga_id (FK)

repartidor_id (FK opcional)

data_hora_entrega (opcional)

🍔 producte
id (PK)

nom, descripcio, imatge, preu

tipus (pizza, hamburguesa, beguda)

🧾 comanda_producte
comanda_id (FK)

producte_id (FK)

quantitat

🧠 categoria_pizza
id (PK)

nom

🍕 pizza
producte_id (PK, FK a producte)

categoria_id (FK)

🏬 botiga
id (PK)

adreça, codi_postal

localitat_id (FK)

👨‍🍳 empleat
id (PK)

nom, cognoms, nif, telefon

rol (cuiner / repartidor)

botiga_id (FK)

🚀 Getting Started
Crear la base de dades:

```
CREATE DATABASE optica;
CREATE DATABASE pizzeria;
Executar els scripts de creació de taules (schema_optica.sql, schema_pizzeria.sql).
```

Afegir dades d’exemple amb scripts seed_optica.sql i seed_pizzeria.sql si estan disponibles.

### 🔍 Example Queries
Òptica
Clients que han estat recomanats per un altre client:

```
SELECT c1.nom AS client, c2.nom AS recomanat_per
FROM client c1
LEFT JOIN client c2 ON c1.recomanat_per_id = c2.id;
Ulleres venudes per empleat:
```

SELECT e.nom, COUNT(v.id) AS total_vendes
FROM venda v
JOIN empleat e ON v.empleat_id = e.id
GROUP BY e.nom;
Pizzeria
Comandes fetes per repartidor:

```
SELECT e.nom, COUNT(c.id) AS total_comandes
FROM comanda c
JOIN empleat e ON c.repartidor_id = e.id
WHERE e.rol = 'repartidor'
GROUP BY e.nom;
```

Productes més venuts:
```
SELECT p.nom, SUM(cp.quantitat) AS total_vendes
FROM comanda_producte cp
JOIN producte p ON cp.producte_id = p.id
GROUP BY p.nom
ORDER BY total_vendes DESC;
```

### 🛠️ Tools Used
MySQL per a la gestió de bases de dades

DBeaver / phpMyAdmin per executar i visualitzar les consultes

SQL Workbench / VS Code per editar scripts

Markdown per documentar el projecte

### 🔗 GitHub Repository
📂 https: https://github.com/ArnauAsole/S2.01.DataBaseStructure_MYSQL_Lv1.git
