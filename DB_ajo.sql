DROP TABLE APP.EHDOKKAAT;
DROP TABLE APP.KYSYMYKSET;
DROP TABLE APP.VASTAUKSET;

CREATE TABLE APP.EHDOKKAAT (
   EHDOKAS_ID INTEGER NOT NULL,
   SUKUNIMI VARCHAR(25),
   ETUNIMI VARCHAR(25),
   PUOLUE VARCHAR(50),
   KOTIPAIKKAKUNTA VARCHAR(25),
   IK� INTEGER,
   MIKSI_EDUSKUNTAAN VARCHAR(250),
   MITA_ASIOITA_HALUAT_EDISTAA VARCHAR(2000),
   AMMATTI VARCHAR(50),
   PRIMARY KEY (EHDOKAS_ID)
);

CREATE TABLE APP.KYSYMYKSET (
   KYSYMYS_ID INTEGER NOT NULL,
   KYSYMYS VARCHAR(100),
   PRIMARY KEY (KYSYMYS_ID)
);

CREATE TABLE APP.VASTAUKSET (
   EHDOKAS_ID INTEGER NOT NULL,
   KYSYMYS_ID INTEGER NOT NULL,
   VASTAUS INTEGER,
   KOMMENTTI VARCHAR(50),
   PRIMARY KEY (EHDOKAS_ID, KYSYMYS_ID)
);

