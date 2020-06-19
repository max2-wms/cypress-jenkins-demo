/// <reference types="cypress" />

describe('First test', () => {
  beforeEach(() => {
    cy.visit('http://localhost:4200');
  });

  describe('Landing page', () => {
    it('Should be displayed', () => {
      cy.location().should((loc) => {
        expect(loc.hostname).to.eq('localhost');
      });
    });
  });
});
