unit ingame;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, playerclass, cardclass;

type

  { TshowIngame }

  TshowIngame = class(TForm)
    attackButton: TButton;
    exitButton: TImage;
    pullCards: TImage;
    mana1: TEdit;
    mana2: TEdit;
    hp1: TEdit;
    hp2: TEdit;
    turn: TButton;
    card1_1: TImage;
    card1_2: TImage;
    card1_3: TImage;
    card1_4: TImage;
    card2_1: TImage;
    card2_2: TImage;
    card2_3: TImage;
    card2_4: TImage;
    cardSlot1: TPanel;
    cardSlot2: TPanel;
    cardSlot6: TPanel;
    cardSlot5: TPanel;
    cardSlot4: TPanel;
    cardSlot7: TPanel;
    cardSlot3: TPanel;
    cardSlot8: TPanel;
    player2imagefield: TPanel;
    player1imagefield: TPanel;
    player1Slot1: TPanel;
    player1Slot2: TPanel;
    player1Slot3: TPanel;
    player1Slot4: TPanel;
    player2Slot1: TPanel;
    player2Slot2: TPanel;
    player2Slot3: TPanel;
    player2Slot4: TPanel;
    procedure attackButtonClick(Sender: TObject);
    procedure card1_1Click(Sender: TObject);
    procedure card1_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card1_1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure card1_1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card1_2Click(Sender: TObject);
    procedure card1_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card1_2MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure card1_2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card1_3Click(Sender: TObject);
    procedure card1_3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card1_3MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure card1_3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card1_4Click(Sender: TObject);
    procedure card1_4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card1_4MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure card1_4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card2_1Click(Sender: TObject);
    procedure card2_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card2_1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure card2_1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card2_2Click(Sender: TObject);
    procedure card2_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card2_2MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure card2_2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card2_3Click(Sender: TObject);
    procedure card2_3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card2_3MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure card2_3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card2_4Click(Sender: TObject);
    procedure card2_4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card2_4MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure card2_4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure exitButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pullCardsClick(Sender: TObject);
    procedure turnClick(Sender: TObject);
  private

  public

  end;

var
  autoclose: boolean;

  attackMode: boolean; //Damage System
  wholeDamage: integer;

  card1, card2, card3, card4, dcard1, dcard2, dcard3, dcard4: TCard;  //Spielkarten

  player1, player2: TPlayer;

  player1hasturn, player2hasturn: boolean; //End - Turn Button
  k : integer;

  showIngame: TshowIngame;
  currentHeight, currentWidth: integer;  //Screenanpassung

  a, b, i, j: integer;                   //Kartensortiersystem
  cards1: array[1..4] of TImage;
  cards2: array[1..4] of TImage;
  cardscache: array[1..5] of TImage;
  lockedslots2: array[1..4] of boolean;
  lockedslots1: array[1..4] of boolean;
  cache: TImage;

  oldleft, oldtop: integer;               //DragAndDrop
  lockedfield: array[1..8] of boolean;

  fixxed: boolean;

implementation

{$R *.lfm}

{ TshowIngame }

