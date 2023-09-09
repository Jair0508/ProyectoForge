document.getElementById('password-tooltip-icon').addEventListener('mouseover', function () {
    var tooltip = document.createElement('div');
    tooltip.className = 'tooltip';
    tooltip.innerHTML = 'Ingrese solo 8 caracteres entre letras y números';


    var iconPosition = this.getBoundingClientRect();
    tooltip.style.top = (iconPosition.top - 30) + 'px';
    tooltip.style.left = (iconPosition.left + 30) + 'px';

    document.body.appendChild(tooltip);

    this.addEventListener('mouseout', function () {
      document.body.removeChild(tooltip);
    });
  });