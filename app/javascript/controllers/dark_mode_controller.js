import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ["switch"]
  static values = { color: String }

  connect() {
    if (['dark', 'light'].includes(this.colorValue)) return

    this.setDefaultSchemeColor()
  }

  setDefaultSchemeColor() {
    const systemIsDark = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;
    this.savePreference(systemIsDark)
    this.updateView(systemIsDark)
  }

  toggle(e) {
    e.preventDefault()

    const newStatus = !this.switchTarget.checked
    this.savePreference(newStatus)
    this.updateView(newStatus)
  }

  updateView(status) {
    this.toggleHtmlClass(status)
    this.switchTarget.checked = status
  }

  toggleHtmlClass(status) {
    const htmlElement = document.querySelector('html').classList
    status ? htmlElement.add('dark') : htmlElement.remove('dark')
  }

  savePreference(status) {
    const preference = status ? 'dark' : 'light'
    this.sendColorPreference(preference)
  }

  async sendColorPreference(preference) {
    try {
      const response = await fetch('/preferences/scheme_color', {
        method: 'POST',
        headers: { "Content-Type": 'application/json' },
        body: JSON.stringify({ color: preference })
      });
      await response.text()
    } catch (error) {
      console.error("Error sending color preference:", error)
    }
  }
}
