import NestedForm from 'stimulus-rails-nested-form'

export default class extends NestedForm {
  connect() {
    super.connect()
    const quantityField = this.element.querySelector('[data-target="nested-form.quantity-field"]')
    console.log('value: ', quantityField)
  }
}
