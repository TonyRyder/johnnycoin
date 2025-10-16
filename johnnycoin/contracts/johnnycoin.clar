;; JohnnyCoin - A fungible token implementation
;; This contract implements a fungible token with minting, burning, and transfer capabilities

;; Define the fungible token
(define-fungible-token johnnycoin)

;; Constants
(define-constant CONTRACT-OWNER tx-sender)
(define-constant ERR-OWNER-ONLY (err u100))
(define-constant ERR-NOT-TOKEN-OWNER (err u101))
(define-constant ERR-INSUFFICIENT-BALANCE (err u102))
(define-constant ERR-INVALID-AMOUNT (err u103))

;; Data variables
(define-data-var token-name (string-ascii 32) "JohnnyCoin")
(define-data-var token-symbol (string-ascii 10) "JCN")
(define-data-var token-decimals uint u6)
(define-data-var total-supply uint u0)

;; Read-only functions
(define-read-only (get-name)
  (ok (var-get token-name))
)

(define-read-only (get-symbol)
  (ok (var-get token-symbol))
)

(define-read-only (get-decimals)
  (ok (var-get token-decimals))
)

(define-read-only (get-balance (who principal))
  (ok (ft-get-balance johnnycoin who))
)

(define-read-only (get-total-supply)
  (ok (ft-get-supply johnnycoin))
)

;; Transfer function
(define-public (transfer (amount uint) (from principal) (to principal) (memo (optional (buff 34))))
  (begin
    (asserts! (or (is-eq from tx-sender) (is-eq from contract-caller)) ERR-NOT-TOKEN-OWNER)
    (asserts! (> amount u0) ERR-INVALID-AMOUNT)
    (ft-transfer? johnnycoin amount from to)
  )
)

;; Mint function (only contract owner)
(define-public (mint (amount uint) (to principal))
  (begin
    (asserts! (is-eq tx-sender CONTRACT-OWNER) ERR-OWNER-ONLY)
    (asserts! (> amount u0) ERR-INVALID-AMOUNT)
    (ft-mint? johnnycoin amount to)
  )
)

;; Burn function
(define-public (burn (amount uint) (from principal))
  (begin
    (asserts! (or (is-eq from tx-sender) (is-eq from contract-caller)) ERR-NOT-TOKEN-OWNER)
    (asserts! (> amount u0) ERR-INVALID-AMOUNT)
    (ft-burn? johnnycoin amount from)
  )
)

;; Initialize the contract with initial supply to the contract owner
(define-private (initialize)
  (begin
    (try! (ft-mint? johnnycoin u1000000000000 CONTRACT-OWNER))
    (var-set total-supply u1000000000000)
    (ok true)
  )
)

;; Initialize the contract on deployment
(initialize)

;; title: johnnycoin
;; version:
;; summary:
;; description:

;; traits
;;

;; token definitions
;;

;; constants
;;

;; data vars
;;

;; data maps
;;

;; public functions
;;

;; read only functions
;;

;; private functions
;;

