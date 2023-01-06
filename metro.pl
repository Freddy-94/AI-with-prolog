/*****************************************************************************
 * Programa: metro.pl
 * Autor: Alfredo Bernal Luna
 * Fecha: 28/09/21
 *
 * Descripción. Tarea #3. Grafo del sistema Metro de la CDMX.
 *              Este programa representa el mapa completo del sistema 
 *              metro de la CDMX. Además, presenta los predicados  
 *              necesarios para informar a un usuario sobre la mejor y             
 *              peor ruta (en tiempo) entre dos estaciones cualesquiera.
 * 
 *				Considerando el grafo como dirigido y etiquetado, el 
 *				tiempo asociado a cada arista se calcula como:
 *				
 *				((5 min) * g ) + n*(10 min)
 *				
 *				Dónde g es el grado de entrada al vértice destino de la 
 *				arista, y n es el número de trasbordos posibles en el 
 *			    vértice destino de la arista. 
 *
 *				Predicados relevantes:
 *				 bienvenida
 *				 mejorRuta
 *               peorRuta
 *				 *todasLasRutas (Ya viene incluída en mejorRuta y peorRuta. 
 *				  Sin embargo, se incluye como un predicado adicional).
 *******************************************************************************/
 
 
/**************************************************************
 *
 * Grafo del metro de la CDMX  (Base de conocimiento)
 *
 **************************************************************/ 
 
% Inicio Línea 1 (rosa) del metro de la CDMX
arco(observatorio, tacubaya, 45). % estación terminal
arco(tacubaya, juanacatlan, 10).
arco(juanacatlan, chapultepec, 10).
arco(chapultepec, sevilla, 10).
arco(sevilla, insurgentes, 10).
arco(insurgentes, cuauhtemoc, 10).
arco(cuauhtemoc, balderas, 30).
arco(balderas, saltoDelAgua, 30).
arco(saltoDelAgua, isabelLaCatolica, 10).
arco(isabelLaCatolica, pinoSuarez, 30).
arco(pinoSuarez, merced, 10).
arco(merced, candelaria, 30).
arco(candelaria, sanLazaro, 30).
arco(sanLazaro, moctezuma, 10).
arco(moctezuma, balbuena, 10).
arco(balbuena, boulevardPtoAereo, 10).
arco(boulevardPtoAereo, gomezFarias, 10).
arco(gomezFarias, zaragoza, 10).
arco(zaragoza, pantitlan, 50). % estación terminal
arco(pantitlan, zaragoza, 10). % estación terminal
arco(zaragoza, gomezFarias, 10).
arco(gomezFarias, boulevardPtoAereo, 10).
arco(boulevardPtoAereo, balbuena, 10).
arco(balbuena, moctezuma, 10).
arco(moctezuma, sanLazaro, 30).
arco(sanLazaro, candelaria, 30).
arco(candelaria, merced, 10).
arco(merced, pinoSuarez, 30).
arco(pinoSuarez, isabelLaCatolica, 10).
arco(isabelLaCatolica, saltoDelAgua, 30).
arco(saltoDelAgua, balderas, 30).
arco(balderas, cuauhtemoc, 10).
arco(cuauhtemoc, insurgentes, 10).
arco(insurgentes, sevilla, 10).
arco(sevilla, chapultepec, 10).
arco(chapultepec, juanacatlan, 10).
arco(juanacatlan, tacubaya, 45).
arco(tacubaya, observatorio, 5). % estación terminal
% Fin Línea 1 (rosa) del metro de la CDMX

% Inicio Línea 2 (azul rey) del metro de la CDMX
arco(cuatroCaminos, panteones, 10). % estación terminal
arco(panteones, tacuba, 30).
arco(tacuba, cuitlahuac, 10).
arco(cuitlahuac, popotla, 10).
arco(popotla, colegioMilitar, 10).
arco(colegioMilitar, normal, 10).
arco(normal, sanCosme, 10).
arco(sanCosme, revolucion, 10).
arco(revolucion, hidalgo, 30).
arco(hidalgo, bellasArtes, 30).
arco(bellasArtes, allende, 10).
arco(allende, zocalo, 10).
arco(zocalo, pinoSuarez, 30).
arco(pinoSuarez, sanAntonioAbad, 10).
arco(sanAntonioAbad, chabacano, 50).
arco(chabacano, viaducto, 10).
arco(viaducto, xola, 10).
arco(xola, villaDeCortes, 10).
arco(villaDeCortes, nativitas, 10).
arco(nativitas, portales, 10).
arco(portales, ermita, 30).
arco(ermita, generalAnaya, 10).
arco(generalAnaya, tasquena, 5). % estación terminal
arco(tasquena, generalAnaya, 10). % estación terminal
arco(generalAnaya, ermita, 30).
arco(ermita, portales, 10). 
arco(portales, nativitas, 10).
arco(nativitas, villaDeCortes, 10).
arco(villaDeCortes, xola, 10).
arco(xola, viaducto, 10).
arco(viaducto, chabacano, 50).
arco(chabacano, sanAntonioAbad, 10).
arco(sanAntonioAbad, pinoSuarez, 30).
arco(pinoSuarez, zocalo, 10).
arco(zocalo, allende, 10).
arco(allende, bellasArtes, 30).
arco(bellasArtes, hidalgo, 30).
arco(hidalgo, revolucion, 10).
arco(revolucion, sanCosme, 10).
arco(sanCosme, normal, 10).
arco(normal, colegioMilitar, 10).
arco(colegioMilitar, popotla, 10).
arco(popotla, cuitlahuac, 10).
arco(cuitlahuac, tacuba, 30).
arco(tacuba, panteones, 10).
arco(panteones, cuatroCaminos, 5). % estación terminal
% Fin Línea 2 (azul rey) del metro de la CDMX

