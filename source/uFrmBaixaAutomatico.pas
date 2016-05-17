unit uFrmBaixaAutomatico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, gbCobranca;

type
  TfrmBaixaAutomatico = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnBaixar: TBitBtn;
    btFechar: TBitBtn;
    edtArquivo: TLabeledEdit;
    bntAbrir: TBitBtn;
    OpenDialog1: TOpenDialog;
    gbCobranca1: TgbCobranca;
    procedure btFecharClick(Sender: TObject);
    procedure btnBaixarClick(Sender: TObject);
    procedure bntAbrirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaixaAutomatico: TfrmBaixaAutomatico;

implementation

uses Udm, udmConsulta, udmDados, uFuncoes, uFrmAdmin;

{$R *.dfm}

procedure TfrmBaixaAutomatico.btFecharClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmBaixaAutomatico.btnBaixarClick(Sender: TObject);
{Objetivo: Ler arquivo recebido do banco e dar baixa nos t�tulos automaticamente}
var
   ANossoNumero : string;
   ACedenteCodigo, i : integer;
   aDescNat : String;
begin
   If Empty(edtArquivo.Text) Then
    begin
         btnBaixar.Enabled := False;
         edtArquivo.SetFocus;
         raise Exception.Create('Abra o arquivo de retorno do banco.')
    End;
    //
   TRY
      //
      aDescNat := 'RECEBIMENTO DE BOLETOS';
      //
      with gbCobranca1 do
      begin
         //

         LerRetorno;

         Dm.Start;
         //
         Dm.Incluir_Natureza(aDescNat,'2');
         //
         dm.FilterCDS(dmDados.cdsCedente, fsInteger , Dm.CdsConfigCFG_CEDENTE_ATUAL.AsString);  //dmDados.cdsCedenteCEDENTE_CODIGO.AsString
         //
         {Dar baixa nos t�tulos automaticamente}
         for i := 0 to (Titulos.Count - 1) do
         begin
            with Titulos[i] do
            begin
               {Se n�o localizar o cedente, gera erro}
               {if not dmConsultas.Validar_Cedente(Cedente.ContaBancaria.Banco.Codigo, Cedente.ContaBancaria.CodigoAgencia, Trim(Copy(Cedente.CodigoCedente,5,12))) then
                  Raise Exception.Create('Cedente n�o localizado - Banco: ' + Cedente.ContaBancaria.Banco.Codigo + ' / Ag�ncia: ' + Cedente.ContaBancaria.CodigoAgencia + ' / C�digo do cedente: ' + Cedente.CodigoCedente );}
                  //Raise Exception.Create('Cedente n�o localizado - Banco: ' + Cedente.ContaBancaria.Banco.Codigo + ' / Ag�ncia: ' + Cedente.ContaBancaria.CodigoAgencia + ' / C�digo do cedente: ' + Cedente.CodigoCedente + ' / Carteira: ' + Carteira);

               //
               //ACedenteCodigo := dmDados.cdsCedenteCEDENTE_CODIGO.AsInteger;

               //               //ANossoNumero := Formatar(NossoNumero, cdsContasReceberREC_CREDITO.Size,false,'0');
               ANossoNumero := Copy(NossoNumero,3,8);
               //ShowMessage(ANossoNumero);

               If (dmDados.cdsCedenteTIPO_BOLETO.AsInteger = 1) Then
               begin
                   //if not cdsContasReceber.Locate('REC_CREDITO',VarArrayOf([Copy(ANossoNumero,3,8)]),[]) then
                   if not dmConsultas.GetTitulo(StrtoInt(ANossoNumero)) then
                      Raise Exception.Create('O t�tulo com Nosso N�mero = ' + ANossoNumero + ' n�o foi localizado no banco de dados');
                   //
                   Dm.Baixar_Titulo(dmConsultas.qryConsulta.FieldByName('REC_CREDITO').AsInteger,
                                DataOcorrencia, DataCredito, ValorDespesaCobranca,
                                ValorAbatimento, ValorDesconto, ValorMoraJuros, StrtoInt(uFrmAdmin.M_CDUSUA));
               End;
            end; {with Titulos[i]}
            // Salvar
         end; {for I := 0 to (Count - 1)}

         dm.Comit(Dm.Transc);
         //
         MessageDlg('O arquivo retorno ' + NomeArquivo + ' foi processado com sucesso',mtInformation,[mbOk],0);

      end; {with Retorno}
         //
         Close;
   EXCEPT
          on Exc:Exception do
           begin
               Dm.Rollback;
               //
               Application.MessageBox(PChar('Erro ao tentar baixar titulos.'
                       + Exc.Message),
                       'ATEN��O', MB_OK+MB_ICONERROR+MB_APPLMODAL);
           End;
   END;
end;

procedure TfrmBaixaAutomatico.bntAbrirClick(Sender: TObject);
begin
    btnBaixar.Enabled := False;
    OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName) + '\Retorno';
     if OpenDialog1.Execute then
     begin
          gbCobranca1.NomeArquivo := OpenDialog1.FileName;
          edtArquivo.Text := OpenDialog1.FileName;
          btnBaixar.Enabled := True;
     End
     else
     begin
         edtArquivo.Text := '';
         Exit;
     End;    
end;

procedure TfrmBaixaAutomatico.FormShow(Sender: TObject);
begin
     btnBaixar.Enabled := False;
end;

end.
