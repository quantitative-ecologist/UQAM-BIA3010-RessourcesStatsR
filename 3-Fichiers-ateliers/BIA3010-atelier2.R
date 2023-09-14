# Description -------------------------------------------------------------
# BIA3010 - Atelier 2 - Intro à R
# Hélène Dion-Phénix
# Last edition : 2023-09-11


# Ressources pertinentes --------------------------------------------------

# Le centre des sciences de la biodiversité du Québec (CSBQ)
# offre plusieurs ateliers gratuits disponibles en ligne.
# En voici un pertinent qui complète les notions abordées à l'atelier 2.
# https://r.qcbs.ca/workshop01/book-fr/manipuler-les-objets-dans-r.html


# Annoter son script -------------------------------------------------------------------

# Utiliser les touches ctrl-shift-r pour crééer des entêtes le script.
# Cela permet de bien organiser son code.
# En ajoutant un "#" au début de l'entête, vous faites des sous-titres
# de niveaux inférieurs.

# Vous pouvez visualiser votre code sous forme de table des matières
# en cliquant sur l'icone en haut à droite de la fenêtre de script.

## Sous-titre 1 ------------------------------------------------------------

# J'ai hâte d'écrire autre chose que des commentaires!

### Sous-titre 2 ------------------------------------------------------------

# Vive le code R!!

# Objets ------------------------------------------------------------------

## Variables ---------------------------------------------------------------

x <- 2+2
y <- "atelier" #placer les chaines de caractères entre guillmets
z <- x #si on ne met pas de guillmets, on réfère à l'objet x et non au caractère x
z <- x + x
z <- "x"
z2 <- x

## Vecteurs ---------------------------------------------------------------

equipe <- c("A","B","C","D","E","F","G")#facteur
nb_coeq <- c(6, 6, 6, 5, 5, 5, 5)#numerique
class(equipe)
class(nb_coeq)

#Modifier le type mathematique de nos vecteurs
equipe <- as.factor(equipe)
class(equipe)

eq <- c(equipe, equipe)

#Prenez l'habitude de vous débarasser des objets dont vous n'avez plus besoin.
#Vous diminuerez les risques d'erreur
rm(x, y, z, z2)

#Renommons le vecteur equipe en l'assignant à un nouvel objet de nom différent.
noms <- equipe 


### Index -------------------------------------------------------------------

#On peut aller chercher le enième élément d'un vecteur 
#en utilisant les crochets.
noms[4]
nb_coeq[4]

#Intervalles: de 4 à 6
noms[4:6]

#Pour aller chercher certains éléments, 
#on place un vecteur d'index entre crochets.
noms[c(4,6)] 


# Opération sur les vecteurs ----------------------------------------------

# opération mathématiques
nb_coeq * 2
nb_coeq + 2
(nb_etudiants <- sum(nb_coeq))

# ajouter des éléments à un vecteur
chiffres <- c(nb_coeq, 4, 3)

# Note: en placant toute la ligne entre parenthèse, 
# vous afficherez l'objet dans la console lorsque
# vous roulerez votre code.
(chiffres <- c(nb_coeq, 4, 3))

# encore plus long
(chiffres <- c(chiffres, 5:8))
# encore plus long
# sélection de 5 chiffres au hasard à ajouter au vecteur
(chiffres <- c(chiffres, sample(1:9, 5)))

# vecteur avec des na
(chiffres <- c(chiffres, NA))

# opérateurs logiques
is.na(chiffres)
sum(is.na(chiffres))

# On peut aussi changer un élément du vecteur
chiffres[1] <- 0
chiffres

## Tableaux ------------------------------------------------------------

# Chaque colonne d'un tableau est un vecteur
(equipe <- data.frame(noms, nb_coeq))


### Index -------------------------------------------------------------------

# Dans un tableau, on peut aussi aller chercher le enième élément
# mais comme on a maintenant deux dimensions (x et y),
# il faut spécifier quelle ligne et quelle colonne 
# nous intéresse.

equipe[4,2]

# Pour réutiliser cette information, il faut l'assigner
# à un objet
nb_coeq_D <- equipe[4,2]

# On peut aussi utiliser des expression logiques
equipe[nb_coeq > 5, "noms"]
equipe[nb_coeq > 5,]
# On demande ici les informations de la colonne "noms"
# des lignes qui ont une valeur supérieure à 5
# dans la colonne nb_coeq

# On peut aussi utiliser le symbole "$" pour référer 
# à un vecteur du tableau
equipe$noms

# De la même façon, on peut ajouter des colonnes
equipe$mot_clef <- c("araignees",
                     "herbivorie",
                     "pics",
                     "castors",
                     "macrophytes",
                     "migration",
                     "mesocosmes")


# Fonctions ---------------------------------------------------------------

# Les fonctions sont simplement du code de base que vous
# ou quelqu'un avez enregistré pour pouvoir le réutiliser
# pour accomplir une tâche.
# En tapant le nom d'une fonction sans mettre de parenthèse,
# on voit le code de la fonction.

sample #permet de lire le code de la fonction sample

# Pour voir la rubrique d'aide sur une fonction
?sample()
#ou
help(sample)

# Les fonctions présentent la syntaxe suivante:
# nom_fonction(argument1, argument2, ...)
# ex: sample(x, size, replace = FALSE, prob = NULL)
# pour la fonction sample, l'argument x est obligatoire,
# il s'agit d'un vecteur dans lequel on veut piger
# des valeurs aléatoirement
# L'argument size est aussi obligatoire :
# il indique combien d'éléments on souhaite piger
# L'argument replace a une valeur par défaut (replace = FALSE)
# Si on ne spécifie rien, on pigera toujours de nouveau éléments
# En spécifiant replace = TRUE, on remet les éléments 
# dans le chapeau entre chaque pige.

