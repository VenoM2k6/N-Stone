unit ingame;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TshowIngame }

  TshowIngame = class(TForm)
    card1: TImage;
    card2: TImage;
    card3: TImage;
    card4: TImage;
    card5: TImage;
    card6: TImage;
    card7: TImage;
    card8: TImage;
    pullCards: TButton;
    cardSlot1: TPanel;
    cardSlot2: TPanel;
    cardSlot6: TPanel;
    cardSlot5: TPanel;
    cardSlot4: TPanel;
    cardSlot7: TPanel;
    cardSlot3: TPanel;
    cardSlot8: TPanel;
    exitButton: TButton;
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
    procedure card1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure card1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card2MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure card2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card3MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure card3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card4MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure card4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card5MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure card5MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card6MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure card6MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card7MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure card7MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card8MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card8MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure card8MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure exitButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pullCardsClick(Sender: TObject);
  private

  public

  end;

var
  showIngame: TshowIngame;
  currentHeight, currentWidth: integer;  //Screengröße
  i, j: integer;                         //Laufvariablen
  picked: array[1..20] of boolean;       //Array of bool, um sicherzustellen, dass die Karten noch nd gezogen wurden
  locked1, locked2, locked3, locked4: boolean; //Ob das Feld schon belegt ist
  oldleft, oldtop: integer;                    //Alte Position eines Bildes um es zurückspringen zu lassen, wenn man das Spielbrett verfehlt
  lockedfield: array[1..8] of boolean;

  fixxed: boolean;

implementation

{$R *.lfm}

{ TshowIngame }

procedure TshowIngame.FormCreate(Sender: TObject);
begin
    //Abfrage fürs Platzieren
    lockedfield[1]:=false;
    lockedfield[2]:=false;
    lockedfield[3]:=false;
    lockedfield[4]:=false;
    lockedfield[5]:=false;
    lockedfield[6]:=false;
    lockedfield[7]:=false;
    lockedfield[8]:=false;

    //Abfrage fürs Kartenziehen
    locked1 := false;
    locked2 := false;
    locked3 := false;
    locked4 := false;

    for j:=1 to 20 do begin
       picked[j]:=false;
    end;

    //Anzeige-Einstellungen
    WindowState := wsMaximized;
    currentHeight:=Screen.height;
    currentWidth:=Screen.Width;

    exitButton.Height := currentHeight div 12;
    exitButton.Width := currentWidth div 6 - Round(currentWidth*(1/12));
    exitButton.Top := Round(currentHeight*(10/12));
    exitButton.Left := Round(currentWidth*(1/24));                              //Exitbutton

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
    player2Slot4.width := player1Slot1.width;                                   //Kartengröße

    player1Slot1.left := Round(currentWidth * 0.33);
    player1Slot2.left := player1Slot1.left + player1Slot2.width;
    player1Slot3.left := player1Slot2.left + player1Slot3.width;
    player1Slot4.left := player1Slot3.left + player1Slot4.width;

    player2Slot1.left:=player1Slot1.left;
    player2Slot2.left := player2Slot1.left + player2Slot2.width;
    player2Slot3.left := player2Slot2.left + player2Slot3.width;
    player2Slot4.left := player2Slot3.left + player2Slot4.width;                //Kartenpositionierung auf x - Achse

    player1Slot1.top := Round(currentHeight * 0.75);
    player1Slot2.top := player1Slot1.top;
    player1Slot3.top := player1Slot1.top;
    player1Slot4.top := player1Slot1.top;

    player2Slot1.top := Round(currentHeight * 0.0833);
    player2Slot2.top := player2Slot1.top;
    player2Slot3.top := player2Slot1.top;
    player2Slot4.top := player2Slot1.top;                                       //Kartenpositionierung auf y - Achse

    player1imagefield.Height := Round(currentHeight / 4.5);
    player1imagefield.Width := currentWidth div 6;
    player1imagefield.left := currentWidth div 6;
    player1imagefield.top := Round(currentHeight* 0.6944);                      //Iconpositionierung1

    if player1imagefield.height < player1imagefield.width then begin            //Wenn das Bild zu sehr in die Breite gedehnt wird, dann wird es automatisch quadratisch gemacht
      player1imagefield.width := player1imagefield.height;
      player1imagefield.left:=player1Slot1.left - player1imagefield.width;
    end;

    player2imagefield.Height := player1imagefield.Height;
    player2imagefield.Width := player1imagefield.width;
    player2imagefield.left := player1imagefield.left;
    player2imagefield.top := Round(currentHeight* 0.0833);                      //Iconpositionierung2

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
    cardSlot8.top := cardSlot5.top;                                             //Platzierungsmöglichkeiten der Karten

