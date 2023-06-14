unit cardclass;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
  TCard = class
    private
      FHp: integer;
      FDamage: integer;
    public
      property Hp: integer read FHp write FHp;
      property Damage: integer read FDamage write FDamage;
  end;

implementation

end.

