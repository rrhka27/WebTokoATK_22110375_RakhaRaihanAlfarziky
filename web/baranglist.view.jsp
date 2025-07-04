<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Barang List</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"  rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"> 

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" 
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>

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
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .bg-light {
            background: transparent !important;
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            box-shadow: var(--card-shadow);
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 0;
            overflow: hidden;
        }

        .container .py-4 {
            padding: 0 !important;
        }

        h1.mb-4.text-primary {
            background: var(--primary-gradient);
            color: white !important;
            margin: 0 !important;
            padding: 30px;
            border-radius: 20px 20px 0 0;
            font-size: 2.5rem;
            font-weight: 700;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
            position: relative;
            overflow: hidden;
        }

        h1.mb-4.text-primary::before {
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

        .d-flex.flex-wrap.justify-content-between.align-items-center.mb-3.gap-2 {
            background: rgba(248, 249, 250, 0.8);
            padding: 25px 30px;
            margin: 0 !important;
            border-bottom: 1px solid rgba(0,0,0,0.05);
        }

        .position-relative.search-box {
            max-width: 350px;
        }

        #searchInput {
            background: white;
            border: 2px solid rgba(102, 126, 234, 0.2);
            border-radius: 15px;
            padding: 12px 20px 12px 50px;
            font-size: 14px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }

        #searchInput:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25), 0 8px 25px rgba(0,0,0,0.1);
            transform: translateY(-2px);
        }

        .fas.fa-search.position-absolute.top-50.start-0.translate-middle-y.ms-2.text-muted {
            color: #667eea !important;
            font-size: 16px;
            left: 18px !important;
            margin-left: 0 !important;
        }

        .btn {
            border: none;
            border-radius: 12px;
            padding: 12px 24px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
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

        .btn-success {
            background: var(--success-gradient) !important;
            color: white !important;
            border: none !important;
        }

        .btn-info {
            background: var(--info-gradient) !important;
            color: #2c3e50 !important;
            border: none !important;
        }

        .btn-secondary {
            background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%) !important;
            color: white !important;
            border: none !important;
        }

        .table-responsive {
            margin: 0 30px;
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            border: none;
        }

        .shadow-sm {
            box-shadow: 0 10px 30px rgba(0,0,0,0.08) !important;
        }

        .bg-white {
            background: white !important;
        }

        .rounded {
            border-radius: 15px !important;
        }

        .table {
            margin: 0;
            border: none;
        }

        .table-hover tbody tr:hover {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.05) 0%, rgba(118, 75, 162, 0.05) 100%) !important;
            transform: scale(1.01);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }

        .table-light th {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%) !important;
            border: none !important;
            padding: 20px 15px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            color: #495057;
            font-size: 0.85rem;
        }

        .table tbody tr {
            border: none;
            transition: all 0.3s ease;
        }

        .table tbody td {
            padding: 20px 15px;
            border: none;
            vertical-align: middle;
            font-size: 0.95rem;
        }

        .table tbody tr:not(:last-child) td {
            border-bottom: 1px solid rgba(0,0,0,0.05);
        }

        .btn-sm {
            border: none;
            border-radius: 8px;
            padding: 8px 12px;
            margin: 0 3px;
            transition: all 0.3s ease;
            font-size: 0.85rem;
        }

        .btn-warning {
            background: var(--warning-gradient) !important;
            color: #8B4513 !important;
            border: none !important;
        }

        .btn-danger {
            background: var(--danger-gradient) !important;
            color: #8B0000 !important;
            border: none !important;
        }

        .btn-sm:hover {
            transform: translateY(-2px) scale(1.1);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .mt-3.text-center {
            padding: 25px 30px;
            text-align: center;
            border-radius: 0 0 20px 20px;
            background: rgba(248, 249, 250, 0.5);
            margin-top: 0 !important;
        }

        /* Enhanced styling for table content */
        .table tbody td:first-child {
            font-weight: 600;
            color: #495057;
            background: linear-gradient(135deg, #e9ecef 0%, #f8f9fa 100%);
            border-radius: 12px;
            text-align: center;
            width: 80px;
        }

        .table tbody td:nth-child(2) {
            font-weight: 600;
            color: #2c3e50;
            font-size: 1rem;
        }

        .table tbody td:nth-child(3) span {
            background: var(--primary-gradient);
            color: white;
            padding: 5px 12px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 0.9rem;
            display: inline-block;
        }

        .fade-in {
            animation: fadeIn 0.6s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 768px) {
            .container {
                margin: 10px;
                border-radius: 15px;
            }
            
            h1.mb-4.text-primary {
                padding: 20px;
                border-radius: 15px 15px 0 0;
                font-size: 1.8rem;
            }
            
            .d-flex.flex-wrap.justify-content-between.align-items-center.mb-3.gap-2 {
                padding: 20px;
            }
            
            .table-responsive {
                margin: 0 20px;
            }
            
            .btn {
                padding: 10px 20px;
                margin: 5px 0;
                width: 100%;
            }
            
            .position-relative.search-box {
                max-width: 100%;
                margin-bottom: 15px;
            }
        }
    </style>
</head>
<body class="bg-light">

<div class="container py-4 fade-in">
    <h1 class="mb-4 text-primary">Daftar Barang</h1>

    <div class="d-flex flex-wrap justify-content-between align-items-center mb-3 gap-2">
        <div class="position-relative search-box">
            <input type="text" id="searchInput" class="form-control form-control-sm ps-4" placeholder="     Cari barang...">
            <i class="fas fa-search position-absolute top-50 start-0 translate-middle-y ms-2 text-muted"></i>                
        </div>
        
        <div class="d-flex gap-2 align-items-center">
        <a href="formbarangtambah.jsp" class="btn btn-success"><i class="fas fa-plus me-2"></i>Tambah Barang</a>
        <button type="button" onclick="showStat()" class="btn btn-info text-white">
            <i class="fas fa-chart-line me-2"></i>Show Statistik
        </button>
        </div>
    </div>

    <!-- Table -->
    <div class="table-responsive shadow-sm bg-white rounded">
        <table class="table table-hover align-middle mb-0">
            <thead class="table-light">
                <tr>
                    <th>ID</th>
                    <th>Nama Barang</th>
                    <th>Jenis</th>
                    <th>Harga</th>
                    <th class="text-end">Aksi</th>
                </tr>
            </thead>
            <tbody id="barangTableBody">
                <c:forEach var="barang" items="${list}">
                    <tr data-id="${barang.getId()}" data-nama="${barang.getNama()}" data-jenis="${barang.getJenis()}" data-harga="${barang.getHarga()}">
                        <td>${barang.getId()}</td>
                        <td><span id="nama${barang.getId()}">${barang.getNama()}</span></td>
                        <td><span id="jenis${barang.getId()}">${barang.getJenis()}</span></td>
                        <td><span id="harga${barang.getId()}"><fmt:formatNumber type="number" pattern="0,000" value="${barang.getHarga()}" /></span></td>
                        <td class="text-end">
                            <button type="button" onclick="gantiBarang('${barang.getId()}')" class="btn btn-sm btn-warning me-1" title="Edit">
                                <i class="fas fa-edit"></i>
                            </button>
                            <a href="hapusbarang.jsp?id=${barang.getId()}" onclick="return confirm('Hapus barang?')" class="btn btn-sm btn-danger" title="Hapus">
                                <i class="fas fa-trash-alt"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    

    <div class="mt-3 text-center">
        <div class="card-footer text-center pt-0 mt-3">
            <a href="home.jsp" class="btn-link">
                <i class="fas fa-arrow-left me-1"></i> Kembali ke Home
            </a>
        </div>
    </div>
</div>

<script>
    // Fungsi edit barang
    function gantiBarang(id) {
        let namabaru = prompt("Edit nama barang?", $('#nama' + id).text());
        let hargabaru = prompt("Edit harga barang?", $('#harga' + id).text().replaceAll(',', ''));

        if (namabaru && hargabaru) {
            $.post("api.baranggantinama.jsp", {
                id: id,
                namabaru: namabaru,
                hargabaru: hargabaru
            }, function(result) {
                if (result.trim() === "ok") {
                    $('#nama' + id).html(namabaru);
                    $('#harga' + id).html(Number(hargabaru).toLocaleString());
                } else {
                    alert("Gagal update data: " + result);
                }
            });
        }
    }

    // Fungsi statistik
    function showStat() {
        $.post("api.barangstat.jsp", function(result) {
            let obj = JSON.parse(result);
            alert("Banyak data: " + obj.banyak + "\nRata-rata: " + obj.rata2);
        });
    }

    // Search functionality
    document.getElementById('searchInput').addEventListener('input', function () {
        const term = this.value.toLowerCase();
        const rows = document.querySelectorAll('#barangTableBody tr');

        rows.forEach(row => {
            const nama = row.getAttribute('data-nama').toLowerCase();
            const harga = row.getAttribute('data-harga');
            const id = row.getAttribute('data-id');

            if (nama.includes(term) || id.includes(term) || harga.includes(term)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    });

    // Add fade-in animation to table rows
    document.addEventListener('DOMContentLoaded', function() {
        const rows = document.querySelectorAll('#barangTableBody tr');
        rows.forEach((row, index) => {
            row.style.animationDelay = `${index * 0.1}s`;
            row.classList.add('fade-in');
        });
    });
</script>

</body>
</html>