end;

procedure TshowIngame.pullCardsClick(Sender: TObject);                          //Karten ziehen
begin
        pullCards.enabled:=false;
        pullCards.visible:=false;
        for i:=1 to 100 do begin  //Karten von Spieler 1
          j := Random(5);
          if (j = 1) and (picked[j] = false) and (locked1 = false)then begin     //Karte 1
             card1.width := player1Slot1.width;
             card1.height := player1Slot1.height;
             card1.left := player1Slot1.left;
             card1.top := player1Slot1.top;
             picked[j] := true;
             locked1 := true;
             card1.visible:=true;
          end;
          if (j = 1) and (picked[j] = false) and (locked2 = false)then begin
             card1.width := player1Slot2.width;
             card1.height := player1Slot2.height;
             card1.left := player1Slot2.left;
             card1.top := player1Slot2.top;
             picked[j] := true;
             locked2 := true;
             card1.visible:=true;
          end;
          if (j = 1) and (picked[j] = false) and (locked3 = false)then begin
             card1.width := player1Slot3.width;
             card1.height := player1Slot3.height;
             card1.left := player1Slot3.left;
             card1.top := player1Slot3.top;
             picked[j] := true;
             locked3 := true;
             card1.visible:=true;
           end;
        if (j = 1) and (picked[j] = false) and (locked4 = false)then begin
             card1.width := player1Slot4.width;
             card1.height := player1Slot4.height;
             card1.left := player1Slot4.left;
             card1.top := player1Slot4.top;
             picked[j] := true;
             locked4 := true;
             card1.visible:=true;
           end;

        if (j = 2) and (picked[j] = false) and (locked1 = false)then begin       //Karte 2
             card2.width := player1Slot1.width;
             card2.height := player1Slot1.height;
             card2.left := player1Slot1.left;
             card2.top := player1Slot1.top;
             picked[j] := true;
             locked1 := true;
             card2.visible:=true;
        end;
        if (j = 2) and (picked[j] = false) and (locked2 = false)then begin
             card2.width := player1Slot2.width;
             card2.height := player1Slot2.height;
             card2.left := player1Slot2.left;
             card2.top := player1Slot2.top;
             picked[j] := true;
             locked2 := true;
             card2.visible:=true;
        end;
        if (j = 2) and (picked[j] = false) and (locked3 = false)then begin
             card2.width := player1Slot3.width;
             card2.height := player1Slot3.height;
             card2.left := player1Slot3.left;
             card2.top := player1Slot3.top;
             picked[j] := true;
             locked3 := true;
             card2.visible:=true;
           end;
       if (j = 2) and (picked[j] = false) and (locked4 = false)then begin
             card2.width := player1Slot4.width;
             card2.height := player1Slot4.height;
             card2.left := player1Slot4.left;
             card2.top := player1Slot4.top;
             picked[j] := true;
             locked4 := true;
             card2.visible:=true;
       end;
       if (j = 3) and (picked[j] = false) and (locked1 = false)then begin        //Karte 3
             card3.width := player1Slot1.width;
             card3.height := player1Slot1.height;
             card3.left := player1Slot1.left;
             card3.top := player1Slot1.top;
             picked[j] := true;
             locked1 := true;
             card3.visible:=true;
           end;
      if (j = 3) and (picked[j] = false) and (locked2 = false)then begin
             card3.width := player1Slot2.width;
             card3.height := player1Slot2.height;
             card3.left := player1Slot2.left;
             card3.top := player1Slot2.top;
             picked[j] := true;
             locked2 := true;
             card3.visible:=true;
           end;
      if (j = 3) and (picked[j] = false) and (locked3 = false)then begin
             card3.width := player1Slot3.width;
             card3.height := player1Slot3.height;
             card3.left := player1Slot3.left;
             card3.top := player1Slot3.top;
             picked[j] := true;
             locked3 := true;
             card3.visible:=true;
           end;
      if (j = 3) and (picked[j] = false) and (locked4 = false)then begin
             card3.width := player1Slot4.width;
             card3.height := player1Slot4.height;
             card3.left := player1Slot4.left;
             card3.top := player1Slot4.top;
             picked[j] := true;
             locked4 := true;
             card3.visible:=true;
           end;

      if (j = 4) and (picked[j] = false) and (locked1 = false)then begin         //Karte 4
             card4.width := player1Slot1.width;
             card4.height := player1Slot1.height;
             card4.left := player1Slot1.left;
             card4.top := player1Slot1.top;
             picked[j] := true;
             locked1 := true;
             card4.visible:=true;
           end;
     if (j = 4) and (picked[j] = false) and (locked2 = false)then begin
             card4.width := player1Slot2.width;
             card4.height := player1Slot2.height;
             card4.left := player1Slot2.left;
             card4.top := player1Slot2.top;
             picked[j] := true;
             locked2 := true;
             card4.visible:=true;
           end;
     if (j = 4) and (picked[j] = false) and (locked3 = false)then begin
             card4.width := player1Slot3.width;
             card4.height := player1Slot3.height;
             card4.left := player1Slot3.left;
             card4.top := player1Slot3.top;
             picked[j] := true;
             locked3 := true;
             card4.visible:=true;
           end;
    if (j = 4) and (picked[j] = false) and (locked4 = false)then begin
             card4.width := player1Slot4.width;
             card4.height := player1Slot4.height;
             card4.left := player1Slot4.left;
             card4.top := player1Slot4.top;
             picked[j] := true;
             locked4 := true;
             card4.visible:=true;
       end;
    end;
    locked1 := false;
    locked2 := false;
    locked3 := false;
    locked4 := false;
    picked[1] := false;
    picked[2] := false;
    picked[3] := false;
    picked[4] := false;
    //Hier bitte nicht was ändern
    //Man kann den Code beliebig groß erweitern

    for i:=1 to 100 do begin  //Karten von Spieler 1
          j := Random(5);
          if (j = 1) and (picked[j] = false) and (locked1 = false)then begin     //Karte 1
             card5.width := player2Slot1.width;
             card5.height := player2Slot1.height;
             card5.left := player2Slot1.left;
             card5.top := player2Slot1.top;
             picked[j] := true;
             locked1 := true;
             card5.visible:=true;
          end;
          if (j = 1) and (picked[j] = false) and (locked2 = false)then begin
             card5.width := player2Slot2.width;
             card5.height := player2Slot2.height;
             card5.left := player2Slot2.left;
             card5.top := player2Slot2.top;
             picked[j] := true;
             locked2 := true;
             card5.visible:=true;
          end;
          if (j = 1) and (picked[j] = false) and (locked3 = false)then begin
             card5.width := player2Slot3.width;
             card5.height := player2Slot3.height;
             card5.left := player2Slot3.left;
             card5.top := player2Slot3.top;
             picked[j] := true;
             locked3 := true;
             card5.visible:=true;
           end;
        if (j = 1) and (picked[j] = false) and (locked4 = false)then begin
             card5.width := player2Slot4.width;
             card5.height := player2Slot4.height;
             card5.left := player2Slot4.left;
             card5.top := player2Slot4.top;
             picked[j] := true;
             locked4 := true;
             card5.visible:=true;
           end;

        if (j = 2) and (picked[j] = false) and (locked1 = false)then begin       //Karte 2
             card6.width := player2Slot1.width;
             card6.height := player2Slot1.height;
             card6.left := player2Slot1.left;
             card6.top := player2Slot1.top;
             picked[j] := true;
             locked1 := true;
             card6.visible:=true;
        end;
        if (j = 2) and (picked[j] = false) and (locked2 = false)then begin
             card6.width := player2Slot2.width;
             card6.height := player2Slot2.height;
             card6.left := player2Slot2.left;
             card6.top := player2Slot2.top;
             picked[j] := true;
             locked2 := true;
             card6.visible:=true;
        end;
        if (j = 2) and (picked[j] = false) and (locked3 = false)then begin
             card6.width := player2Slot3.width;
             card6.height := player2Slot3.height;
             card6.left := player2Slot3.left;
             card6.top := player2Slot3.top;
             picked[j] := true;
             locked3 := true;
             card6.visible:=true;
           end;
       if (j = 2) and (picked[j] = false) and (locked4 = false)then begin
             card6.width := player2Slot4.width;
             card6.height := player2Slot4.height;
             card6.left := player2Slot4.left;
             card6.top := player2Slot4.top;
             picked[j] := true;
             locked4 := true;
             card6.visible:=true;
       end;
       if (j = 3) and (picked[j] = false) and (locked1 = false)then begin        //Karte 3
             card7.width := player2Slot1.width;
             card7.height := player2Slot1.height;
             card7.left := player2Slot1.left;
             card7.top := player2Slot1.top;
             picked[j] := true;
             locked1 := true;
             card7.visible:=true;
           end;
      if (j = 3) and (picked[j] = false) and (locked2 = false)then begin
             card7.width := player2Slot2.width;
             card7.height := player2Slot2.height;
             card7.left := player2Slot2.left;
             card7.top := player2Slot2.top;
             picked[j] := true;
             locked2 := true;
             card7.visible:=true;
           end;
      if (j = 3) and (picked[j] = false) and (locked3 = false)then begin
             card7.width := player2Slot3.width;
             card7.height := player2Slot3.height;
             card7.left := player2Slot3.left;
             card7.top := player2Slot3.top;
             picked[j] := true;
             locked3 := true;
             card7.visible:=true;
           end;
      if (j = 3) and (picked[j] = false) and (locked4 = false)then begin
             card7.width := player2Slot4.width;
             card7.height := player2Slot4.height;
             card7.left := player2Slot4.left;
             card7.top := player2Slot4.top;
             picked[j] := true;
             locked4 := true;
             card7.visible:=true;
           end;

      if (j = 4) and (picked[j] = false) and (locked1 = false)then begin         //Karte 4
             card8.width := player2Slot1.width;
             card8.height := player2Slot1.height;
             card8.left := player2Slot1.left;
             card8.top := player2Slot1.top;
             picked[j] := true;
             locked1 := true;
             card8.visible:=true;
           end;
     if (j = 4) and (picked[j] = false) and (locked2 = false)then begin
             card8.width := player2Slot2.width;
             card8.height := player2Slot2.height;
             card8.left := player2Slot2.left;
             card8.top := player2Slot2.top;
             picked[j] := true;
             locked2 := true;
             card8.visible:=true;
           end;
     if (j = 4) and (picked[j] = false) and (locked3 = false)then begin
             card8.width := player2Slot3.width;
             card8.height := player2Slot3.height;
             card8.left := player2Slot3.left;
             card8.top := player2Slot3.top;
             picked[j] := true;
             locked3 := true;
             card8.visible:=true;
           end;
    if (j = 4) and (picked[j] = false) and (locked4 = false)then begin
             card8.width := player2Slot4.width;
             card8.height := player2Slot4.height;
             card8.left := player2Slot4.left;
             card8.top := player2Slot4.top;
             picked[j] := true;
             locked4 := true;
             card8.visible:=true;
       end;
    end;
    locked1 := false;
    locked2 := false;
    locked3 := false;
    locked4 := false;
    picked[1] := false;
    picked[2] := false;
    picked[3] := false;
    picked[4] := false;
    card1.Height:=card1.height;
