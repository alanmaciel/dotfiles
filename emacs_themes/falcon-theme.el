;; falcon-theme.el -- falcon theme for emacs

;; Author: Kaleb Elwert <belak@coded.io>
;; Version: 0.1
;; Homepage: https://github.com/belak/falcon-theme-emacs

;;; Commentary:
;; Falcon is a combination of the ideas of my grayscale-theme and the
;; colors of the falcon vim theme.  The general idea is that more
;; important things have brighter colors and less important things
;; will be toned down.  Highlights like red, orange, yellow, etc
;; should be used sparingly, focusing mostly on the grays.
;;
;; Original colors by fenetikm at https://github.com/fenetikm/falcon.

;;; Code:

(defvar falcon-theme-colors
  '(;; Primary - these come from the falcon theme, but they've been
    ;; renamed to make more sense to me.
    :red-1         "#663829"
    :red           "#ff4000"
    :orange        "#ff8000"
    :yellow-1      "#665729"
    :yellow        "#ffbf00"
    :yellow+1      "#ffefbf"
    :green-1       "#476629"
    :green         "#779954"
    :green+1       "#dfffbf"
    :blue          "#8fa3bf"
    :blue+1        "#bfdaff"
    :fg+1          "#fdfdff"
    ;;:fg+1          "#d4d4d9"
    :fg            "#afafb2"
    :fg-1          "#89898c"
    :fg-2          "#808080"

    :bg+3          "#646466"
    :bg+2          "#3e3e40"
    :bg+1          "#252527"
    :bg            "#0b0b1a"
    :bg-1          "#000002"

    ;; Special
    :magenta      "#ff5fff"

    ;; Terminal - some of these are copies from above, but to make it
    ;; clearer all of them are defined in separate values.
    :term-fg       "#e1e1e6"
    :term-bg       "#0b0b1a"
    :term-cursor   "#faf4c6"
    :term-red      "#ff4000"
    :term-red+1    "#ff794c"
    :term-orange   "#ff8000"
    :term-orange+1 "#ffac59"
    :term-yellow   "#ffbf00"
    :term-yellow+1 "#ffd966"
    :term-green    "#598033"
    :term-green+1  "#85a663"
    :term-blue     "#306cbf"
    :term-blue+1   "#8fa3bf"
    :term-cyan     "#30bfa7"
    :term-cyan+1   "#85ccc0"
    :term-white    "#d4d4d9"
    :term-white+1  "#fdfdff"
    :term-black    "#00000"
    :term-black+1  "#0b0b1a"))

