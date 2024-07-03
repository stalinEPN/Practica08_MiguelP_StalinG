using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace pizzeria
{
    public class Global : System.Web.HttpApplication
    {
        // Metodo que se ejecuta 1 vez al iniciar por primera vez a la aplicacion web. Inicializa y carga estados disponibles
        // durante la vida de la aplicación
        protected void Application_Start(object sender, EventArgs e)
        {
            // Se inicializa el costo de la masa delgada
            Application["Delgada"] = "5";

            // Se inicializa el costo de la masa pan pizza
            Application["Pan Pizza"] = "8";

            // Se inicializa el costo de la masa gruesa
            Application["Gruesa"] = "10";

            // Se inicializa el costo de los champiñones
            Application["Champiñones"] = "8";

            // Se inicializa el costo del peperoni
            Application["Peperoni"] = "10";

            // Se inicializa el costo de la salchicha
            Application["Salchicha"] = "12";
        }
    }
}