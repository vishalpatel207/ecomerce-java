<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>JSTL fmt Tag Demo</title>
	<style>
		body{font-family:Arial,Helvetica,sans-serif;margin:24px}
		code{background:#f6f8fa;padding:2px 4px;border-radius:4px}
		section{margin:16px 0;padding:12px;border:1px solid #ddd;border-radius:8px}
		section h2{margin:0 0 8px 0;font-size:18px}
		.pre{white-space:pre-wrap}
	</style>
</head>
<body>

	<fmt:setLocale value="en_US" />
	<fmt:setTimeZone value="UTC" />
	<fmt:setBundle basename="messages" />

	<section>
		<h2>1. &lt;fmt:formatNumber&gt;</h2>
		<c:set var="num" value="12345.6789"/>
		<p>Raw: ${num}</p>
		<p>Integer: <fmt:formatNumber value="${num}" type="number" maxFractionDigits="0"/></p>
		<p>Two decimals: <fmt:formatNumber value="${num}" type="number" maxFractionDigits="2"/></p>
		<p>Currency: <fmt:formatNumber value="${num}" type="currency"/></p>
		<p>Percent (0.256): <fmt:formatNumber value="0.256" type="percent"/></p>
	</section>

	<section>
		<h2>2. &lt;fmt:parseNumber&gt;</h2>
		<c:set var="numText" value="12,345.67"/>
		<p>Text: "${numText}" → Parsed: <fmt:parseNumber var="parsed" value="${numText}"/>
		${parsed}
		</p>
	</section>

	<section>
		<h2>3. &lt;fmt:formatDate&gt;</h2>
		<jsp:useBean id="now" class="java.util.Date" />
		<p>Default: <fmt:formatDate value="${now}" type="both"/></p>
		<p>Date (long): <fmt:formatDate value="${now}" type="date" dateStyle="long"/></p>
		<p>Time (short): <fmt:formatDate value="${now}" type="time" timeStyle="short"/></p>
		<p>Pattern: <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss z"/></p>
	</section>

	<section>
		<h2>4. &lt;fmt:parseDate&gt;</h2>
		<c:set var="dateText" value="2025-01-15 14:30:00"/>
		<fmt:parseDate value="${dateText}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate"/>
		<p>Text: "${dateText}" → Parsed: <fmt:formatDate value="${parsedDate}" type="both"/></p>
	</section>

	<section>
		<h2>5. &lt;fmt:bundle&gt; and 7. &lt;fmt:setBundle&gt;</h2>
		<p><strong>Using global bundle (set above)</strong>:</p>
		<p><fmt:message key="welcome"/></p>
		<p><fmt:message key="hello.name">
			<fmt:param value="Developer"/>
		</fmt:message></p>
		<p><strong>Using nested bundle</strong>:</p>
		<fmt:bundle basename="messages">
			<p><fmt:message key="number.example"><fmt:param value="123"/></fmt:message></p>
		</fmt:bundle>
	</section>

	<section>
		<h2>6. &lt;fmt:setLocale&gt;</h2>
		<p>Current locale: en_US (set at top). Example currency: <fmt:formatNumber value="1234.5" type="currency"/></p>
		<fmt:setLocale value="fr_FR"/>
		<p>After changing to fr_FR: <fmt:formatNumber value="1234.5" type="currency"/></p>
		<fmt:setLocale value="en_US"/>
	</section>

	<section>
		<h2>8. &lt;fmt:timeZone&gt; and 9. &lt;fmt:setTimeZone&gt;</h2>
		<p>Global TZ (UTC): <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss z"/></p>
		
		<fmt:timeZone value="Asia/Kolkata">
			<p>Inside block (Asia/Kolkata): <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss z"/></p>
		</fmt:timeZone>

		<fmt:setTimeZone value="America/New_York"/>
		<p>After global set to America/New_York: <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss z"/></p>
		<fmt:setTimeZone value="UTC"/>
	</section>

	<section>
		<h2>10. &lt;fmt:message&gt;</h2>
		<fmt:parseNumber value="0.75" var="percentVal"/>
		<p><fmt:message key="percent.example"><fmt:param value="${percentVal}"/></fmt:message></p>
	</section>

	<section>
		<h2>11. &lt;fmt:requestEncoding&gt;</h2>
		<fmt:requestEncoding value="UTF-8"/>
		<p>Request encoding set to UTF-8. Try passing a name param with unicode, e.g. <code>?name=%E0%A4%B0%E0%A4%BE%E0%A4%AE</code></p>
	</section>

	<footer>
		<p class="pre">Tip: Change locale via URL: <code>?jakarta.servlet.jsp.jstl.fmt.locale=hi_IN</code></p>
	</footer>
</body>
</html>
