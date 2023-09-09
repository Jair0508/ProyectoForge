package com.grupo8.tulibroapp.Controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.grupo8.tulibroapp.Modelos.Autor;
import com.grupo8.tulibroapp.Modelos.Genero;
import com.grupo8.tulibroapp.Modelos.LibroVenta;
import com.grupo8.tulibroapp.Modelos.Usuario;
import com.grupo8.tulibroapp.Servicio.ServicioAutor;
import com.grupo8.tulibroapp.Servicio.ServicioGenero;
import com.grupo8.tulibroapp.Servicio.ServicioLibroVenta;
import com.grupo8.tulibroapp.Servicio.ServicioRol;
import com.grupo8.tulibroapp.Servicio.ServicioUsuario;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/libros")
public class ControladorLibroVenta {

     @Value("${rol_usuario}")
    private String USER;

    @Value("${rol_administrador}")
    private String ADMIN;

    @Autowired
    private ServicioRol servicioRol;

    @Autowired
    private ServicioUsuario servicioUsuario;

    @Autowired
    private ServicioLibroVenta servicioLibroVenta;

    @Autowired
    private ServicioAutor servicioAutor;

    @Autowired
    private ServicioGenero servicioGenero;

    @GetMapping("/{pageNumber}")
    public String venta(Model model, @PathVariable("pageNumber") int pageNumber, HttpSession session) {
        Page<LibroVenta> paginaLibros = servicioLibroVenta.libroVentaPerPage(pageNumber - 1);
        // el -1 resta un pagina al tamaño del totalpage, lo cual qiota el que se
        // muestra vacio

        int totalPages = paginaLibros.getTotalPages();
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("paginaLibros", paginaLibros);

        Long usuarioId = (Long) session.getAttribute("userId");
        if (usuarioId == null) {
            return "libreria.jsp";
        } else {
            Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
            model.addAttribute("usuarioEmail", usuarioEmail);
            return "libreria.jsp";
        }
    }

    @GetMapping("/anexar")
    public String formLibroGenero(@ModelAttribute("libro") LibroVenta libro,
            @ModelAttribute("genero") Genero genero, HttpSession session, Model model) {
        Long usuarioId = (Long) session.getAttribute("userId");

        if (usuarioId == null) {
            return "redirect:/usuario/login";
        } else if (usuarioId != null && usuarioId != 1) {
            return "redirect:/principal";
        } else {
            List<Genero> listaGeneros = servicioGenero.findAll();
            List<Autor> listaAutores = servicioAutor.findAll();
            Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
            model.addAttribute("listaGeneros", listaGeneros);
            model.addAttribute("listaAutores", listaAutores);
            model.addAttribute("usuarioEmail", usuarioEmail);
            return "registroLibros.jsp";
        }

    }

    @PostMapping("/anexar")
    public String anexarLibro(@Valid @ModelAttribute("libro") LibroVenta libro, BindingResult result, Model model,
            RedirectAttributes redirectAttributes) {
        List<Genero> listaGeneros = servicioGenero.findAll();
        List<Autor> listaAutores = servicioAutor.findAll();

        if (libro.getAutor() == null || libro.getAutor().getId() == null) {
            FieldError error = new FieldError("autor", "autor", "Debe seleccionar un autor.");
            result.addError(error);
            model.addAttribute("listaGeneros", listaGeneros);
            model.addAttribute("listaAutores", listaAutores);
            return "registroLibros.jsp";
        }

        if (result.hasErrors()) {
            model.addAttribute("listaGeneros", listaGeneros);
            model.addAttribute("listaAutores", listaAutores);
            return "registroLibros.jsp";
        }

        LibroVenta unicoLibro = servicioLibroVenta.findByNombre(libro.getNombre());
        if (unicoLibro != null) {
            FieldError error = new FieldError("nombre", "nombre",
                    libro.getNombre() + " ya se encuentra registrado.");
            result.addError(error);
            model.addAttribute("listaGeneros", listaGeneros);
            model.addAttribute("listaAutores", listaAutores);
            return "registroLibros.jsp";
        }

        Genero unicoGenero = servicioGenero.findByNombreGenero(libro.getGenero().getNombreGenero());
        if (unicoGenero != null) {
            libro.setGenero(unicoGenero);
        }

        redirectAttributes.addFlashAttribute("realizado", "Libro guardado");
        servicioLibroVenta.save(libro);
        servicioGenero.save(libro.getGenero());
        return "redirect:/libros/anexar";
    }

