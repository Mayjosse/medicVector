using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class servicios_Servicios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!this.IsPostBack)
        {
            JUMEntities jum = new JUMEntities();
            var _servicios = jum.Servicios.ToList();
            Servicios.DataSource = _servicios;
            Servicios.DataBind();
        }
    }
    protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(Servicios, "Select$" + e.Row.RowIndex);
            e.Row.Attributes["style"] = "cursor:pointer";
        }
    }
    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
        int index = Servicios.SelectedRow.RowIndex;
    }
}