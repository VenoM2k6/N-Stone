unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Unit3, Unit4;

type

  { Tmenu }

  Tmenu = class(TForm)
    background: TPanel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    startButton: TButton;
    exitButton: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow (Sender: TObject);
    procedure exitButtonClick(Sender: TObject);
    procedure startButtonClick(Sender: TObject);
  private

  public

  end;

var
  menu: Tmenu;
  currentHeight,currentWidth: integer;
  hp: array[0..19] of string = ('10','20','30','40','50','60','70','80','90','100','110','120','130','140','150','160','170','180','190','200');
  mana: array[0..19] of string = ('210','220','230','240','250','260','270','280','290','2100','2110','2120','2130','2140','2150','2160','2170','2180','2190','2200');
  username: array[0..19] of string = ('kokosnuss','apfel','banane','birne','pfirsich','tomate','gurke','salat','reyhan','vincent','younes','sahil','timo','messi','delphi','lazarus','pikachu','glumanda','fortnite','stalin');
  cardstats: array[1..20,1..20] of string;
  //karten1: array[0..3, 0..3] of integer;
  gaeste: array of array[0..2] of string;
  i,j, index, anzahl, zwischen, PosInArray, rows, cols, randomIndex0: integer;
  b1,b2,b3: Boolean;
  tempCard0,tempCard1,tempCard2: string;

implementation

{$R *.lfm}

{ Tmenu }

procedure Tmenu.FormShow(Sender: TObject);
begin
    //Bildschirmgröße wird erfasst
    WindowState := wsFullScreen;
    currentHeight := Screen.Height;
    currentWidth := Screen.Width;

    //Positionierung und Größe des Spielfelds
    background.top:=Round(currentHeight*0.125);
    background.left:=Round(currentWidth*0.1);
    background.Height:=Round(currentHeight*0.75);
    background.width:=Round(currentWidth*0.8);
end;

procedure Tmenu.Button1Click(Sender: TObject);
begin

    anzahl:= 20;
    SetLength(gaeste, anzahl);
    for index:=0 to High(gaeste) do
    begin
      gaeste[index,0]:=hp[index];
      gaeste[index,1]:=mana[index];
      gaeste[index,2]:=username[index];
    end;
    for index:=0 to High(gaeste) do
    begin
      Edit1.Text:=Edit1.Text+gaeste[index,0]+'; ';
      Edit2.Text:=Edit2.Text+gaeste[index,1]+'; ';
      Edit3.Text:=Edit3.Text+gaeste[index,2]+'; ';
    end;

end;



procedure Tmenu.Button2Click(Sender: TObject);
begin
    for i:= 0 to 19 do
    begin
      tempCard0:= gaeste[i,0];
      tempCard1:= gaeste[i,1];
      tempCard2:= gaeste[i,2];
      randomIndex0:=Random(19);
      gaeste[i,0]:= gaeste[randomIndex0,0];
      gaeste[i,1]:= gaeste[randomIndex0,1];
      gaeste[i,2]:= gaeste[randomIndex0,2];
      gaeste[randomIndex0,0]:= tempCard0;
      gaeste[randomIndex0,1]:= tempCard1;
      gaeste[randomIndex0,2]:= tempCard2;


    end;
    Edit1.Text:='';
    Edit2.Text:='';
    Edit3.Text:='';
    for i:= 0 to 19 do
    begin
      Edit1.Text:=Edit1.Text+gaeste[i,0]+'; ';
      Edit2.Text:=Edit2.Text+gaeste[i,1]+'; ';
      Edit3.Text:=Edit3.Text+gaeste[i,2]+'; ';
    end;
end;


procedure Tmenu.Edit1Click(Sender: TObject);
begin
    if b1= false then begin
      Edit1.Text:='';
      b1:=True;
    end;
end;



procedure Tmenu.Edit2Click(Sender: TObject);
begin
    if b2= false then begin
      Edit2.Text:='';
      b2:=True;
    end;
end;

procedure Tmenu.Edit3Click(Sender: TObject);
begin
    if b3= false then begin
      Edit3.Text:='';
      b3:=True;
    end;
end;

procedure Tmenu.FormCreate(Sender: TObject);
begin

end;

procedure Tmenu.startButtonClick(Sender: TObject);
begin
   hide;
end;

procedure Tmenu.exitButtonClick(Sender: TObject);
begin
  close;
end;
end.

