unit ingame;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TshowIngame }

  TshowIngame = class(TForm)
    card1_1: TImage;
    card1_2: TImage;
    card1_3: TImage;
    card1_4: TImage;
    card2_1: TImage;
    card2_2: TImage;
    card2_3: TImage;
    card2_4: TImage;
    card1_6: TImage;
    card1_7: TImage;
    card1_5: TImage;
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
    procedure card1_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card1_1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure card1_1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card1_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card1_2MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure card1_2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card1_3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card1_3MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure card1_3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card1_4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card1_4MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure card1_4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card2_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card2_1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure card2_1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card2_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card2_2MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure card2_2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card2_3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card2_3MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure card2_3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card2_4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure card2_4MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure card2_4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure exitButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pullCardsClick(Sender: TObject);
  private

  public

  end;

var
  showIngame: TshowIngame;
  currentHeight, currentWidth: integer;  //Screenanpassung

  a, b, c, j: integer;                         //Kartensortiersystem
  cards1: array[1..7] of TImage;
  cards2: array[1..5] of TImage;
  cardscache: array[1..5] of TImage;

  lockedslots2: array[1..4] of boolean;
  lockedslots1: array[1..4] of boolean;

  cache: TImage;

  oldleft, oldtop: integer;                    //DragAndDrop
  lockedfield: array[1..8] of boolean;

  fixxed: boolean;

implementation

{$R *.lfm}

{ TshowIngame }

procedure TshowIngame.FormCreate(Sender: TObject);
begin
    //Kartenset

    lockedslots1[1]:=false;
    lockedslots1[2]:=false;
    lockedslots1[3]:=false;
    lockedslots1[4]:=false;

    cards1[1] := card1_1;  //Karten initialisieren
    cards1[2] := card1_2;
    cards1[3] := card1_3;
    cards1[4] := card1_4;
    cards1[5] := card1_5;
    cards1[6] := card1_6;
    cards1[7] := card1_7;

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


    exitButton.Height := currentHeight div 12;
    exitButton.Width := currentWidth div 6 - Round(currentWidth*(1/12));
    exitButton.Top := Round(currentHeight*(10/12));
    exitButton.Left := Round(currentWidth*(1/24));
    //Exitbutton
    pullCards.Height := exitButton.height;
    pullCards.Width := exitButton.width;
    pullCards.Top := exitButton.top - exitButton.height;
    pullCards.Left := exitButton.left;

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

   Randomize;
   for c := 7 downto 1 do
     begin
          j := Random(c+1);
          cache := cards1[c];
          cards1[c] := cards1[j];
          cards1[j] := cache;
   end;
   for c := 4 downto 1 do
     begin
          j := Random(c+1);
          cache := cards2[c];
          cards2[c] := cards2[j];
          cards2[j] := cache;
     end;

   for a := 1 to 4 do begin
     if lockedslots1[1] = false then begin
         cards1[a].width := cardSlot1.width;
         cards1[a].height := cardSlot1.height;
         cards1[a].left := cardSlot1.left;
         cards1[a].top := cardSlot1.top;
         cards1[a].visible := true;
         lockedslots1[1]:= true;
     end
     else if lockedslots1[2] = false then begin
         cards1[a].width := cardSlot2.width;
         cards1[a].height := cardSlot2.height;
         cards1[a].left := cardSlot2.left;
         cards1[a].top := cardSlot2.top;
         cards1[a].visible := true;
         lockedslots1[2] := true;
      end
      else if lockedslots1[3] = false then begin
         cards1[a].width := cardSlot3.width;
         cards1[a].height := cardSlot3.height;
         cards1[a].left := cardSlot3.left;
         cards1[a].top := cardSlot3.top;
         cards1[a].visible := true;
         lockedslots1[3]:=true;
      end
      else if lockedslots1[4] = false then begin
         cards1[a].width := cardSlot4.width;
         cards1[a].height := cardSlot4.height;
         cards1[a].left := cardSlot4.left;
         cards1[a].top := cardSlot4.top;
         cards1[a].visible := true;
         lockedslots1[4]:=true;
      end;
   end;
   for b := 1 to 4 do begin
     if lockedslots1[5] = false then begin
         cards2[b].width := cardSlot5.width;
         cards2[b].height := cardSlot5.height;
         cards2[b].left := cardSlot5.left;
         cards2[b].top := cardSlot5.top;
         cards2[b].visible := true;
         lockedslots1[5]:= true;
     end
     else if lockedslots1[6] = false then begin
         cards2[b].width := cardSlot6.width;
         cards2[b].height := cardSlot6.height;
         cards2[b].left := cardSlot6.left;
         cards2[b].top := cardSlot6.top;
         cards2[b].visible := true;
         lockedslots1[6] := true;
      end
      else if lockedslots1[7] = false then begin
         cards2[b].width := cardSlot7.width;
         cards2[b].height := cardSlot7.height;
         cards2[b].left := cardSlot7.left;
         cards2[b].top := cardSlot7.top;
         cards2[b].visible := true;
         lockedslots1[7]:=true;
      end
      else if lockedslots1[8] = false then begin
         cards2[b].width := cardSlot8.width;
         cards2[b].height := cardSlot8.height;
         cards2[b].left := cardSlot8.left;
         cards2[b].top := cardSlot8.top;
         cards2[b].visible := true;
         lockedslots1[8]:=true;
      end;
   end;