procedure TshowIngame.FormCreate(Sender: TObject);
begin
    autoclose := true;
    attackMode := false;

    card1 := TCard.Create;
    card2 := TCard.Create;
    card3 := TCard.Create;
    card4 := TCard.Create;
    dcard1 := TCard.Create;
    dcard2 := TCard.Create;
    dcard3 := TCard.Create;
    dcard4 := TCard.Create;

    card1.hp := 5;
    card2.hp := 8;
    card3.hp := 10;
    card4.hp := 3;
    dcard1.hp := card1.hp;
    dcard2.hp := card2.hp;
    dcard3.hp := card3.hp;
    dcard4.hp := card4.hp;

    card1.damage := 10;
    card2.damage := 3;
    card3.damage := 2;
    card4.damage := 8;
    dcard1.damage := card1.damage;
    dcard2.damage := card2.damage;
    dcard3.damage := card3.damage;
    dcard4.damage := card4.damage;

    card1.manacost := 6;
    card2.manacost := 7;
    card3.manacost := 9;
    card4.manacost := 4;
    dcard1.manacost := card1.manacost;
    dcard2.manacost := card2.manacost;
    dcard3.manacost := card3.manacost;
    dcard4.manacost := card4.manacost;

    //Spieler erstellen

    player1 := TPlayer.Create;
    player2 := TPlayer.Create;

    player1.Hp := 200;
    player2.Hp := 200;

    player1.ManaPerRound := 5;
    player2.ManaPerRound := 5;
    player1.Mana := 5;
    player2.Mana := 0;

    mana1.text := mana1.text + ' ' + inttostr(player1.Mana);
    hp1.text := hp1.text + ' ' + inttostr(player1.Hp);
    mana2.text := mana2.text + ' ' + inttostr(player2.Mana);
    hp2.text := hp2.text + ' ' + inttostr(player1.Hp);

    card1.cardIsPlaced := false;
    card2.cardIsPlaced := false;
    card3.cardIsPlaced := false;
    card4.cardIsPlaced := false;

    //Bildsperre zum platzieren bis der Spieler dran ist

    player2hasturn := true;
    k := 0;

    //Kartensetauswahl
    lockedslots1[1]:=false;
    lockedslots1[2]:=false;
    lockedslots1[3]:=false;
    lockedslots1[4]:=false;
    lockedslots2[1]:=false;
    lockedslots2[2]:=false;
    lockedslots2[3]:=false;
    lockedslots2[4]:=false;

    //Karten initialisieren
    cards1[1] := card1_1;
    cards1[2] := card1_2;
    cards1[3] := card1_3;
    cards1[4] := card1_4;

    cards2[1] := card2_1;
    cards2[2] := card2_2;
    cards2[3] := card2_3;
    cards2[4] := card2_4;

    //Abfrage fürs Platzieren
    lockedfield[1]:=false;
    lockedfield[2]:=false;
    lockedfield[3]:=false;
    lockedfield[4]:=false;
    lockedfield[5]:=false;
    lockedfield[6]:=false;
    lockedfield[7]:=false;
    lockedfield[8]:=false;

    //Anzeige-Einstellungen
    WindowState := wsMaximized;
    currentHeight:=Screen.height;
    currentWidth:=Screen.Width;

    //Exitbutton
    exitButton.height := currentHeight div 10;
    exitButton.width := currentWidth div 7;
    exitButton.top := Round(currentHeight*0.5);
    exitButton.left := Round(currentWidth*(1/24));

    //EndTurnbutton
    turn.height := exitButton.height;
    turn.width := exitButton.width;
    turn.top := Round(currentHeight div 2 - turn.height div 2);
    turn.left := Round(currentWidth*(8/12));

    //PullCardsbutton
    pullCards.Height := exitButton.height;
    pullCards.Width := exitButton.width;
    pullCards.Top := exitButton.top - exitButton.height;
    pullCards.Left := exitButton.left;

    //Slots des Kartendecks
    player1Slot1.height := currentHeight div 6;
    player1Slot2.height := player1Slot1.height;
    player1Slot3.height := player1Slot1.height;
    player1Slot4.height := player1Slot1.height;
    player1Slot1.width := currentWidth div 12;
    player1Slot2.width := player1Slot1.width;
    player1Slot3.width := player1Slot1.width;
    player1Slot4.width := player1Slot1.width;

    player2Slot1.height:= player1Slot1.height;
    player2Slot2.height:= player1Slot1.height;
    player2Slot3.height:= player1Slot1.height;
    player2Slot4.height:= player1Slot1.height;
    player2Slot1.width := player1Slot1.width;
    player2Slot2.width := player1Slot1.width;
    player2Slot3.width := player1Slot1.width;
    player2Slot4.width := player1Slot1.width;

    player1Slot1.left := Round(currentWidth * 0.33);
    player1Slot2.left := player1Slot1.left + player1Slot2.width;
    player1Slot3.left := player1Slot2.left + player1Slot3.width;
    player1Slot4.left := player1Slot3.left + player1Slot4.width;

    player2Slot1.left:=player1Slot1.left;
    player2Slot2.left := player2Slot1.left + player2Slot2.width;
    player2Slot3.left := player2Slot2.left + player2Slot3.width;
    player2Slot4.left := player2Slot3.left + player2Slot4.width;

    player1Slot1.top := Round(currentHeight * 0.75);
    player1Slot2.top := player1Slot1.top;
    player1Slot3.top := player1Slot1.top;
    player1Slot4.top := player1Slot1.top;

    player2Slot1.top := Round(currentHeight * 0.0833);
    player2Slot2.top := player2Slot1.top;
    player2Slot3.top := player2Slot1.top;
    player2Slot4.top := player2Slot1.top;

    //Mögliche Profilbilder
    player1imagefield.Height := Round(currentHeight / 4.5);
    player1imagefield.Width := currentWidth div 6;
    player1imagefield.left := currentWidth div 6;
    player1imagefield.top := Round(currentHeight* 0.6944);

    if player1imagefield.height < player1imagefield.width then begin
      player1imagefield.width := player1imagefield.height;
      player1imagefield.left:=player1Slot1.left - player1imagefield.width;
    end;

    player2imagefield.Height := player1imagefield.Height;
    player2imagefield.Width := player1imagefield.width;
    player2imagefield.left := player1imagefield.left;
    player2imagefield.top := Round(currentHeight* 0.0833);

    //Mana HP Anzeigen für beide Spieler
    hp1.height := player1imagefield.height div 2;
    hp1.top := player1imagefield.top;
    hp1.width := player1imagefield.width;
    hp1.left := player1imagefield.left - player1imagefield.width;

    mana1.height := player1imagefield.height div 2;
    mana1.top := hp1.top + hp1.height;
    mana1.width := player1imagefield.width;
    mana1.left := hp1.left;


    hp2.height := player2imagefield.height div 2;
    hp2.top := player2imagefield.top;
    hp2.width := player2imagefield.width;
    hp2.left := player2imagefield.left - player2imagefield.width;

    mana2.height := player2imagefield.height div 2;
    mana2.top := hp2.top + hp2.height;
    mana2.width := player2imagefield.width;
    mana2.left := hp2.left;


    //Platzierungsslots für Karten
    cardSlot1.height := player1Slot1.height;
    cardSlot2.height := cardSlot1.height;
    cardSlot3.height := cardSlot1.height;
    cardSlot4.height := cardSlot1.height;
    cardSlot5.height := cardSlot1.height;
    cardSlot6.height := cardSlot1.height;
    cardSlot7.height := cardSlot1.height;
    cardSlot8.height := cardSlot1.height;

    cardSlot1.width := player1Slot1.width;
    cardSlot2.width := cardSlot1.width;
    cardSlot3.width := cardSlot1.width;
    cardSlot4.width := cardSlot1.width;
    cardSlot5.width := cardSlot1.width;
    cardSlot6.width := cardSlot1.width;
    cardSlot7.width := cardSlot1.width;
    cardSlot8.width := cardSlot1.width;

    cardSlot1.left := player1Slot1.left;
    cardSlot2.left := player1Slot2.left;
    cardSlot3.left := player1Slot3.left;
    cardSlot4.left := player1Slot4.left;
    cardSlot5.left := player2Slot1.left;
    cardSlot6.left := player2Slot2.left;
    cardSlot7.left := player2Slot3.left;
    cardSlot8.left := player2Slot4.left;

    cardSlot1.top := Round(player2Slot1.top + player1Slot1.height + currentHeight * (1/18));
    cardSlot2.top := cardSlot1.top;
    cardSlot3.top := cardSlot1.top;
    cardSlot4.top := cardSlot1.top;
    cardSlot5.top := player1Slot1.top - Round((currentHeight*1/18) + cardSlot5.height);
    cardSlot6.top := cardSlot5.top;
    cardSlot7.top := cardSlot5.top;
    cardSlot8.top := cardSlot5.top;

