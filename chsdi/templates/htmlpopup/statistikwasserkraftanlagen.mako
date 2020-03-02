<%inherit file="base.mako"/>

<%def name="table_body(c, lang)">
<% 
    import chsdi.lib.helpers as h

    c['stable_id'] = True
    lang = lang if lang in ('fr','it') else 'de'
    hydropowerplanttype = 'hydropowerplanttype_%s' % lang
%>
    <tr>
      <td class="cell-left">${Translator.translate('tt_ch.bfe.statistik-wasserkraftanlagen_wastanumber', lang)}</td>
      <td>${c['featureId']}</td>
    </tr>
    <tr>
      <td class="cell-left">${Translator.translate('tt_ch.bfe.statistik-wasserkraftanlagen_name', lang)}</td>
      <td>${c['attributes']['name']}</td>
    </tr>
    <tr>
      <td class="cell-left">${Translator.translate('tt_ch.bfe.statistik-wasserkraftanlagen_location', lang)}</td>
      <td>${c['attributes']['location'] or '-'}</td>
    </tr>
    <tr>
      <td class="cell-left">${Translator.translate('tt_ch.bfe.statistik-wasserkraftanlagen_canton', lang)}</td>
      <td>${c['attributes']['canton'] or '-'}</td>
    </tr>
    <tr>
      <td class="cell-left">${Translator.translate('tt_ch.bfe.statistik-wasserkraftanlagen_hydropowerplanttype', lang)}</td>
      <td>${c['attributes'][hydropowerplanttype] or '-'}</td>
    </tr>
    <tr>
      <td class="cell-left">${Translator.translate('tt_ch.bfe.statistik-wasserkraftanlagen_beginningofoperation', lang)}</td>
      <td>${c['attributes']['beginningofoperation'] or '-'}</td>
    </tr>
    <tr>
      <td class="cell-left">${Translator.translate('tt_ch.bfe.statistik-wasserkraftanlagen_endofoperation', lang)}</td>
      <td>${c['attributes']['endofoperation'] or '-'}</td>
    </tr>
</%def>

<%def name="extended_info(c, lang)">
<%
    c['stable_id'] = True
    lang = 'de' if lang in ('de', 'rm', 'en') else lang
    import urllib2
    has_picture = True
    headers = {'Referer': 'http://admin.ch'}
    url = "http://www.uvek-gis.admin.ch/BFE/bilder/ch.bfe.statistik-wasserkraftanlagen/%d.jpg" % c['featureId']
    if not h.resource_exists(url, headers):
        has_picture = False

