<%inherit file="base.mako"/>

<%def name="table_body(c, lang)">

<%
    lang = lang if lang in ('fr', 'it') else 'de'
    zustand = 'zustand_%s' % lang

%>

    <tr><td class="cell-left">${h.translate('ch.bafu.fauna-wildtierkorridor_national.objnummer', lang)}</td>       <td>${c['attributes']['objnummer'] or '-'}</td></tr>
    <tr><td class="cell-left">${h.translate('ch.bafu.fauna-wildtierkorridor_national.name', lang)}</td>            <td>${c['attributes']['name'] or '-'}</td></tr>
    <tr><td class="cell-left">${h.translate('ch.bafu.fauna-wildtierkorridor_national.zustand', lang)}</td>         <td>${c['attributes'][zustand] or '-'}</td></tr>
    <tr><td class="cell-left">${h.translate('pdf', lang)}</td>          <td>
    % if c['attributes']['ref_obj_blat']:
      <a href="${c['attributes']['ref_obj_blat']}" target="_blank">${h.translate('link', lang)}</a>
    % else:
        -
    % endif
    </td></tr>
</%def>