end;

procedure TshowIngame.exitButtonClick(Sender: TObject);
begin
    close;
end;

//Dragging Painful stuff:


//Karte 1

procedure TshowIngame.card1_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  oldleft := card1_1.left;
  oldtop := card1_1.top;
  card1_1.BeginDrag(false);
end;

procedure TshowIngame.card1_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if card1_1.dragging then
  begin
     card1_1.left := card1_1.left + X - card1_1.width div 2;
     card1_1.top := card1_1.top + Y - card1_1.height div 2;
  end;
end;

procedure TshowIngame.card1_1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  card1_1.EndDrag(false);
  if (card1_1.top <= (cardSlot5.top + cardSlot5.height)) and (lockedfield[1] = false) then begin
     card1_1.Top := cardSlot5.top;
     card1_1.left := cardSlot5.left;
     card1_1.enabled := false;
     lockedfield[1] := true;
  end
  else if (card1_1.top <= (cardSlot6.top + cardSlot6.height)) and (lockedfield[2] = false) then begin
     card1_1.Top := cardSlot6.top;
     card1_1.left := cardSlot6.left;
     card1_1.enabled := false;
     lockedfield[2] := true;
  end
  else if (card1_1.top <= (cardSlot7.top + cardSlot7.height)) and (lockedfield[3] = false) then begin
     card1_1.Top := cardSlot7.top;
     card1_1.left := cardSlot7.left;
     card1_1.enabled := false;
     lockedfield[3] := true;
  end
  else if (card1_1.top <= (cardSlot8.top + cardSlot8.height)) and (lockedfield[4] = false) then begin
     card1_1.Top := cardSlot8.top;
     card1_1.left := cardSlot8.left;
     card1_1.enabled := false;
     lockedfield[4] := true;
  end
  else begin
   card1_1.Left:=oldleft;
   card1_1.top:=oldtop;
  end;
end;

//Karte 2

procedure TshowIngame.card1_2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  oldleft := card1_2.left;
  oldtop := card1_2.top;
  card1_2.BeginDrag(false);
end;

procedure TshowIngame.card1_2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   if card1_2.dragging then
  begin
     card1_2.left := card1_2.left + X - card1_2.width div 2;
     card1_2.top := card1_2.top + Y - card1_2.height div 2;
  end;
end;