% Inicio Línea 3 (verde olivo) del metro de la CDMX
arco(indiosVerdes, deportivo18Marzo, 30). % estación terminal
arco(deportivo18Marzo, potrero, 10).
arco(potrero, laRaza, 30).
arco(laRaza, tlatelolco, 10).
arco(tlatelolco, guerrero, 30).
arco(guerrero, hidalgo, 30).
arco(hidalgo, juarez, 10).
arco(juarez, balderas, 30).
arco(balderas, ninosHeroes, 10).
arco(ninosHeroes, hospitalGeneral, 10).
arco(hospitalGeneral, centroMedico, 30).
arco(centroMedico, etiopiaPlazaTransparencia, 10).
arco(etiopiaPlazaTransparencia, eugenia, 10).
arco(eugenia, divisionDelNorte, 10).
arco(divisionDelNorte, zapata, 30).
arco(zapata, coyoacan, 10).
arco(coyoacan, viverosDerechosHumanos, 10).
arco(viverosDerechosHumanos, miguelAngelDeQuevedo, 10).
arco(miguelAngelDeQuevedo, copilco, 10).
arco(copilco, universidad, 5). % estación terminal
arco(universidad, copilco, 10). % estación terminal
arco(copilco, miguelAngelDeQuevedo, 10).
arco(miguelAngelDeQuevedo, viverosDerechosHumanos, 10).
arco(viverosDerechosHumanos, coyoacan, 10).
arco(coyoacan, zapata, 30).
arco(zapata, divisionDelNorte, 10).
arco(divisionDelNorte, eugenia, 10).
arco(eugenia, etiopiaPlazaTransparencia, 10).
arco(etiopiaPlazaTransparencia, centroMedico, 30).
arco(centroMedico, hospitalGeneral, 10).
arco(hospitalGeneral, ninosHeroes, 10).
arco(ninosHeroes, balderas, 30).
arco(balderas, juarez, 10).
arco(juarez, hidalgo, 30).
arco(hidalgo, guerrero, 30).
arco(guerrero, tlatelolco, 10).
arco(tlatelolco, laRaza, 30).
arco(laRaza, potrero, 10).
arco(potrero, deportivo18Marzo, 30).
arco(deportivo18Marzo, indiosVerdes, 5). % estación terminal  
% Fin Línea 3 (verde olivo) del metro de la CDMX

% Inicio Línea 4 (azul claro) del metro de la CDMX
arco(martinCarrera, talisman, 10). % estación terminal
arco(talisman, bondojito, 10).
arco(bondojito, consulado, 30).
arco(consulado, canalDelNorte, 10).
arco(canalDelNorte, morelos, 30).
arco(morelos, candelaria, 30).
arco(candelaria, frayServando, 10).
arco(frayServando, jamaica, 30).
arco(jamaica, santaAnita, 25). % estación terminal
arco(santaAnita, jamaica, 30). % estación terminal
arco(jamaica, frayServando, 10).
arco(frayServando, candelaria, 30).
arco(candelaria, morelos, 30).
arco(morelos, canalDelNorte, 10).
arco(canalDelNorte, consulado, 30).
arco(consulado, bondojito, 10).
arco(bondojito, talisman, 10).
arco(talisman, martinCarrera, 20). % estación terminal
% Fin de Línea 4 (azul claro) del metro de la CDMX

% Inicio Línea 5 (amarillo) del metro de la CDMX
arco(politecnico, institutoDelPetroleo, 30). % estación terminal
arco(institutoDelPetroleo, autobusesDelNorte, 10).
arco(autobusesDelNorte, laRaza, 30).
arco(laRaza, misterios, 10).
arco(misterios, valleGomez, 10).
arco(valleGomez, consulado, 30).
arco(consulado, eduardoMolina, 10).
arco(eduardoMolina, aragon, 10).
arco(aragon, oceania, 30).
arco(oceania, terminalAerea, 10).
arco(terminalAerea, hangares, 10).
arco(hangares, pantitlan, 50). % estación terminal
arco(pantitlan, hangares, 10). % estación terminal
arco(hangares, terminalAerea, 10).
arco(terminalAerea, oceania, 30).
arco(oceania, aragon, 10).
arco(aragon, eduardoMolina, 10).
arco(eduardoMolina, consulado, 30).
arco(consulado, valleGomez, 10).
arco(valleGomez, misterios, 10).
arco(misterios, laRaza, 30).
arco(laRaza, autobusesDelNorte, 10).
arco(autobusesDelNorte, institutoDelPetroleo, 30).
arco(institutoDelPetroleo, politecnico, 5). % estación terminal
% Fin Línea 5 (amarillo) del metro de la CDMX

% Inicio Línea 6 (roja) del metro de la CDMX
arco(elRosario, tezozomoc, 10). % estación terminal
arco(tezozomoc, azcapotzalco, 10).
arco(azcapotzalco, ferreriaArenaCDMX, 10).
arco(ferreriaArenaCDMX, norte45, 10).
arco(norte45, vallejo, 10).
arco(vallejo, institutoDelPetroleo, 30).
arco(institutoDelPetroleo, lindavista, 10).
arco(lindavista, deportivo18Marzo, 30).
arco(deportivo18Marzo, laVillaBasilica, 10).
arco(laVillaBasilica, martinCarrera, 20). % estación terminal
arco(martinCarrera, laVillaBasilica, 10). % estación terminal
arco(laVillaBasilica, deportivo18Marzo, 30).
arco(deportivo18Marzo, lindavista, 10).
arco(lindavista, institutoDelPetroleo, 30).
arco(institutoDelPetroleo, vallejo, 10).
arco(vallejo, norte45, 10).
arco(norte45, ferreriaArenaCDMX, 10).
arco(ferreriaArenaCDMX, azcapotzalco, 10).
arco(azcapotzalco, tezozomoc, 10).
arco(tezozomoc, elRosario, 20). % estación terminal
% Fin de Línea 6 (roja) del metro de la CDMX