INSERT INTO EHDOKKAAT VALUES (1, 'Ahvenj�rvi', 'Joel', 'Suomen Kristillisdemokraatit (KD)', 'Uurainen', 86, 'Mieluiten tekisin aivan muuta, mutta valtakunta on korjattava. Tulen toimeen noin kahdeksalla kielell� ja olen perehtynyt monen alan asioihin. Kaupunkilais- ja maalaisj�rke�.', 'Haluan edistaa Suomea, jossa kenenk��n ei tarvitse k�rsi� puutetta tai voimattomuuden tunnetta omiin asioihinsa vaikuttamisesta.', 'Kansanedustaja');
INSERT INTO EHDOKKAAT VALUES (2, 'Aintila', 'Henrik Jeremias', 'Suomen ruotsalainen kansanpuolue', 'Helsinki', 47, 'Olen puheeni pit�v�, monipuolisesti asioita harkitseva, perusteellisesti asiat selvitt�v�, erilaisissa yhteis�iss�, yritysmaailmassa ja julkishallinnossa toiminut kolmen lapsen �iti.', '- Inhimillinen toimeentulo ja aito tasa-arvo kaikille statuksesta riippumatta  - Aito itsem��r��misoikeus ja puolueettomuus  - Kansan hyvinvointi yritysvoittojen edelle  - Avoimuus k�sitelt�vist� asioista!', 'L�hihoitaja');
INSERT INTO EHDOKKAAT VALUES (3, 'Aittakumpu', 'Alviina', 'Vasemmistoliitto', 'J�ms�', 46, 'Tied�n erilaisia vaiettuja ep�kohtia. Esimerkiksi korruptioon ja ep�rehellisyyteen liittyvi� asioita. Jotta demokratia toimisi niin on vaadittavaa t�ytt� rehellisyytt�.', 'Suomen markka euron rinnalle, ja sit� my�t� Suomen sis�inen talous kuntoon. Ty�paikkoja julkiselle ja yksityiselle sektorille; investointeja ja perustuloa Suomen markalla; yritysten toimintaedellytykset huomattavasti helpommiksi ja ty�llist�minen kannustavaksi. Veroparatiisikikkailu kuriin mm. rinnakkaisvaluutan avulla.', 'Opettaja, kansanedustaja');
INSERT INTO EHDOKKAAT VALUES (4, 'Ala-Kokko', 'Henri', 'Vihre� liitto', 'Espoo', 87, 'Kuljen aate edell�, itsen�isyyden, maaseudun, suomalaisuuden ja sosiaalisen oikeudenmukaisuuden puolesta.', 'Vanhusten ja omaishoitajien asemaa t�ytyy parantaa tulevalla vaalikaudella. Vanhustenpalveluihin ei voida tehd� lis�� leikkauksia ja ennaltaehk�iseviin palveluihin t�ytyy l�yty� lis�� rahaa. Omaishoidon tukea t�ytyy korottaa ja jokaiselle omaishoitajalle pit�� j�rjest�� tarpeeksi vapaap�ivi�. Nuorten ty�llistymist� pit�� tukea ja heid�n ty�olojaan t�ytyy valvoa. Meill� on paljon ahkeria nuoria, jotka tarvitsevat ensimm�isest� ty�paikastaan positiivisen kokemuksen.', 'R�ntgenhoitaja, p��luottamusmies');
INSERT INTO EHDOKKAAT VALUES (5, 'Ala-Nissil�', 'Benjamin', 'Suomen Keskusta', 'Lappaj�rvi', 26, 'Haluan muutosta nykyiseen hallitustoimintaan, toiminta ei ole vastannut Katainen-Stubb -hallituksen odotuksia, valtiolla on enemm�n velkaa kuin koskaan', 'Suomen ero EU:sta. Kansallisen keskuspankin liikkeelle laskeman oman valuutan k�ytt��notto Suomessa. Suomen ja NATO:n v�lill� solmitun is�nt�maasopimuksen irtisanominen ja palaaminen puoluettomuuteen. Hyvinvointivaltion palvelujen turvaaminen oman keskuspankin, kansallisen valuutan ja itsen�isen talouspolitiikan avustuksella.', 'Metallimies');
INSERT INTO EHDOKKAAT VALUES (6, 'Ala-Reinikka', 'Karl-Mikael', 'Kansallinen Kokoomus', 'Mustasaari', 37, 'Koska olen rohkea ja rehellinen. - Ylip��ns�kin eduskuntaan pit�isi valita vain niit�, joilla on oikeanlainen kasvatus ja koulutus. Pissap�iset nousukkaat ovat tuhoneet Suomen.', '- Uudistusta ty�el�m��n ja koulutuslaitoksiin - ihmisten yksil�llisyys otettava huomioon joustavilla ty�ajoilla, liikkuvalla ty�ll�, opettamismetodeilla. 8 h/pv� systemi on vanhanaikainen ja kaipaa uudistusta. Enemm�n luovuutta ty�el�m��n! K', 'Liikunnan lehtori');
INSERT INTO EHDOKKAAT VALUES (7, 'Alamets�', 'Vilja', 'Vihre� liitto', 'Kotka', 82, 'Mik�li haluat saman menon jatkuvan seuraavankin vaalikauden, ohita t�m� ehdokas. Mik�li haluat muutosta niin olet oikeassa osoitteessa.', 'Ehdottomasti p��llim�isen� asiana on hyvien suhteiden rakentaminen muihinkin kuin EU-maihin. Tarvitsemme enemm�n kaupank�ynti� jotta vientimme nousee ja saamme uusia ty�paikkoja s�ilytt�en nykyisetkin.', 'Juniorij��kiekkoseuran yhteysp��llikk�');
INSERT INTO EHDOKKAAT VALUES (8, 'Alanko-Kahiluoto', 'Sara', 'Vihre� liitto', 'Nokia', 21, 'Haluan vaikuttaa politiikan kautta yhteiskunnan hyvinvointiin.', 'Pohjoismaisen hyvinvointiyhteiskunnan turvaaminen moderniin rahateoriaan (uuschartalismiin) perustuvalla talousj�rjestelm�ll�.    Suomen sotilaallisen liittoutumattomuuden ja ulkopoliittisen puolueettomuuden puolustaminen.     Sivistysyliopiston ja voittoa tuottamattoman tutkimuksen tukeminen.     Mainittuihin asioihin sis�ltyv�t EU-, EMU-, Nato- ja TTIP-j�senyyksien vastustaminen.', '�idinkielen ja kirjallisuuden lehtori');
INSERT INTO EHDOKKAAT VALUES (9, 'Alasalmi', 'Otto', 'Suomen Sosialidemokraattinen Puolue', 'Varkaus', 30, 'Suomi kaipaa uusia ideoita ja niit� minulta l�ytyy.  T�m� maa kaipaa yhteisty�t�.  Katson eteenp�in, uskon parempaan ja puolustan heikoimpia.', 'EU:sta eroaminen on t�rkeint�! En ole tehnyt koskaan palkkaty�t�, joten yritt�jyys on my�s syd�mmen asia! Ei NATO, ei EU, ei TTIP, ei GMO ei �uro! KYLL� ITSEN�ISYYS JA KANSANVALTA! Suomeen tulee saada my�s perustuslakituomioistuin joka valvoo hallituksen tekemisi� ja p��t�ksien laillisuutta! ETA-sopimus riitt�� meille! Se takaa koulutuksen, liikkumisen ja kaupank�ynnin EU:n alueella!', 'Freelancer-kirjoittaja');
INSERT INTO EHDOKKAAT VALUES (10, 'Alatalo', 'Cosmo', 'Suomen Keskusta', 'Tampere', 68, 'Olen tarmokas yhteisten asioiden hoitaja ja minulla on 20 vuoden kokemus ihmisten asioiden hoitamisesta. Viime kunnallisvaaleissa sain luottamuksen osoituksena ��niharavan aseman kaupungissani.', 'Poliitikot eiv�t luo ty�paikkoja, vaan rakentavat raamit. Ty�llisyysaste on saatava nostettua Ruotsin tasolle, ja rakenteellisia uudistuksia julkisella sektorilla sek� my�s ty�markkinoilla on teht�v�, jotta ty�n verotusta ja ty�llistymisen esteit� voidaan olennaisesti pienent��.     Turhaa yritt�jyytt� ja talousel�m�� kuristavaa s��nt�jen ja kieltojen viidakkoa pit�� v�hent��.     Tulen paneutumaan ty�tt�myyden ja syrj�ytymisen ehk�isemiseen.', 'Opiskelija / Ty�ntekij�');
INSERT INTO EHDOKKAAT VALUES (11, 'Albert', 'Essi', 'Suomen Keskusta', 'Turku', 47, 'Vaikka se kliseiselt� kuulostaakin, ajaisin kaikkien asiota eduskunnassa, eik� minulla ole h�m�ri� motiiveja. Eduskunnassa haluan luoda yhteiskuntaa, jossa kaikille riitt�� rakkautta.', 'Tasapainoista valtiontaloutta, uskottavaa puolustuskyky�, turvallista arkea, koulutuksen monipuolisuutta ja suurempaa yksil�nvapautta.', 'N�rtti');
INSERT INTO EHDOKKAAT VALUES (12, 'Al�n', 'Mikko', 'Itsen�isyyspuolue', 'Kuopio', 82, 'Tavoitteenani on tuode tuoreita ja moderneja ajatuksia valtaapit�vien puolueiden kurjistamalle poliittiselle kent�lle.  Pienen puoleen ehdokkaana vanhuksien m��ritt�m� puoluekuri ei rajoita minua.', 'J�RKE� S��NTELYYN, TILAA TY�LLE JA VALINNOILLE.  Suomi tarvitsee ty�t� ja liikett�. Turhaa byrokratiaa ja ylis��ntely� pit�� purkaa, jotta yritt�jyydelle, toimeliaisuudelle ja arjen valinnoille syntyy tilaa. Esimerkiksi kaupan aukioloaikojen ja sijainnin s��ntely� tulee vapauttaa. Erityisesti pk-yritysten velvoitteita pit�� kevent��. Lakien vaikutukset on arvioitava paremmin.    LAPSILLE, NUORILLE JA PERHEILLE ASIAN AJAJA  Perheet tarvitsevat tukea ja joustoja ty�n ja perheen yhteensovittamiseksi. Kotihoidontuen jakaminen on perheen oma asia. Suomalaisesta laadukkaasta varhaiskasvatuksesta ja koulutuksesta on pidett�v� kiinni, eik� koulutuksesta ole en�� varaa leikata.    ARJEN TURVALLISUUTTA JA VAHVEMPAA OIKEUSTURVAA  Arjen turvallisuutta ja oikeusturvaa tulee vahvistaa. Poliisin, oikeuslaitoksen ja puolustusvoimien toimintakyky on turvattava. T�m� edellytt�� riitt�vi� voimavaroja ja uudistuksia. Vakavien henkeen ja terveyteen, erityisesti lapsiin kohdistuvien rikosten rangaistuksia tulee koventaa.', 'Esiintyv� taiteilija, showmies, itsens�nolaaja');
INSERT INTO EHDOKKAAT VALUES (13, 'Alho', 'Inna ', 'Kansallinen Kokoomus', 'Kouvola', 62, 'Haluan edist�� kokonaisvaltaisen hyvinvoinnin kasvua ilman eturyhm�polittista suuntautumista.', 'Tahdon olla mukana rakentamassa vastuullista ja kannustavaa yhteiskuntaa, jossa sivistykseen panostetaan. Ty�llisyyden edist�minen ja koulutukseen panostaminen ovat tulevaisuuden hyvinvoinnin kannalta keskeisi� asioita. Ty� on hyvinvoinnin tae niin yksil�n kuin yhteis�n tasolla. Siksi ty�llist�misen esteit� pit�� purkaa. Koulutus on avain tulevaisuuteen - nyt on aika alkaa kehitt�� suomalaista koulua ja oppimista!', '"Uuden ajan sekaty�mies"');
INSERT INTO EHDOKKAAT VALUES (14, 'Alhoj�rvi', 'Mikael ', 'Suomen Kommunistinen Puolue', 'Lappeenranta', 19, 'Toisin eduskuntaan en vain yht�, vaan useita uusia n�k�kulmia.', 'Perusoikeuksien puolesta taistelija. L�pin�kyvyytt�, luotettavuutta ja oikeudenmukaisuutta p��t�ksentekoon. Lupauksistaan kiinni pit�v�, takki ei k��nny vaalien j�lkeenk��n.', 'Everstiluutnantti evp, taksin kuljettaja');
INSERT INTO EHDOKKAAT VALUES (15, 'Alhonnoro', 'Jasmine ', 'Vihre� liitto', 'Tampere', 53, 'Olen valmis ajamaan suurempiakin rakenne uudistuksia suomen kilpailukyvyn parantamiseksi. Luotan suomalaisiin, ett� he itse tiet�v�t mik� on parasta heille itselleen eik� niink��n valtiovalta.', 'Pitk�aikainen kokemus ihmisten parissa tomimisessa - ty�, yritys, urheilu sek� j�rjest�jen parissa. Kunnallispolitiikassa toimiminen jo 80 - 90 luvuilla...', 'Valokuvaaja, ark.yo');
INSERT INTO EHDOKKAAT VALUES (16, 'Alij�rvi', 'Daniel', 'Suomen Sosialidemokraattinen Puolue', 'Helsinki', 20, 'Pid�n sanani', 'P��t�ksenteko kaipaa osaavia, yhteisty�kykyisi�, kokeneita ja hyv�t johtamistaidot omaavia tulevia kansanedustajia.', 'erityisasiantuntija');
INSERT INTO EHDOKKAAT VALUES (17, 'Allahmoradi', 'Tuomas', 'Vasemmistoliitto', 'Inkoo', 73, 'F�r att det beh�v n�gon som f�r fram de liberala borgerliga v�rderingarna och n�gon som inte �r r�dd att fatta ocks� sv�ra beslut.', 'Oma maa mansikka, muu maa mustikka', 'Mediapastori');
INSERT INTO EHDOKKAAT VALUES (18, 'Anderson', 'Otto', 'Suomen ruotsalainen kansanpuolue', 'Vantaa', 45, 'Minulla on erityisavustajaty�ni kautta vankka kokemus valtakunnan poliitikasta. Hallitsen eri kiemurat ja tied�n miten asiat saadaan maaliin.', 'Eduskuntaan tarvitaan piraatti. Teknologinen kehitys on yhteiskunnan suurin muutosvoima ja se pit�� huomioida p��t�ksentekoprosessissa. Olen DI/fyysikko sek� opettaja ja osaava vaikuttaja.', 'maa- ja mets�talouden harjoittaja, sijaispappi');
INSERT INTO EHDOKKAAT VALUES (19, 'Andersson ', 'Cosmo', 'Vasemmistoliitto', 'Joensuu', 41, 'Minusta saisi omistautuneet kansanedustajan jolla on vapauteen ja sosiaaliseen oikeudenmukaisuuteen pohjautuvat arvot, vahvat mielipiteet ja kyky� yhteisty�h�n.', 'Olen uskonnoton yksil�nvapauden kannattaja.  NATO my�nteinen, ydinvoiman kannattaja.', 'Kansanedustaja');
INSERT INTO EHDOKKAAT VALUES (20, 'Andersson', 'Essi', 'Suomen ruotsalainen kansanpuolue', 'Kouvola', 63, 'SUOMEN TALOUSN�KYM�T OVAT KATASTROFAALISIA  On t�rke� alkaa kohottamaan Suomen taloutta.   Sit� varten pit�� saada p��t�svallan Suomeen  eroamalla EU:sta ja jostakin muista liitoista.', 'Mnulla on fysiikan tohtorina vahva tieteellinen koulutus ja ohjelmistoyritt�j�n� paljon kokemusta yhteiskunnasta, ml. julkishallinnosta. N�kemys ja kyky uudistuksiin on vahvuuteni.', 'rakennusmestari');


