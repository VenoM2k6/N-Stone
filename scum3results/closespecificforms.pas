unit closespecificforms;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms;

procedure CloseSpecificFormsFunc(Form1:TForm; Form2:TForm);

implementation

procedure CloseSpecificFormsFunc(Form1:TForm; Form2:TForm);
begin
   if Assigned(Form1) then begin
     Form1.Close;
   end;
   if Assigned(Form2) then begin
     Form2.Close;
   end;

end;
end.

