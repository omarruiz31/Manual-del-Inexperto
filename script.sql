CREATE TABLE estudiante (
    matricula CHAR(9) PRIMARY KEY,
    paterno VARCHAR(30) NOT NULL,
    materno VARCHAR(30),
    nombres TEXT,
    direccion TEXT,
    telefono VARCHAR(10),
    fecha_nacimiento DATE,
    fecha_inscripcion DATE,
    edad INT NOT NULL
);

--Primer registro
INSERT INTO estudiante VALUES (
's23017364',
'Ruiz',
'Carrera',
'Omar Eduardo',
'Petrolera',
'9212038614',
'2005-10-31',
'2025-10-31',
20);

INSERT INTO estudiante VALUES (
'S24016711',
'Jasso',
'Hernandez',
'Pamela',
'Puerto Mexico',
'9212354797',
'2006-11-04',
'2025-10-31',
18);

INSERT INTO estudiante VALUES (
  'S24016718',
  'Vaughan',
  'Vargas',
  'Angel Antonio',
  'Minatitlan',
  '9223585707',
  '2006-05-02',
  '2025-10-31',
  19
);


--7 estudiantes mas
INSERT INTO estudiante (
  matricula, paterno, materno, nombres, direccion,
  telefono, fecha_nacimiento, fecha_inscripcion, edad
) VALUES
('s24016721', 'chable',   'elton',     'katia julissa', 'Peloteros',             '9225550001', '2006-10-04', '2024-08-21', 17),
('s24016706', 'ferrer',   'perez',     'diego arturo',  'Cd. Olmeca',            '9991977978', '2006-05-20', '2024-08-21', 18),
('s24016730', 'garcia',   'mora',      'luis fernando', 'Santa Isabel',          '9225550002', '2006-09-11', '2024-08-21', 17),
('s24016717', 'macario',  'lopez',     'eric ivan',     'Allende',               '9235550003', '2004-09-10', '2024-08-21', 19),
('s24016701', 'morales',  'olan',      'jose ruben',    'constituyentes',        '9211979183', '2003-09-17', '2024-08-21', 20),
('s24016716', 'pablo',    'hernandez', 'jessica',       'Manuel Avila Camacho',  '9241423092', '2005-08-05', '2024-08-21', 19),
('s24016726', 'hernandez','sanjeado',  'angel daniel',  'Lomas ',           '9225550004', '2006-07-15', '2024-08-21', 18);



ALTER TABLE estudiante ALTER COLUMN fecha_inscripcion SET DEFAULT CURRENT_DATE;

INSERT INTO estudiante (matricula,paterno,materno,nombres,direccion,telefono,fecha_nacimiento,edad) VALUES (
's24016734','ritt','martinez','diana jahret','Adolfo Lopez Mateos','9212332173','2006-09-04',19);


--19. Modifique la tabla estudiante, agregue el campo correo
ALTER TABLE estudiante ADD COLUMN correo VARCHAR(50);

UPDATE estudiante
SET correo = CASE matricula
    WHEN 's23017364' THEN 'omar.ruiz0531@gmail.com'
    WHEN 's24016711' THEN 'paammeeee2@gmail.com'
    WHEN 'S24016718' THEN 'antoniovaughan@gmail.com'
    WHEN 's24016721' THEN 'caphewithleche@icloud.com'
    WHEN 's24016706' THEN 'reyyali@outlook.com'
    WHEN 's24016730' THEN 'fernan845garciamora@gmail.com'
    WHEN 's24016717' THEN 'ericivanML@hotmail.com'
    WHEN 's24016701' THEN 'jossrube@gmail.com'
    WHEN 's24016716' THEN 'jesikapablo@gmail.com'
    WHEN 's24016726' THEN 'danihdezs17@gmail.com'
    WHEN 's24016734' THEN 'dianariitcas@gmail.com'
END
WHERE matricula IN (
    's23017364','s24016711','S24016718','s24016721','s24016706',
    's24016730','s24016717','s24016701','s24016716','s24016726','s24016734'
);

ALTER TABLE estudiante DROP COLUMN edad;
/*
ALTER TABLE estudiante
ADD COLUMN edad INT GENERATED ALWAYS AS (
  EXTRACT(YEAR FROM AGE(CURRENT_DATE, fecha_nacimiento))
) STORED;
*/


CREATE TABLE materia (
  materia_id INT NOT NULL,
  materia VARCHAR(30) NOT NULL
);

ALTER TABLE materia ADD PRIMARY KEY(materia_id);

ALTER TABLE materia ALTER COLUMN materia_id ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE materia ALTER COLUMN materia TYPE VARCHAR(60);

