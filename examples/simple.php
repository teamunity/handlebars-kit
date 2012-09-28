<!-- Need to Include jquery first -->
<script src="kit.js" type="text/javascript"></script>
<?php 
  echo file_get_contents(__DIR__ . "/templates/button-dropdown-template.tmpl");
  echo file_get_contents(__DIR__ . "/templates/button-dropdown-link-template.tmpl");
?>
<script>
window.models = [];
$(function(){

function doIt(){
  var src = $("#button-dropdown-template").html(); 
  Handlebars.registerPartial('button-dropdown-link-template',$("#button-dropdown-link-template").html());
  var template = Handlebars.compile(src);
  return template(models[0]);
}
function setupHelpers(){
Handlebars.registerHelper('dataAttributes', function(el) {
  var res = '';
  var outs = [];
  if (typeof el === 'object'){
    $.each(el, function(v,k){
        outs.push("data-" + k + "=" + JSON.stringify(v));
    });
    res = outs.join(" ");
  }
  return res;
});
}
setTimeout(setupHelpers, 1000);
 models.push({'type': 'primary','label': 'Manage', 'items' : [{icon: {name: 'leaf'},'label': 'Update' },{icon: {name: 'fire'},'label': 'Clone' }]});
window.doIt = doIt;
})
</script>
