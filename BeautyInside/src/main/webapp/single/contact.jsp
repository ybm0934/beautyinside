<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="main_div_class" id="contact">
	<form name="contact" method="post" action="<%=request.getContextPath() %>/single/contact_ok.jsp">
        <h1>CONTACT</h1>
        <table id="contact_table">
            <caption>문의하기 테이블</caption>
            <thead></thead>
            <tfoot>
                <tr>
                    <td colspan="2">
                        <input type="submit" id="contact_btn" value="Submit">
                    </td>
                </tr>
            </tfoot>
            <tbody>
                <tr>
                    <td>
                        <input type="text" name="name" class="textbox" placeholder="Name" spellcheck="false">
                    </td>
                    <td>
                        <input type="text" name="email" class="textbox" placeholder="Email" spellcheck="false">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="text" name="subject" class="textbox" placeholder="Subject" spellcheck="false">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea name="content" spellcheck="false" placeholder="Content"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
	</form>
</div>