unit uFrmPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    pnlTitulo: TPanel;
    pnlBotoes: TPanel;
    pnlPrincipal: TPanel;
    img01: TImage;
    lblTitulo: TLabel;
    pnlPesquisa: TPanel;
    dbgrdDados: TDBGrid;
    btnSalvar: TButton;
    btnEditar: TButton;
    btnCancelar: TButton;
    btnExcluir: TButton;
    btnFechar: TButton;
    btnNovo: TButton;
    pnlTotalizacao: TPanel;
    pgcPrincipal: TPageControl;
    tsListagem: TTabSheet;
    tsDados: TTabSheet;
    lblTotalPedido: TLabel;
    lblValortotal: TLabel;
    btnListagem: TButton;
    grpDadosPedido: TGroupBox;
    lblCodigo: TLabel;
    dbedtCodigo: TDBEdit;
    dbedtCliente: TDBEdit;
    dbgrdDadosPedido: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
