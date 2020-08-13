<%inherit file="base.mako"/>

<%def name="table_body(c, lang)">

<% c['stable_id'] = True %>

<%
  datageoadminhost = request.registry.settings['datageoadminhost']
  canton = c['attributes']['gdekt']
  bfs_nr = c['attributes']['ggdenr']
  url_canton = 'https://%s/ch.bfs.gebaeude_wohnungs_register/CSV/%s/%s.zip' % (datageoadminhost, canton, canton)
  url_municipality = 'https://%s/ch.bfs.gebaeude_wohnungs_register/CSV/%s/%s.zip' % (datageoadminhost, canton, bfs_nr)
%>
    <tr><td class="cell-left">${_('ch.bfs.gebaeude_wohnungs_register.egid')}</td>           <td>${c['attributes']['egid'] or '-'}</td></tr>
    <tr><td class="cell-left">${_('ch.bfs.gebaeude_wohnungs_register.strname_deinr')}</td>  <td>${c['attributes']['strname_deinr'] or '-'}</td></tr>
    <tr><td class="cell-left">${_('ch.bfs.gebaeude_wohnungs_register.plz_plz6')}</td>       <td>${c['attributes']['plz_plz6'] or '-'}</td></tr>
    <tr><td class="cell-left">${_('ch.bfs.gebaeude_wohnungs_register.dplzname')}</td>       <td>${c['attributes']['dplzname'] or '-'}</td></tr>
    <tr><td class="cell-left">${_('ch.bfs.gebaeude_wohnungs_register.ggdename')}</td>       <td>${c['attributes']['ggdename'] or '-'}</td></tr>
    <tr><td class="cell-left">${_('ch.bfs.gebaeude_wohnungs_register.ggdenr')}</td>         <td>${c['attributes']['ggdenr'] or '-'}</td></tr>
    <tr><td class="cell-left">${_('ch.bfs.gebaeude_wohnungs_register.gexpdat')}</td>        <td>${c['attributes']['gexpdat'] or '-'}</td></tr>
    <tr><td class="cell-left">${_('ch.bfs.gebaeude_wohnungs_register.download_links')}</td> <td><a href="${url_canton}"> ${_('ch.bfs.gebaeude_wohnungs_register.canton_label')}</a></td></tr>
    <tr><td></td>                                                                           <td><a href="${url_municipality}">${_('ch.bfs.gebaeude_wohnungs_register.municipality_label')}</a></td></tr>
</%def>

<%def name="extended_info(c, lang)">
<%
# arrays in identify result:

#  streetnames
#  - strname
#  - strnamk
#  - strsp
#  - strindx

#  wohnungen
#  - ewid
#  - whgnr
#  - wstwk
#  - wmehrg
#  - weinr
#  - wbez
#  - wstat
#  - wexpdat

    import dateutil.parser as date_parser
    len_array_streetnames=len(c['attributes']['strname'])
    len_array_wohnungen=len(c['attributes']['ewid'] or [])
