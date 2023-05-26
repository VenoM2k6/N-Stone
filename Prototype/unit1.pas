unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Unit2;

type

  { Tmenu }

  Tmenu = class(TForm)
    startButton: TButton;
    exitButton: TButton;
    procedure exitButtonClick(Sender: TObject);
    procedure startButtonClick(Sender: TObject);
  private

  public

  end;

var
  menu: Tmenu;

implementation

{$R *.lfm}

{ Tmenu }

procedure Tmenu.startButtonClick(Sender: TObject);
begin
   ingame.Show;
   hide;
end;

procedure Tmenu.exitButtonClick(Sender: TObject);
begin
  close;
end;

end.

