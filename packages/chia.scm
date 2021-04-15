(define-module (ze-guix packages chia)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system python)
  #:use-module (gnu packages check)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-check))

(define-public python-portalocker
  (package
    (name "python-portalocker")
    (version "2.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "portalocker" version))
       (sha256
        (base32
         "0k08c0qg21mwz3iqbd20ab22nq705q7cal4a1qr8qnd6ga03v4af"))))
    (build-system python-build-system)
    (propagated-inputs
     ;; wtf? surely we don't need that on Linux
     `(("python-pywin32" ,python-pywin32)))
    ;; can we just skip these since this is only for testing?
    (native-inputs
     `(("python-pytest" ,python-pytest)
       ("python-pytest-cov" ,python-pytest-cov)
       ("python-pytest-flake8" ,python-pytest-flake8)
       ("python-pytest-mypy" ,python-pytest-mypy)
       ("python-redis" ,python-redis)
       ("python-sphinx" ,python-sphinx)))
    (home-page
     "https://github.com/WoLpH/portalocker")
    (synopsis
     "Wraps the portalocker recipe for easy usage")
    (description
     "Wraps the portalocker recipe for easy usage")
    (license #f)))

(define-public python-concurrent-log-handler
  (package
    (name "python-concurrent-log-handler")
    (version "0.9.19")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "concurrent-log-handler" version))
       (sha256
        (base32
         "02fl6zf6h85b6maizxkgxj19523xnp6j976f4lf1551zxnmpjbxi"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-portalocker" ,python-portalocker)))
    (home-page
     "https://github.com/Preston-Landers/concurrent-log-handler")
    (synopsis
     "RotatingFileHandler replacement with concurrency, gzip and Windows support")
    (description
     "RotatingFileHandler replacement with concurrency, gzip and Windows support")
    (license #f)))

;; TIL: guix import pypi 'keyrings.cryptfile/1.3.4'

;; TODO we should probably define python-keyrings.cryptfile to track
;; latest version, then here define its variant that inherits from it,
;; changes version and hash.
(define-public python-keyrings.cryptfile
  (package
    (name "python-keyrings.cryptfile")
    (version "1.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "keyrings.cryptfile" version))
       (sha256
	(base32
	 "19wgnsg0j2zrvdbk23j7h28q997vkqhx1rg71gyfgidyr4l9qvwd"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-argon2-cffi" ,python-argon2-cffi)
       ("python-keyring" ,python-keyring)
       ("python-pycryptodome" ,python-pycryptodome)))
    (home-page
     "https://github.com/frispete/keyrings.cryptfile")
    (synopsis "Encrypted file keyring backend")
    (description "Encrypted file keyring backend")
    (license #f)))

(define-public python-blspy
  (package
    (name "python-blspy")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "blspy" version))
       (sha256
	(base32
	 "0kilkk2n98jhzddiibchxhaxz90bw6vw848y1qr2ywdsavnm70v1"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-wheel" ,python-wheel)))
    (home-page
     "https://github.com/Chia-Network/bls-signatures")
    (synopsis
     "BLS signatures in c++ (with python bindings)")
    (description
     "BLS signatures in c++ (with python bindings)")
    (license #f)))

(define-public python-chiavdf
  (package
    (name "python-chiavdf")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "chiavdf" version))
       (sha256
	(base32
	 "0rf6qlwrd1izl6kjaa2ra8rdadpf92ir8ddfywzcvry7bbyisjng"))))
    (build-system python-build-system)
    (home-page
     "https://github.com/Chia-Network/chiavdf")
    (synopsis "Chia vdf verification (wraps C++)")
    (description "Chia vdf verification (wraps C++)")
    (license #f)))

(define-public python-chiabip158
  (package
    (name "python-chiabip158")
    (version "1.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "chiabip158" version))
       (sha256
	(base32
	 "0pv11xhlaiafnx5vydl3q1jbhwp4pdl5lgv684qgpf7lgpi80vkl"))))
    (build-system python-build-system)
    (home-page
     "https://github.com/Chia-Network/chiabip158")
    (synopsis "Chia BIP158 (wraps C++)")
    (description "Chia BIP158 (wraps C++)")
    (license #f)))

(define-public python-chiapos
  (package
    (name "python-chiapos")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "chiapos" version))
       (sha256
	(base32
	 "03wf9a3fcmn9y9h50drmz1rsl5b2k0vlprwq6b31lg3h9gn7k74h"))))
    (build-system python-build-system)
    (home-page
     "https://github.com/Chia-Network/chiavdf")
    (synopsis
     "Chia proof of space plotting, proving, and verifying (wraps C++)")
    (description
     "Chia proof of space plotting, proving, and verifying (wraps C++)")
    (license #f)))

;; TODO (define-public python-clvm)

(define-public python-clvm-rs
  (package
    (name "python-clvm-rs")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "clvm-rs" version))
       (sha256
	(base32
	 "14cp4rwb73liqk827mw861z7fxwnli28sx742v3mxcsk303yp448"))))
    (build-system python-build-system)
    (home-page "")
    (synopsis "")
    (description "")
    (license #f)))

;; TODO (define-public python-clvm-tools)

;; If we eval buffer we know what's currently missing:
;; 
;; <stdin>:3139:5: warning: possibly unbound variable `python-pywin32'
;; <stdin>:3142:5: warning: possibly unbound variable `python-pytest-mypy'
;; <stdin>:3313:5: warning: possibly unbound variable `python-clvm'
;; <stdin>:3313:5: warning: possibly unbound variable `python-clvm-tools'

;; TODO may also need to pull in miniupnpc which is an extra_requires

(define-public python-chia-blockchain
  (package
    (name "python-chia-blockchain")
    (version "1.0.5")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "chia-blockchain" version))
       (sha256
	(base32
	 "0v2iralxhhv84mhfb1n2fg9gsij434l1ylh1sn0sf4dbkn92qsbs"))))
    (build-system python-build-system)
    (propagated-inputs
     `(("python-aiohttp" ,python-aiohttp)
       ("python-aiosqlite" ,python-aiosqlite)
       ("python-bitstring" ,python-bitstring)
       ("python-blspy" ,python-blspy)
       ("python-chiabip158" ,python-chiabip158)
       ("python-chiapos" ,python-chiapos)
       ("python-chiavdf" ,python-chiavdf)
       ("python-click" ,python-click)
       ("python-clvm" ,python-clvm)
       ("python-clvm-rs" ,python-clvm-rs)
       ("python-clvm-tools" ,python-clvm-tools)
       ("python-colorlog" ,python-colorlog)
       ("python-concurrent-log-handler"
	,python-concurrent-log-handler)
       ("python-cryptography" ,python-cryptography)
       ("python-keyring" ,python-keyring)
       ("python-keyrings.cryptfile"
	,python-keyrings.cryptfile)
       ("python-pyyaml" ,python-pyyaml)
       ("python-setproctitle" ,python-setproctitle)
       ("python-sortedcontainers"
	,python-sortedcontainers)
       ("python-websockets" ,python-websockets)))
    (native-inputs
     `(("python-black" ,python-black)
       ("python-flake8" ,python-flake8)
       ("python-mypy" ,python-mypy)
       ("python-pytest" ,python-pytest)
       ("python-pytest-asyncio" ,python-pytest-asyncio)))
    (home-page "https://chia.net/")
    (synopsis
     "Chia blockchain full node, farmer, timelord, and wallet.")
    (description
     "Chia blockchain full node, farmer, timelord, and wallet.")
    (license #f)))
