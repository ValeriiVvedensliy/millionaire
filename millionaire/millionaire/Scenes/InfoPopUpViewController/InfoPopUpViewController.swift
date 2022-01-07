import UIKit

public class InfoPopUpViewController: UIViewController {
  private var titleText: String
  private var messageText: String
  private var confirmButtonText: String

  @IBOutlet private var titleLabel: UILabel!
  @IBOutlet private var messageLabel: UILabel!
  @IBOutlet private var confirmButton: UIButton!
  @IBOutlet private var rootView: UIView!

  public init(
    titleText: String,
    messageText: String,
    confirmButtonText: String
  ) {
    self.titleText = titleText
    self.messageText = messageText
    self.confirmButtonText = confirmButtonText
    super.init(nibName: "InfoPopUpViewController", bundle: Bundle(for: InfoPopUpViewController.self))
  }

  public required init?(coder aDecoder: NSCoder) {
    titleText = ""
    messageText = ""
    confirmButtonText = ""

    super.init(coder: aDecoder)
  }

  override public func viewDidLoad() {
    super.viewDidLoad()

    setupMainView()
    setupTitleLabel()
    setupRootView()
    setupMessageLabel()
    setupConfirmButton()
  }

  private func setupMainView() {
    view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
  }

  private func setupRootView() {
    rootView.backgroundColor = UIColor.Purpure
    rootView.layer.cornerRadius = 16
  }

  private func setupConfirmButton() {
    confirmButton.backgroundColor = .clear
    confirmButton.setTitle(confirmButtonText, for: .normal)
    confirmButton.setTitleColor(.white, for: .normal)
    confirmButton.layer.cornerRadius = confirmButton.frame.height / 2
    confirmButton.addTarget(self, action: #selector(tapButton(_:)), for: .touchDown)
  }

  private func setupTitleLabel() {
    titleLabel.attributedText = titleText.centeredAttributedString(
      font: UIFont.systemFont(ofSize: 17),
      foreground: .white,
      sketchLineHeight: 22
    )
  }

  private func setupMessageLabel() {
    messageLabel.attributedText = messageText.centeredAttributedString(
      font: UIFont.systemFont(ofSize: 14),
      foreground: .white,
      sketchLineHeight: 20
    )
  }

  @objc
  func tapButton(_ sender: UITapGestureRecognizer? = nil) {
    dismiss(animated: true, completion: nil)
  }
}
