from flask import Flask, request, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  # allow frontend (HTML/JS) to connect

# Simple knowledge base (expand as needed)
faq_responses = {
    "hello": "Hi! I am your SakhiCare assistant. How can I help you today?",
    "hi": "Hello! I’m here to support you with women’s health queries.",
    "menstrual health": "Menstrual health is important. Remember to maintain hygiene, change pads every 4–6 hours, and stay hydrated.",
    "cancer": "Early detection is key. Regular checkups and self-examination can help prevent complications.",
    "mental health": "Taking care of mental health is as important as physical health. Try meditation, deep breathing, or talking to a trusted friend.",
    "diet": "A balanced diet with green vegetables, fruits, and enough water is important for women’s health.",
    "exercise": "Simple yoga and daily exercise can improve your physical and mental health."
}

@app.route("/chat", methods=["POST"])
def chat():
    data = request.json
    user_message = data.get("query", "").lower()

    # Find a matching reply
    reply = "I'm here to help! Could you please rephrase your question?"
    for key in faq_responses:
        if key in user_message:
            reply = faq_responses[key]
            break

    return jsonify({"reply": reply})

if __name__ == "__main__":
    app.run(port=5000, debug=True)
