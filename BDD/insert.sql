-- Valentin ENAUD --
-- Jeu de données utilisateurs --
-- Mis à jour le : 22/10/2022 --



-- Comptes --
INSERT into t_compte_cpt values("responsable","resp22_ZUIQ"),
                               ("vespucci_65","erzT!54"),
                               ("leif56","Ln'R?ffz"),
                               ("fmagellan","NtdM!gh"),
                               ("coco29","dkjcnqR!"),
                               ("jcartier","BJr,dj!");




-- Profils --
INSERT into t_profil_pfl values("responsable","Valentin","Enaud","valentin.enaud@admin.com",'A','A'),
                               ("vespucci_65","Amerigo","Vespucci","amerigo.vespucci@gmail.com",'F','A'),
                               ("leif56","Leif","Erikson","leif.erikson@outlook.com",'F','A'),
                               ("fmagellan","Fernand","Magellan","fernand.magellan@gmail.com",'F','D'),
                               ("coco29","Marco","Polo","marco.polo@gmail.com",'F','A'),
                               ("jcartier","Jacques","Cartier","jacques.cartier@outlook.com",'F','A');


-- Actualités --
INSERT into t_actualite_act values (null,"Nouveau quiz !","Connaissez-vous bien les villes de France ? Notre nouveau quiz permettra de le savoir très vite !",'A','2022-10-11 12:00:00',"vespucci_65"),
                                   (null,"Groupe B Match","Match prévu 15h pour le groupe B avec M.Magellan",'D','2022-09-12 09:00:00',"fmagellan"),
                                   (null,"Nouveau record !","Félicitations à X d'avoir battu le record du quiz Q, êtes-vous capable de faire mieux ? ",'A',CURDATE(),"leif56"),
                                   (null,"Groupe A Match","Match prévu 16h pour le groupe A avec M.Polo",'D','2022-09-10 09:00:00',"coco29"),
                                   (null,"Nouveau quiz !","Connaissez-vous bien les capitales en Europe ? Notre nouveau quiz permettra de le savoir très vite !",'A','2022-10-15 12:00:00',"jcartier");

-- Quizs --
INSERT into t_quiz_qui values(1,"Villes de France",null,'A',"vespucci_65"),
                             (2,"Capitales en Europe",null,'A',"fmagellan"),
                             (3,"Capitales en Asie",null,'A',"coco29"),
                             (4,"Villes d'Allemagne",null,'D',"leif56");


-- Questions & Réponses --

-- QUIZ 1
-- Question 1
INSERT into t_question_qes values(1,"Parmis ces villes quelle est la plus peuplée ?",'A',1,1);
INSERT into t_reponse_rep values (1,"Lyon",'B',1),(2,"Grenoble",'M',1),(3,"Rennes",'M',1),(4,"Orléans",'M',1) ;
-- Question 2
INSERT into t_question_qes values(2,"Parmis ces villes, laquelle est la plus étendue(superficie) ?",'A',3,1);
INSERT into t_reponse_rep values (5,"Nantes",'M',2),(6,"Saint-Étienne",'M',2),(7,"Arles",'B',2),(8,"Paris",'M',2) ;
-- Question 3
INSERT into t_question_qes values (3,"Parmis ces villes, laquelle est la plus au sud ?",'D',2,1);
INSERT into t_reponse_rep values (null,"Lille",'M',3),(null,"Marseille",'M',3),(null,"Bordeaux",'M',3),(null,"Ajaccio",'B',3) ;
-- Question 4
INSERT into t_question_qes values (4,"Parmis ces villes, laquelle est la plus au nord ?",'A',4,1);
INSERT into t_reponse_rep values (null,"Lille",'B',4),(null,"Marseille",'M',4),(null,"Bordeaux",'M',4),(null,"Ajaccio",'M',4);
-- Question 5
INSERT into t_question_qes values(5,"Parmis ces villes, laquelle est la plus à l'ouest ?",'A',5,1);
INSERT into t_reponse_rep values (null,"Lille",'M',5),(null,"Marseille",'M',5),(null,"Bordeaux",'B',5),(null,"Ajaccio",'M',5);


