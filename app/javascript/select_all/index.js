const selectAll = {
    start() {
        const targetKeywords = this.extractCheckboxTargets();
        let that = this;

        targetKeywords.forEach(function(targetKeyword){
            that.bindCheckboxes(targetKeyword);
        });
    },

    extractCheckboxTargets() {
        const checkboxes = document.querySelectorAll("input[data-select-all]");
        const targetKeywords = [];
        checkboxes.forEach(function(el) {
            targetKeywords.push(el.dataset.selectAll);
        });

        return targetKeywords;
    },

    bindCheckboxes(targetKeyword) {
        const boxesToSelect = document.querySelectorAll(`input[data-select-all-target=${targetKeyword}`);
        const controllerCheckbox = document.querySelector(`input[data-select-all=${targetKeyword}]`);
        controllerCheckbox.onclick = function() {
            let checkedStatus = controllerCheckbox.checked;
            boxesToSelect.forEach(function(targetBox) {
                targetBox.checked = checkedStatus
            });
        }
    }
}

export default selectAll;
