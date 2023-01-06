import selectAll from "select_all";

describe('start', () => {
    it('sets listeners on controlling checkboxes', () => {
        const targetKeyword = "ready"

        // Mocking html expected from Ruby code - code that is tested by rspec at catalog_helper.spec.rb
        document.body.innerHTML =
            `<input type="checkbox" name="ready_holds" data-select-all="${targetKeyword}">` +
            `<input type="checkbox" data-checkbox-type="${targetKeyword}">` +
            `<input type="checkbox" data-checkbox-type="${targetKeyword}">` +
            `<input type="checkbox" data-checkbox-type="${targetKeyword}">`;

        const controllerCheckbox = document.querySelector(`input[data-select-all="${targetKeyword}"]`);
        selectAll.start();

        // Tests if the onclick gets set for the controller checkbox
        expect(controllerCheckbox.onclick).toEqual(expect.anything());
    });
});

