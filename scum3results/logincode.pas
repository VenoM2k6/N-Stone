unit logincode;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { Tloginmenu }

  Tloginmenu = class(TForm)
    background: TImage;
    finish1: TButton;
    finish2: TButton;
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
    procedure closeButtonClick(Sender: TObject);
    procedure finish1Click(Sender: TObject);
    procedure finish2Click(Sender: TObject);
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
    accname1, accname2: string;
    accpassword1, accpassword2: string;
    accclass1, accclass2: string;
    logincompleted: boolean;
  end;

var
  loginmenu: Tloginmenu;

  inmode1, inmode2: boolean;
  upmode1, upmode2: boolean;  //Abfrage für die Finish Buttons, ob der Nutzer sich gerade anmeldet oder einen Account erstellt

  //sequentielle Dateien
  words: TStringList;
  fullyreadstring: string;
  eacc1, eacc2: boolean; //Überprüfen ob der Account existiert

  createAccount1, createAccount2: string;
  PlayerDataFile: TextFile;
  relativePath: string;
  absolutePath: string;
  currentPath: string; //Das Abspeichern ist etwas komplizierter => Damit es auf jedem Gerät funktioniert arbeite ich mit relativen Pfaden

  finished: integer;

  //Anzeigeeinstellungen
  currentHeight, currentWidth: integer;

implementation

{$R *.lfm}

{ Tloginmenu }

procedure Tloginmenu.FormCreate(Sender: TObject);
begin
  relativePath := '\Playerdata.txt';
  currentPath := GetCurrentDir;
  absolutePath :=  currentPath + relativePath;

  background.sendtoback;

  WindowState := wsMaximized;

  words := TStringList.Create;
  words.StrictDelimiter := true; //Trennzeichenmodus
  words.Delimiter := '_';

  eacc1 := false;
  eacc2 := false;
  inmode1 := false;
  inmode2 := false;
  upmode1 := false;
  upmode2 := false;
  finished := 0;

  currentHeight := screen.height;
  currentWidth := screen.width;
  loginmenu.show;

  background.height := currentHeight;
  background.width := currentWidth;
  background.left := 0;
  background.top := 0;



  player1.height := currentHeight div 16;
  player1.width := currentWidth div 10;
  player1.left := Round(1.5 * currentWidth / 4) - player1.width div 2;
  player1.top := currentHeight div 3;
  player1.font.size := 25;

  signin1.Height := player1.height;
  signin1.width := player1.width;
  signin1.left := player1.left;
  signin1.top := player1.top + currentHeight div 12;

  signup1.height := signin1.height;
  signup1.width := signin1.width;
  signup1.left := signin1.left;
  signup1.top := signin1.top + currentHeight div 16;

  player2.height := player1.height;
  player2.width := player1.width;
  player2.top := player1.Top;
  player2.left := currentWidth - player1.left - player2.width div 2;
  player2.font.size := 25;

  signin2.height := signin1.height;
  signin2.width :=  signin1.width;
  signin2.left := player2.left;
  signin2.top := player2.top + currentHeight div 12;

  signup2.height := signup1.height;
  signup2.width := signup1.width;
  signup2.top := signin2.top + currentHeight div 16;
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
  name2.font.size := 15;

  password2.height := signup2.height;
  password2.width := signup2.width;
  password2.left := signup2.left;
  password2.top := signup2.top;
  password2.font.size := 15;

  classchooser1.Items.Add('Mage');
  classchooser1.Items.Add('Ranged');
  classchooser1.Items.Add('Melee');

  classchooser2.Items := classchooser1.Items;
  classchooser1.height := name1.height;
  classchooser1.width := name1.width;
  classchooser1.left := name1.left;
  classchooser1.top := password1.top + loginmenu.height div 8;
  classchooser1.Font.Size := 15;

  classchooser2.height := name2.height;
  classchooser2.height := name2.height;
  classchooser2.width := name2.width;
  classchooser2.left := name2.left;
  classchooser2.top := password2.top + loginmenu.height div 8;
  classchooser2.Font.Size := 15;

  finish1.height := password1.height;
  finish1.width := password1.width;
  finish1.left := password1.left;
  finish1.top := classchooser1.top + classchooser1.Height;

  finish2.height := password2.height;
  finish2.width := password2.width;
  finish2.left := password2.left;
  finish2.top := classchooser2.top + classchooser2.Height;

 { closeButton.height := name1.height;
  closeButton.width := name1.width;
  closeButton.left := loginmenu.width div 2 - closeButton.width div 2;
  closeButton.top := finish1.top; }
