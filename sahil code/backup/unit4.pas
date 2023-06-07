unit Unit4;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Unit3, Unit6;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  login_file:TextFile;
  logger_text: String;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  AssignFile(login_file, 'logger.txt' );
  Reset(login_file);
  while not EOF(login_file) do
  begin
    ReadLn(login_file, logger_text);
    if (LowerCase(Edit1.Text) = logger_text) then
    begin
      choose.Show;
      hide;
      end
    else
        MessageDlg('Ungültiger Username oder Passwort! ', mtInformation, [mbOK],0);
  end;
  CloseFile(login_file);
  {if (LowerCase(Edit1.Text) = LowerCase('Admin')) and (Edit2.Text = '1234') then
  begin
    choose.Show;
    hide;
    end
  else
      MessageDlg('Ungültiger Username oder Passwort! ', mtInformation, [mbOK],0);}

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Form2.Show;
  hide;
end;



end.

