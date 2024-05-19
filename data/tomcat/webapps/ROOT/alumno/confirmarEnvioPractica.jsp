<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<div class="info">
	<div class="pregunta">
		<s:text name="practice.finish.info">
			<s:param>
				<s:property value="practica" />
			</s:param>
			<s:param>
				<s:property value="numRespondidos" />
			</s:param>
			<s:param>
				<s:property value="numCorrectos" />
			</s:param>
			<s:param>
				<s:property value="numErroneos" />
			</s:param>
		</s:text>
		<s:if test="numNoRespondidos > 0">
			<p>
				<span class="sinresponder"> <s:text
						name="practice.finish.info.unresolved">
						<s:param>
							<s:property value="numNoRespondidos" />
						</s:param>
					</s:text>
				</span>
			</p>
		</s:if>
	</div>
</div>