<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/style.css?v=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    .offcanvas {
        max-width: 85% !important;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        line-height: 1.6;
        color: #333;
        background-color: #f8f9fa;
    }

    .navbar {
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
        position: fixed !important;
        top: 0 !important;
        left: 0 !important;
        right: 0 !important;
        z-index: 1000 !important;
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
    }

    .nav-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        height: 70px;
    }

    .nav-brand {
        display: flex;
        align-items: center;
        gap: 10px;
        font-size: 1.8rem;
        font-weight: 700;
        color: #667eea;
        text-decoration: none;
    }

    .nav-brand i {
        font-size: 2rem;
    }

    .nav-search {
        display: flex;
        align-items: center;
        background: #f8f9fa;
        border-radius: 25px;
        padding: 8px 15px;
        flex: 1;
        max-width: 400px;
        margin: 0 20px;
    }

    .search-input {
        border: none;
        background: transparent;
        outline: none;
        flex: 1;
        padding: 5px 10px;
        font-size: 14px;
    }

    .search-btn {
        background: #667eea;
        border: none;
        color: white;
        padding: 5px 11px;
        border-radius: 50%;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .nav-links {
        display: flex;
        gap: 30px;
    }

    .nav-link {
        color: #4a5568;
        text-decoration: none;
        font-weight: 500;
        transition: color 0.3s ease;
        position: relative;
    }

    .nav-link:hover,
    .nav-link.active {
        color: #667eea;
    }

    .nav-actions {
        display: flex;
        gap: 20px;
        padding-left: 20px;
    }

    .nav-icon {
        color: #4a5568;
        font-size: 1.2rem;
        text-decoration: none;
        transition: all 0.3s ease;
    }

    .nav-icon:hover {
        color: #667eea;
        transform: scale(1.1);
    }

    .user-info {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .welcome-text {
        color: #667eea;
        font-weight: 600;
        font-size: 14px;
        background: rgba(102, 126, 234, 0.1);
        padding: 5px 12px;
        border-radius: 15px;
        white-space: nowrap;
    }

    .navbar .btn.d-lg-none {
        border: 1px solid #e2e8f0;
    }

    .success-message {
        position: fixed;
        top: 80px;
        left: 50%;
        transform: translateX(-50%);
        background: linear-gradient(135deg, #48bb78 0%, #38a169 100%);
        color: white;
        padding: 15px 25px;
        border-radius: 8px;
        box-shadow: 0 10px 25px rgba(72, 187, 120, 0.3);
        z-index: 1001;
        display: flex;
        align-items: center;
        gap: 10px;
        animation: slideDown 0.3s ease-out;
        max-width: 90%;
    }

    .success-message .close-btn {
        background: none;
        border: none;
        color: white;
        font-size: 20px;
        cursor: pointer;
        padding: 0;
        margin-left: 10px;
        opacity: 0.8;
        transition: opacity 0.3s ease;
    }

    .success-message .close-btn:hover {
        opacity: 1;
    }

    @keyframes slideDown {
        from {
            opacity: 0;
            transform: translateX(-50%) translateY(-20px);
        }
        to {
            opacity: 1;
            transform: translateX(-50%) translateY(0);
        }
    }

    /* Mobile First Responsive Design */
    @media (max-width: 1200px) {
        .container {
            max-width: 100%;
            padding: 0 15px;
        }
    }

    @media (max-width: 992px) {
        .nav-links {
            display: none !important;
        }

        .mobile-menu-btn {
            display: block !important;
        }

        .nav-container {
            flex-wrap: wrap;
            height: auto;
            padding: 15px 20px;
            position: relative;
        }

        .nav-search {
            order: 3;
            width: 100%;
            margin: 15px 0 0 0;
            max-width: none;
        }

        .nav-actions {
            gap: 10px;
        }

        .welcome-text {
            display: none;
        }

        .success-message {
            top: 100px;
            left: 20px;
            right: 20px;
            transform: none;
            max-width: none;
        }
    }

    @media (max-width: 768px) {
        .nav-container {
            padding: 10px 15px;
        }

        .success-message {
            top: 90px;
            left: 15px;
            right: 15px;
            padding: 12px 20px;
            font-size: 14px;
        }
    }

    @media (max-width: 576px) {
        .nav-container {
            padding: 8px 10px;
        }

        .nav-brand {
            font-size: 1.2rem;
        }

        .nav-brand i {
            font-size: 1.2rem;
        }
    }
</style>