    @GetMapping("/{libroId}/libro")
    public String showLibro(@PathVariable("libroId") Long libroId, HttpSession session, Model model) {
        Long usuarioId = (Long) session.getAttribute("userId");
        Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
        LibroVenta libroVenta = servicioLibroVenta.findById(libroId);
        model.addAttribute("usuarioEmail", usuarioEmail);
        model.addAttribute("libro", libroVenta);
        return "libro.jsp";
    }

    @PostMapping("/buscar")
    public String buscar(@RequestParam(value = "search", required = false) String search, Model model,
            RedirectAttributes redirectAttributes, HttpSession session) {
        Long usuarioId = (Long) session.getAttribute("userId");

        if (search.isBlank()) {
            model.addAttribute("usuarioEmail", usuarioId);
            redirectAttributes.addFlashAttribute("noPresente", "No presente");
            return "redirect:/principal";
        }

        LibroVenta libro = servicioLibroVenta.findByNombreContainingIgnoreCase(search);
        if (libro == null) {
            model.addAttribute("usuarioEmail", usuarioId);
            redirectAttributes.addFlashAttribute("noPresente", "No presente");
            return "redirect:/principal";
        } else {
            model.addAttribute("libro", libro);
            return "libro.jsp";
        }

    }

    @GetMapping("/{libroId}/editar")
    public String libroEditar(@PathVariable("libroId") Long libroId, Model model, HttpSession session) {
        Long usuarioId = (Long) session.getAttribute("userId");
       

        // Buscar Admin
        // Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
        // Rol rolAdmin = servicioRol.findByNombreContaining(ADMIN);
        // //comparacion
        // if (usuarioEmail.getRol().getId() != rolAdmin.getId()) {
        //     return "redirect:/principal";
        // }

        if (usuarioId == null) {
            return "redirect:/usuario/login";
        } else if (usuarioId != null && usuarioId != 1) {
            return "redirect:/principal";
        } else {
            LibroVenta libro = servicioLibroVenta.findById(libroId);
            Autor autor = servicioAutor.findById(libro.getAutor().getId());
            Genero genero = servicioGenero.findById(libro.getGenero().getId());
            List<Autor> listaAutor = servicioAutor.findAll();
            Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
            List<Genero> listaGenero = servicioGenero.findAll();
            model.addAttribute("listaAutor", listaAutor);
            model.addAttribute("listaGenero", listaGenero);
            model.addAttribute("libro", libro);
            model.addAttribute("autor", autor);
            model.addAttribute("genero", genero);
            model.addAttribute("usuarioEmail", usuarioEmail);
            return "editarLibro.jsp";
        }
    }

    @PutMapping("/{libroId}/editar")
    public String libroEdicion(@Valid @ModelAttribute("libro") LibroVenta libro, BindingResult result,
            @PathVariable("libroId") Long libroId, RedirectAttributes redirectAttributes, Model model,
            HttpSession session) {
        Long usuarioId = (Long) session.getAttribute("userId");
        Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
        model.addAttribute("usuarioEmail", usuarioEmail);
        LibroVenta editarLibro = servicioLibroVenta.findById(libroId);

        if (result.hasErrors()) {
            model.addAttribute("libro", libro);
            return "editarLibro.jsp";
        }

        LibroVenta unicoLibro = servicioLibroVenta.findByNombre(libro.getNombre());
        if (unicoLibro != null) {
            unicoLibro.setNombre(libro.getNombre());
        }

        if (editarLibro != null) {

            editarLibro.setNombre(libro.getNombre());
            editarLibro.setDescripcion(libro.getDescripcion());
            editarLibro.setPrecio(libro.getPrecio());
            editarLibro.setCantidad(libro.getCantidad());
            servicioLibroVenta.update(editarLibro);
        }
        redirectAttributes.addFlashAttribute("realizado", "Se actualizo Correctamente");
        return "redirect:/libros/" + libroId + "/editar";
    }

}