VAR vita = 10
VAR mana = 10
VAR HP = 20

Un nemico si avvicina...
->INIZIO

=== INIZIO ===
Hai {HP} punti vita
Hai {mana} punti abilità
Il nemico ha ancora {vita} punti vita
Scegli l'azione da compiere
+Attacco
->Attacco
+Azioni speciali
->Azioni
+Oggetti
->Oggetti
+Fuga
->Fuga

=Attacco
Tizio attacca...
~vita = vita-RANDOM(1,4)
{vita !=0:
->Nemico
}
{vita <=0:
Il nemico cade...
->Vittoria
}

=Azioni
Scegli il tipo di incantesimo
+Palla di fuoco
->Fuoco
+Tempesta di ghiaccio
->Ghiaccio
+Saetta
->Fulmine
+Soffio vitale
->Cura

=Fuoco
{mana >=3:
Sferri una palla di fuoco contro il nemico. Infliggi danni modesti...
~vita = vita-2 
~mana = mana-3
->Nemico
}
{mana < 3:
Non hai abbastanza punti abilità
->INIZIO
}

=Ghiaccio
{mana >=3:
Un vento gelido pervade l'area. Il nemico assorbe il ghiaccio...
~mana = mana-3
->Nemico
}
{mana < 3:
Non hai abbastanza punti abilità
->INIZIO
}

=Fulmine
{mana >=3:
Un fulmine cade sul nemico. Efficace. Infliggi danni pesanti...
~vita = vita-5
~mana = mana-3
->Nemico
}
{mana < 3:
Non hai abbastanza punti abilità
->INIZIO
}

=Cura
{mana >=5:
Un tepore lenitivo ti avvolge. Recuperi vita
~HP = HP+15 
~mana = mana-5
->Nemico
}
{mana < 5:
Non hai abbastanza punti abilità
->INIZIO
}
=Oggetti
+Pozione di cura
->Pozione
+Pozione abilità
->Abilita

=Pozione
Recuperi punti vita...
~HP = HP+6
->Nemico

=Abilita
Recuperi punti abilità...
{mana >= 10:
~mana=20
}
{mana < 10:
{mana+10}
}
->Nemico

=Fuga
Ti allontani dal nemico...
->DONE

=Nemico
Il nemico attacca. Perdi 5 punti vita
~HP = HP-5
{HP !=0:
->INIZIO
}
{HP<=0:
->Sconfitta
}

=Vittoria
Hai vinto!
->DONE


=Sconfitta
Hai perso!
Vuoi ricominciare?
+Si
->Si
+No
->No

=Si
~vita=10
~mana=10
~HP=20
->INIZIO

=No
->DONE
