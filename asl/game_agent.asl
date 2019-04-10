// Agent sample_agent in project jason

menu(none).

/* Initial goals */

// !start.
+start
   <- -start;
      releaseallkeys;
      !mine(15, 270);
      !mine(15, 274);
      !mine(15, 257);
      !mine(15, 285);
      !mine(15, 278);
      !menu_open(pause).

/* Perceptions */

+slot0(X) <- -slot(1, _); +slot(1, X); print("changed slot0").
+slot1(X) <- -slot(2, _); +slot(2, X); print("changed slot1").
+slot2(X) <- -slot(3, _); +slot(3, X).
+slot3(X) <- -slot(4, _); +slot(4, X).
+slot4(X) <- -slot(5, _); +slot(5, X).
+slot5(X) <- -slot(6, _); +slot(6, X).
+slot6(X) <- -slot(7, _); +slot(7, X).
+slot7(X) <- -slot(8, _); +slot(8, X).
+slot8(X) <- -slot(9, _); +slot(9, X).

/* Plans */

+!getitem(X)
   <- !menu_open(chat)
      functions.getBlockName(X, BLOCKNAME)
      .concat("/give @s ", BLOCKNAME, " 1", MSG);
      type(MSG);
      spress(R);
      srelease(R);
      -+menu(none);
      +have(X).

// *********** HOLD ***************

// already holding the item
+!hold(X) : slot(Y, X) & curslot(Y).
// item is in the hotbar but we aren't holding it
+!hold(X) : slot(Y, X)
   <- press(Y);
      release(Y);
      -+curslot(Y).
// item is in the inventory but we are not holding it
+!hold(X) : have(X)
   <- !menu_open(inventory).
// we dont have any of the item
+!hold(X) : true
   <- !getitem(X);
      !hold(X).

// *********** HOLD ***************

+!look_at(X) : looking_at(X).

+!look_at(X) : true
   <- !hold(X).

// *********** MENU ***************

+!menu_open(X) : menu(X).
+!menu_open(inventory)
   <- !menu_open(none);
      press(e);
      release(e);
      -+menu(inventory).

+!menu_open(chat)
   <- !menu_open(none);
      press(t);
      release(t);
      -+menu(chat).

+!menu_open(pause)
   <- !menu_open(none);
       spress(E);
       srelease(E);
       -+menu(pause).

+!menu_open(none)
   <- spress(E);
      srelease(E);
      -+menu(none).

// *********** MINING ***************

+!mine(X, Y)
   <- !look_at(X);
      !hold(Y).
