unit menucode;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TmenuBetween }

  TmenuBetween = class(TForm)
    mainmenu: TButton;
    closeButton: TButton;
    continueButton: TButton;
    procedure continueButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mainmenuClick(Sender: TObject);
  private

  public

  end;

var
  menuBetween: TmenuBetween;
  currentWidth, currentHeight: integer;

implementation

{$R *.lfm}

{ TmenuBetween }

procedure TmenuBetween.FormShow(Sender: TObject);
begin
    currentHeight := screen.height;
    currentWidth := screen.width;

    menuBetween.width := Round(currentWidth * 0.5);
    menuBetween.height := Round(currentHeight * 0.5);
    menuBetween.left := currentWidth div 2  - menuBetween.width div 2;
    menuBetween.top := currentHeight div 2 - menuBetween.height div 2;

    continueButton.height := menuBetween.height div 6;
    continueButton.width := menuBetween.width div 3;
    continueButton.left := menuBetween.width div 2 - continueButton.width div 2;
    continueButton.top :=  menuBetween.height div 2 - continueButton.height;

    closeButton.height := continueButton.height;
    closeButton.width := continueButton.width;
    closeButton.left := continueButton.left;
    closeButton.top := continueButton.top + closeButton.height;
end;

procedure TmenuBetween.mainmenuClick(Sender: TObject);
begin
end;

procedure TmenuBetween.continueButtonClick(Sender: TObject);
begin
  hide;
end;

procedure TmenuBetween.mainMenu(Sender: TObject);
begin
   Application.MainForm.close;
end;

end.

