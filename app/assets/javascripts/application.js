// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require moment.min
//= require chart
//= require raphael.min
//= require morris.min

//= require plugins/datatables/jquery.dataTables
//= require plugins/datatables/TableTools
//= require plugins/jquery-editable/jquery.editable
//= require plugins/datatables/dataTables.editor
//= require plugins/datatables/dataTables.editor.bootstrap
//= require plugins/datatables/dataTables.bootstrap
//= require custom_datatable

//= require plugins/easypiechart/jquery.easypiechart
//= require plugins/sparklines/jquery.sparklines.min
//= require plugins/jstree/dist/jstree.min
//= require plugins/codeprettifier/prettify
//= require plugins/bootstrap-switch/bootstrap-switch
//= require plugins/bootstrap-tabdrop/js/bootstrap-tabdrop
//= require plugins/iCheck/icheck.min
//= require enquire.min
//= require plugins/bootbox/bootbox
//= require plugins/simpleWeather/jquery.simpleWeather.min
//= require plugins/nanoScroller/js/jquery.nanoscroller.min
//= require plugins/jquery-mousewheel/jquery.mousewheel.min
//= require functions
//= require plugins/fullcalendar/fullcalendar.min
//= require plugins/wijets/wijets
//= require plugins/charts-chartistjs/chartist.min
//= require plugins/charts-chartistjs/chartist-plugin-tooltip
//= require plugins/form-daterangepicker/moment.min
//= require plugins/form-daterangepicker/daterangepicker

$(document).ready(function() {
  $("#period").on("change", function() {
    $(this).parent("form").submit();
  });
});
