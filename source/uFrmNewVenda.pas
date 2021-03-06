unit uFrmNewVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untHeranca, DB, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, Mask, DBCtrls, DBClient, FMTBcd, SqlExpr, ToolEdit, Provider,
  Menus;

type
  TfrmNewVenda = class(TfrmHeranca)
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    edtNRMESA: TEdit;
    Panel6: TPanel;
    grdConsultar: TDBGrid;
    plnDados: TPanel;
    dsItensPedidos: TDataSource;
    Label3: TLabel;
    dbeProduto: TDBEdit;
    dbeDescricao: TDBEdit;
    Label4: TLabel;
    dbeQuantidade: TDBEdit;
    Label5: TLabel;
    dbeVendedor: TDBEdit;
    sbLocProduto: TSpeedButton;
    spVendedor: TSpeedButton;
    StatusBar1: TStatusBar;
    dbeNMVEND: TDBEdit;
    dbGridMesas: TDBGrid;
    dsMesasOcupadas: TDataSource;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Panel7: TPanel;
    DBText1: TDBText;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    Timer1: TTimer;
    Panel3: TPanel;
    rgConsultar: TRadioGroup;
    Label9: TLabel;
    dbeDTINIC: TDateEdit;
    dbeDTFINA: TDateEdit;
    Label10: TLabel;
    btnConsultar: TBitBtn;
    dstConsulta: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    cdsConsultarMOV_PEDIDO: TIntegerField;
    cdsConsultarMOV_CUPOM: TIntegerField;
    cdsConsultarMOV_LOJA: TIntegerField;
    cdsConsultarMOV_DATAVENDA: TDateField;
    cdsConsultarMOV_CLIENTE: TIntegerField;
    cdsConsultarMOV_VALOR: TFMTBCDField;
    cdsConsultarMOV_NOMECLIENTE: TStringField;
    cdsConsultarMOV_SITUACAO: TStringField;
    cdsConsultarMOV_VENDEDOR: TIntegerField;
    cdsConsultarMOV_DESCONTO: TFMTBCDField;
    cdsConsultarMOV_HORAVENDA: TStringField;
    cdsConsultarMOV_TABELA: TIntegerField;
    cdsConsultarMOV_ACRESCIMO: TFMTBCDField;
    cdsConsultarMOV_TIPO_FRETE: TStringField;
    cdsConsultarMOV_PERC_FRETE: TFMTBCDField;
    cdsConsultarMOV_IDTRANSPORTADORA: TIntegerField;
    cdsConsultarMOV_TABELA_PLANO: TIntegerField;
    cdsConsultarMOV_NMLOJA: TStringField;
    pnlDetalhes: TPanel;
    DBNavigator1: TDBNavigator;
    DBGrid3: TDBGrid;
    dstConsItens: TSQLDataSet;
    dspConsItens: TDataSetProvider;
    cdsConsItens: TClientDataSet;
    dsConsItens: TDataSource;
    cdsConsItensMOP_PEDIDO: TIntegerField;
    cdsConsItensMOP_PRODUTO: TStringField;
    cdsConsItensMOP_QUANTIDADE: TFMTBCDField;
    cdsConsItensMOP_UNIDADE: TStringField;
    cdsConsItensMOP_VALOR: TFMTBCDField;
    cdsConsItensMOP_DESCONTO: TFMTBCDField;
    cdsConsItensMOP_SERIE: TStringField;
    cdsConsItensMOP_CUSTO: TFMTBCDField;
    cdsConsItensMOP_COMPRA: TFMTBCDField;
    cdsConsItensMOP_CODCOR: TIntegerField;
    cdsConsItensMOP_VALIPI: TFMTBCDField;
    cdsConsItensMOP_CDVENDEDOR: TIntegerField;
    cdsConsItensMOP_NMPROD: TStringField;
    cdsConsItensMOP_NMVEND: TStringField;
    cdsConsultarMOV_NRMESA: TStringField;
    Panel8: TPanel;
    btnTele: TBitBtn;
    btnCozinha: TBitBtn;
    btnCliente: TBitBtn;
    btnCupom: TBitBtn;
    btnFecharPedido: TBitBtn;
    PopupMenu1: TPopupMenu;
    CancelarPedido1: TMenuItem;
    N1: TMenuItem;
    CupomPedido1: TMenuItem;
    N2: TMenuItem;
    eleEntrega1: TMenuItem;
    Cozinha1: TMenuItem;
    procedure sbLocProdutoClick(Sender: TObject);
    procedure dbeProdutoChange(Sender: TObject);
    procedure dsItensPedidosDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure edtNRMESAExit(Sender: TObject);
    procedure dbeVendedorExit(Sender: TObject);
    procedure dbeVendedorChange(Sender: TObject);
    procedure dbeProdutoExit(Sender: TObject);
    procedure dbeProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeVendedorKeyPress(Sender: TObject; var Key: Char);
    procedure spVendedorClick(Sender: TObject);
    procedure dbeQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure dbGridMesasDblClick(Sender: TObject);
    procedure edtNRMESAKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure tbsFecharPedidoShow(Sender: TObject);
    procedure tbsCadastroShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure dsrCadastroDataChange(Sender: TObject; Field: TField);
    procedure btnConsultarClick(Sender: TObject);
    procedure dsrPesquisaDataChange(Sender: TObject; Field: TField);
    procedure cdsConsItensCalcFields(DataSet: TDataSet);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdConsultarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbGridMesasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeDTINICExit(Sender: TObject);
    procedure dbeDTFINAExit(Sender: TObject);
    procedure tbsConsultaShow(Sender: TObject);
    procedure eleEntrega1Click(Sender: TObject);
    procedure btnTeleClick(Sender: TObject);
    procedure btnCozinhaClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btnCupomClick(Sender: TObject);
    procedure btnFecharPedidoClick(Sender: TObject);
    procedure CancelarPedido1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure AdicionarMesa(M_NRMESA : String);
    Function AdicionarTeleEntrega(aCliente, aFone, aEndereco, aComplemento,
            aBairro, aCidade, aReferencia : String; iCliente, iNumero : Integer) : Boolean;
    procedure AtualizarMesasOcupadas;
    procedure NovoPedido();
    procedure Mostra_Produto(M_CDPROD : String);
    Procedure NovoItem;
    Function Salvar_Item() : boolean;
    Procedure SelecionaPedido(aPedido : String);
    Function CalcularTotal(aCDS : TClientDataSet ): Double;
    procedure Botoes;
    procedure Botoes2;
    Procedure Registro(iPedido : Integer);
    Procedure FecharPedido();
    Procedure Cupom();
  public
    { Public declarations }
  end;


var
  frmNewVenda: TfrmNewVenda;
  ScreenWidth: LongInt = 800; {I designed my form in 800x600 mode.}
  ScreenHeight: LongInt = 600;

implementation

uses udmDados, uFuncoes, ufrmLocProdutos, uFrmBuscaProdutos, Udm,
  udmConsulta , UFrmAdmin, uFormaPagamento, uFrmLocVendendor,
  uFrmBuscaDados, uFrmTeleEntrega, uFrmStatusServico, uFrmSeleProdutos;