end;

//Karten ziehen

procedure TshowIngame.pullCardsClick(Sender: TObject);
begin
   turn.visible := true;
   {Randomize;
   for i := 4 downto 1 do
     begin
          j := Random(i+1);
          cache := cards1[i];
          cards1[i] := cards1[j];
          cards1[j] := cache;
   end;
   for i := 4 downto 1 do
     begin
          j := Random(i+1);
          cache := cards2[i];
          cards2[i] := cards2[j];
          cards2[j] := cache;
     end;}

   for a := 1 to 4 do begin
     if lockedslots1[1] = false then begin
         cards1[a].width := player1Slot1.width;
         cards1[a].height := player1Slot1.height;
         cards1[a].left := player1Slot1.left;
         cards1[a].top := player1Slot1.top;
         cards1[a].visible := true;
         lockedslots1[1]:= true;
     end
     else if lockedslots1[2] = false then begin
         cards1[a].width := player1Slot2.width;
         cards1[a].height := player1Slot2.height;
         cards1[a].left := player1Slot2.left;
         cards1[a].top := player1Slot2.top;
         cards1[a].visible := true;
         lockedslots1[2] := true;
      end
      else if lockedslots1[3] = false then begin
         cards1[a].width := player1Slot3.width;
         cards1[a].height := player1Slot3.height;
         cards1[a].left := player1Slot3.left;
         cards1[a].top := player1Slot3.top;
         cards1[a].visible := true;
         lockedslots1[3]:=true;
      end
      else if lockedslots1[4] = false then begin
         cards1[a].width := player1Slot4.width;
         cards1[a].height := player1Slot4.height;
         cards1[a].left := player1Slot4.left;
         cards1[a].top := player1Slot4.top;
         cards1[a].visible := true;
         lockedslots1[4]:=true;
      end;
   end;
   for b := 1 to 4 do begin
     if lockedslots2[1] = false then begin
         cards2[b].width := player2Slot1.width;
         cards2[b].height := player2Slot1.height;
         cards2[b].left := player2Slot1.left;
         cards2[b].top := player2Slot1.top;
         cards2[b].visible := true;
         lockedslots2[1]:= true;
     end
     else if lockedslots2[2] = false then begin
         cards2[b].width := player2Slot2.width;
         cards2[b].height := player2Slot2.height;
         cards2[b].left := player2Slot2.left;
         cards2[b].top := player2Slot2.top;
         cards2[b].visible := true;
         lockedslots2[2] := true;
      end
      else if lockedslots2[3] = false then begin
         cards2[b].width := player2Slot3.width;
         cards2[b].height := player2Slot3.height;
         cards2[b].left := player2Slot3.left;
         cards2[b].top := player2Slot3.top;
         cards2[b].visible := true;
         lockedslots2[3]:=true;
      end
      else if lockedslots2[4] = false then begin
         cards2[b].width := player2Slot4.width;
         cards2[b].height := player2Slot4.height;
         cards2[b].left := player2Slot4.left;
         cards2[b].top := player2Slot4.top;
         cards2[b].visible := true;
         lockedslots2[4]:=true;
      end;
   end;
