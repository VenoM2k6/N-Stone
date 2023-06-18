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
      FCardPosition: integer;
      FManaCost: integer;
      FcardIsPlaced: boolean;
    public
      property Hp: integer read FHp write FHp;
      property Damage: integer read FDamage write FDamage;
      property ManaCost: integer read FManaCost write FManaCost;
      property cardIsPlaced: boolean read FcardIsPlaced write FcardIsPlaced;
      property CardPosition: integer read FCardPosition write FCardPosition;
  end;

implementation

end.

