function sendMessage() {
    // Obtiene el mensaje del campo de entrada
    var message = document.getElementById("message-input").value;

    // Crea un nuevo elemento de mensaje y lo agrega al área de mensajes
    var messageElement = document.createElement("div");
    messageElement.classList.add("message");
    messageElement.textContent = "Tú: " + message;

    // Agrega el mensaje al área de mensajes
    var messageArea = document.querySelector(".message-area");
    messageArea.appendChild(messageElement);

    // Borra el contenido del campo de entrada
    document.getElementById("message-input").value = "";

    // Desplázate hacia abajo para mostrar el mensaje más reciente
    messageArea.scrollTop = messageArea.scrollHeight;
}