-- QUIZ 2
-- Question 1
INSERT into t_question_qes values(6,"Quelle est la capitale de la Finlande ?",'A',2,2);
INSERT into t_reponse_rep values (null,"Kiev",'M',6),(null,"Helsinki",'B',6),(null,"Oslot",'M',6),(null,"Copenhague",'M',6) ;
-- Question 2
INSERT into t_question_qes values(7,"Quelle est la capitale de l'Allemagne ?",'D',1,2);
INSERT into t_reponse_rep values (null,"Berlin",'B',7),(null,"Cologne",'M',7),(null,"Londres",'M',7),(null,"Salzbourg",'M',7) ;
-- Question 3
INSERT into t_question_qes values(8,"Quelle est la capitale de la Slovaquie ?",'A',3,2);
INSERT into t_reponse_rep values (null,"Berlin",'M',8),(null,"Bratislava",'B',8),(null,"Prague",'M',8),(null,"Minsk",'M',8) ;
-- Question 4
INSERT into t_question_qes values(9,"Quelle est la capitale du Portugal ?",'A',4,2);
INSERT into t_reponse_rep values (null,"Porto",'M',9),(null,"Séville",'M',9),(null,"Lisbonne",'B',9),(null,"Casablanca",'M',9) ;
-- Question 5
INSERT into t_question_qes values(10,"Quelle est la capitale de la Suisse ?",'A',5,2);
INSERT into t_reponse_rep values (null,"Berne",'B',10),(null,"Zurich",'M',10),(null,"Bâle",'M',10),(null,"Genève",'M',10) ;

-- QUIZ 3
-- Question 1
INSERT into t_question_qes values(11,"Quelle est la capitale de la Corée du Sud ?",'A',1,3);
INSERT into t_reponse_rep values (null,"Séoul",'B',11),(null,"Pékin",'M',11),(null,"Busan",'M',11),(null,"Osaka",'M',11) ;
-- Question 2
INSERT into t_question_qes values(12,"Quelle est la capitale de la Thaïlande ?",'A',2,3);
INSERT into t_reponse_rep values (null,"Tokyo",'M',12),(null,"Kuala Lumpur",'M',12),(null,"Pattaya",'M',12),(null,"Bangkok",'B',12) ;
-- Question 3
INSERT into t_question_qes values(13,"Quelle est la capitale du Vietnam ?",'A',3,3);
INSERT into t_reponse_rep values (null,"Hô Chi Minh-Ville",'M',13),(null,"Saïgon",'M',13),(null,"Hanoï",'B',13),(null,"Macao",'M',13) ;
-- Question 4
INSERT into t_question_qes values(14,"Quelle est la capitale du Kazakhstan ?",'A',4,3);
INSERT into t_reponse_rep values (null,"Tachkent",'M',14),(null,"Islamabad",'M',14),(null,"Astana",'B',14),(null,"Oulan-Bator",'M',14) ;
-- Question 5
INSERT into t_question_qes values(15,"Quelle est la capitale de l'Inde ?",'A',5,3);
INSERT into t_reponse_rep values (null,"Mumbai",'B',15),(null,"New Delhi",'M',15),(null,"Calcutta",'M',15),(null,"Bombay",'M',15) ;


-- Match
INSERT into t_match_mtc values('44448888',"QUIZ 1 GROUPE A M.Vespucci",'2022-10-12 12:00:00','2022-10-11 12:10:00',0,'A',"vespucci_65",1);
INSERT into t_match_mtc values('88884444',"QUIZ 2 GROUPE B M.Magellan",'2022-10-11 12:00:00','2022-10-11 12:10:00',0,'A',"fmagellan",2);
INSERT into t_match_mtc values('56343552',"QUIZ 2 GROUPE A M.Vespucci",'2022-10-12 12:00:00','2022-10-11 12:10:00',1,'A',"vespucci_65",2);
INSERT into t_match_mtc values('48484444',"QUIZ 3 GROUPE C M.Erikson",'2022-10-20 12:00:00','2022-10-22 12:10:00',1,'A',"leif56",3);
INSERT into t_match_mtc values('84848888',"QUIZ 3 GROUPE D M.Erikson",'2022-10-23 12:00:00','2022-10-25 12:10:00',1,'A',"leif56",3);


-- Joueurs
INSERT into t_joueur_jou values(null,"xXthe_dark_warrioXx",null,"88884444") ;
INSERT into t_joueur_jou values(null,"patrice29",null,"88884444") ;
INSERT into t_joueur_jou values(null,"faker",null,"88884444") ;
INSERT into t_joueur_jou values(null,"xiaohu",null,"88884444") ;
INSERT into t_joueur_jou values(null,"lefandegeo76",null,"44448888") ;
