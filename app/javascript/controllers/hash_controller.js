import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['inputsTemplate'];

  add = (_event) => {
    const inputs = this.inputsTemplateTarget.content.cloneNode(true);
    const lastInput = this.element.querySelector('.form-inputs').lastChild;
    const addBtn = lastInput.querySelector('button');
    lastInput.after(inputs);
    this.element.querySelector('.key-value-pair:last-of-type').lastChild.after(addBtn);
  }
}