end;

procedure TshowIngame.exitButtonClick(Sender: TObject);
begin
    close;
end;

//Dragging Painful stuff:


//Karte 1

procedure TshowIngame.card1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  oldleft := card1.left;
  oldtop := card1.top;
  card1.BeginDrag(false);
end;

procedure TshowIngame.card1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if card1.dragging then
  begin
     card1.left := card1.left + X - card1.width div 2;
     card1.top := card1.top + Y - card1.height div 2;
  end;
end;

procedure TshowIngame.card1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  card1.EndDrag(false);
  if (card1.top <= (cardSlot5.top + cardSlot5.height)) and (lockedfield[1] = false) then begin
     card1.Top := cardSlot5.top;
     card1.left := cardSlot5.left;
     card1.enabled := false;
     lockedfield[1] := true;
  end
  else if (card1.top <= (cardSlot6.top + cardSlot6.height)) and (lockedfield[2] = false) then begin
     card1.Top := cardSlot6.top;
     card1.left := cardSlot6.left;
     card1.enabled := false;
     lockedfield[2] := true;
  end
  else if (card1.top <= (cardSlot7.top + cardSlot7.height)) and (lockedfield[3] = false) then begin
     card1.Top := cardSlot7.top;
     card1.left := cardSlot7.left;
     card1.enabled := false;
     lockedfield[3] := true;
  end
  else if (card1.top <= (cardSlot8.top + cardSlot8.height)) and (lockedfield[4] = false) then begin
     card1.Top := cardSlot8.top;
     card1.left := cardSlot8.left;
     card1.enabled := false;
     lockedfield[4] := true;
  end
  else begin
   card1.Left:=oldleft;
   card1.top:=oldtop;
  end;
