using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pizzeria
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Verifica si la página se carga por primera vez o si se está volviendo a cargar debido a un postback
            if (!IsPostBack)
            {
                // Recupera y muestra la selección de pizza almacenada en la sesión
                literalSeleccion.Text = (String)Session["seleccion"];

                // Recupera y muestra el costo de la pizza almacenado en la sesión
                txtCosto.Text = (String)Session["costo"];
            }
        }
    }
}