# KATA FLUTTER
Ce kata va vous guider pour créer votre première application.

Un petit [guide](./cheatsheat.md) pour vous aider à trouver la lumière.

# Sujet

Notre application est un outil qui permet aux salariés de commander des places de cinéma, parc, auprès de leur CSE.
Il sera possible de lister des offres, de les afficher et de choisir le nombre de places que l'on souhaite commander.
Nous appelons "produit" les différents types de billets que l'on peut acheter dans une offre

# Commencons

Après avoir cloner le repository, regardons la strucure du projet.
Nous avons déjà créer le modèle de données ainsi que des données de test pour s'affranchir d'une couche réseau

# La liste des offres

Le premier écran à réaliser présente les éléments suivants : 
* Une barre avec nom de l'application
* La liste des offres disponibles. Pour chaque offre
  * Le nom de l'offre
  * Un bouton permettant de l'afficher. Pour cette étape, ce bouton est inactif

# Afficher une offre

Le second écran va afficher le détail d'une offre : 
* Une barre avec : 
  * le nom de l'offre
  * Un bouton retour sur la gauche permettant de revenir à la liste des offres
* Une image de l'offre sur toute la largeur
* La date limite de l'offre

# Afficher les produits de l'offre

Cette partie va vous permettre de gérer des règles métier et manipuler un état.

Dans l'écran d'une offre : 
* AFficher tous les produits de l'offre : 
  * Le nom du produit
  * Le prix du produit
  * La partie difficile : 
    * Le nombre de produit commandé
    * Des boutons pour ajouter / retirer un produit

En plus de tout cela, il faut ajouter un champ texte qui affiche en temps réel le montant total des produits commandés

# Valider notre commande

Pour faire simple, nous allons considérer chaque achat dans une offre comme étant une commande unique : 
* Sur la page précédente, ajouter un bouton permettant de valider la commande
* Afficher une demande de validation avec le montant à payer
* Afficher deux boutons: 
  * Valider qui affichera une notification "Commande validée"
  * Annuler qui ramènera sur la page d'accueil

# On va plus loin, on ajoute du réseau

Nous avons une première version qui fait des choses, nous allons désormais nous rapprocher d'un cas concret.

Dans le répertoire *server* nous avons ajouter un petit serveur en go.
Vous pouvez lancer le serveur sur le port *9010* avec la commande suivante 
```bash
go run . 9010
```
Voici le détail de l'API
* GET /offres : Renvoie la liste des offres
```json
[
    {name:"Cinéma",id:2},
    {name:"Parc",id:4}
 ]
```
* GET /offre/{id} : Renvoie le détail d'un offre 
```json 
{
    name:"Cinéma",
    date:"20230401",
    image:true,
    products:[
        {
            name:"Place UGC":,
            price:4.2,
            max_quantity:25
        },{
            name:"Gaumont":,
            price:6.3,
            max_quantity:10
        }
    ]
}
```
* GET /image/{id} : Renvoie l'image d'une offre

Vous pouvez désormais remplacer les données de tests par des appels à l'API

Si vous voulez y aller progressivement, vous pouvez déjà encapsuler l'appel aux données de test pour manipuler des Futures :)