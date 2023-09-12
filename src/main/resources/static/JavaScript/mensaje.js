function sendMessage() {
   
    var message = document.getElementById("message-input").value;

    var messageElement = document.createElement("div");
    messageElement.classList.add("message");
    messageElement.textContent = "Tú: " + message;

    var messageArea = document.querySelector(".message-area");
    messageArea.appendChild(messageElement);

    document.getElementById("message-input").value = "";

    messageArea.scrollTop = messageArea.scrollHeight;
}