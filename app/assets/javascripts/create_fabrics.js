var FabricCreation = {
  setup: function() {
    $('.fabric_creation_form').hide();
    $(document).on('click', '.create_button', FabricCreation.display_form);
  },
  display_form: function() {
    $('.fabric_creation_form').show();
    $(document).on('click', '#add_fabric_btn', FabricCreation.setup);
  }
};

$(document).ready(FabricCreation.setup);