unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { Tingame }

  Tingame = class(TForm)
    background: TPanel;
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  ingame: Tingame;
  borderSize: integer; {Rand, den der Background lassen soll}

implementation

{$R *.lfm}

{ Tingame }

procedure Tingame.FormShow(Sender: TObject);
begin
     WindowState := wsFullScreen;

     {das Panel, also der Hintergrund, passt sich modular an den Fullscreen des Nutzers an}
     borderSize:=300;
     background.left:=borderSize;
     background.top:=borderSize;
     background.width:=self.width -2*  borderSize;
     background.height:=self.height -2*  borderSize;

end;

end.

