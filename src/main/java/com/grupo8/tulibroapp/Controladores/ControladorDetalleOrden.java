package com.grupo8.tulibroapp.Controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.grupo8.tulibroapp.Modelos.DetalleOrden;
import com.grupo8.tulibroapp.Modelos.Libro;
import com.grupo8.tulibroapp.Modelos.Usuario;
import com.grupo8.tulibroapp.Servicio.ServicioDetalleOrden;
import com.grupo8.tulibroapp.Servicio.ServicioLibro;
import com.grupo8.tulibroapp.Servicio.ServicioUsuario;
import com.grupo8.tulibroapp.validaciones.DetalleOrdenVlidator;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/orden")
public class ControladorDetalleOrden {

    @Autowired
    private ServicioDetalleOrden servicioDetalleOrden;

    @Autowired
    private DetalleOrdenVlidator detalleOrdenVlidator;

    @Autowired
    private ServicioLibro servicioLibro;

    @Autowired
    private ServicioUsuario servicioUsuario;

    @GetMapping("/confirmar/{libro}")
    public String showConfirmarCompra(@PathVariable("libro") Long libroId, Model model) {
        Libro libro = servicioLibro.findById(libroId);
        model.addAttribute("libro", libro);
        return "confirmarCompra.jsp";
    }

    @GetMapping("/compra/{libroId}")
    public String crudDestalleOrden(@ModelAttribute("detalleOrden") DetalleOrden orden,
            @PathVariable("libroId") Long libroId, Model model) {
        return "registroDetalleOrden.jsp";
    }

    @PostMapping("/compra/{libroId}")
    public String comprarProducto(@Valid @ModelAttribute("detalleOrden") DetalleOrden orden,
            @PathVariable("libroId") Long libroId, BindingResult result, HttpSession session) {
        detalleOrdenVlidator.validate(orden, result);
        if (result.hasErrors()) {
            return "registroDetalleOrden.jsp";
        }
        Long usuarioId = (Long) session.getAttribute("userId");
        Usuario usuario = servicioUsuario.findById(usuarioId);

        Libro libro = servicioLibro.findById(libroId);

        orden.setDetalle_De_orden(
                "Nombre Del Usuario:" + usuario.getName() + "\n" + "Id Del Usuario: " + usuario.getId() + "\n"
                        + "Titulo Del Libro: " + libro.getNombre() + "\n" + "Autor"
                        + libro.getAutor().getNombre() + "\n" + "Genero: " + libro.getGenero().getNombreGenero()
                        + "\n" + "Cantidad: " + orden.getCantidad() + "\n" + "Precio Total: "
                        + (orden.getCantidad() * libro.getPrecio()));
        orden.setLibro(libro);
        orden.setUsuario(usuario);

        libro.setCantidad(libro.getCantidad() - orden.getCantidad());

        servicioLibro.save(libro);
        servicioDetalleOrden.save(orden);
        return "redirect:/principal";
    }

    @GetMapping("/lista")
    public String historial_ordenes(HttpSession session, Model model) {
        Long usuarioId = (Long) session.getAttribute("userId");
        List<DetalleOrden> listOrdenes = servicioDetalleOrden.getDetalleOrdenesByUsuarioId(usuarioId);
        model.addAttribute("listOrdenes", listOrdenes);
        return "historialDeOrdenes.jsp";
    }

    @PostMapping("/cancelar/{libroId}")
    public String cancelarProducto(@PathVariable("libroId") Long libroId, HttpSession session) {
        Long usuarioId = (Long) session.getAttribute("userId");
        Usuario usuario = servicioUsuario.findById(usuarioId);
        Libro libro = servicioLibro.findById(libroId);
        usuario.getLibrosOrdenes().remove(libro);
        return "redirect:/principal";
    }

}
