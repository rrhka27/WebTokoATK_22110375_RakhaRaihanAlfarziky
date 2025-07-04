<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {            
            min-height: 100vh;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
        }

        .welcome-container {
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

        .welcome-title {
            font-size: 3rem;
            font-weight: 800;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 1rem;
        }

        .user-name {
            color: #2d3748;
            font-weight: 600;
            font-size: 1.3rem;
        }

        .welcome-subtitle {
            color: #718096;
            font-size: 1.1rem;
            margin-bottom: 2rem;
        }

        .action-card {
            background: rgba(255, 255, 255, 0.8);
            border: 2px solid #e2e8f0;
            border-radius: 20px;
            padding: 2rem;
            transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            text-decoration: none;
            color: inherit;
            display: block;
            position: relative;
            overflow: hidden;
        }

        .action-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(102, 126, 234, 0.2);
            border-color: #667eea;
            background: rgba(255, 255, 255, 0.95);
            text-decoration: none;
            color: inherit;
        }

        .action-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(102, 126, 234, 0.1), transparent);
            transition: left 0.6s ease;
        }

        .action-card:hover::before {
            left: 100%;
        }

        .card-icon {
            font-size: 3rem;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 1rem;
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: #2d3748;
            margin-bottom: 0.5rem;
        }

        .card-description {
            color: #718096;
            font-size: 1rem;
            line-height: 1.5;
        }

        .user-avatar {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            color: white;
            font-weight: 700;
            margin: 0 auto 1rem auto;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% {
                box-shadow: 0 0 0 0 rgba(102, 126, 234, 0.4);
            }
            70% {
                box-shadow: 0 0 0 20px rgba(102, 126, 234, 0);
            }
            100% {
                box-shadow: 0 0 0 0 rgba(102, 126, 234, 0);
            }
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin: 2rem 0;
        }

        .stat-item {
            text-align: center;
            padding: 1.5rem;
            background: rgba(255, 255, 255, 0.6);
            border-radius: 16px;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .stat-number {
            font-size: 2rem;
            font-weight: 800;
            color: #667eea;
            display: block;
        }

        .stat-label {
            color: #718096;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-weight: 600;
        }

        @media (max-width: 768px) {
            .welcome-title {
                font-size: 2.2rem;
            }
            
            .welcome-container {
                margin: 1rem;
            }
            
            .action-card {
                padding: 1.5rem;
            }
            
            .card-icon {
                font-size: 2.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container-fluid d-flex align-items-center justify-content-center min-vh-100 p-4">
        <div class="welcome-container p-5">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-10">
                    <!-- User Welcome Section -->
                    <div class="text-center mb-5">
                        <div class="user-avatar">
                            <i class="fas fa-user"></i>
                        </div>
                        <h1 class="welcome-title">Selamat Datang!</h1>
                        <p class="user-name">Hello <strong>${fullname}</strong></p>
                        <p class="welcome-subtitle">Selamat datang kembali di dashboard Anda</p>
                    </div>

                    
                    <!-- Action Cards -->
                    <div class="row g-4">
                        <div class="col-12 col-md-6">
                            <a href="userlist.jsp" class="action-card">
                                <div class="text-center">
                                    <div class="card-icon">
                                        <i class="fas fa-users"></i>
                                    </div>
                                    <h3 class="card-title">List User</h3>
                                    <p class="card-description">
                                        Kelola dan lihat daftar semua pengguna yang terdaftar dalam sistem
                                    </p>
                                </div>
                            </a>
                        </div>
                        
                        <div class="col-12 col-md-6">
                            <a href="baranglist.jsp" class="action-card" >
                                <div class="text-center">
                                    <div class="card-icon">
                                        <i class="fas fa-cube"></i>
                                    </div>
                                    <h3 class="card-title">List Barang</h3>
                                    <p class="card-description">
                                        Kelola dan lihat daftar semua barang yang terdaftar dalam sistem
                                    </p>
                                </div>
                            </a>
                        </div>
                        
                        <div class="col-12 col-md-6">
                            <a href="saleslist.jsp" class="action-card" >
                                <div class="text-center">
                                    <div class="card-icon">
                                       <i class="fas fa-receipt"></i>
                                    </div>
                                    <h3 class="card-title">List Sales</h3>
                                    <p class="card-description">
                                        Kelola dan lihat daftar semua sales yang terdaftar dalam sistem
                                    </p>
                                </div>
                            </a>
                        </div>                        
                        <div class="col-12 col-md-6">
                            <a href="stocklist.jsp" class="action-card" >
                                <div class="text-center">
                                    <div class="card-icon">
                                        <i class="fas fa-warehouse"></i>
                                    </div>
                                    <h3 class="card-title">List Stock</h3>
                                    <p class="card-description">
                                        Kelola dan lihat daftar semua stock yang terdaftar dalam sistem
                                    </p>
                                </div>
                            </a>
                        </div>                      
                            <a href="logout.jsp" class="action-card">
                                <div class="text-center">
                                    <div class="card-icon">
                                        <i class="fas fa-sign-out-alt"></i>
                                    </div>
                                    <h3 class="card-title">Logout</h3>                                   
                                </div>
                            </a>                       
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script>
        // Smooth hover animations
        document.querySelectorAll('.action-card').forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-8px) scale(1.02)';
            });
            
            card.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0) scale(1)';
            });
        });

        // Welcome animation
        window.addEventListener('load', function() {
            const welcomeContainer = document.querySelector('.welcome-container');
            welcomeContainer.style.animation = 'fadeInUp 1s cubic-bezier(0.25, 0.46, 0.45, 0.94)';
        });

        // Dynamic time greeting
        const now = new Date();
        const hour = now.getHours();
        let greeting = 'Selamat Datang!';
        
        if (hour < 12) {
            greeting = 'Selamat Pagi!';
        } else if (hour < 17) {
            greeting = 'Selamat Siang!';
        } else {
            greeting = 'Selamat Malam!';
        }
        
        document.querySelector('.welcome-title').textContent = greeting;
    </script>
</body>
</html>