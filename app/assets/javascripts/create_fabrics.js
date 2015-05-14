var FabricCreation = {
  setup: function() {
    $('.fabric_creation_form').hide();
    $(document).on('click', '.create_button', FabricCreation.display_form);
  },
  display_form: function() {
    $('.fabric_creation_form').show();
  }
};

$(document).ready(FabricCreation.setup);