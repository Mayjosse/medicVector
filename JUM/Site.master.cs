using System;
using System.Collections.Generic;
using System.Data;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class SiteMaster : MasterPage
{
    private const string AntiXsrfTokenKey = "__AntiXsrfToken";
    private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
    private string _antiXsrfTokenValue;

    protected void Page_Init(object sender, EventArgs e)
    {
        // The code below helps to protect against XSRF attacks
        var requestCookie = Request.Cookies[AntiXsrfTokenKey];
        Guid requestCookieGuidValue;
        if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
        {
            // Use the Anti-XSRF token from the cookie
            _antiXsrfTokenValue = requestCookie.Value;
            Page.ViewStateUserKey = _antiXsrfTokenValue;
        }
        else
        {
            // Generate a new Anti-XSRF token and save to the cookie
            _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
            Page.ViewStateUserKey = _antiXsrfTokenValue;

            var responseCookie = new HttpCookie(AntiXsrfTokenKey)
            {
                HttpOnly = true,
                Value = _antiXsrfTokenValue
            };
            if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
            {
                responseCookie.Secure = true;
            }
            Response.Cookies.Set(responseCookie);
        }

        Page.PreLoad += master_Page_PreLoad;
    }

    protected void master_Page_PreLoad(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Set Anti-XSRF token
            ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
            ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
        }
        else
        {
            // Validate the Anti-XSRF token
            if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
            {
                throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dtMenus = new DataTable();
        dtMenus.Clear();
        dtMenus.Columns.Add("Name");
        dtMenus.Columns.Add("Path");
        dtMenus.Columns.Add("Tipo");

        DataRow _servicios = dtMenus.NewRow();
        _servicios["Name"] = "Servicios";
        _servicios["Path"] = "servicios/servicioAdd";
        _servicios["Tipo"] = "1";
        dtMenus.Rows.Add(_servicios);

        DataRow _citas = dtMenus.NewRow();
        _citas["Name"] = "Citas";
        _citas["Path"] = "/citas";
        _citas["Tipo"] = "2";
        dtMenus.Rows.Add(_citas);

        DataRow _resultados = dtMenus.NewRow();
        _resultados["Name"] = "Resultados";
        _resultados["Path"] = "/resultados";
        _resultados["Tipo"] = "2";
        dtMenus.Rows.Add(_resultados);

        foreach (DataRow item in dtMenus.Rows)
        {
            HtmlGenericControl li = new HtmlGenericControl("li");
            HtmlGenericControl anchor = new HtmlGenericControl("a");
            anchor.Attributes.Add("href", item["Path"].ToString());
            anchor.InnerText = item["Name"].ToString();
            li.Controls.Add(anchor);
            nav.Controls.Add(li);
        }

    }

    protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        Context.GetOwinContext().Authentication.SignOut();
    }
}