end;

//Karte 2

procedure TshowIngame.card2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  oldleft := card2.left;
  oldtop := card2.top;
  card2.BeginDrag(false);
end;

procedure TshowIngame.card2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   if card2.dragging then
  begin
     card2.left := card2.left + X - card2.width div 2;
     card2.top := card2.top + Y - card2.height div 2;
  end;
end;

procedure TshowIngame.card2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   card2.EndDrag(false);
  if (card2.top <= (cardSlot5.top + cardSlot5.height)) and (lockedfield[1] = false) then begin
     card2.Top := cardSlot5.top;
     card2.left := cardSlot5.left;
     card2.enabled := false;
     lockedfield[1] := true;
  end
  else if (card2.top <= (cardSlot6.top + cardSlot6.height)) and (lockedfield[2] = false) then begin
     card2.Top := cardSlot6.top;
     card2.left := cardSlot6.left;
     card2.enabled := false;
     lockedfield[2] := true;
  end
  else if (card2.top <= (cardSlot7.top + cardSlot7.height)) and (lockedfield[3] = false) then begin
     card2.Top := cardSlot7.top;
     card2.left := cardSlot7.left;
     card2.enabled := false;
     lockedfield[3] := true;
  end
  else if (card2.top <= (cardSlot8.top + cardSlot8.height)) and (lockedfield[4] = false) then begin
     card2.Top := cardSlot8.top;
     card2.left := cardSlot8.left;
     card2.enabled := false;
     lockedfield[4] := true;
  end
  else begin
   card2.Left:=oldleft;
   card2.top:=oldtop;
  end;
