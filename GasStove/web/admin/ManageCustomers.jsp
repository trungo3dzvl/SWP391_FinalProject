<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Modernize Free</title>
        <link rel="shortcut icon" type="image/png" href="./admin/images/logos/favicon.png" />
        <link rel="stylesheet" href="./admin/css/styles.min.css" />
        <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script>
            function back() {
                window.location.href = "home";
            }
            function doDelete(id)
            {
                var c = confirm("Do you want to delete this customer?");
                if (c)
                {
                    window.location.href = "/GasStove/deleteCustomers?CustomerID=" + id;
                } else
                {
                    window.location.href = "/GasStove/listCustomer"
                    
                }
            }
        </script>
    </head>

    <body>
        <!--  Body Wrapper -->
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
             data-sidebar-position="fixed" data-header-position="fixed">

            <%@ include file="sidebar.jsp" %>


            <!--  Main wrapper -->
            <div class="body-wrapper">
                <!--  Header Start -->
                <header class="app-header">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <ul class="navbar-nav">
                            <li class="nav-item d-block d-xl-none">
                                <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                                    <i class="ti ti-menu-2"></i>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link nav-icon-hover" href="javascript:void(0)">
                                    <i class="ti ti-bell-ringing"></i>
                                    <div class="notification bg-primary rounded-circle"></div>
                                </a>
                            </li>
                        </ul>
                        <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
                            <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
                                <a href="https://adminmart.com/product/modernize-free-bootstrap-admin-dashboard/" target="_blank" class="btn btn-primary">Download Free</a>
                                <li class="nav-item dropdown">
                                    <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                                       aria-expanded="false">
                                        <img src="./admin/images/profile/user-1.jpg" alt="" width="35" height="35" class="rounded-circle">
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                                        <div class="message-body">
                                            <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                                                <i class="ti ti-user fs-6"></i>
                                                <p class="mb-0 fs-3">My Profile</p>
                                            </a>
                                            <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                                                <i class="ti ti-mail fs-6"></i>
                                                <p class="mb-0 fs-3">My Account</p>
                                            </a>
                                            <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                                                <i class="ti ti-list-check fs-6"></i>
                                                <p class="mb-0 fs-3">My Task</p>
                                            </a>
                                            <a href="./authentication-login.html" class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </header>
                <!--  Header End -->
                <div class="container-fluid">
                    <div class="card w-100 h-100 position-relative overflow-hidden">
                        <div class="card-body">
                            <div class="card-body p-4">
                                <form action="searchCustomer" method="post">
                                    <div class="row gx-3 mb-3">
                                        <div class="col-md-8">
                                            <h5 class="card-title fw-semibold mb-4">Customers</h5>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="input-group">
                                                <input type="text" name="search" class="form-control rounded" placeholder="Search"/>
                                            </div>
                                        </div>
                                        <div class="col-md-1" >
                                            <input class="btn btn-primary" type="submit" value="Search">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="table-responsive">
                                <table class="table text-nowrap mb-0 align-middle">
                                    <tr>
                                        <td>Name</td>
                                        <td>Username</td>
                                        <td>Password</td>
                                        <td></td>
                                    </tr>
                                    <c:forEach items="${customers}" var="c">
                                        <tr>
                                            <td>${c.getFirstName()} ${c.getLastName()}</td>
                                            <td>${c.getUsername()}</td>
                                            <td>
                                                <div>
                                                    <input id="${c.getCustomerID()}" type="password" value="${c.getPassword()}" readonly required>
<!--                                                    <button onclick="myFunction('${c.getCustomerID()}')">show/hide</button>-->
                                                    <span onclick="myFunction('${c.getCustomerID()}')" id="boot-icon" class="bi bi-eye" style="font-size: 20px; color: rgb(0, 0, 255); opacity: 1.0;"></span>
                                                </div>
                                                <script type="text/javascript">
                                                    var x = true;
                                                    function myFunction(a) {
                                                        if (x) {
                                                            document.getElementById(a).type = "text";
                                                            x = false;
                                                        } else {
                                                            document.getElementById(a).type = "password";
                                                            x = true;
                                                        }
                                                    }
                                                </script>
                                            </td>
                                            <td>
                                                <a href="editCustomers?CustomerID=${c.getCustomerID()}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                                <a href="" class="delete" data-toggle="modal" onclick="doDelete(${c.getCustomerID()})"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script src="./admin/libs/jquery/dist/jquery.min.js"></script>
    <script src="./admin/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="./admin/js/sidebarmenu.js"></script>
    <script src="./admin/js/app.min.js"></script>
    <script src="./admin/libs/simplebar/dist/simplebar.js"></script>
</body>

</html>