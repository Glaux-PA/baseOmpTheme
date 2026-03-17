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

  // Usamos $(document).on para asegurar que funcione aunque el botón se cargue por AJAX
  $(document).on("click", ".citation_formats_button", function(e) {
      e.preventDefault();
      e.stopPropagation(); // Evita que el clic se propague a otros elementos

      var $listaFormatos = $("#cslCitationFormats");
      
      // Forzamos la eliminación de cualquier atributo 'hidden' nativo de HTML5 
      // que OMP pudiera haber insertado y que toggleClass no toca.
      if ($listaFormatos.attr("hidden")) {
          $listaFormatos.removeAttr("hidden");
      }

      // Cambiamos la clase
      $listaFormatos.toggleClass("hidden-element");

      // Sincronizamos los estados de accesibilidad
      var isVisible = !$listaFormatos.hasClass("hidden-element");
      $(this).attr("aria-expanded", isVisible);
      $listaFormatos.attr("aria-hidden", !isVisible);
      
      // Log para debug (puedes borrarlo luego)
      console.log("Menú de citas toggle: ", isVisible ? "Visible" : "Oculto");
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