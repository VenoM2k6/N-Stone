unit ingame;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, playerclass, cardclass, logincode;

type

  { TshowIngame }

  TshowIngame = class(TForm)
    attackButton: TButton;
    card2_5: TImage;
    card1_5: TImage;
    card2_6: TImage;
    card1_6: TImage;
    card2_7: TImage;
    card1_7: TImage;
    card1_8: TImage;
    card2_8: TImage;
    Edit1: TEdit;
    menuButton: TButton;
    continueButton: TButton;
    closeButton: TButton;
    exitButton: TImage;
    menuPanel: TPanel;
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
    procedure continueButtonClick(Sender: TObject);
    procedure closeButtonClick(Sender: TObject);
    procedure exitButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure menuButtonClick(Sender: TObject);
    procedure player1imagefieldClick(Sender: TObject);
    procedure player2imagefieldClick(Sender: TObject);
    procedure turnClick(Sender: TObject);
    procedure turnKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cardsPull;
  private

  public

  end;

var
  areaTwoIsEmpty, areaOneIsEmpty: boolean;

  openWindow: boolean;

  autoclose: boolean;

  attackMode: boolean; //Damage System
  wholeDamage: integer;

  card1, card2, card3, card4, card5, card6, card7, card8, dcard1, dcard2, dcard3, dcard4, dcard5, dcard6, dcard7, dcard8: TCard;  //Spielkarten

  player1, player2: TPlayer;

  player1hasturn, player2hasturn: boolean; //End - Turn Button
  k : integer;

  showIngame: TshowIngame;
  currentHeight, currentWidth: integer;  //Screenanpassung

  a, b, i, j: integer;                   //Kartensortiersystem
  cards1: array[1..8] of TImage;
  cards2: array[1..8] of TImage;
  cards1Pos: array[1..8] of integer;
  cards2Pos: array[1..8] of integer;
  cards1Pl: array[1..8] of boolean;
  cards2Pl: array[1..8] of boolean;

  firstTime: boolean;
  lockedslots2: array[1..4] of boolean;
  lockedslots1: array[1..4] of boolean;
  cache: TImage;

  oldleft, oldtop: integer;               //DragAndDrop
  lockedfield: array[1..8] of boolean;

  fixxed: boolean;

implementation

{$R *.lfm}

{ TshowIngame }

//Das ist die Main Form. Die Prozedur schließt diese am Anfang, damit die Lobby aufgerufen wird

procedure TshowIngame.FormShow(Sender: TObject);
begin
   if autoclose then begin
     autoclose := false;
     showingame.hide;
   end;

 end;

