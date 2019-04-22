// Agent sample_agent in project jason

menu(none).

/* Initial goals */

// !start.
/*
+start
   <- --start;
      releaseallkeys;
      !mine(15, 270, 8000);
      !mine(15, 274, 1500);
      !mine(15, 257, 1000);
      !mine(15, 285, 1500);
      !mine(15, 278, 500);
      */

/* Perceptions */

+slot0(X) <- -slot(1, _); +slot(1, X).
+slot1(X) <- -slot(2, _); +slot(2, X).
+slot2(X) <- -slot(3, _); +slot(3, X).
+slot3(X) <- -slot(4, _); +slot(4, X).
+slot4(X) <- -slot(5, _); +slot(5, X).
+slot5(X) <- -slot(6, _); +slot(6, X).
+slot6(X) <- -slot(7, _); +slot(7, X).
+slot7(X) <- -slot(8, _); +slot(8, X).
+slot8(X) <- -slot(9, _); +slot(9, X).

/* Plans */

+!clear_inventory
   <- !menu_open(chat)
      type("/clear @s");
      spress(R);
      srelease(R);
      -+menu(none).

+!getitem(X) : slot(Y, 0)
   <- !menu_open(chat)
      functions.getBlockName(X, BLOCKNAME)
      .concat("/give @s ", BLOCKNAME, " 1", MSG);
      type(MSG);
      spress(R);
      srelease(R);
      -+menu(none);
      .wait(200).

+!getitem(X)
   <- !clear_inventory;
      .wait(200);
      !getitem(X).

// *********** VIEW ***************

+!view_pitch(X) : pitch(X).

+!view_pitch(X) : pitch(Y)
   <- if(X - Y > 20) {
        mousemove(0, 50);
      }
     elif(X - Y > 5) {
        mousemove(0, 20);
      }
      elif(X - Y > 0) {
        mousemove(0, 5);
      }
      elif(X - Y < -20) {
        mousemove(0, -50);
      }
      elif(X - Y < -5) {
        mousemove(0, -20);
      }
      else {
        mousemove(0, -5);
      }
      !view_pitch(X).

+!view_yaw(X) : yaw(X).

+!view_yaw(X) : yaw(Y)
   <- if(X - Y > 20) {
        mousemove(50, 0);
      }
     elif(X - Y > 5) {
        mousemove(20, 0);
      }
      elif(X - Y > 0) {
        mousemove(5, 0);
      }
      elif(X - Y < -20) {
        mousemove(-50, 0);
      }
      elif(X - Y < -5) {
        mousemove(-20, 0);
      }
      else {
        mousemove(-5, 0);
      }
      !view_yaw(X).

// *********** HOLD ***************

// already holding the item
+!hold(X) : slot(Y, X) & curslot(Y).
// item is in the hotbar but we aren't holding it
+!hold(X) : slot(Y, X)
   <- press(Y);
      release(Y);
      .wait(200);
      !hold(X).
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
   <- !view_pitch(30);
      !view_yaw(0);
      press(d);
      .wait(200);
      release(d);
      !hold(X);
      mousedown(R);
      mouseup(R);
      .wait(200);
      !look_at(X).

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

+!exit_to_menu
   <- !menu_open(pause);
      mousemovewr(0.5, 0.75);
      mousedown(L);
      mouseup(L).

// *********** MINING ***************

+!mine(X, Y, Z)
   <- !look_at(X);
      !hold(Y);
      mousedown(L);
      .wait(Z);
      mouseup(L).
