/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.27
 * Generated at: 2022-01-04 12:48:46 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.tutorialesJosem.MySQL.ConectaBD;
import models.usuer;
import Utils.RequestUtils;
import java.util.List;

public final class navbar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("Utils.RequestUtils");
    _jspx_imports_classes.add("com.tutorialesJosem.MySQL.ConectaBD");
    _jspx_imports_classes.add("models.usuer");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("    \n");
      out.write("        \n");
      out.write("            \n");
      out.write("                \n");
      out.write("                    <!doctype html>\n");
      out.write("                    <html lang=\"en\">\n");
      out.write("\n");
      out.write("                    <head>\n");
      out.write("                        <!-- Required meta tags -->\n");
      out.write("                        <meta charset=\"utf-8\">\n");
      out.write("                        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("                    </head>\n");
      out.write("\n");
      out.write("                    <body>\n");
      out.write("                        ");

                        HttpSession mySession = request.getSession();
                        String name2 = (String)mySession.getAttribute("jes");
                        String name1 = (String)mySession.getAttribute("gar");
                        Integer name3 = (Integer)mySession.getAttribute("jes2");
                        //  byte[] name3 = (byte[])mySession.getAttribute("img");    
                        
      out.write("\n");
      out.write("                            <nav class=\"navbar navbar-expand-lg navbar-dark bg-dark\">\n");
      out.write("                                <a class=\"navbar-brand\" href=\"Inix\"><img src=\"img/LogoPixelGameShop.png\" style=\"width: 40px; height: 40px; border-radius: 50%; float: left;\" alt=\"Mr.Game&Watch\" height=\"60\" width=\"60\"></a>\n");
      out.write("                                <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("                                    <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("                                </button>\n");
      out.write("                                \n");
      out.write("                                <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\n");
      out.write("                                    <ul class=\"navbar-nav mr-auto\">\n");
      out.write("                                        <li class=\"nav-item active\">\n");
      out.write("                                            <a class=\"nav-link\" href=\"Inix\">Inicio<span class=\"sr-only\">(current)</span></a>\n");
      out.write("                                        </li>\n");
      out.write("                                        <li class=\"nav-item dropdown\">\n");
      out.write("                                            <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                                            Sesión\n");
      out.write("                                            </a>\n");
      out.write("                                            <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\n");
      out.write("                                                <div class=\"dropdown-content\">\n");
      out.write("                                                    <a class=\"dropdown-item\" href=\"login.jsp\">Iniciar sesión </a>\n");
      out.write("                                                    <a class=\"dropdown-item\" href=\"logadm.jsp\">Iniciar como Administrador</a>\n");
      out.write("                                                    <a class=\"dropdown-item\" href=\"index.jsp\">Registrate</a>\n");
      out.write("                                                    <a class=\"dropdown-item\" href=\"logOut\">Cerrar Sesión</a>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                        </li>\n");
      out.write("                                        <li class=\"nav-item dropdown\">\n");
      out.write("                                            <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n");
      out.write("                                            Categorías\n");
      out.write("                                            </a>\n");
      out.write("                                            <div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">\n");
      out.write("                                                <div class=\"dropdown-content\">\n");
      out.write("                                                    <a class=\"dropdown-item\" href=\"byCate?cate=1\">Consolas </a>\n");
      out.write("                                                    <a class=\"dropdown-item\" href=\"byCate?cate=2\">Videojuegos</a>\n");
      out.write("                                                    <a class=\"dropdown-item\" href=\"byCate?cate=3\">Joysticks</a>\n");
      out.write("                                                </div>\n");
      out.write("                                            </div>\n");
      out.write("                                        </li>\n");
      out.write("                                        <li class=\"nav-item\">\n");
      out.write("                                            <a class=\"nav-link\" href=\"getCar\">Carrito</a>\n");
      out.write("                                        </li>\n");
      out.write("                                </div>\n");
      out.write("                                </ul>\n");
      out.write("                                    \n");
      out.write("                                <div class=\"search-container\">\n");
      out.write("                                    <form action=\"showallPRD\">\n");
      out.write("                                        <input type=\"text\" placeholder=\"Buscar...\" name=\"search\" autocomplete=\"off\">\n");
      out.write("                                        <input class=\"btn btn-outline-secondary\" type=\"submit\" name=\"buscar\" text=\"buscar\" id=\"boton2\">\n");
      out.write("                                    </form>\n");
      out.write("                                </div>\n");
      out.write("                            </nav>\n");
      out.write("                            <nav class=\"navbar navbar-expand-lg navbar-light bg-light\">\n");
      out.write("                                ");
 if (name2!= null){ 
      out.write("\n");
      out.write("                                ");
 if(name3 != 0) {
      out.write("\n");
      out.write("                                    <img src=\"GetPerfilImage?idUser=");
      out.print(name3);
      out.write("\" height=\"60\" width=\"60\">\n");
      out.write("                                    ");
 } else{
      out.write("\n");
      out.write("                                    <img src=\"img/AngusAdmin.jpg\" height=\"60\" width=\"60\">\n");
      out.write("                                    ");
 }
      out.write("\n");
      out.write("                                    ");
  } else{ 
      out.write("\n");
      out.write("                                        <img src=\"img/Gamewatch.png\" style=\"width: 40px; height: 40px; border-radius: 50%; float: left;\" alt=\"Mr.Game&Watch\" height=\"60\" width=\"60\">\n");
      out.write("                                        ");
 }
      out.write("\n");
      out.write("                                                <a class=\"text\">   \n");
      out.write("                                                ");
 if (name2!= null){ 
      out.write("\n");
      out.write("                                                ");
 if(name2 == "administrador"){ 
      out.write("\n");
      out.write("                                                Admin\n");
      out.write("                                                ");
}else{ 
      out.write("\n");
      out.write("                                                ");
      out.print( name2     );
      out.write(' ');
      out.print( name1);
      out.write("\n");
      out.write("                                                ");
 } 
      out.write("\n");
      out.write("                                                ");
  } else{
      out.write("\n");
      out.write("                                                Usuario Anonimo\n");
      out.write("                                                ");
 } 
      out.write("\n");
      out.write("                                                </a>\n");
      out.write("                            </nav>\n");
      out.write("                            ");
 if(name2=="administrador"){ 
      out.write("\n");
      out.write("                                ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "navbaradm.jsp", out, false);
      out.write("\n");
      out.write("                                ");

                                    }
                                
      out.write("\n");
      out.write("                    </body>\n");
      out.write("\n");
      out.write("                    </html>\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}