% Inicio Línea 7 (naranja) del metro de la CDMX
arco(elRosario, aquilesSerdan, 10). % estación terminal
arco(aquilesSerdan, camarones, 10).
arco(camarones, refineria, 10).
arco(refineria, tacuba, 30).
arco(tacuba, sanJoaquin, 10).
arco(sanJoaquin, polanco, 10).
arco(polanco, auditorio, 10).
arco(auditorio, constituyentes, 10).
arco(constituyentes, tacubaya, 45).
arco(tacubaya, snPedroDeLosPinos, 10).
arco(snPedroDeLosPinos, snAntonio, 10).
arco(snAntonio, mixcoac, 25).
arco(mixcoac, barrancaDelMuerto, 5). % estación terminal
arco(barrancaDelMuerto, mixcoac, 25). % estación terminal
arco(mixcoac, snAntonio, 10).
arco(snAntonio, snPedroDeLosPinos, 10).
arco(snPedroDeLosPinos, tacubaya, 45).
arco(tacubaya, constituyentes, 10).
arco(constituyentes, auditorio, 10).
arco(auditorio, polanco, 10). 
arco(polanco, sanJoaquin, 10).
arco(sanJoaquin, tacuba, 30).
arco(tacuba, refineria, 10).
arco(refineria, camarones, 10).
arco(camarones, aquilesSerdan, 10).
arco(aquilesSerdan, elRosario, 20). % estación terminal
% Fin de Línea 7 (naranja) del metro de la CDMX

% Inicio Línea 8 (verde) del metro de la CDMX
arco(garibaldiLagunilla, bellasArtes, 30). % estación terminal
arco(bellasArtes, sanJuanDeLetran, 10).
arco(sanJuanDeLetran, saltoDelAgua, 30).
arco(saltoDelAgua, doctores, 10).
arco(doctores, obrera, 10).
arco(obrera, chabacano, 50).
arco(chabacano, laViga, 10).
arco(laViga, santaAnita, 25).
arco(santaAnita, coyuya, 10).
arco(coyuya, iztacalco, 10).
arco(iztacalco, apatlaco, 10).
arco(apatlaco, aculco, 10).
arco(aculco, escuadron201, 10).
arco(escuadron201, atlalilco, 30).
arco(atlalilco, iztapalapa, 10).
arco(iztapalapa, cerroDeLaEstrella, 10).
arco(cerroDeLaEstrella, uam, 10).
arco(uam, constDe1917, 5). % estación terminal
arco(constDe1917, uam, 10). % estación terminal
arco(uam, cerroDeLaEstrella, 10).
arco(cerroDeLaEstrella, iztapalapa, 10).
arco(iztapalapa, atlalilco, 30).
arco(atlalilco, escuadron201, 10).
arco(escuadron201, aculco, 10).
arco(aculco, apatlaco, 10).
arco(apatlaco, iztacalco, 10).
arco(iztacalco, coyuya, 10).
arco(coyuya, santaAnita, 25).
arco(santaAnita, laViga, 10).
arco(laViga, chabacano, 50).
arco(chabacano, obrera, 10).
arco(obrera, doctores, 10).
arco(doctores, saltoDelAgua, 30).
arco(saltoDelAgua, sanJuanDeLetran, 10).
arco(sanJuanDeLetran, bellasArtes, 30).
arco(bellasArtes, garibaldiLagunilla, 25). % estación terminal
% Fin Línea 8 (verde) del metro de la CDMX

% Inicio Línea 9 (cafe) del metro de la CDMX
arco(tacubaya, patriotismo, 10). % estación terminal
arco(patriotismo, chilpancingo, 10).
arco(chilpancingo, centroMedico, 30).
arco(centroMedico, lazaroCardenas, 10).
arco(lazaroCardenas, chabacano, 50).
arco(chabacano, jamaica, 30).
arco(jamaica, mixiuhca, 10).
arco(mixiuhca, velodromo, 10).
arco(velodromo, ciudadDeportiva, 10).
arco(ciudadDeportiva, puebla, 10).
arco(puebla, pantitlan, 50). % estación terminal
arco(pantitlan, puebla, 10). % estación terminal
arco(puebla, ciudadDeportiva, 10).
arco(ciudadDeportiva, velodromo, 10).
arco(velodromo, mixiuhca, 10).
arco(mixiuhca, jamaica, 30).
arco(jamaica, chabacano, 50).
arco(chabacano, lazaroCardenas, 10).
arco(lazaroCardenas, centroMedico, 30).
arco(centroMedico, chilpancingo, 10).
arco(chilpancingo, patriotismo, 10).
arco(patriotismo, tacubaya, 45). % estación terminal
% Fin Línea 9 (cafe) del metro de la CDMX

% Inicio Línea A (morada) del metro de la CDMX
arco(pantitlan, agricolaOriental, 10). % estación terminal
arco(agricolaOriental, canalDeSanJuan, 10).
arco(canalDeSanJuan, tepalcates, 10).
arco(tepalcates, guelatao, 10).
arco(guelatao, penonViejo, 10).
arco(penonViejo, acatitla, 10).
arco(acatitla, santaMarta, 10).
arco(santaMarta, losReyes, 10).
arco(losReyes, laPaz, 5). % estación terminal
arco(laPaz, losReyes, 10). % estación terminal
arco(losReyes, santaMarta, 10).
arco(santaMarta, acatitla, 10).
arco(acatitla, penonViejo, 10).
arco(penonViejo, guelatao, 10).
arco(guelatao, tepalcates, 10).
arco(tepalcates, canalDeSanJuan, 10).
arco(canalDeSanJuan, agricolaOriental, 10).
arco(agricolaOriental, pantitlan, 50). % estación terminal
% Fin Línea A (morada) del metro de la CDMX

