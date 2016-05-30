$(function() {
  // -------------------------------
  // Initialize Data Tables
  // -------------------------------
  $('.datatables').dataTable({ });
  $('.dataTables_filter input').attr('placeholder', 'Search...');

  //DOM Manipulation to move datatable elements integrate to panel
  $('#panel-inline .panel-ctrls').append($('#panel-inline .dataTables_filter').addClass("pull-right")).find("label").addClass("panel-ctrls-center");
  $('#panel-inline .panel-ctrls').append("<i class='separator'></i>");
  $('#panel-inline .panel-ctrls').append($('#panel-inline .dataTables_length').addClass("pull-left")).find("label").addClass("panel-ctrls-center");

  $('#panel-inline .panel-footer').append($(" #panel-inline .dataTable+.row"));
  $('#panel-inline .dataTables_paginate>ul.pagination').addClass("pull-right");

  $('.dataTables_filter input').addClass('form-control').attr('placeholder', 'Search...');
  $('.dataTables_length select').addClass('form-control');

  //add icons
  $("#ToolTables_crudtable_0").prepend('<i class="fa fa-plus"/> ');
  $("#ToolTables_crudtable_1").prepend('<i class="fa fa-pencil-square-o"/> ');
  $("#ToolTables_crudtable_2").prepend('<i class="fa fa-times-circle"/> ');

  //DOM Manipulation to move datatable elements integrate to panel
  $('#panel-editable .panel-ctrls').append($('#panel-editable .dataTables_filter').addClass("pull-right")).find("label").addClass("panel-ctrls-center");
  $('#panel-editable .panel-ctrls').append("<i class='separator'></i>");
  $('#panel-editable .panel-ctrls').append($('#panel-editable .DTTT.btn-group').addClass("pull-left mt10"));

  $('#panel-editable .panel-footer').append($(" #panel-editable .dataTable+.row"));
  $('#panel-editable .dataTables_paginate>ul.pagination').addClass("pull-right");

});