end;

//Karte 3

procedure TshowIngame.card3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  oldleft := card3.left;
  oldtop := card3.top;
  card3.BeginDrag(false);
end;

procedure TshowIngame.card3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if card3.dragging then
  begin
     card3.left := card3.left + X - card3.width div 2;
     card3.top := card3.top + Y - card3.height div 2;
  end;
end;

procedure TshowIngame.card3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  card3.EndDrag(false);
  if (card3.top <= (cardSlot5.top + cardSlot5.height)) and (lockedfield[1] = false) then begin
     card3.Top := cardSlot5.top;
     card3.left := cardSlot5.left;
     card3.enabled := false;
     lockedfield[1] := true;
  end
  else if (card3.top <= (cardSlot6.top + cardSlot6.height)) and (lockedfield[2] = false) then begin
     card3.Top := cardSlot6.top;
     card3.left := cardSlot6.left;
     card3.enabled := false;
     lockedfield[2] := true;
  end
  else if (card3.top <= (cardSlot7.top + cardSlot7.height)) and (lockedfield[3] = false) then begin
     card3.Top := cardSlot7.top;
     card3.left := cardSlot7.left;
     card3.enabled := false;
     lockedfield[3] := true;
  end
  else if (card3.top <= (cardSlot8.top + cardSlot8.height)) and (lockedfield[4] = false) then begin
     card3.Top := cardSlot8.top;
     card3.left := cardSlot8.left;
     card3.enabled := false;
     lockedfield[4] := true;
  end
  else begin
   card3.Left:=oldleft;
   card3.top:=oldtop;
  end;
