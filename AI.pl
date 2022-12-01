complaint:- 
check(Problem),
write('I think the problem is:'),
write(Problem),
nl,
undo.

/*complaints for mobile problems*/
check(slowPhone):- slowPhone, !.
check(poorBattery):- poorBattery, !.
check(appCrashes):- appCrashes, !.
check(appNotDownloading):- appNotDownloading, !.
check(sdCardnotWorking):- sdCardnotWorking, !.
check(wetPhone):- wetPhone, !.
check(chargingProblem):- chargingProblem, !.
check(unknown).


slowPhone :-
agent(too_SlowToUse),
agent(poor_QualityCamera),
agent(hang_Problem),
nl,
write('solution:'),
nl,
write('clear your cache'),
nl,
write('or Buy a new phone'),
nl.

poorBattery :-
agent(suddenly_PhoneSwitchOff),
agent(battery_NotFullyCharge),
agent(self_Restarting),
nl,
write('solution:'),
nl,
write('Reduce Screen Brighter'),
nl,
write('Restrict apps with high battery use'),
nl.

appCrashes :-
agent(force_Stop),
agent(not_opening),
agent(network_error),
nl,
write('solution:'),
nl,
write('reinstall the app'),
nl,
write('Restart your device'),
nl.

appNotDownloading :-
agent(app_downloadingStuck),
agent(wifi_notWorking),
agent(error_occur),
nl,
write('solution:'),
nl,
write('clear cache and data from Google Play Store'),
nl.

sdCardnotWorking :-
agent(no_sdCardDetected),
agent(no_fileTransferring),
agent(sdCard_Full),
nl,
write('solution:'),
nl,
write('Formating Sd Card'),
nl.

wetPhone :-
agent(sound_distorted),
agent(inability_toCharge),
agent(screen_distorted),
nl,
write('solution:'),
nl,
write('Take your phone to repair Shop'),
nl.

chargingProblem :-
agent(dirt_inChargePort),
agent(inability_toCharge),
agent(cable_broken),
nl,
write('solution:'),
nl,
write('Buy a new charger'),
nl,
write('clear the dirt'),
nl,
write('and last solution is take your phone to repair shop'),
nl.



ask(Question):-
write('Do you have following signs: '),
nl,
write(Question),
write('?'),
read(Response),
nl,
((Response == yes ; Response == y)
->
assert(yes(Question)) ;
assert(no(Question)), fail).


:- dynamic yes/1,no/1.
agent(S):-
(yes(S)
->
true;
(no(S)
->
fail;
ask(S))).
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.
