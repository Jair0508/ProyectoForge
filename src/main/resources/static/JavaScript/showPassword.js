document
  .getElementById("showPasswordIcon")
  .addEventListener("click", function () {
    var passwordInput = document.getElementById("passwordInput");
    var passwordConfirmationInput = document.getElementById(
      "passwordConfirmationInput"
    );

    if (passwordInput.type === "password") {
      passwordInput.type = "text";
      passwordConfirmationInput.type = "text";
      this.classList.remove("fa-eye");
      this.classList.add("fa-eye-slash");
    } else {
      passwordInput.type = "password";
      passwordConfirmationInput.type = "password";
      this.classList.remove("fa-eye-slash");
      this.classList.add("fa-eye");
    }
  });
