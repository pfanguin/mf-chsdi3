<%inherit file="base.mako"/>

<%def name="table_body(c, lang)">

    <tr><td class="cell-left">${h.translate('ch.vbs.patrouilledesglaciers-a_rennen.name', lang)}</td>
	<td>${c['attributes']['name'] or '-'}</td></tr>

</%def>

