unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Playerclass;

type

  { Tingame }

  Tingame = class(TForm)
    background: TPanel;
    hpplayer1: TEdit;
    exitImage: TImage;
    manaplayer1: TEdit;
    hpplayer2: TEdit;
    manaplayer2: TEdit;
    usernameshow1: TEdit;
    player1Show: TPanel;
    player2Show: TPanel;
    usernameshow2: TEdit;
    procedure FormShow(Sender: TObject);
    procedure exitImageClick(Sender: TObject);
  private

  public

  end;

var
  ingame: Tingame;
  i, currentHeight, currentWidth: integer;
  Player1: TPlayerclass;

implementation

{$R *.lfm}

{ Tingame }



procedure Tingame.FormShow(Sender: TObject);
begin
    hpplayer1.text:=inttostr(Player1.Hp);
   {Kurze Erklärung des Codes: Jede einzelne Anzeige skaliert mit einem Anteil der Bildschirmgröße.
                                Schriftgrößen hingegen skalieren mit dem Anteil der Höhen ihres Editfelds}

    //Bildschirmgröße wird erfasst
    WindowState := wsFullScreen;
    currentHeight := Screen.Height;
    currentWidth := Screen.Width;

    //Positionierung und Größe des Spielfelds
    background.top:=Round(currentHeight*0.125);
    background.left:=Round(currentWidth*0.1);
    background.Height:=Round(currentHeight*0.75);
    background.width:=Round(currentWidth*0.8);

    //Das sind die Statistik Balken(sehr hilfreich um alles geordnet und orientiert an deren Position zu platzieren)
    player1Show.top:=Round(currentHeight*0.05);
    player1Show.left:=background.left;
    player1Show.height:=Round(currentHeight*0.075);
    player1Show.width:=background.width;

    player2Show.top:=Round(currentHeight*0.895);
    player2Show.left:=background.left;
    player2Show.height:=Round(currentHeight*0.075);
    player2Show.width:=background.width;

    //Positionierung der Anzeigen
    hpplayer1.top:=player1Show.top;
    hpplayer1.left:=Round(currentWidth*0.6);
    manaplayer1.top:=hpplayer1.top;
    manaplayer1.left:=Round(currentWidth*0.75);

    hpplayer2.top:=player2Show.top;
    hpplayer2.left:=hpplayer1.left;
    manaplayer2.top:=hpplayer2.top;
    manaplayer2.left:=manaplayer1.left;

    usernameshow1.top:=player1Show.top;
    usernameshow1.left:=player1Show.left;
    usernameshow2.top:=player2Show.top;
    usernameshow2.left:=player2Show.left;

    //Größe der Anzeigen
    hpplayer1.height:=player1Show.height;
    hpplayer2.height:=player1Show.height;
    manaplayer1.height:=player1Show.height;
    manaplayer2.height:=player1Show.height;

    hpplayer1.Font.size:=Round(hpplayer1.Height*0.4);
    hpplayer2.font.size:=Round(hpplayer2.height*0.4);
    manaplayer1.font.size:=Round(manaplayer1.height*0.4);
    manaplayer2.font.size:=Round(manaplayer2.height*0.4);

    usernameshow1.height:=player1Show.height;
    usernameshow1.width:=Round(currentWidth*0.2);
    usernameshow1.Font.size:=Round(usernameshow1.Height*0.4);

    usernameshow2.height:=player2Show.height;
    usernameshow2.width:=Round(currentWidth*0.2);
    usernameshow2.Font.size:=Round(usernameshow2.Height*0.4);

    hpplayer1.width:=manaplayer1.left-hpplayer1.left;
    hpplayer2.width:=manaplayer2.left-hpplayer2.left;
    manaplayer1.width:=Round(currentWidth*0.15);
    manaplayer2.width:=Round(currentWidth*0.15);

    //Bildeinstellung des Exitbuttons
    exitImage.Top:=player1Show.top;
    exitImage.Left:=Round(currentWidth*0.025);
    exitImage.Width:=Round(currentWidth*0.05);
    exitImage.Height:=Round(currentWidth*0.05);




end;

procedure Tingame.exitImageClick(Sender: TObject);
begin
   close;
end;
end.

