describe('FabricCreation', function() {
  beforeEach(function () {
    loadFixtures('create_fabrics_fixture.html');
  });

  describe('display_form', function() {
    it('shows the fabric creation form', function() {
      $('#create_button').trigger('click');
      expect($('#fabric_creation_form')).toBeVisible();
    });
  });
});