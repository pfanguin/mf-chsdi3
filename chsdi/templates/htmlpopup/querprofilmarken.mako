<%inherit file="base.mako"/>

<%def name="table_body(c, lang)">
<%
    lang = 'fr' if lang in ('fr', 'it') else 'de'
%>
<tr><td class="cell-left">${Translator.translate('schluesselid', lang)}</td>                                 <td>${c['attributes']['schluesselid'] or '-'}</td></tr>
<tr><td class="cell-left">${Translator.translate('ch.bafu.wasserbau-querprofilmarken.typ', lang)}</td>       <td>${c['attributes']['typ'] or '-'}</td></tr>
<tr><td class="cell-left">${Translator.translate('x', lang)}</td>
  % if c['attributes']['x_koordinate']:
    <td>${round(c['attributes']['x_koordinate'],2) or '-'}</td></tr>
  % else:
    <td>-</td></tr>
  % endif
<tr><td class="cell-left">${Translator.translate('y', lang)}</td>
  % if c['attributes']['y_koordinate']:
    <td>${round(c['attributes']['y_koordinate'],2) or '-'}</td></tr>
  % else:
    <td>-</td></tr>
  % endif
<tr><td class="cell-left">${Translator.translate('azimut', lang)}</td>                                       <td>${c['attributes']['azimut'] or '-'}</td></tr>
<tr><td class="cell-left">${Translator.translate('ch.bafu.wasserbau-querprofilmarken.herkunft', lang)}</td>  <td>${c['attributes']['herkunft'] or '-'}</td></tr>
</%def>

<%def name="extended_info(c, lang)">
<%
    lang = 'fr' if lang in ('fr', 'it') else 'de'
%>
<table class="table-with-border kernkraftwerke-extended">
<colgroup>
  <col width=50%>
  <col width=50%>
</colgroup>
<tr>
<th class="cell-left">${Translator.translate('schluesselid', lang)}</th>
<td>${c['attributes']['schluesselid'] or '-'}</td>
</tr>
<tr>
<th class="cell-left">${Translator.translate('ch.bafu.wasserbau-querprofilmarken.typ', lang)}</th>
<td>${c['attributes']['typ'] or '-'}</td>
</tr>
<tr>
<th class="cell-left">${Translator.translate('x', lang)}</th>
  % if c['attributes']['x_koordinate']:
    <td>${round(c['attributes']['x_koordinate'],2) or '-'}</td>
  % else:
    <td>-</td>
  % endif  
</tr>
<tr>
<th class="cell-left">${Translator.translate('y', lang)}</th>
  % if c['attributes']['y_koordinate']:
    <td>${round(c['attributes']['y_koordinate'],2) or '-'}</td>
  % else:
    <td>-</td>
  % endif    
</tr>
<tr>
<th class="cell-left">${Translator.translate('azimut', lang)}</th>
<td>${c['attributes']['azimut'] or '-'}</td>
</tr>
<tr>
<th class="cell-left">${Translator.translate('ch.bafu.wasserbau-querprofilmarken.herkunft', lang)}</th>
<td>${c['attributes']['herkunft'] or '-'}</td>
</tr>
<tr>
<th class="cell-left">${Translator.translate('ch.bafu.wasserbau-vermessungsstrecken.bemerkung', lang)}</th>
<td>${c['attributes']['bemerkung'] or '-'}</td>
</tr>
</table>
</%def>
