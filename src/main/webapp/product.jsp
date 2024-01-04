<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Product Display</title>
</head>
<body>
    <h1>Welcome to Our Store!</h1>
    <div>
        <h2>Available Products</h2>
        <ul>
            <%-- Iterate through each product and display details --%>
            <c:forEach var="product" items="${products}">
                <li>
                    <span>${product.name}</span>
                    <span>${product.price}</span>
                    <form method="post" action="AddToCartServlet">
                        <input type="hidden" name="productName" value="${product.name}" />
                        <input type="hidden" name="productPrice" value="${product.price}" />
                        <input type="submit" value="Add to Cart" />
                    </form>
                </li>
            </c:forEach>
        </ul>
    </div>
</body>
</html>