end;

//Aufpassen hier ist player2hasturn vertauscht von der Logik
procedure TshowIngame.card1_1Click(Sender: TObject);
begin
   if (attackMode) AND (player2hasturn) AND (card1.cardIsPlaced) then begin
      wholeDamage := wholeDamage + card1.damage;
      card1_1.enabled := false;
   end
   else if (attackMode) AND (card1.cardIsPlaced) then begin
      card1.hp := card1.hp - wholeDamage;
      wholeDamage := 0;
      if card1.hp <= 0 then begin
         card1_1.visible := false;
      end;
   end;
end;
procedure TshowIngame.card1_2Click(Sender: TObject);
begin
   if (attackMode) AND (player2hasturn) AND (card2.cardIsPlaced) then begin
      wholeDamage := wholeDamage + card2.damage;
      card1_2.enabled := false;
   end
   else if (attackMode) AND (card2.cardIsPlaced) then begin
      card2.hp := card2.hp - wholeDamage;
      wholeDamage := 0;
      if card2.hp <= 0 then begin
         card1_2.visible := false;
      end;
   end;
end;
procedure TshowIngame.card1_3Click(Sender: TObject);
begin
   if (attackMode) AND (player2hasturn) AND (card3.cardIsPlaced) then begin
      wholeDamage := wholeDamage + card3.damage;
      card1_3.enabled := false;
   end
   else if (attackMode) AND (card3.cardIsPlaced) then begin
      card3.hp := card3.hp - wholeDamage;
      wholeDamage := 0;
      if card3.hp <= 0 then begin
         card1_3.visible := false;
      end;
   end;
end;
procedure TshowIngame.card1_4Click(Sender: TObject);
begin
  if (attackMode) AND (player2hasturn) AND (card4.cardIsPlaced) then begin
      wholeDamage := wholeDamage + card4.damage;
      card1_4.enabled := false;
   end
   else if (attackMode) AND (card4.cardIsPlaced) then begin
      card4.hp := card4.hp - wholeDamage;
      wholeDamage := 0;
      if card4.hp <= 0 then begin
         card1_4.visible := false;
      end;
   end;
end;
procedure TshowIngame.card2_1Click(Sender: TObject);
begin
   if (attackMode) AND (player1hasturn) AND (dcard1.cardIsPlaced) then begin
      wholeDamage := wholeDamage + dcard1.damage;
      card2_1.enabled := false;
   end
   else if (attackMode) AND (dcard1.cardIsPlaced) then begin
      dcard1.hp := dcard1.hp - wholeDamage;
      wholeDamage := 0;
      if dcard1.hp <= 0 then begin
         card2_1.visible := false;
      end;
   end;
end;
procedure TshowIngame.card2_2Click(Sender: TObject);
begin
    if (attackMode) AND (player1hasturn) AND (dcard2.cardIsPlaced) then begin
      wholeDamage := wholeDamage + dcard2.damage;
      card2_2.enabled := false;
   end
   else if (attackMode) AND (dcard2.cardIsPlaced) then begin
      dcard2.hp := dcard2.hp - wholeDamage;
      wholeDamage := 0;
      if dcard2.hp <= 0 then begin
         card2_2.visible := false;
      end;
   end;
end;
procedure TshowIngame.card2_3Click(Sender: TObject);
begin
    if (attackMode) AND (player1hasturn) AND (dcard3.cardIsPlaced) then begin
      wholeDamage := wholeDamage + dcard3.damage;
      card2_3.enabled := false;
   end
   else if (attackMode) AND (dcard3.cardIsPlaced) then begin
      dcard3.hp := dcard3.hp - wholeDamage;
      wholeDamage := 0;
      if dcard3.hp <= 0 then begin
         card2_3.visible := false;
      end;
   end;
end;
procedure TshowIngame.card2_4Click(Sender: TObject);
begin
   if (attackMode) AND (player1hasturn) AND (dcard4.cardIsPlaced) then begin
      wholeDamage := wholeDamage + dcard4.damage;
      card2_4.enabled := false;
   end
   else if (attackMode) AND (dcard4.cardIsPlaced) then begin
      dcard4.hp := dcard4.hp - wholeDamage;
      wholeDamage := 0;
      if dcard4.hp <= 0 then begin
         card2_4.visible := false;
      end;
   end;
end;

//Dragging Painful stuff:


//Karte 1.1