%>
  <table>
    <tr><th colspan=2>${_('ch.bfs.gebaeude_wohnungs_register.block_gebaeude')}</th></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.egid')}</td>           <td class="cell-meta-small">${c['attributes']['egid'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.gdekt')}</td>          <td class="cell-meta-small">${c['attributes']['gdekt'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.ggdenr')}</td>         <td class="cell-meta-small">${c['attributes']['ggdenr'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.ggdename')}</td>       <td class="cell-meta-small">${c['attributes']['ggdename'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.egrid')}</td>          <td class="cell-meta-small">${c['attributes']['egrid'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.lgbkr')}</td>          <td class="cell-meta-small">${c['attributes']['lgbkr'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.lparz')}</td>          <td class="cell-meta-small">${c['attributes']['lparz'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.lparzsx')}</td>        <td class="cell-meta-small">${c['attributes']['lparzsx'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.ltyp')}</td>           <td class="cell-meta-small">${c['attributes']['ltyp'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.gebnr')}</td>          <td class="cell-meta-small">${c['attributes']['gebnr'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.gbez')}</td>           <td class="cell-meta-small">${c['attributes']['gbez'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.gkode')}</td>          <td class="cell-meta-small">${c['attributes']['gkode'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.gkodn')}</td>          <td class="cell-meta-small">${c['attributes']['gkodn'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.gksce')}</td>          <td class="cell-meta-small">${c['attributes']['gksce'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.gstat')}</td>          <td class="cell-meta-small">${c['attributes']['gstat'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.gkat')}</td>           <td class="cell-meta-small">${c['attributes']['gkat'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.gklas')}</td>          <td class="cell-meta-small">${c['attributes']['gklas'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.gbauj')}</td>          <td class="cell-meta-small">${c['attributes']['gbauj'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.gbaum')}</td>          <td class="cell-meta-small">${c['attributes']['gbaum'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.gbaup')}</td>          <td class="cell-meta-small">${c['attributes']['gbaup'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.gabbj')}</td>          <td class="cell-meta-small">${c['attributes']['gabbj'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.garea')}</td>          <td class="cell-meta-small">${c['attributes']['garea'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.gvol')}</td>           <td class="cell-meta-small">${c['attributes']['gvol'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.gvolsce')}</td>        <td class="cell-meta-small">${c['attributes']['gvolsce'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.gastw')}</td>          <td class="cell-meta-small">${c['attributes']['gastw'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.ganzwhg')}</td>        <td class="cell-meta-small">${c['attributes']['ganzwhg'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.gazzi')}</td>          <td class="cell-meta-small">${c['attributes']['gazzi'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.gexpdat')}</td>        <td class="cell-meta-small">${c['attributes']['gexpdat'] or '-'}</td></tr>
    <tr><th colspan=2>${_('ch.bfs.gebaeude_wohnungs_register.block_eingang')}</th></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.edid')}</td>           <td class="cell-meta-small">${c['attributes']['edid'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.egaid')}</td>          <td class="cell-meta-small">${c['attributes']['egaid'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.deinr')}</td>          <td class="cell-meta-small">${c['attributes']['deinr'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.esid')}</td>           <td class="cell-meta-small">${c['attributes']['esid'] or '-'}</td></tr>
% for i in range(len_array_streetnames):
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.strname')} ${c['attributes']['strsp'][i] or '-'}</td>          <td class="cell-meta-small">${c['attributes']['strname'][i] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.strnamk')} ${c['attributes']['strsp'][i] or '-'}</td>          <td class="cell-meta-small">${c['attributes']['strnamk'][i] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.strindx')} ${c['attributes']['strsp'][i] or '-'}</td>          <td class="cell-meta-small">${c['attributes']['strindx'][i] or '-'}</td></tr>
% endfor
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.stroffiziel')}</td>    <td class="cell-meta-small">${c['attributes']['stroffiziel'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.dplz4')}</td>          <td class="cell-meta-small">${c['attributes']['dplz4'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.dplzz')}</td>          <td class="cell-meta-small">${c['attributes']['dplzz'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.dplzname')}</td>       <td class="cell-meta-small">${c['attributes']['dplzname'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.dkode')}</td>          <td class="cell-meta-small">${c['attributes']['dkode'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.dkodn')}</td>          <td class="cell-meta-small">${c['attributes']['dkodn'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.doffadr')}</td>        <td class="cell-meta-small">${c['attributes']['doffadr'] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.dexpdat')}</td>        <td class="cell-meta-small">${c['attributes']['dexpdat'] or '-'}</td></tr>
% for i in range(len_array_wohnungen):
    <tr><th colspan=2>${_('ch.bfs.gebaeude_wohnungs_register.block_wohnung')}</th></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.ewid')}</td>           <td class="cell-meta-small">${c['attributes']['ewid'][i] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.whgnr')}</td>          <td class="cell-meta-small">${c['attributes']['whgnr'][i] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.wstwk')}</td>          <td class="cell-meta-small">${c['attributes']['wstwk'][i] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.wmehrg')}</td>         <td class="cell-meta-small">${c['attributes']['wmehrg'][i] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.weinr')}</td>          <td class="cell-meta-small">${c['attributes']['weinr'][i] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.wbez')}</td>           <td class="cell-meta-small">${c['attributes']['wbez'][i] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.wstat')}</td>          <td class="cell-meta-small">${c['attributes']['wstat'][i] or '-'}</td></tr>
    <tr><td class="cell-meta-small">${_('ch.bfs.gebaeude_wohnungs_register.wexpdat')}</td>        <td class="cell-meta-small">${c['attributes']['wexpdat'][i].strftime("%d.%m.%Y") or '-'}</td></tr>
% endfor
  </table>
</%def>
