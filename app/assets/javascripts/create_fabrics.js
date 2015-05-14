var FabricCreation = {
  setup: function() {
    // Append form fields to the div "fabric_creation_form"
    var action_uri="/user/"+gon.user_id+"/fabrics";
    var form_field=$('<form id= "creation_form" method="POST" data-remote=true action="'+action_uri+'"></form>');
    $('.fabric_creation_form').hide();
    form_field.appendTo('.fabric_creation_form');
    $(document).on('click', '.create_button', FabricCreation.display_form)
  },
  display_form: function() {
    $('.fabric_creation_form').show();
  }
};

$(document).ready(FabricCreation.setup);