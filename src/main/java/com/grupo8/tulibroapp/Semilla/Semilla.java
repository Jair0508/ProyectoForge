package com.grupo8.tulibroapp.Semilla;

import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import com.grupo8.tulibroapp.Modelos.Rol;
import com.grupo8.tulibroapp.Modelos.Usuario;
import com.grupo8.tulibroapp.Servicio.ServicioRol;
import com.grupo8.tulibroapp.Servicio.ServicioUsuario;

@Component
public class Semilla implements ApplicationRunner {

    @Value("${rol_usuario}")
    private String USER;

    @Value("${rol_administrador}")
    private String ADMIN;

    private String prefix = "ROL_";

    @Autowired
    private ServicioRol servicioRol;

    @Autowired
    private ServicioUsuario servicioUsuario;

    @Override
    public void run(ApplicationArguments args) throws Exception {
        List<Rol> roles = servicioRol.findAll();
        if(roles.isEmpty()){
            creaRoles();
        }

        List<Usuario> usuarios = servicioUsuario.findAll();
        if(usuarios.isEmpty()){
            creaAdmin();
        }
    }

    public void creaAdmin(){
        Usuario usuarios = new Usuario();
        usuarios.setEmail("admin@admin.com");
        usuarios.setName("Administrador");

        Rol rol = servicioRol.findByNombreContaining(ADMIN);
        usuarios.setRol(rol);

        String encripPassword = "1234567l";
        String hashedPassword = BCrypt.hashpw(encripPassword, BCrypt.gensalt());
        usuarios.setPassword(hashedPassword);
        servicioUsuario.save(usuarios);
    }

    public void creaRoles(){
        List<Rol> roles = new ArrayList<>();
        Rol rol = new Rol();
        rol.setNombre(prefix + USER);
        roles.add(rol);

        rol = new Rol();
        rol.setNombre(prefix + ADMIN);
        roles.add(rol);

        servicioRol.saveAll(roles);
    }

}