% Inicio Línea B (gris) del metro de la CDMX
arco(buenavista, guerrero, 30).
arco(guerrero, garibaldiLagunilla, 25).
arco(garibaldiLagunilla, lagunilla, 10).
arco(lagunilla, tepito, 10).
arco(tepito, morelos, 30).
arco(morelos, sanLazaro, 30).
arco(sanLazaro, floresMagon, 10).
arco(floresMagon, romeroRubio, 10).
arco(romeroRubio, oceania, 30).
arco(oceania, deportivoOceania, 10).
arco(deportivoOceania, bosqueDeAragon, 10).
arco(bosqueDeAragon, villaDeAragon, 10).
arco(villaDeAragon, nezahualcoyotl, 10).
arco(nezahualcoyotl, impulsora, 10).
arco(impulsora, rioDeLosRemedios, 10).
arco(rioDeLosRemedios, muzquiz, 10).
arco(muzquiz, ecatepec, 10).
arco(ecatepec, olimpica, 10).
arco(olimpica, plazaAragon, 10).
arco(plazaAragon, ciudadAzteca, 5). % estación terminal
arco(ciudadAzteca, plazaAragon, 10). % estación terminal
arco(plazaAragon, olimpica, 10).
arco(olimpica, ecatepec, 10).
arco(ecatepec, muzquiz, 10).
arco(muzquiz, rioDeLosRemedios, 10).
arco(rioDeLosRemedios, impulsora, 10).
arco(impulsora, nezahualcoyotl, 10).
arco(nezahualcoyotl, villaDeAragon, 10).
arco(villaDeAragon, bosqueDeAragon, 10).
arco(bosqueDeAragon, deportivoOceania, 10).
arco(deportivoOceania, oceania, 30).
arco(oceania, romeroRubio, 10).
arco(romeroRubio, floresMagon, 10).
arco(floresMagon, sanLazaro, 30). 
arco(sanLazaro, morelos, 30).
arco(morelos, tepito, 10).
arco(tepito, lagunilla, 10).
arco(lagunilla, garibaldiLagunilla, 25).
arco(garibaldiLagunilla, guerrero, 30).
arco(guerrero, buenavista, 5). % estación terminal
% Fin Línea B (gris) del metro de la CDMX

% Inicio Línea 12 (dorada) del metro de la CDMX
arco(mixcoac, insurgentesSur, 10). % estación terminal
arco(insurgentesSur, hospital20DeNoviembre, 10).
arco(hospital20DeNoviembre, zapata, 30).
arco(zapata, parqueDeLosVenados, 10).
arco(parqueDeLosVenados, ejeCentral, 10).
arco(ejeCentral, ermita, 30).
arco(ermita, mexicaltzingo, 10).
arco(mexicaltzingo, atlalilco, 30).
arco(atlalilco, culhuacan, 10).
arco(culhuacan, sanAndresTomatlan, 10).
arco(sanAndresTomatlan, lomasEstrella, 10).
arco(lomasEstrella, calle11, 10).
arco(calle11, perifericoOte, 10).
arco(perifericoOte, tezonco, 10).
arco(tezonco, olivos, 10).
arco(olivos, nopalera, 10).
arco(nopalera, zapotitlan, 10).
arco(zapotitlan, tlaltenco, 10).
arco(tlaltenco, tlahuac, 5). % estación terminal
arco(tlahuac, tlaltenco, 10). % estación terminal
arco(tlaltenco, zapotitlan, 10).
arco(zapotitlan, nopalera, 10).
arco(nopalera, olivos, 10).
arco(olivos, tezonco, 10).
arco(tezonco, perifericoOte, 10).
arco(perifericoOte, calle11, 10).
arco(calle11, lomasEstrella, 10).
arco(lomasEstrella, sanAndresTomatlan, 10).
arco(sanAndresTomatlan, culhuacan, 10).
arco(culhuacan, atlalilco, 20).
arco(atlalilco, mexicaltzingo, 10).
arco(mexicaltzingo, ermita, 30).
arco(ermita, ejeCentral, 10).
arco(ejeCentral, parqueDeLosVenados, 10).
arco(parqueDeLosVenados, zapata, 30).
arco(zapata, hospital20DeNoviembre, 10).
arco(hospital20DeNoviembre, insurgentesSur, 10).
arco(insurgentesSur, mixcoac, 25). % estación terminal
% Fin Línea 12 (dorada) del metro de la CDMX 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% 								INICIO DE INTERFAZ DE INTERACCIÓN CON EL USUARIO
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*****************************************************************************************************
 * bienvenida(Ruta, Peso)
 *
 * Predicado principal. Da un mensaje de bienvenida al usuario. Además, le pide seleccionar entre  
 *                      dos opciones disponibles para asistirlo a tomar una decisión inteligente
 *					    sobre la mejor ruta a tomar.
 * 
 ******************************************************************************************************/		

