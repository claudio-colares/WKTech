unit uFrmPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, System.Actions, Vcl.ActnList, RecordBancoDados, ConfigConstantes,
  uClassePedido, uClasseItemPedido, uClassePedidoDAO, uFrmListagemPedido;

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
    actPesquisaPedido: TAction;
    procedure FormCreate(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure actPesquisaClienteExecute(Sender: TObject);
    procedure actPesquisaPedidoExecute(Sender: TObject);

  private
    FPedido   : TPedido;
    FPedidoDAO: TPedidoDAO;
    procedure AtivarTabelas(status: boolean);
    procedure CentralizarTela;
    procedure EncerrarAplicacao;
    procedure ConectarBase;
    function ValidarDadosPedido: boolean;

  public
    { Public declarations }
    procedure CarregarDadosPedidoNaTela(Pedido: TPedido);
  end;

var
  FrmPedidoVenda: TFrmPedidoVenda;
  FBancoDados   : TBancoDados;

implementation

uses
  uFrmListagemCliente;

{$R *.dfm}
{ TFrmPedidoVenda }

procedure TFrmPedidoVenda.FormCreate(Sender: TObject);
begin
  CentralizarTela;
  setConstantes;
  ConectarBase;
  AtivarTabelas(true);

  // Instancia FPedido e FPedidoDAO
  FPedido    := TPedido.Create;
  FPedidoDAO := TPedidoDAO.Create(DBConexao);
end;

procedure TFrmPedidoVenda.actFecharExecute(Sender: TObject);
begin
  if MessageDlg('Deseja fechar o pedido de venda?', TMsgDlgType.mtConfirmation, [mbNo, mbYes], 0, mbNo) = mrYes then
    EncerrarAplicacao;
end;

procedure TFrmPedidoVenda.actGravarExecute(Sender: TObject);
var
  i   : Integer;
  Item: TItemPedido;
begin
  // Valida os dados do pedido
  if not ValidarDadosPedido then
  begin
    ShowMessage('Dados do pedido incorreto');
    Exit;
  end;

  // Configura os dados do pedido
  FPedido.NumeroPedido   := 0;   // O número será gerado automaticamente
  FPedido.DataEmissao    := Now; // dtpData_emissao.Date;
  FPedido.Cliente.Codigo := StrToIntDef(edtIdCliente.Text, 0);

  // Cria e adiciona os itens ao pedido
  for i := 0 to FPedido.Itens.Count - 1 do
  begin
    Item := TItemPedido.Create;
    try
      Item.Produto.Codigo := FPedido.Itens[i].Produto.Codigo;
      Item.Quantidade     := FPedido.Itens[i].Quantidade;
      Item.ValorUnitario  := FPedido.Itens[i].ValorUnitario;
      Item.AtualizarValorTotal;
      FPedido.AdicionarItem(Item);
    except
      Item.Free;
      raise;
    end;
  end;

  // Salva o pedido no banco de dados
  try
    if FPedidoDAO.GravarPedido(FPedido) then
      ShowMessage('Pedido salvo com sucesso!');
  finally
    FPedido.Itens.Clear; // Libera a lista de itens após o salvamento
  end;
end;

procedure TFrmPedidoVenda.actPesquisaClienteExecute(Sender: TObject);
begin
  if not btnPesquisaCliente.Enabled then
    Exit;

  try
    FrmListagemCliente          := TFrmListagemCliente.Create(Self);
    FrmListagemCliente.Position := poOwnerFormCenter;
    FrmListagemCliente.ShowModal;
  finally
    FrmListagemCliente.Free;
  end;
end;

procedure TFrmPedidoVenda.actPesquisaPedidoExecute(Sender: TObject);
begin
  try
    FrmListagemPedido          := TFrmListagemPedido.Create(Self);
    FrmListagemPedido.Position := poOwnerFormCenter;
    FrmListagemPedido.ShowModal;
  finally
    FrmListagemPedido.Free;
  end;
end;

procedure TFrmPedidoVenda.AtivarTabelas(status: boolean);
begin
  QryPedido.Active     := status;
  QryItemPedido.Active := status;
end;

procedure TFrmPedidoVenda.CarregarDadosPedidoNaTela(Pedido: TPedido);
begin
  edtCodigo.Text        := Pedido.NumeroPedido.ToString;
  dtpData_emissao.Date  := Pedido.DataEmissao;
  edtIdCliente.Text     := Pedido.Cliente.Codigo.ToString;
  edtNomeCliente.Text   := Pedido.Cliente.Nome;
  lblValortotal.Caption := FormatFloat('R$ #,##0.00', Pedido.ValorTotal);
end;


procedure TFrmPedidoVenda.CentralizarTela;
begin
  WindowState := wsNormal;
  Position    := poMainFormCenter;
end;

procedure TFrmPedidoVenda.ConectarBase;
begin
  DBConexao.Close;
  FBancoDados.GetConfigFB(DBConexao);
  FBancoDados.GetDriverLink(FDPhysMySQLDriverLink1);

  try
    Cursor := crSQLWait;
    DBConexao.Open;
  except
    EncerrarAplicacao;
  end;
end;

procedure TFrmPedidoVenda.EncerrarAplicacao;
begin
  AtivarTabelas(False);
  Application.Terminate;
end;

function TFrmPedidoVenda.ValidarDadosPedido: boolean;
begin
  Result := (edtIdCliente.Text <> '');
end;

end.