{$R *.dfm}

{ TfrmNewVenda }

procedure TfrmNewVenda.AdicionarMesa(M_NRMESA: String);
begin
      //
      Dm.RefreshCDS(Dm.CdsConfig);
      //
      Dm.CdsConfig.Edit;
      Dm.CdsConfigCFG_ORCAMENTO.AsInteger :=
         Dm.CdsConfigCFG_ORCAMENTO.AsInteger + 1;
      Dm.CdsConfig.ApplyUpdates(0);
      //
      Dm.FilterCDS(dmDados.cdsPreVenda, fsInteger, Dm.CdsConfigCFG_ORCAMENTO.AsString);
      //
      With dmDados.cdsPreVenda do
        begin
             Append;
             FieldByName('PRV_PEDIDO').AsInteger := Dm.CdsConfigCFG_ORCAMENTO.AsInteger;
             FieldByName('PRV_LOJA').AsInteger   := 1;
             FieldByName('PRV_NRMESA').AsString  := uFuncoes.StrZero(M_NRMESA,3);
             FieldByName('PRV_DATAVENDA').AsDateTime := Date();
             FieldByName('PRV_HORAVENDA').AsString   := Copy(TimetoStr(Time),1,5);
             FieldByName('PRV_SITUACAO').AsString    := 'A';
             FieldByName('PRV_VALOR').AsFloat    := 0;
             ApplyUpdates(0);
             //
             dm.FilterCDS(dmDados.cdsItensVenda, fsInteger, FieldByName('PRV_PEDIDO').AsString);
             //
             NovoItem;
        End;
end;


procedure TfrmNewVenda.sbLocProdutoClick(Sender: TObject);
begin
  inherited;
   // frmLocProdutos
   If (dmDados.cdsItensVenda.Active) and (dmDados.cdsItensVenda.State in [dsInsert, dsEdit]) Then
      with TfrmSelecionaProduto.create(self) do
      try
          if (showmodal = mrOK) Then
          begin
              If not (cdsProdutos.IsEmpty) Then
                  dmDados.cdsItensVendaPVI_PRODUTO.AsString :=
                     cdsProdutosPRO_CODIGO.AsString
              Else
                 dbeProduto.SetFocus;
          End;
      finally
          free;
          //
          if not uFuncoes.Empty(dbeProduto.Text) Then
              dbeQuantidade.SetFocus; 
      end;
end;

procedure TfrmNewVenda.dbeProdutoChange(Sender: TObject);
begin
  inherited;
    if (dmDados.cdsItensVenda.State in [dsInsert, dsEdit]) Then
      if uFuncoes.Empty(dbeProduto.Text) Then
          dmDados.cdsItensVendaPVI_NMPROD.Clear;
end;

procedure TfrmNewVenda.dsItensPedidosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
     plnDados.Enabled     := dsItensPedidos.DataSet.State in [dsInsert, dsEdit];
     sbLocProduto.Enabled := dsItensPedidos.DataSet.State in [dsInsert, dsEdit];
     spVendedor.Enabled   := dsItensPedidos.DataSet.State in [dsInsert, dsEdit];
     //
     btnSalvar.Enabled   := dsItensPedidos.DataSet.State in [dsInsert, dsEdit];
     btnCancelar.Enabled := dsItensPedidos.DataSet.State in [dsInsert, dsEdit];
     //
     btnTele.Enabled     := dsItensPedidos.DataSet.State in [dsBrowse];
     btnCozinha.Enabled  := dsItensPedidos.DataSet.State in [dsBrowse];
     BtExcluir.Enabled   := dsItensPedidos.DataSet.State in [dsBrowse];
     //
     btnCupom.Enabled   := (dsrCadastro.DataSet.State in [dsBrowse]) and not (dmDados.cdsItensVenda.IsEmpty);
     btnFecharPedido.Enabled   := (dsrCadastro.DataSet.State in [dsBrowse]) and not (dmDados.cdsItensVenda.IsEmpty);
     //
     StatusBar1.Panels[1].Text := 'Item(s) : '+InttoStr(dmDados.cdsItensVenda.RecNo) +' de '+InttoStr(dmDados.cdsItensVenda.RecordCount);
end;

procedure TfrmNewVenda.FormShow(Sender: TObject);
begin
  inherited;
      Caption := 'Pedido de Venda - CAIXA : ' + UFrmAdmin.W_CDCAIX + ' - '+ uFuncoes.NOME_CAIXA(StrtoInt(UFrmAdmin.W_CDCAIX)) ;
      plnDados.Enabled  := False;
      //
      AtualizarMesasOcupadas;
      //
      pclPrincipal.TabIndex := 0;
      pnlBotoes.Enabled  := false;
      btnCliente.Enabled := False;
end;

procedure TfrmNewVenda.BtGravarClick(Sender: TObject);
Var
   W_NRPEDI : Integer;
begin
 // inherited;
   If (dmDados.cdsPreVenda.Active) and (dmDados.cdsItensVenda.Active) Then
    begin
        W_NRPEDI := dmDados.cdsPreVendaPRV_PEDIDO.AsInteger;
        Botoes;
        pclPrincipal.Pages[1].TabVisible := True;
        if (dmDados.cdsItensVenda.State in [dsInsert, dsEdit]) Then
            dmDados.cdsItensVenda.ApplyUpdates(0);
        //
        Registro(W_NRPEDI);
    End;
end;

procedure TfrmNewVenda.edtNRMESAExit(Sender: TObject);
begin
  inherited;
     if not uFuncoes.Empty(edtNRMESA.Text) Then
       begin
            If (StrToInt(edtNRMESA.Text) > dm.CdsConfigCFG_QTMESAS.AsInteger) Then
             begin
                   Application.MessageBox (PChar('N�mero de mesa inv�lido !'),
                     'ATEN��O',MB_ICONEXCLAMATION+ MB_OK);
                   edtNRMESA.Clear;
                   edtNRMESA.SetFocus;
                   Exit;
             End
             Else
             begin
                 edtNRMESA.Text := uFuncoes.StrZero(edtNRMESA.Text,3);
                 //
                 If not (Dm.VerificarMesaLivre(uFuncoes.StrZero(edtNRMESA.Text,3))) Then
                 begin
                     AdicionarMesa(edtNRMESA.Text);
                     Botoes;
                 End
                 Else
                 begin
                      SelecionaPedido(InttoStr(dmDados.GetPedidoMesa(uFuncoes.StrZero(edtNRMESA.Text,3))));
                      //
                      dmDados.cdsMesasOcupadas.Locate('PRV_NRMESA', dmDados.cdsPreVendaPRV_NRMESA.AsString,[]);
                 End;
             End;
       End;
end;