bienvenida(Ruta, Peso) :- nl,
						  write("Bienvendido al sistema de navegacion inteligente para viajar en el metro de la CDMX."),
						  nl,
						  nl,
						  imprimeMenu(),
						  leeInputsUsuario("Por favor, eliga una de las opciones anteriores (1, 2)", InputN, aceptaComando, "La opción que eligio NO es válida."),
						  nl,
						  nl,
						  imprimeEstaciones(),
						  nl,
						  nl,
						  write("La lista anterior muestra todas y cada una de las estaciones del metro de la CDMX."),
						  nl,
						  nl,
						  leeInputsUsuario("Por favor, escriba textualmente, la estación que será su punto de partida", EstacionPartida, aceptaEstacion, "La opción que eligio NO es válida."),
						  nl,
						  nl,
						  leeInputsUsuario("Por favor, escriba textualmente la estación que será su destino", EstacionDestino, aceptaEstacion, "La opción que eligio NO es válida."),
						  nl,
						  nl,
						  eleccion(InputN, EstacionPartida, EstacionDestino, Ruta, Peso).
				

/*********************************************************************************************************
 * imprimeMenu()
 *
 * Predicado para desplegar el menú ofrecido para el usuario. Como su nombre lo indica, este predicado
 *                      									  sirve para mostrarle al usuario el servicio
 *					    									  que ofrece el aplicativo; i.e., encontrar
 * 															  la mejor y peor ruta para navegar en el 
 * 															  metro.
 * 
 **********************************************************************************************************/

imprimeMenu() :- write("1 Encuentra la mejor ruta."),
				 nl,
				 nl,
			     write("2 Encuentra la peor ruta."),
				 nl,
				 nl.
/*********************************************************************************************************
 * imprimeEstaciones()
 *
 * Predicado para desplegar estaciones del metro. Como su nombre lo indica, este predicado
 *                      						  sirve para mostrarle al usuario el conjunto
 *					    						  de todas las estaciones del metro existentes, para que 
 * 												  pueda seleccionar su punto de partida y de destino.
 * 
 **********************************************************************************************************/
				 
imprimeEstaciones() :- write([observatorio,  
						   tacubaya, 
						   juanacatlan, 
						   chapultepec, 
						   sevilla, 
						   insurgentes, 
						   cuauhtemoc, 
						   balderas, 
						   saltoDelAgua, 
						   isabelLaCatolica,
						   pinoSuarez, 
						   merced, 
						   candelaria, 
						   sanLazaro, 
						   moctezuma, 
						   balbuena, 
						   boulevardPtoAereo, 
						   gomezFarias, 
						   zaragoza, 
						   pantitlan, 
						   cuatroCaminos,
						   panteones, 
						   tacuba, 
						   cuitlahuac, 
						   popotla, 
						   colegioMilitar, 
						   normal, 
						   sanCosme, 
						   revolucion, 
						   hidalgo, 
						   bellasArtes,
						   allende, 
						   zocalo, 
						   pinoSuarez, 
						   sanAntonioAbad, 
						   chabacano, 
						   viaducto, 
						   xola, 
						   villaDeCortes, 
						   nativitas, 
						   portales, 
						   ermita, 
						   generalAnaya, 
						   tasquena,  
						   indiosVerdes, 
						   deportivo18Marzo, 
						   potrero, 
						   laRaza, 
						   tlatelolco, 
						   guerrero, 
						   hidalgo, 
						   juarez, 
						   balderas, 
						   ninosHeroes, 
						   hospitalGeneral, 
						   centroMedico, 
						   etiopiaPlazaTransparencia,
						   eugenia, 
						   divisionDelNorte, 
						   zapata, 
						   coyoacan, 
						   viverosDerechosHumanos, 
						   miguelAngelDeQuevedo, 
						   copilco, 
						   universidad, 
						   martinCarrera, 
						   talisman, 
						   bondojito, 
						   consulado, 
						   canalDelNorte, 
						   morelos, 
						   candelaria, 
						   frayServando, 
						   jamaica, 
						   santaAnita,
						   politecnico, 
						   institutoDelPetroleo, 
						   autobusesDelNorte, 
						   laRaza, 
						   misterios, 
						   valleGomez, 
						   consulado, 
						   eduardoMolina, 
						   aragon, 
						   oceania, 
						   terminalAerea, 
						   hangares, 
						   pantitlan, 
						   elRosario, 
						   tezozomoc, 
						   azcapotzalco, 
						   ferreriaArenaCDMX, 
						   norte45, 
						   vallejo, 
						   institutoDelPetroleo, 
						   lindavista, 
						   deportivo18Marzo, 
						   laVillaBasilica, 
						   martinCarrera, 
						   elRosario, 
						   aquilesSerdan, 
						   camarones, 
						   refineria, 
						   tacuba, 
						   sanJoaquin, 
						   polanco, 
						   auditorio, 
						   constituyentes, 
						   tacubaya, 
						   snPedroDeLosPinos, 
						   snAntonio, 
						   mixcoac, 
						   barrancaDelMuerto, 	
						   garibaldiLagunilla, 
						   bellasArtes, 
						   sanJuanDeLetran, 
						   saltoDelAgua, 
						   doctores, 
						   obrera, 
						   chabacano, 
						   laViga, 
						   santaAnita, 
						   coyuya, 
						   iztacalco, 
						   apatlaco, 
						   aculco, 
						   escuadron201, 
						   atlalilco, 
						   iztapalapa, 
						   cerroDeLaEstrella, 
						   uam, 
						   constDe1917,  
						   tacubaya, 
						   patriotismo, 
						   chilpancingo, 
						   centroMedico, 
						   lazaroCardenas, 
						   chabacano, 
						   jamaica, 
						   mixiuhca, 
						   velodromo, 
						   ciudadDeportiva, 
						   puebla, 
						   pantitlan, 
						   pantitlan, 
						   agricolaOriental, 
						   canalDeSanJuan, 
						   tepalcates, 
						   guelatao, 
						   penonViejo, 
						   acatitla, 
						   santaMarta, 
						   losReyes, 
						   laPaz, 
						   buenavista, 
						   guerrero, 
						   garibaldiLagunilla, 
						   lagunilla, 
						   tepito, 
						   morelos, 
						   sanLazaro, 
						   floresMagon, 
						   romeroRubio, 
						   oceania, 
						   deportivoOceania, 
						   bosqueDeAragon, 
						   villaDeAragon, 
						   nezahualcoyotl, 
						   impulsora, 
						   rioDeLosRemedios, 
						   muzquiz, 
						   ecatepec, 
						   olimpica, 
						   plazaAragon, 
						   ciudadAzteca, 
						   mixcoac, 
						   insurgentesSur, 
						   hospital20DeNoviembre, 
						   zapata, 
						   parqueDeLosVenados, 
						   ejeCentral, 
						   ermita, 
						   mexicaltzingo, 
						   atlalilco, 
						   culhuacan, 
						   sanAndresTomatlan, 
						   lomasEstrella, 
						   calle11, 
						   perifericoOte, 
						   tezonco, 
						   olivos, 
						   nopalera, 
						   zapotitlan, 
						   tlaltenco, 
						   tlahuac 
						   ]).

