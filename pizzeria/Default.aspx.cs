using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pizzeria
{
    public partial class Default : System.Web.UI.Page
    {
        // Metodo que se ejecuta cada vez que se carga la página, ya sea la primera carga o en postbacks
        protected void Page_Load(object sender, EventArgs e)
        {
            // Se verifica si la página no está siendo cargada como resultado de un postback
            if (!IsPostBack)
            {
                // Se inicializa la sesión de selección con un valor vacío solo si es la primera carga de la pagina web
                Session["seleccion"] = "";

                // Se inicializa la sesión de costo con un valor de "0" solo si es la primera carga de la pagina web
                Session["costo"] = "0";
            }
        }
        // Manejador de eventos que se dispara cuando cambia el estado del Radiobutton o Checkbox.
        // Actualiza la selección del usuario y calcula el costo total basado en las opciones seleccionadas
        protected void Opciones_CheckedChanged(object sender, EventArgs e)
        {
            // Se crea un StringBuilder para almacenar la selección actual
            StringBuilder seleccion = new StringBuilder();
            // Variable que acumula el costo total en base a lo seleccionado
            float costoTotal = 0;
            // Variable que recolecta el costo de cada item seleccionado
            float costo;

            // Obtener tamaño de pizza seleccionado
            if (rblTamanio.SelectedItem != null)
            {
                string tamano = rblTamanio.SelectedValue;
                costoTotal += ObtenerCostoItem(tamano);
                seleccion.Append("Tamaño de pizza: " + tamano + "; ");
            }

            // Se añade la cadena "Tipo de masa: " al StringBuilder
            seleccion.Append("Tipo de masa: ");
            // Se verifica si la masa delgada está seleccionada
            if (rbtDelgada.Checked)
            {
                // Se añade la selección de masa delgada al StringBuilder
                seleccion.Append(rbtDelgada.Text + " ");

                // Se intenta obtener el costo de la masa delgada desde la aplicación
                if (float.TryParse((string)Application[rbtDelgada.Text], out costo))
                {
                    // Se suma el valor del item seleccionado al costo final
                    costoTotal += costo;
                }
            }
            // Se verifica si la masa pan pizza está seleccionada
            else if (rbtPanPizza.Checked)
            {
                // Se añade la selección de masa pan pizza al StringBuilder
                seleccion.Append(rbtPanPizza.Text + " ");

                // Se intenta obtener el costo de la masa pan pizza desde la aplicación
                if (float.TryParse((string)Application[rbtPanPizza.Text], out costo))
                {
                    // Se suma el valor del item seleccionado al costo final
                    costoTotal += costo;
                }
            }
            // Se verifica si la masa gruesa está seleccionada
            else if (rbtGruesa.Checked)
            {
                // Se añade la selección de masa gruesa al StringBuilder
                seleccion.Append(rbtGruesa.Text + " ");

                // Se intenta obtener el costo de la masa gruesa desde la aplicación
                if (float.TryParse((string)Application[rbtGruesa.Text], out costo))
                {
                    // Se suma el valor del item seleccionado al costo final
                    costoTotal += costo;
                }
            }

            // Se añade la cadena "; Ingredientes: " al StringBuilder
            seleccion.Append("; Ingredientes: ");
            // Se verifica si los champiñones están seleccionados
            if (chkHongo.Checked)
            {
                // Se añade la selección de champiñones al StringBuilder
                seleccion.Append(chkHongo.Text + " ");

                // Se intenta obtener el costo de los champiñones desde la aplicación
                if (float.TryParse((string)Application[chkHongo.Text], out costo))
                {
                    // Se suma el valor del item seleccionado al costo final
                    costoTotal += costo;
                }
            }
            // Se verifica si el peperoni está seleccionado
            if (chkPeperoni.Checked)
            {
                // Se añade la selección de peperoni al StringBuilder
                seleccion.Append(chkPeperoni.Text + " ");

                // Se intenta obtener el costo del peperoni desde la aplicación
                if (float.TryParse((string)Application[chkPeperoni.Text], out costo))
                {
                    // Se suma el valor del item seleccionado al costo final
                    costoTotal += costo;
                }
            }
            // Se verifica si la salchicha está seleccionada
            if (chkSalchicha.Checked)
            {
                // Se añade la selección de salchicha al StringBuilder
                seleccion.Append(chkSalchicha.Text + " ");

                // Se intenta obtener el costo de la salchicha desde la aplicación
                if (float.TryParse((string)Application[chkSalchicha.Text], out costo))
                {
                    // Se suma el valor del item seleccionado al costo final
                    costoTotal += costo;
                }
            }

            // Se añade la cadena "; Extras: " al StringBuilder
            seleccion.Append("; Extras: ");
            // Obtener extras seleccionados
            foreach (ListItem item in cblExtras.Items)
            {
                if (item.Selected)
                {
                    seleccion.Append(item.Text + " ");
                    costoTotal += ObtenerCostoItem(item.Value);
                }
            }

            // Se añade la cadena "; Bebidas: " al StringBuilder
            seleccion.Append("; Bebidas: ");
            // Obtener bebidas seleccionadas
            foreach (ListItem item in cblBebidas.Items)
            {
                if (item.Selected)
                {
                    seleccion.Append(item.Text + " ");
                    costoTotal += ObtenerCostoItem(item.Value);
                }
            }

            // Se actualiza el texto del literal con la selección actual
            literalSeleccionActual.Text = seleccion.ToString();

            // Se actualiza el texto del campo de texto con el costo total
            txtTotal.Text = costoTotal.ToString();
        }

        private float ObtenerCostoItem(string item)
        {
            // Definir costos para cada item seleccionado
            switch (item)
            {
                case "Personal":
                    return 5;
                case "Mediana":
                    return 8;
                case "Familiar":
                    return 10;
                case "Gigante":
                    return 12;
                case "PapasFritas":
                    return 4;
                case "DedosQueso":
                    return 6;
                case "Brownie":
                    return 3;
                case "BordesQueso":
                    return 2;
                case "BordesSalchichaQueso":
                    return 4;
                case "Pepsi":
                    return 2;
                case "Sprite":
                    return 2;
                case "Fiora":
                    return 2;
                case "CocaCola":
                    return 2;
                default:
                    return 0;
            }
        }

        // Manejador de eventos que se activa cuando el usuario hace clic en el link
        protected void LnkCheckout_Click(object sender, EventArgs e)
        {
            // Se guarda la selección actual en la sesión
            Session["seleccion"] = literalSeleccionActual.Text;

            // Se guarda el costo total en la sesión
            Session["costo"] = txtTotal.Text;

            // Se redirige al usuario a la página de CheckOut
            Response.Redirect("CheckOut.aspx");
        }
    }
}