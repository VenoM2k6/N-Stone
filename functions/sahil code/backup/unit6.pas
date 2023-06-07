unit Unit6;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;
  login_file:TextFile;
  login_files:TextFile;
  logger_text: String;
  speicher: Boolean;
  i: Integer;
  user_array: Array[0..1000] of String;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
begin;
  AssignFile(login_file, 'logger.txt' );
  Reset(login_file);
      i:=0;
  while not EOF(login_file) do
  begin
    ReadLn(login_file, logger_text);
    user_array[i]:=logger_text;
    i:=i+1;

    end;
  while not EOF(login_file) do
  begin
    ReadLn(login_file, logger_text);
    if (LowerCase(Edit1.Text) = logger_text) then
    begin
      MessageDlg('Dieser User existiert beretis! ', mtInformation, [mbOK],0);
      speicher:=True;

    end
    else if (Length(Edit1.Text) < 4) then
    begin
      MessageDlg('Dein Username muss mindestens 4 Zeichen lang sein! ', mtInformation, [mbOK],0);
      speicher:=True;
    end;
    {else then
    //
    begin
    end;}
  end;
  CloseFile(login_file);
  AssignFile(login_file, 'logger.txt' );
  if (speicher=false) then
  begin
       Rewrite(login_file);
    for i:=0 to 1000 do begin
      WriteLn(login_file, user_array[i]);
    end;
    WriteLn(login_file, Edit1.Text);
    CloseFile(login_file)

  end;
  speicher:=false;
end;



  {Reset(login_file);
  while not EOF(login_file) do
  begin
    ReadLn(login_file, logger_text);
    if (LowerCase(Edit1.Text) not logger_text) then
    begin
      if (Length(Edit1.Text) > 4) then
      begin
        Rewrite(login_file);
        WriteLn(login_file, Edit1.Text);
      end
      else
      begin
      MessageDlg('Dieser User existiert beretis! ', mtInformation, [mbOK],0);
      end;
    else if (Length(Edit1.Text) < 4) then
    begin
      MessageDlg('Dein Username muss mindestens 4 Zeichen lang sein! ', mtInformation, [mbOK],0);
    end
   if
    begin
      Rewrite(login_file);
      WriteLn(login_file, Edit1.Text);

    end;
  end;
  CloseFile(login_file);}


end.