/*************************************************************************************************************
 * leeInputsUsuario/4(+MensajeEntrada, ?Valor, +PredicadoVerificador, +MensajeError)
 *
 * Predicado de lectura/validación. Este predicado sirve para validar que el usuario haya seleccionado una   
 *                      			opción válida de las opciones esperadas.
 * 
 * 									En caso de que exista algún error en los parámetros de entrada, el sistema 
 *                      			le indicará al usuario el mismo, así como también la manera de resolverlo. 
 ***************************************************************************************************************/

leeInputsUsuario(Mensaje, Valor, PredVal, MsgError) :-
    repeat,
	    format('~w: ', [Mensaje]),
		read(Valor),
		(   call(PredVal, Valor)
		->  true, !
		;   format('ERROR: ~w. ', [MsgError]),
		    fail
		).
				 
/*****************************************************************************************************
 * aceptaComando/1(+N)
 *
 * Predicado de validación. Este predicado sirve para validar que el usuario haya seleccionado una   
 *                      	opción válida de las dos opciones que se le presentaron en el menú.
 * 
 ******************************************************************************************************/


aceptaComando(N) :- member(N, [1, 2]).
					
/*****************************************************************************************************
 * aceptaEstacion/1(+NombreEstacion)
 *
 * Predicado de validación. Este predicado sirve para validar que el usuario haya seleccionado un   
 *                      	nombre válido de todos los que se le mostraron en la lista de nombres de 
 *							las estaciones del metro.
 * 
 ******************************************************************************************************/
 
aceptaEstacion(NombreEstacion) :- member(NombreEstacion, [observatorio,  
														  tacubaya, 
														  juanacatlan, 
														  chapultepec, 
														  sevilla, 
														  insurgentes, 
														  cuauhtemoc, 
														  balderas, 
														  saltoDelAgua, 
														  isabelLaCatolica,
														  pinoSuarez, 
														  merced, 
														  candelaria, 
														  sanLazaro, 
														  moctezuma, 
														  balbuena, 
														  boulevardPtoAereo, 
														  gomezFarias, 
														  zaragoza, 
														  pantitlan, 
														  cuatroCaminos,
														  panteones, 
														  tacuba, 
														  cuitlahuac, 
														  popotla, 
														  colegioMilitar, 
														  normal, 
														  sanCosme, 
														  revolucion, 
														  hidalgo, 
														  bellasArtes,
														  allende, 
														  zocalo, 
														  pinoSuarez, 
														  sanAntonioAbad, 
														  chabacano, 
														  viaducto, 
														  xola, 
														  villaDeCortes, 
														  nativitas, 
														  portales, 
														  ermita, 
														  generalAnaya, 
														  tasquena,  
														  indiosVerdes, 
														  deportivo18Marzo, 
														  potrero, 
														  laRaza, 
														  tlatelolco, 
														  guerrero, 
														  hidalgo, 
														  juarez, 
														  balderas, 
														  ninosHeroes, 
														  hospitalGeneral, 
														  centroMedico, 
														  etiopiaPlazaTransparencia,
														  eugenia, 
														  divisionDelNorte, 
														  zapata, 
														  coyoacan, 
														  viverosDerechosHumanos, 
														  miguelAngelDeQuevedo, 
														  copilco, 
														  universidad, 
														  martinCarrera, 
														  talisman, 
														  bondojito, 
														  consulado, 
														  canalDelNorte, 
														  morelos, 
														  candelaria, 
														  frayServando, 
														  jamaica, 
														  santaAnita,
														  politecnico, 
														  institutoDelPetroleo, 
														  autobusesDelNorte, 
														  laRaza, 
														  misterios, 
														  valleGomez, 
														  consulado, 
														  eduardoMolina, 
														  aragon, 
														  oceania, 
														  terminalAerea, 
														  hangares, 
														  pantitlan, 
														  elRosario, 
														  tezozomoc, 
														  azcapotzalco, 
														  ferreriaArenaCDMX, 
														  norte45, 
														  vallejo, 
														  institutoDelPetroleo, 
														  lindavista, 
														  deportivo18Marzo, 
														  laVillaBasilica, 
														  martinCarrera, 
														  elRosario, 
														  aquilesSerdan, 
														  camarones, 
														  refineria, 
														  tacuba, 
														  sanJoaquin, 
														  polanco, 
														  auditorio, 
														  constituyentes, 
														  tacubaya, 
														  snPedroDeLosPinos, 
														  snAntonio, 
														  mixcoac, 
														  barrancaDelMuerto, 	
														  garibaldiLagunilla, 
														  bellasArtes, 
														  sanJuanDeLetran, 
														  saltoDelAgua, 
														  doctores, 
														  obrera, 
														  chabacano, 
														  laViga, 
														  santaAnita, 
														  coyuya, 
														  iztacalco, 
														  apatlaco, 
														  aculco, 
														  escuadron201, 
														  atlalilco, 
														  iztapalapa, 
														  cerroDeLaEstrella, 
														  uam, 
														  constDe1917,  
														  tacubaya, 
														  patriotismo, 
														  chilpancingo, 
														  centroMedico, 
														  lazaroCardenas, 
														  chabacano, 
														  jamaica, 
														  mixiuhca, 
														  velodromo, 
														  ciudadDeportiva, 
														  puebla, 
														  pantitlan, 
														  pantitlan, 
														  agricolaOriental, 
														  canalDeSanJuan, 
														  tepalcates, 
														  guelatao, 
														  penonViejo, 
														  acatitla, 
														  santaMarta, 
														  losReyes, 
														  laPaz, 
														  buenavista, 
														  guerrero, 
														  garibaldiLagunilla, 
														  lagunilla, 
														  tepito, 
														  morelos, 
														  sanLazaro, 
														  floresMagon, 
														  romeroRubio, 
														  oceania, 
														  deportivoOceania, 
														  bosqueDeAragon, 
														  villaDeAragon, 
														  nezahualcoyotl, 
														  impulsora, 
														  rioDeLosRemedios, 
														  muzquiz, 
														  ecatepec, 
														  olimpica, 
														  plazaAragon, 
														  ciudadAzteca, 
														  mixcoac, 
														  insurgentesSur, 
														  hospital20DeNoviembre, 
														  zapata, 
														  parqueDeLosVenados, 
														  ejeCentral, 
														  ermita, 
														  mexicaltzingo, 
														  atlalilco, 
														  culhuacan, 
														  sanAndresTomatlan, 
														  lomasEstrella, 
														  calle11, 
														  perifericoOte, 
														  tezonco, 
														  olivos, 
														  nopalera, 
														  zapotitlan, 
														  tlaltenco, 
														  tlahuac 
														  ]).
									
