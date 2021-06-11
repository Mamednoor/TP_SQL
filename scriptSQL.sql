-- Requête qui liste les enregistrements de tous les informations de la liste des films

select * from film;

-- Requêtes qui affiche le nombre d’abonnés

select count(idabonne) from abonne

-- Requête qui liste les prénoms des réalisateurs par ordre alphabétique

select prenom from realisateur order by prenom;

-- Requête qui affiche le nom, prénom du real, le nom prénom de l’acteur principal et le titre du film de chaque film

select 
realisateur.nom as nom_realisateur,
realisateur.prenom as prenom_realisateur,

acteur.nom as nom_acteur,
acteur.prenom as prenom_acteur,
titre
from film
left join acteur on acteur.idacteur = film.idacteur
left join realisateur on realisateur.idrealisateur = film.idrealisateur;

-- Requête qui affiche la moyenne de tous les films

select avg(note) as moyenne_de_tous_les_films from film;

-- Requête qui affiche le nombre de film Avengers

select count(*) from film where titre like 'avenger%'

-- Requête qui affiche les enregistrements des acteurs dont le nom commence par la lettre r

select * from acteur where nom like 'r%'

-- Requête qui affiche le nom et prénom des abonnées qui ont vu aucun film

select * from film_vu
natural right join abonne
where film_vu.idfilm is null;

-- Requête qui affiche les films qui ont la meilleure note

select * from film order by note desc;
SELECT idfilm, titre, note FROM film WHERE note=(SELECT MAX(note) FROM film); 

-- Requête qui donne le film qui a la moins bonne note

select * from film where note=(select min(note) from film); -- donne toutes les informations
select titre, note from film where note=(select min(note) from film); -- donne juste le titre et la note

-- Requête qui affichent les films qui ont une plus grande note que la moyenne des notes films

select * from film where note >(select avg(note) from film);

-- Requête qui pour chaque acteur nous donne le nombre de film où il a joué

select any_value(acteur.nom) as nom_acteur ,any_value(acteur.prenom) as prenom_acteur, count(acteur.idacteur) as nbr_film 
from acteur
left join film on film.idacteur = acteur.idacteur
group by acteur.nom 
order by nbr_film desc;


select any_value(acteur.nom) as nom_acteur,any_value(acteur.prenom) as prenom_acteur, count(acteur.idacteur) as nbr_film 
from acteur
natural left join film
group by acteur.nom 
order by nbr_film desc;


-- Le nom et prénom et le nombre de film de l’acteur qui a joué dans le plus de film

select any_value(acteur.nom) as nom_acteur,any_value(acteur.prenom) as prenom_acteur, count(acteur.idacteur) as nbr_film 
from acteur
natural left join film
group by acteur.nom 
order by nbr_film desc limit 1;


select any_value(acteur.nom) as nom_acteur,any_value(acteur.prenom) as prenom_acteur, count(film.idacteur) as nbr_film 
from acteur
natural join film
group by acteur.idacteur
having count(film.idacteur) = (
  select count(idacteur)
  from film
  group by idacteur
  order by count(idacteur) desc
  limit 1
);

-- Le nom et prénom et le nombre de film de l’abonné qui a vu le plus de film

select any_value(abonne.nom) as nom_abonne,any_value(abonne.prenom) as prenom_abonne, count(film_vu.idabonne) as nbr_FilmVu
from abonne
natural left join film_vu 
group by abonne.nom 
order by nbr_FilmVu desc limit 1;


select any_value(abonne.nom) as nom_abonne,any_value(abonne.prenom) as prenom_abonne, count(film_vu.idabonne) as nbr_FilmVu
from abonne
natural left join film_vu 
group by abonne.nom 
having count(film_vu.idabonne) = (
  select count(idabonne)
  from film_vu
  group by idabonne
  order by count(idabonne) desc
  limit 1
);

-- Le nom et prénom du réalisateur qui a réalisé le plus de film

select any_value(realisateur.nom), any_value(realisateur.prenom), count(film.idrealisateur) as nbr_de_film
from realisateur
natural left join film
group by realisateur.nom
order by nbr_de_film desc limit 4;


select any_value(realisateur.nom) as nom_realisateur, any_value(realisateur.prenom) as prenom_realisateur, count(film.idrealisateur) as nbr_de_film
from realisateur
natural left join film
group by realisateur.nom
having count(film.idrealisateur) = (
  select count(idrealisateur)
  from film
  group by idrealisateur
  order by count(idrealisateur) desc
  limit 1
);

-- Créer un trigger, une procédure et un évent de votre choix.

-- trigger 

CREATE trigger addSubscribe
AFTER insert
on abonne
for each Row
insert into film_vu (idabonne, idfilm) VALUES
(new.idabonne,'20');

-- procedure

delimiteur //
CREATE procedure infos
(IN nom varchar(50))
BEGIN
select * from film natural join realisateur where realisateur.nom = nom;
END //
delimiter ;

-- event

delimiteur //
CREATE event subscribe
on schedule every 1 minute
starts Now()
ends Now() + interval 5 minute
do
BEGIN
insert into abonne (nom, prenom) values ('AddSubscribe','WithEvent');
END //
delimiter ;
