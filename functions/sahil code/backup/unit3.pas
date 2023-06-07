unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Playerclass, Unit2;

type

  { Tchoose }

  Tchoose = class(TForm)
    Button1: TButton;
    Button2: TButton;
    startButton: TButton;
    playershow1: TEdit;
    name1: TEdit;
    playershow2: TEdit;
    hp1: TEdit;
    name2: TEdit;
    mana1: TEdit;
    hp2: TEdit;
    mana2: TEdit;
    background: TPanel;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure hp1Click(Sender: TObject);
    procedure hp2Click(Sender: TObject);
    procedure mana1Click(Sender: TObject);
    procedure mana2Click(Sender: TObject);
    procedure name1Click(Sender: TObject);
    procedure name2Click(Sender: TObject);
    procedure startButtonClick(Sender: TObject);

  private

  public
    Player1: TPlayerclass;
    Player2: TPlayerclass;
  end;

var
  choose: Tchoose;
  number, currentHeight, currentWidth: integer;
  path, sLine: string;
  c1, c2, c3, c4, c5, c6: boolean;  //c für cleared
  myfile: TextFile;

implementation

{$R *.lfm}

{ Tchoose }

procedure Tchoose.FormShow(Sender: TObject);
begin

  c1:=false;
  c2:=false;
  c3:=false;
  c4:=false;
  c5:=false;
  c6:=false;

  playershow1.bringtofront;
  playershow2.bringtofront;
  name1.bringtofront;
  name2.bringtofront;
  hp1.bringtofront;
  hp2.bringtofront;
  mana1.bringtofront;
  mana2.bringtofront;
  startButton.bringtofront;

  //Bildschirmgröße wird erfasst
  WindowState := wsFullScreen;
  currentHeight:=Screen.Height;
  currentWidth:=Screen.Width;

  //Hintergrund-Einstellungen
  background.top:=Round(currentHeight*0.1);
  background.left:=Round(currentWidth*0.2);
  background.Height:=Round(currentHeight*0.8);
  background.width:=Round(currentWidth*0.6);

  //Skalierung der Anzeigen
  playershow1.height:=Round(background.height*0.06);
  playershow2.height:=Round(background.height*0.06);
  playershow1.width:=Round(background.width*0.2);
  playershow2.width:=Round(background.width*0.2);

  playershow1.font.size:=Round(playershow1.height*0.4);
  playershow2.font.size:=Round(playershow1.height*0.4);

  name1.height:=Round(background.height*0.04);
  name2.height:=Round(background.height*0.04);
  name1.width:=Round(background.width*0.2);
  name2.width:=Round(background.width*0.2);

  hp1.height:=Round(background.height*0.04);
  hp2.height:=Round(background.height*0.04);
  hp1.width:=Round(background.width*0.2);
  hp2.width:=Round(background.width*0.2);

  mana1.height:=Round(background.height*0.04);
  mana2.height:=Round(background.height*0.04);
  mana1.width:=Round(background.width*0.2);
  mana2.width:=Round(background.width*0.2);

  name1.font.size:=Round(name1.height*0.4);
  name2.font.size:=Round(name2.height*0.4);

  hp1.font.size:=Round(hp1.height*0.4);
  hp2.font.size:=Round(hp2.height*0.4);

  mana1.font.size:=Round(mana1.height*0.4);
  mana2.font.size:=Round(mana2.height*0.4);

  startButton.Height:=Round(background.height*0.15);
  startButton.Width:=Round(background.width*0.2);

  //Positionierung der Anzeigen
  playershow1.left:=background.left+Round(currentWidth*0.05);
  playershow2.left:=background.left+Round(currentWidth*0.25);

  playershow1.top:=background.top+Round(currentHeight*0.1);
  playershow2.top:=playershow1.top;

  name1.left:=playershow1.left;
  hp1.left:=playershow1.left;
  mana1.left:=playershow1.left;

  name2.left:=playershow2.left;
  hp2.left:=playershow2.left;
  mana2.left:=playershow2.left;

  name1.top:=playershow1.top+Round(currentHeight*0.13);
  hp1.top:=name1.top+Round(currentHeight*0.13);
  mana1.top:=hp1.top+Round(currentHeight*0.13);

  name2.top:=playershow2.top+Round(currentHeight*0.13);
  hp2.top:=name2.top+Round(currentHeight*0.13);
  mana2.top:=hp2.top+Round(currentHeight*0.13);

  startButton.left:=background.left+Round(background.width*0.75);
  startButton.top:=background.top+Round(background.height*0.8);
end;

procedure Tchoose.Button2Click(Sender: TObject);
begin

end;

procedure Tchoose.FormCreate(Sender: TObject);
begin

end;

procedure Tchoose.hp1Click(Sender: TObject);
begin
  if c1 = false then begin
   hp1.text:='';
   c1:=true;
  end;
end;

procedure Tchoose.hp2Click(Sender: TObject);
begin
  if c2 = false then begin
   hp2.text:='';
   c2:=true;
  end;
end;

procedure Tchoose.mana1Click(Sender: TObject);
begin
   if c3 = false then begin
   mana1.text:='';
   c3:=true;
  end;
end;

procedure Tchoose.mana2Click(Sender: TObject);
begin
   if c4 = false then begin
   mana2.text:='';
   c4:=true;
  end;
end;

procedure Tchoose.name1Click(Sender: TObject);
begin
   if c5 = false then begin
   name1.text:='';
   c5:=true;
  end;
end;

procedure Tchoose.name2Click(Sender: TObject);
begin
   if c6 = false then begin
   name2.text:='';
   c6:=true;
  end;
end;

procedure Tchoose.startButtonClick(Sender: TObject);
begin
  if not (name1.text = 'NAME') and not (name2.text = 'NAME') and not (hp1.text ='HP') and not (hp2.text = 'HP') and not (mana1.text = 'MANA') and not (mana2.text = 'MANA') then begin
  Player1:= TPlayerclass.Create;
  Player2:= TPlayerclass.Create;
   Player1.name:=name1.text;
   Player1.Hp:=strtoint(hp1.text);
   Player1.Mana:=strtoint(mana1.text);
   Player2.name:=name2.text;
   Player2.Hp:=strtoint(hp2.text);
   Player2.Mana:=strtoint(mana2.text);
   AssignFile(myfile, 'login.txt' );
   Rewrite(myfile);
   WriteLn(myfile, 'Player1_name: ' +Player1.Name);
   WriteLn(myfile, 'Player1_HP: ' +inttostr(Player1.Hp));
   WriteLn(myfile, 'Player1_Mana: ' +inttostr(Player1.Mana));
   WriteLn(myfile, 'Player2_name: ' +Player2.Name);
   WriteLn(myfile, 'Player2_HP: ' +inttostr(Player2.Hp));
   WriteLn(myfile, 'Player2_Mana: ' +inttostr(Player2.Mana));
   CloseFile(myfile);
   ingame.Show;
   hide;


  end;

end;

end.

