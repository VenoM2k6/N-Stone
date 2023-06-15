unit menucode;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ingame, lobbycode;

type

  { Tmenu }

  Tmenu = class(TForm)
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  menu: Tmenu;

implementation

{$R *.lfm}

{ Tmenu }

procedure Tmenu.FormShow(Sender: TObject);
begin
  showingame.show;
  menu.hide;
end;

end.

