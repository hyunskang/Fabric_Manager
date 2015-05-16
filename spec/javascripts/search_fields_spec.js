describe('SearchFields', function() {
  beforeEach(function() {
    loadFixtures('search_fields.html');
  });

  describe('display fields', function(){
    it('displays the search fields', function() {
      $('#activate_field').trigger('click');
      expect($('#fabric_input_field')).toBeVisible();
    });
  });
});