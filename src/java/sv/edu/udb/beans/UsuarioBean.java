/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.udb.beans;

/**
 *
 * @author Victor López
 */

import java.sql.*;
import sv.edu.udb.database.Conexion;

public class UsuarioBean {
    private int usuario_id;
    private String nombres;
    private String apellidos;
    private String usuario;
    private String email;
    private String password;
    private int tipo;
    private int estado;

    Conexion conex;

    /**
     * @return the usuario_id
     */
    public int getUsuario_id() {
        return usuario_id;
    }

    /**
     * @param usuario_id the usuario_id to set
     */
    public void setUsuario_id(int usuario_id) {
        this.usuario_id = usuario_id;
    }

    /**
     * @return the nombres
     */
    public String getNombres() {
        return nombres;
    }

    /**
     * @param nombres the nombres to set
     */
    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    /**
     * @return the apellidos
     */
    public String getApellidos() {
        return apellidos;
    }

    /**
     * @param apellidos the apellidos to set
     */
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    /**
     * @return the usuario
     */
    public String getUsuario() {
        return usuario;
    }

    /**
     * @param usuario the usuario to set
     */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the tipo
     */
    public int getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the estado
     */
    public int getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(int estado) {
        this.estado = estado;
    }
    
    public String getagregarUsuario() {
        String sql = "INSERT INTO usuarios (tipo_usuario, usuario, nombres, apellidos, correo, contraseña, estado) VALUES ("
                + getTipo() + ", "
                + "'" + getUsuario() + "', "
                + "'" + getNombres() + "', "
                + "'" + getApellidos() + "', "
                + "'" + getEmail() + "', "
                + "'" + getPassword() + "', "
                + getEstado() + ")";
        String message = "";

        try {
            conex = new Conexion();
            
            conex.setQuery(sql);

            message = "Jefe ingresado con exito";
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return message;
    }

    public String geteditarUsuario() {
        String sql = "";

        if (getPassword() == null) {
            sql = "UPDATE usuarios SET "
                    + "usuario = '" + getUsuario() + "', "
                    + "nombres = '" + getNombres() + "', "
                    + "apellidos = '" + getApellidos() + "', "
                    + "correo = '" + getEmail() + "', "
                    + "estado = " + getEstado() + ""
            + " WHERE usuario_id = " + getUsuario_id();
        } else {
            sql = "UPDATE usuarios SET "
                    + "usuario = '" + getUsuario() + "', "
                    + "nombres = '" + getNombres() + "', "
                    + "apellidos = '" + getApellidos() + "', "
                    + "correo = '" + getEmail() + "', "
                    + "contraseña = '" + getPassword() + "', "
                    + "estado = " + getEstado() + ""
            + " WHERE usuario_id = " + getUsuario_id();
        }

        String message = "";

        try {
            conex = new Conexion();
            
            conex.setQuery(sql);

            message = "Jefe actualizado con exito";
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return message;
    }

    public String getborrarJefe() {
        String sql = "DELETE FROM usuarios WHERE usuario_id = " + getUsuario_id();
        String message = "";

        try {
            conex = new Conexion();
            
            conex.setQuery(sql);

            message = "Jefe eliminado con exito";
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return message;
    }
}
