unit lobbycode;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ColorBox, ingame, logincode;

type

  { Tlobby }

  Tlobby = class(TForm)
    background: TImage;
    inventory1: TImage;
    inventory2: TImage;
    playbutton: TImage;
    settingsbutton: TImage;
    closebutton: TImage;
    procedure backgroundClick(Sender: TObject);
    procedure backgroundDblClick(Sender: TObject);
    procedure closebuttonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure playbuttonClick(Sender: TObject);


  private

  public

  end;

var
  lobby: Tlobby;
  currentHeight, currentWidth: integer;

  logincompleted: boolean;

implementation

{$R *.lfm}

{ Tlobby }

procedure Tlobby.FormCreate(Sender: TObject);
begin
    background.sendtoback;

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

    inventory1.height := screen.height div 3;
    inventory1.width := screen.width div 4;
    inventory1.left := screen.width div 120;
    inventory1.top := screen.height div 160;

    inventory2.height := inventory1.height;
    inventory2.width := inventory1.width;
    inventory2.top := inventory1.top;
    inventory2.left := screen.width - inventory1.left - Round(6*inventory2.width / 8.5) ;
end;

procedure Tlobby.closebuttonClick(Sender: TObject);
begin
  close;
end;

procedure Tlobby.backgroundClick(Sender: TObject);
begin
   if not logincompleted then begin
     loginmenu.show;
   end;
end;

procedure Tlobby.backgroundDblClick(Sender: TObject);
begin
   if not logincompleted then begin
     loginmenu.show;
   end;
end;

procedure Tlobby.playbuttonClick(Sender: TObject);
begin
     showingame.show;
end;




end.