ALTER TABLE materia  ADD COLUMN creditos INT NOT NULL;

INSERT INTO materia (materia, creditos) VALUES
('POO', 9),
('Requisitos de Software', 8),
('Algebra Lineal', 8),
('Sistemas Operativos', 8),
('Bases de Datos', 8),
('Metodologia', 9),
('Matematicas Discretas', 8),
('Literacidad', 6),
('Pensamiento', 5),
('Arquitectura de Computadoras', 8);


/* checar esto
DELETE FROM materia;

DROP TABLE materia;

\i 'Users/omarruiz/Desktop/'
*/

ALTER TABLE estudiante ADD COLUMN sexo char(1) DEFAULT 'M';

UPDATE estudiante SET sexo = 'F' WHERE matricula IN ('s24016721','s24016716','s24016734','S24016711');

ALTER TABLE materia RENAME to materias;
ALTER TABLE materias RENAME to materia;


--Practica 3



INSERT INTO estudiante (matricula, paterno, materno, nombres, direccion, telefono, fecha_nacimiento, sexo) VALUES
('s24016698','Aguirre','Lerma','Carlos Miguel','Centro','9211753522','2005-12-02','M'),
('s24016725','alejandro','javier','luis antonio','Fracc.Las Dunas','9213110307','2006-01-17','M'),
('s23017354','beltran','guevara','roberto carlos','Centro','9213332974','2005-09-08','M'),
('s24016705','castro','ceniceros','juan pablo','Centro','9211695645','2002-07-05','M'),
('s24016721','chable','elton','Katia Julissa','Peloteros','9212533320','2006-10-04','F'),
('s23017367','Chong','Segura','Ian Fernando','Residencial Las Olas','9842560754','2003-06-08','M'),
('s24016715','dominguez','ruiz','diony ines','Centro','9213401849','2006-04-29','F'),
('s24016706','ferrer','perez','diego arturo','Cd. Olmeca','9991977978','2006-05-20','M'),
('s24016709','flores','gallegos','jorge rafael','Obrera','9221856139','2006-07-13','M'),
('s24016730','garcia','mora','luis fernando','Santa Isabel','9241371434','2006-09-11','M'),
('s24016733','gutierrez','hipolito','jesus manuel','Centro','9213083028','2006-03-02','M'),
('s24016707','hernandez','rojas','angel yair','Esfuerzos de los Hemanos del Trabajo','9211258270','2004-11-08','M'),
('s24016726','hernandez','sanjeado','angel daniel','Benito Juarez Sur','9212349412','2006-08-02','M'),
('s24016711','jasso','hernandez','pamela','Puerto México','9212354787','2006-11-04','F'),
('s23021812','jimenez','ramos','hector favio','Rafael Hernandez Ochoa','9212698018','2003-11-08','M'),
('s23017360','leon','cruz','jose emilio','Benito Juarez Norte','9212079705','2004-09-24','M'),
('s24016717','macario','lopez','eric ivan','Allende','9231110815','2004-09-10','M'),
('s24022199','mateos','de la cruz','jose','Santa Isabel','9241498836','2006-09-19','M'),
('s24016700','meza','cova','luis manuel','Puerto México','7296154581','2001-10-31','M'),
('s23017355','miranda','becerra','carlos de jesus','Playa sol','9212910820','2004-03-08','M'),
('s24016701','morales','olan','jose ruben','constituyentes','9211979183','2003-09-17','M'),
('s24016723','morales','dominguez','ezequiel eduardo','Centro','2285835140','2006-04-03','M'),
('s24022200','ortega','navedo','felipe de jesus','20 de noviembre','9212540247','2003-02-05','M'),
('s24016716','pablo','hernandez','jessica','Manuel Avila Camacho','9241423092','2005-08-05','F'),
('s23017363','perez','villalobos','maximiliano','Caracas','9211848459','2004-05-25','M'),
('s24016727','perez','uscanga','evelyn','Paraiso a las Dunas','9211616774','2006-08-20','F'),
('s24016728','perez','montiel','justin dareh','Maria de la piedad','9991333551','2006-06-12','M'),
('s24022197','reyes','mendoza','luis angel','Primero de Mayo','9212057184','2006-01-11','M'),
('s24016703','ricaño','castellanos','altair','Jardines de California','9211298931','2006-07-28','M'),
('s24016734','ritt','martinez','diana jareth','Adolfo Lopez Mateos','9212332173','2006-09-04','F'),
('s24016704','robles','ricardez','christoper','Santa Isabel','9231383344','2006-10-03','M'),
('s23017364','ruiz','carrera','omar eduardo','Petrolera','9212038614','2005-10-31','M'),
('s24016713','salinas','guzman','emiliano','PornHub','9212345678','1521-01-01','M'),
('s24016712','sanchez','marcos','jose daniel','Benito Juarez Norte','9211171957','2002-03-30','M'),
('s24016732','sastre','ramos','marvin jason','Santa isabel','2224537891','1999-01-23','M'),
('s23017381','sanchez','saucedo','rene emiliano','Benito Juarez Norte','9213033610','2005-08-24','M'),
('s24016729','trujillo','martinez','cesar eloy','Centro','9212342418','2006-12-14','M'),
('s24016696','valencia','medina','hannia monserrat','Iquisa','9212830841','2005-04-14','F'),
('s24016718','vargas','vaughan','angel antonio','Tacoteno','9223585707','2006-03-26','M'),
('s24016731','vasquez','machorro','omar','Centro','9212027204','2006-10-13','M'),
('s24022198','viveros','salmones','francisco xavier','Cd  Olmeca','2281140892','2005-02-17','M'),
('s24016702','zapata','gallegos','alexa kahely','Señora de lourdes','9212238991','2005-05-27','F'),
('s24022201','aragon','martinez','jose angel','Las Gaviotas','9211423817','2006-11-17','M');


