unit uFrmCadClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroAdm, FMTBcd, DBClient, Provider, DB, SqlExpr, Grids,
  DBGrids, Buttons, StdCtrls, ExtCtrls, ComCtrls, DBCtrls, Mask, ToolEdit,
  RXDBCtrl, ExtDlgs, Menus, JPEG;

type
  TfrmCadClientesNew = class(TfrmCadastro)
    dsCadastro: TDataSource;
    Panel5: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    PageControl2: TPageControl;
    tbPessoais: TTabSheet;
    tbEndereco: TTabSheet;
    tbConjugue: TTabSheet;
    rbTipoPessoa: TDBRadioGroup;
    lblCPFCNPJ: TLabel;
    dbeNRCNPJ: TDBEdit;
    lblRazao: TLabel;
    dbeRazao: TDBEdit;
    lblFantasia: TLabel;
    dbeNMCLIE: TDBEdit;
    imgCliente: TDBImage;
    btProcurar: TBitBtn;
    lblIdentedade: TLabel;
    DBEdit4: TDBEdit;
    lblEstCivil: TLabel;
    cmbEstCivil: TDBLookupComboBox;
    Label7: TLabel;
    dbeNRFONE: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    lblOragao: TLabel;
    dbeOrgao: TDBEdit;
    lblUfEmissor: TLabel;
    cmbUFEMISSOR: TDBComboBox;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    dbeCEP: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    cmbUFCliente: TDBComboBox;
    cmbCidade: TDBLookupComboBox;
    Label17: TLabel;
    cmbBairro: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    DBEdit13: TDBEdit;
    Label5: TLabel;
    DBEdit14: TDBEdit;
    Label19: TLabel;
    DBEdit15: TDBEdit;
    Label21: TLabel;
    cmbUFCobranca: TDBComboBox;
    Label26: TLabel;
    cmbCidadeCobranca: TDBLookupComboBox;
    Label27: TLabel;
    cmbBairroCobranca: TDBLookupComboBox;
    Label28: TLabel;
    DBDateEdit1: TDBDateEdit;
    dsConsClientes: TDataSource;
    cdsConsClientes: TClientDataSet;
    cdsConsClientesCLI_CODIGO: TIntegerField;
    cdsConsClientesCLI_FANTASIA: TStringField;
    cdsConsClientesCLI_RAZAO: TStringField;
    dspConsClientes: TDataSetProvider;
    dstConsClientes: TSQLDataSet;
    Label33: TLabel;
    dbeCPFConjugue: TDBEdit;
    Label34: TLabel;
    dbeNMConjugue: TDBEdit;
    cdsConsultarCLI_CODIGO: TIntegerField;
    cdsConsultarCLI_RAZAO: TStringField;
    cdsConsultarCLI_FANTASIA: TStringField;
    cdsConsultarCLI_FONE1: TStringField;
    Label44: TLabel;
    DBEdit2: TDBEdit;
    tbOutros: TTabSheet;
    OpenPictureDialog1: TOpenPictureDialog;
    cdsConsultarCLI_CGC: TStringField;
    Label57: TLabel;
    dbeDTNASC: TDBDateEdit;
    DBMemo1: TDBMemo;
    Label29: TLabel;
    Label51: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label52: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    PopupMenu1: TPopupMenu;
    pmnCidades: TMenuItem;
    pmnBairros: TMenuItem;
    N1: TMenuItem;
    Situao1: TMenuItem;
    ipodeCliente1: TMenuItem;
    DBNavigator1: TDBNavigator;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    rgDeficiencia: TDBRadioGroup;
    Label4: TLabel;
    dbeDescDeficiencia: TDBEdit;
    PnlImagem: TPanel;
    imgFoto: TImage;
    Label25: TLabel;
    dbeNRBOX: TDBEdit;
    Label6: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label20: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Atividade1: TMenuItem;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    btnSalvarPasta: TBitBtn;
    DBGrid1: TDBGrid;
    btnIncEletro: TBitBtn;
    btnExcEletro: TBitBtn;
    dsLista: TDataSource;
    Label11: TLabel;
    pmnEletroEletronicoSubItem: TMenuItem;
    btnCaptura: TBitBtn;
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbUFClienteExit(Sender: TObject);
    procedure cmbBairroEnter(Sender: TObject);
    procedure cmbUFCobrancaExit(Sender: TObject);
    procedure cmbBairroCobrancaEnter(Sender: TObject);
    procedure dbeRazaoExit(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure cmbEmpresaUFExit(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure BtPesquisarClick(Sender: TObject);
    procedure rgConsultarClick(Sender: TObject);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure btProcurarClick(Sender: TObject);
    procedure dbeNRCNPJExit(Sender: TObject);
    procedure dbeNRCNPJEnter(Sender: TObject);
    procedure DBEdit29KeyPress(Sender: TObject; var Key: Char);
    procedure dbeDiaFaturaKeyPress(Sender: TObject; var Key: Char);
    procedure dsCadastroDataChange(Sender: TObject; Field: TField);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure dbeDTNASCExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pmnCidadesClick(Sender: TObject);
    procedure pmnBairrosClick(Sender: TObject);
    procedure Situao1Click(Sender: TObject);
    procedure ipodeCliente1Click(Sender: TObject);
    procedure pmnRegiaoClick(Sender: TObject);
    procedure rbTipoPessoaChange(Sender: TObject);
    procedure dbeNRFONEExit(Sender: TObject);
    procedure dbeCPFConjugueExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure Atividade1Click(Sender: TObject);
    procedure rgDeficienciaClick(Sender: TObject);
    procedure cmbCidadeCobrancaEnter(Sender: TObject);
    procedure cmbCidadeEnter(Sender: TObject);
    procedure btnCapturaClick(Sender: TObject);
    procedure btnSalvarPastaClick(Sender: TObject);
    procedure btnIncEletroClick(Sender: TObject);
    procedure btnExcEletroClick(Sender: TObject);
    procedure pmnEletroEletronicoSubItemClick(Sender: TObject);
    procedure rbTipoPessoaClick(Sender: TObject);
  private
    { Private declarations }
    novo, alterar, apagar : String;
    procedure tratabotoes;
    procedure buscar(aCodigo : String);
    procedure AbrirCidadeBairro();
    Procedure FormataCampo();
    Procedure FormatTela(iTipoPessoa : Integer);
    procedure NavegarCliente(iCodigo : Integer);
    Procedure GetFotoCliente();
    Procedure CarregaFotoParaBanco(FileName: String);
    Procedure ObtemImagemDoBanco(var imgDestino: TImage);
    Procedure AtualizaBairroCobranca();
    procedure ConverterBmpParaJPeg(Arquivo: string);
  public
    { Public declarations }
  end;

var
  frmCadClientesNew: TfrmCadClientesNew;
  M_NMPAST : String;

implementation

uses Udm, UFrmAdmin, uFuncoes, udmDados, uDm2, uFrmCadCidades,
  uFrmCadBairro, uFrmCadSituacao, uFrmCadTipoClientes, uFrmCadRegiao,
  uFrmCadAtividade, CapturaCam, uFrmCadClienteEletro, uFrmCadEletros;

{$R *.dfm}

procedure TfrmCadClientesNew.BtAdicionarClick(Sender: TObject);
begin
  inherited;
     PageControl1.Pages[1].TabVisible := False;
     //
     dm.parametros;
     tratabotoes;
     With dm.CdsClientes do
     begin
          Append;
          imgFoto.Visible := False;
          FieldByName('CLI_CODIGO').Value        := dm.CdsConfigCFG_CLIENTE.Value+1;
          FieldByName('CLI_DATACAD').AsDateTime  := Date();
          FieldByName('CLI_TIPOPESSOA').AsString := 'F';
          FieldByName('CLI_FLPORTADOR_DEFICIENCIA').AsString := 'N';
          FormatTela(rbTipoPessoa.ItemIndex);
          //HABILITAR_CONTROLES;
          //
          dbeNRCNPJ.SetFocus;
     End;
end;

procedure TfrmCadClientesNew.BtEditarClick(Sender: TObject);
begin
  inherited;
   If not (dm.CdsClientes.IsEmpty)
    and  (dm.CdsClientes.RecordCount > 0) Then
    begin
        PageControl1.Pages[1].TabVisible := False;
        dm.CdsClientes.Edit;
        //
        if (PageControl2.ActivePageIndex = 0) Then
           dbeRazao.SetFocus;
        If (PageControl2.ActivePageIndex = 1) Then
           dbeCEP.SetFocus;
        if (PageControl2.ActivePageIndex = 2)
          and (dbeCPFConjugue.Enabled) Then
              dbeCPFConjugue.SetFocus;
        //
        //dbeRazao.SetFocus;
        tratabotoes;
    End;

end;

procedure TfrmCadClientesNew.BtCancelarClick(Sender: TObject);
begin
 // inherited;
   if (dsCadastro.State in [dsInsert, dsEdit]) Then
   begin
        tratabotoes;
        dm.CdsClientes.Cancel;
        PageControl1.Pages[1].TabVisible := True;
        FormatTela(rbTipoPessoa.ItemIndex);
        //HABILITAR_CONTROLES;
        //
        //Dm.Contatos_Cliente(dm.CdsClientesCLI_CODIGO.AsInteger);
         Dm.RefreshCDS(cdsConsClientes);
        //
        If (dm.CdsClientes.IsEmpty) Then
          close;
  End;
end;

procedure TfrmCadClientesNew.BtGravarClick(Sender: TObject);
Var
   M_HOMOVI : String;
begin
  inherited;
      If (rbTipoPessoa.ItemIndex < 0) Then
      Begin
           Application.MessageBox('Selecione o tipo de pessoa!!!','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           PageControl2.ActivePageIndex := 0;
           rbTipoPessoa.SetFocus;
           Exit;
      End;
      //
      If uFuncoes.Empty(dbeNMCLIE.Text) Then
      Begin
           Application.MessageBox('Digite o nome do cliente!!!','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           PageControl2.ActivePageIndex := 0;
           dbeNMCLIE.SetFocus;
           Exit;
      End;
   //
      If uFuncoes.Empty(dbeRazao.Text) Then
      Begin
           PageControl2.ActivePageIndex := 0;
           dbeRazao.SetFocus;
           Exit;
      End;
   //
   {   If uFuncoes.Empty(dbeEndereco.Text) Then
      Begin
           Application.MessageBox('Digite o endere�o do cliente!!!','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeEndereco.SetFocus;
           Exit;
      End;
   //
      If uFuncoes.Empty(cmbUFCliente.Text) Then
      Begin
           Application.MessageBox('Digite a UF do cliente!!!','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbUFCliente.SetFocus;
           Exit;
      End;
   //
      If uFuncoes.Empty(dbeNRCNPJ.Text) Then
      Begin
           if (cmbTPPESSOA.ItemIndex = 0) Then
              Application.MessageBox('Digite o CPF do cliente!!!','ATEN��O',  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL)
           Else
              Application.MessageBox('Digite o CNPJ do cliente!!!','ATEN��O',  MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           //
           dbeNRCNPJ.SetFocus;
           Exit;
      End;}
     //
     if (dsCadastro.State in [dsInsert, dsEdit]) Then
     begin
          tratabotoes;
          PageControl1.Pages[1].TabVisible := True;
          //
          M_HOMOVI := Copy(TimetoStr(Time),1,5);
          //
          if dsCadastro.State in [dsinsert] then
          begin
               dm.RefreshCDS(dm.cdsConfig);
               dm.CdsConfig.Edit;
               dm.CdsConfigCFG_CLIENTE.Value := dm.CdsConfigCFG_CLIENTE.Value+1;
               dm.CdsClientesCLI_CODIGO.Value := dm.CdsConfigCFG_CLIENTE.Value;
               // Usu�rio que incluiu
               Dm.CdsClientesCLI_USUARIO_INC.AsInteger := StrtoInt(UFrmAdmin.M_CDUSUA);
               Dm.CdsClientesCLI_DATA_INC.AsDateTime := Date();
               Dm.CdsClientesCLI_HORA_INC.AsString   := M_HOMOVI;
               //
               dm.CdsConfig.ApplyUpdates(0);
          end;
           //
           If (dsCadastro.State = dsEdit) Then
             begin
                // Usu�rio que alterou
                Dm.CdsClientesCLI_USUARIO_ALT.AsInteger := StrtoInt(UFrmAdmin.M_CDUSUA);
                Dm.CdsClientesCLI_DATA_ALT.AsDateTime := Date;
                Dm.CdsClientesCLI_HORA_ALT.AsString   := M_HOMOVI;
             End;
           //
           if (rgDeficiencia.ItemIndex = 1) Then
              dsCadastro.DataSet.FieldByName('CLI_DESCRICAO_DEFICIENCIA').AsString := '';
           //    Gravar
           dm.CdsClientes.Post;
           dm.CdsClientes.ApplyUpdates(0);
           //
           GetFotoCliente();
           //Dm.Contatos_Cliente(dm.CdsClientesCLI_CODIGO.AsInteger);
           //Tipo_Pessoa;
           Dm.RefreshCDS(cdsConsClientes);
           //
           Application.MessageBox('Registro gravado com sucesso.','Salvar',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           //
           PageControl2.ActivePageIndex := 0;
           //Dm.RefreshCDS(dmDados.cdsMatriz);
     End;
end;

procedure TfrmCadClientesNew.FormShow(Sender: TObject);
begin
  inherited;
    PageControl2.ActivePageIndex := 0;
    //
    if (FrmAdmin.mnuEletroEletronicoSubItem.Enabled) Then
         pmnEletroEletronicoSubItem.Enabled := FrmAdmin.mnuEletroEletronicoSubItem.Enabled;
     //dm.CdsCidades.Open;
     //dm.CdsBairros.Open;
     //dm.CdsSituacao.Open;
     //dm.CdsAtividades.Open;
     //
     dm.RefreshCDS(dm.cdsListaCidadesEndRes);
     dm.RefreshCDS(dm.cdsListaCidadeCob);
     Dm.RefreshCDS(Dm.cdsListaAtividades);
     Dm.RefreshCDS(DM.cdsListaSituacao);
     Dm.RefreshCDS(DM.cdsTpClientes);
     Dm.RefreshCDS(dm.cdsListaEstadoCivil);
     //
     dm.parametros;
     If (dm.CdsConfigCFG_CLIENTE.AsInteger = 0) Then
     begin
          dm.CdsClientes.close;
          With dm.CdsClientes do
          Begin
               Active := False;
               //CommandText := 'Select * from CLIENTES ';
               Params[0].AsInteger := 0;
               Active := True;
          End;
          BtAdicionarClick(Sender);
          {Dm.CdsClientes.FetchParams;
          dm.CdsClientes.Open}
     End
     Else
     Begin
         With dm.CdsClientes do
          begin
                Active := False;
                Params[0].AsInteger := uFuncoes.mvcodigo('CLI_CODIGO','CLIENTES');
                Active := True;
          End;
         {dm.CdsClientes.Close;
         dm.SdsClientes.ParamByName('PCODIGO').AsString := uFuncoes.mscodigo('CLI_CODIGO','CLIENTES');
         dm.CdsClientes.Open;}
     End;
     //
     AbrirCidadeBairro;
     AtualizaBairroCobranca;
     //
     {Tipo_Pessoa;
     HABILITAR_CONTROLES;}
     //rbtFluxoCliente.Visible := False;
     //
     PageControl1.ActivePageIndex := 0;
     //
     GetFotoCliente();
     FormatTela(rbTipoPessoa.ItemIndex);
     cdsConsClientes.Open;
     dmDados.AbrirEletroCliente(Dm.CdsClientesCLI_CODIGO.AsInteger);
     //cdsConsClientes.Open;
end;

procedure TfrmCadClientesNew.cmbUFClienteExit(Sender: TObject);
begin
  inherited;
    if (dm.CdsClientes.State in [dsInsert, dsEdit]) then
        If not uFuncoes.Empty(cmbUFCliente.Text) Then
            // Dm.AbrirCidadeUF(Dm.CdsClientesCLI_UFCLIENTE.AsString);
end;

procedure TfrmCadClientesNew.cmbBairroEnter(Sender: TObject);
begin
  inherited;
    if (dm.CdsClientes.State in [dsInsert, dsEdit]) then
       If not uFuncoes.Empty(cmbCidade.Text) Then
          begin
               Dm.AbrirBairroCidade(Dm.CdsClientesCLI_END_CIDADE.AsInteger, Dm.cdsListaBairroResid);
          End
          Else
          Begin
               Dm.cdsListaBairroResid.Close;
               cmbCidade.SetFocus;
          End;

end;

procedure TfrmCadClientesNew.cmbUFCobrancaExit(Sender: TObject);
begin
  inherited;
    if (dm.CdsClientes.State in [dsInsert, dsEdit]) then
        If not uFuncoes.Empty(cmbUFCobranca.Text) Then
           // Dm.AbrirCidadeUFNovo(Dm.cdsListaCidadeCobranca, Dm.CdsClientesCLI_END_COBRANCA_UF.AsString);
end;

procedure TfrmCadClientesNew.cmbBairroCobrancaEnter(Sender: TObject);
begin
  inherited;
    if (dm.CdsClientes.State in [dsInsert, dsEdit]) then
       If not uFuncoes.Empty(cmbCidadeCobranca.Text) Then
          begin
               Dm.AbrirBairroCidade(Dm.CdsClientesCID_CODIGO.AsInteger, Dm.cdsListaBairroCobranca);
          End
          Else
          Begin
               Dm.cdsListaBairroCobranca.Close;
               cmbCidadeCobranca.SetFocus;
          End;
        //    Dm.AbrirBairroCidadeNovo(Dm.cdsListaBairroCobranca,Dm.CdsClientesCLI_END_COBRANCA_CIDADE.AsInteger);
end;

procedure TfrmCadClientesNew.dbeRazaoExit(Sender: TObject);
begin
  inherited;
    If (dm.CdsClientes.State = dsInsert) and not uFuncoes.Empty(dbeRazao.Text) Then
      if (Dm.CdsConfigCFG_VERIFICA_RAZAO.AsString = 'S') Then
        if (uFuncoes.Verificar_Razao(dbeRazao.Text)) Then
        begin
             Application.MessageBox(PChar('Raz�o j� cadastrada.'),
                'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
             dbeRazao.Clear;
             dbeRazao.SetFocus;
             Exit;
        End;
end;

procedure TfrmCadClientesNew.buscar(aCodigo: String);
begin
      With dm.CdsClientes do
       begin
            Active := False;
            Params[0].AsInteger := StrtoInt(aCodigo);
            Active := True;
       End;
       //
       FormatTela(rbTipoPessoa.ItemIndex);
       //
       AbrirCidadeBairro;
       //
       dmDados.AbrirEletroCliente(Dm.CdsClientesCLI_CODIGO.AsInteger);
end;

procedure TfrmCadClientesNew.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
   //cmbTPPESSOA.Enabled := not cmbTPPESSOA.Enabled;
   btProcurar.Enabled  := not btProcurar.Enabled;
   imgCliente.Enabled  := not imgCliente.Enabled;
end;

procedure TfrmCadClientesNew.BtExcluirClick(Sender: TObject);
Var
   iCliente : Integer;
begin
  inherited;
   If not (dm.CdsClientes.IsEmpty)
    and  (dm.CdsClientes.RecordCount > 0) Then
   begin
      iCliente := dm.CdsClientesCLI_CODIGO.AsInteger;
      //
      if (Dm.GetVerificaContaReceberCliente(iCliente)) Then
       begin
            Application.MessageBox(PChar('Existe contas a receber para: '+
                 dm.CdsClientesCLI_RAZAO.asString) ,'ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            Exit;
       End;
      if application.MessageBox('Deseja excluir este cliente','Exclus�o de registro',
       MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = id_yes then
        begin
           dm.CdsClientes.Delete;
           dm.CdsClientes.ApplyUpdates(0);
           dm.CdsClientes.Close;
           //
           dm.CdsClientes.Close;
           dm.SdsClientes.ParamByName('PCODIGO').AsString := uFuncoes.mscodigo('CLI_CODIGO','CLIENTES');
           dm.CdsClientes.Open;
        end
        else
           showmessage('N�o ha registro a ser excluido');
   End;
end;

procedure TfrmCadClientesNew.cmbEmpresaUFExit(Sender: TObject);
begin
  inherited;
    if (dm.CdsClientes.State in [dsInsert, dsEdit]) then
        //If not uFuncoes.Empty(cmbEmpresaUF.Text) Then
         //    Dm.AbrirCidadeUFNovo(Dm.cdsListaEmpCidades, Dm.CdsClientesCLI_EMPRESA_UF.AsString);
end;

procedure TfrmCadClientesNew.edtConsultarChange(Sender: TObject);
begin
  inherited;
     btnConsultar.Enabled := (edtConsultar.Text <> '');
     If not uFuncoes.Empty(edtConsultar.Text) Then
     Begin
          with cdsConsultar do
          begin
               Close;
               CommandText := 'Select CLI_CODIGO, CLI_RAZAO, CLI_FANTASIA, CLI_CGC, CLI_FONE1 from CLIENTES';
               case rgConsultar.ItemIndex of
                 0: CommandText := CommandText + ' where CLI_CODIGO = ' + edtConsultar.Text;
                 1: CommandText := CommandText + ' where UPPER(CLI_FANTASIA) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
                 2: CommandText := CommandText + ' where UPPER(CLI_RAZAO) like ' + QuotedStr(AnsiUpperCase(edtConsultar.Text) + '%');
                 3: CommandText := CommandText + ' where CLI_CGC = ' + edtConsultar.Text;
               end;
               CommandText := CommandText + 'order by CLI_FANTASIA';
               Open;
          end;
     End;
     //
     If uFuncoes.Empty(edtConsultar.Text) Then
       cdsConsultar.Close;
end;

procedure TfrmCadClientesNew.btnConsultarClick(Sender: TObject);
begin
  inherited;
    //tratabotoes;
    If not (cdsConsultar.IsEmpty) Then
    begin
         buscar(cdsConsultarCLI_CODIGO.AsString);
        //cdsConsClientes.Locate('CLI_CODIGO',cdsConsultarCLI_CODIGO.AsInteger,[]);
        //HABILITAR_CONTROLES;
        PageControl1.ActivePageIndex := 0;
        PageControl2.ActivePageIndex := 0;
        GetFotoCliente();
        Dm.AbrirBairroCidade(Dm.CdsClientesCID_CODIGO.AsInteger, Dm.cdsListaBairroCobranca);
        Dm.AbrirBairroCidade(Dm.CdsClientesCLI_END_CIDADE.AsInteger, Dm.cdsListaBairroResid);
    End;
    //Panel1.Visible := True;
end;

procedure TfrmCadClientesNew.BtPesquisarClick(Sender: TObject);
begin
  inherited;
     PageControl1.ActivePageIndex := 1;  
end;

procedure TfrmCadClientesNew.AbrirCidadeBairro;
begin
     If not uFuncoes.Empty(Dm.CdsClientesCLI_UFCLIENTE.AsString) Then
         Dm.AbrirCidadeUF(Dm.CdsClientesCLI_UFCLIENTE.AsString);
     //
     If not uFuncoes.Empty(Dm.CdsClientesCID_CODIGO.AsString) Then
        //Dm.AbrirBairroCidade(Dm.CdsClientesCID_CODIGO.AsInteger);
     //
     {If not uFuncoes.Empty(dm.CdsClientesCLI_END_COBRANCA_UF.AsString) Then
      begin
           Dm.AbrirCidadeUFNovo(Dm.cdsListaCidadeCobranca, dm.CdsClientesCLI_END_COBRANCA_UF.AsString);
           if  not uFuncoes.Empty(dm.CdsClientesCLI_END_COBRANCA_CIDADE.AsString) Then
              Dm.AbrirBairroCidadeNovo(Dm.cdsListaBairroCobranca, dm.CdsClientesCLI_END_COBRANCA_CIDADE.AsInteger);
       End;}
     //
     {If not uFuncoes.Empty(dm.CdsClientesCLI_EMPRESA_UF.AsString) Then
      begin
           Dm.AbrirCidadeUFNovo(Dm.cdsListaEmpCidades, dm.CdsClientesCLI_EMPRESA_UF.AsString);
           if  not uFuncoes.Empty(dm.CdsClientesCLI_EMPRESA_CIDADE.AsString) Then
              Dm.AbrirBairroCidadeNovo(Dm.cdsListaEmpBairro, dm.CdsClientesCLI_EMPRESA_CIDADE.AsInteger);
       End;}
       //
       FormataCampo();
end;

procedure TfrmCadClientesNew.rgConsultarClick(Sender: TObject);
begin
//  inherited;
  case rgConsultar.ItemIndex of
    0:
    begin
      lblConsultar.Caption := 'C�digo';
      edtConsultar.Clear;
    end;
    1:
    begin
      lblConsultar.Caption := 'Fantasia/Apelido';
      edtConsultar.Clear;
    end;
    2:
    begin
      lblConsultar.Caption := 'Nome/Raz�o Social';
      edtConsultar.Clear;
    end;
    3:
    begin
      lblConsultar.Caption := 'CPF/CNPJ';
      edtConsultar.Clear;
    end;
  end;
  if edtConsultar.CanFocus then
    edtConsultar.SetFocus;
end;

procedure TfrmCadClientesNew.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
 // inherited;
   If (key = #37) Then
    key :=#0;
  //
  if (Key =#13) and not uFuncoes.Empty(edtConsultar.Text) then
  begin
    key :=#0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
  //
  if (rgConsultar.ItemIndex = 0) or (rgConsultar.ItemIndex = 3) then
  begin
    if not( key in['0'..'9', #8, #13] ) then
    begin
      key:=#0;
    end;
  end;

end;

procedure TfrmCadClientesNew.btProcurarClick(Sender: TObject);
begin
  inherited;
  If (dm.CdsClientes.State in [dsInsert, dsEdit]) Then
  Begin
     If OpenPictureDialog1.Execute Then
      begin
          CarregaFotoParaBanco(OpenPictureDialog1.FileName);
          //
          GetFotoCliente;
      End;
   End;   
  {If (dm.CdsClientes.State in [dsInsert, dsEdit]) Then
  Begin
     Try
          If (OpenPictureDialog1.Execute) Then
             imgCliente.Picture.LoadFromFile(OpenPictureDialog1.FileName);
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar abrir imagem!!!'+#13
                      + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
     End;
  End;}
end;

procedure TfrmCadClientesNew.dbeNRCNPJExit(Sender: TObject);
begin
  inherited;
    If (dm.CdsClientes.State in [dsInsert])
     and not uFuncoes.Empty(dbeNRCNPJ.Text) Then
          If (dm.CdsClientesCLI_TIPOPESSOA.AsString = 'F') Then
          Begin
            Try
              If not (uFuncoes.CPF(dbeNRCNPJ.Text)) Then
              Begin
                  MessageDlg('CPF inv�lido!!!', mtInformation, [mbOk], 0);
                  dbeNRCNPJ.Clear;
                  dbeNRCNPJ.SetFocus;
                  Exit;
              End;
            Except
              dbeNRCNPJ.SetFocus;
              dbeNRCNPJ.Clear;
            End;
          End
          Else
          Begin
            try
              If not (uFuncoes.CGC(dbeNRCNPJ.Text)) Then
              Begin
                  MessageDlg('CNPJ inv�lido!!!', mtInformation, [mbOk], 0);
                  dbeNRCNPJ.Clear;
                  dbeNRCNPJ.SetFocus;
                  Exit;
              End
              Else
              begin
                   If (dm.CdsClientes.State in [dsInsert]) and (uFuncoes.GetVerificaCNPJ(dbeNRCNPJ.Text)) Then
                    begin
                         MessageDlg('CNPJ j� cadastrado.', mtInformation, [mbOk], 0);
                         dbeNRCNPJ.SetFocus;
                         dbeNRCNPJ.Clear;
                         Exit;
                    End;
              End;
            Except
              dbeNRCNPJ.SetFocus;
              dbeNRCNPJ.Clear;
            End;
         End;
         //
     If (dm.CdsClientes.State in [dsEdit])
       and not uFuncoes.Empty(dbeNRCNPJ.Text) Then
          If (dm.CdsClientesCLI_TIPOPESSOA.AsString = 'F') Then
          Begin
            Try
              If not (uFuncoes.CPF(uFuncoes.Alltrim(dbeNRCNPJ.Text))) Then
              Begin
                  MessageDlg('CPF inv�lido!!!', mtInformation, [mbOk], 0);
                  //dbeNRCNPJ.Clear;
                  dbeNRCNPJ.SetFocus;
                  Exit;
              End;
            Except
              dbeNRCNPJ.SetFocus;
              dbeNRCNPJ.Clear;
            End;
          End
          Else
          Begin
            try
              If not (uFuncoes.CGC(uFuncoes.Alltrim(dbeNRCNPJ.Text))) Then
              Begin
                  MessageDlg('CNPJ inv�lido!!!', mtInformation, [mbOk], 0);
                  //dbeNRCNPJ.Clear;
                  dbeNRCNPJ.SetFocus;
                  Exit;
              End;
            Except
              dbeNRCNPJ.SetFocus;
              dbeNRCNPJ.Clear;
            End;
         End;
end;

procedure TfrmCadClientesNew.dbeNRCNPJEnter(Sender: TObject);
begin
  inherited;
     If (dm.CdsClientes.State in [dsInsert, dsedit] ) Then
     Begin
           //FormatTela(rbTipoPessoa.ItemIndex);
           FormataCampo();
     End;
end;

procedure TfrmCadClientesNew.DBEdit29KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TfrmCadClientesNew.dbeDiaFaturaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
     If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TfrmCadClientesNew.FormataCampo;
begin
     If (dm.CdsClientesCLI_TIPOPESSOA.AsString = 'F') Then
          dm.CdsClientesCLI_CGC.EditMask := '999.999.999-99;0'
     Else
          dm.CdsClientesCLI_CGC.EditMask := '99.999.999/9999-99;0';
end;

procedure TfrmCadClientesNew.dsCadastroDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
      imgFoto.Enabled := dsCadastro.DataSet.State in [dsInsert, dsEdit];
      dbeDescDeficiencia.Enabled := (dsCadastro.DataSet.State in [dsInsert, dsEdit])
        and (dsCadastro.DataSet.FieldByName('CLI_FLPORTADOR_DEFICIENCIA').AsString = 'S');
      //
      btnSalvarPasta.Enabled := dsCadastro.DataSet.State in [dsEdit];
      btnCaptura.Enabled := dsCadastro.DataSet.State in [dsInsert, dsEdit];
      DBNavigator1.Enabled := dsCadastro.DataSet.State in [dsBrowse];
      //
      dbeCPFConjugue.Enabled := (dsCadastro.DataSet.State in [dsInsert, dsEdit])
          and (dsCadastro.DataSet.FieldByName('CLI_TIPOPESSOA').AsString = 'F');
      dbeNMConjugue.Enabled  := (dsCadastro.DataSet.State in [dsInsert, dsEdit])
          and (dsCadastro.DataSet.FieldByName('CLI_TIPOPESSOA').AsString = 'F');
      //
      btnIncEletro.Enabled := (dsCadastro.DataSet.State in [dsEdit]);
      btnExcEletro.Enabled := (dsCadastro.DataSet.State in [dsEdit]);
      {if (dm.CdsClientesCLI_TIPOPESSOA.AsString = 'F') Then
           tbConjugue.Visible := true
      Else
           tbConjugue.Visible := False;}
end;

procedure TfrmCadClientesNew.DBEdit4KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
 If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TfrmCadClientesNew.dbeDTNASCExit(Sender: TObject);
begin
  inherited;
     If (dsCadastro.DataSet.State in [dsInsert, dsEdit])
       and (dbeDTNASC.Text <> '  /  /    ') Then
     Begin
          try
              StrToDate(dbeDTNASC.Text);
              dbeDTNASC.Text := DatetoStr(dbeDTNASC.Date);
              //
          except
                on EConvertError do
                Begin
                     Application.MessageBox(PChar('Data Inv�lida!!!'),
                         'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                     dbeDTNASC.Clear;
                     dbeDTNASC.SetFocus;
                End;
          end;
     End;
end;

procedure TfrmCadClientesNew.FormCreate(Sender: TObject);
Var
  Dir : String;
begin
  inherited;
   M_NMPAST := ExtractFilePath(Application.ExeName)+'FOTOS';
   Dir := M_NMPAST;
   //
   if not DirectoryExists(Dir) then
        ForceDirectories(Dir);
   //
   If not (UFrmAdmin.admin) Then
   begin
     //
     novo    := UFrmAdmin.aNovo;
     alterar := UFrmAdmin.aAlterar;
     apagar  := UFrmAdmin.aApagar;
     //
     If Empty(novo) or Empty(alterar) or Empty(apagar) Then
     begin
           dm.Verificar_Direitoa_Acesso(
            Strtoint(UFrmAdmin.M_CDUSUA), Dm.GetCodMenu('Clientes...'));
           //
           novo    := UFrmAdmin.aNovo;
           alterar := UFrmAdmin.aAlterar;
           apagar  := UFrmAdmin.aApagar;
           //
     End;
     //
     FrmAdmin.Limpar_Acessos;
     //
     BtAdicionar.Visible := (novo = 'S');
     BtEditar.Visible    := (alterar = 'S');
     BtExcluir.Visible   := (apagar = 'S');
  End;
end;

procedure TfrmCadClientesNew.pmnCidadesClick(Sender: TObject);
begin
  inherited;
     FrmAdmin.AbreForm(TfrmCadCidades, frmCadCidades);
     //
     dm.RefreshCDS(dm.CdsCidades);
end;

procedure TfrmCadClientesNew.pmnBairrosClick(Sender: TObject);
begin
  inherited;
     FrmAdmin.AbreForm(TfrmCadBairro, frmCadBairro);
     //
     dm.RefreshCDS(dm.cdsListaCidadesEndRes);
     dm.RefreshCDS(dm.cdsListaCidadeCob);
     //Dm.AbrirBairroCidade(Dm.CdsClientesCID_CODIGO.AsInteger);
end;

procedure TfrmCadClientesNew.Situao1Click(Sender: TObject);
begin
  inherited;
   FrmAdmin.AbreForm(TfrmCadSituacao, frmCadSituacao);
   dm.RefreshCDS(dm.cdsListaSituacao);
end;

procedure TfrmCadClientesNew.ipodeCliente1Click(Sender: TObject);
begin
  inherited;
     FrmAdmin.AbreForm(TfrmCadTipoCliente, frmCadTipoCliente);
     dm.RefreshCDS(dm.cdsTpClientes);
end;

procedure TfrmCadClientesNew.pmnRegiaoClick(Sender: TObject);
begin
  inherited;
    FrmAdmin.AbreForm(TfrmCadRegiao, frmCadRegiao);
    dm.RefreshCDS(DM2.cdsRegioes);
end;

procedure TfrmCadClientesNew.FormatTela(iTipoPessoa: Integer);
begin
     //if (iTipoPessoa = 0) Then  // fisica
     If (Dm.CdsClientesCLI_TIPOPESSOA.AsString = 'F') Then
     begin
          lblCPFCNPJ.Caption    := 'CPF';
          lblRazao.Caption      := 'Nome';
          lblFantasia.Caption   := 'Apelido';
          lblIdentedade.Caption := 'Identidade';
          //
          lblOragao.Visible     := True;
          dbeOrgao.Visible      := True;
          lblUfEmissor.Visible  := True;
          lblEstCivil.Visible   := True;
          cmbUFEMISSOR.Visible  := True;
          cmbEstCivil.Visible   := True;
          //
          //tbConjugue.TabVisible := True;
     End
     Else
     begin
          lblCPFCNPJ.Caption    := 'CNPJ';
          lblRazao.Caption      := 'Raz�o Social';
          lblFantasia.Caption   := 'Nome Fantasia';
          lblIdentedade.Caption := 'Inscri��o Estadual';
          //
          lblOragao.Visible     := false;
          dbeOrgao.Visible      := false;
          lblUfEmissor.Visible  := false;
          lblEstCivil.Visible   := false;
          cmbUFEMISSOR.Visible  := false;
          cmbEstCivil.Visible   := false;
          //
          //tbConjugue.TabVisible := false;
     End;
     //
     FormataCampo;
end;

procedure TfrmCadClientesNew.rbTipoPessoaChange(Sender: TObject);
begin
  inherited;
     if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
        // FormatTela(rbTipoPessoa.ItemIndex);
end;

procedure TfrmCadClientesNew.dbeNRFONEExit(Sender: TObject);
begin
  inherited;
     If (dsCadastro.DataSet.State in [dsInsert]) Then
        begin
             If not uFuncoes.Empty(dbeNRFONE.Text) Then
              begin
                  { If (Dm.ProcurarValor(dbeNRFONE.Text, 'CLI_FONE1', 'CLIENTES')) Then
                    begin
                         Application.MessageBox(PChar('N�mero de telefone j� cadastrado.'),
                            'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                         dbeNRFONE.Clear;
                         dbeNRFONE.SetFocus;
                         Exit;
                    End;}
              End;
        End;
end;

procedure TfrmCadClientesNew.dbeCPFConjugueExit(Sender: TObject);
begin
  inherited;
    If (dm.CdsClientes.State in [dsInsert, dsEdit])
     and not uFuncoes.Empty(dbeCPFConjugue.Text) Then
            Try
              If not (uFuncoes.CPF(dbeCPFConjugue.Text)) Then
              Begin
                  MessageDlg('CPF inv�lido!!!', mtInformation, [mbOk], 0);
                  dbeCPFConjugue.Clear;
                  dbeCPFConjugue.SetFocus;
                  Exit;
              End;
            Except
              dbeCPFConjugue.SetFocus;
              dbeCPFConjugue.Clear;
            End;
end;

procedure TfrmCadClientesNew.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
       if not (dm.CdsClientes.IsEmpty) Then
          dm.CdsClientes.Close;
end;

procedure TfrmCadClientesNew.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
       NavegarCliente(cdsConsClientesCLI_CODIGO.AsInteger);
end;

procedure TfrmCadClientesNew.NavegarCliente(iCodigo: Integer);
begin
          //
          With dm.CdsClientes do
          begin
                Active := False;
                Params[0].AsInteger := iCodigo;
                Active := True;
          End;
          //
          //HABILITAR_CONTROLES;
          PageControl1.ActivePageIndex := 0;
          Panel1.Visible := True;
          //
          //Tipo_Pessoa;
          //
          FormatTela(rbTipoPessoa.ItemIndex);
          GetFotoCliente;
          //
          Dm.AbrirBairroCidade(Dm.CdsClientesCID_CODIGO.AsInteger, Dm.cdsListaBairroCobranca);
          Dm.AbrirBairroCidade(Dm.CdsClientesCLI_END_CIDADE.AsInteger, Dm.cdsListaBairroResid);
          dmDados.AbrirEletroCliente(Dm.CdsClientesCLI_CODIGO.AsInteger);
          //Dm.Contatos_Cliente(dm.CdsClientesCLI_CODIGO.AsInteger);
end;

procedure TfrmCadClientesNew.GetFotoCliente;
begin
     If not (dm.CdsClientesCLI_FOTO.IsNull) Then
         ObtemImagemDoBanco(imgFoto)
     Else
         imgFoto.Visible := False;
end;

procedure TfrmCadClientesNew.CarregaFotoParaBanco(FileName: String);
Var
  stImagem: TFileStream;
begin
  stImagem := TFileStream.Create( FileName, fmOpenRead or fmShareDenyWrite );
  Try
     // ibdsCredenciadosFOTO � um campo BLOB SUB_TYPE 0
     dm.CdsClientesCLI_FOTO.LoadFromStream( stImagem );
     //
  Finally
     stImagem.Free;
  End;
end;

procedure TfrmCadClientesNew.ObtemImagemDoBanco(var imgDestino: TImage);
Var
  jpgImg: TJPEGImage;
  stMem: TMemoryStream;
begin
  If (dm.CdsClientesCLI_FOTO.IsNull) Then
  begin
       imgFoto.Visible := False;
       Exit;
  End;
  //
  jpgImg := TJPEGImage.Create;
  stMem := TMemoryStream.Create;
  Try
      dm.CdsClientesCLI_FOTO.SaveToStream( stMem );
      stMem.Position := 0;
      jpgImg.LoadFromStream( stMem );
      imgDestino.Picture.Assign( jpgImg );
      imgFoto.Visible := True;
  Finally
        stMem.Free;
        jpgImg.Free;
  End;
end;

procedure TfrmCadClientesNew.Atividade1Click(Sender: TObject);
begin
  inherited;
     FrmAdmin.AbreForm(TfrmCadAtividades, frmCadAtividades);
     dm.RefreshCDS(Dm.cdsListaAtividades);
end;

procedure TfrmCadClientesNew.rgDeficienciaClick(Sender: TObject);
begin
  inherited;
     If (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
       if (rgDeficiencia.ItemIndex = 0) Then
        begin
            dbeDescDeficiencia.Enabled := True;
            dbeDescDeficiencia.SetFocus;
        End
       Else
       begin
           dbeDescDeficiencia.Enabled := False;
           dsCadastro.DataSet.FieldByName('CLI_DESCRICAO_DEFICIENCIA').AsString := '';
       End;
end;

procedure TfrmCadClientesNew.cmbCidadeCobrancaEnter(Sender: TObject);
begin
  inherited;
     Dm.cdsListaBairroCobranca.Close;
end;

procedure TfrmCadClientesNew.cmbCidadeEnter(Sender: TObject);
begin
  inherited;
     Dm.cdsListaBairroResid.Close;
end;

procedure TfrmCadClientesNew.btnCapturaClick(Sender: TObject);
var
  DirNomeFoto: string;
  NomeFoto: string;
  procedure ConverteParaJpeg(ACaminhoFoto: string);
  var
    cjBmp: TBitmap;
    cjJpg: TJpegImage;
    strNomeSemExtensao: string;
    AFoto: TImage;
  begin
    AFoto:= TImage.Create(frmCadClientesNew);
    AFoto.Parent := frmCadClientesNew;
    AFoto.Visible := False;
    AFoto.Picture.Bitmap.LoadFromFile(ACaminhoFoto + '.bmp');

    cjJpg := TJPegImage.Create;
    cjBmp := TBitmap.Create;

    cjBmp.Assign(AFoto.Picture.Bitmap);
    cjJpg.Assign(cjBMP);

    cjJpg.SaveToFile(ACaminhoFoto + '.jpg');
    DeleteFile(ACaminhoFoto + '.bmp');
    cjJpg.Free;
    cjBmp.Free;
    AFoto.Free;
  end;
begin
  fCaptura := TfCaptura.Create(Self);
  try
    with fCaptura, camCamera, dm, CdsClientes do
    begin
      //
      DirNomeFoto := ExtractFilePath(Application.ExeName)+
        uFuncoes.LimpaString(FieldByName('CLI_CODIGO').AsString) + '.bmp';
        // M_NMPAST +'\'+

      NomeFoto := ExtractFilePath(DirNomeFoto) +
        Copy(ExtractFileName(DirNomeFoto),1, Length(ExtractFileName(DirNomeFoto))-4);


      FichierImage := ExtractFileName(DirNomeFoto);
      //ExtractFileName(DirNomeFoto);
      if fCaptura.ShowModal = mrOk then
      begin

        CaptureImageDisque;
        ConverteParaJpeg(NomeFoto);
        CarregaFotoParaBanco(NomeFoto + '.jpg');
        imgFoto.Picture.LoadFromFile(NomeFoto + '.jpg');
        if not (imgFoto.Visible) Then
            imgFoto.Visible := True;
        if FileExists(NomeFoto + '.jpg') Then
         begin
             CopyFile(PChar(NomeFoto + '.jpg'),
                      PChar(M_NMPAST ), true);
             DeleteFile(NomeFoto + '.jpg');
         End;
        //        FieldByName('CLI_FOTO').AsString := NomeFoto + '.jpg';
      end;
    end;
  finally
    FreeAndNil(fCaptura);
  end;
end;

procedure TfrmCadClientesNew.AtualizaBairroCobranca;
begin
    If not (Dm.CdsClientes.IsEmpty) Then
      If (Dm.CdsClientesCID_CODIGO.AsInteger > 0) Then
         Dm.AbrirBairroCidade(Dm.CdsClientesCID_CODIGO.AsInteger, Dm.cdsListaBairroCobranca);
end;

procedure TfrmCadClientesNew.btnSalvarPastaClick(Sender: TObject);
Var
    aPasta, aNomeArquivo, aNomeArquivo2 : String;
    JPEG: TJPEGImage;
begin
  inherited;
  if not (dsCadastro.DataSet.FieldByName('CLI_FOTO').IsNull) Then
  begin
    try
      aPasta := ExtractFilePath( Application.ExeName )+'fotos\';
      //
      if not DirectoryExists(aPasta) then
        ForceDirectories(aPasta);
      //
      aNomeArquivo := uFuncoes.StrZero(dsCadastro.DataSet.FieldByName('CLI_CODIGO').AsString,7)+'.JPG';
      //   aNomeArquivo2 := uFuncoes.StrZero(dsCadastro.DataSet.FieldByName('CLI_CODIGO').AsString,7)+'.BMP';
      //TBlobField( dsCadastro.DataSet.FieldByName( 'CLI_FOTO') ).SaveToFile( aPasta+aNomeArquivo );
      imgFoto.Picture.SaveToFile(aNomeArquivo);
      {if  FileExists(aNomeArquivo2) Then
         ConverterBmpParaJPeg(aNomeArquivo2);}
      imgFoto.Picture.SaveToFile(aPasta+aNomeArquivo);
      try
         JPEG := TJPEGIMAGE.Create;
         //JPeg.CompressionQuality := 65; { Qualidade: 100% }
         JPEG.Assign(imgFoto.Picture);
         JPEG.SaveToFile(aPasta+aNomeArquivo);
      Finally
         JPEG.Free;
      End;
      //
      If FileExists(aNomeArquivo) Then
         DeleteFile(aNomeArquivo);
      //
      Application.MessageBox(PChar('Arquivo '+aPasta+aNomeArquivo +' gerado com sucesso.'),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
    Except
       on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar salvar imagem!!!'+#13
                      + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
    End;
  End;
end;

procedure TfrmCadClientesNew.btnIncEletroClick(Sender: TObject);
begin
  inherited;
    if (dmDados.cdsClienteEletro.Active) Then
    begin
       Dm.RefreshCDS(dmDados.cdsListaEletros);
       //
       Application.CreateForm(TfrmCadClienteEletro, frmCadClienteEletro);
       try
           dmDados.cdsClienteEletro.Append;
           dmDados.cdsClienteEletroCLE_CLIENTE.AsInteger := dsCadastro.DataSet.FieldByName('CLI_CODIGO').AsInteger;
           frmCadClienteEletro.ShowModal;
       Finally
           frmCadClienteEletro.Free;
       End;
    End;   
end;

procedure TfrmCadClientesNew.btnExcEletroClick(Sender: TObject);
begin
  inherited;
   If not (dmDados.cdsClienteEletro.IsEmpty)
    and  (dmDados.cdsClienteEletro.RecordCount > 0) Then
   begin
      if application.MessageBox('Deseja excluir este registro','Exclus�o de registro',
       MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = id_yes then
        begin
           dmDados.cdsClienteEletro.Delete;
           dmDados.cdsClienteEletro.ApplyUpdates(0);
           //
           dmDados.AbrirEletroCliente(dsCadastro.DataSet.FieldByName('CLI_CODIGO').AsInteger);
        end;
   End;
end;

procedure TfrmCadClientesNew.pmnEletroEletronicoSubItemClick(
  Sender: TObject);
begin
  inherited;
       FrmAdmin.AbreForm(TfrmCadEletros, frmCadEletros);
end;

procedure TfrmCadClientesNew.ConverterBmpParaJPeg(Arquivo: string);
var
  Bmp: TBitmap;
  JPeg: TJPegImage;
  aPasta : String;
begin
  aPasta := ExtractFilePath( Application.ExeName )+'fotos\';
  //
  Bmp := TBitmap.Create;
  try
    Bmp.LoadFromFile(Arquivo);
    JPeg := TJPegImage.Create;
    try
      JPeg.CompressionQuality := 100; { Qualidade: 100% }
      JPeg.Assign(Bmp);
      JPeg.SaveToFile(aPasta + ChangeFileExt(Arquivo, '.jpg'));
    finally
      JPeg.Free;
    end;
  finally
    Bmp.Free;
  end;
end;

procedure TfrmCadClientesNew.rbTipoPessoaClick(Sender: TObject);
begin
  inherited;
   if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
    begin
    If (rbTipoPessoa.ItemIndex = 0) Then
     begin
          lblCPFCNPJ.Caption    := 'CPF';
          lblRazao.Caption      := 'Nome';
          lblFantasia.Caption   := 'Apelido';
          lblIdentedade.Caption := 'Identidade';
          //
          lblOragao.Visible     := True;
          dbeOrgao.Visible      := True;
          lblUfEmissor.Visible  := True;
          lblEstCivil.Visible   := True;
          cmbUFEMISSOR.Visible  := True;
          cmbEstCivil.Visible   := True;
          //
          //tbConjugue.TabVisible := True;
     End
     Else
     begin
          lblCPFCNPJ.Caption    := 'CNPJ';
          lblRazao.Caption      := 'Raz�o Social';
          lblFantasia.Caption   := 'Nome Fantasia';
          lblIdentedade.Caption := 'Inscri��o Estadual';
          //
          lblOragao.Visible     := false;
          dbeOrgao.Visible      := false;
          lblUfEmissor.Visible  := false;
          lblEstCivil.Visible   := false;
          cmbUFEMISSOR.Visible  := false;
          cmbEstCivil.Visible   := false;
          //
          //tbConjugue.TabVisible := false;
     End;
    End;
end;

end.
