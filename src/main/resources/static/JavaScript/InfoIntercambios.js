document.getElementById('password-tooltip-icon').addEventListener('mouseover', function () {
    var tooltip = document.createElement('div');
    tooltip.className = 'tooltip';
    tooltip.innerHTML = 'Si no esta presente su Autor o Genero, puede agregarlo en detalles extras';


    var iconPosition = this.getBoundingClientRect();
    tooltip.style.top = (iconPosition.top - 30) + 'px';
    tooltip.style.left = (iconPosition.left + 30) + 'px';

    document.body.appendChild(tooltip);

    this.addEventListener('mouseout', function () {
      document.body.removeChild(tooltip);
    });
  });