end;

//Karte 4

procedure TshowIngame.card4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  oldleft := card4.left;
  oldtop := card4.top;
  card4.BeginDrag(false);
end;

procedure TshowIngame.card4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   if card4.dragging then
  begin
     card4.left := card4.left + X - card4.width div 2;
     card4.top := card4.top + Y - card4.height div 2;
  end;
end;

procedure TshowIngame.card4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   card4.EndDrag(false);
  if (card4.top <= (cardSlot5.top + cardSlot5.height)) and (lockedfield[1] = false) then begin
     card4.Top := cardSlot5.top;
     card4.left := cardSlot5.left;
     card4.enabled := false;
     lockedfield[1] := true;
  end
  else if (card4.top <= (cardSlot6.top + cardSlot6.height)) and (lockedfield[2] = false) then begin
     card4.Top := cardSlot6.top;
     card4.left := cardSlot6.left;
     card4.enabled := false;
     lockedfield[2] := true;
  end
  else if (card4.top <= (cardSlot7.top + cardSlot7.height)) and (lockedfield[3] = false) then begin
     card4.Top := cardSlot7.top;
     card4.left := cardSlot7.left;
     card4.enabled := false;
     lockedfield[3] := true;
  end
  else if (card4.top <= (cardSlot8.top + cardSlot8.height)) and (lockedfield[4] = false) then begin
     card4.Top := cardSlot8.top;
     card4.left := cardSlot8.left;
     card4.enabled := false;
     lockedfield[4] := true;
  end
  else begin
   card4.Left:=oldleft;
   card4.top:=oldtop;
  end;
end;

//Karte 5

procedure TshowIngame.card5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  oldleft := card5.left;
  oldtop := card5.top;
  card5.BeginDrag(false);
end;

procedure TshowIngame.card5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if card5.dragging then
  begin
     card5.left := card5.left + X - card5.width div 2;
     card5.top := card5.top + Y - card5.height div 2;
  end;
end;

procedure TshowIngame.card5MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   card5.EndDrag(false);
  if ((card5.top + card5.height) >= cardSlot1.top) and (lockedfield[5] = false) then begin
     card5.Top := cardSlot1.top;
     card5.left := cardSlot1.left;
     card5.enabled := false;
     lockedfield[5] := true;
  end
  else if ((card5.top + card5.height) >= cardSlot2.top) and (lockedfield[6] = false) then begin
     card5.Top := cardSlot2.top;
     card5.left := cardSlot2.left;
     card5.enabled := false;
     lockedfield[6] := true;
  end
  else if ((card5.top + card5.height)  >= cardSlot3.top) and (lockedfield[7] = false) then begin
     card5.Top := cardSlot3.top;
     card5.left := cardSlot3.left;
     card5.enabled := false;
     lockedfield[7] := true;
  end
  else if ((card5.top + card5.height) >= cardSlot4.top) and (lockedfield[8] = false) then begin
     card5.Top := cardSlot4.top;
     card5.left := cardSlot4.left;
     card5.enabled := false;
     lockedfield[8] := true;
  end
  else begin
   card5.Left:=oldleft;
   card5.top:=oldtop;
  end;
end;

//Karte 6

procedure TshowIngame.card6MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  oldleft := card6.left;
  oldtop := card6.top;
  card6.BeginDrag(false);
end;

procedure TshowIngame.card6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if card6.dragging then
  begin
     card6.left := card6.left + X - card6.width div 2;
     card6.top := card6.top + Y - card6.height div 2;
  end;
end;

