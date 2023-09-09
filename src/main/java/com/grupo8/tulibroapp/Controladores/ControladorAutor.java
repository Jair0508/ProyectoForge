package com.grupo8.tulibroapp.Controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.grupo8.tulibroapp.Modelos.LibroVenta;
import com.grupo8.tulibroapp.Modelos.Usuario;
import com.grupo8.tulibroapp.Servicio.ServicioAutor;
import com.grupo8.tulibroapp.Servicio.ServicioLibroVenta;
import com.grupo8.tulibroapp.Servicio.ServicioUsuario;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/autores")
public class ControladorAutor {
    @Autowired
    private ServicioLibroVenta servicioLibroVenta;

    @Autowired
    private ServicioUsuario servicioUsuario;

    @Autowired
    private ServicioAutor servicioAutor;

    @GetMapping("/{pageNumber}")
    public String listAutor(@PathVariable("pageNumber") int pageNumber, Model model, HttpSession session) {
        Page<Autor> paginaAutor = servicioAutor.autorPorPage(pageNumber - 1);
        Long usuarioId = (Long) session.getAttribute("userId");
        int totalPages = paginaAutor.getTotalPages();
        List<Autor> listaFrases = servicioAutor.findAllRandomOrder();
        model.addAttribute("listaFrases", listaFrases);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("paginaAutor", paginaAutor);

        if (usuarioId != null) {
            Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
            model.addAttribute("usuarioEmail", usuarioEmail);
            return "listaAutores.jsp";
        }
        return "listaAutores.jsp";
    }

    @GetMapping("/{autorId}/libros")
    public String mostrarListaDeLibrosPorAutor(
            @PathVariable("autorId") Long autorId,
            @RequestParam(name = "page", defaultValue = "0") int pageNumber,
            Model model, HttpSession session,
            RedirectAttributes redirectAttributes) {

        Page<LibroVenta> paginaLibrosPorAutor = servicioLibroVenta.obtenerLibroPorAutor(autorId, pageNumber, 2);
        Long usuarioId = (Long) session.getAttribute("userId");
        Autor autor = servicioAutor.findById(autorId);
        List<Autor> listaFrases = servicioAutor.findAllRandomOrder();
        model.addAttribute("listaFrases", listaFrases);
        model.addAttribute("paginaLibrosPorAutor", paginaLibrosPorAutor);
        model.addAttribute("autor", autor);

        if (usuarioId != null) {
            Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
            model.addAttribute("usuarioEmail", usuarioEmail);
            return "libreriaAutor.jsp";
        }

        return "libreriaAutor.jsp";
    }

    @GetMapping("/anexar/autor")
    public String formAutor(@ModelAttribute("autor") Autor autor, HttpSession session, Model model) {
        Long usuarioId = (Long) session.getAttribute("userId");

        if (usuarioId != null && usuarioId != 1) {
            return "redirect:/principal";
        }

        if (usuarioId == null) {
            return "redirect:/usuario/login";
        } else {
            List<Autor> listaFrases = servicioAutor.findAllRandomOrder();
            Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
            model.addAttribute("listaFrases", listaFrases);
            model.addAttribute("usuarioEmail", usuarioEmail);
            return "registroAutor.jsp";
        }

    }

    @PostMapping("/anexar/autor")
    public String anexarAutor(@Valid @ModelAttribute("autor") Autor autor, BindingResult result, Model model,
            RedirectAttributes redirectAttributes) {

        if (result.hasErrors()) {
            return "registroAutor.jsp";
        }

        Autor unico = servicioAutor.findByNombre(autor.getNombre());
        if (unico != null) {
            FieldError error = new FieldError("nombre", "nombre",
                    autor.getNombre() + " ya se encuentra registrado.");
            result.addError(error);
            return "registroAutor.jsp";
        }

        redirectAttributes.addFlashAttribute("realizado", "Autor guardado");
        servicioAutor.save(autor);
        return "redirect:/autores/anexar/autor";
    }

