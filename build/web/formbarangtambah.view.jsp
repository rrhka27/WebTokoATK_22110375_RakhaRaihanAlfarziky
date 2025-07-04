<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Barang</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

        <style>
            :root {
                --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
                --success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
                --warning-gradient: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);
                --danger-gradient: linear-gradient(135deg, #ff9a9e 0%, #fecfef 100%);
                --info-gradient: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);
                --card-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
                --hover-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
            }

            body {
                background: transparent !important;
                min-height: 100vh;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 20px;
            }

            .form-container {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(20px);
                border-radius: 20px;
                box-shadow: var(--card-shadow);
                border: 1px solid rgba(255, 255, 255, 0.2);
                overflow: hidden;
                width: 100%;
                max-width: 500px;
                animation: fadeIn 0.6s ease-in;
            }

            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(30px); }
                to { opacity: 1; transform: translateY(0); }
            }

            .form-header {
                background: var(--primary-gradient);
                color: white;
                padding: 30px;
                text-align: center;
                position: relative;
                overflow: hidden;
            }

            .form-header::before {
                content: '';
                position: absolute;
                top: -50%;
                right: -50%;
                width: 200%;
                height: 200%;
                background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
                animation: float 6s ease-in-out infinite;
            }

            @keyframes float {
                0%, 100% { transform: translateY(0px) rotate(0deg); }
                50% { transform: translateY(-20px) rotate(180deg); }
            }

            .form-header h1 {
                font-size: 2.2rem;
                font-weight: 700;
                margin: 0;
                text-shadow: 0 2px 4px rgba(0,0,0,0.3);
                position: relative;
                z-index: 1;
            }

            .form-header .subtitle {
                opacity: 0.9;
                margin-top: 5px;
                font-size: 1rem;
                position: relative;
                z-index: 1;
            }

            .form-body {
                padding: 40px;
            }

            .form-group {
                margin-bottom: 25px;
                position: relative;
            }

            .form-label {
                font-weight: 600;
                color: #2c3e50;
                margin-bottom: 8px;
                display: block;
                font-size: 0.95rem;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .form-control {
                background: white;
                border: 2px solid rgba(102, 126, 234, 0.2);
                border-radius: 12px;
                padding: 15px 20px;
                font-size: 16px;
                transition: all 0.3s ease;
                box-shadow: 0 4px 15px rgba(0,0,0,0.05);
                width: 100%;
            }

            .form-control:focus {
                border-color: #667eea;
                box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25), 0 8px 25px rgba(0,0,0,0.1);
                transform: translateY(-2px);
                outline: none;
            }

            .form-control:hover {
                border-color: rgba(102, 126, 234, 0.4);
                box-shadow: 0 6px 20px rgba(0,0,0,0.08);
            }

            .input-icon {
                position: absolute;
                right: 15px;
                top: 50%;
                transform: translateY(-50%);
                color: #667eea;
                font-size: 16px;
                pointer-events: none;
            }

            .btn {
                border: none;
                border-radius: 12px;
                padding: 15px 30px;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                transition: all 0.3s ease;
                position: relative;
                overflow: hidden;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
                font-size: 14px;
                margin: 5px;
                min-width: 120px;
            }

            .btn::before {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
                transition: left 0.5s;
            }

            .btn:hover::before {
                left: 100%;
            }

            .btn:hover {
                transform: translateY(-3px);
                box-shadow: 0 8px 25px rgba(0,0,0,0.2);
            }

            .btn-primary {
                background: var(--success-gradient);
                color: white;
                border: none;
            }

            .btn-secondary {
                background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
                color: white;
                border: none;
            }

            .form-actions {
                display: flex;
                gap: 10px;
                justify-content: center;
                flex-wrap: wrap;
                margin-top: 30px;
            }

            .input-group {
                position: relative;
            }

            /* Responsive Design */
            @media (max-width: 768px) {
                .form-container {
                    margin: 10px;
                    border-radius: 15px;
                }
                
                .form-header {
                    padding: 25px 20px;
                }
                
                .form-header h1 {
                    font-size: 1.8rem;
                }
                
                .form-body {
                    padding: 30px 25px;
                }
                
                .btn {
                    width: 100%;
                    margin: 5px 0;
                }
                
                .form-actions {
                    flex-direction: column;
                }
            }

            /* Loading state */
            .btn:disabled {
                opacity: 0.7;
                cursor: not-allowed;
                transform: none;
            }

            .btn:disabled:hover {
                transform: none;
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            }

            /* Form validation styles */
            .form-control.is-invalid {
                border-color: #dc3545;
                box-shadow: 0 0 0 0.2rem rgba(220, 53, 69, 0.25);
            }

            .form-control.is-valid {
                border-color: #28a745;
                box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.25);
            }

            /* Hover effects for form groups */
            .form-group:hover .form-label {
                color: #667eea;
                transition: color 0.3s ease;
            }

            /* Focus within effects */
            .form-group:focus-within .input-icon {
                color: #667eea;
                transform: translateY(-50%) scale(1.1);
                transition: all 0.3s ease;
            }

            .form-group:focus-within .form-label {
                color: #667eea;
                transition: color 0.3s ease;
            }

            /* Animation delays for staggered appearance */
            .form-group:nth-child(1) { animation-delay: 0.1s; }
            .form-group:nth-child(2) { animation-delay: 0.2s; }
            .form-group:nth-child(3) { animation-delay: 0.3s; }
            .form-group:nth-child(4) { animation-delay: 0.4s; }

            .form-group {
                animation: slideInLeft 0.6s ease-out both;
            }

            @keyframes slideInLeft {
                from {
                    opacity: 0;
                    transform: translateX(-30px);
                }
                to {
                    opacity: 1;
                    transform: translateX(0);
                }
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <div class="form-header">
                <h1><i class="fas fa-plus-circle me-3"></i>Add Barang</h1>
                <p class="subtitle">Tambahkan barang baru ke inventory</p>
            </div>
            
            <div class="form-body">
                <form action="barangtambah.jsp" method="post">
                    <div class="form-group">
                        <label class="form-label">ID Barang</label>
                        <div class="input-group">
                            <input name="id" class="form-control" placeholder="Masukkan ID barang">
                            <i class="fas fa-hashtag input-icon"></i>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Nama Barang</label>
                        <div class="input-group">
                            <input name="nama" class="form-control" placeholder="Masukkan nama barang">
                            <i class="fas fa-tag input-icon"></i>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Jenis Barang</label>
                        <div class="input-group">
                            <input name="jenis" class="form-control" placeholder="Masukkan jenis barang">
                            <i class="fas fa-layer-group input-icon"></i>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Harga</label>
                        <div class="input-group">
                            <input name="harga" type="number" class="form-control" placeholder="Masukkan harga barang">
                            <i class="fas fa-money-bill-wave input-icon"></i>
                        </div>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save me-2"></i>Tambah
                        </button>
                        <button type="reset" class="btn btn-outline-secondary px-4">
                                <i class="fas fa-eraser me-1"></i> Reset
                        </button>
                    </div>
                </form>
                <div class="mt-3 text-center">
                    <div class="card-footer text-center pt-0 mt-3">
                        <a href="baranglist.jsp" class="btn-link">
                            <i class="fas fa-arrow-left me-1"></i> Kembali ke List Barang
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        
        <script>
            // Form enhancement scripts
            document.addEventListener('DOMContentLoaded', function() {
                const form = document.querySelector('form');
                const inputs = document.querySelectorAll('.form-control');
                
                // Add focus/blur effects
                inputs.forEach(input => {
                    input.addEventListener('focus', function() {
                        this.parentElement.parentElement.classList.add('focused');
                    });
                    
                    input.addEventListener('blur', function() {
                        this.parentElement.parentElement.classList.remove('focused');
                    });
                });

                // Form submission enhancement
                form.addEventListener('submit', function(e) {
                    const submitBtn = this.querySelector('button[type="submit"]');
                    const originalHtml = submitBtn.innerHTML;
                    
                    // Show loading state
                    submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Menyimpan...';
                    submitBtn.disabled = true;
                    
                    // Re-enable after a short delay (in case there's an error)
                    setTimeout(() => {
                        submitBtn.innerHTML = originalHtml;
                        submitBtn.disabled = false;
                    }, 3000);
                });

                // Input validation feedback
                inputs.forEach(input => {
                    input.addEventListener('input', function() {
                        if (this.value.trim() !== '') {
                            this.classList.remove('is-invalid');
                            this.classList.add('is-valid');
                        } else {
                            this.classList.remove('is-valid');
                        }
                    });
                });
            });
        </script>
    </body>
</html>