UPDATE estudiante
SET correo = CASE matricula
    WHEN 's24016698' THEN 'maikycamiagle11@gmail.com'
    WHEN 's24016725' THEN 'luxj09142@gmail.com'
    WHEN 's23017354' THEN 'robertobeltranguevara@gmail.com'
    WHEN 's24016705' THEN 'juanpablo20202002@gmail.com'
    WHEN 's24016721' THEN 'caphewithleche@icloud.com'
    WHEN 's23017367' THEN 'ian_chong1@hotmail.com'
    WHEN 's24016715' THEN 'dor29@gmail.com'
    WHEN 's24016735' THEN 'h30035574@gmail.com'
    WHEN 's24016706' THEN 'reyyali@outlook.com'
    WHEN 's24016709' THEN 'Jorge13flores@hotmail.com'
    WHEN 's24016699' THEN 'vvanegz@gmail.com'
    WHEN 's24016730' THEN 'fernan845garciamora@gmail.com'
    WHEN 's24016733' THEN 'jesusgutierrez12329@gmail.com'
    WHEN 's24016707' THEN 'angelyair1231@gmail.com'
    WHEN 's24016726' THEN 'danihdezs17@gmail.com'
    WHEN 's24016711' THEN 'paammeeee2@gmail.com'
    WHEN 's23021812' THEN 'favjihe@gmail.com'
    WHEN 's23017360' THEN 'emilioleon_04@outlook.com'
    WHEN 's24016717' THEN 'ericivanML@hotmail.com'
    WHEN 's24022199' THEN 'josemateos574@gmail.com'
    WHEN 's24016700' THEN 'mezacova21@gmail.com'
    WHEN 's23017355' THEN 'carldejfbr@gmail.com'
    WHEN 's24016701' THEN 'ruben.mo.olan@gmail.com'
    WHEN 's24016723' THEN 'moralesdominguezee04@gmail.com'
    WHEN 's24022200' THEN 'felipe_orteganav@hotmail.com'
    WHEN 's24016716' THEN 'jessicaphdz05@gmail.com'
    WHEN 's23017363' THEN 'maxperez2505@gmail.com'
    WHEN 's24016727' THEN 'linopg2103@gmail.com'
    WHEN 's24016728' THEN 'justinperezmontiel@gmail.com'
    WHEN 's24022197' THEN 'mendozaluis3080@gmail.com'
    WHEN 's24016703' THEN 'ricanocastellanosaltair@gmail.com'
    WHEN 's24016734' THEN 'rittdiana@gmail.com'
    WHEN 's24016704' THEN 'robleschristoper13@gmail.com'
    WHEN 's23017364' THEN 'omar.ruiz0531@gmail.com'
    WHEN 's24016713' THEN 'choto69@gmail.com'
    WHEN 's24016712' THEN 'danielinski11@gmail.com'
    WHEN 's24016732' THEN 'Mar_Js@outlook.com'
    WHEN 's23017381' THEN 'lick121ass@gmail.com'
    WHEN 's24016729' THEN 'trujillocesar293@gmail.com'
    WHEN 's24016696' THEN 'hannethamin@gmail.com'
    WHEN 's24016718' THEN 'antonio.vargas2603@gmail.com'
    WHEN 's24016731' THEN 'omar111@gmail.com'
    WHEN 's24022198' THEN 'franciscoxaviersal@gmail.com'
    WHEN 's24016702' THEN 'kahelykjin@gmail.com'
    WHEN 's24022201' THEN 'joseangel22@gmail.com'