    @GetMapping("/{autorId}/editar")
    public String editarAutor(@PathVariable("autorId") Long autorId, Model model, HttpSession session,
            RedirectAttributes redirectAttributes) {
        Long usuarioId = (Long) session.getAttribute("userId");

        if (usuarioId == null) {
            return "redirect:/usuario/login";

        } else if (usuarioId != null && usuarioId != 1) {
            return "redirect:/principal";
        } else {
            Autor autor = servicioAutor.findById(autorId);
            model.addAttribute("autor", autor);
            List<LibroVenta> libroNoNull = servicioLibroVenta.findByAutor(autor);
            List<LibroVenta> libroNull = servicioLibroVenta.findByAutorIsNull();
            Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
            List<Autor> listaFrases = servicioAutor.findAllRandomOrder();
            model.addAttribute("listaFrases", listaFrases);
            model.addAttribute("libroNoNull", libroNoNull);
            model.addAttribute("libroNull", libroNull);
            model.addAttribute("usuarioEmail", usuarioEmail);
            return "editarAutor.jsp";
        }
    }

    @PutMapping("/{autorId}/editar")
    public String auttorEditado(@Valid @ModelAttribute("autor") Autor autor, BindingResult result,
            @PathVariable("autorId") Long autorId, RedirectAttributes redirectAttributes, Model model,
            HttpSession session) {
        Long usuarioId = (Long) session.getAttribute("userId");
        Usuario usuarioEmail = servicioUsuario.findById(usuarioId);
        model.addAttribute("usuarioEmail", usuarioEmail);

        Autor unicoAutor = servicioAutor.findByNombre(autor.getNombre());
        if (unicoAutor != null) {
            unicoAutor.setNombre(autor.getNombre());
        }

        if (result.hasErrors()) {
            List<LibroVenta> libroNoNull = servicioLibroVenta.findByAutor(autor);
            List<LibroVenta> libroNull = servicioLibroVenta.findByAutorIsNull();
            List<Autor> listaFrases = servicioAutor.findAllRandomOrder();
            model.addAttribute("listaFrases", listaFrases);
            model.addAttribute("usuarioEmail", usuarioEmail);
            model.addAttribute("libroNoNull", libroNoNull);
            model.addAttribute("libroNull", libroNull);
            model.addAttribute("autor", autor);
            return "editarAutor.jsp";
        }

        Autor editarAutor = servicioAutor.findById(autorId);
        if (editarAutor != null) {
            editarAutor.setNombre(autor.getNombre());
            editarAutor.setDescripcion(autor.getDescripcion());
            editarAutor.setFrase(autor.getFrase());
            servicioAutor.update(editarAutor);
        }

        redirectAttributes.addFlashAttribute("realizado", "Se actualizo Correctamente");
        return "redirect:/autores/" + autorId + "/editar";
    }

    @PostMapping("/{autorId}/remover/{libroId}")
    public String remover(@PathVariable("autorId") Long autorId, @PathVariable("libroId") Long libroId,
            RedirectAttributes redirectAttributes) {
        LibroVenta removerLibro = servicioLibroVenta.findById(libroId);
        removerLibro.setAutor(null);
        servicioLibroVenta.save(removerLibro);
        redirectAttributes.addFlashAttribute("removido", "Se removio del Autor");
        return "redirect:/autores/" + autorId + "/editar";
    }

    @PostMapping("/{autorId}/agregar")
    public String agregar(@PathVariable("autorId") Long autorId, @RequestParam("libroId") Long libroId,
            RedirectAttributes redirectAttributes) {
        Autor agregueAutor = servicioAutor.findById(autorId);
        LibroVenta agregueLibro = servicioLibroVenta.findById(libroId);
        List<LibroVenta> libroList = agregueAutor.getLibroVentas();

        libroList.add(agregueLibro);
        agregueAutor.setLibroVentas(libroList);
        agregueLibro.setAutor(agregueAutor);
        servicioAutor.save(agregueAutor);
        redirectAttributes.addFlashAttribute("agregado", "Se agrego al autor");
        return "redirect:/autores/" + autorId + "/editar";
    }
}
