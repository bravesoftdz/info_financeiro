unit uFormaPagamento;


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, Grids, DBGrids,
  ExtCtrls, DB, uVendasPDV, FMTBcd, SqlExpr, DBXpress, DBClient, ppDB,
  ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppBands, ppCache,
  ppCtrls, ppPrnabl, ppVar, ppStrtch, ppMemo, UfrmClientes;

type
  TfrmFormaPagamento = class(TForm)
    pnlFormaPag: TPanel;
    Panel1: TPanel;
    GridModa: TDBGrid;
    Panel2: TPanel;
    btConfirmar: TBitBtn;
    btCancelar: TBitBtn;
    qryProcurar: TSQLQuery;
    cdsModalidade: TClientDataSet;
    cdsModalidadeMOD_CODIGO: TIntegerField;
    cdsModalidadeMOD_NOME: TStringField;
    cdsModalidadeMOD_PECOMISSAO: TFloatField;
    cdsModalidadeMOD_ABREVIACAO: TStringField;
    dsModalidades: TDataSource;
    cdsModalidadeMOD_VALOR: TCurrencyField;
    Panel4: TPanel;
    pnlTroco: TPanel;
    Label2: TLabel;
    qryIncluir: TSQLQuery;
    pnlSuperior: TPanel;
    Label3: TLabel;
    pnlTOMERC: TPanel;
    Label4: TLabel;
    edtDESVAL: TCurrencyEdit;
    txtTOVEND: TPanel;
    Label7: TLabel;
    Label1: TLabel;
    edtDESPER: TCurrencyEdit;
    edtCDCLIE: TEdit;
    edtNMCLIE: TEdit;
    spLocCliente: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    cdsModalidadeMOD_FLFIXA: TStringField;
    qryLocVenda: TSQLQuery;
    qryProdutos: TSQLQuery;
    cdsModalidadeMOD_NRPARCELA: TFloatField;
    ppRepItensVenda: TppReport;
    ppDBItensVenda: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine1: TppLine;
    txtTitulo: TppLabel;
    ppLine2: TppLine;
    ppDBLoja: TppDBPipeline;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLine3: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine4: TppLine;
    txtVENDA: TppLabel;
    txtCLIENTE: TppLabel;
    txtCAIXA: TppLabel;
    txtVENDEDOR: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine5: TppLine;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLine6: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLine7: TppLine;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLine8: TppLine;
    txtPagamento: TppMemo;
    ppLabel15: TppLabel;
    ppLine9: TppLine;
    ppLabel16: TppLabel;
    txtPagamento2: TppMemo;
    txtTOTAL: TppLabel;
    btnCliente: TBitBtn;
    edtAcrescimo: TCurrencyEdit;
    Label8: TLabel;
    lblTaxa: TLabel;
    procedure btConfirmarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure GridModaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridModaEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridModaColEnter(Sender: TObject);
    procedure GridModaKeyPress(Sender: TObject; var Key: Char);
    procedure edtDESVALEnter(Sender: TObject);
    procedure edtDESPEREnter(Sender: TObject);
    procedure edtDESVALExit(Sender: TObject);
    procedure edtDESPERExit(Sender: TObject);
    procedure edtDESVALKeyPress(Sender: TObject; var Key: Char);
    procedure edtDESPERKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure edtCDCLIEExit(Sender: TObject);
    procedure edtCDCLIEChange(Sender: TObject);
    procedure spLocClienteClick(Sender: TObject);
    procedure edtNMCLIEEnter(Sender: TObject);
    procedure edtNMCLIEKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure edtDESVALChange(Sender: TObject);
    procedure edtDESPERChange(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure edtAcrescimoExit(Sender: TObject);
    procedure edtAcrescimoEnter(Sender: TObject);
  private
    Procedure CALCULAR;
    procedure Acrescimo;
    Procedure NotaFiscal(Local:string);
    Procedure NOTAFISCAL2;
    Procedure BUSCA_CLIENTE;
    Procedure CRIAR_PARCELAS;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormaPagamento: TfrmFormaPagamento;
  W_NRVEND, M_CAMINH, M_NMCLIE, M_NMVEND, aCliente, aFLTAXA : String;
  M_VLDIGI, M_TOENTR, M_TOVEND, M_VLLIMP : Real;
  M_CDVEND, M_CDLOJA, M_CDCLIE, M_CDCAIX : Integer;
  M_FLSUPE, M_FLPEDI : Boolean;
  M_VLREAL, M_VLPERC  : Double;
  M_FLIMPR, W_TOTAPC : Integer;
  fValorTaxa : Double;

implementation

Uses uFuncoes, UFrmAdmin, Udm, uFrmVendas, ufrmNotaFiscal, //uBematech,
  udmConsulta, uLocCliente, uFrmSupervisor, uDm2, uFrmParcelas, uFiscal,
  udmDados;

{$R *.dfm}

procedure TfrmFormaPagamento.btConfirmarClick(Sender: TObject);
Var
   {M_ACRDES, M_TPACDE,M_VLACDE, W_NRSEQU : String;
   M_FLTROC, M_FLOTEF : Boolean;
   M_FMPGTO ,M_OPTEF, M_CDMODA, M_NMMODA, M_HOMOVI :String;
   M_VLMODA, M_VLVEND : Real;
   M_DTMOVI : TDate;
   M_VLCOMP, M_VLCUST, M_VLVENDPRO : Real;
   M_CDNATU, M_QTPARC : Integer;
   M_QTANTE, M_QTATUA : Double;
   M_MSCUPO, W_FLVEND : String;
   M_SEQREC : Integer;
   TD : TTransactionDesc;}
   M_CDCLIE, M_NMCLIE, M_NRMESA : String;
begin
     M_FLPEDI := False;
     {  dm.parametros;
       M_MSCUPO := dm.CdsConfig.FieldByName('CFG_MENSAGEM_CUPOM').AsString;
       M_FLTROC := False;
       M_FLOTEF := False;
       //
       M_TPMOVI := 'V';
       M_VLCHEQ := 0;
       M_VLCART := 0;
       M_VLTROC := 0;
       M_VLVEND := uFrmVendas.M_TOVEND;
       //
       M_VLMODA := 0.0;
       M_TOENTR := 0.0;
       W_FLVEND := 'N';
       // testa se os valores das modalidades s�o maiores que zero
           cdsModalidade.First;
           cdsModalidade.DisableControls;
           //
           While not (cdsModalidade.Eof) do
           begin
                cdsModalidade.Edit;
                M_TOENTR := M_TOENTR+cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                // proximo
                cdsModalidade.Next;
           End;
           //
           cdsModalidade.EnableControls;
           //                        M_VLVEND
           If (M_TOENTR < Arredondar(M_TOVEND,2)) Then
           begin
                Application.MessageBox('O valor de entrada menor que'+#13
                                  +'o valor Total da Venda.','ATEN��O', MB_OK+MB_ICONSTOP);
                btConfirmar.Enabled := True;
                cdsModalidade.First;
                GridModa.SetFocus;
                exit;                     // sair da procedure.
           end;
       // testa se modalidades � parcelada
       cdsModalidade.First;
       cdsModalidade.DisableControls;
       //
       While not (cdsModalidade.Eof) do
       begin
            cdsModalidade.Edit;
            If (cdsModalidade.FieldByName('MOD_VALOR').AsCurrency > 0)
              AND (cdsModalidade.FieldByName('MOD_FLFIXA').AsString <> 'D')
              and (cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger > 0) Then
            begin
                If uFuncoes.Empty(edtCDCLIE.Text)
                or (edtCDCLIE.Text = '0000000') Then
                Begin
                   Application.MessageBox('Digite o c�digo do cliente!!!'+#13
                                ,'ATEN��O', MB_OK+MB_ICONINFORMATION);
                   cdsModalidade.EnableControls;
                   edtCDCLIE.SetFocus;
                   exit;                     // sair da procedure.
                End;
                //
                 W_TOTAPC := cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger;
                 //
                 criar_parcelas;
                 with TfrmParcelas.create(self) do
                    try
                         ufrmParcelas.M_CDMODA := cdsModalidade.FieldByName('MOD_CODIGO').AsInteger;
                         ufrmParcelas.M_TOMODA := cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                         ufrmParcelas.M_TPMODA := cdsModalidade.FieldByName('MOD_FLFIXA').AsString;
                         lbl_NMMODA.Caption    := cdsModalidade.FieldByName('MOD_NOME').AsString;
                         lbl_VLTOTAL.Caption   := FormatFloat('###,###,##0.#0',cdsModalidade.FieldByName('MOD_VALOR').AsCurrency);
                         showmodal;
                    finally
                         free;
                    end;
            End;
            // proximo
            cdsModalidade.Next;
       End;
       //
       cdsModalidade.EnableControls;
       //                        M_VLVEND
       If (M_TOENTR < Arredondar(M_TOVEND,2)) Then
       begin
            Application.MessageBox('O valor de entrada menor que'+#13
                                  +'o valor Total da Venda.','ATEN��O', MB_OK+MB_ICONSTOP);
            btConfirmar.Enabled := True;
            cdsModalidade.First;
            GridModa.SetFocus;
            exit;                     // sair da procedure.
       end;
       // Inicia um transa��o no BD
       TD.TransactionID  := M_CDCAIX;
       TD.IsolationLevel := xilREADCOMMITTED;
       Dm.SqlAdmin.StartTransaction(TD);
       //
       Try
           // Inicia o fechamento do cupom com o uso das formas de pagamento.
           btConfirmar.Enabled := False;
           M_DTMOVI := Date();
           M_HOMOVI := TimetoStr(Time);
           If (edtDESVAL.Value > 0) Then
               M_VLDESC := edtDESVAL.Value
           Else
               M_VLDESC := 0;
           // Fechamento de cupom
           iRetorno := uFiscal.FISCAL('TotalCupom', M_IMPRES,
                              'D',
                              '$',
                              FormatFloat('###,##0.#0',edtDESVAL.Value));
           If (iRetorno = 1) Then
               begin
                    cdsModalidade.DisableControls;
                    cdsModalidade.First;
                    While not (cdsModalidade.Eof) do
                    begin
                        If (cdsModalidade.FieldByName('MOD_VALOR').AsCurrency > 0) Then
                           begin
                                M_CDMODA := cdsModalidade.FieldByName('MOD_CODIGO').AsString;
                                M_NMMODA := cdsModalidade.FieldByName('MOD_NOME').AsString;
                                M_VLMODA := cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                                //  Formas de Pagamento
                                If (M_VLMODA > 0.0) Then
                                    uFiscal.FISCAL('Pagamento', M_IMPRES,
                                                   M_NMMODA,
                                                   FormatFloat('###,##0.#0',M_VLMODA));
                           End;
                         //
                        cdsModalidade.Next;
                   End;
               End;
           //
           iRetorno := uFiscal.FISCAL('FecharCupom',M_IMPRES,
                                      M_MSCUPO);
           //
           If (iRetorno = 1) Then
             Begin
                  With dmConsultas.qryCaixa do
                  Begin
                       Close;
                       Params.ParamByName('pCAIXA').AsInteger   := M_CDCAIX;
                       Params.ParamByName('pSITUACAO').AsString := 'A';
                       Open;
                  End;
                  //
                  If not (dmConsultas.qryCaixa.IsEmpty) Then
                       M_CDLOJA := dmConsultas.qryCaixaCAI_LOJA.AsInteger;
                  //
                  If uFuncoes.Empty(edtCDCLIE.Text) Then
                  Begin
                        M_CDCLIE := 0;
                        M_NMCLIE := 'VENDA AO CONSUMIDOR';
                  End
                  Else
                  Begin
                        M_CDCLIE := StrtoInt(edtCDCLIE.Text);
                        M_NMCLIE := edtNMCLIE.Text;
                  End;
                  //
                  dm.parametros;
                  //
                  While (W_FLVEND = 'N') do
                  Begin
                    Dm.CdsConfig.edit;
                    Dm.CdsConfig.FieldByName('CFG_VENDA').AsFloat     :=
                         Dm.CdsConfig.FieldByName('CFG_VENDA').AsFloat + 1;
                    Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat :=
                         Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat+1;
                    M_CDNATU := Dm.CdsConfig.FieldByName('CFG_NATUREZAVENDA').AsInteger;
                    W_NRVEND := uFuncoes.StrZero(FloattoStr(Dm.CdsConfig.FieldByName('CFG_VENDA').AsFloat),7);
                    W_NRSEQU := uFuncoes.StrZero(FloattoStr(Dm.CdsConfig.FieldByName('CFG_SEQUENCIA').AsFloat),10);
                    Dm.CdsConfig.Post;
                    Dm.CdsConfig.ApplyUpdates(0);
                    //
                    M_TOVEND := StrtoFloat(txtTOVEND.Caption);
                    M_VLTROC := M_TOENTR-M_TOVEND;
                    //M_VLVEND;
                    // Troco
                    pnlTroco.Caption := FormatFloat('###,##0.00',M_VLTROC);
                    // Tabela Vendas
                    Dm.cdsmovimento.Close;
                    With Dm.dstMovimento do
                    Begin
                       Active := False;
                       CommandText := 'Select * from VENDAS Where (MOV_PEDIDO = :pPEDIDO)';
                       Params.ParamByName('pPEDIDO').AsInteger := StrtoInt(W_NRVEND);
                       Active := True;
                    End;
                    Dm.cdsmovimento.Open;
                     // Novo registro de Venda
                    If (Dm.cdsMovimento.IsEmpty) Then
                         W_FLVEND := 'S'
                    Else
                         W_FLVEND := 'N';
                    //
                  End;  // fim-do-enquanto
                  //
                    With Dm.cdsMovimento do
                    Begin
                       Append;
                       FieldByName('MOV_PEDIDO').AsInteger     := StrtoInt(W_NRVEND);
                       //FieldByName('MOV_CUPOM').AsInteger  := M_NRCUPO;
                       FieldByName('MOV_LOJA').AsInteger       := M_CDLOJA;
                       FieldByName('MOV_SEQUENCIA').AsInteger  := StrtoInt(W_NRSEQU);
                       FieldByName('MOV_DATAVENDA').AsDateTime := M_DTMOVI;
                       FieldByName('MOV_HORAVENDA').AsString   := M_HOMOVI;
                       FieldByName('MOV_VALOR').AsCurrency     := M_TOVEND;
                       FieldByName('MOV_TROCO').AsCurrency     := M_VLTROC;
                       FieldByName('MOV_SITUACAO').AsString    := 'F';
                       FieldByName('MOV_VENDEDOR').AsInteger   := M_CDVEND;
                       FieldByName('MOV_DESCONTO').AsCurrency  := M_VLDESC;
                       FieldByName('MOV_CLIENTE').AsInteger    := M_CDCLIE;
                       FieldByName('MOV_NOMECLIENTE').AsString := M_NMCLIE;
                       // Grava registro
                       Post;
                       ApplyUpdates(0);
                    End;
                    //
                    Dm.cdsItensVendas.DisableControls;
                    Dm.cdsItensVendas.First;
                    While not (Dm.cdsItensVendas.Eof) do
                    Begin
                      If (Dm.cdsItensVendas.FieldByName('ITE_FLCANC').AsString <> 'C') Then
                      Begin
                       // Tabela movimento produto
                       With qryIncluir do
                       Begin
                            SQL.Clear;
                            Close;
                            SQL.Add('INSERT INTO PROVENDAS (MOP_PEDIDO, MOP_PRODUTO, MOP_QUANTIDADE, ');
                            SQL.Add('MOP_UNIDADE, MOP_VALOR, MOP_DESCONTO, MOP_CUSTO, MOP_COMPRA)');
                            SQL.Add('VALUES (:pPEDIDO, :pPRODUTO, :pQUANTIDADE, ');
                            SQL.Add(':pUNIDADE, :pVALOR, :pDESCONTO, :pCUSTO, :pCOMPRA)');
                            //
                            Params.ParamByName('pPEDIDO').AsInteger  := StrtoInt(W_NRVEND);
                            Params.ParamByName('pPRODUTO').AsString  := Dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString;
                            Params.ParamByName('pQUANTIDADE').AsFloat := Dm.cdsItensVendas.FieldByName('ITE_QTITEN').AsFloat;
                            Params.ParamByName('pUNIDADE').AsString   := Dm.cdsItensVendas.FieldByName('ITE_CDUNID').AsString;
                            Params.ParamByName('pVALOR').AsCurrency   := Dm.cdsItensVendas.FieldByName('ITE_VLUNIT').AsCurrency;
                            Params.ParamByName('pDESCONTO').AsCurrency := 0;
                            Params.ParamByName('pCUSTO').AsCurrency   := Dm.cdsItensVendas.FieldByName('ITE_VLCOMP').AsCurrency;
                            Params.ParamByName('pCOMPRA').AsCurrency  := Dm.cdsItensVendas.FieldByName('ITE_VLCUST').AsCurrency;
                            //
                            ExecSQL;
                       End;
                       //  Tabela de estoque
                       Dm.cdsEstoque.Close;
                       With Dm.dstEstoque do
                       Begin
                            Active := False;
                            CommandText := 'Select * from ESTOQUE Where (EST_CODIGOLOJA = :pCODIGOLOJA) and (PRO_CODIGO = :pCODIGO)';
                            //
                            Params.ParamByName('pCODIGOLOJA').AsInteger := M_CDLOJA;
                            // Altera��o nova
                            If uFuncoes.Empty(Dm.cdsItensVendas.FieldByName('ITE_CDBAIX').AsString) Then
                                Params.ParamByName('pCODIGO').AsString := Dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString
                            Else
                                Params.ParamByName('pCODIGO').AsString := Dm.cdsItensVendas.FieldByName('ITE_CDBAIX').AsString;
                            Active := True;
                       End;
                       Dm.cdsEstoque.Open;
                       // Tabela de Estoque
                       M_QTANTE := 0;
                       If (Dm.cdsEstoque.IsEmpty) Then  // Se n�o encontrar
                       begin
                            Dm.cdsEstoque.Append;
                            Dm.cdsEstoque.FieldByName('EST_CODIGOLOJA').AsInteger := M_CDLOJA;
                            // Nova altera��o
                            If uFuncoes.Empty(Dm.cdsItensVendas.FieldByName('ITE_CDBAIX').AsString) Then
                                Dm.cdsEstoque.FieldByName('PRO_CODIGO').AsString := Dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString
                            Else
                                Dm.cdsEstoque.FieldByName('PRO_CODIGO').AsString := Dm.cdsItensVendas.FieldByName('ITE_CDBAIX').AsString;
                            Dm.cdsEstoque.FieldByName('UNI_CODIGO').AsString := Dm.cdsItensVendas.FieldByName('ITE_CDUNID').AsString;
                            Dm.cdsEstoque.FieldByName('EST_DTSAIDA').AsDateTime := M_DTMOVI;
                            Dm.cdsEstoque.FieldByName('EST_QUANTSAIDA').AsFloat := Dm.cdsItensVendas.FieldByName('ITE_QTITEN').AsFloat;
                            Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat :=
                                 Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat - Dm.cdsItensVendas.FieldByName('ITE_QTITEN').AsFloat;
                            M_QTATUA := Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                            Dm.cdsEstoque.Post;
                            Dm.cdsEstoque.ApplyUpdates(0);
                       End
                       Else
                       Begin
                            Dm.cdsEstoque.Edit;
                            //
                            M_QTANTE := Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                            //
                            Dm.cdsEstoque.FieldByName('EST_DTSAIDA').AsDateTime := M_DTMOVI;
                            Dm.cdsEstoque.FieldByName('EST_QUANTSAIDA').AsFloat := Dm.cdsItensVendas.FieldByName('ITE_QTITEN').AsFloat;
                            Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat :=
                                    Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat - Dm.cdsItensVendas.FieldByName('ITE_QTITEN').AsFloat;
                            M_QTATUA := Dm.cdsEstoque.FieldByName('EST_QUANTIDADE').AsFloat;
                            Dm.cdsEstoque.Post;
                            Dm.cdsEstoque.ApplyUpdates(0);
                       End;
                       // Tabela de historico
                       Dm.cdsHistorico.Close;
                       With Dm.dstHistorico do
                       Begin
                            Active := False;
                            CommandText := 'Select * from HISTORICO Where (HIS_SEQUENCIA = :pSEQUENCIA) '
                                          +' and (HIS_LOJA = :pLOJA) AND (HIS_PRODUTO =  :pPRODUTO) ';
                            Params.ParamByName('pSEQUENCIA').AsInteger := StrtoInt(W_NRSEQU);
                            Params.ParamByName('pLOJA').AsInteger      := M_CDLOJA;
                            Params.ParamByName('pPRODUTO').AsString    := Dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString;
                            Active := True;
                       End;
                       Dm.cdsHistorico.Open;
                       //
                       With qryProdutos do
                       Begin
                            Close;
                            Params.ParamByName('pCODIGO').AsString := Dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString;
                            Open;
                       End;
                       //
                       If not (qryProdutos.IsEmpty) Then
                       Begin
                            M_VLCOMP     := qryProdutos.FieldByName('PRO_VLCOMPRA').AsCurrency;
                            M_VLCUST     := qryProdutos.FieldByName('PRO_VLCUSTO').AsCurrency;
                            M_VLVENDPRO  := qryProdutos.FieldByName('PRO_VLVENDA').AsCurrency;
                       End;
                       //
                       With Dm.cdsHistorico do
                       Begin
                             Append;
                             FieldByName('HIS_SEQUENCIA').AsInteger := StrtoInt(W_NRSEQU);
                             FieldByName('HIS_LOJA').AsInteger      := M_CDLOJA;
                             FieldByName('HIS_PRODUTO').AsString    := Dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString;
                             FieldByName('HIS_UNIDADE').AsString    := Dm.cdsItensVendas.FieldByName('ITE_CDUNID').AsString;
                             FieldByName('HIS_DATA').AsDateTime     := M_DTMOVI;
                             FieldByName('HIS_HORA').AsString       := M_HOMOVI;
                             FieldByName('HIS_TIPO').AsString       := 'V';
                             FieldByName('HIS_DOCUMENTO').AsInteger := StrtoInt(W_NRVEND);
                             FieldByName('HIS_ANTERIOR').AsFloat    := M_QTANTE;
                             FieldByName('HIS_MOVIMENTO').AsFloat   := Dm.cdsItensVendas.FieldByName('ITE_QTITEN').AsFloat;
                             FieldByName('HIS_VLCUSTO').AsCurrency  := M_VLCUST;
                             FieldByName('HIS_VLCOMPRA').AsCurrency := M_VLCOMP;
                             FieldByName('HIS_VLVENDA').AsCurrency  := M_VLVENDPRO;
                             FieldByName('HIS_ATUAL').AsFloat       := M_QTATUA;
                             FieldByName('HIS_USUARIO').AsInteger   := M_CDCAIX;
                             // nova altera��o
                             If not uFuncoes.Empty(Dm.cdsItensVendas.FieldByName('ITE_CDBAIX').AsString) Then
                                 FieldByName('HIS_CODIGOBAIXA').AsString := Dm.cdsItensVendas.FieldByName('ITE_CDBAIX').AsString
                             Else
                                 FieldByName('HIS_CODIGOBAIXA').AsString := Dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString;
                             Post;
                             ApplyUpdates(0);
                       End;
                      End;  // se produto n�o foi cancelado
                      // Lote
                      // nova altera��o
                      If uFuncoes.Empty(Dm.cdsItensVendas.FieldByName('ITE_CDBAIX').AsString) Then
                          M_CDPROD := Dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString
                      Else
                          M_CDPROD := Dm.cdsItensVendas.FieldByName('ITE_CDBAIX').AsString;
                      //
                      If not uFuncoes.Empty(Dm.cdsItensVendas.FieldByName('ITE_NRLOTE').AsString)
                       AND (Dm.cdsItensVendas.FieldByName('ITE_FLCANC').AsString <> 'C') Then
                      begin
                         dm2.cdsLotes.Close;
                         With dm2.dstLotes do
                         begin
                            Active := False;
                            CommandText := 'Select * from LOTES Where (LOT_NRLOTE = :pLOTE) and (LOT_PROCODIGO = :pCODIGO)';
                            Params.ParamByName('pLOTE').AsString   := Dm.cdsItensVendas.FieldByName('ITE_NRLOTE').AsString;
                            Params.ParamByName('pCODIGO').AsString := M_CDPROD;
                            Active := True;
                         End;
                         dm2.cdsLotes.Open;
                         //
                         If not (dm2.cdsLotes.IsEmpty) Then
                         begin
                            With dm2.cdsLotes do
                            Begin
                                 Edit;
                                 FieldByName('LOT_QUANTIDADE').AsFloat  := FieldByName('LOT_QUANTIDADE').AsFloat
                                                      - Dm.cdsItensVendas.FieldByName('ITE_QTITEN').AsFloat;
                                 //
                                 Post;
                                 ApplyUpdates(0);
                            End;
                         End;
                      End;
                       // Proximo
                       Dm.cdsItensVendas.Next;
                   End;
                   Dm.cdsItensVendas.EnableControls;
                   //
                   cdsModalidade.DisableControls;
                   cdsModalidade.First;
                   While not (cdsModalidade.Eof) do
                   begin
                       If (cdsModalidade.FieldByName('MOD_VALOR').AsCurrency > 0) Then
                       begin
                           M_CDMODA := cdsModalidade.FieldByName('MOD_CODIGO').AsString;
                           M_NMMODA := cdsModalidade.FieldByName('MOD_NOME').AsString;
                           M_VLMODA := cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                           // Grava dados no BD.
                           If (M_VLMODA > 0.0) Then
                           begin
                                dm.cdsMovimentoCaixa.Close;
                                With dm.dstMovimentoCaixa do
                                Begin
                                     Active := False;
                                     CommandText := 'Select * from MOVIMENTO_CAIXA '+
                                                    'Where (MCA_SEQUENCIA = :pSEQUENCIA) and (MCA_MODALIDADE = :pMODALIDADE)';
                                     Params.ParamByName('pSEQUENCIA').AsInteger := StrtoInt(W_NRSEQU);
                                     Params.ParamByName('pMODALIDADE').AsString := M_CDMODA;
                                     Active := True;
                                End;
                                dm.cdsMovimentoCaixa.Open;
                                //
                                With dm.cdsMovimentoCaixa do
                                Begin
                                     Append;
                                     FieldByName('MCA_SEQUENCIA').AsInteger := StrtoInt(W_NRSEQU);
                                     FieldByName('MCA_LOJA').AsInteger      := M_CDLOJA;
                                     FieldByName('MCA_VENDA').AsInteger     := StrtoInt(W_NRVEND);
                                     FieldByName('MCA_TIPOMOV').AsString    := 'V';
                                     FieldByName('MCA_DTMOVIMENTO').AsDateTime := M_DTMOVI;
                                     FieldByName('MCA_HRMOVIMENTO').AsString   := M_HOMOVI;
                                     FieldByName('MCA_MODALIDADE').AsString := M_CDMODA;
                                     FieldByName('MCA_VLMODALIDADE').AsCurrency := M_VLMODA;
                                     FieldByName('MCA_TOVENDA').AsCurrency  := M_TOVEND;
                                     If (cdsModalidade.FieldByName('MOD_FLFIXA').AsString = 'D') Then
                                         FieldByName('MCA_VLTROCO').AsCurrency  := M_VLTROC
                                     Else
                                         FieldByName('MCA_VLTROCO').AsCurrency  := 0;
                                     FieldByName('MCA_SITUACAO').AsString   := 'N';
                                     FieldByName('MCA_CAIXA').AsInteger     := M_CDCAIX;
                                     FieldByName('MCA_NATUREZA').AsInteger  := M_CDNATU;
                                     Post;
                                     ApplyUpdates(0);
                                End;
                                //
                                If (cdsModalidade.FieldByName('MOD_FLFIXA').AsString <> 'D')
                                    and (cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger > 0) Then
                                begin
                                     dm.parametros;
                                     dm.CdsConfig.Edit;
                                     dm.CdsConfigCFG_CREDITO.AsInteger := dm.CdsConfigCFG_CREDITO.AsInteger + 1;
                                     dm.CdsConfig.Post;
                                     dm.CdsConfig.ApplyUpdates(0);
                                     //
                                     DM2.cdsContasReceber.Close;
                                     With dm2.dstContasReceber do
                                     Begin
                                          Active := False;
                                          CommandText := 'Select * from CONTASRECEBER Where (REC_CREDITO = :pCREDITO)'
                                                 +' and (REC_LOJA = :pLOJA) ';
                                          Params.ParamByName('pCREDITO').AsInteger := dm.CdsConfigCFG_CREDITO.AsInteger;
                                          Params.ParamByName('pLOJA').AsInteger    := M_CDLOJA;
                                          Active := True;
                                     End;
                                     //
                                     DM2.cdsContasReceber.FetchParams;
                                     DM2.cdsContasReceber.Open;
                                     //
                                     If (DM2.cdsContasReceber.IsEmpty) then
                                     Begin
                                       M_QTPARC := 1;
                                       dm2.cdsParcelasVenda.First;
                                       While not (dm2.cdsParcelasVenda.Eof) do
                                       //While M_QTPARC <= cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger do
                                       Begin
                                         //
                                         If (dm2.cdsParcelasVenda.FieldByName('PAR_MODALIDADE').AsInteger =
                                             cdsModalidade.FieldByName('MOD_CODIGO').AsInteger) Then
                                         begin
                                                  //
                                                  dm.CdsConfig.Edit;
                                                  dm.CdsConfigCFG_SEQRECEBER.Value    := dm.CdsConfigCFG_SEQRECEBER.Value+1;
                                                  M_SEQREC := dm.CdsConfigCFG_SEQRECEBER.AsInteger;
                                                         dm.CdsConfig.ApplyUpdates(0);
                                                  //
                                                  dm2.cdsContasReceber.Append;
                                                  dm2.cdsContasReceber.FieldByName('REC_SEQUENCIA').AsInteger  := M_SEQREC;
                                                  DM2.cdsContasReceber.FieldByName('REC_LOJA').AsInteger       := M_CDLOJA;
                                                  DM2.cdsContasReceber.FieldByName('REC_CREDITO').AsInteger    := dm.CdsConfigCFG_CREDITO.AsInteger;
                                                  dm2.cdsContasReceber.FieldByName('REC_PARCELA').AsInteger    := dm2.cdsParcelasVenda.FieldByName('PAR_NRPARCELA').AsInteger;
                                                  dm2.cdsContasReceber.FieldByName('REC_QTPARCELAS').AsInteger := cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger;
                                                  DM2.cdsContasReceber.FieldByName('REC_CLIENTE').AsInteger    := M_CDCLIE;
                                                  DM2.cdsContasReceber.FieldByName('REC_NRVENDA').AsInteger    := StrtoInt(W_NRVEND);
                                                  DM2.cdsContasReceber.FieldByName('REC_DESCRICAO').AsString   := 'VENDA A PRESTA��O';
                                                  DM2.cdsContasReceber.FieldByName('REC_VALORPARCELA').AsCurrency := dm2.cdsParcelasVenda.FieldByName('PAR_VALOR').AsCurrency;
                                                  DM2.cdsContasReceber.FieldByName('REC_VALORACRESIMO').AsFloat   := 0;
                                                  DM2.cdsContasReceber.FieldByName('REC_VALORJUROS').AsFloat      := 0;
                                                  DM2.cdsContasReceber.FieldByName('REC_VALORDESCONTO').AsFloat   := 0;
                                                  DM2.cdsContasReceber.FieldByName('REC_DATAEMISSAO').AsDateTime  := Date();
                                                  DM2.cdsContasReceber.FieldByName('REC_DATAVENCIMENTO').AsDateTime := dm2.cdsParcelasVenda.FieldByName('PAR_VENCIMENTO').AsDateTime;
                                                  DM2.cdsContasReceber.FieldByName('REC_BANCO').AsString          := dm2.cdsParcelasVenda.FieldByName('PAR_CDBANCO').AsString;
                                                  DM2.cdsContasReceber.FieldByName('REC_AGENCIA').AsString        := dm2.cdsParcelasVenda.FieldByName('PAR_AGENCIA').AsString;
                                                  DM2.cdsContasReceber.FieldByName('REC_NRCONTA').AsString        := dm2.cdsParcelasVenda.FieldByName('PAR_CONTA').AsString;
                                                  DM2.cdsContasReceber.FieldByName('REC_NRCHEQUE').AsString       := dm2.cdsParcelasVenda.FieldByName('PAR_CHEQUE').AsString;
                                                  DM2.cdsContasReceber.FieldByName('REC_SITUACAO').AsString       := 'A';
                                                  DM2.cdsContasReceber.FieldByName('REC_USUARIO').AsInteger       := M_CDCAIX;
                                                  //
                                                  DM2.cdsContasReceber.Post;
                                                  M_QTPARC := M_QTPARC + 1;
                                         End;
                                         //Proximo
                                         dm2.cdsParcelasVenda.Next;
                                       End; // Fim_enquanto
                                       //
                                       DM2.cdsContasReceber.ApplyUpdates(0);
                                       //
                                     End;  // se-em-branco
                              End;  // Se-Fim M_FLFIXA
                           End;    // Se modalidade maior que Zero
                       End;          // Fim-do-retorno efetua Pagamento
                       // Pr�ximo registro
                       cdsModalidade.Next;
                   End;
                  //
                  cdsModalidade.EnableControls;
                  uFrmVendas.M_FLVEND := False;
                 //
                 //MessageBox (Application.Handle, pChar('Venda N.� '+W_NRVEND +' concluida com sucesso.'),
                 MessageBox (Application.Handle, pChar('Venda realizada com sucesso.'),
                              'ATEN��O',MB_ICONINFORMATION+ MB_OK);
                 // Grava
                 Dm.SqlAdmin.Commit(TD);  // on success, commit the changes
                 //
                 If (M_IMPRES = 0) AND (dm.CdsConfigCFG_FLCUPOMVENDA.AsString = 'S' ) Then
                   If Application.MessageBox('Deseja imprimir cupom?',
                      'ATEN��O', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
                           //NotaFiscal2;
                           NotaFiscal('TELA');
                 //
                 Close;
       End // Se iRetorno = 1
       Else
       Begin
              Application.MessageBox(PChar('Erro no fechamento da venda!!!'+#13'Verifique a impressora fiscal.')
                , 'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //  Cancelar transa��o no BD.
              Dm.SqlAdmin.Rollback(TD);
              //
              btConfirmar.Enabled := True;
              Exit;
       End;
 Except
        on Exc:Exception do
        begin
              Application.MessageBox(PChar('Erro no fechamento de Venda N.� '+W_NRVEND+#13
                      + Exc.Message), 'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              //  Cancelar transa��o no BD.
              Dm.SqlAdmin.Rollback(TD);
              //
              btConfirmar.Enabled := True;
              Close;
        End;
 End; }
     btCancelar.Enabled := False;
     btConfirmar.Enabled   := False;
     try
          Screen.Cursor := crHourGlass;
          //
          uFuncoes.MODALIDADES;
          //
          M_CDCLIE := edtCDCLIE.text;
          M_NMCLIE := edtNMCLIE.Text;
          //
          If uFuncoes.Empty(M_CDCLIE) Then
               M_CDCLIE := '0';
          //
          If uFuncoes.Empty(M_NMCLIE) Then
               M_NMCLIE := 'VENDA AO CONSUMIDOR';
          // txtTOVEND
          {if not (uFuncoes.VENDA(uFrmVendas.M_TOVEND, edtDESVAL.Value, M_CDLOJA, M_CDCAIX,
                M_IMPRES, StrtoInt(M_CDCLIE), Date() , M_NMCLIE, TimetoStr(time()), '1')) Then}
                // StrtoFloat(txtTOVEND.Caption)
          //
          Dm.RefreshCDS(Dm.CdsConfig);  
          If (Dm.CdsConfigCFG_FLVENDEDOR_ITEM_VENDA.AsString = 'S') Then
              M_NRMESA := dmDados.cdsPreVendaPRV_NRMESA.AsString
          Else
              M_NRMESA := '001'; 
          //
          if not (uFuncoes.VENDA(M_TOVEND, edtDESVAL.Value, edtAcrescimo.value, M_CDLOJA, M_CDCAIX,
                M_IMPRES, StrtoInt(M_CDCLIE), 0 , M_CDVEND, Date() , M_NMCLIE, TimetoStr(time()), '1', '',0,0, 0, 0, '', '', '', M_NRMESA, aFLTAXA, fValorTaxa)) Then
            begin
                 If (uDM.M_NRMENS <> 1) Then
                    Application.MessageBox(PChar('Erro no fechamento de venda !'),
                          'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            End
            Else
            begin
                 M_FLPEDI := true;
                 uFrmVendas.M_FLVEND := False;
                 Close;
            End;
     Finally
          Screen.Cursor := crDefault;
          btCancelar.Enabled   := True;
          btConfirmar.Enabled  := True;
     End;
     //
     Application.ProcessMessages;
end;

procedure TfrmFormaPagamento.btCancelarClick(Sender: TObject);
begin
      //pnlFormaPag.Visible := False;
      M_FLPEDI := False;
      Close;
     { M_TOVEND := W_VLVEND;
      frmVenda.COMPONENTES_INVISIVEL('1');
      frmVenda.edtCodigo.Enabled   :=  True;
      frmVenda.edtCodigo.SetFocus;}
end;

procedure TfrmFormaPagamento.GridModaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     //
     If (key = vk_F2) then
     begin
          //Validar_Entradas;
          btConfirmarClick(Sender);
          //btConfirmar.SetFocus;
     End;
     //
     If (key = vk_Escape) Then
       btCancelar.SetFocus;
     //
     If (Shift = [ssCtrl]) and (Key = 46) Then
          KEY := 0;
     //
     case key of
        13 : Key := 9;
     end;
     //
end;

procedure TfrmFormaPagamento.GridModaEnter(Sender: TObject);
begin
     GridModa.SelectedIndex := 1; { Vai para a 1� coluna }
end;

procedure TfrmFormaPagamento.FormShow(Sender: TObject);
begin
     KeyPreview := False;
     //
     dm.RefreshCDS(Dm.CdsConfig);
     //
     M_VLLIMP := 0;
     lblTaxa.Visible := False;
     //
     If (dm2.cdsParcelasVenda.Active = False) Then
        dm2.cdsParcelasVenda.Open;
     dm2.cdsParcelasVenda.EmptyDataSet;
     //
     Dm.cdsModalidade.Close;
     With dm.dstModalidades do
     Begin
          Active := False;
          CommandText := 'Select * from MODALIDADE order By MOD_NOME';
          Active := True;
     End;
     Dm.cdsModalidade.Open;
     Dm.cdsModalidade.First;
     //
     cdsModalidade.Open;
     While not (Dm.cdsModalidade.Eof) do
     Begin
          cdsModalidade.Append;
          cdsModalidade.FieldByName('MOD_CODIGO').AsInteger :=
             Dm.cdsModalidade.FieldByName('MOD_CODIGO').AsInteger;
          cdsModalidade.FieldByName('MOD_NOME').AsString      :=
             Dm.cdsModalidade.FieldByName('MOD_NOME').AsString;
          cdsModalidade.FieldByName('MOD_PECOMISSAO').AsFloat :=
             Dm.cdsModalidade.FieldByName('MOD_PECOMISSAO').AsFloat;
          cdsModalidade.FieldByName('MOD_ABREVIACAO').AsString :=
             Dm.cdsModalidade.FieldByName('MOD_ABREVIACAO').AsString;
          cdsModalidade.FieldByName('MOD_VALOR').AsCurrency := 0;
          cdsModalidade.FieldByName('MOD_FLFIXA').AsString  :=
             Dm.cdsModalidade.FieldByName('MOD_FLFIXA').AsString;
          cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger :=
             Dm.cdsModalidade.FieldByName('MOD_NRPARCELA').AsInteger;
          cdsModalidade.Post;
          // Proximo
          Dm.cdsModalidade.Next;
     End;
     //
     cdsModalidade.First;
     //
     If (Dm.CdsConfigCFG_FLVENDEDOR_ITEM_VENDA.AsString = 'S')  Then
     begin
         M_TOVEND := dmDados.cdsPreVendaPRV_VALOR.AsFloat;
         pnlTOMERC.Caption  := FormatFloat('###,##0.00', M_TOVEND);
         //
         IF (aFLTAXA = 'S') then
          begin
             If (fValorTaxa = 0) Then
             begin
                  {txtTOVEND.Caption  := FormatFloat('###,##0.00', M_TOVEND + uFuncoes.Arredondar(uFuncoes.Gerapercentual(M_TOVEND, Dm.CdsConfigCFG_TAXA_SERVICO.AsFloat),2));
                  lblTaxa.Visible := True;
                  lblTaxa.Caption := 'Taxa de Servi�o: ' + FormatFloat('###,##0.##', Dm.CdsConfigCFG_TAXA_SERVICO.AsFloat) +' %';}
                  fValorTaxa := uFuncoes.Arredondar(uFuncoes.Gerapercentual(M_TOVEND, Dm.CdsConfigCFG_TAXA_SERVICO.AsFloat),2);
                  M_TOVEND := M_TOVEND + fValorTaxa;
                  //Dm.CdsConfigCFG_TAXA_SERVICO.AsFloat;
                  txtTOVEND.Caption  := FormatFloat('###,##0.00', M_TOVEND);
                  lblTaxa.Visible := True;
                  lblTaxa.Caption := 'Taxa de Servi�o: ' + FormatFloat('##0.#0', Dm.CdsConfigCFG_TAXA_SERVICO.AsFloat) +' %';
             End
             Else
             begin
                  M_TOVEND := M_TOVEND + fValorTaxa;
                  txtTOVEND.Caption  := FormatFloat('###,##0.00', M_TOVEND);
                  lblTaxa.Visible := True;
                  lblTaxa.Caption := 'Taxa de Servi�o: R$ ' + FormatFloat('##0.#0', fValorTaxa);
             End;
          End
         Else
             txtTOVEND.Caption  := FormatFloat('###,##0.00', M_TOVEND);
     End
     Else
     begin
         M_TOVEND := uFrmVendas.M_TOVEND;
         txtTOVEND.Caption  := FormatFloat('###,##0.00', uFrmVendas.M_TOVEND);
         pnlTOMERC.Caption  := FormatFloat('###,##0.00', uFrmVendas.M_TOVEND);
     End;
     //
     pnlFormaPag.Visible := True;
     btConfirmar.Enabled := True;
     //
     If not uFuncoes.Empty(aCliente) Then
      begin
           edtCDCLIE.SetFocus;
           edtCDCLIE.Text := uFuncoes.StrZero(aCliente,7);
           Perform(WM_NEXTDLGCTL, 0, 0);
      End;
     //
     M_FLIMPR := dm.CdsConfigCFG_IMPRESSORA.AsInteger; 
     // GridModa
     If (uFrmAdmin.M_FLSUPE = 'S') Then
         edtDESVAL.SetFocus
     Else
         GridModa.SetFocus;
end;

procedure TfrmFormaPagamento.GridModaColEnter(Sender: TObject);
begin
     GridModa.SelectedIndex:=1;
     //
     If (uFuncoes.Empty(cdsModalidade.FieldByName('MOD_NOME').AsString)) Then
           cdsModalidade.Delete;
end;

procedure TfrmFormaPagamento.GridModaKeyPress(Sender: TObject;
  var Key: Char);
Var
    W_TOVEND : Real;
    bmLocalImportante : TBookmark;
begin
      W_TOVEND := M_TOVEND;
      //StrtoFloat(txtTOVEND.Caption);
      //
      If (Key = #13) Then
      //and (cdsModalidade.FieldByName('MOD_VALOR').AsCurrency>0) Then
      begin
           Key := #0;
           //
           M_VLDIGI := 0;
           //bmLocalImportante := cdsModalidade.GetBookMark;
           M_NMMODA := cdsModalidade.FieldByName('MOD_NOME').AsString;
           //
           cdsModalidade.DisableControls;
           cdsModalidade.First;
           //
           While not (cdsModalidade.Eof) do
           begin
              {If (cdsModalidade.FieldByName('MOD_VALOR').AsCurrency>0) Then
              Begin}
                If (uFuncoes.Empty(cdsModalidade.FieldByName('MOD_NOME').AsString)) Then
                begin
                     cdsModalidade.Delete;
                     break;
                     GridModa.SetFocus;
                     Exit;
                End;
                //
                //If (cdsModalidade.FieldByName('MOD_VALOR').AsCurrency > 0) Then
                     M_VLDIGI := M_VLDIGI+cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                //
              //End;
              // Proximo
                cdsModalidade.Next;
           End;
           //
           cdsModalidade.EnableControls;
           //
           {If (M_VLDIGI >= W_TOVEND) Then
           begin}
               uFrmVendas.M_VLTROC :=  M_VLDIGI-W_TOVEND;
               //
               //pnlEntrada.Caption := FormatFloat('###,###,##0.#0', M_VLDIGI);
               pnlTroco.Caption  := FormatFloat('###,##0.#0', uFrmVendas.M_VLTROC);
               cdsModalidade.Locate('MOD_NOME',M_NMMODA,[]);
              // cdsModalidade.Next;
               {cdsModalidade.First;
               cdsModalidade.GotoBookMark(bmLocalImportante);
               cdsModalidade.FreeBookMark(bmLocalImportante);
               cdsModalidade.Next;}
           //End;
           //
           If (M_VLDIGI = 0) then
              pnlTroco.Caption  := '0,00';
      End;
      //
      If (key = #13) and (cdsModalidade.Eof) Then
      Begin
           Key := #0;
           btConfirmar.SetFocus;
      End;
      //
end;

procedure TfrmFormaPagamento.edtDESVALEnter(Sender: TObject);
begin
    If (Dm.CdsConfigCFG_FLVENDEDOR_ITEM_VENDA.AsString = 'N') Then
        M_TOVEND := uFrmVendas.M_TOVEND + edtAcrescimo.Value
    Else
        M_TOVEND := dmDados.cdsPreVendaPRV_VALOR.AsFloat + edtAcrescimo.Value;
    //
    edtDESPER.Value := 0;
    edtDESVAL.Value := 0;
    //
    if (Dm.CdsConfigCFG_FLVENDEDOR_ITEM_VENDA.AsString = 'N') Then
        txtTOVEND.Caption  := FormatFloat('###,##0.00', M_TOVEND)
    Else
        if (aFLTAXA = 'S') Then
         begin
            If (fValorTaxa = 0) Then
            begin
                //M_TOVEND := M_TOVEND + Dm.CdsConfigCFG_TAXA_SERVICO.AsFloat;
                //txtTOVEND.Caption  := FormatFloat('###,##0.00', M_TOVEND);
                fValorTaxa := uFuncoes.Arredondar(uFuncoes.Gerapercentual(M_TOVEND, Dm.CdsConfigCFG_TAXA_SERVICO.AsFloat),2);
                M_TOVEND := M_TOVEND + fValorTaxa;
                txtTOVEND.Caption  := FormatFloat('###,##0.00', M_TOVEND);
                //txtTOVEND.Caption  := FormatFloat('###,##0.00', M_TOVEND + uFuncoes.Arredondar(uFuncoes.Gerapercentual(M_TOVEND, Dm.CdsConfigCFG_TAXA_SERVICO.AsFloat),2))
            End
            Else
            begin
                 M_TOVEND := M_TOVEND + fValorTaxa;
                 txtTOVEND.Caption  := FormatFloat('###,##0.00', M_TOVEND);
            End;
         End
        else
            txtTOVEND.Caption  := FormatFloat('###,##0.00', M_TOVEND);
    //
     With dmConsultas.qryUsuarios do
     begin
          SQL.Clear;
          Close;
          SQL.Add('Select SEN_CODIGO, SEN_NOME, SEN_SNATUA, SEN_FLCAIXA, SEN_FLSUPER, USU_ADMIN from USUARIOS');
          SQL.Add('Where (SEN_CODIGO = :pCODIGO)');
          Params.ParamByName('pCODIGO').AsInteger := M_CDCAIX;
          //
          Open;
     End;
     //
     If not (dmConsultas.qryUsuarios.IsEmpty) Then
     begin
          If (dmConsultas.qryUsuarios.FieldByName('SEN_FLSUPER').AsString = 'N')
             OR uFuncoes.Empty(dmConsultas.qryUsuarios.FieldByName('SEN_FLSUPER').AsString) Then
          Begin
               with TfrmSupervisor.create(self) do
                try
                  showmodal;
                finally
                  free;
                  //
                  If (M_FLSUPE = False) Then
                  Begin
                     GridModa.SelectedIndex := 1;
                  End;
                end;
          End
          Else
          Begin
              M_FLSUPE := True;
              edtDESVAL.SetFocus;
          End;     
     End;
end;

procedure TfrmFormaPagamento.edtDESPEREnter(Sender: TObject);
begin
     If (Dm.CdsConfigCFG_FLVENDEDOR_ITEM_VENDA.AsString = 'S') Then
         M_TOVEND := dmDados.cdsPreVendaPRV_VALOR.AsFloat + edtAcrescimo.Value
     Else
         M_TOVEND := uFrmVendas.M_TOVEND + edtAcrescimo.Value;
     //
     edtDESVAL.Value := 0;
     edtDESPER.Value := 0;
     If (Dm.CdsConfigCFG_FLVENDEDOR_ITEM_VENDA.AsString = 'N') Then
         txtTOVEND.Caption  := FormatFloat('###,##0.00', M_TOVEND)
     Else
     Begin
          if (aFLTAXA = 'S') Then
              txtTOVEND.Caption  := FormatFloat('###,##0.00', M_TOVEND + uFuncoes.Arredondar(uFuncoes.Gerapercentual(M_TOVEND, Dm.CdsConfigCFG_TAXA_SERVICO.AsFloat),2))
          Else
              txtTOVEND.Caption  := FormatFloat('###,##0.00', M_TOVEND);
     End;
         //Dm.CdsConfigCFG_TAXA_SERVICO.AsFloat);
     //
     With dmConsultas.qryUsuarios do
     begin
          SQL.Clear;
          Close;
          SQL.Add('Select SEN_CODIGO, SEN_NOME, SEN_SNATUA, SEN_FLCAIXA, SEN_FLSUPER, USU_ADMIN from USUARIOS');
          SQL.Add('Where (SEN_CODIGO = :pCODIGO)');
          Params.ParamByName('pCODIGO').AsInteger := M_CDCAIX;
          //
          Open;
     End;
     //
     If not (dmConsultas.qryUsuarios.IsEmpty) Then
     begin
          If (dmConsultas.qryUsuarios.FieldByName('SEN_FLSUPER').AsString = 'N')
             OR uFuncoes.Empty(dmConsultas.qryUsuarios.FieldByName('SEN_FLSUPER').AsString) Then
          Begin
               with TfrmSupervisor.create(self) do
                try
                  showmodal;
                finally
                  free;
                  //
                  If (M_FLSUPE = False) Then
                    GridModa.SetFocus;
                end;
          End
          Else
          begin
              M_FLSUPE := True;
              edtDESPER.SetFocus;
          End;     
     End;
end;

procedure TfrmFormaPagamento.CALCULAR;
Var
    M_VLVEND : Real;
begin
   M_VLVEND := 0;
   //
   If (M_FLSUPE = True) Then
   Begin
     If (Dm.CdsConfigCFG_FLVENDEDOR_ITEM_VENDA.AsString = 'N') Then
     begin
         M_VLLIMP := uFrmVendas.M_TOVEND;
         M_VLVEND := M_TOVEND;
     End
     Else
     begin
         if (aFLTAXA = 'S') Then
          begin
            if (fValorTaxa = 0) Then
                //M_VLLIMP := dmDados.cdsPreVendaPRV_VALOR.AsFloat +  Dm.CdsConfigCFG_TAXA_SERVICO.AsFloat
                M_VLLIMP := dmDados.cdsPreVendaPRV_VALOR.AsFloat + uFuncoes.Arredondar(uFuncoes.Gerapercentual(dmDados.cdsPreVendaPRV_VALOR.AsFloat, Dm.CdsConfigCFG_TAXA_SERVICO.AsFloat),2)
            Else
                M_VLLIMP := dmDados.cdsPreVendaPRV_VALOR.AsFloat + fValorTaxa;
          End
         ELSE
              M_VLLIMP := dmDados.cdsPreVendaPRV_VALOR.AsFloat;
         //
         M_VLVEND := M_VLLIMP;
     End;
     //
     If (edtDESVAL.Value > 0) Then
     Begin
          {M_VLPERC := (edtDESVAL.Value*100)/M_TOVEND;
          M_TOVEND := (M_TOVEND - edtDESVAL.Value);}
          M_VLPERC := (edtDESVAL.Value*100)/M_VLLIMP;
          M_VLLIMP := (M_VLLIMP - edtDESVAL.Value);
          //
          //txtTOVEND.Caption := FormatFloat('###,###,##0.00', M_TOVEND);
          edtDESPER.Value   := M_VLPERC;
          M_VLREAL := edtDESVAL.Value;
     End
     Else
     Begin
          //M_TOVEND := (M_TOVEND - uFuncoes.Gerapercentual(M_TOVEND, edtDESPER.Value));
          M_VLLIMP := (M_VLLIMP - uFuncoes.Gerapercentual(M_VLLIMP, edtDESPER.Value));
          //edtDESVAL.Value   := M_VLVEND - M_TOVEND;
          edtDESVAL.Value   := M_VLVEND - M_VLLIMP;
          //
          M_VLREAL := edtDESVAL.Value;
          M_VLPERC := edtDESPER.Value;
     End;
     //
     M_TOVEND := M_VLLIMP;
     //
     Acrescimo;
     txtTOVEND.Caption := FormatFloat('###,###,##0.00', M_TOVEND);
   End;
end;

procedure TfrmFormaPagamento.edtDESVALExit(Sender: TObject);
begin
      If (edtDESVAL.Value > M_TOVEND) Then
      begin
           Application.MessageBox(PChar('Valor de desconto maior que o valor da venda!!!'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDESVAL.Value := 0;
           If (edtDESVAL.CanFocus) Then
               edtDESVAL.SetFocus;
           Exit;
      End;
      //
      CALCULAR;
      GridModa.SetFocus;
end;

procedure TfrmFormaPagamento.edtDESPERExit(Sender: TObject);
begin
      If (edtDESPER.Value >= 100) Then
      begin
           Application.MessageBox(PChar('Percentual de desconto maior que o valor da venda!!!'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtDESPER.Value := 0;
           If (edtDESPER.CanFocus) Then
               edtDESPER.SetFocus;
           Exit;
      End;
      //
      CALCULAR;
      GridModa.SetFocus;
end;

procedure TfrmFormaPagamento.NotaFiscal(Local: string);
Var
  Impressora:TextFile;
  Data, W_CDITEN, W_NMDESC, W_MNMODA, W_FLCANC : String;
  W_UNITEN, M_CAMINHO, M_NMFILE : String;
  W_VLMODA, W_VLUNIT, W_VLSUBT : Real;
  W_QTITEN : Double;
  M_NRITEM : Integer;
begin
     M_CAMINH := uFuncoes.PASTA_CUPOM(StrtoInt(UFrmAdmin.M_CDUSUA));
     //
     If (fileexists(M_CAMINH+'\impressora.txt')) then
        M_CAMINH := uFuncoes.percorreArquivoTexto(M_CAMINH+'\impressora.txt')
     Else
     begin
        M_NMFILE := 'CUPOM.TXT';
        //
        If (M_CAMINH = 'C:\') Then
           M_CAMINH := M_CAMINH + M_NMFILE
        Else
           M_CAMINH := M_CAMINH+'\'+M_NMFILE;
     End;

{  M_CAMINH := uFuncoes.PASTA_CUPOM(StrtoInt(UFrmAdmin.M_CDUSUA));
  //
  If (M_CAMINH = 'C:\') Then
      M_CAMINH := M_CAMINH + 'CUPOM.TXT'
  Else
      M_CAMINH := M_CAMINH+'\CUPOM.TXT';}
  //
  dm.CdsEmpresas.Close;
  With dm.SdsEmpresas do
  Begin
       Active := False;
       CommandText := 'SELECT * FROM EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
       Params.ParamByName('pCODIGO').AsInteger := M_CDLOJA;
       Active := true;
  End;
  dm.CdsEmpresas.Open;
  //
  Data:= Copy(DatetoStr(Date),1,3)+Copy(DatetoStr(Date),4,3)+Copy(DatetoStr(Date),7,4);
  {Relaciona a vari�vel impressora com a}
   AssignFile(IMPRESSORA, M_CAMINH);
  {abre a porta da impress�o }
  Rewrite(IMPRESSORA);
  {envia caractere de controle para comprimir a impress�o}
  Write(IMPRESSORA,#15);
  Writeln(impressora);
  { Imprime e alinhado � esquerda dentro de uma �rea de 52 caracteres}
  Writeln (Impressora,Format('%-48s', [Replicate('*',48 )]));
  { Imprime a string "Cupom ", alinhado � esquerda"-" dentro de uma �rea de trita caracteres}
  Writeln(Impressora,Format('%-48s',[uFuncoes.PadC('INFOG2 - CUPOM DE VENDA',48)]));
  { Imprime e alinhado � esquerda dentro de uma �rea de 52 caracteres}
  Writeln (Impressora,Format('%-48s', [Replicate('*',48 )]));
  { Imprime o nome da Loja}
  Writeln(Impressora,Format('%-48s',[uFuncoes.PadC('LOJA: '+dm.CdsEmpresas.FieldByName('EMP_FANTASIA').AsString,48)]));
  Writeln(Impressora,Format('%-48s',[uFuncoes.PadC(dm.CdsEmpresas.FieldByName('EMP_ENDERECO').AsString,48)]));
  { Imprime e alinhado � esquerda dentro de uma �rea de 52 caracteres}
  Writeln (Impressora,Format('%-30s', [Replicate('*',48 )]));
  Writeln (Impressora,Format('%-30s', ['N'+CHR(167)+'. DA VENDA....: '+W_NRVEND]));
  Writeln (Impressora,Format('%-48s', ['CLIENTE.........: '+ M_NMCLIE]));
  Writeln (Impressora,Format('%-30s', ['VENDEDOR........: '+M_NMVEND]));
  Writeln (Impressora,Format('%-30s', ['CAIXA...........: '+uFuncoes.StrZero(InttoStr(M_CDCAIX),3)+ ' - '+UFrmAdmin.M_NMUSUA]));
  { Imprime a Data de Emiss�o, baseada na data atual e salta para pr�xima linha}
  Writeln (Impressora,Format('%-30s', ['DATA/HORA.......: '+Data+uFuncoes.Replicate(' ',10) +TimetoStr(Time)]));
  Writeln (Impressora,Format('%-30s', [Replicate('*',48 )]));
  Writeln (Impressora,Format('%-30s', ['ITEM CODIGO        DESCRICAO']));
  Writeln (Impressora,Format('%-30s', ['QUANT.    UNIDADE    VALOR UNITARIO   SUB-TOTAL']));
  Writeln (Impressora,Format('%-30s', [Replicate('-',48 )]));
  //
  {----- Fase de Emiss�o dos Itens da Nota -----}
  { Move o ponteiro para o primeiro registro}
  dm.cdsItensVendas.First;
  M_NRITEM := 1;
  While not (dm.cdsItensVendas.Eof) do
  Begin
      {carrega os dados}
       W_CDITEN := dm.cdsItensVendas.FieldByName('ITE_CDITEN').AsString;
       W_NMDESC := Copy(dm.cdsItensVendas.FieldByName('ITE_NMDESC').AsString,1,27);
       W_QTITEN := dm.cdsItensVendas.FieldByName('ITE_QTITEN').AsCurrency;
       W_UNITEN := dm.cdsItensVendas.FieldByName('ITE_CDUNID').AsString;
       W_VLUNIT := dm.cdsItensVendas.FieldByName('ITE_VLUNIT').AsCurrency;
       W_VLSUBT := dm.cdsItensVendas.FieldByName('ITE_VLSUBT').AsCurrency;
       W_FLCANC := dm.cdsItensVendas.FieldByName('ITE_FLCANC').AsString;
       //
       Write   (Impressora, Format('%-46s',  [uFuncoes.StrZero(InttoStr(M_NRITEM),3)+ '  ' + W_CDITEN + ' '+W_NMDESC]));
       Writeln (Impressora, Format('%2s',    [W_FLCANC]));
       Write   (Impressora, Format('%-12.3f', [W_QTITEN]));
       Write   (Impressora, Format('%-11s', [W_UNITEN]));
       Write   (Impressora, Format('%12s',  [FormatFloat('###,###,##0.#0',W_VLUNIT)]));
       Writeln (Impressora, Format('%12s',  [FormatFloat('###,###,##0.#0',W_VLSUBT)]));
       //
       M_NRITEM := M_NRITEM + 1;
       dm.cdsItensVendas.Next;
  End;
  //
  Writeln (Impressora,Format('%-48s', [Replicate('-',48)]));
  Writeln (Impressora,Format('%-30s', ['TOTAL........:   '])+ Format('%17s', [pnlTOMERC.caption]));
  Writeln (Impressora,Format('%-48s', [Replicate('-',48)]));
  If (edtDESVAL.Value > 0) Then
      Writeln(Impressora,Format('%-20s',['DESCONTO.......:    '])+Format('%15s',[FormatFloat('###,##0.#0',edtDESVAL.Value)]));
  { Imprime Total a Pagar }
  Writeln(Impressora,Format('%-20s',['TOTAL A PAGAR..:    '])+Format('%15s',[txtTOVEND.caption]));
  { Salta tr�s linhas}
  Writeln(Impressora);
  {Imprime Modalidades}
  cdsModalidade.First;
  While not (cdsModalidade.Eof) do
  Begin
       If (cdsModalidade.FieldByName('MOD_VALOR').AsCurrency > 0) Then
       Begin
         W_MNMODA := cdsModalidade.FieldByName('MOD_NOME').AsString;
         W_VLMODA := cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
         //
         Write(Impressora,Format('%-20s',[ W_MNMODA + ' : ']));
         Writeln(Impressora,Format('%15s',[FormatFloat('###,###,##0.#0',W_VLMODA)]));
       End;
       // Proximo
       cdsModalidade.Next;
  End;
  { Imprime troco}
  Writeln(Impressora);
  Writeln(Impressora,Format('%-20s',['TROCO..........:    '])+Format('%15s',[FormatFloat('###,##0.00',StrtoFloat(AllTrim(FloattoStr(M_VLTROC))))]));
  { Salta tr�s linhas }
  Writeln(Impressora);
  Writeln(Impressora);
  Writeln(Impressora);
  Writeln(Impressora, Format('%-48s', [uFuncoes.Replicate(' ',2)+uFuncoes.Replicate('-',44)]));
  If uFuncoes.Empty(edtNMCLIE.Text) Then
      Writeln(Impressora, Format('%-48s', [uFuncoes.PadC('ASSINATURA DO CLIENTE',48)]))
  Else
      Writeln(Impressora, Format('%-48s', [uFuncoes.PadC(edtNMCLIE.Text,48)]));
  { Salta Tr�s linhas }
  Writeln(Impressora);
  Writeln(Impressora);
  Writeln(Impressora);
  { Imprime separador}
  Writeln (Impressora,Format('%-48s', [Replicate('*',48 )]));
  Writeln (Impressora,Format('%-48s', [uFuncoes.PadC('OBRIGADO POR SUA PREFERENCIA',48)]));
  Writeln (Impressora,Format('%-48s', [Replicate('*',48 )]));
  Writeln (Impressora,Format('%-48s', ['DESENVOLVIDO POR:INFOG2 TECNOLOGIA-(86)3226-4510']));
  { Salta uma linhas }
  Writeln(Impressora);
  { Fecha a porta de impress�o}
  System.Close(Impressora);
  // Abri o bloco de notas
  //Winexec(Pchar('NotePad.exe '+M_CAMINH),SW_SHOWNORMAL);
end;

procedure TfrmFormaPagamento.edtDESVALKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #27) Then
     Begin
          Key := #0;
          Close;
     End;
     //
     If (Key = #13) Then
     Begin
          Key := #0;
          GridModa.SetFocus;
     End;
end;

procedure TfrmFormaPagamento.edtDESPERKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #27) Then
     Begin
          Key := #0;
          Close;
     End;
     //
     If (Key = #13) Then
     Begin
          Key := #0;
          GridModa.SetFocus;
     End;
end;

procedure TfrmFormaPagamento.BUSCA_CLIENTE;
begin
     With dmConsultas.qryLocCliente do
     Begin
          Close;
          Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDCLIE.Text);
          Open;
     End;
     //
     If (dmConsultas.qryLocCliente.IsEmpty) Then
     Begin
           Application.MessageBox(PChar('C�digo de cliente n�o cadastrado!!!'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtNMCLIE.Enabled := True;
           edtNMCLIE.SetFocus;
     End
     Else
     Begin
          edtNMCLIE.Enabled := False;
          edtNMCLIE.text := dmConsultas.qryLocCliente.FieldByName('CLI_FANTASIA').AsString;
          //
          GridModa.SetFocus;
     End;
     //
     edtCDCLIE.Text := uFuncoes.StrZero(edtCDCLIE.Text,7); 
end;

procedure TfrmFormaPagamento.edtCDCLIEKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
     //
     If (Key = #13) and uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Key := #0;
          spLocClienteClick(Sender);
     End;
     //
     If (Key = #13) and not uFuncoes.Empty(edtCDCLIE.Text) Then
     Begin
          Key := #0;
          edtDESVAL.SetFocus;
     End;
end;

procedure TfrmFormaPagamento.edtCDCLIEExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDCLIE.Text) Then
         BUSCA_CLIENTE;
end;

procedure TfrmFormaPagamento.edtCDCLIEChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDCLIE.Text) Then
         edtNMCLIE.Clear;
end;

procedure TfrmFormaPagamento.spLocClienteClick(Sender: TObject);
begin
  with TfrmLocCliente.create(self) do
  try
    uLocCliente.M_NRFROM := 3;
    showmodal;
  finally
    free;
    edtDESVAL.SetFocus;
  end;
end;

procedure TfrmFormaPagamento.edtNMCLIEEnter(Sender: TObject);
begin
     edtNMCLIE.Clear; 
end;

procedure TfrmFormaPagamento.edtNMCLIEKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and not uFuncoes.Empty(edtNMCLIE.Text) Then
     Begin
          Key := #0;
          edtDESVAL.SetFocus;
     End;
end;

procedure TfrmFormaPagamento.FormCreate(Sender: TObject);
begin
     M_FLSUPE := False;
     aFLTAXA  := 'N';
end;

procedure TfrmFormaPagamento.edtDESVALChange(Sender: TObject);
begin
     If (M_FLSUPE = False) Then
        edtDESVAL.ReadOnly := True
     Else
        edtDESVAL.ReadOnly := False;
end;

procedure TfrmFormaPagamento.edtDESPERChange(Sender: TObject);
begin
     If (M_FLSUPE = False) Then
        edtDESPER.ReadOnly := True
     Else
        edtDESPER.ReadOnly := False;
end;

procedure TfrmFormaPagamento.CRIAR_PARCELAS;
Var
    M_QTPARC : integer;
    M_TOMODA, M_VLPARC, M_VLDIFE, W_ULTIPC : Real;
begin
     If (dm2.cdsParcelas.Active = False) Then
         dm2.cdsParcelas.Open;
     //
     M_TOMODA := cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
     M_VLPARC := uFuncoes.Arredondar(M_TOMODA/W_TOTAPC,2);
     //
     M_VLDIFE := M_TOMODA-(M_VLPARC * W_TOTAPC);
     //
     If (M_VLDIFE < M_TOMODA) Then
       W_ULTIPC := M_VLPARC+M_VLDIFE;
     //
     dm2.cdsParcelas.EmptyDataSet;
     //
     dm2.cdsParcelas.DisableControls;
     For M_QTPARC := 1 to W_TOTAPC do
     Begin
          // Incluir
          dm2.cdsParcelas.Append;
          dm2.cdsParcelas.FieldByName('PAR_NRPARCELA').AsInteger   := M_QTPARC;
          dm2.cdsParcelas.FieldByName('PAR_VENCIMENTO').AsDateTime := IncMonth(Date,M_QTPARC);
          dm2.cdsParcelas.FieldByName('PAR_VALOR').AsCurrency      := M_VLPARC;
          If (M_QTPARC <> W_TOTAPC) Then
              dm2.cdsParcelas.FieldByName('PAR_VALOR').AsCurrency      := M_VLPARC
          Else
              dm2.cdsParcelas.FieldByName('PAR_VALOR').AsCurrency      := W_ULTIPC;
           //
          dm2.cdsParcelas.Post;
     End;
     //
     dm2.cdsParcelas.First;
     dm2.cdsParcelas.EnableControls;
end;

procedure TfrmFormaPagamento.NotaFiscal2;
Var
  Data, W_CDITEN, W_NMDESC, W_MNMODA, W_FLCANC : String;
  W_QTITEN, W_UNITEN : String;
  W_VLMODA, W_VLUNIT, W_VLSUBT : Real;
begin
  //
  dm.CdsEmpresas.Close;
  With dm.SdsEmpresas do
  Begin
       Active := False;
       CommandText := 'SELECT * FROM EMPRESAS Where (EMP_CODIGO = :pCODIGO)';
       Params.ParamByName('pCODIGO').AsInteger := M_CDLOJA;
       Active := true;
  End;
  dm.CdsEmpresas.Open;
  //
      With ppRepItensVenda do
      Begin
           txtVENDA.Caption    := W_NRVEND;
           txtCLIENTE.Caption  := M_NMCLIE;
           txtVENDEDOR.Caption := M_NMVEND;
           txtCAIXA.Caption    := uFuncoes.StrZero(InttoStr(M_CDCAIX),3);
           txtTOTAL.Caption    := Format('%15s',[FormatFloat('###,##0.#0',StrtoFloat(pnlTOMERC.caption))]);
           //
           If (edtDESVAL.Value > 0) Then
           Begin
             txtPagamento.Lines.Add(Format('%-20s',['DESCONTO:']));
             txtPagamento2.Lines.Add(Format('%15s',[FormatFloat('###,##0.#0',edtDESVAL.Value)]));
           End;
           //
           txtPagamento.Lines.Add(Format('%-20s',['TOTAL A PAGAR:']));
           txtPagamento2.Lines.Add(Format('%15s',[FormatFloat('###,##0.#0',StrtoFloat(txtTOVEND.caption))]));
           txtPagamento.Lines.Add(' ');
           txtPagamento2.Lines.Add('');
           // Imprime Modalidades
           cdsModalidade.First;
           While not (cdsModalidade.Eof) do
           Begin
               If (cdsModalidade.FieldByName('MOD_VALOR').AsCurrency > 0) Then
               Begin
                     W_MNMODA := cdsModalidade.FieldByName('MOD_NOME').AsString;
                     W_VLMODA := cdsModalidade.FieldByName('MOD_VALOR').AsCurrency;
                     //
                     txtPagamento.Lines.Add(Format('%-20s', [ W_MNMODA + ':']));
                     txtPagamento2.Lines.Add(Format('%-15s',[FormatFloat('###,###,##0.#0',W_VLMODA)]));
               End;
               // Proximo
               cdsModalidade.Next;
            End;
            // Imprime troco
            If (M_VLTROC > 0) Then
            Begin
                txtPagamento.Lines.Add(' ');
                txtPagamento2.Lines.Add(' ');
                txtPagamento.Lines.Add(Format('%-20s',  ['TROCO:']));               //)+Format('%15s',[FormatFloat('###,##0.00',StrtoFloat(AllTrim(FloattoStr(M_VLTROC))))
                txtPagamento2.Lines.Add(Format('%-15s', [FormatFloat('###,##0.00', M_VLTROC)]));
            End;
           //
           PrintReport;
      End;
end;

procedure TfrmFormaPagamento.btnClienteClick(Sender: TObject);
Var
   W_CDCLIE : String;
begin
  W_CDCLIE := '';
  with TFrmClientes.create(self) do
  try
    showmodal;
  finally
    If not Empty(Dm.CdsClientesCLI_CODIGO.AsString) Then
      W_CDCLIE := Dm.CdsClientesCLI_CODIGO.AsString;
    //
    free;
    //
    edtCDCLIE.SetFocus;
    If not Empty(W_CDCLIE) Then
      begin
           edtCDCLIE.Text := W_CDCLIE;
           GridModa.SetFocus;
      End;
  end;
end;

procedure TfrmFormaPagamento.edtAcrescimoExit(Sender: TObject);
begin
      If (edtAcrescimo.Value > M_TOVEND) Then
      begin
           Application.MessageBox(PChar('Valor de acr�scimo maior que o valor da venda!!!'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           edtAcrescimo.Value := 0;
           If (edtAcrescimo.CanFocus) Then
               edtAcrescimo.SetFocus;
           Exit;
      End;
      //
      CALCULAR;
      GridModa.SetFocus;
end;

procedure TfrmFormaPagamento.edtAcrescimoEnter(Sender: TObject);
begin
    { edtAcrescimo.Value := 0;
     edtDESVAL.Value    := 0;
     edtDESPER.Value    := 0;}
end;

procedure TfrmFormaPagamento.Acrescimo;
begin
     If (edtAcrescimo.Value > 0) Then
        M_TOVEND := M_VLLIMP + edtAcrescimo.Value;
end;

end.
