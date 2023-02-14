using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace Vucem_EEA
{
    public partial class DatosPatente : System.Web.UI.Page
    {
      

        protected void Page_Load(object sender, EventArgs e)
        {
            


            if (!IsPostBack)
            {
                PanelDatosGenerales.Visible = true;
                PanelTransporte.Visible = false;
                PanelTasasPedimento.Visible = false;
                PanelIdentificadores.Visible = false;
                PanelTasas.Visible = false;
                PanelIdentificadoresPed.Visible = false;
                PanelCFDI.Visible = false;
                PanelContribPartida.Visible = false;
                PanelDestinatarios.Visible = false;
                PanelGuias.Visible = false;
                PanelCuentasAduaneras.Visible = false;
                PanelDescargos.Visible = false;
                PanelCuentasAduanerasPedimento.Visible = false;
                PanelObsPartida.Visible = false;
                PanelRectificacion.Visible = false;
                PanelFechas.Visible = false;
                PanelDetContribuciones.Visible = false;
                PanelDifContribuciones.Visible = false;
                PanelPartidas.Visible = false;
                PanelContenedores.Visible = false;
                PanelPermisos.Visible = false;
                PanelMercancias.Visible = false;
                PanelObservaciones.Visible = false;
                GetIdentificadores();
                GetObservaciones();
                GetDatosGenerales();
                GetTransporte();
                GetTasaPed();
                GetTasas();
                GetIdentPed();
                GetContrPartida();
                GetDestinatarios();
                GetGuias();
                GetCuentasAduaneras();
                GetDescargos();
                GetCuentasPedim();
                GetObsPartida();
                GetRectificacion();
                GetFechas();
                GetDetContribuciones();
                GetDifContribuciones();
                GetPartidas();
                GetContenedores();
                GetPermisos();
                GetMercancias();
                GetCFDI();
               


            }
            
        }
       
        public DataTable GetDataIdentificadores()
                {
                    DataTable dt = new DataTable();
                dt.Columns.Add("Fraccion");
                dt.Columns.Add("SecFraccion");
                dt.Columns.Add("ClaveCaso");
                dt.Columns.Add("IdCaso");
                dt.Columns.Add("ComplCaso");
                dt.Columns.Add("FechaPago");
            dt.Rows.Add("1", "1632", "125463", "071", "CERRADO","10/10/2021");
            

            return dt;
            }
                public void GetIdentificadores()
                {
                    DataTable dt = GetDataIdentificadores();
                IdentificadoresGV.PageSize = 10;
                IdentificadoresGV.DataSource = dt;
                IdentificadoresGV.DataBind();

                }
        public DataTable GetDataObservaciones()
        {
            DataTable Obser_dt = new DataTable();
            Obser_dt.Columns.Add("SecObservacion");
            Obser_dt.Columns.Add("Observaciones");
            Obser_dt.Columns.Add("TipoPed");
            Obser_dt.Columns.Add("FechaValPago");
            

            Obser_dt.Rows.Add("1", "1632", "125463", "071");
            

            return Obser_dt;
        }
        public void GetObservaciones()
        {
            DataTable Obser_dt = GetDataObservaciones();
            Observaciones_GV.PageSize = 10;
            Observaciones_GV.DataSource = Obser_dt;
            Observaciones_GV.DataBind();

        }
        public DataTable GetDataTasaPed()
        {
            DataTable tasatPed_DT = new DataTable();

        
            tasatPed_DT.Columns.Add("ClaveContr");
            tasatPed_DT.Columns.Add("Tasa");
            tasatPed_DT.Columns.Add("TipoTasa");
            tasatPed_DT.Columns.Add("TipoPed");
            tasatPed_DT.Columns.Add("FechaPago");

            tasatPed_DT.Rows.Add("1890", "0198465890003", "ED", "1890", "14-05-2021");

            return tasatPed_DT;
            
        }
        public void GetTasaPed()
        {
            DataTable tasatPed_DT = GetDataTasaPed();
            tasaPed_GV.PageSize = 10;
            tasaPed_GV.DataSource = tasatPed_DT;
            tasaPed_GV.DataBind();

        }
        public DataTable GetDataDatosGenerales()
        {
            DataTable datosGen = new DataTable();
            datosGen.Columns.Add("TipoOp");
            datosGen.Columns.Add("ClaveDoc");
            datosGen.Columns.Add("SeccAdu");
            datosGen.Columns.Add("CURPcont");
            datosGen.Columns.Add("RFC");
            datosGen.Columns.Add("CUPRage");
            datosGen.Columns.Add("TipoCam");
            datosGen.Columns.Add("TotFletes");

            datosGen.Columns.Add("TotSeguros");
            datosGen.Columns.Add("TotEmb");
            datosGen.Columns.Add("TotIncr");
            datosGen.Columns.Add("TotDeduc");
            datosGen.Columns.Add("PBM");
            datosGen.Columns.Add("TrSalida");
            datosGen.Columns.Add("TrArribo");
            datosGen.Columns.Add("TrEntSal");
            datosGen.Columns.Add("DestinoMerc");
            datosGen.Columns.Add("NombContribuyente");
            datosGen.Columns.Add("CalleContribuyente");
            datosGen.Columns.Add("NumIntContrib");
            datosGen.Columns.Add("NumExtContrib");
            datosGen.Columns.Add("CPContribuyente");
            datosGen.Columns.Add("MunicContrib");
            datosGen.Columns.Add("EntidadContrib");
            datosGen.Columns.Add("PaisContrib");
            datosGen.Columns.Add("TipoPedimento");
            datosGen.Columns.Add("FechaRecepcion");
            datosGen.Columns.Add("FechaPago");

            datosGen.Rows.Add("1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "CERRADO", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "CERRADO",
                "1632", "125463", "071", "CERRADO", "071", "CERRADO", "CERRADO", "1632", "125463", "071", "CERRADO", "071", "CERRADO");
            

            return datosGen;
        }
        public void GetDatosGenerales()
        {
            DataTable datosGen = GetDataDatosGenerales();
            //DatosGV.PageSize = 10;
            DatosGV.DataSource = datosGen;
            DatosGV.DataBind();
        }
        public DataTable GetDataTransporte()
        {
            DataTable transporteDT = new DataTable();
            transporteDT.Columns.Add("RFCtransp");
            transporteDT.Columns.Add("CURPtransp");
            transporteDT.Columns.Add("NombreTransp");
            transporteDT.Columns.Add("PaisTransp");
            transporteDT.Columns.Add("IdentifTransp");
            transporteDT.Columns.Add("FechaPago");

            transporteDT.Rows.Add("1", "1632", "125463", "071", "CERRADO", "071");
           

            return transporteDT;
        }
        public void GetTransporte()
        {
            DataTable transporteDT = GetDataTransporte();
            TransporteGV.PageSize = 10;
            TransporteGV.DataSource = transporteDT;
            TransporteGV.DataBind();
        }
        public DataTable GetDataTasas()
        {
            DataTable Tasas_DT = new DataTable();
            Tasas_DT.Columns.Add("Fraccion");
            Tasas_DT.Columns.Add("ClaveContr");
            Tasas_DT.Columns.Add("Tasa");
            Tasas_DT.Columns.Add("TipoTasa");
            Tasas_DT.Columns.Add("FechaPago");
            

            Tasas_DT.Rows.Add("1", "1632", "125463", "071", "13/10/21");
            

            return Tasas_DT;
        }
        public void GetTasas()
        {
            DataTable Tasas_DT = GetDataTasas();
            TasasGV.PageSize = 10;
            TasasGV.DataSource = Tasas_DT;
            TasasGV.DataBind();
        }
        public DataTable GetDataIdentPed()
        {
            DataTable IdentPed_DT = new DataTable();
            IdentPed_DT.Columns.Add("ClaveCaso");
            IdentPed_DT.Columns.Add("IdCaso");
            IdentPed_DT.Columns.Add("TipoPed");
            IdentPed_DT.Columns.Add("ComplCaso");
            IdentPed_DT.Columns.Add("FechaValidPago");



            IdentPed_DT.Rows.Add("1", "1632", "125463", "071", "10/10/2021");
            

            return IdentPed_DT;
        }
        public void GetIdentPed()
        {
            DataTable IdentPed_DT = GetDataIdentPed();
            IdentPed_GV.PageSize = 10;
            IdentPed_GV.DataSource = IdentPed_DT;
            IdentPed_GV.DataBind();
        }
        public DataTable GetDataContrPartida()
        {
            DataTable ContrPartid = new DataTable();

            ContrPartid.Columns.Add("Fraccion");
            ContrPartid.Columns.Add("SecFraccion");
            ContrPartid.Columns.Add("ClaveContr");
            ContrPartid.Columns.Add("Importe");
            ContrPartid.Columns.Add("FormaPago_DC");
            ContrPartid.Columns.Add("FechaPago");


            ContrPartid.Rows.Add("1", "1632", "125463", "071", "CERRADO", "10/10/2021");
            


            return ContrPartid;
        }
        public void GetContrPartida()
        {
            DataTable ContrPartid = GetDataContrPartida();
            ContrPartida_GV.PageSize = 10;
            ContrPartida_GV.DataSource = ContrPartid;
            ContrPartida_GV.DataBind();
        }
        public DataTable GetDataDestinatarios()
        {
            DataTable Destinatarios_DT = new DataTable();
            Destinatarios_DT.Columns.Add("IdFiscal_Dest");
            Destinatarios_DT.Columns.Add("Nombrec_Dest");
            Destinatarios_DT.Columns.Add("Calle_Des");
            Destinatarios_DT.Columns.Add("Numext_Des");
            Destinatarios_DT.Columns.Add("NumInt_Des");
            Destinatarios_DT.Columns.Add("CdMun_Dest");
            Destinatarios_DT.Columns.Add("CP_Dest");
            Destinatarios_DT.Columns.Add("Pais_Dest");
            Destinatarios_DT.Columns.Add("FechaPago");



            Destinatarios_DT.Rows.Add("1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "CERRADO","10/10/2021");
            


            return Destinatarios_DT;
        }
        public void GetDestinatarios()
        {
            DataTable Destinatarios_DT = GetDataDestinatarios();
            Destinatarios_GV.PageSize = 10;
            Destinatarios_GV.DataSource = Destinatarios_DT;
            Destinatarios_GV.DataBind();
        }
        public DataTable GetDataGuias()
        {
            DataTable Guias_DT = new DataTable();
            Guias_DT.Columns.Add("NumGuia");
            Guias_DT.Columns.Add("TipoGuia");
            Guias_DT.Columns.Add("FechaPago");



            Guias_DT.Rows.Add("1", "1632", "12/07/2021");


            return Guias_DT;
        }
        public void GetGuias()
        {
            DataTable Guias_DT = GetDataGuias();
            Guias_GV.PageSize = 10;
            Guias_GV.DataSource = Guias_DT;
            Guias_GV.DataBind();
        }
        public DataTable GetDataCuentasAduaneras()
        {
            DataTable CuentAduan_DT = new DataTable();
            CuentAduan_DT.Columns.Add("Fraccion");
            CuentAduan_DT.Columns.Add("SecFraccion");
            CuentAduan_DT.Columns.Add("Inst_Emisora");
            CuentAduan_DT.Columns.Add("Num_Cuenta_Adu");
            CuentAduan_DT.Columns.Add("FolioConstancia");
            CuentAduan_DT.Columns.Add("FechaConstancia");
            CuentAduan_DT.Columns.Add("Clave_Garantia");
            CuentAduan_DT.Columns.Add("VUT");
            CuentAduan_DT.Columns.Add("Total_Garantia");
            CuentAduan_DT.Columns.Add("Cantidad_UM");
            CuentAduan_DT.Columns.Add("TitAsig");
            CuentAduan_DT.Columns.Add("FechaPago");


            CuentAduan_DT.Rows.Add("1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "CERRADO", "CERRADO", "071", "CERRADO", "10/10/2021");
            


            return CuentAduan_DT;
        }
        public void GetCuentasAduaneras()
        {
            DataTable CuentAduan_DT = GetDataCuentasAduaneras();
            CuentasAduaneras_GV.PageSize = 10;
            CuentasAduaneras_GV.DataSource = CuentAduan_DT;
            CuentasAduaneras_GV.DataBind();
        }
        public DataTable GetDataDescargos()
        {
            DataTable Descargos_DT = new DataTable();
            Descargos_DT.Columns.Add("PatenteOrig");
            Descargos_DT.Columns.Add("PedimentoOrig");
            Descargos_DT.Columns.Add("Aduana_Orig");
            Descargos_DT.Columns.Add("Doc_Orig");
            Descargos_DT.Columns.Add("FechaPago_Orig");
            Descargos_DT.Columns.Add("Fraccion_Orig");
            Descargos_DT.Columns.Add("UnidMedida");
            Descargos_DT.Columns.Add("Mercancia");
            Descargos_DT.Columns.Add("TipoPed");
            Descargos_DT.Columns.Add("FechaPago");
            Descargos_DT.Rows.Add("1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "CERRADO", "CERRADO", "10/01/2021");
            


            return Descargos_DT;
        }
        public void GetDescargos()
        {
            DataTable Descargos_DT = GetDataDescargos();
            Descargos_GV.PageSize = 10;
            Descargos_GV.DataSource = Descargos_DT;
            Descargos_GV.DataBind();
        }
        public DataTable GetDataCuentasPedim()
        {
            DataTable CuentasPedim_DT = new DataTable();
            CuentasPedim_DT.Columns.Add("Inst_Emisora");
            CuentasPedim_DT.Columns.Add("Num_Cuenta_Adu");
            CuentasPedim_DT.Columns.Add("FolioConstancia");
            CuentasPedim_DT.Columns.Add("FechaConstancia");
            CuentasPedim_DT.Columns.Add("TipoCta");
            CuentasPedim_DT.Columns.Add("Clave_Garantia");
            CuentasPedim_DT.Columns.Add("VUT");
            CuentasPedim_DT.Columns.Add("Total_Garantia");
            CuentasPedim_DT.Columns.Add("Cantidad_UM");
            CuentasPedim_DT.Columns.Add("TitAsig");
            CuentasPedim_DT.Columns.Add("FechaPago");


            CuentasPedim_DT.Rows.Add("1", "1632", "125463", "071", "CERRADO", "071", "1632", "125463", "071", "CERRADO", "071");
            
            return CuentasPedim_DT;
        }
        public void GetCuentasPedim()
        {
            DataTable CuentasPedim_DT = GetDataCuentasPedim();
            CuentasPedim_GV.PageSize = 10;
            CuentasPedim_GV.DataSource = CuentasPedim_DT;
            CuentasPedim_GV.DataBind();
        }
        public DataTable GetDataObsPartida()
        {
            DataTable ObsPartida_DT = new DataTable();
            ObsPartida_DT.Columns.Add("Fraccion");
            ObsPartida_DT.Columns.Add("SecFraccion");
            ObsPartida_DT.Columns.Add("SecObservacion");
            ObsPartida_DT.Columns.Add("Observaciones");
            ObsPartida_DT.Columns.Add("FechaPago");
            
            




            ObsPartida_DT.Rows.Add("1", "1632", "125463", "071", "CERRADO");
            


            return ObsPartida_DT;
        }
        public void GetObsPartida()
        {
            DataTable ObsPartida_DT = GetDataObsPartida();
            ObsPartida_GV.PageSize = 10;
            ObsPartida_GV.DataSource = ObsPartida_DT;
            ObsPartida_GV.DataBind();
        }
        public DataTable GetDataRectificacion()
        {
            DataTable Rectif_DT = new DataTable();
            Rectif_DT.Columns.Add("ClavePed");
            Rectif_DT.Columns.Add("FechaPago");
            Rectif_DT.Columns.Add("PedAnterior");
            Rectif_DT.Columns.Add("PatAnterior");
            Rectif_DT.Columns.Add("AduAnterior");
            Rectif_DT.Columns.Add("DocAnterior");
            Rectif_DT.Columns.Add("FechaAnterior");
            Rectif_DT.Columns.Add("PedOriginal");
            Rectif_DT.Columns.Add("PatOriginal");
            Rectif_DT.Columns.Add("AduOriginal");

            Rectif_DT.Rows.Add("1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO","071");


            return Rectif_DT;
        }
        public void GetRectificacion()
        {
            DataTable Rectif_DT = GetDataRectificacion();
            Rectificacion_GV.PageSize = 10;
            Rectificacion_GV.DataSource = Rectif_DT;
            Rectificacion_GV.DataBind();
        }
        public DataTable GetDataFechas()
        {
            DataTable Fechas_DT = new DataTable();
            Fechas_DT.Columns.Add("TipoFecha");
            Fechas_DT.Columns.Add("FechaOper");
            Fechas_DT.Columns.Add("FechaValPago");



            Fechas_DT.Rows.Add("1", "1632", "125463");
            
          


            return Fechas_DT;
        }
        public void GetFechas()
        {
            DataTable Fechas_DT = GetDataFechas();
            Fechas_GV.PageSize = 10;
            Fechas_GV.DataSource = Fechas_DT;
            Fechas_GV.DataBind();
        }
        public DataTable GetDataDetContribuciones()
        {
            DataTable Contr_DT = new DataTable();
            Contr_DT.Columns.Add("ClaveContr");
            Contr_DT.Columns.Add("Importe");
            Contr_DT.Columns.Add("FormaPago_DC");
            Contr_DT.Columns.Add("TipoPed");
            Contr_DT.Columns.Add("FechaPago");
            

            Contr_DT.Rows.Add("1", "1632", "125463", "071", "10/10/2021");
            
            
            return Contr_DT;
        }
        public void GetDetContribuciones()
        {
            DataTable Contr_DT = GetDataDetContribuciones();
            DetContribuciones_GV.PageSize = 10;
            DetContribuciones_GV.DataSource = Contr_DT;
            DetContribuciones_GV.DataBind();
        }
        public DataTable GetDataDifContribuciones()
        {
            DataTable DifContr_DT = new DataTable();
            DifContr_DT.Columns.Add("ClaveContr");
            DifContr_DT.Columns.Add("Importe");
            DifContr_DT.Columns.Add("FormaPago_DC");
            DifContr_DT.Columns.Add("TipoPed");
            DifContr_DT.Columns.Add("FechaPago");

            DifContr_DT.Rows.Add("1", "1632", "125463", "1632", "12/12/2021");
            

            return DifContr_DT;
        }
        public void GetDifContribuciones()
        {
            DataTable DifContr_DT = GetDataDifContribuciones();
            DifContribuciones_GV.PageSize = 10;
            DifContribuciones_GV.DataSource = DifContr_DT;
            DifContribuciones_GV.DataBind();
        }
        public DataTable GetDataPartidas()
        {
            DataTable Partidas_DT = new DataTable();

            Partidas_DT.Columns.Add("Fraccion");
            Partidas_DT.Columns.Add("SecFraccion");
            Partidas_DT.Columns.Add("SubFraccion");
            Partidas_DT.Columns.Add("DescrMercancia");
            Partidas_DT.Columns.Add("PrecioUnit");
            Partidas_DT.Columns.Add("ValorAduana");
            Partidas_DT.Columns.Add("ValComercial");
            Partidas_DT.Columns.Add("ValDolares");
            Partidas_DT.Columns.Add("UMcomercial");
            Partidas_DT.Columns.Add("UMC");
            Partidas_DT.Columns.Add("cantUMtarifa");
            Partidas_DT.Columns.Add("UMtarifa");
            Partidas_DT.Columns.Add("Val_Agr");
            Partidas_DT.Columns.Add("ClaveVinc");
            Partidas_DT.Columns.Add("MetValor");
            Partidas_DT.Columns.Add("CodMerca");
            Partidas_DT.Columns.Add("MarcaMerc");
            Partidas_DT.Columns.Add("ModeloMerca");
            Partidas_DT.Columns.Add("PaisDest");
            Partidas_DT.Columns.Add("PaisCompr");
            Partidas_DT.Columns.Add("EntidadOrigen");
            Partidas_DT.Columns.Add("EntidadDest");
            Partidas_DT.Columns.Add("EntidadComprador");
            Partidas_DT.Columns.Add("EntidadVendedor");
            Partidas_DT.Columns.Add("TipoOP");
            Partidas_DT.Columns.Add("ClavePed");
            Partidas_DT.Columns.Add("FechaPago");

            Partidas_DT.Rows.Add("1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO");
            Partidas_DT.Rows.Add("2", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO");
            Partidas_DT.Rows.Add("3", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO");
            Partidas_DT.Rows.Add("4", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO");
            Partidas_DT.Rows.Add("5", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO");
            Partidas_DT.Rows.Add("6", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO");
            Partidas_DT.Rows.Add("7", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO");
            Partidas_DT.Rows.Add("8", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO");
            Partidas_DT.Rows.Add("9", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO");
            Partidas_DT.Rows.Add("10", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO");
            Partidas_DT.Rows.Add("11", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO");
            Partidas_DT.Rows.Add("12", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO");
            Partidas_DT.Rows.Add("13", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO");
            Partidas_DT.Rows.Add("14", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO",
                "1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "071", "CERRADO");


            return Partidas_DT;
        }
        public void GetPartidas()
        {
            DataTable Partidas_DT = GetDataPartidas();           
            Partidas_GV.DataSource = Partidas_DT;
            Partidas_GV.DataBind();
        }
        public DataTable GetDataCFDI()
        {
            DataTable CFDI_DT = new DataTable();

            CFDI_DT.Columns.Add("FechaFact");
            CFDI_DT.Columns.Add("NumFact");
            CFDI_DT.Columns.Add("TermFact");
            CFDI_DT.Columns.Add("ValDolares");
            CFDI_DT.Columns.Add("ValMonedaExt");
            CFDI_DT.Columns.Add("MonFact");
            CFDI_DT.Columns.Add("PaisFact");
            CFDI_DT.Columns.Add("EntFedFact");
            CFDI_DT.Columns.Add("IdFIscProv");
            CFDI_DT.Columns.Add("ProvMercancia");
            CFDI_DT.Columns.Add("CalleProv");
            CFDI_DT.Columns.Add("NumInterProv");
            CFDI_DT.Columns.Add("NumExtProv");
            CFDI_DT.Columns.Add("CPprov");
            CFDI_DT.Columns.Add("MunicProv");
            CFDI_DT.Columns.Add("FechaPago");


            CFDI_DT.Rows.Add("1", "fivd94039393", "fivd94039393", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf",
                "asdf", "asdf", "asd", "asdf", "asdf", "10/10/2021");
            CFDI_DT.Rows.Add("2", "fivd94039393", "fivd94039393", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf",
               "asdf", "asdf", "asd", "asdf", "asdf", "10/10/2021");
            CFDI_DT.Rows.Add("3", "fivd94039393", "fivd94039393", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf",
               "asdf", "asdf", "asd", "asdf", "asdf", "10/10/2021");
            CFDI_DT.Rows.Add("4", "fivd94039393", "fivd94039393", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf",
               "asdf", "asdf", "asd", "asdf", "asdf", "10/10/2021");
            CFDI_DT.Rows.Add("5", "fivd94039393", "fivd94039393", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf",
              "asdf", "asdf", "asd", "asdf", "asdf", "10/10/2021");
            CFDI_DT.Rows.Add("6", "fivd94039393", "fivd94039393", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf",
               "asdf", "asdf", "asd", "asdf", "asdf", "10/10/2021");
            CFDI_DT.Rows.Add("7", "fivd94039393", "fivd94039393", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf",
               "asdf", "asdf", "asd", "asdf", "asdf", "10/10/2021");
            CFDI_DT.Rows.Add("8", "fivd94039393", "fivd94039393", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf",
               "asdf", "asdf", "asd", "asdf", "asdf", "10/10/2021");
            CFDI_DT.Rows.Add("9", "fivd94039393", "fivd94039393", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf",
               "asdf", "asdf", "asd", "asdf", "asdf", "10/10/2021");
            CFDI_DT.Rows.Add("10", "fivd94039393", "fivd94039393", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf",
               "asdf", "asdf", "asd", "asdf", "asdf", "10/10/2021");
            CFDI_DT.Rows.Add("11", "fivd94039393", "fivd94039393", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf",
               "asdf", "asdf", "asd", "asdf", "asdf", "10/10/2021");
            CFDI_DT.Rows.Add("12", "fivd94039393", "fivd94039393", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf", "asdf",
               "asdf", "asdf", "asd", "asdf", "asdf", "10/10/2021");

            return CFDI_DT;
        }
        public void GetCFDI()
        {
            DataTable CFDI_DT = GetDataCFDI();
            CFDI_GV.DataSource = CFDI_DT;
            CFDI_GV.DataBind();
        }

        public DataTable GetDataContenedores()
        {
            DataTable Contenedores_DT = new DataTable();
            Contenedores_DT.Columns.Add("NumCont");
            Contenedores_DT.Columns.Add("TipoCont");
            Contenedores_DT.Columns.Add("FechaPago");

            Contenedores_DT.Rows.Add("1", "1632","10/10/2021");
            

            return Contenedores_DT;
        }
        public void GetContenedores()
        {
            DataTable Contenedores_DT = GetDataContenedores();
            Contenedores_GV.PageSize = 10;
            Contenedores_GV.DataSource = Contenedores_DT;
            Contenedores_GV.DataBind();
        }
        public DataTable GetDataPermisos()
        {
            DataTable Permisos_DT = new DataTable();
            Permisos_DT.Columns.Add("Fraccion");
            Permisos_DT.Columns.Add("SecFraccion");
            Permisos_DT.Columns.Add("ClavePermiso");
            Permisos_DT.Columns.Add("FirmaDescargo");
            Permisos_DT.Columns.Add("NumPermiso");
            Permisos_DT.Columns.Add("ValDolares");
            Permisos_DT.Columns.Add("UMTcantidad");
            Permisos_DT.Columns.Add("FechaPago");
            Permisos_DT.Rows.Add("1", "1632", "125463", "071", "CERRADO", "071", "CERRADO", "10/10/2021");
            


            return Permisos_DT;
        }
        public void GetPermisos()
        {
            DataTable Permisos_DT = GetDataPermisos();
            Permisos_GV.PageSize = 10;
            Permisos_GV.DataSource = Permisos_DT;
            Permisos_GV.DataBind();
        }
        public DataTable GetDataMercancias()
        {
            DataTable Mercancia_DT = new DataTable();
            Mercancia_DT.Columns.Add("Fraccion");
            Mercancia_DT.Columns.Add("SecFraccion");
            Mercancia_DT.Columns.Add("NumVehic");
            Mercancia_DT.Columns.Add("KmVehic");
            Mercancia_DT.Columns.Add("FechaPago");
            


            Mercancia_DT.Rows.Add("1", "1632", "125463", "071", "10/10/2021");
          

            return Mercancia_DT;
        }
        public void GetMercancias()
        {
            DataTable Mercancia_DT = GetDataMercancias();
            Mercancias_GV.PageSize = 10;
            Mercancias_GV.DataSource = Mercancia_DT;
            Mercancias_GV.DataBind();
        }
        protected void SelectorTabla_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetSeleccion();
        }
       
        public void GetSeleccion()
        {
            switch (SelectorTabla.SelectedValue)
            {
                case "DatosGenerales":
                    GetDatosGenerales();
                    PanelDatosGenerales.Visible = true;
                    PanelTransporte.Visible = false;
                    PanelTasasPedimento.Visible = false;
                    PanelIdentificadores.Visible = false;
                    PanelTasas.Visible = false;
                    PanelIdentificadoresPed.Visible = false;
                    PanelCFDI.Visible = false;
                    PanelContribPartida.Visible = false;
                    PanelDestinatarios.Visible = false;
                    PanelGuias.Visible = false;
                    PanelCuentasAduaneras.Visible = false;
                    PanelDescargos.Visible = false;
                    PanelCuentasAduanerasPedimento.Visible = false;
                    PanelRectificacion.Visible = false;
                    PanelFechas.Visible = false;
                    PanelDetContribuciones.Visible = false;
                    PanelDifContribuciones.Visible = false;
                    PanelObsPartida.Visible = false;
                    PanelPartidas.Visible = false;
                    PanelContenedores.Visible = false;
                    PanelPermisos.Visible = false;
                    PanelMercancias.Visible = false;
                    PanelObservaciones.Visible = false;

                    break;

                case "Transporte":
                    GetTransporte();
                    PanelDatosGenerales.Visible = false;
                    PanelTransporte.Visible = true;
                    PanelTasasPedimento.Visible = false;
                    PanelIdentificadores.Visible = false;
                    PanelTasas.Visible = false;
                    PanelIdentificadoresPed.Visible = false;
                    PanelCFDI.Visible = false;
                    PanelContribPartida.Visible = false;
                    PanelDestinatarios.Visible = false;
                    PanelGuias.Visible = false;
                    PanelCuentasAduaneras.Visible = false;
                    PanelDescargos.Visible = false;
                    PanelCuentasAduanerasPedimento.Visible = false;
                    PanelRectificacion.Visible = false;
                    PanelFechas.Visible = false;
                    PanelDetContribuciones.Visible = false;
                    PanelDifContribuciones.Visible = false;
                    PanelObsPartida.Visible = false;
                    PanelPartidas.Visible = false;
                    PanelContenedores.Visible = false;
                    PanelPermisos.Visible = false;
                    PanelMercancias.Visible = false;
                    PanelObservaciones.Visible = false;

                    break;

                case "TasaPedimento":
                    GetTasaPed();
                    PanelDatosGenerales.Visible = false;
                    PanelTransporte.Visible = false;
                    PanelTasasPedimento.Visible = true;
                    PanelIdentificadores.Visible = false;
                    PanelTasas.Visible = false;
                    PanelIdentificadoresPed.Visible = false;
                    PanelCFDI.Visible = false;
                    PanelContribPartida.Visible = false;
                    PanelDestinatarios.Visible = false;
                    PanelGuias.Visible = false;
                    PanelCuentasAduaneras.Visible = false;
                    PanelDescargos.Visible = false;
                    PanelCuentasAduanerasPedimento.Visible = false;
                    PanelRectificacion.Visible = false;
                    PanelFechas.Visible = false;
                    PanelDetContribuciones.Visible = false;
                    PanelDifContribuciones.Visible = false;
                    PanelObsPartida.Visible = false;
                    PanelPartidas.Visible = false;
                    PanelContenedores.Visible = false;
                    PanelPermisos.Visible = false;
                    PanelMercancias.Visible = false;
                    PanelObservaciones.Visible = false;

                    break;

                case "Identificadores":
                    GetIdentificadores();
                    PanelDatosGenerales.Visible = false;
                    PanelTransporte.Visible = false;
                    PanelTasasPedimento.Visible = false;
                    PanelIdentificadores.Visible = true;
                    PanelTasas.Visible = false;
                    PanelIdentificadoresPed.Visible = false;
                    PanelCFDI.Visible = false;
                    PanelContribPartida.Visible = false;
                    PanelDestinatarios.Visible = false;
                    PanelGuias.Visible = false;
                    PanelCuentasAduaneras.Visible = false;
                    PanelDescargos.Visible = false;
                    PanelCuentasAduanerasPedimento.Visible = false;
                    PanelRectificacion.Visible = false;
                    PanelFechas.Visible = false;
                    PanelDetContribuciones.Visible = false;
                    PanelDifContribuciones.Visible = false;
                    PanelObsPartida.Visible = false;
                    PanelPartidas.Visible = false;
                    PanelContenedores.Visible = false;
                    PanelPermisos.Visible = false;
                    PanelMercancias.Visible = false;
                    PanelObservaciones.Visible = false;

                    break;

                case "Tasas":
                    GetTasas();
                    PanelDatosGenerales.Visible = false;
                    PanelTransporte.Visible = false;
                    PanelTasasPedimento.Visible = false;
                    PanelIdentificadores.Visible = false;
                    PanelTasas.Visible = true;
                    PanelIdentificadoresPed.Visible = false;
                    PanelCFDI.Visible = false;
                    PanelContribPartida.Visible = false;
                    PanelDestinatarios.Visible = false;
                    PanelGuias.Visible = false;
                    PanelCuentasAduaneras.Visible = false;
                    PanelDescargos.Visible = false;
                    PanelCuentasAduanerasPedimento.Visible = false;
                    PanelRectificacion.Visible = false;
                    PanelFechas.Visible = false;
                    PanelDetContribuciones.Visible = false;
                    PanelDifContribuciones.Visible = false;
                    PanelObsPartida.Visible = false;
                    PanelPartidas.Visible = false;
                    PanelContenedores.Visible = false;
                    PanelPermisos.Visible = false;
                    PanelMercancias.Visible = false;
                    PanelObservaciones.Visible = false;

                    break;

                case "IdentificadoresPed":
                    GetIdentPed();
                    PanelDatosGenerales.Visible = false;
                    PanelTransporte.Visible = false;
                    PanelTasasPedimento.Visible = false;
                    PanelIdentificadores.Visible = false;
                    PanelTasas.Visible = false;
                    PanelIdentificadoresPed.Visible = true;
                    PanelCFDI.Visible = false;
                    PanelContribPartida.Visible = false;
                    PanelDestinatarios.Visible = false;
                    PanelGuias.Visible = false;
                    PanelCuentasAduaneras.Visible = false;
                    PanelDescargos.Visible = false;
                    PanelCuentasAduanerasPedimento.Visible = false;
                    PanelRectificacion.Visible = false;
                    PanelFechas.Visible = false;
                    PanelDetContribuciones.Visible = false;
                    PanelDifContribuciones.Visible = false;
                    PanelObsPartida.Visible = false;
                    PanelPartidas.Visible = false;
                    PanelContenedores.Visible = false;
                    PanelPermisos.Visible = false;
                    PanelMercancias.Visible = false;
                    PanelObservaciones.Visible = false;

                    break;
                case "CFDI":
                    GetCFDI();
                    PanelDatosGenerales.Visible = false;
                    PanelTransporte.Visible = false;
                    PanelTasasPedimento.Visible = false;
                    PanelIdentificadores.Visible = false;
                    PanelTasas.Visible = false;
                    PanelIdentificadoresPed.Visible = false;
                    PanelCFDI.Visible = true;
                    PanelContribPartida.Visible = false;
                    PanelDestinatarios.Visible = false;
                    PanelGuias.Visible = false;
                    PanelCuentasAduaneras.Visible = false;
                    PanelDescargos.Visible = false;
                    PanelCuentasAduanerasPedimento.Visible = false;
                    PanelRectificacion.Visible = false;
                    PanelFechas.Visible = false;
                    PanelDetContribuciones.Visible = false;
                    PanelDifContribuciones.Visible = false;
                    PanelObsPartida.Visible = false;
                    PanelPartidas.Visible = false;
                    PanelContenedores.Visible = false;
                    PanelPermisos.Visible = false;
                    PanelMercancias.Visible = false;
                    PanelObservaciones.Visible = false;

                    break;
                case "Contrib_Partida":
                    GetContrPartida(); ;
                    PanelDatosGenerales.Visible = false;
                    PanelTransporte.Visible = false;
                    PanelTasasPedimento.Visible = false;
                    PanelIdentificadores.Visible = false;
                    PanelTasas.Visible = false;
                    PanelIdentificadoresPed.Visible = false;
                    PanelCFDI.Visible = false;
                    PanelContribPartida.Visible = true;
                    PanelDestinatarios.Visible = false;
                    PanelGuias.Visible = false;
                    PanelCuentasAduaneras.Visible = false;
                    PanelDescargos.Visible = false;
                    PanelCuentasAduanerasPedimento.Visible = false;
                    PanelRectificacion.Visible = false;
                    PanelFechas.Visible = false;
                    PanelDetContribuciones.Visible = false;
                    PanelDifContribuciones.Visible = false;
                    PanelObsPartida.Visible = false;
                    PanelPartidas.Visible = false;
                    PanelContenedores.Visible = false;
                    PanelPermisos.Visible = false;
                    PanelMercancias.Visible = false;
                    PanelObservaciones.Visible = false;

                    break;
                case "Destinatarios":
                    GetDestinatarios();
                    PanelDatosGenerales.Visible = false;
                    PanelTransporte.Visible = false;
                    PanelTasasPedimento.Visible = false;
                    PanelIdentificadores.Visible = false;
                    PanelTasas.Visible = false;
                    PanelIdentificadoresPed.Visible = false;
                    PanelCFDI.Visible = false;
                    PanelContribPartida.Visible = false;
                    PanelDestinatarios.Visible = true;
                    PanelGuias.Visible = false;
                    PanelCuentasAduaneras.Visible = false;
                    PanelDescargos.Visible = false;
                    PanelCuentasAduanerasPedimento.Visible = false;
                    PanelRectificacion.Visible = false;
                    PanelFechas.Visible = false;
                    PanelDetContribuciones.Visible = false;
                    PanelDifContribuciones.Visible = false;
                    PanelObsPartida.Visible = false;
                    PanelPartidas.Visible = false;
                    PanelContenedores.Visible = false;
                    PanelPermisos.Visible = false;
                    PanelMercancias.Visible = false;
                    PanelObservaciones.Visible = false;

                    break;
                case "Guias":
                    GetGuias();
                    PanelDatosGenerales.Visible = false;
                    PanelTransporte.Visible = false;
                    PanelTasasPedimento.Visible = false;
                    PanelIdentificadores.Visible = false;
                    PanelTasas.Visible = false;
                    PanelIdentificadoresPed.Visible = false;
                    PanelCFDI.Visible = false;
                    PanelContribPartida.Visible = false;
                    PanelDestinatarios.Visible = false;
                    PanelGuias.Visible = true;
                    PanelCuentasAduaneras.Visible = false;
                    PanelDescargos.Visible = false;
                    PanelCuentasAduanerasPedimento.Visible = false;
                    PanelRectificacion.Visible = false;
                    PanelFechas.Visible = false;
                    PanelDetContribuciones.Visible = false;
                    PanelDifContribuciones.Visible = false;
                    PanelObsPartida.Visible = false;
                    PanelPartidas.Visible = false;
                    PanelContenedores.Visible = false;
                    PanelPermisos.Visible = false;
                    PanelMercancias.Visible = false;
                    PanelObservaciones.Visible = false;

                    break;
                case "CuentasAduaneras":
                    GetCuentasAduaneras();
                    PanelDatosGenerales.Visible = false;
                    PanelTransporte.Visible = false;
                    PanelTasasPedimento.Visible = false;
                    PanelIdentificadores.Visible = false;
                    PanelTasas.Visible = false;
                    PanelIdentificadoresPed.Visible = false;
                    PanelCFDI.Visible = false;
                    PanelContribPartida.Visible = false;
                    PanelDestinatarios.Visible = false;
                    PanelGuias.Visible = false;                  
                    PanelCuentasAduaneras.Visible = true;
                    PanelDescargos.Visible = false;
                    PanelCuentasAduanerasPedimento.Visible = false;
                    PanelRectificacion.Visible = false;
                    PanelFechas.Visible = false;
                    PanelDetContribuciones.Visible = false;
                    PanelDifContribuciones.Visible = false;
                    PanelObsPartida.Visible = false;
                    PanelPartidas.Visible = false;
                    PanelContenedores.Visible = false;
                    PanelPermisos.Visible = false;
                    PanelMercancias.Visible = false;
                    PanelObservaciones.Visible = false;

                    break;
                case "Descargos":
                    GetDescargos();
                    PanelDatosGenerales.Visible = false;
                    PanelTransporte.Visible = false;
                    PanelTasasPedimento.Visible = false;
                    PanelIdentificadores.Visible = false;
                    PanelTasas.Visible = false;
                    PanelIdentificadoresPed.Visible = false;
                    PanelCFDI.Visible = false;
                    PanelContribPartida.Visible = false;
                    PanelDestinatarios.Visible = false;
                    PanelGuias.Visible = false;
                    PanelCuentasAduaneras.Visible = false;
                    PanelDescargos.Visible = true;
                    PanelCuentasAduanerasPedimento.Visible = false;
                    PanelRectificacion.Visible = false;
                    PanelFechas.Visible = false;
                    PanelDetContribuciones.Visible = false;
                    PanelIdentificadoresPed.Visible = false;
                    PanelObsPartida.Visible = false;
                    PanelPartidas.Visible = false;
                    PanelContenedores.Visible = false;
                    PanelPermisos.Visible = false;
                    PanelMercancias.Visible = false;
                    PanelObservaciones.Visible = false;

                    break;
                case "CuentasAduanerasPed":
                    GetCuentasPedim();
                    PanelDatosGenerales.Visible = false;
                    PanelTransporte.Visible = false;
                    PanelTasasPedimento.Visible = false;
                    PanelIdentificadores.Visible = false;
                    PanelTasas.Visible = false;
                    PanelIdentificadoresPed.Visible = false;
                    PanelCFDI.Visible = false;
                    PanelContribPartida.Visible = false;
                    PanelDestinatarios.Visible = false;
                    PanelGuias.Visible = false;
                    PanelCuentasAduaneras.Visible = false;
                    PanelDescargos.Visible = false;
                    PanelCuentasAduanerasPedimento.Visible = true;
                    PanelRectificacion.Visible = false;
                    PanelFechas.Visible = false;
                    PanelDetContribuciones.Visible = false;
                    PanelDifContribuciones.Visible = false;
                    PanelObsPartida.Visible = false;
                    PanelPartidas.Visible = false;
                    PanelContenedores.Visible = false;
                    PanelPermisos.Visible = false;
                    PanelMercancias.Visible = false;
                    PanelObservaciones.Visible = false;

                    break;
                case "Rectificacion":
                    GetRectificacion();
                    PanelDatosGenerales.Visible = false;
                    PanelTransporte.Visible = false;
                    PanelTasasPedimento.Visible = false;
                    PanelIdentificadores.Visible = false;
                    PanelTasas.Visible = false;
                    PanelIdentificadoresPed.Visible = false;
                    PanelCFDI.Visible = false;
                    PanelContribPartida.Visible = false;
                    PanelDestinatarios.Visible = false;
                    PanelGuias.Visible = false;
                    PanelCuentasAduaneras.Visible = false;
                    PanelDescargos.Visible = false;
                    PanelCuentasAduanerasPedimento.Visible = false;
                    PanelRectificacion.Visible = true;
                    PanelFechas.Visible = false;
                    PanelDetContribuciones.Visible = false;
                    PanelDifContribuciones.Visible = false;
                    PanelObsPartida.Visible = false;
                    PanelPartidas.Visible = false;
                    PanelContenedores.Visible = false;
                    PanelPermisos.Visible = false;
                    PanelMercancias.Visible = false;
                    PanelObservaciones.Visible = false;

                    break;
                    case "Fechas":
                    GetFechas();
                    PanelDatosGenerales.Visible = false;
                    PanelTransporte.Visible = false;
                    PanelTasasPedimento.Visible = false;
                    PanelIdentificadores.Visible = false;
                    PanelTasas.Visible = false;
                    PanelIdentificadoresPed.Visible = false;
                    PanelCFDI.Visible = false;
                    PanelContribPartida.Visible = false;
                    PanelDestinatarios.Visible = false;
                    PanelGuias.Visible = false;
                    PanelCuentasAduaneras.Visible = false;
                    PanelDescargos.Visible = false;
                    PanelCuentasAduanerasPedimento.Visible = false;
                    PanelRectificacion.Visible = false;
                    PanelFechas.Visible = true;
                    PanelDetContribuciones.Visible = false;
                    PanelDifContribuciones.Visible = false;
                    PanelObsPartida.Visible = false;
                    PanelPartidas.Visible = false;
                    PanelContenedores.Visible = false;
                    PanelPermisos.Visible = false;
                    PanelMercancias.Visible = false;
                    PanelObservaciones.Visible = false;

                    break;
                case "DetContribuciones":
                    GetDetContribuciones();
                    PanelDatosGenerales.Visible = false;
                    PanelTransporte.Visible = false;
                    PanelTasasPedimento.Visible = false;
                    PanelIdentificadores.Visible = false;
                    PanelTasas.Visible = false;
                    PanelIdentificadoresPed.Visible = false;
                    PanelCFDI.Visible = false;
                    PanelContribPartida.Visible = false;
                    PanelDestinatarios.Visible = false;
                    PanelGuias.Visible = false;
                    PanelCuentasAduaneras.Visible = false;
                    PanelDescargos.Visible = false;
                    PanelCuentasAduanerasPedimento.Visible = false;
                    PanelRectificacion.Visible = false;
                    PanelFechas.Visible = false;
                    PanelDetContribuciones.Visible = true;
                    PanelDifContribuciones.Visible = false;
                    PanelObsPartida.Visible = false;
                    PanelPartidas.Visible = false;
                    PanelContenedores.Visible = false;
                    PanelPermisos.Visible = false;
                    PanelMercancias.Visible = false;
                    PanelObservaciones.Visible = false;

                    break;
                case "DifContribuciones":
                    GetDifContribuciones();
                    PanelDatosGenerales.Visible = false;
                    PanelTransporte.Visible = false;
                    PanelTasasPedimento.Visible = false;
                    PanelIdentificadores.Visible = false;
                    PanelTasas.Visible = false;
                    PanelIdentificadoresPed.Visible = false;
                    PanelCFDI.Visible = false;
                    PanelContribPartida.Visible = false;
                    PanelDestinatarios.Visible = false;
                    PanelGuias.Visible = false;
                    PanelCuentasAduaneras.Visible = false;
                    PanelDescargos.Visible = false;
                    PanelCuentasAduanerasPedimento.Visible = false;
                    PanelRectificacion.Visible = false;
                    PanelFechas.Visible = false;
                    PanelDetContribuciones.Visible = false;
                    PanelDifContribuciones.Visible = true;
                    PanelObsPartida.Visible = false;
                    PanelPartidas.Visible = false;
                    PanelContenedores.Visible = false;
                    PanelPermisos.Visible = false;
                    PanelMercancias.Visible = false;
                    PanelObservaciones.Visible = false;

                    break;
                case "ObsPartida":
                    GetObsPartida();
                    PanelDatosGenerales.Visible = false;
                    PanelTransporte.Visible = false;
                    PanelTasasPedimento.Visible = false;
                    PanelIdentificadores.Visible = false;
                    PanelTasas.Visible = false;
                    PanelIdentificadoresPed.Visible = false;
                    PanelCFDI.Visible = false;
                    PanelContribPartida.Visible = false;
                    PanelDestinatarios.Visible = false;
                    PanelGuias.Visible = false;
                    PanelCuentasAduaneras.Visible = false;
                    PanelDescargos.Visible = false;
                    PanelCuentasAduanerasPedimento.Visible = false;
                    PanelRectificacion.Visible = false;
                    PanelFechas.Visible = false;
                    PanelDetContribuciones.Visible = false;
                    PanelDifContribuciones.Visible = false;
                    PanelObsPartida.Visible = true;
                    PanelPartidas.Visible = false;
                    PanelContenedores.Visible = false;
                    PanelPermisos.Visible = false;
                    PanelMercancias.Visible = false;
                    PanelObservaciones.Visible = false;

                    break;
                case "Partidas":
                    GetPartidas();
                    PanelDatosGenerales.Visible = false;
                    PanelTransporte.Visible = false;
                    PanelTasasPedimento.Visible = false;
                    PanelIdentificadores.Visible = false;
                    PanelTasas.Visible = false;
                    PanelIdentificadoresPed.Visible = false;
                    PanelCFDI.Visible = false;
                    PanelContribPartida.Visible = false;
                    PanelDestinatarios.Visible = false;
                    PanelGuias.Visible = false;
                    PanelCuentasAduaneras.Visible = false;
                    PanelDescargos.Visible = false;
                    PanelCuentasAduanerasPedimento.Visible = false;
                    PanelRectificacion.Visible = false;
                    PanelFechas.Visible = false;
                    PanelDetContribuciones.Visible = false;
                    PanelDifContribuciones.Visible = false;
                    PanelObsPartida.Visible = false;
                    PanelPartidas.Visible = true;
                    PanelContenedores.Visible = false;
                    PanelPermisos.Visible = false;
                    PanelMercancias.Visible = false;
                    PanelObservaciones.Visible = false;

                    break;
                case "Contenedores":
                    GetContenedores();
                    PanelDatosGenerales.Visible = false;
                    PanelTransporte.Visible = false;
                    PanelTasasPedimento.Visible = false;
                    PanelIdentificadores.Visible = false;
                    PanelTasas.Visible = false;
                    PanelIdentificadoresPed.Visible = false;
                    PanelCFDI.Visible = false;
                    PanelContribPartida.Visible = false;
                    PanelDestinatarios.Visible = false;
                    PanelGuias.Visible = false;
                    PanelCuentasAduaneras.Visible = false;
                    PanelDescargos.Visible = false;
                    PanelCuentasAduanerasPedimento.Visible = false;
                    PanelRectificacion.Visible = false;
                    PanelFechas.Visible = false;
                    PanelDetContribuciones.Visible = false;
                    PanelDifContribuciones.Visible = false;
                    PanelObsPartida.Visible = false;
                    PanelPartidas.Visible = false;
                    PanelContenedores.Visible = true;
                    PanelPermisos.Visible = false;
                    PanelMercancias.Visible = false;
                    PanelObservaciones.Visible = false;

                    break;
                case "Permisos":
                    GetPermisos();
                    PanelDatosGenerales.Visible = false;
                    PanelTransporte.Visible = false;
                    PanelTasasPedimento.Visible = false;
                    PanelIdentificadores.Visible = false;
                    PanelTasas.Visible = false;
                    PanelIdentificadoresPed.Visible = false;
                    PanelCFDI.Visible = false;
                    PanelContribPartida.Visible = false;
                    PanelDestinatarios.Visible = false;
                    PanelGuias.Visible = false;
                    PanelCuentasAduaneras.Visible = false;
                    PanelDescargos.Visible = false;
                    PanelCuentasAduanerasPedimento.Visible = false;
                    PanelRectificacion.Visible = false;
                    PanelFechas.Visible = false;
                    PanelDetContribuciones.Visible = false;
                    PanelDifContribuciones.Visible = false;
                    PanelObsPartida.Visible = false;
                    PanelPartidas.Visible = false;
                    PanelContenedores.Visible = false;
                    PanelPermisos.Visible = true;
                    PanelMercancias.Visible = false;
                    PanelObservaciones.Visible = false;

                    break;
                case "Mercancias":
                    GetMercancias();
                    PanelDatosGenerales.Visible = false;
                    PanelTransporte.Visible = false;
                    PanelTasasPedimento.Visible = false;
                    PanelIdentificadores.Visible = false;
                    PanelTasas.Visible = false;
                    PanelIdentificadoresPed.Visible = false;
                    PanelCFDI.Visible = false;
                    PanelContribPartida.Visible = false;
                    PanelDestinatarios.Visible = false;
                    PanelGuias.Visible = false;
                    PanelCuentasAduaneras.Visible = false;
                    PanelDescargos.Visible = false;
                    PanelCuentasAduanerasPedimento.Visible = false;
                    PanelRectificacion.Visible = false;
                    PanelFechas.Visible = false;
                    PanelDetContribuciones.Visible = false;
                    PanelDifContribuciones.Visible = false;
                    PanelObsPartida.Visible = false;
                    PanelPartidas.Visible = false;
                    PanelContenedores.Visible = false;
                    PanelPermisos.Visible = false;
                    PanelMercancias.Visible = true;
                    PanelObservaciones.Visible = false;
                    break;
                case "Observaciones":
                    GetObservaciones();
                    PanelDatosGenerales.Visible = false;
                    PanelTransporte.Visible = false;
                    PanelTasasPedimento.Visible = false;
                    PanelIdentificadores.Visible = false;
                    PanelTasas.Visible = false;
                    PanelIdentificadoresPed.Visible = false;
                    PanelCFDI.Visible = false;
                    PanelContribPartida.Visible = false;
                    PanelDestinatarios.Visible = false;
                    PanelGuias.Visible = false;
                    PanelCuentasAduaneras.Visible = false;
                    PanelDescargos.Visible = false;
                    PanelCuentasAduanerasPedimento.Visible = false;
                    PanelRectificacion.Visible = false;
                    PanelFechas.Visible = false;
                    PanelDetContribuciones.Visible = false;
                    PanelDifContribuciones.Visible = false;
                    PanelObsPartida.Visible = false;
                    PanelPartidas.Visible = false;
                    PanelContenedores.Visible = false;
                    PanelPermisos.Visible = false;
                    PanelMercancias.Visible = false;
                    PanelObservaciones.Visible = true;
                    break;

            }
        }
        
        protected void DatosImpExp_GV_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void DatosImpExp_GV_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        

        protected void IdentPed_GV_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            IdentPed_GV.PageIndex = e.NewPageIndex;

        }

        protected void CFDI_GV_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            CFDI_GV.PageIndex = e.NewPageIndex;
            DataTable CFDI_DT = GetDataCFDI();
            CFDI_GV.DataSource = CFDI_DT;
            CFDI_GV.DataBind();
        }

        protected void Partidas_GV_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Partidas_GV.PageIndex = e.NewPageIndex;
            DataTable Partidas_DT = GetDataPartidas();
            Partidas_GV.DataSource = Partidas_DT;
            Partidas_GV.DataBind();
        }
    }
}