procedure TshowIngame.card1_2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   card1_2.EndDrag(false);
  if (card1_2.top <= (cardSlot5.top + cardSlot5.height)) and (lockedfield[1] = false) then begin
     card1_2.Top := cardSlot5.top;
     card1_2.left := cardSlot5.left;
     card1_2.enabled := false;
     lockedfield[1] := true;
  end
  else if (card1_2.top <= (cardSlot6.top + cardSlot6.height)) and (lockedfield[2] = false) then begin
     card1_2.Top := cardSlot6.top;
     card1_2.left := cardSlot6.left;
     card1_2.enabled := false;
     lockedfield[2] := true;
  end
  else if (card1_2.top <= (cardSlot7.top + cardSlot7.height)) and (lockedfield[3] = false) then begin
     card1_2.Top := cardSlot7.top;
     card1_2.left := cardSlot7.left;
     card1_2.enabled := false;
     lockedfield[3] := true;
  end
  else if (card1_2.top <= (cardSlot8.top + cardSlot8.height)) and (lockedfield[4] = false) then begin
     card1_2.Top := cardSlot8.top;
     card1_2.left := cardSlot8.left;
     card1_2.enabled := false;
     lockedfield[4] := true;
  end
  else begin
   card1_2.Left:=oldleft;
   card1_2.top:=oldtop;
  end;
end;

//Karte 3

procedure TshowIngame.card1_3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  oldleft := card1_3.left;
  oldtop := card1_3.top;
  card1_3.BeginDrag(false);
end;

procedure TshowIngame.card1_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if card1_3.dragging then
  begin
     card1_3.left := card1_3.left + X - card1_3.width div 2;
     card1_3.top := card1_3.top + Y - card1_3.height div 2;
  end;
end;

procedure TshowIngame.card1_3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  card1_3.EndDrag(false);
  if (card1_3.top <= (cardSlot5.top + cardSlot5.height)) and (lockedfield[1] = false) then begin
     card1_3.Top := cardSlot5.top;
     card1_3.left := cardSlot5.left;
     card1_3.enabled := false;
     lockedfield[1] := true;
  end
  else if (card1_3.top <= (cardSlot6.top + cardSlot6.height)) and (lockedfield[2] = false) then begin
     card1_3.Top := cardSlot6.top;
     card1_3.left := cardSlot6.left;
     card1_3.enabled := false;
     lockedfield[2] := true;
  end
  else if (card1_3.top <= (cardSlot7.top + cardSlot7.height)) and (lockedfield[3] = false) then begin
     card1_3.Top := cardSlot7.top;
     card1_3.left := cardSlot7.left;
     card1_3.enabled := false;
     lockedfield[3] := true;
  end
  else if (card1_3.top <= (cardSlot8.top + cardSlot8.height)) and (lockedfield[4] = false) then begin
     card1_3.Top := cardSlot8.top;
     card1_3.left := cardSlot8.left;
     card1_3.enabled := false;
     lockedfield[4] := true;
  end
  else begin
   card1_3.Left:=oldleft;
   card1_3.top:=oldtop;
  end;
end;

//Karte 4

procedure TshowIngame.card1_4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  oldleft := card1_4.left;
  oldtop := card1_4.top;
  card1_4.BeginDrag(false);
end;

procedure TshowIngame.card1_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   if card1_4.dragging then
  begin
     card1_4.left := card1_4.left + X - card1_4.width div 2;
     card1_4.top := card1_4.top + Y - card1_4.height div 2;
  end;
end;

