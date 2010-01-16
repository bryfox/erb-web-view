Screw.Unit(function() {
  describe('This app', function() {
    var result;
    before(function() {
    });
    
    describe('#someFunctionality', function() {
      it("knows what true is", function() {
        result = true;
        expect(result).to(equal, true);
      });
    });

  });
});