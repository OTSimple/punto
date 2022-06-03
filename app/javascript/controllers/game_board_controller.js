import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"]
  connect() {
    this.isMoving = false
    this.boundHandleMouseMove = this.handleMouseMove.bind(this)

    this.currentXTranslation = 0;
    this.currentYTranslation = 0;

    this.bounds = {
      left: [ 150, (this.contentTarget.clientWidth * -1)],
      top: [ 150, (this.contentTarget.clientHeight * -1) - 150 ],
    }
  }

  followMouse(e) {
    console.log("flllw", e)
    this.isMoving = true;
    this.offset = [
      this.contentTarget.offsetLeft - e.clientX,
      this.contentTarget.offsetTop - e.clientY
    ]

    this.mouseMoveListener = this.element.addEventListener('mousemove', this.boundHandleMouseMove)
    document.documentElement.addEventListener('mouseleave', (e) => this.unfollowMouse())
  }

  unfollowMouse(e) {
    this.element.removeEventListener('mousemove', this.boundHandleMouseMove)
    this.isMoving = false
  }

  handleMouseMove(e) {
    if (this.isMoving) {
      const targetPosition = {
        x: e.clientX + this.offset[0],
        y: e.clientY + this.offset[1]
      }

      console.log("this.bounds", this.bounds)

      // Limit the move to 150px on the right and -150px on the left
      if (targetPosition.x > 0 && targetPosition.x >= this.bounds.left[0]) {
        targetPosition.x = this.bounds.left[0]
      } else if (targetPosition.x < 0 && targetPosition.x <= this.bounds.left[1]) {
        targetPosition.x = this.bounds.left[1]
      }

      this.contentTarget.style.left = targetPosition.x + 'px';
      this.contentTarget.style.top  = targetPosition.y + 'px';
    }
  }
}