procedure TshowIngame.card1_4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   card1_4.EndDrag(false);
  if (card1_4.top <= (cardSlot5.top + cardSlot5.height)) and (lockedfield[1] = false) then begin
     card1_4.Top := cardSlot5.top;
     card1_4.left := cardSlot5.left;
     card1_4.enabled := false;
     lockedfield[1] := true;
  end
  else if (card1_4.top <= (cardSlot6.top + cardSlot6.height)) and (lockedfield[2] = false) then begin
     card1_4.Top := cardSlot6.top;
     card1_4.left := cardSlot6.left;
     card1_4.enabled := false;
     lockedfield[2] := true;
  end
  else if (card1_4.top <= (cardSlot7.top + cardSlot7.height)) and (lockedfield[3] = false) then begin
     card1_4.Top := cardSlot7.top;
     card1_4.left := cardSlot7.left;
     card1_4.enabled := false;
     lockedfield[3] := true;
  end
  else if (card1_4.top <= (cardSlot8.top + cardSlot8.height)) and (lockedfield[4] = false) then begin
     card1_4.Top := cardSlot8.top;
     card1_4.left := cardSlot8.left;
     card1_4.enabled := false;
     lockedfield[4] := true;
  end
  else begin
   card1_4.Left:=oldleft;
   card1_4.top:=oldtop;
  end;
end;

//Karte 5

procedure TshowIngame.card2_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  oldleft := card2_1.left;
  oldtop := card2_1.top;
  card2_1.BeginDrag(false);
end;

procedure TshowIngame.card2_1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if card2_1.dragging then
  begin
     card2_1.left := card2_1.left + X - card2_1.width div 2;
     card2_1.top := card2_1.top + Y - card2_1.height div 2;
  end;
end;

procedure TshowIngame.card2_1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   card2_1.EndDrag(false);
  if ((card2_1.top + card2_1.height) >= cardSlot1.top) and (lockedfield[5] = false) then begin
     card2_1.Top := cardSlot1.top;
     card2_1.left := cardSlot1.left;
     card2_1.enabled := false;
     lockedfield[5] := true;
  end
  else if ((card2_1.top + card2_1.height) >= cardSlot2.top) and (lockedfield[6] = false) then begin
     card2_1.Top := cardSlot2.top;
     card2_1.left := cardSlot2.left;
     card2_1.enabled := false;
     lockedfield[6] := true;
  end
  else if ((card2_1.top + card2_1.height)  >= cardSlot3.top) and (lockedfield[7] = false) then begin
     card2_1.Top := cardSlot3.top;
     card2_1.left := cardSlot3.left;
     card2_1.enabled := false;
     lockedfield[7] := true;
  end
  else if ((card2_1.top + card2_1.height) >= cardSlot4.top) and (lockedfield[8] = false) then begin
     card2_1.Top := cardSlot4.top;
     card2_1.left := cardSlot4.left;
     card2_1.enabled := false;
     lockedfield[8] := true;
  end
  else begin
   card2_1.Left:=oldleft;
   card2_1.top:=oldtop;
  end;
end;

//Karte 6

procedure TshowIngame.card2_2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  oldleft := card2_2.left;
  oldtop := card2_2.top;
  card2_2.BeginDrag(false);
end;

procedure TshowIngame.card2_2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if card2_2.dragging then
  begin
     card2_2.left := card2_2.left + X - card2_2.width div 2;
     card2_2.top := card2_2.top + Y - card2_2.height div 2;
  end;
end;

procedure TshowIngame.card2_2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   card2_2.EndDrag(false);
  if ((card2_2.top + card2_2.height) >= cardSlot1.top) and (lockedfield[5] = false) then begin
     card2_2.Top := cardSlot1.top;
     card2_2.left := cardSlot1.left;
     card2_2.enabled := false;
     lockedfield[5] := true;
  end
  else if ((card2_2.top + card2_2.height) >= cardSlot2.top) and (lockedfield[6] = false) then begin
     card2_2.Top := cardSlot2.top;
     card2_2.left := cardSlot2.left;
     card2_2.enabled := false;
     lockedfield[6] := true;
  end
  else if ((card2_2.top + card2_2.height) >= cardSlot3.top) and (lockedfield[7] = false) then begin
     card2_2.Top := cardSlot3.top;
     card2_2.left := cardSlot3.left;
     card2_2.enabled := false;
     lockedfield[7] := true;
  end
  else if ((card2_2.top + card2_2.height) >= cardSlot4.top) and (lockedfield[8] = false) then begin
     card2_2.Top := cardSlot4.top;
     card2_2.left := cardSlot4.left;
     card2_2.enabled := false;
     lockedfield[8] := true;
  end
  else begin
   card2_2.Left:=oldleft;
   card2_2.top:=oldtop;
  end;