/*****************************************************************************************************
 * eleccion/5(+N, +VP, +VL, -R, -P)
 *
 * Predicado de eleccion. Este predicado sirve para calcular la mejor o peor ruta, dependiento de lo que    
 *                        el usuario pidió en la consola.
 * 
 ******************************************************************************************************/

eleccion(Num, VerticePartida, VerticeLlegada, Ruta, Peso) :- Num is 1,
														     mejorRuta(VerticePartida, VerticeLlegada, Ruta, Peso).
eleccion(Num, VerticePartida, VerticeLlegada, Ruta, Peso) :- Num is 2,
														     peorRuta(VerticePartida, VerticeLlegada, Ruta, Peso).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% 								INICIO REGLAS PARA ENCONTRAR MEJOR Y PEOR RUTA 
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 
/*********************************************************************************************
 * vecinos/3(?V1, ?V2, ?Peso)
 *
 * Este predicado genera al conjunto de todos los vértices en el grafo G, (con su respectivo 
 * costo asociado), tales que, estos vértices son vecinos. (Forma No-Canónica) 
 *
 * Por otro lado, dados dos vértices como argumentos de entrada del predicado, éste muestra
 * el peso de la arista entre los dos vértices proporcionados. (Forma Canónica)
 *********************************************************************************************/

% Puesto que existen pesos distintos en el conjunto de aristas del sistema de transporte del
% metro, no es necesario considerar un predicado como:
% vecinos(V1, V2, Peso) :- arco(V1, V2, Peso) ; arco(V2, V1, Peso).
% Más aún, si se hubiera considerado ese predicado en lugar del que se muestra a continuación,
% podríamos estar regresando pesos incorrectos.

vecinos(V1, V2, Peso) :- arco(V1, V2, Peso).

 /*********************************************************************************************
 * ruta/4(?V1, ?V2, -Ruta, -Peso)
 *
 * Este predicado genera al conjunto de todas las rutas posibles que existen entre 
 * cualesquiera dos vértices (considerando que el peso de un arco, que se dirige a un mismo 
 * vértice, solo se considera una sola vez). (Forma No-Canónica)
 *
 * Además, en su forma canónica, dados dos vértices cualesquiera, como argumentos de entrada 
 * del predicado, éste regresa el conjunto de rutas posibles entre ambos vértices, con sus
 * respectivos pesos (para cada ruta).
 *
 * OBS1: Note que este predicado hace uso del predicado navega, que se menciona a continuación.
 * OBS2: Puesto que el acumulador auxiliar en el predicado navegar tiene una estructura en la 
 *       cual sus elementos son accesados en una manera "FILO" (acrónimo en inglés para First
 *       in last out"), es necesario invertir esta lista para que la ruta esté en el orden 
 *       correcto. 
 ************************************************************************************************/

% La ruta siempre inicia con el vértice de partida, por lo que el acumulador
% siempre iniciará con el vértice de partida de la ruta 

ruta(VerticePartida, VerticeLlegada, Ruta, PesoAcumulado) :- 
     navega(VerticePartida, VerticeLlegada, [VerticePartida], RutaInvertida, PesoAcumulado),
	 reverse(RutaInvertida, Ruta). % Invertir el orden de la ruta 

/****************************************************************************************************
 * navega/5(?V1, ?V2, ?LA, -LR, -P)
 *
 * Este predicado es el predicado auxiliar del predicado ruta. Dados dos vértices cualesquiera,
 * nos encuentra el conjunto de todas las rutas existentes en orden inverso. (El tercer parámetro 
 * -el acumulador auxiliar- siempre tiene que ser la lista compuesta por el vértice de partida y nadamás) 
 *****************************************************************************************************/
	 
