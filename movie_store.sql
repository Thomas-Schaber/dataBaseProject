DROP TABLE RENTAL;
DROP TABLE  MEMBER;
DROP TABLE COPY;
DROP TABLE DVD;
DROP TABLE VHS;
DROP TABLE MOVIE;
DROP TABLE CATEGORY;
DROP TABLE STAR;





CREATE TABLE STAR
( actor_name		VARCHAR(20) NOT NULL,
  real_first		VARCHAR(20) NOT NULL,
  real_middle		VARCHAR(20) NOT NULL,
  real_last		VARCHAR(20) NOT NULL,
  dob			DATE NOT NULL,
  CONSTRAINT	pk_star PRIMARY KEY (actor_name)
);


CREATE TABLE DVD
( dvd_id VARCHAR(4) NOT NULL,
  CONSTRAINT pk_dvd_id PRIMARY KEY(dvd_id)
);

CREATE TABLE VHS 
( vhs_id VARCHAR(4) NOT NULL,
  CONSTRAINT pk_vhs_id PRIMARY KEY(vhs_id)
);

CREATE TABLE CATEGORY 
(  id VARCHAR(2) NOT NULL,
   genre VARCHAR(30) NOT NULL,
   CONSTRAINT pk_id_category PRIMARY KEY(id),
   CONSTRAINT uk_genre UNIQUE(genre)
);

CREATE TABLE MOVIE 
( title		VARCHAR(20) NOT NULL,
  genre_id		VARCHAR(2) NOT NULL,
  star_actor    VARCHAR(30), 
  CONSTRAINT	pk_movie PRIMARY KEY (title),
  CONSTRAINT	fk_genre FOREIGN KEY (genre_id) REFERENCES CATEGORY(id) on delete cascade,
  CONSTRAINT	fk_star FOREIGN KEY (star_actor) REFERENCES STAR(actor_name) on delete cascade
);

CREATE TABLE COPY
( copy_num		VARCHAR(2) NOT NULL,
  title			VARCHAR(20) NOT NULL,
  dvd_id		VARCHAR(4),
  vhs_id		VARCHAR(4),
  CONSTRAINT	pk_copy PRIMARY KEY (copy_num),
  CONSTRAINT	fk_title FOREIGN KEY (title) REFERENCES MOVIE(title)  on delete cascade,
  CONSTRAINT	fk_dvd FOREIGN KEY (dvd_id) REFERENCES DVD(dvd_id)  on delete cascade,
  CONSTRAINT	fk_vhs FOREIGN KEY (vhs_id) REFERENCES VHS(vhs_id)  on delete cascade,
  CONSTRAINT    chk_dvd_or_vhs CHECK ((dvd_id IS NULL AND vhs_id IS NOT NULL) OR (dvd_id IS NOT NULL AND vhs_id IS NULL))
);

CREATE TABLE MEMBER
( mem_id		VARCHAR(5) NOT NULL,
  first_name		VARCHAR(10) NOT NULL,
  last_name		VARCHAR(10) NOT NULL,
  phone_num		VARCHAR(20) NOT NULL,
  address		VARCHAR(255) NOT NULL,
  CONSTRAINT	pk_member PRIMARY KEY (mem_id)
);


CREATE TABLE RENTAL
( rent_id		VARCHAR(4) NOT NULL,
  copy_number		VARCHAR(4) NOT NULL,
  rent_date		DATE NOT NULL,
  member_id		VARCHAR(5) NOT NULL,
  CONSTRAINT	pk_rental PRIMARY KEY (rent_id),
  CONSTRAINT	fk_copy_num FOREIGN KEY (copy_number) REFERENCES COPY(copy_num) on delete cascade,
  CONSTRAINT	fk_mem_id FOREIGN KEY (member_id) REFERENCES MEMBER(mem_id) on delete cascade
);