INSERT INTO KYSYMYKSET VALUES (1, 'Suomessa on liian helppo el�� sosiaaliturvan varassa');
INSERT INTO KYSYMYKSET VALUES (2, 'Kaupan ja muiden liikkeiden aukioloajat on vapautettava.');
INSERT INTO KYSYMYKSET VALUES (3, 'Suomessa on siirrytt�v� perustuloon joka korvaisi nykyisen sosiaaliturvan v�himm�istason.');
INSERT INTO KYSYMYKSET VALUES (4, 'Ty�ntekij�lle on turvattava lailla minimity�aika.');
INSERT INTO KYSYMYKSET VALUES (5, 'Ansiosidonnaisen ty�tt�myysturvan kestoa pit�� lyhent��.');
INSERT INTO KYSYMYKSET VALUES (6, 'Euron ulkopuolella Suomi p�rj�isi paremmin.');
INSERT INTO KYSYMYKSET VALUES (7, 'Ruoan verotusta on varaa kirist��.');
INSERT INTO KYSYMYKSET VALUES (8, 'Valtion ja kuntien taloutta on tasapainotettava ensisijaisesti leikkaamalla menoja.');
INSERT INTO KYSYMYKSET VALUES (9, 'Lapsilisi� on korotettava ja laitettava verolle.');
INSERT INTO KYSYMYKSET VALUES (10, 'Suomella ei ole varaa nykyisen laajuisiin sosiaali- ja terveyspalveluihin.');
INSERT INTO KYSYMYKSET VALUES (11, 'Nato-j�senyys vahvistaisi Suomen turvallisuuspoliittista asemaa.');
INSERT INTO KYSYMYKSET VALUES (12, 'Suomeen tarvitaan enemm�n poliiseja.');
INSERT INTO KYSYMYKSET VALUES (13, 'Maahanmuuttoa Suomeen on rajoitettava terrorismin uhan vuoksi.');
INSERT INTO KYSYMYKSET VALUES (14, 'Ven�j�n etupiiripolitiikka on uhka Suomelle.');
INSERT INTO KYSYMYKSET VALUES (15, 'Verkkovalvonnassa valtion turvallisuus on t�rke�mp�� kuin kansalaisten yksityisyyden suoja.');
INSERT INTO KYSYMYKSET VALUES (16, 'Suomen on osallistuttava Isisin vastaiseen taisteluun kouluttamalla Irakin hallituksen joukkoja.');
INSERT INTO KYSYMYKSET VALUES (17, 'Parantumattomasti sairaalla on oltava oikeus avustettuun kuolemaan.');
INSERT INTO KYSYMYKSET VALUES (18, 'Terveys- ja sosiaalipalvelut on tuotettava ensijaisesti julkisina palveluina.');
INSERT INTO KYSYMYKSET VALUES (19, 'Viranomaisten pit�� puuttua lapsiperheiden ongelmiin nykyist� herkemmin.');