procedure TfrmNewVenda.dbeVendedorExit(Sender: TObject);
begin
  inherited;
   if (dmDados.cdsItensVenda.State in [dsInsert, dsEdit]) Then
    begin
      If not uFuncoes.Empty(dbeVendedor.Text) Then
      Begin
           //
           If not (dmConsultas.GetVendedor(dmDados.cdsItensVendaPVI_CDVENDEDOR.AsInteger)) Then
           Begin
                Application.MessageBox (PChar('C�digo de atendente n�o cadastrado !'),
                    'ATEN��O',MB_ICONINFORMATION+ MB_OK);
                dbeVendedor.Clear;
               dbeVendedor.SetFocus;
               Exit;
           End
           Else
           begin
               dmDados.cdsItensVendaPVI_CDVENDEDOR.AsString := uFuncoes.StrZero(dmDados.cdsItensVendaPVI_CDVENDEDOR.AsString,6);
               btnSalvar.SetFocus; 
           End;
      End;
    End;
end;

procedure TfrmNewVenda.dbeVendedorChange(Sender: TObject);
begin
  inherited;
    if (dmDados.cdsItensVenda.State in [dsInsert, dsEdit]) Then
      if uFuncoes.Empty(dbeVendedor.Text) Then
          dmDados.cdsItensVendaPVI_NMVEND.Clear;
end;

procedure TfrmNewVenda.dbeProdutoExit(Sender: TObject);
begin
  inherited;
   if (dmDados.cdsItensVenda.State in [dsInsert, dsEdit]) Then
    begin
      If uFuncoes.Empty(dbeProduto.Text) Then
        begin
             Application.MessageBox (PChar('Digite o c�digo de produto.'),
                  'ATEN��O',MB_ICONINFORMATION+ MB_OK);
              dbeProduto.Clear;
              dbeProduto.SetFocus;
              Exit;
        End;
      //
      If not uFuncoes.Empty(dbeProduto.Text) Then
      Begin
           //
           If not (dmConsultas.GetVerificaProduto(dmDados.cdsItensVendaPVI_PRODUTO.AsString)) Then
           Begin
                Application.MessageBox (PChar('C�digo de produto n�o cadastrado !'),
                    'ATEN��O',MB_ICONINFORMATION+ MB_OK);
                dbeProduto.Clear;
                dbeProduto.SetFocus;
                Exit;
           End
           Else
           begin
               If (dmConsultas.GetVerificaCodBarras(dmDados.cdsItensVendaPVI_PRODUTO.AsString)) Then
                   dmDados.cdsItensVendaPVI_PRODUTO.AsString := dmConsultas.GetBarrasCodProduto(dmDados.cdsItensVendaPVI_PRODUTO.AsString)
               Else
                   dmDados.cdsItensVendaPVI_PRODUTO.AsString := uFuncoes.StrZero(dmDados.cdsItensVendaPVI_PRODUTO.AsString,13);

               {begin
                   If uFuncoes.StrIsFloat(dmDados.cdsItensVendaPVI_PRODUTO.AsString) Then
                       dmDados.cdsItensVendaPVI_PRODUTO.AsString := uFuncoes.StrZero(dmDados.cdsItensVendaPVI_PRODUTO.AsString,13)
                   Else
                       dmDados.cdsItensVendaPVI_PRODUTO.AsString := dmConsultas.GetBarrasCodProduto(dmDados.cdsItensVendaPVI_PRODUTO.AsString);
               End;}
               //
               //dmDados.cdsItensVendaPVI_PRODUTO.AsString := uFuncoes.StrZero(dmDados.cdsItensVendaPVI_PRODUTO.AsString,13);
               Mostra_Produto(dmDados.cdsItensVendaPVI_PRODUTO.AsString);
           End;
      End;
    End;
end;

procedure TfrmNewVenda.Mostra_Produto(M_CDPROD: String);
Var
    qraux : TSQLquery;
    texto : string;
    iDias : Integer;
    fValor : Double;
begin
    // dmDados.cdsItensVendaPVI_VALOR.AsFloat := dmConsultas.GetProdutoValor(M_CDPROD);
  texto := 'select PRO_CODIGO, PRO_BARRAS, PRO_DESCRICAO, PRO_VLCOMPRA, PRO_VLCUSTO, PRO_VLVENDA, PRO_IPI, UNI_CODIGO ';
  texto := texto + ' from PRODUTOS Where (PRO_CODIGO = :pCODIGO) or (PRO_BARRAS = :pCODIGO) ';
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := dm.SQLAdmin;
      sql.Add(texto);
      Params.ParamByName('pCODIGO').AsString := uFuncoes.StrZero(M_CDPROD,13);
      Open;
      //
      If not (IsEmpty) Then
       begin
            If not (dmDados.GetProdutoPromocao(M_CDPROD)) Then
                dmDados.cdsItensVendaPVI_VALOR.AsFloat    := FieldByName('PRO_VLVENDA').AsFloat
            Else
            begin
                Dm.FilterCDS(dmDados.cdsPromocoes, fsString , M_CDPROD );
                iDias := uFuncoes.NumeroDiadaSemana(DatetoStr(Date));
                case iDias of
                    1 : fValor  := dmDados.cdsPromocoesPRM_VLDOMI.AsFloat;
                    2 : fValor  := dmDados.cdsPromocoesPRM_VLSEGU.AsFloat;
                    3 : fValor  := dmDados.cdsPromocoesPRM_VLTERC.AsFloat;
                    4 : fValor  := dmDados.cdsPromocoesPRM_VLQUAR.AsFloat;
                    5 : fValor  := dmDados.cdsPromocoesPRM_VLQUIN.AsFloat;
                    6 : fValor  := dmDados.cdsPromocoesPRM_VLSEXT.AsFloat;
                    7 : fValor  := dmDados.cdsPromocoesPRM_VLSABA.AsFloat;
                end;
                //
                if (fValor > 0) Then
                    dmDados.cdsItensVendaPVI_VALOR.AsFloat := fValor
                Else
                    dmDados.cdsItensVendaPVI_VALOR.AsFloat := FieldByName('PRO_VLVENDA').AsFloat;
            End;
            //
            dmDados.cdsItensVendaPVI_UNIDADE.AsString := FieldByName('UNI_CODIGO').AsString;
            dmDados.cdsItensVendaPVI_CUSTO.AsFloat    := FieldBYName('PRO_VLCUSTO').AsFloat;
            dmDados.cdsItensVendaPVI_COMPRA.AsFloat   := FieldBYName('PRO_VLCOMPRA').AsFloat;
       End;
    finally
      free;
    end;
end;