//Alle Werte die festgelegt werden müssen, bevor der Nutzer Eingaben gemacht hat
procedure TshowIngame.cardsPull;
begin

   turn.visible := true;

   for a := 1 to Length(cards1) do begin
    if not cards1Pl[a] then begin
     if lockedslots1[1] = false then begin
         cards1[a].width := player1Slot1.width;
         cards1[a].height := player1Slot1.height;
         cards1[a].left := player1Slot1.left;
         cards1[a].top := player1Slot1.top;
         cards1[a].visible := true;
         lockedslots1[1]:= true;
         cards1Pos[a] := 1;
         cards1Pl[a] := true;
     end
     else if lockedslots1[2] = false then begin
         cards1[a].width := player1Slot2.width;
         cards1[a].height := player1Slot2.height;
         cards1[a].left := player1Slot2.left;
         cards1[a].top := player1Slot2.top;
         cards1[a].visible := true;
         lockedslots1[2] := true;
         cards1Pos[a] := 2;
         cards1Pl[a] := true;
      end
      else if lockedslots1[3] = false then begin
         cards1[a].width := player1Slot3.width;
         cards1[a].height := player1Slot3.height;
         cards1[a].left := player1Slot3.left;
         cards1[a].top := player1Slot3.top;
         cards1[a].visible := true;
         lockedslots1[3]:=true;
         cards1Pos[a] := 3;
         cards1Pl[a] := true;
      end
      else if lockedslots1[4] = false then begin
         cards1[a].width := player1Slot4.width;
         cards1[a].height := player1Slot4.height;
         cards1[a].left := player1Slot4.left;
         cards1[a].top := player1Slot4.top;
         cards1[a].visible := true;
         lockedslots1[4]:=true;
         cards1Pos[a] := 4;
         cards1Pl[a] := true;
       end;
      end;
    end;
   for b := 1 to Length(cards2) do begin
    if not cards2Pl[b] then begin
     if lockedslots2[1] = false then begin
         cards2[b].width := player2Slot1.width;
         cards2[b].height := player2Slot1.height;
         cards2[b].left := player2Slot1.left;
         cards2[b].top := player2Slot1.top;
         cards2[b].visible := true;
         lockedslots2[1]:= true;
         cards2Pos[b] := 1;
         cards2Pl[b] := true;
     end
     else if lockedslots2[2] = false then begin
         cards2[b].width := player2Slot2.width;
         cards2[b].height := player2Slot2.height;
         cards2[b].left := player2Slot2.left;
         cards2[b].top := player2Slot2.top;
         cards2[b].visible := true;
         lockedslots2[2] := true;
         cards2Pos[b] := 2;
         cards2Pl[b] := true;
      end
      else if lockedslots2[3] = false then begin
         cards2[b].width := player2Slot3.width;
         cards2[b].height := player2Slot3.height;
         cards2[b].left := player2Slot3.left;
         cards2[b].top := player2Slot3.top;
         cards2[b].visible := true;
         lockedslots2[3]:=true;
         cards2Pos[b] := 3;
         cards2Pl[b] := true;
      end
      else if lockedslots2[4] = false then begin
         cards2[b].width := player2Slot4.width;
         cards2[b].height := player2Slot4.height;
         cards2[b].left := player2Slot4.left;
         cards2[b].top := player2Slot4.top;
         cards2[b].visible := true;
         lockedslots2[4]:=true;
         cards2Pos[b] := 4;
         cards2Pl[b] := true;
      end;
     end;
   end;
