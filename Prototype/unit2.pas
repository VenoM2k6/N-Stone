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
    {Player1:=TPlayerclass.Create;
    Player1.Name:='Vincent';
    Player1.Mana:=100;
    Player1.Hp:=150;

    hpplayer1.Text:=hpplayer1.text + inttostr(Player1.Hp); }

    WindowState := wsFullScreen;
    currentHeight := Screen.Height;
    currentWidth := Screen.Width;
    background.top:=Round(currentHeight*0.125);
    background.left:=Round(currentWidth*0.1);
    background.Height:=Round(currentHeight*0.7);
    background.width:=Round(currentWidth*0.8);

    player1Show.top:=Round(currentHeight*0.05);
    player1Show.left:=background.left;
    player1Show.height:=Round(currentHeight*0.075);
    player1Show.width:=background.width;

    player2Show.top:=Round(currentHeight*0.875);
    player2Show.left:=background.left;
    player2Show.height:=Round(currentHeight*0.075);
    player2Show.width:=background.width;

    //Positionierung der Lebens- und Manaskala
    hpplayer1.top:=player1Show.top;
    hpplayer1.left:=Round(currentWidth*0.6);
    manaplayer1.top:=hpplayer1.top;
    manaplayer1.left:=Round(currentWidth*0.75);

    hpplayer2.top:=player2Show.top;
    hpplayer2.left:=hpplayer1.left;
    manaplayer2.top:=hpplayer2.top;
    manaplayer2.left:=manaplayer1.left;

    //Schleife für die automatische Skalierung der Skalen
    i:=0;
    repeat
       i:=i+1;
       hpplayer1.font.size:=i;
       hpplayer2.font.size:=i;
       manaplayer1.font.size:=i;
       manaplayer2.font.size:=i;

    until hpplayer1.height=Round(player1Show.height*0.7);

    hpplayer1.width:=manaplayer1.left-hpplayer1.left;
    hpplayer2.width:=manaplayer2.left-hpplayer2.left;
    manaplayer1.width:=Round(currentWidth*0.15);
    manaplayer2.width:=Round(currentWidth*0.15);

    exitImage.Top:=player1Show.top;

    exitImage.Left:=Round(currentWidth*0.025);
    exitImage.Width:=Round(currentWidth*0.05);
    exitImage.Height:=Round(currentWidth*0.05);

    usernameshow1.top:=player1Show.top;
    usernameshow1.left:=player1Show.left;
end;

procedure Tingame.exitImageClick(Sender: TObject);
begin
   close;
end;
end.

