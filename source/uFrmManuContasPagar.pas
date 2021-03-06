unit uFrmManuContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids, ExtCtrls,
  ToolEdit, DB, DBXpress, FMTBcd, DBClient, Provider, SqlExpr;

type
  TfrmManuContasPagar = class(TForm)
    pnlSuperior: TPanel;
    pnlGrid: TPanel;
    grdConsultar: TDBGrid;
    Panel2: TPanel;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    BtEditar: TBitBtn;
    BtExcluir: TBitBtn;
    GroupBox1: TGroupBox;
    cmbSituacao: TComboBox;
    Label6: TLabel;
    edtDTINICIAL: TDateEdit;
    Label1: TLabel;
    edtDTFINAL: TDateEdit;
    Label2: TLabel;
    edtNRCOMPRA: TEdit;
    Label3: TLabel;
    spLocFornecedor: TSpeedButton;
    edtCDFORN: TEdit;
    btFiltar: TBitBtn;
    pnlEdicao: TPanel;
    dsContasPagar: TDataSource;
    dstContasPagar: TSQLDataSet;
    dstContasPagarPAG_SEQUENCIA: TIntegerField;
    dstContasPagarPAG_LOJA: TIntegerField;
    dstContasPagarPAG_NRENTRADA: TIntegerField;
    dstContasPagarPAG_PARCELA: TStringField;
    dstContasPagarPAG_QTPARCELAS: TIntegerField;
    dstContasPagarPAG_DATACOMPRA: TDateField;
    dstContasPagarPAG_DATAVENCIMENTO: TDateField;
    dstContasPagarPAG_FORNECEDOR: TIntegerField;
    dstContasPagarPAG_NRNOTA: TStringField;
    dstContasPagarPAG_SERIENOTA: TStringField;
    dstContasPagarPAG_NATUREZADESPESA: TIntegerField;
    dstContasPagarPAG_DESCONTOANTECIPADO: TFMTBCDField;
    dstContasPagarPAG_DESCRICAO: TMemoField;
    dstContasPagarPAG_VALORPARCELA: TFMTBCDField;
    dstContasPagarPAG_SITUACAO: TStringField;
    dstContasPagarPAG_DATAPAGAMENTO: TDateField;
    dstContasPagarPAG_VALORPAGO: TFMTBCDField;
    dstContasPagarPAG_VALORDESCONTO: TFMTBCDField;
    dstContasPagarPAG_VALORJUROS: TFMTBCDField;
    dstContasPagarPAG_MODALIDADE: TIntegerField;
    dstContasPagarPAG_BANCO: TStringField;
    dstContasPagarPAG_NRCONTA: TStringField;
    dstContasPagarPAG_NRCHEQUE: TStringField;
    dstContasPagarPAG_USUARIO: TIntegerField;
    dstContasPagarPAG_AGENCIA: TStringField;
    dspContasPagar: TDataSetProvider;
    cdsContasPagar: TClientDataSet;
    cdsContasPagarPAG_SEQUENCIA: TIntegerField;
    cdsContasPagarPAG_LOJA: TIntegerField;
    cdsContasPagarPAG_NRENTRADA: TIntegerField;
    cdsContasPagarPAG_PARCELA: TStringField;
    cdsContasPagarPAG_QTPARCELAS: TIntegerField;
    cdsContasPagarPAG_DATACOMPRA: TDateField;
    cdsContasPagarPAG_DATAVENCIMENTO: TDateField;
    cdsContasPagarPAG_FORNECEDOR: TIntegerField;
    cdsContasPagarPAG_NRNOTA: TStringField;
    cdsContasPagarPAG_SERIENOTA: TStringField;
    cdsContasPagarPAG_NATUREZADESPESA: TIntegerField;
    cdsContasPagarPAG_DESCONTOANTECIPADO: TFMTBCDField;
    cdsContasPagarPAG_DESCRICAO: TMemoField;
    cdsContasPagarPAG_VALORPARCELA: TFMTBCDField;
    cdsContasPagarPAG_SITUACAO: TStringField;
    cdsContasPagarPAG_DATAPAGAMENTO: TDateField;
    cdsContasPagarPAG_VALORPAGO: TFMTBCDField;
    cdsContasPagarPAG_VALORDESCONTO: TFMTBCDField;
    cdsContasPagarPAG_VALORJUROS: TFMTBCDField;
    cdsContasPagarPAG_MODALIDADE: TIntegerField;
    cdsContasPagarPAG_BANCO: TStringField;
    cdsContasPagarPAG_NRCONTA: TStringField;
    cdsContasPagarPAG_NRCHEQUE: TStringField;
    cdsContasPagarPAG_USUARIO: TIntegerField;
    cdsContasPagarPAG_AGENCIA: TStringField;
    cdsContasPagarPAG_ATRASO: TFloatField;
    cdsContasPagarPAG_NMSITUACAO: TStringField;
    cdsContasPagarPAG_NOMELOJA: TStringField;
    cdsContasPagarPAG_NMFORNECEDOR: TStringField;
    cdsContasPagarPAG_NMMODA: TStringField;
    btBaixa: TBitBtn;
    rgPeriodos: TRadioGroup;
    Label4: TLabel;
    Label5: TLabel;
    lbl_TOTABERTAS: TLabel;
    lbl_PAGAS: TLabel;
    lbl_NMFORN: TEdit;
    procedure spLocFornecedorClick(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure cmbSituacaoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtDTINICIALExit(Sender: TObject);
    procedure edtDTFINALExit(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure edtNRCOMPRAExit(Sender: TObject);
    procedure edtCDFORNExit(Sender: TObject);
    procedure edtCDFORNChange(Sender: TObject);
    procedure edtNRCOMPRAChange(Sender: TObject);
    procedure edtDTINICIALChange(Sender: TObject);
    procedure edtDTFINALChange(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure edtCDFORNKeyPress(Sender: TObject; var Key: Char);
    procedure edtNRCOMPRAKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTINICIALKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTFINALKeyPress(Sender: TObject; var Key: Char);
    procedure btFiltarClick(Sender: TObject);
    procedure cmbSituacaoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbSituacaoExit(Sender: TObject);
    procedure dsContasPagarDataChange(Sender: TObject; Field: TField);
    procedure dspContasPagarGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure cdsContasPagarCalcFields(DataSet: TDataSet);
    procedure btBaixaClick(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    novo, alterar, apagar : String;  
    procedure BUSCA_CONTA;
    procedure tratabotoes;
    procedure MOSTRA_DADOS;
    procedure CONTROLES(TIPO : String);
    procedure LIMPAR;
    procedure BOTAO_FILTRA;
    procedure TOTAIS;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManuContasPagar: TfrmManuContasPagar;
  TD : TTransactionDesc;
  M_CDFORN, M_CDNATU, M_FLGRAV, M_CXGERA : String;

implementation

Uses uFrmLocFornec, uFuncoes, uDm2, uBuscarNatureza, UFrmAdmin, Udm,
  udmConsulta, uFrmEditContaPagar, uFrmBaixaContPagar;

{$R *.dfm}

procedure TfrmManuContasPagar.BUSCA_CONTA;
Var
    M_FLSITU, M_INTSQL, M_CAMPO : String;
begin
     If (cmbSituacao.Text = 'ABERTAS') Then
        M_FLSITU := 'A';
     If (cmbSituacao.Text = 'PAGAS') Then
        M_FLSITU := 'P';
     If (cmbSituacao.Text = 'TODAS') or
       uFuncoes.Empty(cmbSituacao.Text) Then
        M_FLSITU := 'T';
     //
     If (rgPeriodos.ItemIndex = 0) Then
        M_CAMPO := 'PAG_DATACOMPRA';
     If (rgPeriodos.ItemIndex = 1) Then
        M_CAMPO := 'PAG_DATAVENCIMENTO';
     If (rgPeriodos.ItemIndex = 2) Then
        M_CAMPO := 'PAG_DATAPAGAMENTO';
     //
     DM2.cdsContasPagar.DisableControls;
     DM2.cdsContasPagar.Close;
     With DM2.dstContasPagar do
     Begin
          Active := False;
          If (M_FLSITU = 'T') Then
              M_INTSQL := 'Select * from CONTASPAGAR Where ((PAG_SITUACAO = :pSITUACAO) or (PAG_SITUACAO = :pSITUACAO2)) '
          Else
              M_INTSQL := 'Select * from CONTASPAGAR Where (PAG_SITUACAO = :pSITUACAO) ';
          //
          If (edtDTINICIAL.Text <> '  /  /    ') and  (edtDTFINAL.Text = '  /  /    ')
           and (M_FLSITU = 'P') Then
               M_INTSQL := M_INTSQL + ' AND ('+ M_CAMPO +'>= :pDTINICIAL) ';
          //
          If (edtDTINICIAL.Text <> '  /  /    ') and  (edtDTFINAL.Text = '  /  /    ')
           and ((M_FLSITU = 'A') OR (M_FLSITU = 'T')) Then
               M_INTSQL := M_INTSQL + ' AND ('+ M_CAMPO +' >= :pDTINICIAL) ';
          //
          If (edtDTINICIAL.Text = '  /  /    ') and  (edtDTFINAL.Text <> '  /  /    ')
           and (M_FLSITU = 'P') Then
               M_INTSQL := M_INTSQL + ' AND ('+ M_CAMPO +' >= :pDTFINAL) ';
          //
          If (edtDTINICIAL.Text = '  /  /    ') and  (edtDTFINAL.Text <> '  /  /    ')
           and ((M_FLSITU = 'A') OR (M_FLSITU = 'T')) Then
               M_INTSQL := M_INTSQL + ' AND ('+ M_CAMPO +' >= :pDTFINAL) ';
          //
          If (edtDTINICIAL.Text <> '  /  /    ') and  (edtDTFINAL.Text <> '  /  /    ')
           and ((M_FLSITU = 'A') or (M_FLSITU = 'T')) Then
               M_INTSQL := M_INTSQL + ' AND ('+ M_CAMPO +' >= :pDTINICIAL) AND ('+ M_CAMPO +'<= :pDTFINAL) ';
          //
          If (edtDTINICIAL.Text <> '  /  /    ') and  (edtDTFINAL.Text <> '  /  /    ')
           and (M_FLSITU = 'P') Then
               M_INTSQL := M_INTSQL + ' AND ('+ M_CAMPO +' >= :pDTINICIAL) AND ('+ M_CAMPO +' <= :pDTFINAL) ';
          //
          If not ufuncoes.Empty(edtCDFORN.Text) Then
              M_INTSQL := M_INTSQL + ' AND (PAG_FORNECEDOR = :pFORNECEDOR) ';
          //
          If not uFuncoes.Empty(edtNRCOMPRA.Text) Then
              M_INTSQL := M_INTSQL + ' AND (PAG_NRENTRADA = :pNRCOMPRA) ';
          //
          CommandText := M_INTSQL + ' order by PAG_NRENTRADA';
          //
          If (M_FLSITU = 'T') Then
          Begin
              Params.ParamByName('pSITUACAO').AsString     := 'A';
              Params.ParamByName('pSITUACAO2').AsString    := 'P';
          End
          Else
              Params.ParamByName('pSITUACAO').AsString     := M_FLSITU;
          // Data inicial
          If (edtDTINICIAL.Text <> '  /  /    ') Then
              Params.ParamByName('pDTINICIAL').AsDate      := edtDTINICIAL.Date;
          // Data Final
          If (edtDTFINAL.Text <> '  /  /    ') Then
              Params.ParamByName('pDTFINAL').AsDate        := edtDTFINAL.Date;
          // Fornecedor
          If not ufuncoes.Empty(edtCDFORN.Text) Then
              Params.ParamByName('pFORNECEDOR').AsInteger  := StrtoInt(edtCDFORN.Text);
          // Compra
          If not uFuncoes.Empty(edtNRCOMPRA.Text) Then
              Params.ParamByName('pNRCOMPRA').AsInteger    := StrtoInt(edtNRCOMPRA.Text);
          //
          Active := True;
     End;
     //
     DM2.cdsContasPagar.FetchParams;
     DM2.cdsContasPagar.Open;
     DM2.cdsContasPagar.EnableControls;
     //
     If (DM2.cdsContasPagar.IsEmpty) then
     Begin
          Application.MessageBox(PChar('Registro de conta a pagar n�o encontrada...'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
          DM2.cdsContasPagar.Close;
          cmbSituacao.SetFocus;
          Exit;
     End
     Else
     Begin
          If (M_FLSITU = 'A') Then
              grdConsultar.Columns[4].Visible := False
          Else
              grdConsultar.Columns[4].Visible := True;
     End;
     //
     TOTAIS;
end;

procedure TfrmManuContasPagar.spLocFornecedorClick(Sender: TObject);
begin
  with TfrmBuscaFornec.create(self) do
  try
     uFrmLocFornec.M_NRFROM := 5;
     showmodal;
  finally
    edtCDFORN.Text := uFuncoes.StrZero(M_CDFORN,5);
    If not uFuncoes.Empty(edtCDFORN.Text) Then
       cmbSituacao.SetFocus
    Else
       edtCDFORN.SetFocus;
    free;
  end;
end;

procedure TfrmManuContasPagar.tratabotoes;
begin
   BtEditar.Enabled   := not BtEditar.Enabled;
   BtExcluir.Enabled  := not BtExcluir.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled   := not BtGravar.Enabled;
   BtSair.Enabled     := not BtSair.Enabled;
end;

procedure TfrmManuContasPagar.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmManuContasPagar.cmbSituacaoChange(Sender: TObject);
begin
     If uFuncoes.Empty(cmbSituacao.text) Then
     Begin
         dm2.cdsContasPagar.Close;
     End;
     //
     BOTAO_FILTRA;
end;

procedure TfrmManuContasPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dm2.cdsContasPagar.Close;
     //
     Action := caFree;
end;

procedure TfrmManuContasPagar.FormShow(Sender: TObject);
begin
    {edtDTINICIAL.Date := Date();
    edtDTFINAL.Date   := Date();}
    //
    dm2.cdsContasPagar.Close; 
    lbl_NMFORN.Clear;
    //
    btFiltar.Enabled := False;
    M_FLGRAV := 'N';
    CONTROLES('D');
end;

procedure TfrmManuContasPagar.edtDTINICIALExit(Sender: TObject);
begin
     If (edtDTINICIAL.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(edtDTINICIAL.Text);
              edtDTINICIAL.Text := DatetoStr(edtDTINICIAL.Date);
              //
           except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inv�lida!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDTINICIAL.Clear;
                     edtDTINICIAL.SetFocus;
                End;
           end;
     End;
     //
     BOTAO_FILTRA;     
end;

procedure TfrmManuContasPagar.edtDTFINALExit(Sender: TObject);
begin
     If (edtDTFINAL.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(edtDTFINAL.Text);
              edtDTFINAL.Text := DatetoStr(edtDTFINAL.Date);
              //
              If (edtDTFINAL.Date < edtDTINICIAL.Date) Then
              Begin
                   Application.MessageBox(PChar('Perido final deve ser maior ou igual ao inicial!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                   edtDTFINAL.Date := Date;
                   edtDTFINAL.SetFocus;
                   Exit;
              End;
          except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inv�lida!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     edtDTFINAL.Clear;
                     edtDTFINAL.SetFocus;
                End;
           end;
     End;
     //
     BOTAO_FILTRA;
end;

procedure TfrmManuContasPagar.BtEditarClick(Sender: TObject);
begin
   If (DM2.cdsContasPagar.Active = True) Then
   Begin
     If (DM2.cdsContasPagar.RecordCount > 0) Then
     begin
       DM2.cdsContasPagar.Edit;
       If (DM2.cdsContasPagar.FieldByName('PAG_SITUACAO').AsString = 'A') Then
       begin
          with TfrmEditaContPagar.create(self) do
              try
                 uFrmEditContaPagar.M_FLOPER := 'E';
                 Caption := 'Editar Conta a Pagar';                 
                 showmodal;
              finally
                 free;
                 BUSCA_CONTA;
              end;
       End;
     End;
   End;
end;

procedure TfrmManuContasPagar.edtNRCOMPRAExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtNRCOMPRA.Text) Then
        edtNRCOMPRA.Text := uFuncoes.StrZero(edtNRCOMPRA.Text,7);
     //
     BOTAO_FILTRA;   
end;

procedure TfrmManuContasPagar.edtCDFORNExit(Sender: TObject);
begin
     If not uFuncoes.Empty(edtCDFORN.Text) Then
     Begin
          With dmConsultas.qryFornec do
          Begin
               Close;
               Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtCDFORN.Text);
               Open;
          End;
          //
          If (dmConsultas.qryFornec.IsEmpty) Then
          Begin
              Application.MessageBox(PChar('Fornecedor n�o cadastrado!!!'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              lbl_NMFORN.Clear;
              edtCDFORN.Clear;
              edtCDFORN.SetFocus;
              Exit;
          End
          Else
          Begin
             //
             lbl_NMFORN.Text := dmConsultas.qryFornec.FieldByName('FOR_FANTASIA').AsString;
             edtCDFORN.Text := uFuncoes.StrZero(edtCDFORN.Text,5);
          End;
          //
     End;
     //
     BOTAO_FILTRA;
end;

procedure TfrmManuContasPagar.MOSTRA_DADOS;
begin
     //
{     edtDTCOMP.Text := dm2.cdsContasPagar.FieldByName('PAG_DATACOMPRA').AsString;
     If not uFuncoes.Empty(dm2.cdsContasPagar.FieldByName('PAG_NRNOTA').AsString) Then
         dbeNRNOTA.Text := uFuncoes.StrZero(dm2.cdsContasPagar.FieldByName('PAG_NRNOTA').AsString,10);
     If not uFuncoes.Empty(dm2.cdsContasPagar.FieldByName('PAG_SERIENOTA').AsString) Then
         dbeSERIE.Text  := uFuncoes.StrZero(dm2.cdsContasPagar.FieldByName('PAG_SERIENOTA').AsString,2);
     mmoDescricao.Text := dm2.cdsContasPagar.FieldByName('PAG_DESCRICAO').AsString;
     If not uFuncoes.Empty(dm2.cdsContasPagar.FieldByName('PAG_NATUREZADESPESA').AsString) Then
         edtCDNATU.Text := uFuncoes.StrZero(dm2.cdsContasPagar.FieldByName('PAG_NATUREZADESPESA').AsString,4);}
end;

procedure TfrmManuContasPagar.edtCDFORNChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtCDFORN.text) Then
     Begin
         dm2.cdsContasPagar.Close;
         lbl_NMFORN.Clear;
     End;
     //
     BOTAO_FILTRA;
end;

procedure TfrmManuContasPagar.edtNRCOMPRAChange(Sender: TObject);
begin
     If uFuncoes.Empty(edtNRCOMPRA.text) Then
        dm2.cdsContasPagar.Close;
     //
     BOTAO_FILTRA;        
end;

procedure TfrmManuContasPagar.edtDTINICIALChange(Sender: TObject);
begin
     If (edtDTINICIAL.Text = '  /  /    ') Then
         dm2.cdsContasPagar.Close;
end;

procedure TfrmManuContasPagar.edtDTFINALChange(Sender: TObject);
begin
     If (edtDTFINAL.Text <> '  /  /    ') Then
         dm2.cdsContasPagar.Close;
end;

procedure TfrmManuContasPagar.CONTROLES(TIPO : String);
begin
{     If (TIPO = 'D') Then
     Begin
         edtDTCOMP.Enabled    := False;
         dbeNRNOTA.Enabled    := False;
         dbeSERIE.Enabled     := False;
         mmoDescricao.Enabled := False;
         edtCDNATU.Enabled    := False;
         //
         M_FLGRAV := 'N';
     End;
     //
     If (TIPO = 'H') Then
     Begin
         edtDTCOMP.Enabled    := True;
         dbeNRNOTA.Enabled    := True;
         dbeSERIE.Enabled     := True;
         mmoDescricao.Enabled := True;
         edtCDNATU.Enabled    := True;
         //
         M_FLGRAV := 'S';
     End;}
end;

procedure TfrmManuContasPagar.BtCancelarClick(Sender: TObject);
begin
     tratabotoes;
     dm2.cdsContasPagar.Cancel;
     dm2.cdsContasPagar.Close;
     CONTROLES('D');
     //
     LIMPAR;
end;

procedure TfrmManuContasPagar.LIMPAR;
begin
{     edtDTINICIAL.Date := Date();
     edtDTFINAL.Date := Date();
     edtCDFORN.Clear;
     edtNRCOMPRA.Clear;
     edtDTCOMP.Clear;
     cmbSituacao.ItemIndex := -1;
     dbeNRNOTA.Clear;
     dbeSERIE.Clear;
     mmoDescricao.Clear;
     edtCDNATU.Clear;
     lbl_Natureza.Caption := '';
     lbl_NMFORN.Caption := '';}
     //
     edtDTINICIAL.SetFocus;
end;

procedure TfrmManuContasPagar.BtExcluirClick(Sender: TObject);
Var
   iUsuario : Integer;
   aCodigo : String;
begin
   If (dm2.cdsContasPagar.Active = True) Then
     if (dm2.cdsContasPagar.RecordCount > 0) then
     Begin
         If (dm2.cdsContasPagar.FieldByName('PAG_SITUACAO').AsString = 'P') Then
         Begin
              Application.MessageBox(PChar('Registro de conta j� pago!!!'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
              Exit;
         End;
         //
         iUsuario := StrtoInt(UFrmAdmin.M_CDUSUA);
         //
         If Application.MessageBox('Deseja excluir esta parcela?', 'Exclus�o de registro',
                      MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
         Begin
             aCodigo  := 'Seq : '+uFuncoes.StrZero(cdsContasPagarPAG_SEQUENCIA.AsString,7)+
                         ' Compra : '+uFuncoes.StrZero(cdsContasPagarPAG_NRENTRADA.AsString,7)+
                         ' Fornecedor : '+uFuncoes.StrZero(cdsContasPagarPAG_FORNECEDOR.AsString,5)+
                         ' Valor : '+ FormatFloat('###,##0.#0', cdsContasPagarPAG_VALORPARCELA.AsFloat);
             //
             dm2.cdsContasPagar.Delete;
             dm2.cdsContasPagar.ApplyUpdates(0);
             //
             If not (dm.IncluirTarefaUsuario(iUsuario,
                'Excluiu Conta Pagar : '+aCodigo+' *F*')) Then
                ShowMessage('Erro ao adicionar tarefa do usu�rio.');
         end
     End;
end;


procedure TfrmManuContasPagar.edtCDFORNKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
         key:=#0;
     If (key = #13) and not uFuncoes.Empty(edtCDFORN.Text) Then
     Begin
          Key := #0;
          cmbSituacao.SetFocus;
     End;
     //
     If (key = #13) and uFuncoes.Empty(edtCDFORN.Text) Then
     Begin
          Key := #0;
          spLocFornecedorClick(Sender);
     End;
end;

procedure TfrmManuContasPagar.edtNRCOMPRAKeyPress(Sender: TObject;
  var Key: Char);
begin
     If not( key in['0'..'9',#8, #13] ) then
         key:=#0;
     //
     If (key = #13) and not uFuncoes.Empty(edtNRCOMPRA.Text) Then
     Begin
          Key := #0;
          btFiltar.SetFocus;
     End;
end;

procedure TfrmManuContasPagar.edtDTINICIALKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and (edtDTINICIAL.Text <> '  /  /    ') Then
     begin
          key := #0;
          edtDTFINAL.SetFocus;
     End;
end;

procedure TfrmManuContasPagar.edtDTFINALKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and (edtDTFINAL.Text <> '  /  /    ') Then
     begin
          key := #0;
          edtCDFORN.SetFocus;
     End;
end;

procedure TfrmManuContasPagar.btFiltarClick(Sender: TObject);
begin
     BUSCA_CONTA;
end;

procedure TfrmManuContasPagar.cmbSituacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
     If (key = #13) and not uFuncoes.Empty(edtCDFORN.Text) Then
     Begin
          Key := #0;
          edtNRCOMPRA.SetFocus;
     End;
end;

procedure TfrmManuContasPagar.cmbSituacaoExit(Sender: TObject);
begin
     BOTAO_FILTRA;
end;

procedure TfrmManuContasPagar.BOTAO_FILTRA;
begin
     If uFuncoes.Empty(edtCDFORN.Text)
      and uFuncoes.Empty(cmbSituacao.Text)
      and uFuncoes.Empty(edtNRCOMPRA.Text)
      And (edtDTINICIAL.Text = '  /  /    ')
      and (edtDTFINAL.Text = '  /  /    ') Then
     begin
         btFiltar.Enabled := False;
         //
         BtEditar.Enabled  := False;
         BtExcluir.Enabled := False;
     End
     Else
         btFiltar.Enabled := True;
end;

procedure TfrmManuContasPagar.dsContasPagarDataChange(Sender: TObject;
  Field: TField);
begin
  If (dm2.cdsContasPagar.Active = True) Then
  Begin
     If (dm2.cdsContasPagar.FieldByName('PAG_SITUACAO').AsString = 'A') Then
     Begin
          BtEditar.Enabled  := True;
          BtExcluir.Enabled := True;
          btBaixa.Enabled   := True;
     End
     Else
     Begin
          BtEditar.Enabled  := False;
          BtExcluir.Enabled := False;
          btBaixa.Enabled   := False;
     End;
  End;
end;

procedure TfrmManuContasPagar.dspContasPagarGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'CONTASPAGAR';
end;

procedure TfrmManuContasPagar.cdsContasPagarCalcFields(DataSet: TDataSet);
Var
    M_QTDIAS : Double;
begin
     If (cdsContasPagar.FieldByName('PAG_SITUACAO').AsString = 'A') Then
     begin
         M_QTDIAS := Date() - cdsContasPagar.FieldByName('PAG_DATAVENCIMENTO').AsDateTime;
         cdsContasPagar.FieldByName('PAG_NMSITUACAO').AsString := 'ABERTA';
     End
     Else
     BEgin
         cdsContasPagar.FieldByName('PAG_NMSITUACAO').AsString := 'PAGA';
     End;
     //
     cdsContasPagar.FieldByName('PAG_ATRASO').AsFloat := M_QTDIAS;
     //
end;

procedure TfrmManuContasPagar.TOTAIS;
Var
    M_ABERTAS, M_PAGAS : Real;
begin
     If (DM2.cdsContasPagar.Active = true) Then
     Begin
          M_ABERTAS := 0;
          M_PAGAS   := 0;
          //
          DM2.cdsContasPagar.DisableControls;
          DM2.cdsContasPagar.First;
          //
          While not (DM2.cdsContasPagar.Eof) do
          Begin
               If (DM2.cdsContasPagar.FieldByName('PAG_SITUACAO').AsString = 'A') Then
                   M_ABERTAS := M_ABERTAS + DM2.cdsContasPagar.FieldByName('PAG_VALORPARCELA').AsCurrency;
               If (DM2.cdsContasPagar.FieldByName('PAG_SITUACAO').AsString = 'P') Then
                   M_PAGAS   :=  M_PAGAS + DM2.cdsContasPagar.FieldByName('PAG_VALORPAGO').AsCurrency;
               // PAG_VALORPARCELA    
               //
               DM2.cdsContasPagar.Next
          End;
          //
          DM2.cdsContasPagar.First;
          DM2.cdsContasPagar.EnableControls;
          //
          lbl_TOTABERTAS.Caption := FormatFloat('###,###,##0.#0',M_ABERTAS);
          lbl_PAGAS.Caption      := FormatFloat('###,###,##0.#0',M_PAGAS);
     End
     Else
     Begin
          lbl_TOTABERTAS.Caption := '0,00';
          lbl_PAGAS.Caption      := '0,00';
     End;
end;

procedure TfrmManuContasPagar.btBaixaClick(Sender: TObject);
begin
   If (DM2.cdsContasPagar.Active = True) Then
   Begin
     If (DM2.cdsContasPagar.RecordCount > 0) Then
     begin
       DM2.cdsContasPagar.Edit;
       If (DM2.cdsContasPagar.FieldByName('PAG_SITUACAO').AsString = 'A') Then
       begin
          with TfrmEditaContPagar.create(self) do
              try
                 DM2.cdsContasPagar.FieldByName('PAG_DATAPAGAMENTO').AsDateTime := Date();
                 uFrmEditContaPagar.M_FLOPER := 'B';
                 If (M_CXGERA = 'S') Then
                    uFrmEditContaPagar.M_FLCXGR := 'S'
                 Else
                    uFrmEditContaPagar.M_FLCXGR := 'N';
                 //   
                 Caption := 'Baixa de Contas a Pagar';
                 showmodal;
              finally
                 free;
                 BUSCA_CONTA;
              end;
       End;
     End;
   End;
end;

procedure TfrmManuContasPagar.grdConsultarDblClick(Sender: TObject);
begin
   If (DM2.cdsContasPagar.Active = True) Then
   Begin
     If (DM2.cdsContasPagar.RecordCount > 0) Then
     begin
          with TfrmEditaContPagar.create(self) do
              try
                 uFrmEditContaPagar.M_FLOPER := 'C';
                 Caption := 'Consulta de Contas a Pagar';
                 showmodal;
              finally
                 free;
                 BUSCA_CONTA;
              end;
     End;
   End;
end;

procedure TfrmManuContasPagar.FormCreate(Sender: TObject);
begin
   If not (UFrmAdmin.admin) Then
   begin
     novo    := UFrmAdmin.aNovo;
     alterar := UFrmAdmin.aAlterar;
     apagar  := UFrmAdmin.aApagar;
     //
     If Empty(novo) or Empty(alterar) or Empty(apagar) Then
     begin
           dm.Verificar_Direitoa_Acesso(
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Inclus�o'));
           //
           novo    := UFrmAdmin.aNovo;
           alterar := UFrmAdmin.aAlterar;
           apagar  := UFrmAdmin.aApagar;
           //
     End;
     //
     FrmAdmin.Limpar_Acessos;
     //
     //BtAdicionar.Visible := (novo = 'S');
     BtEditar.Visible    := (alterar = 'S');
     BtExcluir.Visible   := (apagar = 'S');
     //
   End;
end;

End.
