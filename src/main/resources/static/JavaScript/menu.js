function changeClass()
{
 document.getElementById("open-hide").classList.toggle('show');
}

window.onload = function() 
{
  document.getElementById("open-hide").addEventListener( 'click' , changeClass ); 
}