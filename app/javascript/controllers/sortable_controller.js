import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs';
import { put } from '@rails/request.js'

// Connects to data-controller="sortable"
export default class extends Controller {
  static values = {
    group: String
  }
  connect() {
    Sortable.create(this.element, {
      onEnd: this.onEnd.bind(this),
      animation: 300,
      group: this.groupValue,
    });
  }

  onEnd(event) {
    let sortableUpdateUrl = event.item.dataset.sortableUpdateUrl
    console.log(event.to.dataset)
    // console.log("NewIndex", event.newIndex)
    let sortableColumnId = event.to.dataset.sortableColumnId

    put(sortableUpdateUrl, {
      body: JSON.stringify({row_order_position: event.newIndex, column_id:sortableColumnId})
    })
  }
}