INSERT INTO VASTAUKSET VALUES  (1, 1, 2, 'ehdokkaan 1 vastaus kysymykseen 1');
INSERT INTO VASTAUKSET VALUES  (1, 2, 4, 'ehdokkaan 1 vastaus kysymykseen 2');
INSERT INTO VASTAUKSET VALUES  (1, 3, 3, 'ehdokkaan 1 vastaus kysymykseen 3');
INSERT INTO VASTAUKSET VALUES  (1, 4, 2, 'ehdokkaan 1 vastaus kysymykseen 4');
INSERT INTO VASTAUKSET VALUES  (1, 5, 1, 'ehdokkaan 1 vastaus kysymykseen 5');
INSERT INTO VASTAUKSET VALUES  (1, 6, 2, 'ehdokkaan 1 vastaus kysymykseen 6');
INSERT INTO VASTAUKSET VALUES  (1, 7, 5, 'ehdokkaan 1 vastaus kysymykseen 7');
INSERT INTO VASTAUKSET VALUES  (1, 8, 2, 'ehdokkaan 1 vastaus kysymykseen 8');
INSERT INTO VASTAUKSET VALUES  (1, 9, 4, 'ehdokkaan 1 vastaus kysymykseen 9');
INSERT INTO VASTAUKSET VALUES  (1, 10, 1, 'ehdokkaan 1 vastaus kysymykseen 10');
INSERT INTO VASTAUKSET VALUES  (1, 11, 1, 'ehdokkaan 1 vastaus kysymykseen 11');
INSERT INTO VASTAUKSET VALUES  (1, 12, 2, 'ehdokkaan 1 vastaus kysymykseen 12');
INSERT INTO VASTAUKSET VALUES  (1, 13, 4, 'ehdokkaan 1 vastaus kysymykseen 13');
INSERT INTO VASTAUKSET VALUES  (1, 14, 5, 'ehdokkaan 1 vastaus kysymykseen 14');
INSERT INTO VASTAUKSET VALUES  (1, 15, 3, 'ehdokkaan 1 vastaus kysymykseen 15');
INSERT INTO VASTAUKSET VALUES  (1, 16, 1, 'ehdokkaan 1 vastaus kysymykseen 16');
INSERT INTO VASTAUKSET VALUES  (1, 17, 4, 'ehdokkaan 1 vastaus kysymykseen 17');
INSERT INTO VASTAUKSET VALUES  (1, 18, 4, 'ehdokkaan 1 vastaus kysymykseen 18');
INSERT INTO VASTAUKSET VALUES  (1, 19, 3, 'ehdokkaan 1 vastaus kysymykseen 19');
INSERT INTO VASTAUKSET VALUES  (2, 1, 3, 'ehdokkaan 2 vastaus kysymykseen 1');