end;
//Automatisches Textlöschen beim anklicken
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
//Anzeigen des Einlogmenüs
procedure Tloginmenu.signin1Click(Sender: TObject);
begin
  signin1.visible := false;
  signup1.Visible := false;
  name1.visible := true;
  password1.visible := true;
  finish1.visible := true;

  inmode1 := true;
end;
procedure Tloginmenu.signin2Click(Sender: TObject);
begin
  signin2.visible := false;
  signup2.Visible := false;
  name2.visible := true;
  password2.visible := true;
  finish2.visible := true;

  inmode2 := true;
end;

//Anzeigen des Account-Erstellmenüs
procedure Tloginmenu.signup1Click(Sender: TObject);
begin
  finish1.visible := true;
  name1.visible := true;
  password1.visible := true;
  signin1.visible := false;
  signup1.visible := false;

  name1.text := 'Choose Name';
  password1.text := 'Choose Password';

  name1.width := name1.width + name1.width div 4;
  password1.width := password1.width + password1.width div 4;

  classchooser1.visible := true;

  upmode1 := true;
end;
procedure Tloginmenu.signup2Click(Sender: TObject);
begin
  finish2.visible := true;
  name2.visible := true;
  password2.visible := true;
  signin2.visible := false;
  signup2.visible := false;

  name2.text := 'Choose Name';
  password2.text := 'Choose Password';

  name2.width := name2.width + name2.width div 4;
  password2.width := password2.width + password2.width div 4;

  classchooser2.visible := true;

  upmode2 := true;
end;

//Abspeichern der Daten
procedure Tloginmenu.finish1Click(Sender: TObject);
begin

   if inmode1 then begin
     AssignFile(PlayerDataFile, absolutePath);
     Reset(PlayerDataFile);

     while not EOF(PlayerDataFile) do begin
        ReadLn(PlayerDataFile, fullyreadstring);

           words.DelimitedText := fullyreadstring;
           accname1 := words[0];
           accpassword1 := words[1];
           accclass1 := words[2];

           if(accname1 = name1.text) and (accpassword1 = password1.text) then begin
             ShowMessage('Du hast dich erfolgreich angemeldet');
             eacc1 := true;
             break;
           end;
     end;
     if eacc1 = false then begin
        ShowMessage('Dieser Account existiert nicht!');
     end;
     CloseFile(PlayerDataFile);
   end;
   if upmode1 then begin
      createAccount1 := name1.text + '_' + password1.text + '_' + classchooser1.text;
      AssignFile(PlayerDataFile, absolutePath);
      Append(PlayerDataFile);
      WriteLn(PlayerDataFile, createAccount1);
      CloseFile(PlayerDataFile);
      eacc1 := true;
   end;

   if eacc1 then begin
     finished := finished + 1;
     finish1.visible := false;
     finish1.enabled := false;
     name1.visible := false;
     password1.visible := false;
     classchooser1.visible := false;
   end;
   if finished = 2 then begin
      close;
      logincompleted := true;
   end;
end;
procedure Tloginmenu.finish2Click(Sender: TObject);
begin
   if inmode2 then begin
     AssignFile(PlayerDataFile, absolutePath);
     Reset(PlayerDataFile);
     while not EOF(PlayerDataFile) do begin
        ReadLn(PlayerDataFile, fullyreadstring);

           words.DelimitedText := fullyreadstring;
           accname2 := words[0];
           accpassword2 := words[1];
           accclass2 := words[2];

           if(accname2 = name2.text) and (accpassword2 = password2.text) then begin
             ShowMessage('Du hast dich erfolgreich angemeldet');
             eacc2 := true;
             break;
           end;
     end;
     if eacc2 = false then begin
        ShowMessage('Dieser Account existiert nicht!');
     end;
     CloseFile(PlayerDataFile);
   end;

   if upmode2 then begin
      createAccount2 := name2.text + '_' + password2.text + '_' + classchooser2.text;
      AssignFile(PlayerDataFile, absolutePath);
      Append(PlayerDataFile);
      WriteLn(PlayerDataFile, createAccount2);
      CloseFile(PlayerDataFile);
      eacc2 := true;
   end;

   if eacc2 then begin
     finished := finished + 1;
     finish2.visible := false;
     finish2.enabled := false;
     name2.visible := false;
     password2.visible := false;
     classchooser2.visible := false;
   end;
   if finished = 2 then begin                //Finish fixxen
      close;
      logincompleted := true;
   end;

end;

procedure Tloginmenu.closeButtonClick(Sender: TObject);
begin
  close;
end;

end.

