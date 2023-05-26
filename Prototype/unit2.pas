unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { Tingame }

  Tingame = class(TForm)
    background: TPanel;
    hpplayer1: TEdit;
    exitImage: TImage;
    manaplayer1: TEdit;
    hpplayer2: TEdit;
    manaplayer2: TEdit;
    player1Show: TPanel;
    player2Show: TPanel;
    procedure FormShow(Sender: TObject);
    procedure exitImageClick(Sender: TObject);
  private

  public

  end;

var
  ingame: Tingame;

implementation

{$R *.lfm}

{ Tingame }



procedure Tingame.FormShow(Sender: TObject);
begin
    WindowState := wsFullScreen;

     background.left:=300*2;
     background.top:=300;
     background.width:=self.width -4*  300;
     background.height:=self.height -2*  300;

     player1Show.width:=background.width;
     player1Show.height:=300-150;
     player1Show.top:=150;
     player1Show.left:=background.left;

     player2Show.width:=background.width;
     player2Show.height:=300-150;
     player2Show.top:=300+background.height;
     player2Show.left:=background.left;

     hpplayer2.top:=player1Show.top+40;
     manaplayer2.top:=hpplayer2.top+40;
     hpplayer2.left:=player1Show.left + 1000;
     manaplayer2.left:=player1Show.left + 1000;


     hpplayer1.top:=player2Show.top+40;
     manaplayer1.top:=hpplayer1.top+40;
     hpplayer1.left:=player1Show.left + 1000;
     manaplayer1.left:=player1Show.left + 1000;

     exitImage.top:=player1Show.top;
     exitImage.left:=40;
     exitImage.height:=player1Show.height;
end;

procedure Tingame.exitImageClick(Sender: TObject);
begin
   close;
end;
end.

