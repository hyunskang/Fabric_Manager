var FabricCreation = {
  setup: function() {
    $('.fabric_creation_form').hide();
    $(document).on('click', '.create_button', FabricCreation.display_form);
  },
  display_form: function() {
    $('.fabric_creation_form').show();
    $(document).on('click', '#add_fabric_btn', FabricCreation.create_fabric);
  },
  create_fabric: function() {
    $.ajax({
      type: 'POST',
      url: '/fabric',
      success: FabricCreation.display_fabric
    });
    return(false);
  },
  display_fabric: function() {

  }
};

$(document).ready(FabricCreation.setup);