sample(1:10, 10)
sample(1:10, 10, replace = TRUE)


## Librairies --------------------------------------------------------------

# Les librairies regroupent un ensemble de fonctions autour
# d'un thème.
# En roulant une librairie, on roule le code des fonctions
# contenues dans la librairie, nous permettant ainsi de les
# utiliser.


# Importer des tableaux ---------------------------------------------------
# tableaux petits mammiferes

mamm_comm <- read.csv2(file = "2-Data/mamm_comm.csv",
                       sep = ";",
                       dec = ",")

mamm_data <- read.csv2(file = "2-Data/mamm_data.csv",
                       sep = ";",
                       dec = ",")

# Ça fonctionne? YEAHHH
# Ça ne marche pas?

# C'est peut-être une erreur de chemin d'accès
# Quel est votre répertoire de travail?
# Il s'agit de l'endroit où votre session R va chercher
# les ficheirs dans votre ordinateur.

getwd()

# Si vous travaillez dans un projet RStudio, votre répertoire
# de travail est le dossier qui contient votre projet.
# Vérifiez dans le coin supérieur droit si vous êtes dans un projet.

# Maintenant, est-ce que votre tableau se trouve dans
# votre répertoire de travail? 
# Si non, vous pouvez le déplacer à cet endroit
# ou modifier votre répertoire de travail

?setwd()

# Explorer vos données
head(mamm_comm)
tail(mamm_data)
str(mamm_comm)
str(mamm_data)


# Manipulations de tableaux -----------------------------------------------

# Vos deux tableaux sont au format tidy
# Lignes: objets ou unités d'échantillonnage
# Colonnes: descripteurs ou variables
# Donner des noms de lignes permettra éventuellement de faire
# le lien entre vos deux tableaux.
# Le nom des lignes est le nom des objets.
# Toutes les valeurs doivent être uniques

length(unique(mamm_comm$nuit_capture))
length(unique(mamm_data$nuit_capture))

# Les noms de lignes sont identiques dans nos deux tableaux
mamm_comm$nuit_capture %in% mamm_data$nuit_capture

# Nous aurions pu créer les noms d'objets dans R d'après 
# les noms de parcelle et les dates

mamm_data$objets <- paste(mamm_data$id_parcelle,
                          mamm_data$date,
                          sep = "_")

mamm_data$objets == mamm_data$nuit_capture

# Nommer les lignes
rownames(mamm_comm) <- mamm_comm$nuit_capture
rownames(mamm_data) <- mamm_data$objets

# Visualisons la matrice des communautés
View(mamm_comm)

# Ce n'est actuellement pas une matrice,
# car la première colonne n'est pas numérique.
# Maintenant que nos lignes portent le nom de nos objets,
# il est possible de retirer la colonne nuit_capture
# sans perdre d'information

# Vous pouvez utiliser l'index
mamm_comm[,-1]
# Attention par contre, car si vous rouler plusieurs fois cette ligne,
# vous aller supprimer plusieurs colonnes

# Voici une méthode plus précise qui permet d'éviter les erreurs
mamm_comm <- mamm_comm[,!colnames(mamm_comm) == "nuit_capture"]

# le symbole ! est un opérateur logique qui signifie "sauf"
# colnames permet d'accéder au nom de colonnes
colnames(mamm_comm)
# = signifie assignation (comme <- ), tandis que == est 
# l'opérateur logique qui signifie égal.


## Type de tableaux --------------------------------------------------------

class(mamm_comm)
class(mamm_data)

# mamm_data est bien un tableau de données
# mais mamm_comm est une matrice.
# Spécifier à R que mamm_comm est une matrice nous permettra
# de faire des calculs sur celle-ci

mamm_comm <- as.matrix(mamm_comm)
class(mamm_comm)
mamm_comm

# Conservons seulement les espèces pour lesquels nous avons
# fait des observations. 
# La fonction colSums nous donne la sommes des éléments 
# de chaque colonne
colSums(mamm_comm)

# On peut maintenant sélectionner les éléments de la matrice
# en utilisant cette fonction

mamm_comm <- mamm_comm[,colSums(mamm_comm) > 0]

# Exporter un tableau -----------------------------------------------------

# On pourrait maintenant vouloir exporter ce tableau pour
# l'utiliser dans un autre script.
?write.csv2

write.csv2(mamm_comm,
           file = "2-Data/mamm_presence_absence.csv")


# Sauver son environnement de travail -------------------------------------

# On peut aussi utiliser une autre approche. 
# On peut sauver directement les objets R de notre session.
# On gardera ainsi les formats R

# Avant de faire cela, faites le ménages pour conserver 
# seulement ce qui sera pertinent pour vos prochains scripts

rm(equipe, 
   chiffres, 
   nb_coeq, 
   nb_coeq_D, 
   nb_etudiants, 
   noms)

# Sauvons maintenant l'environnement
save.image(file = "2-Data/bd_mamm.RData")

# Cette environement figure maintenant dans notre répertoire
# de travail

rm(mamm_comm, mamm_data)

# Pour ouvrir l'environnement
load("2-Data/bd_mamm.RData")

# AMUSEZ-VOUS MAINTENANT!