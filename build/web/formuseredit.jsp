<%@page import="tokoatk.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
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
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1rem;
        }

        .main-container {
            background: white;
            border-radius: 1.5rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            padding: 2rem;
            max-width: 600px;
            width: 100%;
            animation: fadeIn 0.5s ease-out;
            margin: auto;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .page-title {
            font-size: 1.75rem;
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            justify-content: center;
        }

        .page-subtitle {
            color: var(--muted);
            font-size: 0.875rem;
            font-weight: 400;
            margin-bottom: 2rem;
            text-align: center;
        }

        .form-label {
            font-size: 0.875rem;
            font-weight: 500;
            color: var(--text);
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .form-label i {
            color: var(--primary);
        }

        .form-control {
            border: 1px solid #e2e8f0;
            border-radius: 0.75rem;
            padding: 0.75rem;
            font-size: 0.875rem;
            background: var(--secondary);
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.2rem rgba(2, 136, 209, 0.1);
            background: white;
        }

        .btn-primary {
            background-color: var(--primary);
            border: none;
            border-radius: 0.75rem;
            padding: 0.75rem 1.5rem;
            font-size: 0.875rem;
            font-weight: 500;
            color: white;
            display: inline-flex;
            align-items: center;
            gap: 0.25rem;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0277bd;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(2, 136, 209, 0.2);
        }

        .btn-outline-secondary {
            border-color: #e2e8f0;
            color: var(--muted);
            border-radius: 0.75rem;
            padding: 0.75rem 1.5rem;
            font-size: 0.875rem;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 0.25rem;
            transition: all 0.3s ease;
        }

        .btn-outline-secondary:hover {
            background-color: var(--secondary);
            color: var(--primary);
            transform: translateY(-2px);
        }

        .alert {
            border-radius: 0.75rem;
            font-size: 0.875rem;
            padding: 1rem;
            margin-bottom: 1.5rem;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 1rem;
        }

        /* Responsive Design */
        @media (max-width: 576px) {
            .main-container {
                padding: 1.5rem;
            }

            .page-title {
                font-size: 1.5rem;
            }

            .d-md-flex {
                flex-direction: column;
                gap: 1rem;
            }

            .btn-primary, .btn-outline-secondary {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <div class="main-container">
            <div class="text-center mb-4">
                <h2 class="page-title">
                    <i class="fas fa-user-edit"></i> Edit Pengguna
                </h2>
                <p class="page-subtitle">Perbarui data pengguna di bawah ini</p>
            </div>

            <%
                String username = request.getParameter("username");
                User user = new User();
                if (!user.baca(username)) {
                    out.println("<div class='alert alert-danger'>User tidak ditemukan</div>");
                    return;
                }
            %>

            <form action="userproses.jsp" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="username" value="<%= user.getUsername() %>">

                <div class="mb-3">
                    <label for="fullname" class="form-label"><i class="fas fa-id-card"></i> Fullname</label>
                    <input type="text" name="fullname" id="fullname" class="form-control" value="<%= user.getFullname() %>" required>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label"><i class="fas fa-lock"></i> Password Baru (Opsional)</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Biarkan kosong jika tidak diganti">
                </div>

                <div class="d-grid gap-2 d-md-flex justify-content-md-between mt-4">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Simpan Perubahan
                    </button>
                    <a href="userlist.jsp" class="btn btn-outline-secondary">
                        <i class="fas fa-arrow-left"></i> Batal
                    </a>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.querySelectorAll('.btn-primary, .btn-outline-secondary').forEach(button => {
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