unit playerclass;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
  TPlayer = class
    private
      FHp: Integer;
      FMana: Integer;
    public
      property Hp: Integer read FHp write FHp;
      property Mana: Integer read FMana write FMana;
  end;

implementation

end.