procedure TfrmNewVenda.dbeProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
     If not( key in['0'..'9',#8, #13, #27]) then
        key:=#0;
     //
     If (Key = #27) and (dsItensPedidos.DataSet.State in [dsInsert, dsEdit] )Then
     begin
          Key := #0;
          dsItensPedidos.DataSet.Cancel;
          dsItensPedidos.DataSet.First;
     End;
     //
     If (Key = #13) and uFuncoes.Empty(dbeProduto.Text) Then
     begin
          Key := #0;
          sbLocProdutoClick(Sender);
     End;
     //
     If (Key = #13) and not uFuncoes.Empty(dbeProduto.Text) Then
     begin
          Key := #0;
          Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

procedure TfrmNewVenda.dbeVendedorKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
     If not( key in['0'..'9',#8, #13, #27]) then
        key:=#0;
     //
   If (dsItensPedidos.DataSet.Active) Then
     If (Key = #27) and (dsItensPedidos.DataSet.State in [dsInsert, dsEdit] )Then
     begin
          Key := #0;
          dsItensPedidos.DataSet.Cancel;
          dsItensPedidos.DataSet.First;
     End;
     //
     If (Key = #13) and uFuncoes.Empty(dbeVendedor.Text) Then
     begin
          Key := #0;
          spVendedorClick(Sender);
     End;
     //
     If (Key = #13) and not uFuncoes.Empty(dbeVendedor.Text) Then
     begin
          Key := #0;
          dbeProduto.SetFocus; 
     End;
end;

procedure TfrmNewVenda.spVendedorClick(Sender: TObject);
begin
  inherited;
  with TfrmBuscaAtendente.create(self) do
  try
      if (showmodal = mrOK) Then
      begin
          If not (cdsBusca.IsEmpty) Then
           begin
               dmDados.cdsItensVendaPVI_CDVENDEDOR.AsInteger :=
                  cdsBuscaFUN_CODIGO.AsInteger;
               If (btnSalvar.Enabled) Then
                  btnSalvar.SetFocus;
            End
          Else
             dbeVendedor.SetFocus;
      End;
  finally
    free;
  end;

end;

procedure TfrmNewVenda.dbeQuantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
     {If not( key in['0'..'9',#8, #13]) then
        key:=#0;}
   If (dsItensPedidos.DataSet.Active) Then
     If (Key = #27) and (dsItensPedidos.DataSet.State in [dsInsert, dsEdit] )Then
     begin
          Key := #0;
          dsItensPedidos.DataSet.Cancel;
          dsItensPedidos.DataSet.First;
     End;
     //
     If (Key = #13) and not uFuncoes.Empty(dmDados.cdsItensVendaPVI_QUANTIDADE.AsString)
       and (dmDados.cdsItensVendaPVI_QUANTIDADE.AsFloat > 0 ) Then
     begin
          Key := #0;
          dbeVendedor.SetFocus;
          //Perform(WM_NEXTDLGCTL, 0, 0);
     End;
end;

Function TfrmNewVenda.Salvar_Item() : Boolean;
Var
   M_HOATUA : String;
   M_DTATUA : TDate;
begin
     Result := False;
     //
     If uFuncoes.Empty(dmDados.cdsItensVendaPVI_PRODUTO.AsString) Then
       begin
            dbeProduto.SetFocus;
            Exit;
       End;
     //
     If uFuncoes.Empty(dmDados.cdsItensVendaPVI_QUANTIDADE.AsString) Then
       begin
            dbeQuantidade.SetFocus;
            Exit;
       End;
     //
     If uFuncoes.Empty(dmDados.cdsItensVendaPVI_CDVENDEDOR.AsString) Then
       begin
            dbeVendedor.SetFocus;
            Exit;
       End;
     //
     If not uFuncoes.Empty(dmDados.cdsItensVendaPVI_PEDIDO.AsString) Then
        dmDados.cdsItensVendaPVI_PEDIDO.AsInteger :=
             dmDados.cdsPreVendaPRV_PEDIDO.AsInteger;
     //
     Dm.Start;
     try
          dmDados.cdsItensVenda.ApplyUpdates(0);
          //
          CalcularTotal(dmDados.cdsItensVenda);
          //
          dm.Comit(Dm.Transc);
          //
          if (dmConsultas.GetProduto(dmDados.cdsItensVendaPVI_PRODUTO.AsString)) Then
           begin
               M_HOATUA := Copy(TimetoStr(Time),1,5);
               M_DTATUA := Date;
               //
               // aNRMESA, aHORA, aIDPRODUTO, aSTATUS ;
               // aDATA; fQUANTIDADE
               if not (Dm.AddServico(dmDados.cdsPreVendaPRV_NRMESA.AsString,
                              M_HOATUA, dmDados.cdsItensVendaPVI_PRODUTO.AsString,
                              'C', M_DTATUA, dmDados.cdsItensVendaPVI_QUANTIDADE.AsFloat,
                              dmDados.cdsItensVendaPVI_ITEM.AsInteger)) Then
                   Application.MessageBox (PChar('Erro na inclus�o de servi�o !'),
                        'ATEN��O',MB_ICONSTOP+ MB_OK);
           End;
          //
          Result := true;
     Except
          dm.Rollback;
     End;
end;

procedure TfrmNewVenda.NovoPedido;
begin

end;

procedure TfrmNewVenda.AtualizarMesasOcupadas;
begin
     dmDados.cdsItensVenda.Close;
     dmDados.cdsPreVenda.Close;
     //      
     Dm.RefreshCDS(dmDados.cdsMesasOcupadas);
end;

procedure TfrmNewVenda.SelecionaPedido(aPedido: String);
begin
     Dm.FilterCDS(dmDados.cdsPreVenda, fsInteger,  aPedido);
     //
     If not (dmDados.cdsPreVenda.IsEmpty) Then
      begin
           Dm.RefreshCDS(dmDados.cdsListaProdutos);
           Dm.FilterCDS(dmDados.cdsItensVenda, fsInteger,  aPedido);
           //
           plnDados.Enabled := true;
           //
           {If (dmDados.cdsItensVenda.IsEmpty) Then
              NovoItem;}
      End;
end;

procedure TfrmNewVenda.dbGridMesasDblClick(Sender: TObject);
begin
  inherited;
     if (dmDados.cdsMesasOcupadas.Active)
         and not (dmDados.cdsMesasOcupadas.IsEmpty) Then
          begin
              pclPrincipal.TabIndex := 0;
              SelecionaPedido(dmDados.cdsMesasOcupadasPRV_PEDIDO.AsString);
              //
              //edtLocMesa.Clear;
              //SelecionaPedido(InttoStr(dmDados.GetPedidoMesa(StrtoInt(edtNRMESA.Text))));
          End;
end;

procedure TfrmNewVenda.edtNRMESAKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
     If not( key in['0'..'9',#8, #13]) then
        key:=#0;
     //
     If (Key = #13) and not uFuncoes.Empty(edtNRMESA.Text) Then
     begin
          Key := #0;
          Perform(WM_NEXTDLGCTL, 0, 0);
     End;

end;

function TfrmNewVenda.CalcularTotal(aCDS: TClientDataSet): Double;
Var
    fValor : Double;
begin
      fValor := 0;
      With aCDS do
        begin
             DisableControls;
             First;
             While not (Eof) do
              begin
                   fValor := fValor  + fieldByName('PVI_SUBTOTAL').AsFloat;
                   //
                   Next;
              End;
              //
              EnableControls;
        End;
        //
        dmDados.cdsPreVenda.Edit;
        dmDados.cdsPreVendaPRV_VALOR.AsFloat := fValor;
        dmDados.cdsPreVenda.ApplyUpdates(0);
        //
        Result := fValor;
end;

procedure TfrmNewVenda.NovoItem;
Var
   iItem : Integer;
begin
     iItem := uFuncoes.mvpedidoitem(dmDados.cdsItensVendaPVI_PEDIDO.AsInteger, 'PVI_ITEM','PRE_VENDA_ITENS');
     //
     If (iITem = 0) Then
         iITem := 1
     Else
         iITem := iITem + 1;
     dmDados.cdsItensVenda.Append;
     dmDados.cdsItensVendaPVI_PEDIDO.AsInteger := dmDados.cdsPreVendaPRV_PEDIDO.AsInteger;
     dmDados.cdsItensVendaPVI_ITEM.AsInteger   := iItem;
     //dmDados.cdsItensVenda.RecordCount + 1;
     dmDados.cdsItensVendaPVI_QUANTIDADE.AsInteger := 1;
     //
     pclPrincipal.Pages[1].TabVisible := False;  
     dbeProduto.SetFocus;
end;

procedure TfrmNewVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    dmDados.cdsItensVenda.Close;
    dmDados.cdsPreVenda.Close;
    //
    dmDados.cdsMesasOcupadas.Close;
end;

procedure TfrmNewVenda.Botoes;
begin
      BtAdicionar.Enabled := not BtAdicionar.Enabled;
      BtGravar.Enabled   := not BtGravar.Enabled;
      BtCancelar.Enabled := not BtCancelar.Enabled;
end;

procedure TfrmNewVenda.BtAdicionarClick(Sender: TObject);
begin
//  inherited;
   If (dmDados.cdsPreVenda.Active) and (dmDados.cdsItensVenda.Active) Then
    begin
        Botoes;
        NovoItem;
    End
    Else
       edtNRMESA.SetFocus;
end;

procedure TfrmNewVenda.BtCancelarClick(Sender: TObject);
Var
    W_NRPEDI : integer;
begin
 // inherited;
   If (dmDados.cdsPreVenda.Active) and (dmDados.cdsItensVenda.Active) Then
    begin
      W_NRPEDI := dmDados.cdsPreVendaPRV_PEDIDO.AsInteger;
      Botoes;
      pclPrincipal.Pages[1].TabVisible := True;
      //
      If (dmDados.cdsPreVenda.State in [dsInsert, dsEdit]) Then
          dmDados.cdsPreVenda.Cancel;
      //
      Registro(W_NRPEDI);
    End;
end;

procedure TfrmNewVenda.btnSalvarClick(Sender: TObject);
begin
  inherited;
   if (dmDados.cdsItensVenda.State in [dsInsert, dsEdit]) Then
     If (Salvar_Item()) Then
       begin
            BtGravarClick(Sender);
            //NovoItem;
            If (BtAdicionar.Enabled) Then
                BtAdicionar.SetFocus
            Else
            begin
                 Botoes;
                 BtAdicionar.SetFocus;
            End;
       End;
end;

procedure TfrmNewVenda.btnCancelarClick(Sender: TObject);
begin
//  inherited;
   if (dmDados.cdsItensVenda.State in [dsInsert, dsEdit]) Then
    begin
         Botoes;
         dmDados.cdsItensVenda.Cancel;
    End;
end;

procedure TfrmNewVenda.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
     if (dmDados.cdsItensVenda.Active) and not (dmDados.cdsItensVenda.IsEmpty) Then
      begin
           dmDados.cdsItensVenda.Edit;
           dbeQuantidade.SetFocus;  
      End;
end;

procedure TfrmNewVenda.BtExcluirClick(Sender: TObject);
Var
    M_NRSEQU : integer;
begin
 // inherited;
     if (dmDados.cdsItensVenda.Active) and not (dmDados.cdsItensVenda.IsEmpty) Then
        if (dmDados.cdsItensVenda.State in [dsbrowse]) Then
           If Application.MessageBox('Deseja excluir item selecionado ?', 'Exclus�o de registro',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
             Begin
                  //
                  M_NRSEQU := Dm.VerificarServicoProduto(dmDados.cdsItensVendaPVI_PRODUTO.AsString,
                                                   dmDados.cdsPreVendaPRV_NRMESA.AsString);
                  //
                  If (M_NRSEQU > 0) Then
                     if not (Dm.ExcluirServico(M_NRSEQU)) Then
                        ShowMessage('Erro ao tentar excluir servi�o de produto !');
                  //
                  dmDados.cdsItensVenda.Delete;
                  dmDados.cdsItensVenda.ApplyUpdates(0);
                  //
                  CalcularTotal(dmDados.cdsItensVenda);
             end;

end;

procedure TfrmNewVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Var
    W_NRPEDI, W_QTPESS : Integer;
    W_NRMESA, M_QUANT : STRING;
begin
  inherited;
      If (key = vk_F10) Then
           pclPrincipal.TabIndex := 0;
      If (key = vk_F11) Then
           pclPrincipal.TabIndex := 1;
      If (key = vk_F7) Then
         btnTeleClick(Sender);
      If (key = vk_F8) Then
         btnCozinhaClick(Sender);
      //
      If (dmDados.cdsItensVenda.Active) and not (dmDados.cdsItensVenda.IsEmpty) then
          If (key = vk_F9) and (dmDados.cdsPreVenda.Active) and (dmDados.cdsPreVendaPRV_VALOR.AsFloat > 0) Then
              begin
                   Cupom;
                   {W_QTPESS := 0;
                   //
                   M_QUANT := InputBox('Valor por pessoa','Digite a quantidade de pessoa na mesa ?','');
                   If  not Empty(M_QUANT) Then
                      W_QTPESS := StrtoInt(M_QUANT);
                   uFuncoes.CupomPedido(dmDados.cdsPreVendaPRV_PEDIDO.AsInteger, W_QTPESS,
                        M_VLTAXA ,dmDados.cdsItensVenda);}
              End;
      //
      If (dmDados.cdsItensVenda.Active)
        and not (dmDados.cdsItensVenda.IsEmpty) then
          //
          If (key = vk_F2) and (dmDados.cdsPreVenda.Active)
           and (dmDados.cdsPreVendaPRV_VALOR.AsFloat > 0) Then
           Begin
                //
                FecharPedido;
                {If not (dmDados.cdsItensVenda.Active) or (dmDados.cdsItensVenda.IsEmpty) Then
                    begin
                         Application.MessageBox (PChar('N�o h� itens no pedido atual !'+#13+'Inclua itens para poder fechar pedido.'),
                            'ATEN��O',MB_ICONINFORMATION+ MB_OK);
                         Exit;
                    End;
                 //
                 W_NRPEDI := dmDados.cdsPreVendaPRV_PEDIDO.AsInteger;
                 W_NRMESA := dmDados.cdsPreVendaPRV_NRMESA.AsString;
                 //
                 dmDados.CarregarDadosItens(dmDados.cdsItensVenda);
                 //
                  Application.CreateForm(TfrmFormaPagamento, frmFormaPagamento); // Carrega form na mem�ria
                  try
                     uFormaPagamento.M_CDVEND := StrtoInt(UFrmAdmin.W_CDCAIX);
                     uFormaPagamento.M_CDCAIX := StrtoInt(UFrmAdmin.W_CDCAIX);
                     frmFormaPagamento.ShowModal;
                  Finally
                     If (uFormaPagamento.M_FLPEDI = true) Then
                      Begin
                           dmDados.FecharStatusPedido(W_NRPEDI);
                           //
                           If (Dm.VerificarServicoMesa(W_NRMESA)) Then
                              if not (dm.AtualizaStatusServicoMesa(W_NRMESA, 'E')) then
                                   Application.MessageBox (PChar('Erro ao tentar atualizar status de servi�o !'),
                                          'ATEN��O',MB_ICONSTOP+ MB_OK);

                      End;
                     //Libera Mem�ria
                     frmFormaPagamento.Free;
                     //
                     AtualizarMesasOcupadas;
                  End;       }
          End;
end;

procedure TfrmNewVenda.FormCreate(Sender: TObject);
begin
  inherited;
    KeyPreview := true;
    //
    Dm.RefreshCDS(Dm.CdsConfig);
    //
    ScreenWidth  := Dm.CdsConfigCFG_SCREEN_WIDTH.AsInteger;
    ScreenHeight := Dm.CdsConfigCFG_SCREEN_HEIGTH.AsInteger;
    //
    scaled := true;
    if (screen.width <> ScreenWidth) then
    begin
        height := longint(height) * longint(screen.height) DIV ScreenHeight;
        width := longint(width) * longint(screen.width) DIV ScreenWidth;
        scaleBy(screen.width, ScreenWidth);
    end;
    //
    WindowState := wsMaximized;
    //
    dbeDTINIC.Date := Date;
    dbeDTFINA.Date := dbeDTINIC.Date;
    //
    Timer1.Enabled := True;
end;

procedure TfrmNewVenda.Botoes2;
begin
     BtAdicionar.Visible := not BtAdicionar.Visible;
     BtExcluir.Visible   := not BtExcluir.Visible;
     //
     BtGravar.Visible    := not BtGravar.Visible;
     btCancelar.Visible  := not BtCancelar.Visible;
     btnCliente.Visible  := not btnCliente.Visible;
     //
     btnCupom.Visible    := NOT btnCupom.Visible;
     btnFecharPedido.Visible := Not btnFecharPedido.Visible;
end;

procedure TfrmNewVenda.tbsFecharPedidoShow(Sender: TObject);
begin
  inherited;
      Botoes2;
end;

procedure TfrmNewVenda.tbsCadastroShow(Sender: TObject);
begin
  inherited;
      if not (BtAdicionar.Visible) Then
        Botoes2;
end;

procedure TfrmNewVenda.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  If (dmDados.cdsItensVenda.Active) and (dmDados.cdsItensVenda.State in [dsInsert, dsEdit]) Then
     If Application.MessageBox('Salvar altera��es?',
          'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
        begin
             Canclose:=False;
             If (BtGravar.Enabled) Then
                BtGravar.SetFocus;
        End;
end;

procedure TfrmNewVenda.Timer1Timer(Sender: TObject);
begin
  inherited;
     StatusBar1.Panels[2].Text := 'Data/Hora : '+DatetoStr(Date)+' - '+TimetoStr(Time);
end;

procedure TfrmNewVenda.dsrCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
    pnlBotoes.Enabled   := dsrCadastro.DataSet.Active;
    //
    btnCliente.Enabled := (dsrCadastro.DataSet.State in [dsBrowse]) and not (uFuncoes.Empty(dsrCadastro.DataSet.FieldByName('PRV_NOMECLIENTE').AsString));
end;

procedure TfrmNewVenda.btnConsultarClick(Sender: TObject);
begin
  inherited;
          with cdsConsultar do
          begin
               Close;
               //
               //
               CommandText := 'select M.MOV_PEDIDO, M.MOV_CUPOM, M.MOV_LOJA, M.MOV_DATAVENDA, M.MOV_CLIENTE, M.MOV_VALOR, M.MOV_NOMECLIENTE, M.MOV_SITUACAO, M.MOV_VENDEDOR,';
               CommandText := CommandText + 'M.MOV_DESCONTO, M.MOV_HORAVENDA, M.MOV_TABELA, ';
               CommandText := CommandText + 'M. MOV_ACRESCIMO, M.MOV_TIPO_FRETE, M.MOV_PERC_FRETE, M.MOV_IDTRANSPORTADORA, M.MOV_TABELA_PLANO, M.MOV_NRMESA, ';
               CommandText := CommandText + '(Select E.EMP_FANTASIA from EMPRESAS E Where (E.EMP_CODIGO = M.MOV_LOJA)) as MOV_NMLOJA from VENDAS M ';
               CommandText := CommandText + 'Where (M.MOV_DATAVENDA >= :pDTINIC) and (M.MOV_DATAVENDA <= :pDTFINA) AND (M.MOV_SITUACAO = :pSITUACAO) ';
               CommandText := CommandText + 'order by M.MOV_PEDIDO';
               //
               Params.ParamByName('pDTINIC').AsDateTime := dbeDTINIC.Date;
               Params.ParamByName('pDTFINA').AsDateTime := dbeDTFINA.Date;
               //
               case rgConsultar.ItemIndex of
                 0: Params.ParamByName('pSITUACAO').AsString := 'F';
                 1: Params.ParamByName('pSITUACAO').AsString := 'C';
               end;
               //
               Open;
          End;  //fim-with
end;

procedure TfrmNewVenda.Registro(iPedido: Integer);
begin
      AtualizarMesasOcupadas;
      //
      pclPrincipal.TabIndex := 0;
      SelecionaPedido(InttoStr(iPedido));
end;

procedure TfrmNewVenda.dsrPesquisaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
    If (dsrPesquisa.DataSet.Active) and not (dsrPesquisa.DataSet.IsEmpty) Then
        dm.FilterCDS(cdsConsItens, fsInteger, cdsConsultarMOV_PEDIDO.AsString)
    Else
        cdsConsItens.Close;
end;

procedure TfrmNewVenda.cdsConsItensCalcFields(DataSet: TDataSet);
begin
  inherited;
      if not uFuncoes.Empty(cdsConsItensMOP_PRODUTO.AsString) Then
         cdsConsItensMOP_NMPROD.AsString := uFuncoes.NOME_PRODUTO(cdsConsItensMOP_PRODUTO.AsString);
      if not uFuncoes.Empty(cdsConsItensMOP_CDVENDEDOR.AsString) Then
         cdsConsItensMOP_NMVEND.AsString := dmConsultas.GetNomeVendedor(cdsConsItensMOP_CDVENDEDOR.AsInteger);
end;

procedure TfrmNewVenda.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
      if (Shift = [ssCtrl]) and (Key = 46) Then
          KEY := 0;
end;

procedure TfrmNewVenda.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
      if (Shift = [ssCtrl]) and (Key = 46) Then
          KEY := 0;

end;

procedure TfrmNewVenda.grdConsultarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
      if (Shift = [ssCtrl]) and (Key = 46) Then
          KEY := 0;
end;

procedure TfrmNewVenda.dbGridMesasKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
      if (Shift = [ssCtrl]) and (Key = 46) Then
          KEY := 0;
end;

procedure TfrmNewVenda.dbeDTINICExit(Sender: TObject);
begin
  inherited;
     If (dbeDTINIC.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(dbeDTINIC.Text);
              dbeDTINIC.Text := DatetoStr(dbeDTINIC.Date);
              //
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inv�lida!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     dbeDTINIC.Clear;
                     dbeDTINIC.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmNewVenda.dbeDTFINAExit(Sender: TObject);
begin
  inherited;
     If (dbeDTFINA.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(dbeDTFINA.Text);
              dbeDTFINA.Text := DatetoStr(dbeDTFINA.Date);
              //
              If (dbeDTFINA.Date < dbeDTINIC.Date) Then
              Begin
                   Application.MessageBox(PChar('Periodo final deve ser maior ou igual ao inicial!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   dbeDTFINA.Date := Date;
                   dbeDTFINA.SetFocus;
                   Exit;
              End;
          except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inv�lida!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     dbeDTFINA.Clear;
                     dbeDTFINA.SetFocus;
                End;
           end;
     End;
end;

procedure TfrmNewVenda.tbsConsultaShow(Sender: TObject);
begin
  inherited;
      Botoes2;
      //
      cdsConsultar.Close;
      cdsConsItens.Close;   
end;

procedure TfrmNewVenda.eleEntrega1Click(Sender: TObject);
begin
  inherited;
      //

end;

procedure TfrmNewVenda.btnTeleClick(Sender: TObject);
begin
  inherited;
      Application.CreateForm(TfrmTeleEntrega, frmTeleEntrega);
      try
          With frmTeleEntrega do
           begin
                 uFrmTeleEntrega.M_FLVISU := False;
                 //
                 If (ShowModal = mrOk) then
                   begin
                        // aCliente, aFone, aEndereco, aComplemento,
                        // aBairro, aCidade, aReferencia : String; iNumero : Integer
                        If not (AdicionarTeleEntrega(edtNome.Text, edtDDD.Text+edtTelefone.Text, edtEndereco.Text, edtComplemento.Text,
                               edtBairro.Text, edtCidade.Text, edtReferencia.Text, uFrmTeleEntrega.M_CDCLIE, StrtoInt(edtNumero.Text))) Then
                            Application.MessageBox(PChar('Erro ao tentar adicionar Tele-Entrega !'),
                              'Erro', MB_OK+MB_ICONSTOP+MB_APPLMODAL);
                   End;
           End;
      Finally
          frmTeleEntrega.Free;
      End;
end;

Function TfrmNewVenda.AdicionarTeleEntrega(aCliente, aFone, aEndereco, aComplemento,
aBairro, aCidade, aReferencia : String; iCliente, iNumero : Integer) : Boolean;
begin
      Result := False;
      //
      Dm.RefreshCDS(Dm.CdsConfig);
      //
      Dm.CdsConfig.Edit;
      Dm.CdsConfigCFG_ORCAMENTO.AsInteger :=
         Dm.CdsConfigCFG_ORCAMENTO.AsInteger + 1;
      Dm.CdsConfigCFG_TELEENTEGA.AsInteger :=
         Dm.CdsConfigCFG_TELEENTEGA.AsInteger + 1;
      Dm.CdsConfig.ApplyUpdates(0);
      //
      Dm.FilterCDS(dmDados.cdsPreVenda, fsInteger, Dm.CdsConfigCFG_ORCAMENTO.AsString);
      //
      With dmDados.cdsPreVenda do
        begin
             Append;
             FieldByName('PRV_PEDIDO').AsInteger := Dm.CdsConfigCFG_ORCAMENTO.AsInteger;
             FieldByName('PRV_LOJA').AsInteger   := 1;
             FieldByName('PRV_NRMESA').AsString  := 'T'+uFuncoes.StrZero(Dm.CdsConfigCFG_TELEENTEGA.AsString,3);
             FieldByName('PRV_DATAVENDA').AsDateTime := Date();
             FieldByName('PRV_HORAVENDA').AsString   := Copy(TimetoStr(Time),1,5);
             FieldByName('PRV_SITUACAO').AsString    := 'A';
             FieldByName('PRV_VALOR').AsFloat    := 0;
             //
             FieldByName('PRV_CLIENTE').AsInteger := iCliente;
             FieldByName('DOM_ENDERECO').AsString := aEndereco;
             FieldByName('DOM_NUMERO').AsInteger  := iNumero;
             FieldByName('DOM_BAIRRO').AsString   := aBairro;
             FieldByName('DOM_CIDADE').AsString   := aCidade;
             FieldByName('DOM_REFERE').AsString   := aReferencia;
             FieldByName('PRV_NOMECLIENTE').AsString := aCliente;
             FieldByName('DOM_NRFONE').AsString   := aFone;
             FieldByName('DOM_COMPLEMENTO').AsString := aComplemento;
             //
             ApplyUpdates(0);
             //
             dm.FilterCDS(dmDados.cdsItensVenda, fsInteger, FieldByName('PRV_PEDIDO').AsString);
             //
             NovoItem;
        End;
        //
        Result := true;
end;

procedure TfrmNewVenda.btnCozinhaClick(Sender: TObject);
Var
  iPedido : Integer;
begin
  inherited;
      If (dmDados.cdsPreVenda.Active)
        and not (dmDados.cdsPreVenda.IsEmpty) Then
         iPedido := dmDados.cdsPreVendaPRV_PEDIDO.AsInteger;
      //
      Application.CreateForm(TfrmStatusServico, frmStatusServico);
      try
          frmStatusServico.ShowModal;
      Finally
          frmStatusServico.Free;
          //
          If (iPedido > 0) Then
            SelecionaPedido(inttostr(iPedido));
      End;
end;

procedure TfrmNewVenda.btnClienteClick(Sender: TObject);
begin
  inherited;
      Application.CreateForm(TfrmTeleEntrega, frmTeleEntrega);
      try
          With frmTeleEntrega do
           begin
                Panel1.Enabled := False;
                BtGravar.Visible := False;
                //
                uFrmTeleEntrega.M_FLVISU := True;
                //
                ShowModal; 
           End;
      Finally
          frmTeleEntrega.Free;
      End;
end;

procedure TfrmNewVenda.btnCupomClick(Sender: TObject);
begin
     if (dmDados.cdsItensVenda.Active) and not (dmDados.cdsItensVenda.IsEmpty) Then
           Cupom;
end;

procedure TfrmNewVenda.FecharPedido;
Var
    W_NRPEDI : integer;
    W_NRMESA, aValor : String;
    W_FLATUA, W_FLTAXA : Boolean;
    fValor : Double;
begin
  inherited;
      W_FLATUA := False;
      W_FLTAXA := false;
      //
      If (dmDados.cdsItensVenda.Active)
        and not (dmDados.cdsItensVenda.IsEmpty) then
          //
          If (dmDados.cdsPreVenda.Active)
           and (dmDados.cdsPreVendaPRV_VALOR.AsFloat > 0) Then
           Begin
                //
                If not (dmDados.cdsItensVenda.Active) or (dmDados.cdsItensVenda.IsEmpty) Then
                    begin
                         Application.MessageBox (PChar('N�o h� itens no pedido atual !'+#13+'Inclua itens para poder fechar pedido.'),
                            'ATEN��O',MB_ICONINFORMATION+ MB_OK);
                         Exit;
                    End;
                 //
                 W_NRPEDI := dmDados.cdsPreVendaPRV_PEDIDO.AsInteger;
                 W_NRMESA := dmDados.cdsPreVendaPRV_NRMESA.AsString;
                 fValor   := 0;
                 //
                 If (Copy(W_NRMESA,1,1) = 'T') Then
                   begin
                        aValor := InputBox('Taxa de Servi�o','Digite o valor da taxa de servi�o:','');
                        If not uFuncoes.Empty(aValor) Then
                        begin
                          try
                              fValor := StrtoFloat(aValor);
                              W_FLTAXA := True;
                          Except
                             Application.MessageBox (PChar('Valor da taxa inv�lido.'),
                                'ATEN��O',MB_ICONINFORMATION+ MB_OK);
                             Exit;
                          End;
                        End
                        Else
                         begin
                             Application.MessageBox (PChar('Valor da taxa inv�lido.'),
                                'ATEN��O',MB_ICONINFORMATION+ MB_OK);
                             Exit;
                         End;
                   End
                 Else
                     If (Application.MessageBox('Deseja incluir taxa de servi�o ?',
                          'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1+MB_APPLMODAL) = idYes) then
                        W_FLTAXA := True;
                 //
                 dmDados.CarregarDadosItens(dmDados.cdsItensVenda);
                 //
                  Application.CreateForm(TfrmFormaPagamento, frmFormaPagamento); // Carrega form na mem�ria
                  try
                     uFormaPagamento.M_CDVEND := StrtoInt(UFrmAdmin.W_CDCAIX);
                     uFormaPagamento.M_CDCAIX := StrtoInt(UFrmAdmin.W_CDCAIX);
                     //
                     If (W_FLTAXA) Then
                         aFLTAXA := 'S'
                     Else
                         aFLTAXA := 'N';
                     //
                     iF not uFuncoes.Empty(dmDados.cdsPreVendaPRV_CLIENTE.AsString) then
                          uFormaPagamento.aCliente := dmDados.cdsPreVendaPRV_CLIENTE.AsString
                      Else
                          uFormaPagamento.aCliente := '';
                      //
                      If (fValor > 0) Then
                          uFormaPagamento.fValorTaxa := fValor
                      Else
                          uFormaPagamento.fValorTaxa := 0;
                      //    
                      frmFormaPagamento.ShowModal;
                  Finally
                     If (uFormaPagamento.M_FLPEDI = true) Then
                      Begin
                           dmDados.FecharStatusPedido(W_NRPEDI);
                           //
                           If (Dm.VerificarServicoMesa(W_NRMESA)) Then
                              if not (dm.AtualizaStatusServicoMesa(W_NRMESA, 'E')) then
                                   Application.MessageBox (PChar('Erro ao tentar atualizar status de servi�o !'),
                                          'ATEN��O',MB_ICONSTOP+ MB_OK);
                          //
                          W_FLATUA := True;
                      End
                      Else
                      begin
                           SelecionaPedido(InttoStr(W_NRPEDI));
                      End;
                      //
                      If (W_FLATUA) Then
                       begin
                            AtualizarMesasOcupadas;
                            SelecionaPedido('-1');
                       End;
                     //Libera Mem�ria
                     frmFormaPagamento.Free;
                  End;
          End;
end;

procedure TfrmNewVenda.btnFecharPedidoClick(Sender: TObject);
begin
  inherited;
         FecharPedido;
end;

procedure TfrmNewVenda.CancelarPedido1Click(Sender: TObject);
begin
  inherited;
   if (dmDados.cdsPreVenda.Active) and not (dmDados.cdsPreVenda.IsEmpty) Then
         If Application.MessageBox('Confirma Exclus�o de Pedido ?',
             'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
             begin
                  if (Dm.ExcluirPedido(dmDados.cdsPreVendaPRV_PEDIDO.AsInteger)) Then
                   begin
                        Application.MessageBox(PChar('Pedido exclu�do com sucesso.'),
                          'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                        //
                        If (dmDados.cdsItensVenda.Active) Then
                           dmDados.cdsItensVenda.Close;
                        //
                        AtualizarMesasOcupadas;
                   End;
             End;
end;

procedure TfrmNewVenda.Cupom;
Var
    W_QTPESS : integer;
    M_QUANT, aValor, W_NRMESA : String;
    M_VLTAXA, fValor : DOUBLE;
begin
  inherited;
  If (dmDados.cdsPreVenda.Active)
      and (dmDados.cdsPreVendaPRV_VALOR.AsFloat > 0) Then
    begin
         M_VLTAXA := 0;
         //
         fValor   := 0;
         //
         W_NRMESA := dmDados.cdsPreVendaPRV_NRMESA.AsString;
         If (Copy(W_NRMESA,1,1) = 'T') Then
           begin
                aValor := InputBox('Taxa de Servi�o','Digite o valor da taxa de servi�o:','');
                //
                If not uFuncoes.Empty(aValor) Then
                  begin
                       Try
                              M_VLTAXA := StrtoFloat(aValor);
                              uFuncoes.CupomPedido(dmDados.cdsPreVendaPRV_PEDIDO.AsInteger, W_QTPESS,
                                    M_VLTAXA, dmDados.cdsItensVenda, 'R');
                       Except
                             Application.MessageBox (PChar('Valor da taxa inv�lido.'),
                                'ATEN��O',MB_ICONINFORMATION+ MB_OK);
                             Exit;
                       End;
                  End
                  Else
                  begin
                       Application.MessageBox (PChar('Valor da taxa inv�lido.'),
                                'ATEN��O',MB_ICONINFORMATION+ MB_OK);
                       Exit;
                  End;
            End
           Else
            begin
                //
                If Application.MessageBox('Incluir taxa de servi�o ?',
                 'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1+MB_APPLMODAL) = idYes then
                    M_VLTAXA := dm.CdsConfigCFG_TAXA_SERVICO.AsFloat;
               //
               W_QTPESS := 0;
               M_QUANT := InputBox('Valor por pessoa','Digite a quantidade de pessoa na mesa ?','');
               //
               If  not Empty(M_QUANT) Then
                    W_QTPESS := StrtoInt(M_QUANT);
               //
               uFuncoes.CupomPedido(dmDados.cdsPreVendaPRV_PEDIDO.AsInteger, W_QTPESS,
                    M_VLTAXA, dmDados.cdsItensVenda, '%');
           End;
           //
    End;
end;

procedure TfrmNewVenda.DBGrid1DblClick(Sender: TObject);
Var
    iPedido : Integer;
begin
  inherited;
   If not (cdsConsultar.IsEmpty) Then
   begin
      If Application.MessageBox('Confirma impress�o de 2� via?',
       'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1+MB_APPLMODAL) = idYes then
       begin
           iPedido := cdsConsultarMOV_PEDIDO.AsInteger;
           CupomPedido2Via(iPedido);
       End;
   End;    
end;

End.