procedure TshowIngame.card6MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   card6.EndDrag(false);
  if ((card6.top + card6.height) >= cardSlot1.top) and (lockedfield[5] = false) then begin
     card6.Top := cardSlot1.top;
     card6.left := cardSlot1.left;
     card6.enabled := false;
     lockedfield[5] := true;
  end
  else if ((card6.top + card6.height) >= cardSlot2.top) and (lockedfield[6] = false) then begin
     card6.Top := cardSlot2.top;
     card6.left := cardSlot2.left;
     card6.enabled := false;
     lockedfield[6] := true;
  end
  else if ((card6.top + card6.height) >= cardSlot3.top) and (lockedfield[7] = false) then begin
     card6.Top := cardSlot3.top;
     card6.left := cardSlot3.left;
     card6.enabled := false;
     lockedfield[7] := true;
  end
  else if ((card6.top + card6.height) >= cardSlot4.top) and (lockedfield[8] = false) then begin
     card6.Top := cardSlot4.top;
     card6.left := cardSlot4.left;
     card6.enabled := false;
     lockedfield[8] := true;
  end
  else begin
   card6.Left:=oldleft;
   card6.top:=oldtop;
  end;
end;

//Karte 7

procedure TshowIngame.card7MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  oldleft := card7.left;
  oldtop := card7.top;
  card7.BeginDrag(false);
end;

procedure TshowIngame.card7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   if card7.dragging then
  begin
     card7.left := card7.left + X - card7.width div 2;
     card7.top := card7.top + Y - card7.height div 2;
  end;
end;

procedure TshowIngame.card7MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  card7.EndDrag(false);
  if ((card7.top + card7.height) >= cardSlot1.top) and (lockedfield[5] = false) then begin
     card7.Top := cardSlot1.top;
     card7.left := cardSlot1.left;
     card7.enabled := false;
     lockedfield[5] := true;
  end
  else if ((card7.top + card7.height) >= cardSlot2.top) and (lockedfield[6] = false) then begin
     card7.Top := cardSlot2.top;
     card7.left := cardSlot2.left;
     card7.enabled := false;
     lockedfield[6] := true;
  end
  else if ((card7.top + card7.height) >= cardSlot3.top) and (lockedfield[7] = false) then begin
     card7.Top := cardSlot3.top;
     card7.left := cardSlot3.left;
     card7.enabled := false;
     lockedfield[7] := true;
  end
  else if ((card7.top + card7.height) >= cardSlot4.top) and (lockedfield[8] = false) then begin
     card7.Top := cardSlot4.top;
     card7.left := cardSlot4.left;
     card7.enabled := false;
     lockedfield[8] := true;
  end
  else begin
   card7.Left:=oldleft;
   card7.top:=oldtop;
  end;
end;

//Karte 8

procedure TshowIngame.card8MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   oldleft := card8.left;
  oldtop := card8.top;
  card8.BeginDrag(false);
end;

procedure TshowIngame.card8MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if card8.dragging then
  begin
     card8.left := card8.left + X - card8.width div 2;
     card8.top := card8.top + Y - card8.height div 2;
  end;
end;

procedure TshowIngame.card8MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  card8.EndDrag(false);
  if ((card8.top + card8.height) >= cardSlot1.top) and (lockedfield[5] = false) then begin
     card8.Top := cardSlot1.top;
     card8.left := cardSlot1.left;
     card8.enabled := false;
     lockedfield[5] := true;
  end
  else if ((card8.top + card8.height) >= cardSlot2.top) and (lockedfield[6] = false) then begin
     card8.Top := cardSlot2.top;
     card8.left := cardSlot2.left;
     card8.enabled := false;
     lockedfield[6] := true;
  end
  else if ((card8.top + card8.height) >= cardSlot3.top) and (lockedfield[7] = false) then begin
     card8.Top := cardSlot3.top;
     card8.left := cardSlot3.left;
     card8.enabled := false;
     lockedfield[7] := true;
  end
  else if ((card8.top + card8.height) >= cardSlot4.top) and (lockedfield[8] = false) then begin
     card8.Top := cardSlot4.top;
     card8.left := cardSlot4.left;
     card8.enabled := false;
     lockedfield[8] := true;
  end
  else begin
   card8.Left:=oldleft;
   card8.top:=oldtop;
  end;
end;




end.



