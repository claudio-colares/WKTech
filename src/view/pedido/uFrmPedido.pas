unit uFrmPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, System.Actions, Vcl.ActnList, RecordBancoDados, Constantes,
  RecordPedido, RecordItemPedido, RecordPedidoDAO;

type
  TFrmPedidoVenda = class(TForm)
    pnlTitulo: TPanel;
    pnlBotoes: TPanel;
    pnlPrincipal: TPanel;
    img01: TImage;
    lblTitulo: TLabel;
    btnGravarPedido: TButton;
    btnEditar: TButton;
    btnCancelar: TButton;
    btnFechar: TButton;
    pnlTotalizacao: TPanel;
    lblTotalPedido: TLabel;
    lblValortotal: TLabel;
    grpDadosPedido: TGroupBox;
    lblCodigo: TLabel;
    dbgrdDadosPedido: TDBGrid;
    lblDataEmissao: TLabel;
    lblIDCliente: TLabel;
    QryPedido: TFDQuery;
    QryItemPedido: TFDQuery;
    DBConexao: TFDConnection;
    FDTransaction: TFDTransaction;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    dsPedido: TDataSource;
    dsItemPedido: TDataSource;
    edtNomeCliente: TEdit;
    dtpData_emissao: TDateTimePicker;
    btnPesquisaCliente: TButton;
    btnPesquisaPedido: TButton;
    edtCodigo: TEdit;
    edtIdCliente: TEdit;
    btnAddItem: TButton;
    btnRemoverItem: TButton;
    actlstPedidoVenda: TActionList;
    actFechar: TAction;
    actNovoPedido: TAction;
    actEditarPedido: TAction;
    actCancelarPedido: TAction;
    actNovoItem: TAction;
    actRemoverItem: TAction;
    actGravar: TAction;
    actPesquisaCliente: TAction;
    procedure FormCreate(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actPesquisaClienteExecute(Sender: TObject);

  private
    { Private declarations }
    procedure AtivarTabelas(status: boolean);
    procedure CentralizarTela;
    procedure EncerrarAplicacao;
    procedure ConectarBase;
    function  ValidarDadosPedido: boolean;
  public
    { Public declarations }
  end;

var
  FrmPedidoVenda: TFrmPedidoVenda;
  FBancoDados   : TBancoDados;

implementation

uses
  uFrmListagemCliente;

{$R *.dfm}
{ TFrmPedidoVenda }

procedure TFrmPedidoVenda.actFecharExecute(Sender: TObject);
begin
  if MessageDlg('Deseja fechar o pedido de venda?', TMsgDlgType.mtConfirmation, [mbNo, mbYes], 0, mbNo) = mrYes then
    EncerrarAplicacao;
end;

procedure TFrmPedidoVenda.actGravarExecute(Sender: TObject);
var
  Pedido   : TPedido;
  Item     : TItemPedido;
  PedidoDAO: TPedidoDAO;
  i        : Integer;
begin

  if not ValidarDadosPedido then
  begin
    ShowMessage('Dados do pedido incorreto');
    edtCodigo.SetFocus;
    exit;
  end;

  PedidoDAO := TPedidoDAO.Create(DBConexao);

  Pedido.NumeroPedido   := 1;   //StrToInt(edtCodigo.Text); // O número será gerado automaticamente
  Pedido.DataEmissao    := Now; // dtpData_emissao.Date;
  Pedido.Cliente.Codigo := 2;   // StrToInt(edtIdCliente.Text);

  for i := 0 to Pedido.Itens.Count - 1 do
  begin
    // Pedido.Itens[i].
    Item.Produto.Codigo := Pedido.Itens[i].Produto.Codigo;
    Item.Quantidade     := Pedido.Itens[i].Quantidade;
    Item.ValorUnitario  := Pedido.Itens[i].ValorUnitario;
    Item.ValorTotal     := Item.Quantidade * Item.ValorUnitario;
    Pedido.Itens.Add(Item);
  end;
  // Salvar o pedido e liberar memória
  try
    if PedidoDAO.GravarPedido(Pedido) then
      ShowMessage('Pedido salvo com sucesso!');
  finally
    Pedido.Itens.Free;
  end;
end;

procedure TFrmPedidoVenda.actPesquisaClienteExecute(Sender: TObject);
begin
  if not btnPesquisaCliente.Enabled then
    exit;

  try
    FrmListagemCliente            := TFrmListagemCliente.Create(Self);
    FrmListagemCliente.Position   := poOwnerFormCenter;
    FrmListagemCliente.ShowModal;
  finally
    FrmListagemCliente.Free;
  end;

end;

procedure TFrmPedidoVenda.AtivarTabelas(status: boolean);
begin
  QryPedido.Active     := status;
  QryItemPedido.Active := status;
end;

procedure TFrmPedidoVenda.CentralizarTela;
begin
  WindowState := wsNormal;
  Position    := poMainFormCenter;
end;

procedure TFrmPedidoVenda.ConectarBase;
var
  mCursor: TCursor;

begin
  mCursor := Cursor;

  DBConexao.Close;
  FBancoDados.GetConfigFB(DBConexao);
  FBancoDados.GetDriverLink(FDPhysMySQLDriverLink1);

  Try
    Cursor := crSQLWait;
    Try
      DBConexao.Open;
    Except
      EncerrarAplicacao;
    End;
  Finally
    mCursor := Cursor;
  End;
end;

procedure TFrmPedidoVenda.EncerrarAplicacao;
begin
  AtivarTabelas(False);
  Application.Terminate;
  TerminateProcess(GetCurrentProcess, 0);
end;

procedure TFrmPedidoVenda.FormCreate(Sender: TObject);
begin
  CentralizarTela;
  setConstantes;

  ConectarBase;
  AtivarTabelas(true);
end;

function TFrmPedidoVenda.ValidarDadosPedido: boolean;
begin
  Result := False;

  if (edtCodigo.Text <> '') and (edtIdCliente.Text <> '') and (edtNomeCliente.Text <> '') then
    Result := true;
end;

end.