% Caso cuando navegamos por vértices vecinos
	  
navega(VerticePartida, VerticeLlegada, VerticesVisitados, [VerticeLlegada|VerticesVisitados], PesoAcumulado) :-
       vecinos(VerticePartida, VerticeLlegada, PesoAcumulado).
	   
% Caso cuando estamos considerando vértices no-vecinos	
 
navega(VerticePartida, VerticeLlegada, VerticesVisitados, Ruta, PesoAcumulado) :-
       vecinos(VerticePartida, VerticeIntermedio, PesoVerticePartidaIntermedio),
       VerticeIntermedio \== VerticeLlegada,
	   \+member(VerticeIntermedio, VerticesVisitados),
	   navega(VerticeIntermedio, VerticeLlegada, [VerticeIntermedio|VerticesVisitados], Ruta, PesoParcialAcum),
	   PesoAcumulado is PesoVerticePartidaIntermedio + PesoParcialAcum.

/*************************************************************************************************************
 * todasLasRutas/3(?V1, ?V2, -Rutas)
 * 
 * El predicado todasLasRutas devuelve el conjunto de todas las rutas posibles que existen para navegar de un
 * vértice de partida V1 a un vértice de destino V2. Note el "; true" a continuación. Esto es usado para que
 * el usuario escriba la letra w en caso de que desee escribir todos y cada uno de los elementos de la lista,
 * o la letra p en caso de que no sea necesario mostrar todos de manera explícita.
 *************************************************************************************************************/

todasLasRutas(VerticePartida, VerticeLlegada, Rutas) :- setof([R, P], ruta(VerticePartida, VerticeLlegada, R, P), Rutas) ; true,
                                                        Rutas = [_|_]. % En caso de que no haya rutas que van del vértice de partida al de llegada
                                                        

/**********************************************************************************************
 * mejorRuta/4(?V1, ?V2, -Ruta, -Peso)
 *
 * Este predicado tiene como objetivo proporcionar la ruta entre los vértices V1 Y V2 tal que
 * la suma de los pesos compuesta por todos los arcos recorridos en esa ruta, sea la más pequeña  
 * en comparación con las otras sumas para los otras posibles rutas que puedan existir.
 * 
 * Note que este predicado se ayuda de los predicados minimaR y min, definidos a continuación.
 **********************************************************************************************/
 
mejorRuta(VerticePartida,VerticeLlegada, Ruta, Peso) :- 
          setof([R, P], ruta(VerticePartida, VerticeLlegada, R, P), ConjuntoRutas),
          ConjuntoRutas = [_|_], % En caso de que no haya rutas que van del vértice de partida al de llegada
          minimaR(ConjuntoRutas, [Ruta, Peso]).
		  
/**********************************************************************************************
 * minimaR/2(?LR, ?LMR)
 *
 * Predicado auxiliar de mejorRuta. Este predicado regresa la menor ruta existente entre un   
 * conjunto de rutas existentes, guardadas en una lista.
 *
 **********************************************************************************************/

minimaR([Ruta1|Rutas], MejorRuta) :- min(Rutas, Ruta1, MejorRuta) ; true.

/*****************************************************************************************************
 * min/3(?L, ?R, ?MR)
 *
 * Predicado auxiliar de minimaR y de mejorRuta. Este predicado muestra las condiciones necesarias
 * para poder determinar la arista menos costosa de entre un conjunto de aristas. 
 *
 *****************************************************************************************************/

min([], M, M).
min([[Ruta1,Peso1]| Rutas], [_,M], MejorRuta) :- Peso1 < M, !, min(Rutas, [Ruta1, Peso1], MejorRuta).
min([_|Rutas], M, MejorRuta) :- min(Rutas, M, MejorRuta).  		  
									
/******************************************************************************************************
 * peorRuta/4(?V1, ?V2, ?Ruta, ?Peso)
 *
 * Análogamente al predicado mejor ruta, el objetivo de este predicado es encontrar la peor  
 * ruta existente entre cualesquiera dos vértices V1 y V2 del grafo en cuestión. Decimos que la
 * ruta encontrada por este predicado es peor debido a que la suma acumulada de los pesos de los
 * arcos en la ruta suman el número más grande de entre cualquier otra suma posible.
 *
 ********************************************************************************************************/

peorRuta(VerticePartida,VerticeLlegada, Ruta, Peso) :- 
         setof([R, P], ruta(VerticePartida, VerticeLlegada, R, P), ConjuntoRutas),
         ConjuntoRutas = [_|_], % En caso de que no haya rutas que van del vértice de partida al de llegada
         maximaR(ConjuntoRutas, [Ruta, Peso]).

/**********************************************************************************************
 * maximaR/2(?LR, ?LMR)
 *
 * Predicado auxiliar de peorRuta. Este predicado regresa la mayor ruta existente entre un   
 * conjunto de rutas existentes, guardadas en una lista.
 *  
 **********************************************************************************************/

maximaR([Ruta1|Rutas], PeorRuta) :- max(Rutas, Ruta1, PeorRuta) ; true.

/**********************************************************************************************
 * max/3(?L, ?R, ?MR)
 *
 * Predicado auxiliar de maximaR y peorRuta. Este predicado muestra las condiciones necesarias
 * para poder determinar la arista más costosa de entre un conjunto de aristas.   
 *  
 **********************************************************************************************/

max([], M, M).
max([[Ruta1,Peso1]| Rutas], [_,M], PeorRuta) :- Peso1 > M, !, max(Rutas, [Ruta1, Peso1], PeorRuta).
max([_|Rutas], M, PeorRuta) :- max(Rutas, M, PeorRuta).  
