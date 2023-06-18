unit lobbycode;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ColorBox, ingame;

type

  { Tlobby }

  Tlobby = class(TForm)
    background: TImage;
    playbutton: TImage;
    settingsbutton: TImage;
    closebutton: TImage;
    procedure closebuttonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure playbuttonClick(Sender: TObject);


  private

  public

  end;

var
  lobby: Tlobby;
  currentHeight, currentWidth: integer;

implementation

{$R *.lfm}

{ Tlobby }

procedure Tlobby.FormCreate(Sender: TObject);
begin

    lobby.show;

    WindowState := wsMaximized;
    currentHeight := Screen.height;
    currentWidth := Screen.Width;

    background.height := screen.height;
    background.width := screen.width;
    background.top := 0;
    background.left := 0;

    playbutton.height := Round(currentHeight * 0.085);
    playbutton.width := Round(currentHeight * 0.35);
    playbutton.top := Round(currentHeight * 0.34);
    playbutton.left := Round(currentWidth * 0.5 - playbutton.Width / 2);

    settingsbutton.height := playbutton.height;
    settingsbutton.width := playbutton.width;
    settingsbutton.top := playbutton.Top + settingsbutton.height;
    settingsbutton.left := playbutton.left;

    closebutton.height := playbutton.height;
    closebutton.width := playbutton.width;
    closebutton.top := settingsbutton.Top + closebutton.height;
    closebutton.left := playbutton.left;



end;

procedure Tlobby.closebuttonClick(Sender: TObject);
begin
  close;
end;

procedure Tlobby.playbuttonClick(Sender: TObject);
begin
     showingame.show;
end;




end.

