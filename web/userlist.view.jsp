<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Poppins Font -->
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
            color: var(--text);
            line-height: 1.6;
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

        .header-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .btn-add-user {
            background-color: var(--primary);
            color: white;
            border: none;
            border-radius: 0.75rem;
            padding: 0.75rem 1.5rem;
            font-size: 0.875rem;
            font-weight: 500;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s ease;
        }

        .btn-add-user:hover {
            background-color: #0277bd;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(2, 136, 209, 0.2);
            color: white;
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

        .user-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 1.5rem;
        }

        .user-card {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 1rem;
            padding: 1.5rem;
            transition: all 0.3s ease;
        }

        .user-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
            border-color: var(--primary);
        }

        .user-avatar {
            width: 48px;
            height: 48px;
            background: var(--primary);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
            font-weight: 600;
            margin-bottom: 1rem;
        }

        .user-name {
            font-size: 1.125rem;
            font-weight: 600;
            color: var(--text);
            margin-bottom: 0.25rem;
        }

        .user-role {
            font-size: 0.875rem;
            color: var(--muted);
            background: var(--secondary);
            padding: 0.25rem 0.75rem;
            border-radius: 1rem;
            display: inline-flex;
            align-items: center;
            gap: 0.25rem;
        }

        .user-actions {
            display: flex;
            gap: 0.5rem;
            margin-top: 1rem;
        }

        .btn-action {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 0.5rem;
            font-size: 0.875rem;
            font-weight: 500;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.25rem;
            transition: all 0.2s ease;
        }

        .btn-edit {
            background: var(--primary);
            color: white;
        }

        .btn-edit:hover {
            background: #0277bd;
            color: white;
        }

        .btn-delete {
            background: #dc3545;
            color: white;
        }

        .btn-delete:hover {
            background: #c82333;
            color: white;
        }

        .empty-state {
            text-align: center;
            padding: 3rem;
            color: var(--muted);
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

            .header-actions {
                flex-direction: column;
                align-items: stretch;
            }

            .stats-bar {
                flex-direction: column;
            }

            .user-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 576px) {
            .user-actions {
                flex-direction: column;
            }

            .btn-action {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="main-container">
            <!-- Header Section -->
            <div class="text-center mb-4">
                <h1 class="page-title">
                    <i class="fas fa-users"></i> User Management
                </h1>
                <p class="page-subtitle">Kelola semua pengguna dalam sistem</p>
            </div>

            <!-- Stats Bar -->
            <div class="stats-bar">
                <div class="stat-item">
                    <span class="stat-number">
                        <c:set var="userCount" value="${list.size()}" />
                        ${userCount}
                    </span>
                    <span class="stat-label">Total Users</span>
                </div>
            </div>

            <!-- Header Actions -->
            <div class="header-actions">
                <h3 class="mb-0">Daftar Pengguna</h3>
                <a href="formusertambah.jsp" class="btn-add-user">
                    <i class="fas fa-plus"></i> Tambah User Baru
                </a>
            </div>

            <!-- User List -->
            <div class="user-grid">
                <c:choose>
                    <c:when test="${empty list}">
                        <div class="empty-state">
                            <div class="empty-icon">
                                <i class="fas fa-users"></i>
                            </div>
                            <h3 class="empty-title">Belum Ada Pengguna</h3>
                            <p class="empty-description">
                                Tidak ada pengguna yang terdaftar dalam sistem. 
                                Mulai dengan menambahkan pengguna baru.
                            </p>
                            <a href="formusertambah.jsp" class="btn-add-user">
                                <i class="fas fa-plus"></i> Tambah User Pertama
                            </a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="user" items="${list}" varStatus="status">
                            <div class="user-card">
                                <div class="user-avatar">
                                    <c:choose>
                                        <c:when test="${not empty user.fullname}">
                                            ${user.fullname.substring(0,1).toUpperCase()}
                                        </c:when>
                                        <c:otherwise>
                                            <i class="fas fa-user"></i>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="user-name">${user.fullname}</div>
                                <div class="user-role">
                                    <i class="fas fa-id-badge"></i> User #${status.count}
                                </div>
                                <div class="user-actions">
                                    <a href="formuseredit.jsp?username=${user.username}" class="btn-action btn-edit">
                                        <i class="fas fa-edit"></i> Edit
                                    </a>
                                    <form action="userproses.jsp" method="post" style="display:inline;" onsubmit="return confirm('Hapus user: ${user.fullname}?')">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="username" value="${user.username}">
                                        <button type="submit" class="btn-action btn-delete">
                                            <i class="fas fa-trash"></i> Delete
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Footer -->
            <div class="card-footer">
                <a href="home.jsp" class="btn-link">
                    <i class="fas fa-arrow-left"></i> Kembali ke Home
                </a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script>
        // Update total users count
        document.addEventListener('DOMContentLoaded', function() {
            const userCards = document.querySelectorAll('.user-card').length;
            document.getElementById('totalUsers').textContent = userCards;
        });

        // Smooth animations for cards
        document.querySelectorAll('.user-card').forEach((card, index) => {
            card.style.animationDelay = `${index * 0.1}s`;
            card.style.animation = 'fadeIn 0.5s ease-out forwards';
        });

        // Ripple effect for buttons
        document.querySelectorAll('.btn-add-user, .btn-action').forEach(button => {
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