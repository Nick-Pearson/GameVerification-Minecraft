// Agent sample_agent in project jason

/* Initial beliefs and rules */

curslot(1).
slot(1,none).
slot(2,none).
slot(3,none).
slot(4,none).
slot(5,none).
slot(6,none).
slot(7,none).
slot(8,none).
slot(9,none).

menu(none).

/* Initial goals */

!start.

/* Plans */

+!start
   <- releaseallkeys;
      !hold(none);
      !hold(dirt);
      !menu_open(pause).

+!getitem(X)
   <- !menu_open(chat)
      type("/give ");
      spress(T);
      .concat(" ", X, " 64", MSG);
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
+!hold(X)
   <- !getitem(X);
      !hold(X).

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
