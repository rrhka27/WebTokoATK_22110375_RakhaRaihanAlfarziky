<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sales Management - Daftar Penjualan</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <!-- Google Fonts - Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #0288d1;
            --secondary: #e0f7fa;
            --background: #f8fafc;
            --text: #1e293b;
            --muted: #64748b;
            --accent: #0288d1;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--background);
            min-height: 100vh;
            padding: 1rem;
        }

        .main-container {
            background: white;
            border-radius: 1.5rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            padding: 2rem;
            margin: 2rem auto;
            max-width: 1200px;
            animation: fadeIn 0.5s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .page-title {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .page-subtitle {
            color: var(--muted);
            font-size: 1rem;
            font-weight: 400;
            margin-bottom: 2rem;
        }

        .stats-bar {
            background: var(--secondary);
            border-radius: 1rem;
            padding: 1.5rem;
            margin-bottom: 2rem;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .stat-item {
            text-align: center;
        }

        .stat-number {
            font-size: 1.75rem;
            font-weight: 600;
            color: var(--primary);
        }

        .stat-label {
            font-size: 0.75rem;
            color: var(--muted);
            text-transform: uppercase;
            font-weight: 500;
        }

        .action-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .search-box {
            position: relative;
            flex: 1;
            max-width: 400px;
        }

        .search-input {
            width: 100%;
            padding: 0.75rem 1rem 0.75rem 2.5rem;
            border: 1px solid #e2e8f0;
            border-radius: 0.75rem;
            font-size: 0.875rem;
            background: var(--secondary);
            transition: all 0.3s ease;
        }

        .search-input::placeholder {
            color: var(--muted);
        }

        .search-input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.2rem rgba(2, 136, 209, 0.1);
            background: white;
            outline: none;
        }

        .search-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--muted);
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 0.75rem;
            font-size: 0.875rem;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .btn-success {
            background-color: var(--primary);
            color: white;
        }

        .btn-success:hover {
            background-color: #0277bd;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(2, 136, 209, 0.2);
        }

        .btn-info {
            background-color: #17a2b8;
            color: white;
        }

        .btn-info:hover {
            background-color: #138496;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(23, 162, 184, 0.2);
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
        }

        .btn-danger:hover {
            background-color: #c82333;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(220, 53, 69, 0.2);
        }

        .sales-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 1.5rem;
        }

        .sales-card {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 1rem;
            padding: 1.5rem;
            transition: all 0.3s ease;
        }

        .sales-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
            border-color: var(--primary);
        }

        .sales-id {
            font-size: 1.125rem;
            font-weight: 600;
            color: var(--text);
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .sales-meta {
            font-size: 0.875rem;
            color: var(--muted);
            display: flex;
            flex-direction: column;
            gap: 0.25rem;
        }

        .sales-actions {
            display: flex;
            gap: 0.5rem;
            margin-top: 1rem;
        }

        .btn-sm {
            padding: 0.5rem 1rem;
            font-size: 0.875rem;
        }

        .empty-state {
            text-align: center;
            padding: 3rem;
            color: var(--muted);
            grid-column: 1 / -1;
        }

        .empty-icon {
            font-size: 3rem;
            color: #d1d5db;
            margin-bottom: 1rem;
        }

        .empty-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--text);
            margin-bottom: 0.5rem;
        }

        .empty-description {
            font-size: 0.875rem;
            margin-bottom: 1.5rem;
        }

        .card-footer {
            text-align: center;
            margin-top: 2rem;
        }

        .btn-link {
            color: var(--primary);
            text-decoration: none;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 0.25rem;
        }

        .btn-link:hover {
            color: #0277bd;
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .main-container {
                padding: 1.5rem;
                margin: 1rem;
            }

            .page-title {
                font-size: 1.5rem;
            }

            .action-bar {
                flex-direction: column;
                align-items: stretch;
            }

            .search-box {
                max-width: none;
            }

            .stats-bar {
                flex-direction: column;
            }

            .sales-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 576px) {
            .sales-actions {
                flex-direction: column;
            }

            .btn-sm {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="text-center mb-4">
            <h1 class="page-title">
                <i class="fas fa-receipt"></i> Sales Management
            </h1>
            <p class="page-subtitle">Kelola dan pantau semua transaksi penjualan Anda</p>
        </div>

        <!-- Statistics Bar -->
        <div class="stats-bar">
            <div class="stat-item">
                <span class="stat-number">
                    <c:set var="salesCount" value="${list.size()}" />
                    ${salesCount}
                </span>
                <span class="stat-label">Total Transaksi</span>
            </div>
        </div>

        <!-- Action Bar -->
        <div class="action-bar">
            <div class="search-box">
                <i class="fas fa-search search-icon"></i>
                <input type="text" class="search-input" placeholder="Cari transaksi..." id="searchInput">
            </div>
            <a href="formsalestambah.jsp" class="btn btn-success">
                <i class="fas fa-plus"></i> Transaksi Baru
            </a>
        </div>

        <!-- Sales List -->
        <div class="sales-grid" id="salesGrid">
            <c:choose>
                <c:when test="${empty list}">
                    <div class="empty-state">
                        <div class="empty-icon">
                            <i class="fas fa-inbox"></i>
                        </div>
                        <h3 class="empty-title">Belum Ada Transaksi</h3>
                        <p class="empty-description">
                            Mulai dengan membuat transaksi penjualan pertama Anda
                        </p>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:forEach var="row" items="${list}" varStatus="status">
                        <div class="sales-card" data-sales-id="${row.getId()}">
                            <div class="sales-id">
                                <i class="fas fa-receipt"></i> ID: ${row.getId()}
                            </div>
                            <div class="sales-meta">
                                <span><i class="fas fa-clock"></i> Transaksi #${status.index + 1}</span>
                            </div>
                            <div class="sales-actions">
                                <a href="detailsales.jsp?id=${row.getId()}" class="btn btn-sm btn-info" title="Detail">
                                    <i class="fas fa-eye"></i> Detail
                                </a>
                                <a href="hapussales.jsp?id=${row.getId()}" onclick="return confirm('Yakin mau hapus transaksi ini?')" class="btn btn-sm btn-danger" title="Hapus">
                                    <i class="fas fa-trash-alt"></i> Hapus
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="card-footer">
            <a href="home.jsp" class="btn-link">
                <i class="fas fa-arrow-left"></i> Kembali ke Home
            </a>
        </div>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Search functionality
        document.getElementById('searchInput').addEventListener('input', function(e) {
            const searchTerm = e.target.value.toLowerCase();
            const salesCards = document.querySelectorAll('.sales-card');
            
            salesCards.forEach(card => {
                const salesId = card.getAttribute('data-sales-id').toLowerCase();
                if (salesId.includes(searchTerm)) {
                    card.style.display = 'block';
                    card.style.animation = 'fadeIn 0.3s ease';
                } else {
                    card.style.display = 'none';
                }
            });
        });

        // Add ripple effect to buttons
        document.querySelectorAll('.btn').forEach(button => {
            button.addEventListener('click', function(e) {
                const ripple = document.createElement('span');
                const rect = this.getBoundingClientRect();
                const size = Math.max(rect.width, rect.height);
                const x = e.clientX - rect.left - size / 2;
                const y = e.clientY - rect.top - size / 2;
                
                ripple.style.cssText = `
                    position: absolute;
                    width: ${size}px;
                    height: ${size}px;
                    left: ${x}px;
                    top: ${y}px;
                    background: rgba(255, 255, 255, 0.3);
                    border-radius: 50%;
                    transform: scale(0);
                    animation: ripple 0.6s ease-out;
                    pointer-events: none;
                `;
                
                this.style.position = 'relative';
                this.style.overflow = 'hidden';
                this.appendChild(ripple);
                
                setTimeout(() => ripple.remove(), 600);
            });
        });

        // Stagger animation for cards
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.sales-card');
            cards.forEach((card, index) => {
                card.style.animationDelay = `${index * 0.1}s`;
                card.style.animation = 'fadeIn 0.5s ease-out forwards';
            });
        });

        // Ripple animation CSS
        const style = document.createElement('style');
        style.textContent = `
            @keyframes ripple {
                to {
                    transform: scale(2);
                    opacity: 0;
                }
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>