end;
procedure TshowIngame.FormCreate(Sender: TObject);
begin
    firstTime := false;

    //automatische Schließen beim Starten des Programms

    autoclose := true;

    //Abfrage ob das Zwischenmenü schon offen ist, damit man es automatisch schließen kann, wenn man eine Taste drückt

    openWindow := false;

    //Angriffsmodus, welcher über den Attack Button geregelt wird

    attackMode := false;


    //Karten erstellen und Grundwerte zuweisen

    card1 := TCard.Create;
    card2 := TCard.Create;
    card3 := TCard.Create;
    card4 := TCard.Create;
    card5 := TCard.Create;
    card6 := TCard.Create;
    card7 := TCard.Create;
    card8 := TCard.Create;

    dcard1 := TCard.Create;
    dcard2 := TCard.Create;
    dcard3 := TCard.Create;
    dcard4 := TCard.Create;
    dcard5 := TCard.Create;
    dcard6 := TCard.Create;
    dcard7 := TCard.Create;
    dcard8 := TCard.Create;

    card1.hp := 5;
    card2.hp := 8;
    card3.hp := 10;
    card4.hp := 3;
    card5.hp := 5;
    card6.hp := 8;
    card7.hp := 10;
    card8.hp := 3;

    dcard1.hp := card1.hp;
    dcard2.hp := card2.hp;
    dcard3.hp := card3.hp;
    dcard4.hp := card4.hp;
    dcard5.hp := card1.hp;
    dcard6.hp := card2.hp;
    dcard7.hp := card3.hp;
    dcard8.hp := card4.hp;

    card1.damage := 10;
    card2.damage := 3;
    card3.damage := 2;
    card4.damage := 8;
    card5.damage := 10;
    card6.damage := 3;
    card7.damage := 2;
    card8.damage := 8;

    dcard1.damage := card1.damage;
    dcard2.damage := card2.damage;
    dcard3.damage := card3.damage;
    dcard4.damage := card4.damage;
    dcard5.damage := card5.damage;
    dcard6.damage := card6.damage;
    dcard7.damage := card7.damage;
    dcard8.damage := card8.damage;

    card1.manacost := 6;
    card2.manacost := 7;
    card3.manacost := 9;
    card4.manacost := 4;
    card5.manacost := 6;
    card6.manacost := 7;
    card7.manacost := 9;
    card8.manacost := 4;
    dcard1.manacost := card1.manacost;
    dcard2.manacost := card2.manacost;
    dcard3.manacost := card3.manacost;
    dcard4.manacost := card4.manacost;
    dcard5.manacost := card5.manacost;
    dcard6.manacost := card6.manacost;
    dcard7.manacost := card7.manacost;
    dcard8.manacost := card8.manacost;

    card1.CardPosition := 0;
    card2.CardPosition := 0;
    card3.CardPosition := 0;
    card4.CardPosition := 0;
    card5.CardPosition := 0;
    card6.CardPosition := 0;
    card7.CardPosition := 0;
    card8.CardPosition := 0;
    dcard1.CardPosition := 0;
    dcard2.CardPosition := 0;
    dcard3.CardPosition := 0;
    dcard4.CardPosition := 0;
    dcard5.CardPosition := 0;
    dcard6.CardPosition := 0;
    dcard7.CardPosition := 0;
    dcard8.CardPosition := 0;

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

    //Wert welcher Spieler am Zug ist, wenn man den Knopf drückt

    player2hasturn := true;

    //Zählervariable, damit die Spieler nicht direkt am Anfang angreifen können

    k := 0;

    //Abfrage, ob die Slots des Decks belegt sind
    lockedslots1[1]:=false;
    lockedslots1[2]:=false;
    lockedslots1[3]:=false;
    lockedslots1[4]:=false;
    lockedslots2[1]:=false;
    lockedslots2[2]:=false;
    lockedslots2[3]:=false;
    lockedslots2[4]:=false;

    //Karten dem Image-Array zuweisen

    cards1[1] := card1_1;
    cards1[2] := card1_2;
    cards1[3] := card1_3;
    cards1[4] := card1_4;
    cards1[5] := card1_5;
    cards1[6] := card1_6;
    cards1[7] := card1_7;
    cards1[8] := card1_8;

    cards2[1] := card2_1;
    cards2[2] := card2_2;
    cards2[3] := card2_3;
    cards2[4] := card2_4;
    cards2[5] := card2_5;
    cards2[6] := card2_6;
    cards2[7] := card2_7;
    cards2[8] := card2_8;


    //Status über die Felder auf denen man etwas platzieren kann => Wenn diese belegt sind, wird lockedfield[1] true gesetzt

    lockedfield[1]:=false;
    lockedfield[2]:=false;
    lockedfield[3]:=false;
    lockedfield[4]:=false;
    lockedfield[5]:=false;
    lockedfield[6]:=false;
    lockedfield[7]:=false;
    lockedfield[8]:=false;

    //Bildschirm wird ausgefüllt und gemessen

    WindowState := wsMaximized;
    currentHeight:=Screen.height;
    currentWidth:=Screen.Width;

    // Anzeigeeinstellungen Exitbutton => Kann prinzipiell gelöscht werden, weil Menu
    exitButton.height := currentHeight div 10;
    exitButton.width := currentWidth div 7;
    exitButton.top := Round(currentHeight*0.5);
    exitButton.left := Round(currentWidth*(1/24));

    //Anzeigeeinstellungen EndTurnbutton

    turn.height := exitButton.height;
    turn.width := exitButton.width;
    turn.top := Round(currentHeight div 2 - turn.height div 2);
    turn.left := Round(currentWidth*(8/12));

    //Anzeigeeinstellungen PullCardsbutton

    {pullCards.Height := exitButton.height;
    pullCards.Width := exitButton.width + Round(currentWidth * 1/16 );
    pullCards.Top := exitButton.top - exitButton.height;
    pullCards.Left := exitButton.left; }

    //Anzeigeeinstellungen des Kartendecks

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

    //Anzeigeeinstellungen der Basen

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


    //Anzeige Einstellungen für die Platzierungsmöglichkeiten der Karten
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

    cardsPull;