insert into STAR values('EDDIE MURPHY', 'EDDIE', 'REGAN', 'MURPHY', TO_DATE('04/3/1961', 'MM/DD/YYYY'));
insert into STAR values('MEL GIBSON', 'MEL', 'COLM-CILLE GERALD', 'GIBSON', TO_DATE('01/3/1956', 'MM/DD/YYYY'));
insert into STAR values('JULIA ROBERTS', 'JULIA', 'FIONA', 'ROBERTS', TO_DATE('10/28/1967', 'MM/DD/YYYY'));

insert into CATEGORY values(1, 'ACTION');
insert into CATEGORY values(2, 'HORROR');
insert into CATEGORY values(3, 'ADVENTURE');
insert into CATEGORY values(4, 'COMEDY');
insert into CATEGORY values(5, 'SUSPENSE');
insert into CATEGORY values(6, 'DRAMA');
insert into CATEGORY values(7, 'WAR');
insert into CATEGORY values(8, 'SCI-FI');
insert into CATEGORY values(9, 'THRILLER');

insert into MOVIE values('SHREK', 4, 'EDDIE MURPHY');
insert into MOVIE values('BRAVE HEART', 1, 'MEL GIBSON');
insert into MOVIE values('OCEANS ELEVEN', 1, 'JULIA ROBERTS');
insert into MOVIE values('MAD MAX', 1, 'MEL GIBSON');
insert into MOVIE values('DADDYS HOME', 4, 'MEL GIBSON');
insert into MOVIE values('AVA', 9, NULL);
insert into MOVIE values('HOOK', 3, 'JULIA ROBERTS');
insert into MOVIE values('RUN', 9, NULL);


insert into DVD values(1883);
insert into DVD values(2202);
insert into DVD values(4543);
insert into DVD values(7709);
insert into DVD values(9009);

insert into VHS values(1445);
insert into VHS values(6655);
insert into VHS values(8801);
insert into VHS values(1889);
insert into VHS values(1993);

insert into COPY values('1', 'SHREK', NULL, 1445);
insert into COPY values('2', 'BRAVE HEART', NULL, 1993);
insert into COPY values('3', 'OCEANS ELEVEN', 4543, NULL);
insert into COPY values('4', 'MAD MAX', NULL, 6655);
insert into COPY values('5', 'DADDYS HOME', 7709, NULL);
insert into COPY values('6', 'AVA', 9009, NULL);
insert into COPY values('7', 'HOOK', NULL, 8801);
insert into COPY values('8', 'RUN', 2202, NULL);
insert into COPY values('9', 'MAD MAX', NULL, 1889);

insert into MEMBER values(1111, 'GARY', 'JOHNSON', '919-442-4444', '9101 FAYETTEVILLE RD, RALEIGH, NC');
insert into MEMBER values(1221, 'JOHN', 'DOE', '919-555-5532', '6600 LOUISBURG RD, RALEIGH, NC');
insert into MEMBER values(2112, 'MIKE', 'MYERS', '919-888-9999', '2901 HOLSTON LN, RALEIGH, NC 27610');
insert into MEMBER values(3344, 'WILL', 'GERALD', '919-443-2211', '3200 BUSH ST, RALEIGH, NC 27609');

insert into RENTAL values(1112, 1, TO_DATE('05/08/2020', 'MM/DD/YYYY'), 1221);
insert into RENTAL values(1113, 2, TO_DATE('05/09/2020', 'MM/DD/YYYY'), 2112);
insert into RENTAL values(1114, 4, TO_DATE('05/11/2020', 'MM/DD/YYYY'), 1111);
insert into RENTAL values(1115, 3, TO_DATE('05/11/2020', 'MM/DD/YYYY'), 1221);
insert into RENTAL values(1116, 5, TO_DATE('05/12/2020', 'MM/DD/YYYY'), 3344);
insert into RENTAL values(1117, 4, TO_DATE('05/12/2020', 'MM/DD/YYYY'), 3344);
insert into RENTAL values(1118, 8, TO_DATE('05/12/2020', 'MM/DD/YYYY'), 1111);
insert into RENTAL values(1119, 1, TO_DATE('05/13/2020', 'MM/DD/YYYY'), 1221);