procedure TshowIngame.card1_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  oldleft := card1_1.left;
  oldtop := card1_1.top;
  if (player1.mana >= card1.manacost) AND (card1.cardIsPlaced = false) AND (player2hasturn) then begin
    card1_1.BeginDrag(false);
  end;
end;

procedure TshowIngame.card1_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (card1_1.dragging) AND (player1.mana >= card1.manacost) AND (card1.cardIsPlaced = false) AND (player2hasturn) then
  begin
     card1_1.left := card1_1.left + X - card1_1.width div 2;
     card1_1.top := card1_1.top + Y - card1_1.height div 2;
  end;
end;

procedure TshowIngame.card1_1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  card1_1.EndDrag(false);
  if (card1_1.top <= (cardSlot5.top + cardSlot5.height)) and (lockedfield[1] = false) and not (card1.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_1.Top := cardSlot5.top;
     card1_1.left := cardSlot5.left;
     lockedfield[1] := true;
     player1.Mana := player1.Mana-card1.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card1.cardIsPlaced := true;
  end
  else if (card1_1.top <= (cardSlot6.top + cardSlot6.height)) and (lockedfield[2] = false) and not (card1.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_1.Top := cardSlot6.top;
     card1_1.left := cardSlot6.left;
     lockedfield[2] := true;
     player1.Mana := player1.Mana-card1.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card1.cardIsPlaced := true;
  end
  else if (card1_1.top <= (cardSlot7.top + cardSlot7.height)) and (lockedfield[3] = false) and not (card1.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_1.Top := cardSlot7.top;
     card1_1.left := cardSlot7.left;
     lockedfield[3] := true;
     player1.Mana := player1.Mana-card1.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card1.cardIsPlaced := true;
  end
  else if (card1_1.top <= (cardSlot8.top + cardSlot8.height)) and (lockedfield[4] = false) and not (card1.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_1.Top := cardSlot8.top;
     card1_1.left := cardSlot8.left;
     lockedfield[4] := true;
     player1.Mana := player1.Mana-card1.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card1.cardIsPlaced := true;
  end
  else begin
   card1_1.Left:=oldleft;
   card1_1.top:=oldtop;
  end;
end;

//Karte 1.2

procedure TshowIngame.card1_2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  oldleft := card1_2.left;
  oldtop := card1_2.top;
  if (player1.mana >= card2.manacost) AND (card2.cardIsPlaced = false) AND (player2hasturn) then begin
  card1_2.BeginDrag(false);
  end;
end;

procedure TshowIngame.card1_2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   if (card1_2.dragging) AND (player1.mana >= card2.manacost) AND (card2.cardIsPlaced = false) AND (player2hasturn) then
  begin
     card1_2.left := card1_2.left + X - card1_2.width div 2;
     card1_2.top := card1_2.top + Y - card1_2.height div 2;
  end;
end;

procedure TshowIngame.card1_2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   card1_2.EndDrag(false);
  if (card1_2.top <= (cardSlot5.top + cardSlot5.height)) and (lockedfield[1] = false) and not (card2.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_2.Top := cardSlot5.top;
     card1_2.left := cardSlot5.left;
     lockedfield[1] := true;
     player1.Mana := player1.Mana-card2.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card2.cardIsPlaced := true;
  end
  else if (card1_2.top <= (cardSlot6.top + cardSlot6.height)) and (lockedfield[2] = false) and not (card2.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_2.Top := cardSlot6.top;
     card1_2.left := cardSlot6.left;
     lockedfield[2] := true;
     player1.Mana := player1.Mana-card2.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card2.cardIsPlaced := true;
  end
  else if (card1_2.top <= (cardSlot7.top + cardSlot7.height)) and (lockedfield[3] = false) and not (card2.cardIsPlaced = true )AND (player2hasturn)  then begin
     card1_2.Top := cardSlot7.top;
     card1_2.left := cardSlot7.left;
     lockedfield[3] := true;
     player1.Mana := player1.Mana-card2.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card2.cardIsPlaced := true;
  end
  else if (card1_2.top <= (cardSlot8.top + cardSlot8.height)) and (lockedfield[4] = false) and not (card2.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_2.Top := cardSlot8.top;
     card1_2.left := cardSlot8.left;
     lockedfield[4] := true;
     player1.Mana := player1.Mana-card2.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card2.cardIsPlaced := true;
  end
  else begin
   card1_2.Left:=oldleft;
   card1_2.top:=oldtop;
  end;
end;

//Karte 1.3

procedure TshowIngame.card1_3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  oldleft := card1_3.left;
  oldtop := card1_3.top;
  if (player1.mana >= card3.manacost) AND (card3.cardIsPlaced = false) AND (player2hasturn) then begin
  card1_3.BeginDrag(false);
  end;
end;

procedure TshowIngame.card1_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (card1_3.dragging) AND (player1.mana >= card3.manacost) AND (card3.cardIsPlaced = false) AND (player2hasturn) then
  begin
     card1_3.left := card1_3.left + X - card1_3.width div 2;
     card1_3.top := card1_3.top + Y - card1_3.height div 2;
  end;
end;

procedure TshowIngame.card1_3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  card1_3.EndDrag(false);
  if (card1_3.top <= (cardSlot5.top + cardSlot5.height)) and (lockedfield[1] = false) and not (card3.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_3.Top := cardSlot5.top;
     card1_3.left := cardSlot5.left;
     lockedfield[1] := true;
     player1.Mana := player1.Mana-card3.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card3.cardIsPlaced := true;
  end
  else if (card1_3.top <= (cardSlot6.top + cardSlot6.height)) and (lockedfield[2] = false) and not (card3.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_3.Top := cardSlot6.top;
     card1_3.left := cardSlot6.left;
     lockedfield[2] := true;
     player1.Mana := player1.Mana-card3.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card3.cardIsPlaced := true;
  end
  else if (card1_3.top <= (cardSlot7.top + cardSlot7.height)) and (lockedfield[3] = false) and not (card3.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_3.Top := cardSlot7.top;
     card1_3.left := cardSlot7.left;
     lockedfield[3] := true;
     player1.Mana := player1.Mana-card3.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card3.cardIsPlaced := true;
  end
  else if (card1_3.top <= (cardSlot8.top + cardSlot8.height)) and (lockedfield[4] = false) and not (card3.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_3.Top := cardSlot8.top;
     card1_3.left := cardSlot8.left;
     lockedfield[4] := true;
     player1.Mana := player1.Mana-card3.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card3.cardIsPlaced := true;
  end
  else begin
   card1_3.Left:=oldleft;
   card1_3.top:=oldtop;
  end;
end;

//Karte 1.4

procedure TshowIngame.card1_4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  oldleft := card1_4.left;
  oldtop := card1_4.top;
  if (player1.mana >= card4.manacost)  AND (card4.cardIsPlaced = false) AND (player2hasturn) then begin
  card1_4.BeginDrag(false);
  end;
end;

procedure TshowIngame.card1_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   if (card1_4.dragging) AND (player1.mana >= card4.manacost) AND (card4.cardIsPlaced = false) AND (player2hasturn) then
  begin
     card1_4.left := card1_4.left + X - card1_4.width div 2;
     card1_4.top := card1_4.top + Y - card1_4.height div 2;
  end;
end;

procedure TshowIngame.card1_4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   card1_4.EndDrag(false);
  if (card1_4.top <= (cardSlot5.top + cardSlot5.height)) and (lockedfield[1] = false) and not (card4.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_4.Top := cardSlot5.top;
     card1_4.left := cardSlot5.left;
     lockedfield[1] := true;
     player1.Mana := player1.Mana-card4.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card4.cardIsPlaced := true;
  end
  else if (card1_4.top <= (cardSlot6.top + cardSlot6.height)) and (lockedfield[2] = false) and not (card4.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_4.Top := cardSlot6.top;
     card1_4.left := cardSlot6.left;
     lockedfield[2] := true;
     player1.Mana := player1.Mana-card4.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card4.cardIsPlaced := true;
  end
  else if (card1_4.top <= (cardSlot7.top + cardSlot7.height)) and (lockedfield[3] = false) and not (card4.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_4.Top := cardSlot7.top;
     card1_4.left := cardSlot7.left;
     lockedfield[3] := true;
     player1.Mana := player1.Mana-card4.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card4.cardIsPlaced := true;
  end
  else if (card1_4.top <= (cardSlot8.top + cardSlot8.height)) and (lockedfield[4] = false) and not (card4.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_4.Top := cardSlot8.top;
     card1_4.left := cardSlot8.left;
     lockedfield[4] := true;
     player1.Mana := player1.Mana-card4.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card4.cardIsPlaced := true;
  end
  else begin
   card1_4.Left:=oldleft;
   card1_4.top:=oldtop;
  end;
end;

//Karte 2.1

procedure TshowIngame.card2_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  oldleft := card2_1.left;
  oldtop := card2_1.top;
  if (player2.mana >= dcard1.manacost) AND (dcard1.cardIsPlaced = false) AND (player1hasturn)then begin
  card2_1.BeginDrag(false);
  end;
end;

procedure TshowIngame.card2_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (card2_1.dragging) AND (player2.mana >= dcard1.manacost)  AND (dcard1.cardIsPlaced = false) AND (player1hasturn) then
  begin
     card2_1.left := card2_1.left + X - card2_1.width div 2;
     card2_1.top := card2_1.top + Y - card2_1.height div 2;
  end;
end;

procedure TshowIngame.card2_1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   card2_1.EndDrag(false);
  if ((card2_1.top + card2_1.height) >= cardSlot1.top) and (lockedfield[5] = false) and not (dcard1.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_1.Top := cardSlot1.top;
     card2_1.left := cardSlot1.left;
     lockedfield[5] := true;
     player2.Mana := player2.Mana-dcard1.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard1.cardIsPlaced := true;
  end
  else if ((card2_1.top + card2_1.height) >= cardSlot2.top) and (lockedfield[6] = false) and not (dcard1.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_1.Top := cardSlot2.top;
     card2_1.left := cardSlot2.left;
     lockedfield[6] := true;
     player2.Mana := player2.Mana-dcard1.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard1.cardIsPlaced := true;
  end
  else if ((card2_1.top + card2_1.height)  >= cardSlot3.top) and (lockedfield[7] = false) and not (dcard1.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_1.Top := cardSlot3.top;
     card2_1.left := cardSlot3.left;
     lockedfield[7] := true;
     player2.Mana := player2.Mana-dcard1.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard1.cardIsPlaced := true;
  end
  else if ((card2_1.top + card2_1.height) >= cardSlot4.top) and (lockedfield[8] = false) and not (dcard1.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_1.Top := cardSlot4.top;
     card2_1.left := cardSlot4.left;
     lockedfield[8] := true;
     player2.Mana := player2.Mana-dcard1.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard1.cardIsPlaced := true;
  end
  else begin
   card2_1.Left:=oldleft;
   card2_1.top:=oldtop;
  end;
end;

//Karte 2.2

procedure TshowIngame.card2_2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  oldleft := card2_2.left;
  oldtop := card2_2.top;
  if (player2.mana >= dcard3.manacost)  AND (dcard2.cardIsPlaced = false) AND (player1hasturn) then begin
  card2_2.BeginDrag(false);
  end;
end;

procedure TshowIngame.card2_2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (card2_2.dragging) AND (player2.mana >= dcard3.manacost)  AND (dcard2.cardIsPlaced = false) AND (player1hasturn) then begin
     card2_2.left := card2_2.left + X - card2_2.width div 2;
     card2_2.top := card2_2.top + Y - card2_2.height div 2;
  end;
end;

procedure TshowIngame.card2_2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   card2_2.EndDrag(false);
  if ((card2_2.top + card2_2.height) >= cardSlot1.top) and (lockedfield[5] = false) and not (dcard2.cardIsPlaced = true) AND (player1hasturn) then begin
     card2_2.Top := cardSlot1.top;
     card2_2.left := cardSlot1.left;
     lockedfield[5] := true;
     player2.Mana := player2.Mana-dcard2.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard2.cardIsPlaced := true;
  end
  else if ((card2_2.top + card2_2.height) >= cardSlot2.top) and (lockedfield[6] = false) and not (dcard2.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_2.Top := cardSlot2.top;
     card2_2.left := cardSlot2.left;
     lockedfield[6] := true;
     card2_2.enabled := false;
     player2.Mana := player2.Mana-dcard2.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard2.cardIsPlaced := true;
  end
  else if ((card2_2.top + card2_2.height) >= cardSlot3.top) and (lockedfield[7] = false) and not (dcard2.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_2.Top := cardSlot3.top;
     card2_2.left := cardSlot3.left;
     lockedfield[7] := true;
     player2.Mana := player2.Mana-dcard2.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard2.cardIsPlaced := true;
  end
  else if ((card2_2.top + card2_2.height) >= cardSlot4.top) and (lockedfield[8] = false) and not (dcard2.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_2.Top := cardSlot4.top;
     card2_2.left := cardSlot4.left;
     lockedfield[8] := true;
     player2.Mana := player2.Mana-dcard2.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard2.cardIsPlaced := true;
  end
  else begin
   card2_2.Left:=oldleft;
   card2_2.top:=oldtop;
  end;
end;


//Karte 2.3

procedure TshowIngame.card2_3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  oldleft := card2_3.left;
  oldtop := card2_3.top;
  if (player2.mana >= dcard3.manacost)  AND (dcard3.cardIsPlaced = false) AND (player1hasturn) then begin
  card2_3.BeginDrag(false);
  end;
end;

procedure TshowIngame.card2_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   if (card2_3.dragging) AND (player2.mana >= dcard3.manacost) AND (dcard3.cardIsPlaced = false) AND (player1hasturn) then
  begin
     card2_3.left := card2_3.left + X - card2_3.width div 2;
     card2_3.top := card2_3.top + Y - card2_3.height div 2;
  end;
end;

procedure TshowIngame.card2_3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  card2_3.EndDrag(false);
  if ((card2_3.top + card2_3.height) >= cardSlot1.top) and (lockedfield[5] = false) and not (dcard3.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_3.Top := cardSlot1.top;
     card2_3.left := cardSlot1.left;
     lockedfield[5] := true;
     player2.Mana := player2.Mana-dcard3.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard3.cardIsPlaced := true;
  end
  else if ((card2_3.top + card2_3.height) >= cardSlot2.top) and (lockedfield[6] = false) and not (dcard3.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_3.Top := cardSlot2.top;
     card2_3.left := cardSlot2.left;
     lockedfield[6] := true;
     player2.Mana := player2.Mana-dcard3.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard3.cardIsPlaced := true;
  end
  else if ((card2_3.top + card2_3.height) >= cardSlot3.top) and (lockedfield[7] = false) and not (dcard3.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_3.Top := cardSlot3.top;
     card2_3.left := cardSlot3.left;
     lockedfield[7] := true;
     player2.Mana := player2.Mana-dcard3.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard3.cardIsPlaced := true;
  end
  else if ((card2_3.top + card2_3.height) >= cardSlot4.top) and (lockedfield[8] = false) and not (dcard3.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_3.Top := cardSlot4.top;
     card2_3.left := cardSlot4.left;
     lockedfield[8] := true;
     player2.Mana := player2.Mana-dcard3.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard3.cardIsPlaced := true;
  end
  else begin
   card2_3.Left:=oldleft;
   card2_3.top:=oldtop;
  end;
end;

//Karte 2.4

procedure TshowIngame.card2_4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  oldleft := card2_4.left;
  oldtop := card2_4.top;
  if (player2.mana >= dcard4.manacost) AND (dcard4.cardIsPlaced = false) AND (player1hasturn) then begin
  card2_4.BeginDrag(false);
  end;
end;

procedure TshowIngame.card2_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (card2_4.dragging) AND (player2.mana >= dcard4.manacost) AND (dcard4.cardIsPlaced = false) AND (player1hasturn) then
  begin
     card2_4.left := card2_4.left + X - card2_4.width div 2;
     card2_4.top := card2_4.top + Y - card2_4.height div 2;
  end;
end;

procedure TshowIngame.card2_4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  card2_4.EndDrag(false);
  if ((card2_4.top + card2_4.height) >= cardSlot1.top) and (lockedfield[5] = false) and not (dcard4.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_4.Top := cardSlot1.top;
     card2_4.left := cardSlot1.left;
     lockedfield[5] := true;
     player2.Mana := player2.Mana-dcard4.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard4.cardIsPlaced := true;
  end
  else if ((card2_4.top + card2_4.height) >= cardSlot2.top) and (lockedfield[6] = false) and not (dcard4.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_4.Top := cardSlot2.top;
     card2_4.left := cardSlot2.left;
     lockedfield[6] := true;
     player2.Mana := player2.Mana-dcard4.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard4.cardIsPlaced := true;
  end
  else if ((card2_4.top + card2_4.height) >= cardSlot3.top) and (lockedfield[7] = false) and not (dcard4.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_4.Top := cardSlot3.top;
     card2_4.left := cardSlot3.left;
     lockedfield[7] := true;
     player2.Mana := player2.Mana-dcard4.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard4.cardIsPlaced := true;
  end
  else if ((card2_4.top + card2_4.height) >= cardSlot4.top) and (lockedfield[8] = false) and not (dcard4.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_4.Top := cardSlot4.top;
     card2_4.left := cardSlot4.left;
     lockedfield[8] := true;
     player2.Mana := player2.Mana-dcard4.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard4.cardIsPlaced := true;
  end
  else begin
   card2_4.Left:=oldleft;
   card2_4.top:=oldtop;
  end;
end;


procedure TshowIngame.attackButtonClick(Sender: TObject);
begin
   attackMode := true;
end;

//Zug abgeben

procedure TshowIngame.turnClick(Sender: TObject);
begin
   k := k + 1;

   if k >= 2 then begin
      attackButton.enabled := true;
      attackButton.visible := true;
   end;
   //Welcher Spieler dran ist
    if player1hasturn = true then begin

       player1.Mana := player1.Mana + player1.ManaPerRound;

       player2hasturn := true;
       player1hasturn := false;

       attackButton.top := turn.top + pullCards.height;
    end
    else if player2hasturn = true then begin

       player2.Mana := player2.Mana + player2.ManaPerRound;
       player1hasturn := true;
       player2hasturn := false;

       attackButton.top := turn.top - pullCards.height;
       attackButton.left := turn.left;
       attackButton.height := turn.height;
       attackButton.width := turn.width;

    end;

    card1_1.enabled := true;
    card1_2.enabled := true;
    card1_3.enabled := true;
    card1_4.enabled := true;
    card2_1.enabled := true;
    card2_2.enabled := true;
    card2_3.enabled := true;
    card2_4.enabled := true;

    mana1.text := 'Mana: ' + inttostr(player1.Mana);
    mana2.text := 'Mana: ' + inttostr(player2.Mana);
    hp1.text := 'Hp: ' + inttostr(player1.Hp);
    hp2.text := 'Hp: ' + inttostr(player2.Hp);
    attackMode := false;
    wholeDamage := 0;


end;

procedure TshowIngame.FormShow(Sender: TObject);
begin
   if autoclose then begin
   autoclose := false;
   showingame.hide;
   end;
 end;

procedure TshowIngame.exitButtonClick(Sender: TObject);
begin
   close;
end;

end.



