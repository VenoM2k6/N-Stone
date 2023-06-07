unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private

  public

  end;

var
  Form1: TForm1;
  oldleft, oldtop, panelareaheightmax, panelareawidthmax, imageleftmax, imagetopmax: integer;
  fixxed: boolean;

implementation

{$R *.lfm}

{ TForm1 }



procedure TForm1.FormCreate(Sender: TObject);
begin
  panelareaheightmax := panel1.top+panel1.height;
  panelareawidthmax := panel1.left+panel1.Width;

  oldleft := image1.left;
  oldtop := image1.top;
  fixxed := false;
end;
procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   Image1.BeginDrag(False);
end;
procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   if Image1.Dragging then
  begin
    Image1.Left := Image1.Left + X - Image1.Width div 2;
    Image1.Top := Image1.Top + Y - Image1.Height div 2;
  end;
  imageleftmax:=image1.left+image1.width;
  imagetopmax:=image1.top+image1.Height;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Image1.EndDrag(False);

  if ((image1.left>=panel1.left) and (image1.left<=panelareawidthmax) or (imageleftmax>=panel1.left) and (imageleftmax<=panelareawidthmax)) and ((image1.top>=panel1.top) and (image1.top<=panelareaheightmax) or (imagetopmax>=panel1.top) and (imagetopmax<=panelareaheightmax)) then begin
    image1.Left := panel1.left + Round(panel1.width div 2)- Image1.Width div 2;
    image1.top := panel1.top + Round(panel1.height div 2) - Image1.Height div 2;
    image1.enabled:=false;
    fixxed:=true;
  end
  else if fixxed = false then begin
    image1.left:=oldleft;
    image1.top:=oldtop;
  end;

end;

end.