end;

//Angriffsprozeduren

procedure TshowIngame.player1imagefieldClick(Sender: TObject);
begin
   if (card1.CardPosition = 0) and (card2.CardPosition = 0) and (card3.CardPosition = 0) and (card4.CardPosition = 0) then begin
      player1.Hp:=player1.hp - wholeDamage;
      wholeDamage := 0;
      mana1.text := 'Mana: ' + inttostr(player1.Mana);
      hp1.text := 'Hp: ' + inttostr(player1.Hp);
   end;
   if player1.hp <= 0 then begin
      hide;
   end;
end;
procedure TshowIngame.player2imagefieldClick(Sender: TObject);
begin
   if (dcard1.CardPosition = 0) and (dcard2.CardPosition = 0) and (dcard3.CardPosition = 0) and (dcard4.CardPosition = 0) then begin
      player2.Hp:=player2.hp - wholeDamage;
      wholeDamage := 0;
      mana2.text := 'Mana: ' + inttostr(player2.Mana);
      hp2.text := 'Hp: ' + inttostr(player2.Hp);
   end;
   if player2.hp <= 0 then begin
      hide;
   end;
end;
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
         card1.CardPosition := 0;
         cards1Pl[1]:=true;
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
         card2.CardPosition := 0;
         cards1Pl[2]:=true;
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
         card3.CardPosition := 0;
         cards1Pl[3]:=true;
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
         card4.CardPosition := 0;
         cards1Pl[4]:=true;
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
         dcard1.CardPosition := 0;
         cards2Pl[1]:=true;
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
         dcard2.CardPosition := 0;
         cards2Pl[2]:=true;
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
         dcard3.CardPosition := 0;
         cards2Pl[3]:=true;
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
         dcard4.CardPosition := 0;
         cards2Pl[4]:=true;
      end;
   end;
end;