(defun falcon-theme-transform-spec (spec colors)
  "Transform a theme `SPEC' into a face spec using `COLORS'."
  (let ((output))
    (while spec
      (let* ((key       (car  spec))
             (value     (cadr spec))
             (color-key (if (symbolp value) (intern (concat ":" (symbol-name value))) nil))
             (color     (plist-get colors color-key)))

        ;; Append the transformed element
        (cond
         ((and (memq key '(:box :underline)) (listp value))
          (setq output (append output (list key (falcon-theme-transform-spec value colors)))))
         (color
          (setq output (append output (list key color))))
         (t
          (setq output (append output (list key value))))))

      ;; Go to the next element in the list
      (setq spec (cddr spec)))

    ;; Return the transformed spec
    output))

(defun falcon-theme-transform-face (spec colors)
  "Transform a face `SPEC' into an Emacs theme face definition using `COLORS'."
  (let* ((face             (car spec))
         (definition       (cdr spec)))

    (list face `((t ,(falcon-theme-transform-spec definition colors))))))

(defun falcon-theme-set-faces (faces)
  "Define the important part of `THEME-NAME' using `COLORS' to map the `FACES' to actual colors."
  (apply 'custom-theme-set-faces 'falcon
         (mapcar #'(lambda (face)
                     (falcon-theme-transform-face face falcon-theme-colors))
                 faces)))


(deftheme falcon)
(falcon-theme-set-faces
 '(
;;; Built-in

;;;; basic colors
   (border                                       :background bg+2)
   (cursor                                       :background fg-1)
   (default                                      :foreground fg :background bg)
   (fringe                                       :background bg+2)
   (gui-element                                  :background bg+1)
   (header-line                                  :background nil :inherit mode-line)
   (highlight                                    :background bg+1)
   (link                                         :foreground blue :underline t)
   (link-visited                                 :foreground magenta :underline t)
   (minibuffer-prompt                            :foreground blue)
   (region                                       :background bg+2)
   (secondary-selection                          :background bg+2)
   (trailing-whitespace                          :foreground yellow :inverse-video t)
   (widget-button                                :underline t)

   (link                                         :foreground blue :underline t)
   (link-visited                                 :foreground yellow+1 :underline t)

   (error                                        :foreground red)
   (warning                                      :foreground orange)
   (success                                      :foreground green)

;;; font-lock
   (font-lock-builtin-face                       :foreground fg+1)
   (font-lock-comment-delimiter-face             :foreground fg-1)
   (font-lock-comment-face                       :foreground fg-1)
   (font-lock-constant-face                      :foreground blue)
   (font-lock-doc-face                           :foreground fg-1)
   (font-lock-doc-string-face                    :foreground fg-1)
   (font-lock-function-name-face                 :foreground fg+1)
   (font-lock-keyword-face                       :foreground fg+1)
   (font-lock-negation-char-face                 :foreground fg-1)
   (font-lock-preprocessor-face                  :foreground fg-1)
   (font-lock-regexp-grouping-backslash          :foreground fg-1)
   (font-lock-regexp-grouping-construct          :foreground fg)
   (font-lock-string-face                        :foreground fg-1)
   (font-lock-type-face                          :foreground fg)
   (font-lock-variable-name-face                 :foreground blue)
   (font-lock-warning-face                       :foreground yellow)

;;;; isearch
   (match                                        :foreground yellow+1 :inverse-video t)
   (isearch                                      :foreground green+1 :inverse-video t)
   (lazy-highlight                               :foreground blue+1 :inverse-video t)
   (isearch-fail                                 :foreground red :inverse-video t)

;;;; line-numbers
   (line-number                                  :foreground fg-1 :background bg+1)
   (line-number-current-line                     :inverse-video t :inherit line-number)

;;;; mode-line
   (mode-line                                    :foreground fg-1 :background bg+2 :box (:line-width -1 :style released-button))
   (mode-line-buffer-id                          :foreground blue :background nil)
   (mode-line-emphasis                           :foreground fg+1 :slant italic)
   (mode-line-highlight                          :foreground blue :box nil :weight bold)
   (mode-line-inactive                           :foreground fg-1 :background bg+1 :box (:line-width -1 :style released-button))

;;; Third-party

;;;; flycheck-mode
   (flycheck-error                               :underline (:style wave :color red))
   (flycheck-info                                :underline (:style wave :color yellow))
   (flycheck-warning                             :underline (:style wave :color orange))

;;;; helm
   ;; TODO: Clean up and finalize these colors
   (helm-M-x-key                                 :foreground blue)
   (helm-action                                  :foreground fg)
   (helm-buffer-directory                        :foreground fg-1 :background nil :weight bold)
   (helm-buffer-file                             :foreground blue)
   (helm-buffer-not-saved                        :foreground red)
   (helm-buffer-process                          :foreground fg-1)
   (helm-buffer-saved-out                        :foreground red-1)
   (helm-buffer-size                             :foreground orange)
   (helm-candidate-number                        :foreground orange)
   (helm-ff-directory                            :foreground fg-1 :background nil :weight bold)
   (helm-ff-executable                           :foreground green)
   (helm-ff-file                                 :foreground blue)
   (helm-ff-invalid-symlink                      :foreground bg :background red)
   (helm-ff-prefix                               :foreground nil :background nil)
   (helm-ff-symlink                              :foreground bg :background blue)
   (helm-grep-cmd-line                           :foreground green)
   (helm-grep-file                               :foreground blue)
   (helm-grep-finish                             :foreground bg :background orange)
   (helm-grep-lineno                             :foreground fg-1)
   (helm-grep-match                              :foreground yellow)
   (helm-grep-running                            :foreground orange)
   (helm-header                                  :foreground yellow :background bg :underline nil)
   (helm-match                                   :foreground yellow)
   (helm-moccur-buffer                           :foreground blue)
   (helm-selection                               :foreground nil :background bg+2 :underline nil)
   (helm-selection-line                          :foreground nil :background bg+2)
   (helm-separator                               :foreground bg+1)
   (helm-source-header                           :foreground fg :background bg+1 :weight bold)
   (helm-visible-mark                            :foreground bg :background green)

;;;; hl-line-mode
   (hl-line                                      :background bg+1)

;;;; spaceline
   (spaceline-evil-emacs                         :foreground bg :background blue)
   (spaceline-evil-insert                        :foreground bg :background green)
   (spaceline-evil-motion                        :foreground bg :background red)
   (spaceline-evil-normal                        :foreground bg :background yellow)
   (spaceline-evil-replace                       :foreground bg :background orange)
   (spaceline-evil-visual                        :inverse-video t)
   (spaceline-flycheck-error                     :foreground red)
   (spaceline-flycheck-info                      :foreground blue)
   (spaceline-flycheck-warning                   :foreground orange)
   ))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide 'falcon-theme)
;;; falcon-theme.el ends here
