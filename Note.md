# Projet Titre CDA

## Compétences visées

- [ ] Maquetter application => Adobe XD
- [ ] Test Unitaires => Mocha
- [ ] Déploiement => Docker
- [ ] Concevoir l'application
- [ ] Front-End => UI sécurisé
- [ ] Concevoir Base de données => JMerise
- [ ] Couche BLL => Logique métier
- [ ] Couche DAL => Accès aux données

## Ressources

- **Repo Github** : 
- **Repo Docker** : 
- https://www.npmjs.com/package/@types/sqlite3
- https://semantic-ui.com/

## Spécification

### Technique

 Choix des technologies :

- Typescript

Pourquoi TypeScript ? 

L'utilisation de typescript permet d'ajouter le typage statique sur le langage Javascript, le concept de "Générique", ou encore, certain conception Objet comme les interfaces.
Ainsi, le fait de définir un type précis attendu, par exemple sur une fonction, permet d'augmenter les performances et de rendre le code plus propre est compréhensif.

- NodeJs

Pourquoi NodeJs ?

L'avantage de NodeJs réside dans son fonctionnement. Il est doté un modèle I/O non-bloquant, ainsi les actions exécutées par l'application ne bloquent pas les nouvelles actions capturer par l'event loop. Ce fonctionnement est idéal pour réaliser des applications web dynamique et améliore la charge que peut supporter l'application.

- Mocha 

Mocha est destinés à effectuer les tests unitaires de l'application. C'est un outil couplé avec la librairie "assert" permettant de réaliser les vérifications. Il est simple de mise en palce et d'utilisation.  

- Docker

Docker est une solution de conténeurisation puissant et facilite le déploiement des applications. Couplé à cela le versionning des conteneurs, avec un système similaire à celui de Git, Docker est d'autant plus intéressant. 
Dans notre cas il nous sera facile de déployer l'application simplement en quelques lignes de commandes ou en utilisant un fichier YML pour automatiser le déploiement avec GitHub.

- Sqlite3 



### Métier

On souhaite obtenir une application web permettant de gérer les notes des élèves et de regrouper toutes les informations concernant :

- Les intervenants
- Les élèves
- Les matières
- Les promotions (B3, I1 etc ...)

Les fonctionnalités attendues : 

- Un intervenant peut rentrer une note pour une de SES matières et un élève 
- Un intervenant est capable de retrouver l'ensemble de ses classes et de ses notes dans une de ses matières, si il y en a plusieurs
- Un élève peut retrouver ses notes de son année courante, avec sa moyenne générale et sa moyenne par matière

