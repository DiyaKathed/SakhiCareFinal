document.getElementById("contactForm").addEventListener("submit", async function(e) {
  e.preventDefault();

  const name = document.getElementById("name").value;
  const email = document.getElementById("email").value;
  const message = document.getElementById("message").value;

  try {
    const response = await fetch("http://localhost:3000/contact", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ name, email, message })
    });

    const result = await response.json();

    if (result.success) {
      alert("✅ " + result.message);
      document.getElementById("contactForm").reset();
    } else {
      alert("❌ Something went wrong!");
    }
  } catch (error) {
    console.error("Error:", error);
    alert("⚠️ Could not connect to server.");
  }
});


// script.js

// Example: fetch data from backend
fetch('http://localhost:3000/api/someRoute', {
    method: 'GET',
})
.then(res => res.json())
.then(data => {
    console.log(data);
    // You can also display data on your page here
});
