unit logincode;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { Tloginmenu }

  Tloginmenu = class(TForm)
    classchooser1: TComboBox;
    classchooser2: TComboBox;
    signin1: TButton;
    signin2: TButton;
    signup1: TButton;
    player1: TEdit;
    name1: TEdit;
    password1: TEdit;
    player2: TEdit;
    name2: TEdit;
    password2: TEdit;
    signup2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure name1Click(Sender: TObject);
    procedure name2Click(Sender: TObject);
    procedure password1Click(Sender: TObject);
    procedure password2Click(Sender: TObject);
    procedure signin1Click(Sender: TObject);
    procedure signin2Click(Sender: TObject);
    procedure signup1Click(Sender: TObject);
    procedure signup2Click(Sender: TObject);
  private

  public

  end;

var
  loginmenu: Tloginmenu;
  currentHeight, currentWidth: integer;
  typedPassword1, typedPassword2: string;

implementation

{$R *.lfm}

{ Tloginmenu }

procedure Tloginmenu.FormCreate(Sender: TObject);
begin
  currentHeight := screen.height;
  currentWidth := screen.width;
  loginmenu.show;

  loginmenu.height := currentHeight div 2;
  loginmenu.width := currentWidth div 2;
  loginmenu.Left := currentWidth div 2 - loginmenu.width div 2;
  loginmenu.top := currentHeight div 2 - loginmenu.height div 2;

  player1.height := loginmenu.height div 8;
  player1.width := loginmenu.width div 5;
  player1.left := loginmenu.width div 2 - 2 * player1.width;
  player1.top := loginmenu.height div 8;
  player1.font.size := 25;

  signin1.Height := player1.height;
  signin1.width := player1.width;
  signin1.left := player1.left;
  signin1.top := player1.top + loginmenu.height div 6;

  signup1.height := signin1.height;
  signup1.width := signin1.width;
  signup1.left := signin1.left;
  signup1.top := signin1.top + loginmenu.height div 8;

  player2.height := player1.height;
  player2.width := player1.width;
  player2.top := player1.Top;
  player2.left := loginmenu.width div 2 + player2.width;
  player2.font.size := 25;

  signin2.height := signin1.height;
  signin2.width :=  signin1.width;
  signin2.left := player2.left;
  signin2.top := player2.top + loginmenu.height div 6;

  signup2.height := signup1.height;
  signup2.width := signup1.width;
  signup2.top := signin2.top + loginmenu.height div 8;
  signup2.left := player2.left;

  name1.height := signin1.height;
  name1.width := signin1.width;
  name1.left := signin1.left;
  name1.top := signin1.top;
  name1.font.size := 15;

  password1.height := signup1.height;
  password1.width := signup1.width;
  password1.left := signup1.left;
  password1.top := signup1.top;
  password1.font.size := 13;

  name2.height := signin2.height;
  name2.width := signin2.width;
  name2.left := signin2.left;
  name2.top := signin2.top;
  name2.font.size := 13;

  password2.height := signup2.height;
  password2.width := signup2.width;
  password2.left := signup2.left;
  password2.top := signup2.top;
  password2.font.size := 15;

  classchooser1.height := name1.height;
  classchooser1.width := name1.width;
  classchooser1.left := name1.left;
  classchooser1.top := password1.top + loginmenu.height div 8;
  classchooser1.Font.Size := 25;

  classchooser2.height := name2.height;
  classchooser2.height := name2.height;
  classchooser2.width := name2.width;
  classchooser2.left := name2.left;
  classchooser2.top := password2.top + loginmenu.height div 8;
  classchooser2.Font.Size := 25;

  classchooser1.Items.Add('Mage');
  classchooser1.Items.Add('Ranged');
  classchooser1.Items.Add('Melee');

  classchooser2.Items := classchooser1.Items;

end;

procedure Tloginmenu.name1Click(Sender: TObject);
begin
  name1.text := '';
end;

procedure Tloginmenu.name2Click(Sender: TObject);
begin
  name2.text := '';
end;

procedure Tloginmenu.password1Click(Sender: TObject);
begin
  password1.text := '';
end;

procedure Tloginmenu.password2Click(Sender: TObject);
begin
  password2.text := '';
end;

procedure Tloginmenu.signin1Click(Sender: TObject);
begin
  signin1.visible := false;
  signup1.Visible := false;
  name1.visible := true;
  password1.visible := true;

end;

procedure Tloginmenu.signin2Click(Sender: TObject);
begin
  signin2.visible := false;
  signup2.Visible := false;
  name2.visible := true;
  password2.visible := true;
end;

procedure Tloginmenu.signup1Click(Sender: TObject);
begin
  name1.visible := true;
  password1.visible := true;
  signin1.visible := false;
  signup1.visible := false;

  name1.text := 'Choose Name';
  password1.text := 'Choose Password';

  name1.width := name1.width + name1.width div 4;
  password1.width := password1.width + password1.width div 4;

  classchooser1.visible := true;
end;

procedure Tloginmenu.signup2Click(Sender: TObject);
begin
  name2.visible := true;
  password2.visible := true;
  signin2.visible := false;
  signup2.visible := false;

  name2.text := 'Choose Name';
  password2.text := 'Choose Password';

  name2.width := name2.width + name2.width div 4;
  password2.width := password2.width + password2.width div 4;

  classchooser2.visible := true;
end;

end.