//Drag And Drop


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
     card1.CardPosition := 1;

     lockedslots1[cards1Pos[1]] := false;
     cards1Pl[1] := true;
     cardsPull;

  end
  else if (card1_1.top <= (cardSlot6.top + cardSlot6.height)) and (lockedfield[2] = false) and not (card1.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_1.Top := cardSlot6.top;
     card1_1.left := cardSlot6.left;
     lockedfield[2] := true;
     player1.Mana := player1.Mana-card1.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card1.cardIsPlaced := true;
     card1.CardPosition := 2;

     lockedslots1[cards1Pos[1]] := false;
     cardsPull;
  end
  else if (card1_1.top <= (cardSlot7.top + cardSlot7.height)) and (lockedfield[3] = false) and not (card1.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_1.Top := cardSlot7.top;
     card1_1.left := cardSlot7.left;
     lockedfield[3] := true;
     player1.Mana := player1.Mana-card1.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card1.cardIsPlaced := true;
     card1.CardPosition := 3;

     lockedslots1[cards1Pos[1]] := false;
     cards1Pl[1] := true;
     cardsPull;
  end
  else if (card1_1.top <= (cardSlot8.top + cardSlot8.height)) and (lockedfield[4] = false) and not (card1.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_1.Top := cardSlot8.top;
     card1_1.left := cardSlot8.left;
     lockedfield[4] := true;
     player1.Mana := player1.Mana-card1.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card1.cardIsPlaced := true;
     card1.CardPosition := 4;

     lockedslots1[cards1Pos[1]] := false;
     cards1Pl[1] := true;
     cardsPull;
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
     card2.CardPosition := 1;

     lockedslots1[cards1Pos[2]] := false;
     cards1Pl[2] := true;
     cardsPull;
  end
  else if (card1_2.top <= (cardSlot6.top + cardSlot6.height)) and (lockedfield[2] = false) and not (card2.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_2.Top := cardSlot6.top;
     card1_2.left := cardSlot6.left;
     lockedfield[2] := true;
     player1.Mana := player1.Mana-card2.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card2.cardIsPlaced := true;
     card2.CardPosition := 2;

     lockedslots1[cards1Pos[2]] := false;
     cards1Pl[2] := true;
     cardsPull;
  end
  else if (card1_2.top <= (cardSlot7.top + cardSlot7.height)) and (lockedfield[3] = false) and not (card2.cardIsPlaced = true )AND (player2hasturn)  then begin
     card1_2.Top := cardSlot7.top;
     card1_2.left := cardSlot7.left;
     lockedfield[3] := true;
     player1.Mana := player1.Mana-card2.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card2.cardIsPlaced := true;
     card2.CardPosition := 3;

     lockedslots1[cards1Pos[2]] := false;
     cards1Pl[2] := true;
     cardsPull;
  end
  else if (card1_2.top <= (cardSlot8.top + cardSlot8.height)) and (lockedfield[4] = false) and not (card2.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_2.Top := cardSlot8.top;
     card1_2.left := cardSlot8.left;
     lockedfield[4] := true;
     player1.Mana := player1.Mana-card2.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card2.cardIsPlaced := true;
     card2.CardPosition := 4;

     lockedslots1[cards1Pos[2]] := false;
     cards1Pl[2] := true;
     cardsPull;
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
     card3.CardPosition := 1;

     lockedslots1[cards1Pos[3]] := false;
     cards1Pl[3] := true;
     cardsPull;
  end
  else if (card1_3.top <= (cardSlot6.top + cardSlot6.height)) and (lockedfield[2] = false) and not (card3.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_3.Top := cardSlot6.top;
     card1_3.left := cardSlot6.left;
     lockedfield[2] := true;
     player1.Mana := player1.Mana-card3.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card3.cardIsPlaced := true;
     card3.CardPosition := 2;

     lockedslots1[cards1Pos[3]] := false;
     cards1Pl[3] := true;
     cardsPull;
  end
  else if (card1_3.top <= (cardSlot7.top + cardSlot7.height)) and (lockedfield[3] = false) and not (card3.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_3.Top := cardSlot7.top;
     card1_3.left := cardSlot7.left;
     lockedfield[3] := true;
     player1.Mana := player1.Mana-card3.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card3.cardIsPlaced := true;
     card3.CardPosition := 3;

     lockedslots1[cards1Pos[3]] := false;
     cards1Pl[3] := true;
     cardsPull;
  end
  else if (card1_3.top <= (cardSlot8.top + cardSlot8.height)) and (lockedfield[4] = false) and not (card3.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_3.Top := cardSlot8.top;
     card1_3.left := cardSlot8.left;
     lockedfield[4] := true;
     player1.Mana := player1.Mana-card3.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card3.cardIsPlaced := true;
     card3.CardPosition := 4;

     lockedslots1[cards1Pos[3]] := false;
     cards1Pl[3] := true;
     cardsPull;
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
     card4.CardPosition := 1;

     lockedslots1[cards1Pos[4]] := false;
     cards1Pl[4] := true;
     cardsPull;
  end
  else if (card1_4.top <= (cardSlot6.top + cardSlot6.height)) and (lockedfield[2] = false) and not (card4.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_4.Top := cardSlot6.top;
     card1_4.left := cardSlot6.left;
     lockedfield[2] := true;
     player1.Mana := player1.Mana-card4.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card4.cardIsPlaced := true;
     card4.CardPosition := 2;

     lockedslots1[cards1Pos[4]] := false;
     cards1Pl[4] := true;
     cardsPull;
  end
  else if (card1_4.top <= (cardSlot7.top + cardSlot7.height)) and (lockedfield[3] = false) and not (card4.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_4.Top := cardSlot7.top;
     card1_4.left := cardSlot7.left;
     lockedfield[3] := true;
     player1.Mana := player1.Mana-card4.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card4.cardIsPlaced := true;
     card4.CardPosition := 3;

     lockedslots1[cards1Pos[4]] := false;
     cards1Pl[4] := true;
     cardsPull;
  end
  else if (card1_4.top <= (cardSlot8.top + cardSlot8.height)) and (lockedfield[4] = false) and not (card4.cardIsPlaced = true ) AND (player2hasturn) then begin
     card1_4.Top := cardSlot8.top;
     card1_4.left := cardSlot8.left;
     lockedfield[4] := true;
     player1.Mana := player1.Mana-card4.manacost;
     mana1.text := 'Mana: ' + inttostr(player1.Mana);
     card4.cardIsPlaced := true;
     card4.CardPosition := 4;

     lockedslots1[cards1Pos[4]] := false;
     cards1Pl[4] := true;
     cardsPull;
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
     dcard1.CardPosition := 1;

     lockedslots2[cards2Pos[1]] := false;
     cards2Pl[1] := true;
     cardsPull;
  end
  else if ((card2_1.top + card2_1.height) >= cardSlot2.top) and (lockedfield[6] = false) and not (dcard1.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_1.Top := cardSlot2.top;
     card2_1.left := cardSlot2.left;
     lockedfield[6] := true;
     player2.Mana := player2.Mana-dcard1.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard1.cardIsPlaced := true;
     dcard1.CardPosition := 2;

     lockedslots2[cards2Pos[1]] := false;
     cards2Pl[1] := true;
     cardsPull;
  end
  else if ((card2_1.top + card2_1.height)  >= cardSlot3.top) and (lockedfield[7] = false) and not (dcard1.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_1.Top := cardSlot3.top;
     card2_1.left := cardSlot3.left;
     lockedfield[7] := true;
     player2.Mana := player2.Mana-dcard1.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard1.cardIsPlaced := true;
     dcard1.CardPosition := 3;

     lockedslots2[cards2Pos[1]] := false;
     cards2Pl[1] := true;
     cardsPull;
  end
  else if ((card2_1.top + card2_1.height) >= cardSlot4.top) and (lockedfield[8] = false) and not (dcard1.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_1.Top := cardSlot4.top;
     card2_1.left := cardSlot4.left;
     lockedfield[8] := true;
     player2.Mana := player2.Mana-dcard1.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard1.cardIsPlaced := true;
     dcard1.CardPosition := 4;

     lockedslots2[cards2Pos[1]] := false;
     cards2Pl[1] := true;
     cardsPull;
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
     dcard2.CardPosition := 1;

     lockedslots2[cards2Pos[2]] := false;
     cards2Pl[2] := true;
     cardsPull;
  end
  else if ((card2_2.top + card2_2.height) >= cardSlot2.top) and (lockedfield[6] = false) and not (dcard2.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_2.Top := cardSlot2.top;
     card2_2.left := cardSlot2.left;
     lockedfield[6] := true;
     card2_2.enabled := false;
     player2.Mana := player2.Mana-dcard2.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard2.cardIsPlaced := true;
     dcard2.CardPosition := 2;

     lockedslots2[cards2Pos[2]] := false;
     cards2Pl[2] := true;
     cardsPull;
  end
  else if ((card2_2.top + card2_2.height) >= cardSlot3.top) and (lockedfield[7] = false) and not (dcard2.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_2.Top := cardSlot3.top;
     card2_2.left := cardSlot3.left;
     lockedfield[7] := true;
     player2.Mana := player2.Mana-dcard2.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard2.cardIsPlaced := true;
     dcard2.CardPosition := 3;

     lockedslots2[cards2Pos[2]] := false;
     cards2Pl[2] := true;
     cardsPull;
  end
  else if ((card2_2.top + card2_2.height) >= cardSlot4.top) and (lockedfield[8] = false) and not (dcard2.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_2.Top := cardSlot4.top;
     card2_2.left := cardSlot4.left;
     lockedfield[8] := true;
     player2.Mana := player2.Mana-dcard2.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard2.cardIsPlaced := true;
     dcard2.CardPosition := 4;

     lockedslots2[cards2Pos[2]] := false;
     cards2Pl[2] := true;
     cardsPull;
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
     dcard3.CardPosition := 1;

     lockedslots2[cards2Pos[3]] := false;
     cards2Pl[3] := true;
     cardsPull;
  end
  else if ((card2_3.top + card2_3.height) >= cardSlot2.top) and (lockedfield[6] = false) and not (dcard3.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_3.Top := cardSlot2.top;
     card2_3.left := cardSlot2.left;
     lockedfield[6] := true;
     player2.Mana := player2.Mana-dcard3.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard3.cardIsPlaced := true;
     dcard3.CardPosition := 2;

     lockedslots2[cards2Pos[3]] := false;
     cards2Pl[3] := true;
     cardsPull;
  end
  else if ((card2_3.top + card2_3.height) >= cardSlot3.top) and (lockedfield[7] = false) and not (dcard3.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_3.Top := cardSlot3.top;
     card2_3.left := cardSlot3.left;
     lockedfield[7] := true;
     player2.Mana := player2.Mana-dcard3.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard3.cardIsPlaced := true;
     dcard3.CardPosition := 3;

     lockedslots2[cards2Pos[3]] := false;
     cards2Pl[3] := true;
     cardsPull;
  end
  else if ((card2_3.top + card2_3.height) >= cardSlot4.top) and (lockedfield[8] = false) and not (dcard3.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_3.Top := cardSlot4.top;
     card2_3.left := cardSlot4.left;
     lockedfield[8] := true;
     player2.Mana := player2.Mana-dcard3.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard3.cardIsPlaced := true;
     dcard3.CardPosition := 4;

     lockedslots2[cards2Pos[3]] := false;
     cards2Pl[3] := true;
     cardsPull;


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
     dcard4.CardPosition := 1;

     lockedslots2[cards2Pos[4]] := false;
     cards2Pl[4] := true;
     cardsPull;
  end
  else if ((card2_4.top + card2_4.height) >= cardSlot2.top) and (lockedfield[6] = false) and not (dcard4.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_4.Top := cardSlot2.top;
     card2_4.left := cardSlot2.left;
     lockedfield[6] := true;
     player2.Mana := player2.Mana-dcard4.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard4.cardIsPlaced := true;
     dcard4.CardPosition := 2;

     lockedslots2[cards2Pos[4]] := false;
     cards2Pl[4] := true;
     cardsPull;
  end
  else if ((card2_4.top + card2_4.height) >= cardSlot3.top) and (lockedfield[7] = false) and not (dcard4.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_4.Top := cardSlot3.top;
     card2_4.left := cardSlot3.left;
     lockedfield[7] := true;
     player2.Mana := player2.Mana-dcard4.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard4.cardIsPlaced := true;
     dcard4.CardPosition := 3;

     lockedslots2[cards2Pos[4]] := false;
     cards2Pl[4] := true;
     cardsPull;
  end
  else if ((card2_4.top + card2_4.height) >= cardSlot4.top) and (lockedfield[8] = false) and not (dcard4.cardIsPlaced = true ) AND (player1hasturn) then begin
     card2_4.Top := cardSlot4.top;
     card2_4.left := cardSlot4.left;
     lockedfield[8] := true;
     player2.Mana := player2.Mana-dcard4.manacost;
     mana2.text := 'Mana: ' + inttostr(player2.Mana);
     dcard4.cardIsPlaced := true;
     dcard4.CardPosition := 4;

     lockedslots2[cards2Pos[4]] := false;
     cards2Pl[4] := true;
     cardsPull;
  end
  else begin
   card2_4.Left:=oldleft;
   card2_4.top:=oldtop;
  end;
end;

procedure TshowIngame.closeButtonClick(Sender: TObject);
begin
    close;
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

       attackButton.top := turn.top + turn.height;
    end
    else if player2hasturn = true then begin

       player2.Mana := player2.Mana + player2.ManaPerRound;
       player1hasturn := true;
       player2hasturn := false;

       attackButton.top := turn.top - turn.height;
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

//Zwischenmenü aufrufen und nutzen

procedure TshowIngame.turnKeyUp(Sender: TObject; var Key: Word;            //Diese Prozedur kann gelöscht werden, sobald ein Image den Turn - Button ersetzt
  Shift: TShiftState);
begin
   if (Key = 27)  and (openWindow = false) then begin
        menuPanel.Width := Round(currentWidth * 0.5);
        menuPanel.Height := Round(currentHeight * 0.5);
        menuPanel.left := currentWidth div 2 - menuPanel.width div 2;
        menuPanel.top := currentHeight div 2 - menuPanel.Height div 2;
        menuPanel.Visible := true;
        menuPanel.BringToFront;

        menuButton.width := Round(menuPanel.width * 0.7);
        menuButton.height := Round(menuPanel.height * 0.2);
        menuButton.left := Round(menuPanel.width * 0.5) + menuPanel.left - menuButton.width div 2;
        menuButton.top := currentHeight div 2 - menuButton.height div 2;
        menuButton.Visible := true;

        continueButton.width := menuButton.width;
        continueButton.height := menuButton.height;
        continueButton.left := menuButton.left;
        continueButton.Top := menuButton.Top - continueButton.height;
        continueButton.visible := true;

        closeButton.width := continueButton.width;
        closeButton.height := continueButton.height;
        closeButton.left := continueButton.left;
        closeButton.top := menuButton.top + closeButton.height;
        closeButton.visible := true;
        openWindow := true;
    end
    else begin
       closeButton.visible := false;
       continueButton.visible := false;
       menuButton.visible := false;
       menuPanel.visible := false;
       openWindow := false;
    end;
end;
procedure TshowIngame.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = 27)  and (openWindow = false) then begin
        menuPanel.Width := Round(currentWidth * 0.5);
        menuPanel.Height := Round(currentHeight * 0.5);
        menuPanel.left := currentWidth div 2 - menuPanel.width div 2;
        menuPanel.top := currentHeight div 2 - menuPanel.Height div 2;
        menuPanel.Visible := true;
        menuPanel.BringToFront;

        menuButton.width := Round(menuPanel.width * 0.7);
        menuButton.height := Round(menuPanel.height * 0.2);
        menuButton.left := Round(menuPanel.width * 0.5) + menuPanel.left - menuButton.width div 2;
        menuButton.top := currentHeight div 2 - menuButton.height div 2;
        menuButton.Visible := true;

        continueButton.width := menuButton.width;
        continueButton.height := menuButton.height;
        continueButton.left := menuButton.left;
        continueButton.Top := menuButton.Top - continueButton.height;
        continueButton.visible := true;

        closeButton.width := continueButton.width;
        closeButton.height := continueButton.height;
        closeButton.left := continueButton.left;
        closeButton.top := menuButton.top + closeButton.height;
        closeButton.visible := true;
        openWindow := true;
    end
    else begin
       closeButton.visible := false;
       continueButton.visible := false;
       menuButton.visible := false;
       menuPanel.visible := false;
       openWindow := false;
    end;
end;
procedure TshowIngame.menuButtonClick(Sender: TObject);
begin
   hide;
   closeButton.visible := false;
   continueButton.visible := false;
   menuButton.visible := false;
   menuPanel.visible := false;
   openWindow := false;
end;
procedure TshowIngame.continueButtonClick(Sender: TObject);
begin
  closeButton.visible := false;
  continueButton.visible := false;
  menuButton.visible := false;
  menuPanel.visible := false;
  openWindow :=  false;
end;
procedure TshowIngame.exitButtonClick(Sender: TObject);
begin
   close;
end;

end.



