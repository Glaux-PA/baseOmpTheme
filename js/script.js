$(document).ready(function () {
  //Menu > mostrar submenu
  $(".submenu")
    .parent()
    .click(function () {
      $(this).children("ul").toggleClass("hidden-element");
    });

  // Click menú hamburguesa
  $(".is-mobile .btn-menu").click(function () {
    $(".overlay-menu-wrapper").toggleClass("hidden-element");
    $(".overlay-menu-wrapper").toggleClass("is-open");
  });

// Escuchamos el clic en el botón "Más formatos de cita"
    $(".citation_formats_button").on("click", function(e) {
        e.preventDefault(); // Evita cualquier comportamiento por defecto del botón
        
        // El contenedor de la lista en OMP tiene el ID #cslCitationFormats
        var $listaFormatos = $("#cslCitationFormats");
        
        // Alternamos la visibilidad
        // Nota: OMP suele usar la clase 'hidden-element' o el atributo 'aria-hidden'
        $listaFormatos.toggleClass("hidden-element");

        // Actualizamos el estado de accesibilidad para que el navegador sepa que se desplegó
        var isHidden = $listaFormatos.hasClass("hidden-element");
        $(this).attr("aria-expanded", !isHidden);
        $listaFormatos.attr("aria-hidden", isHidden);
    });



  $("#close_button_authors_list").click(function () {
    $(".modal_window_wrapper.authors_list").toggleClass("hidden-element");
  });

  //Search > añadir clases
  $(".search_advanced label").addClass("form-label");
  $(".search_advanced select").addClass("form-select");

  // Click "Búsqueda avanzada"
  $(".page_search .search_advanced_title").click(function () {
    $(".page_search .search_advanced").toggleClass("hidden-element");
  });

  document
    .querySelectorAll(".btn-authors-first-letter li")
    .forEach((letter) => {
      letter.addEventListener("click", (event) => {
        const currentLetter = document.querySelector(
          ".btn-authors-first-letter li.select"
        );
        if (currentLetter) {
          currentLetter.classList.remove("select");
        }

        letter.classList.add("select");
        const selectedLetter = letter.getAttribute("data-letter");
        document
          .querySelectorAll(".letter-block-list-wrapper")
          .forEach((block) => {
            const displayValue =
              block.getAttribute("data-letter") == selectedLetter ||
              selectedLetter == "all"
                ? "block"
                : "none";
            block.style.display = displayValue;
          });
      });
    });
  const firstLetter = document.querySelector(
    ".btn-authors-first-letter li:first-child"
  );
  if (firstLetter) {
    firstLetter.click();
  }

  if (
    document.querySelector(".pkp_page_about") ||
    document.querySelector(".pkp_page_indexacio")
  ) {
    const titulos = document
      .querySelector(".pkp_structure_content")
      .getElementsByTagName("h3");
    const container = document.createElement("ul");
    container.className = "aboutToc";

    for (const titulo of titulos) {
      const li = document.createElement("li");
      li.innerHTML = titulo.innerText;
      li.addEventListener("click", () => {
        titulo.scrollIntoView({ behavior: "smooth" });
      });
      container.append(li);
    }
    document.querySelector(".h1_title").after(container);
  }
});