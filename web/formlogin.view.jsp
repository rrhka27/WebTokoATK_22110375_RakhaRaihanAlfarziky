<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {            
            min-height: 100vh;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            border-radius: 24px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15);
            border: 1px solid rgba(255, 255, 255, 0.2);
            animation: fadeInUp 0.8s cubic-bezier(0.25, 0.46, 0.45, 0.94);
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(40px) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .login-title {
            font-size: 2.5rem;
            font-weight: 800;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .form-control {
            border-radius: 16px;
            padding: 18px 20px;
            font-size: 1.1rem;
            font-weight: 500;
            border: 2px solid #e2e8f0;
            background: rgba(248, 250, 252, 0.8);
            transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
        }

        .form-control:focus {
            border-color: #667eea;
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 0 0 0.25rem rgba(102, 126, 234, 0.12);
            transform: translateY(-2px);
        }

        .form-control:hover:not(:focus) {
            border-color: #cbd5e0;
            background: rgba(255, 255, 255, 0.9);
            transform: translateY(-1px);
        }

        .form-control::placeholder {
            color: #a0aec0;
            font-weight: 400;
        }

        .btn-login {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 16px;
            padding: 18px 24px;
            font-size: 1.2rem;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            position: relative;
            overflow: hidden;
        }

        .btn-login:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 35px rgba(102, 126, 234, 0.4);
            background: linear-gradient(135deg, #5a67d8 0%, #6b46c1 100%);
        }

        .btn-login:active {
            transform: translateY(-1px);
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.3);
        }

        .btn-login::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.25), transparent);
            transition: left 0.6s ease;
        }

        .btn-login:hover::before {
            left: 100%;
        }

        .password-toggle {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #718096;
            cursor: pointer;
            font-size: 1.3rem;
            padding: 8px;
            border-radius: 8px;
            transition: all 0.3s ease;
            z-index: 10;
        }

        .password-toggle:hover {
            color: #4a5568;
            background: rgba(0, 0, 0, 0.05);
        }

        .position-relative .form-control {
            padding-right: 60px;
        }

        /* Floating label effect */
        .form-floating > .form-control:focus ~ label,
        .form-floating > .form-control:not(:placeholder-shown) ~ label {
            color: #667eea;
            font-weight: 600;
        }

        .form-floating > label {
            font-weight: 500;
            color: #a0aec0;
        }

        /* Ripple effect */
        @keyframes ripple {
            to {
                transform: scale(2.5);
                opacity: 0;
            }
        }

        .ripple {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.3);
            pointer-events: none;
            animation: ripple 0.8s ease-out;
        }
    </style>
</head>
<body>
    <div class="container-fluid d-flex align-items-center justify-content-center min-vh-100 p-4">
        <div class="login-container p-5">
            <div class="row justify-content-center">
                <div class="col-12 col-sm-10 col-md-8 col-lg-12">
                    <h1 class="login-title text-center mb-5">Login</h1>
                    
                    <form action="login.jsp" method="post">
                        <div class="form-floating mb-4">
                            <input type="text" class="form-control" id="username" name="username" placeholder="Username" required>
                            <label for="username">Username</label>
                        </div>

                        <div class="form-floating mb-4 position-relative">
                            <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                            <label for="password">Password</label>
                            <button type="button" class="password-toggle" onclick="togglePassword()">
                                <i id="toggle-icon" class="fas fa-eye"></i>
                            </button>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-login text-white">
                                Login
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script>
        function togglePassword() {
            const passwordInput = document.getElementById('password');
            const toggleIcon = document.getElementById('toggle-icon');
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                toggleIcon.className = 'fas fa-eye-slash';
            } else {
                passwordInput.type = 'password';
                toggleIcon.className = 'fas fa-eye';
            }
        }

        // Ripple effect untuk tombol
        document.querySelector('.btn-login').addEventListener('click', function(e) {
            const ripple = document.createElement('span');
            const rect = this.getBoundingClientRect();
            const size = Math.max(rect.width, rect.height);
            const x = e.clientX - rect.left - size / 2;
            const y = e.clientY - rect.top - size / 2;
            
            ripple.classList.add('ripple');
            ripple.style.width = ripple.style.height = size + 'px';
            ripple.style.left = x + 'px';
            ripple.style.top = y + 'px';
            
            this.appendChild(ripple);
            
            setTimeout(() => {
                ripple.remove();
            }, 800);
        });

        // Loading state saat form disubmit
        document.querySelector('form').addEventListener('submit', function(e) {
            const button = document.querySelector('.btn-login');
            button.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Loading...';
            button.disabled = true;
        });
    </script>
</body>
</html>