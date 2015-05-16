var SearchFields = {
  setup: function() {
    $('#fabric_input_field').hide();
    $(document).on('click', '#activate_field', SearchFields.display_fields);
  },
  display_fields: function () {
    $('#fabric_input_field').show(200)
  }
};

$(document).ready(SearchFields.setup);