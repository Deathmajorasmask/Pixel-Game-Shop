/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.27
 * Generated at: 2022-01-04 12:49:05 UTC
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

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("    \n");
      out.write("        \n");
      out.write("            \n");
      out.write("                \n");
      out.write("                    \n");
      out.write("                        <!DOCTYPE html>\n");
      out.write("                        <html>\n");
      out.write("                        <head>\n");
      out.write("\n");
      out.write("                            <meta charset=\"UTF-8\">\n");
      out.write("                            <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("                            <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n");
      out.write("\n");
      out.write("\n");
      out.write("                            <!-- Required meta tags -->\n");
      out.write("                            <meta charset=\"utf-8\">\n");
      out.write("                            <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("\n");
      out.write("                            <!-- Bootstrap CSS -->\n");
      out.write("                            <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\n");
      out.write("                            <link href=\"img/Register.css\">\n");
      out.write("                            <title>registro</title>\n");
      out.write("\n");
      out.write("                            <style>\n");
      out.write("                                div {\n");
      out.write("                                    padding-bottom: 15px;\n");
      out.write("                                }\n");
      out.write("                                \n");
      out.write("                                #ema {\n");
      out.write("                                    height: 40px;\n");
      out.write("                                    padding-bottom: 0px !important;\n");
      out.write("                                    padding-top: 0px !important;\n");
      out.write("                                }\n");
      out.write("                            </style>\n");
      out.write("                        </head>\n");
      out.write("\n");
      out.write("                        <body>\n");
      out.write("                            <script>\n");
      out.write("                                vF = 0;\n");
      out.write("                            </script>\n");
      out.write("                            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "navbar.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("Uname", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("fer", request.getCharacterEncoding()), out, false);
      out.write("\n");
      out.write("                            <script>\n");
      out.write("                                var vF = 0;\n");
      out.write("                            </script>\n");
      out.write("                            \n");
      out.write("                            \n");
      out.write("                            <div class=\"container\">\n");
      out.write("                                <form name=\"log\" method=\"POST\" action=\"AddUser\" enctype=\"multipart/form-data\">\n");
      out.write("                                    <br>\n");
      out.write("                                    <div class=\"row\">\n");
      out.write("                                        <div class=\"col\">\n");
      out.write("                                            <input type=\"text\" class=\"form-control\" placeholder=\"Nombre\" name=\"Fname\">\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"col\">\n");
      out.write("                                            <input type=\"text\" class=\"form-control\" placeholder=\"Apellidos\" name=\"Lname\">\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <div class=\"input-group mb-3\" id=\"ema\">\n");
      out.write("                                        <div class=\"input-group-prepend\">\n");
      out.write("                                            <span class=\"input-group-text\" id=\"email\">e-mail</span>\n");
      out.write("                                        </div>\n");
      out.write("                                        <input type=\"text\" id=\"Emadd\" class=\"form-control\" placeholder=\"ejemplo@gmail.com\" aria-label=\"Username\" aria-describedby=\"basic-addon1\" name=\"Email\">\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <div>\n");
      out.write("                                        <input type=\"text\" id=\"username\" placeholder=\"Nombre de Usuario\" class=\"form-control\" aria-describedby=\"passwordHelpBlock\" name=\"Nick\">\n");
      out.write("                                        <small id=\"passwordHelpBlock\" class=\"form-text text-muted\">\n");
      out.write("                            * 6 caracteres\n");
      out.write("                        </small>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <div>\n");
      out.write("                                        <label for=\"inputUser\">Numero de Telefono</label>\n");
      out.write("                                        <input type=\"text\" id=\"telefono\" class=\"form-control\" aria-describedby=\"passwordHelpBlock\" placeholder=\"solo digitos\" name=\"tele\">\n");
      out.write("                                        <small id=\"passwordHelpBlock\" class=\"form-text text-muted\">\n");
      out.write("                                * Hasta 10 digitos\n");
      out.write("                            </small>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <div>\n");
      out.write("                                        <label for=\"inputPassword5\">Contrase??a</label>\n");
      out.write("                                        <input type=\"password\" id=\"Password1\" class=\"form-control\" aria-describedby=\"passwordHelpBlock\" name=\"pass\">\n");
      out.write("                                        <small id=\"passwordHelpBlock\" class=\"form-text text-muted\">\n");
      out.write("                                    * 8 caracteres, 1 Mayuscula , 1 minuscula y 1 numero\n");
      out.write("                            </small>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <div>\n");
      out.write("                                        <label for=\"inputPassword5\">Confirmar Contrase??a</label>\n");
      out.write("                                        <input type=\"password\" id=\"Password2\" class=\"form-control\">\n");
      out.write("                                        <small id=\"passwordHelpBlock\" class=\"form-text text-muted\">\n");
      out.write("                                        * repita la contrase??a como verificaci??n\n");
      out.write("                            </small>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <div>\n");
      out.write("                                        <input type=\"text\" id=\"direc\" class=\"form-control\" placeholder=\"Direcci??n (opcional)\" aria-label=\"Username\" aria-describedby=\"basic-addon1\" name=\"dire\">\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label for=\"exampleFormControlFile1\">Imagen de Usuario</label>\n");
      out.write("                                        <input class=\"form-control\" type=\"file\" name=\"imageUser\" />\n");
      out.write("                                    </div>\n");
      out.write("                                    <div>\n");
      out.write("                                        ");
      out.write("\n");
      out.write("                                        <input class=\"form-control\" value=\"Registrarme\" type=\"submit\" name=\"Subir\" id=\"boton\">\n");
      out.write("                                            ");
      out.write("\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                </form>\n");
      out.write("                            </div>\n");
      out.write("                            <script language=\"javascript\" type=\"text/javascript\">\n");
      out.write("                                    function valida_envia() {\n");
      out.write("                                        var mayus = 0;\n");
      out.write("                                        var minus = 0;\n");
      out.write("                                        var num = 0;\n");
      out.write("\n");
      out.write("                                        const CHAR_0 = '0'.charCodeAt(0);\n");
      out.write("                                        const CHAR_9 = '9'.charCodeAt(0);\n");
      out.write("                                        //valido el nombre\n");
      out.write("                                        if (document.log.Password1.value.length < 8) {\n");
      out.write("                                            alert(\"la contrase??a tiene que ser minimo 8 caracteres\")\n");
      out.write("                                                //document.form1.titulo.focus()\n");
      out.write("                                            return 1;\n");
      out.write("                                        }\n");
      out.write("                                        for (var ind = 0; ind < document.log.Password1.value.length; ind++) {\n");
      out.write("                                            var cara = document.log.Password1.value.charAt(ind);\n");
      out.write("\n");
      out.write("                                            if (cara >= CHAR_0 || cara <= 9) {\n");
      out.write("                                                num++\n");
      out.write("                                            } else if (cara === cara.toUpperCase()) {\n");
      out.write("                                                mayus++;\n");
      out.write("                                            } else if (cara === cara.toLowerCase()) {\n");
      out.write("                                                minus++;\n");
      out.write("                                            }\n");
      out.write("                                        }\n");
      out.write("                                        if (mayus < 1) {\n");
      out.write("                                            alert(\"contrasena necesita al menos una MAYUSCULA\")\n");
      out.write("                                            return 1;\n");
      out.write("                                        }\n");
      out.write("                                        if (minus < 1) {\n");
      out.write("                                            alert(\"contrasena al menos una minuscula\")\n");
      out.write("                                            return 1;\n");
      out.write("                                        }\n");
      out.write("                                        if (num < 1) {\n");
      out.write("                                            alert(\"contrasena al menos un numero\")\n");
      out.write("                                            return 1;\n");
      out.write("                                        }\n");
      out.write("\n");
      out.write("                                        return 0;\n");
      out.write("                                    }\n");
      out.write("\n");
      out.write("                                    function valida_email() {\n");
      out.write("                                        if (/^\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{2,3})+$/.test(log.Emadd.value)) {\n");
      out.write("                                            return (0)\n");
      out.write("                                        }\n");
      out.write("                                        alert(\"correo electronico no valido\")\n");
      out.write("                                        return (1)\n");
      out.write("                                    }\n");
      out.write("\n");
      out.write("                                    function valida_pass() {\n");
      out.write("                                        if (document.log.Password1.value != document.log.Password2.value) {\n");
      out.write("                                            alert(\"copia de contrasena incorrecta\")\n");
      out.write("                                            return 1;\n");
      out.write("                                        }\n");
      out.write("                                        return 0;\n");
      out.write("                                    }\n");
      out.write("\n");
      out.write("                                    function valida_user() {\n");
      out.write("\n");
      out.write("                                        //valido el nombre\n");
      out.write("                                        if (document.log.username.value.length < 6) {\n");
      out.write("                                            alert(\"la el usuario tiene que ser minimo 6 caracteres\")\n");
      out.write("                                                //document.form1.titulo.focus()\n");
      out.write("                                            return 1;\n");
      out.write("                                        }\n");
      out.write("                                        return 0;\n");
      out.write("                                    }\n");
      out.write("\n");
      out.write("                                    function valida_telf() {\n");
      out.write("                                        var mayus = 0;\n");
      out.write("                                        var minus = 0;\n");
      out.write("                                        var num = 0;\n");
      out.write("                                        const CHAR_0 = '0'.charCodeAt(0);\n");
      out.write("                                        const CHAR_9 = '9'.charCodeAt(0);\n");
      out.write("                                        //valido el nombre\n");
      out.write("                                        if (document.log.telefono.value.length == 8 || document.log.telefono.value.length == 10) {\n");
      out.write("\n");
      out.write("                                            for (var ind = 0; ind < document.log.telefono.value.length; ind++) {\n");
      out.write("                                                var cara = document.log.telefono.value.charAt(ind);\n");
      out.write("\n");
      out.write("                                                if (cara >= CHAR_0 || cara <= 9) {\n");
      out.write("                                                    num++\n");
      out.write("                                                } else if (cara === cara.toUpperCase()) {\n");
      out.write("                                                    mayus++;\n");
      out.write("                                                } else if (cara === cara.toLowerCase()) {\n");
      out.write("                                                    minus++;\n");
      out.write("                                                }\n");
      out.write("                                            }\n");
      out.write("                                            if (mayus > 0 || minus > 0) {\n");
      out.write("                                                alert(\"telefono incorrecto\")\n");
      out.write("                                                return 1;\n");
      out.write("                                            } else return 0;\n");
      out.write("                                        } else {\n");
      out.write("                                            alert(\"telefono incorrecto\")\n");
      out.write("                                            return 1;\n");
      out.write("                                        }\n");
      out.write("                                    }\n");
      out.write("\n");
      out.write("                                    function validacionesPag() {\n");
      out.write("                                        vF = 0;\n");
      out.write("                                        vF = vF + valida_email();\n");
      out.write("                                        vF = vF + valida_user();\n");
      out.write("                                        vF = vF + valida_telf();\n");
      out.write("                                        vF = vF + valida_envia();\n");
      out.write("                                        vF = vF + valida_pass();\n");
      out.write("                                        //alert (vF);\n");
      out.write("                                        if (vF < 1) {\n");
      out.write("                                            href = \"iniciousu.html\"\n");
      out.write("                                        }\n");
      out.write("                                    }\n");
      out.write("                                </script>\n");
      out.write("                            <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n");
      out.write("                            <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\" integrity=\"sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1\" crossorigin=\"anonymous\"></script>\n");
      out.write("                            <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\" integrity=\"sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM\" crossorigin=\"anonymous\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("                        </body>\n");
      out.write("\n");
      out.write("                        </html>");
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
