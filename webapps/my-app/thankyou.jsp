<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%
String paymentId = request.getParameter("payment_id");
String phone = "8849058246"; // Your number
String message = "Payment successful! Razorpay Payment ID: " + paymentId;
String apiKey = "YOUR_FAST2SMS_API_KEY"; // Replace with your Fast2SMS API key
String senderId = "FSTSMS";
String urlStr = "https://www.fast2sms.com/dev/bulkV2?authorization=" + apiKey +
    "&route=v3&sender_id=" + senderId + "&message=" + URLEncoder.encode(message, "UTF-8") + "&language=english&flash=0&numbers=" + phone;

try {
    URL url = new URL(urlStr);
    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
    conn.setRequestMethod("GET");
    conn.setRequestProperty("accept", "application/json");
    int responseCode = conn.getResponseCode();
    StringBuilder response = new StringBuilder();
    BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
    String inputLine;
    while ((inputLine = in.readLine()) != null) {
        response.append(inputLine);
    }
    in.close();
    // Optionally, you can log or display the response
} catch (Exception e) {
    // Optionally, handle error
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Success</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container text-center" style="margin-top:100px;">
        <div class="card shadow p-5">
            <h1 class="text-success mb-3"><i class="fas fa-check-circle"></i> Payment Successful!</h1>
            <h4 class="mb-3">Thank you for your purchase.</h4>
            <p class="mb-2">Your payment ID: <b><%= paymentId %></b></p>
            <p class="text-muted">A confirmation SMS has been sent to <b>8849058246</b>.</p>
            <a href="index.jsp" class="btn btn-primary mt-3">Go to Home</a>
        </div>
    </div>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</body>
</html>