%>
<table>
  <tr>
    <td class="cell-meta-one" colspan="2"><strong>${Translator.translate('zentrale', lang)}</strong></td>
  </tr>
  <tr>
    <td class="cell-meta">${Translator.translate('name', lang)}</td>
    <td class="cell-meta">${c['attributes']['name']}</td>
  </tr>
  <tr>
    <td class="cell-meta">${Translator.translate('tt_ch.bfe.statistik-wasserkraftanlagen_wastanumber', lang)}</td>
    <td class="cell-meta">${c['featureId']}</td>
  </tr>    
  <tr>
    <td class="cell-meta">${Translator.translate('tt_ch.bfe.statistik-wasserkraftanlagen_location', lang)}</td>
    <td class="cell-meta">${c['attributes']['location'] or '-'}</td>
  </tr>
  <tr>
    <td class="cell-meta">${Translator.translate('kanton', lang)}</td>
    <td class="cell-meta">${c['attributes']['canton'] or '-'}</td>
  </tr>
  <tr>
    <td class="cell-meta">${Translator.translate('tt_ch.bfe.statistik-wasserkraftanlagen_hydropowerplanttype', lang)}</td>
    <td class="cell-meta">${c['attributes']['hydropowerplanttype_%s' %lang] or '-'}</td>
  <tr>
    <td class="cell-meta">${Translator.translate('tt_ch.bfe.statistik-wasserkraftanlagen_beginningofoperation', lang)}</td>
    <td class="cell-meta">${c['attributes']['beginningofoperation'] or '-'}</td>
  </tr>
  <tr>
    <td class="cell-meta">${Translator.translate('tt_ch.bfe.statistik-wasserkraftanlagen_endofoperation', lang)}</td>
    <td class="cell-meta">${c['attributes']['endofoperation'] or '-'}</td>
  </tr>
  <tr>
    <td class="cell-meta-one" colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td class="cell-meta-one" colspan="2"><strong>${Translator.translate('technische_angaben', lang)}</strong></td>
  </tr>
  <tr>
    <td class="cell-meta">${Translator.translate('ch.bfe.statistik-wasserkraftanlagen.dateofstatistic', lang)}</td>
    <td class="cell-meta">${c['attributes']['dateofstatistic'] or '-'}</td>
  </tr>
  <tr>
    <td class="cell-meta">${Translator.translate('ch.bfe.statistik-wasserkraftanlagen.hydropowerplantoperationalstatus', lang)}</td>
    <td class="cell-meta">${c['attributes']['hydropowerplantoperationalstatus_%s' %lang] or '-'}</td>
  </tr>
  <tr>
    <td class="cell-meta">${Translator.translate('ch.bfe.statistik-wasserkraftanlagen.performancegeneratormaximum', lang)}</td>
    % if c['attributes']['performancegeneratormaximum'] != None:
        <td class="cell-meta">${round(c['attributes']['performancegeneratormaximum'],2) or '-'}&nbsp;MW</td>
    % else:
        <td class="cell-meta">-</td>
    % endif
  </tr>
  <tr>
    <td class="cell-meta">${Translator.translate('ch.bfe.statistik-wasserkraftanlagen.performanceturbinemaximum', lang)}</td>
    % if c['attributes']['performanceturbinemaximum'] != None:
        <td class="cell-meta">${round(c['attributes']['performanceturbinemaximum'],2) or '-'}&nbsp;MW</td>
    % else:
        <td class="cell-meta">-</td>
    % endif
  </tr>
  <tr>
    <td class="cell-meta">${Translator.translate('ch.bfe.statistik-wasserkraftanlagen.productionexpected', lang)}</td>
    % if c['attributes']['productionexpected'] != None:
        <td class="cell-meta">${round(c['attributes']['productionexpected'],2) or '-'}&nbsp;GWh</td>
    % else:
        <td class="cell-meta">-</td>
    % endif
  </tr>
  <tr>
    <td class="cell-meta">${Translator.translate('ch.bfe.statistik-wasserkraftanlagen.pumpspowerinputmaximum', lang)}</td>
    % if c['attributes']['pumpspowerinputmaximum'] != None:
        <td class="cell-meta">${round(c['attributes']['pumpspowerinputmaximum'],2) or '-'}&nbsp;MW</td>
    % else:
        <td class="cell-meta">-</td>
    % endif
  </tr>
  <tr>
    <td class="cell-meta">${Translator.translate('ch.bfe.statistik-wasserkraftanlagen.enginepowerdemand', lang)}</td>
    % if c['attributes']['enginepowerdemand'] != None:
        <td class="cell-meta">${round(c['attributes']['enginepowerdemand'],2) or '-'}&nbsp;MW</td>
    % else:
        <td class="cell-meta">-</td>
    % endif
  </tr>
  <tr>
    <td class="cell-meta">${Translator.translate('ch.bfe.statistik-wasserkraftanlagen.fallheight', lang)}</td>
    <td class="cell-meta">${c['attributes']['fallheight'] or '-'}</td>
  </tr>
  <tr>
    <td class="cell-meta-one" colspan="2">&nbsp;</td>
  </tr>
</table>
% if has_picture:
<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls">
  <div class="slides"></div>
  <div class="title">${c['attributes']['name']}</div>
  <a class="prev">&lsaquo;</a>
  <a class="next">&rsaquo;</a>
  <a class="close">x</a>
  <a class="play-pause"></a>
  <ol class="indicator"></ol>
</div>
<div class="thumbnail-container">
  <div class="thumbnail">
    <a href="http://www.uvek-gis.admin.ch/BFE/bilder/ch.bfe.statistik-wasserkraftanlagen/${c['featureId']}.jpg">
      <img class="image" src="http://www.uvek-gis.admin.ch/BFE/bilder/ch.bfe.statistik-wasserkraftanlagen/${c['featureId']}.jpg" alt=""/>
    </a>
  </div>
</div>
<script>
$('.thumbnail-container').on('click', function (event) {
  event = event || window.event;
  var target = event.target || event.srcElement,
    link = target.src ? target.parentNode : target,
    options = {index: link, event: event},
    links = this.getElementsByTagName('a');
  blueimp.Gallery(links, options);
});
</script>
% endif
</%def>


<%def name="extended_resources(c, lang)">
  <link rel="stylesheet" type="text/css" href="${h.versioned(request.static_url('chsdi:static/css/blueimp-gallery.min.css'))}"/>
  <script src="${h.versioned(request.static_url('chsdi:static/js/jquery.min.js'))}"></script>
  <script src="${h.versioned(request.static_url('chsdi:static/js/blueimp-gallery.min.js'))}"></script>
</%def>
