<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stock Detail</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
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
            max-width: 800px;
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
        }

        .page-subtitle {
            color: var(--muted);
            font-size: 0.875rem;
            font-weight: 400;
            margin-bottom: 1.5rem;
        }

        .stock-details {
            margin-bottom: 1.5rem;
        }

        .table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background: var(--secondary);
            border-radius: 0.75rem;
            overflow: hidden;
            margin-bottom: 1.5rem;
        }

        .table th,
        .table td {
            padding: 0.75rem;
            text-align: left;
            font-size: 0.875rem;
            border-bottom: 1px solid #e2e8f0;
        }

        .table th {
            background: var(--primary);
            color: white;
            font-weight: 600;
        }

        .table td {
            color: var(--text);
        }

        .table tr:last-child td {
            border-bottom: none;
        }

        .table tr:hover {
            background: white;
        }

        .form-container {
            margin-bottom: 1.5rem;
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
            outline: none;
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

        .btn-primary {
            background-color: var(--primary);
            color: white;
        }

        .btn-primary:hover {
            background-color: #0277bd;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(2, 136, 209, 0.2);
        }

        .btn-link {
            color: var(--primary);
            text-decoration: none;
            font-weight: 500;
            font-size: 0.875rem;
            display: inline-flex;
            align-items: center;
            gap: 0.25rem;
            position: relative;
            overflow: hidden;
        }

        .btn-link:hover {
            color: #0277bd;
            text-decoration: underline;
        }

        .card-footer {
            text-align: center;
            margin-top: 1.5rem;
        }

        /* Responsive Design */
        @media (max-width: 576px) {
            .main-container {
                padding: 1.5rem;
            }

            .page-title {
                font-size: 1.5rem;
            }

            .table {
                font-size: 0.75rem;
            }

            .table th,
            .table td {
                padding: 0.5rem;
            }

            .form-container .btn {
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
                <i class="fas fa-warehouse"></i> Detail Stok
            </h1>
            <p class="page-subtitle">Kelola detail stok dengan ID: ${stock.getId()}</p>
        </div>

        <div class="stock-details">
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>ID Barang</th>
                        <th>Nama Barang</th>
                        <th>Qty</th>
                        <th>Harga</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="row" items="${stock.getDetail()}">
                        <tr>
                            <td>${row.getId()}</td>
                            <td>${row.getBarangId()}</td>
                            <td>${row.getBarangNama()}</td>
                            <td>${row.getQty()}</td>
                            <td>${row.getHarga()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="form-container">
            <form action="stockdetailtambah.jsp" method="post">
                <input type="hidden" name="stockId" value="${stock.getId()}">
                <div class="mb-3">
                    <label for="barangId" class="form-label"><i class="fas fa-barcode"></i> ID Barang</label>
                    <input name="barangId" id="barangId" class="form-control" placeholder="Masukkan ID Barang" required>
                </div>
                <div class="mb-3">
                    <label for="qty" class="form-label"><i class="fas fa-boxes"></i> Qty</label>
                    <input name="qty" id="qty" type="number" class="form-control" placeholder="Masukkan Jumlah" required>
                </div>
                <div class="mb-3">
                    <label for="harga" class="form-label"><i class="fas fa-coin"></i> Harga</label>
                    <input name="harga" id="harga" type="number" class="form-control" placeholder="Masukkan Harga Satuan" required>
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-between mt-4">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-plus"></i> Tambah
                    </button>
                    <a href="stocklist.jsp" class="btn btn-link">
                        <i class="fas fa-arrow-left"></i> Kembali
                    </a>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Add ripple effect to buttons
        document.querySelectorAll('.btn, .btn-link').forEach(button => {
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