END
WHERE matricula IN (
    's24016698','s24016725','s23017354','s24016705','s24016721',
    's23017367','s24016715','s24016735','s24016706','s24016709',
    's24016699','s24016730','s24016733','s24016707','s24016726',
    's24016711','s23021812','s23017360','s24016717','s24022199',
    's24016700','s23017355','s24016701','s24016723','s24022200',
    's24016716','s23017363','s24016727','s24016728','s24022197',
    's24016703','s24016734','s24016704','s23017364','s24016713',
    's24016712','s24016732','s23017381','s24016729','s24016696',
    's24016718','s24016731','s24022198','s24016702','s24022201'
);

INSERT INTO estudiante (
    matricula, paterno, materno, nombres, direccion, telefono, fecha_nacimiento, sexo, correo
) VALUES (
    's23017375', 'lopez', 'pinedo', 'ricardo', 'Puerto México', '9212226519', '2004-11-18', 'M', 'r77244118@gmail.com'
);


INSERT INTO estudiante (
    matricula, paterno, materno, nombres, direccion, telefono, fecha_nacimiento, sexo, correo
) VALUES (
    's23017372', 'martinez', 'dominguez', 'elias', 'Manuel Avila Camacho', '9213210299', '2005-11-07', 'M', 'doguez.elias@gmail.com'
);


INSERT INTO estudiante (
    matricula, paterno, materno, nombres, direccion, telefono, fecha_nacimiento, sexo, correo
) VALUES (
    's24016699', 'garcia', 'zarate', 'Veronica Vanessa', 'Teresa Morales', '9212072831', '2006-10-21', 'F', 'vvanegz@gmail.com'
);


--Practica 4

CREATE TABLE grupo (
    matricula VARCHAR(9),
    materia_id INT NOT NULL
);  

INSERT INTO grupo (matricula, materia_id) VALUES
('s24016698', 1),
('s24016725', 2),
('s23017354', 3),
('s24016705', 4),
('s24016721', 5),
('s23017367', 6),
('s24016715', 7),
('s24016706', 8),
('s24016709', 9),
('s24016730', 10),
('s24016733', 1),
('s24016707', 2),
('s24016726', 3),
('s24016711', 4),
('s23021812', 5),
('s23017360', 6),
('s24016717', 7),
('s24022199', 8),
('s24016700', 9),
('s23017355', 10),
('s24016701', 1),
('s24016723', 2),
('s24022200', 3),
('s23017363', 4),
('s24016716', 5),
('s24016727', 6),
('s24016728', 7),
('s24022197', 8),
('s24016703', 9),
('s24016734', 10),
('s24016704', 1),
('s23017364', 2),
('s24016712', 3),
('s24016732', 4),
('s23017381', 5),
('s24016729', 6),
('s24016696', 7),
('s24016718', 8),
('s24016731', 9),
('s24022198', 10),
('s24016702', 1),
('s24022201', 2),
('s23017375', 3),
('s23017372', 4),
('s24016699', 5),
('s24016730',6),
('s24022198',7),
('s24016734',2),
('s23017355',1)
;

ALTER TABLE grupo ADD CONSTRAINT pk_grupo PRIMARY KEY(matricula,materia_id);

ALTER TABLE grupo ADD CONSTRAINT fk_grupo_estudiante FOREIGN KEY (matricula) REFERENCES estudiante(matricula);

ALTER TABLE grupo DROP CONSTRAINT fk_grupo_estudiante;

ALTER TABLE grupo ADD CONSTRAINT fk_grupo_estudiante FOREIGN KEY(matricula)
REFERENCES estudiante(matricula)
ON DELETE CASCADE;

DELETE FROM estudiante
WHERE matricula = 's24016725';

ALTER TABLE grupo ADD CONSTRAINT fk_grupo_materia FOREIGN KEY(materia_id) REFERENCES materia(materia_id);

ALTER TABLE grupo DROP CONSTRAINT fk_grupo_materia;

ALTER TABLE grupo ADD CONSTRAINT fk_grupo_materia FOREIGN KEY(materia_id) REFERENCES materia(materia_id)
ON DELETE CASCADE;

DELETE FROM materia WHERE materia_id = 10;

ALTER TABLE grupo ADD COLUMN calificacion INT;

UPDATE grupo SET calificacion = FLOOR(random() *10) +1;





    
