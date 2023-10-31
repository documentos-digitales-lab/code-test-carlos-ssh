import NestedForm from 'stimulus-rails-nested-form'

export default class extends NestedForm {
  static targets = ["newRecord"];

  connect() {
    console.log('newRecord', this.newRecord)
  }
}

