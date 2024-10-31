unit uFrmListCadastroTemplate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, System.Actions, Vcl.ActnList;

type
  TFrmListCadastroTemplate = class(TForm)
    pnlTopo: TPanel;
    pnlBase: TPanel;
    dbgrdDados: TDBGrid;
    lbltitulo: TLabel;
    QryDados: TFDQuery;
    dsDados: TDataSource;
    btnFechar: TButton;
    btnConfirmar: TButton;
    actlstDados: TActionList;
    actConfirmar: TAction;
    actFechar: TAction;
    procedure actFecharExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmListCadastroTemplate: TFrmListCadastroTemplate;

implementation

{$R *.dfm}

procedure TFrmListCadastroTemplate.actFecharExecute(Sender: TObject);
begin
  Self.Close;
end;

end.