end;

//Karte 7

procedure TshowIngame.card2_3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  oldleft := card2_3.left;
  oldtop := card2_3.top;
  card2_3.BeginDrag(false);
end;

procedure TshowIngame.card2_3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   if card2_3.dragging then
  begin
     card2_3.left := card2_3.left + X - card2_3.width div 2;
     card2_3.top := card2_3.top + Y - card2_3.height div 2;
  end;
end;

procedure TshowIngame.card2_3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  card2_3.EndDrag(false);
  if ((card2_3.top + card2_3.height) >= cardSlot1.top) and (lockedfield[5] = false) then begin
     card2_3.Top := cardSlot1.top;
     card2_3.left := cardSlot1.left;
     card2_3.enabled := false;
     lockedfield[5] := true;
  end
  else if ((card2_3.top + card2_3.height) >= cardSlot2.top) and (lockedfield[6] = false) then begin
     card2_3.Top := cardSlot2.top;
     card2_3.left := cardSlot2.left;
     card2_3.enabled := false;
     lockedfield[6] := true;
  end
  else if ((card2_3.top + card2_3.height) >= cardSlot3.top) and (lockedfield[7] = false) then begin
     card2_3.Top := cardSlot3.top;
     card2_3.left := cardSlot3.left;
     card2_3.enabled := false;
     lockedfield[7] := true;
  end
  else if ((card2_3.top + card2_3.height) >= cardSlot4.top) and (lockedfield[8] = false) then begin
     card2_3.Top := cardSlot4.top;
     card2_3.left := cardSlot4.left;
     card2_3.enabled := false;
     lockedfield[8] := true;
  end
  else begin
   card2_3.Left:=oldleft;
   card2_3.top:=oldtop;
  end;
end;

//Karte 8

procedure TshowIngame.card2_4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   oldleft := card2_4.left;
  oldtop := card2_4.top;
  card2_4.BeginDrag(false);
end;

procedure TshowIngame.card2_4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if card2_4.dragging then
  begin
     card2_4.left := card2_4.left + X - card2_4.width div 2;
     card2_4.top := card2_4.top + Y - card2_4.height div 2;
  end;
end;

procedure TshowIngame.card2_4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  card2_4.EndDrag(false);
  if ((card2_4.top + card2_4.height) >= cardSlot1.top) and (lockedfield[5] = false) then begin
     card2_4.Top := cardSlot1.top;
     card2_4.left := cardSlot1.left;
     card2_4.enabled := false;
     lockedfield[5] := true;
  end
  else if ((card2_4.top + card2_4.height) >= cardSlot2.top) and (lockedfield[6] = false) then begin
     card2_4.Top := cardSlot2.top;
     card2_4.left := cardSlot2.left;
     card2_4.enabled := false;
     lockedfield[6] := true;
  end
  else if ((card2_4.top + card2_4.height) >= cardSlot3.top) and (lockedfield[7] = false) then begin
     card2_4.Top := cardSlot3.top;
     card2_4.left := cardSlot3.left;
     card2_4.enabled := false;
     lockedfield[7] := true;
  end
  else if ((card2_4.top + card2_4.height) >= cardSlot4.top) and (lockedfield[8] = false) then begin
     card2_4.Top := cardSlot4.top;
     card2_4.left := cardSlot4.left;
     card2_4.enabled := false;
     lockedfield[8] := true;
  end
  else begin
   card2_4.Left:=oldleft;
   card2_4.top:=oldtop;
  end;
end;




end.



