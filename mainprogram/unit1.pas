unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure startButton(Sender: TObject);
    procedure exitButton(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.startButton(Sender: TObject);
begin
   ingame.Show;
   hide;
end;

procedure TForm1.exitButton(Sender: TObject);
begin
   close;
end;

end.

