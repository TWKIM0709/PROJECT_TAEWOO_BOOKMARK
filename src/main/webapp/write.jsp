<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko" class="" style="overflow: hidden;">
<head>
<style id="editor-js-styles">
.codex-editor {
	position: relative;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	z-index: 1
}

.codex-editor .hide, .codex-editor__redactor--hidden {
	display: none
}

.codex-editor__redactor [contenteditable]:empty:after {
	content: "\feff "
}

@media ( min-width :651px) {
	.codex-editor--narrow .codex-editor__redactor {
		margin-right: 50px
	}
}

@media ( min-width :651px) {
	.codex-editor--narrow.codex-editor--rtl .codex-editor__redactor {
		margin-left: 50px;
		margin-right: 0
	}
}

@media ( min-width :651px) {
	.codex-editor--narrow .ce-toolbar__actions {
		right: -5px
	}
}

.codex-editor__loader {
	position: relative;
	height: 30vh
}

.codex-editor__loader:before {
	content: "";
	position: absolute;
	left: 50%;
	top: 50%;
	width: 30px;
	height: 30px;
	margin-top: -15px;
	margin-left: -15px;
	border-radius: 50%;
	border: 2px solid rgba(201, 201, 204, .48);
	border-top-color: transparent;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-animation: editor-loader-spin .8s linear infinite;
	animation: editor-loader-spin .8s linear infinite;
	will-change: transform
}

.codex-editor-copyable {
	position: absolute;
	height: 1px;
	width: 1px;
	top: -400%;
	opacity: .001
}

.codex-editor-overlay {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	z-index: 999;
	pointer-events: none;
	overflow: hidden
}

.codex-editor-overlay__container {
	position: relative;
	pointer-events: auto;
	z-index: 0
}

.codex-editor-overlay__rectangle {
	position: absolute;
	pointer-events: none;
	background-color: rgba(46, 170, 220, .2);
	border: 1px solid transparent
}

.codex-editor svg {
	fill: currentColor;
	vertical-align: middle;
	max-height: 100%
}

::-moz-selection {
	background-color: #d4ecff
}

::selection {
	background-color: #d4ecff
}

.codex-editor--toolbox-opened [contentEditable=true][data-placeholder]:focus:before
	{
	opacity: 0 !important
}

@
-webkit-keyframes editor-loader-spin { 0%{
	-webkit-transform: rotate(0deg);
	transform: rotate(0deg)
}

to {
	-webkit-transform: rotate(1turn);
	transform: rotate(1turn)
}

}
@
keyframes editor-loader-spin { 0%{
	-webkit-transform: rotate(0deg);
	transform: rotate(0deg)
}

to {
	-webkit-transform: rotate(1turn);
	transform: rotate(1turn)
}

}
.ce-toolbar {
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	-webkit-transition: opacity .1s ease;
	transition: opacity .1s ease;
	will-change: opacity, transform;
	display: none
}

@media ( max-width :650px) {
	.ce-toolbar {
		position: absolute;
		background-color: #fff;
		border: 1px solid #eaeaea;
		-webkit-box-shadow: 0 3px 15px -3px rgba(13, 20, 33, .13);
		box-shadow: 0 3px 15px -3px rgba(13, 20, 33, .13);
		border-radius: 4px;
		z-index: 2
	}
}

@media ( max-width :650px) and (max-width:650px) {
	.ce-toolbar {
		-webkit-box-shadow: 0 13px 7px -5px rgba(26, 38, 49, .09), 6px 15px 34px
			-6px rgba(33, 48, 73, .29);
		box-shadow: 0 13px 7px -5px rgba(26, 38, 49, .09), 6px 15px 34px -6px
			rgba(33, 48, 73, .29);
		border-bottom-color: #d5d7db
	}
}

@media ( max-width :650px) {
	.ce-toolbar {
		padding: 3px;
		margin-top: 5px
	}
	.ce-toolbar--left-oriented:before {
		left: 15px;
		margin-left: 0
	}
	.ce-toolbar--right-oriented:before {
		left: auto;
		right: 15px;
		margin-left: 0
	}
}

.ce-toolbar--opened {
	display: block
}

@media ( max-width :650px) {
	.ce-toolbar--opened {
		display: -webkit-box;
		display: -ms-flexbox;
		display: flex
	}
}

.ce-toolbar__content {
	max-width: 650px;
	margin: 0 auto;
	position: relative
}

@media ( max-width :650px) {
	.ce-toolbar__content {
		display: -webkit-box;
		display: -ms-flexbox;
		display: flex;
		-ms-flex-line-pack: center;
		align-content: center;
		margin: 0;
		max-width: calc(100% - 35px)
	}
}

.ce-toolbar__plus {
	color: #707684;
	cursor: pointer;
	width: 34px;
	height: 34px;
	display: -webkit-inline-box;
	display: -ms-inline-flexbox;
	display: inline-flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	position: absolute;
	left: -34px;
	-ms-flex-negative: 0;
	flex-shrink: 0
}

.ce-toolbar__plus--active, .ce-toolbar__plus:hover {
	color: #388ae5
}

.ce-toolbar__plus--active {
	-webkit-animation: bounceIn .75s 1;
	animation: bounceIn .75s 1;
	-webkit-animation-fill-mode: forwards;
	animation-fill-mode: forwards
}

.ce-toolbar__plus-shortcut {
	opacity: .6;
	word-spacing: -2px;
	margin-top: 5px
}

.ce-toolbar__plus--hidden {
	display: none
}

@media ( max-width :650px) {
	.ce-toolbar__plus {
		display: -webkit-inline-box !important;
		display: -ms-inline-flexbox !important;
		display: inline-flex !important;
		position: static;
		-webkit-transform: none !important;
		transform: none !important
	}
}

.ce-toolbar .ce-toolbox, .ce-toolbar__plus {
	top: 50%;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%)
}

.ce-toolbar__actions {
	position: absolute;
	right: -30px;
	top: 5px;
	opacity: 0
}

@media ( max-width :650px) {
	.ce-toolbar__actions {
		position: absolute;
		right: -28px;
		top: 50%;
		-webkit-transform: translateY(-50%);
		transform: translateY(-50%);
		display: -webkit-box;
		display: -ms-flexbox;
		display: flex;
		-webkit-box-align: center;
		-ms-flex-align: center;
		align-items: center
	}
}

.ce-toolbar__actions--opened {
	opacity: 1
}

.ce-toolbar__actions-buttons {
	text-align: right
}

.ce-toolbar__settings-btn {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	width: 18px;
	height: 18px;
	color: #707684;
	cursor: pointer;
	background: #eff2f5;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none
}

.ce-toolbar__settings-btn:hover {
	color: #1d202b
}

@media ( max-width :650px) {
	.ce-toolbar__settings-btn {
		background: transparent
	}
}

@media ( min-width :651px) {
	.codex-editor--narrow .ce-toolbar__plus {
		left: 5px
	}
}

.ce-toolbox {
	position: absolute;
	visibility: hidden;
	-webkit-transition: opacity .1s ease;
	transition: opacity .1s ease;
	will-change: opacity;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: horizontal;
	-webkit-box-direction: normal;
	-ms-flex-direction: row;
	flex-direction: row
}

@media ( max-width :650px) {
	.ce-toolbox {
		position: static;
		-webkit-transform: none !important;
		transform: none !important;
		-webkit-box-align: center;
		-ms-flex-align: center;
		align-items: center;
		overflow-x: auto
	}
}

.ce-toolbox--opened {
	opacity: 1;
	visibility: visible
}

.ce-toolbox__button {
	color: #707684;
	cursor: pointer;
	width: 34px;
	height: 34px;
	display: -webkit-inline-box;
	display: -ms-inline-flexbox;
	display: inline-flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-ms-flex-negative: 0;
	flex-shrink: 0
}

.ce-toolbox__button--active, .ce-toolbox__button:hover {
	color: #388ae5
}

.ce-toolbox__button--active {
	-webkit-animation: bounceIn .75s 1;
	animation: bounceIn .75s 1;
	-webkit-animation-fill-mode: forwards;
	animation-fill-mode: forwards
}

.ce-toolbox-button-tooltip__shortcut {
	opacity: .6;
	word-spacing: -3px;
	margin-top: 3px
}

@media ( min-width :651px) {
	.codex-editor--narrow .ce-toolbox {
		background: #fff;
		z-index: 2
	}
}

.ce-inline-toolbar {
	position: absolute;
	background-color: #fff;
	border: 1px solid #eaeaea;
	-webkit-box-shadow: 0 3px 15px -3px rgba(13, 20, 33, .13);
	box-shadow: 0 3px 15px -3px rgba(13, 20, 33, .13);
	border-radius: 4px;
	z-index: 2
}

@media ( max-width :650px) {
	.ce-inline-toolbar {
		-webkit-box-shadow: 0 13px 7px -5px rgba(26, 38, 49, .09), 6px 15px 34px
			-6px rgba(33, 48, 73, .29);
		box-shadow: 0 13px 7px -5px rgba(26, 38, 49, .09), 6px 15px 34px -6px
			rgba(33, 48, 73, .29);
		border-bottom-color: #d5d7db
	}
}

.ce-inline-toolbar {
	-webkit-transform: translateX(-50%) translateY(8px) scale(.9);
	transform: translateX(-50%) translateY(8px) scale(.9);
	opacity: 0;
	visibility: hidden;
	-webkit-transition: opacity .25s ease, -webkit-transform .15s ease;
	transition: opacity .25s ease, -webkit-transform .15s ease;
	transition: transform .15s ease, opacity .25s ease;
	transition: transform .15s ease, opacity .25s ease, -webkit-transform
		.15s ease;
	will-change: transform, opacity;
	top: 0;
	left: 0;
	z-index: 3
}

.ce-inline-toolbar--left-oriented:before {
	left: 15px;
	margin-left: 0
}

.ce-inline-toolbar--right-oriented:before {
	left: auto;
	right: 15px;
	margin-left: 0
}

.ce-inline-toolbar--showed {
	opacity: 1;
	visibility: visible;
	-webkit-transform: translateX(-50%);
	transform: translateX(-50%)
}

.ce-inline-toolbar--left-oriented {
	-webkit-transform: translateX(-23px) translateY(8px) scale(.9);
	transform: translateX(-23px) translateY(8px) scale(.9)
}

.ce-inline-toolbar--left-oriented.ce-inline-toolbar--showed {
	-webkit-transform: translateX(-23px);
	transform: translateX(-23px)
}

.ce-inline-toolbar--right-oriented {
	-webkit-transform: translateX(-100%) translateY(8px) scale(.9);
	transform: translateX(-100%) translateY(8px) scale(.9);
	margin-left: 23px
}

.ce-inline-toolbar--right-oriented.ce-inline-toolbar--showed {
	-webkit-transform: translateX(-100%);
	transform: translateX(-100%)
}

.ce-inline-toolbar [hidden] {
	display: none !important
}

.ce-inline-toolbar__toggler-and-button-wrapper {
	width: 100%;
	padding: 0 6px
}

.ce-inline-toolbar__buttons,
	.ce-inline-toolbar__toggler-and-button-wrapper {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex
}

.ce-inline-toolbar__dropdown {
	display: -webkit-inline-box;
	display: -ms-inline-flexbox;
	display: inline-flex;
	height: 34px;
	padding: 0 9px 0 10px;
	margin: 0 6px 0 -6px;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	cursor: pointer;
	border-right: 1px solid rgba(201, 201, 204, .48)
}

.ce-inline-toolbar__dropdown:hover {
	background: #eff2f5
}

.ce-inline-toolbar__dropdown--hidden {
	display: none
}

.ce-inline-toolbar__dropdown-content {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	font-weight: 500;
	font-size: 14px
}

.ce-inline-toolbar__dropdown-content svg {
	height: 12px
}

.ce-inline-toolbar__dropdown .icon--toggler-down {
	margin-left: 4px
}

.ce-inline-toolbar__shortcut {
	opacity: .6;
	word-spacing: -3px;
	margin-top: 3px
}

.ce-inline-tool {
	display: -webkit-inline-box;
	display: -ms-inline-flexbox;
	display: inline-flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	width: 34px;
	height: 34px;
	line-height: 34px;
	padding: 0 !important;
	text-align: center;
	border-radius: 3px;
	cursor: pointer;
	border: 0;
	outline: none;
	background-color: transparent;
	vertical-align: bottom;
	color: #000;
	margin: 0
}

.ce-inline-tool:hover {
	background-color: #eff2f5
}

.ce-inline-tool {
	border-radius: 0;
	line-height: normal;
	width: auto;
	padding: 0 5px !important;
	min-width: 24px
}

.ce-inline-tool--active {
	color: #388ae5
}

.ce-inline-tool--focused {
	-webkit-box-shadow: inset 0 0 0 1px rgba(7, 161, 227, .08);
	box-shadow: inset 0 0 0 1px rgba(7, 161, 227, .08);
	background: rgba(34, 186, 255, .08) !important
}

.ce-inline-tool--focused-animated {
	-webkit-animation-name: buttonClicked;
	animation-name: buttonClicked;
	-webkit-animation-duration: .25s;
	animation-duration: .25s
}

.ce-inline-tool:not(:last-of-type) {
	margin-right: 2px
}

.ce-inline-tool .icon {
	height: 12px
}

.ce-inline-tool--link .icon--unlink, .ce-inline-tool--unlink .icon--link
	{
	display: none
}

.ce-inline-tool--unlink .icon--unlink {
	display: inline-block;
	margin-bottom: -1px
}

.ce-inline-tool-input {
	outline: none;
	border: 0;
	border-radius: 0 0 4px 4px;
	margin: 0;
	font-size: 13px;
	padding: 10px;
	width: 100%;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	display: none;
	font-weight: 500;
	border-top: 1px solid rgba(201, 201, 204, .48)
}

.ce-inline-tool-input::-webkit-input-placeholder {
	color: #707684
}

.ce-inline-tool-input::-moz-placeholder {
	color: #707684
}

.ce-inline-tool-input:-ms-input-placeholder {
	color: #707684
}

.ce-inline-tool-input::-ms-input-placeholder {
	color: #707684
}

.ce-inline-tool-input::placeholder {
	color: #707684
}

.ce-inline-tool-input--showed {
	display: block
}

.ce-conversion-toolbar {
	position: absolute;
	background-color: #fff;
	border: 1px solid #eaeaea;
	-webkit-box-shadow: 0 3px 15px -3px rgba(13, 20, 33, .13);
	box-shadow: 0 3px 15px -3px rgba(13, 20, 33, .13);
	border-radius: 4px;
	z-index: 2
}

@media ( max-width :650px) {
	.ce-conversion-toolbar {
		-webkit-box-shadow: 0 13px 7px -5px rgba(26, 38, 49, .09), 6px 15px 34px
			-6px rgba(33, 48, 73, .29);
		box-shadow: 0 13px 7px -5px rgba(26, 38, 49, .09), 6px 15px 34px -6px
			rgba(33, 48, 73, .29);
		border-bottom-color: #d5d7db
	}
}

.ce-conversion-toolbar {
	opacity: 0;
	visibility: hidden;
	will-change: transform, opacity;
	-webkit-transition: opacity .1s ease, -webkit-transform .1s ease;
	transition: opacity .1s ease, -webkit-transform .1s ease;
	transition: transform .1s ease, opacity .1s ease;
	transition: transform .1s ease, opacity .1s ease, -webkit-transform .1s
		ease;
	-webkit-transform: translateY(-8px);
	transform: translateY(-8px);
	left: -1px;
	width: 150px;
	margin-top: 5px;
	-webkit-box-sizing: content-box;
	box-sizing: content-box
}

.ce-conversion-toolbar--left-oriented:before {
	left: 15px;
	margin-left: 0
}

.ce-conversion-toolbar--right-oriented:before {
	left: auto;
	right: 15px;
	margin-left: 0
}

.ce-conversion-toolbar--showed {
	opacity: 1;
	visibility: visible;
	-webkit-transform: none;
	transform: none
}

.ce-conversion-toolbar [hidden] {
	display: none !important
}

.ce-conversion-toolbar__buttons {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex
}

.ce-conversion-toolbar__label {
	color: #707684;
	font-size: 11px;
	font-weight: 500;
	letter-spacing: .33px;
	padding: 10px 10px 5px;
	text-transform: uppercase
}

.ce-conversion-tool {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	padding: 5px 10px;
	font-size: 14px;
	line-height: 20px;
	font-weight: 500;
	cursor: pointer;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center
}

.ce-conversion-tool--hidden {
	display: none
}

.ce-conversion-tool--focused {
	-webkit-box-shadow: inset 0 0 0 1px rgba(7, 161, 227, .08);
	box-shadow: inset 0 0 0 1px rgba(7, 161, 227, .08);
	background: rgba(34, 186, 255, .08) !important
}

.ce-conversion-tool--focused-animated {
	-webkit-animation-name: buttonClicked;
	animation-name: buttonClicked;
	-webkit-animation-duration: .25s;
	animation-duration: .25s
}

.ce-conversion-tool:hover {
	background: #eff2f5
}

.ce-conversion-tool__icon {
	display: -webkit-inline-box;
	display: -ms-inline-flexbox;
	display: inline-flex;
	width: 20px;
	height: 20px;
	border: 1px solid rgba(201, 201, 204, .48);
	border-radius: 3px;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	margin-right: 10px;
	background: #fff
}

.ce-conversion-tool__icon svg {
	width: 11px;
	height: 11px
}

.ce-conversion-tool--last {
	margin-right: 0 !important
}

.ce-conversion-tool--active {
	color: #388ae5 !important;
	-webkit-animation: bounceIn .75s 1;
	animation: bounceIn .75s 1;
	-webkit-animation-fill-mode: forwards;
	animation-fill-mode: forwards
}

.ce-settings {
	position: absolute;
	background-color: #fff;
	border: 1px solid #eaeaea;
	-webkit-box-shadow: 0 3px 15px -3px rgba(13, 20, 33, .13);
	box-shadow: 0 3px 15px -3px rgba(13, 20, 33, .13);
	border-radius: 4px;
	z-index: 2
}

@media ( max-width :650px) {
	.ce-settings {
		-webkit-box-shadow: 0 13px 7px -5px rgba(26, 38, 49, .09), 6px 15px 34px
			-6px rgba(33, 48, 73, .29);
		box-shadow: 0 13px 7px -5px rgba(26, 38, 49, .09), 6px 15px 34px -6px
			rgba(33, 48, 73, .29);
		border-bottom-color: #d5d7db
	}
}

.ce-settings {
	right: -1px;
	top: 30px;
	min-width: 114px;
	-webkit-box-sizing: content-box;
	box-sizing: content-box
}

.ce-settings--left-oriented:before {
	left: 15px;
	margin-left: 0
}

.ce-settings--right-oriented:before {
	left: auto;
	right: 15px;
	margin-left: 0
}

@media ( max-width :650px) {
	.ce-settings {
		bottom: 40px;
		right: -11px;
		top: auto
	}
}

.ce-settings:before {
	left: auto;
	right: 12px
}

@media ( max-width :650px) {
	.ce-settings:before {
		bottom: -5px;
		top: auto
	}
}

.ce-settings {
	display: none
}

.ce-settings--opened {
	display: block;
	-webkit-animation-duration: .1s;
	animation-duration: .1s;
	-webkit-animation-name: panelShowing;
	animation-name: panelShowing
}

.ce-settings__plugin-zone:not(:empty) {
	padding: 3px 3px 0
}

.ce-settings__default-zone:not(:empty) {
	padding: 3px
}

.ce-settings__button {
	display: -webkit-inline-box;
	display: -ms-inline-flexbox;
	display: inline-flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	width: 34px;
	height: 34px;
	line-height: 34px;
	padding: 0 !important;
	text-align: center;
	border-radius: 3px;
	cursor: pointer;
	border: 0;
	outline: none;
	background-color: transparent;
	vertical-align: bottom;
	color: #000;
	margin: 0
}

.ce-settings__button:hover {
	background-color: #eff2f5
}

.ce-settings__button--active {
	color: #388ae5
}

.ce-settings__button--focused {
	-webkit-box-shadow: inset 0 0 0 1px rgba(7, 161, 227, .08);
	box-shadow: inset 0 0 0 1px rgba(7, 161, 227, .08);
	background: rgba(34, 186, 255, .08) !important
}

.ce-settings__button--focused-animated {
	-webkit-animation-name: buttonClicked;
	animation-name: buttonClicked;
	-webkit-animation-duration: .25s;
	animation-duration: .25s
}

.ce-settings__button:not(:nth-child(3n+3)) {
	margin-right: 3px
}

.ce-settings__button:nth-child(n+4) {
	margin-top: 3px
}

.ce-settings__button {
	line-height: 32px
}

.ce-settings__button--disabled {
	cursor: not-allowed !important;
	opacity: .3
}

.ce-settings__button--selected {
	color: #388ae5
}

.ce-settings__button--delete {
	-webkit-transition: background-color .3s ease;
	transition: background-color .3s ease;
	will-change: background-color
}

.ce-settings__button--delete .icon {
	-webkit-transition: -webkit-transform .2s ease-out;
	transition: -webkit-transform .2s ease-out;
	transition: transform .2s ease-out;
	transition: transform .2s ease-out, -webkit-transform .2s ease-out;
	will-change: transform
}

.ce-settings__button--confirm {
	background-color: #e24a4a !important;
	color: #fff
}

.ce-settings__button--confirm:hover {
	background-color: #d54a4a !important
}

.ce-settings__button--confirm .icon {
	-webkit-transform: rotate(90deg);
	transform: rotate(90deg)
}

.ce-block:first-of-type {
	margin-top: 0
}

.ce-block--selected .ce-block__content {
	background: #e1f2ff
}

.ce-block--selected .ce-block__content [contenteditable] {
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none
}

.ce-block--selected .ce-block__content .ce-stub, .ce-block--selected .ce-block__content img
	{
	opacity: .55
}

.ce-block--stretched .ce-block__content {
	max-width: none
}

.ce-block__content {
	position: relative;
	max-width: 650px;
	margin: 0 auto;
	-webkit-transition: background-color .15s ease;
	transition: background-color .15s ease
}

.ce-block--drop-target .ce-block__content:before {
	content: "";
	position: absolute;
	top: 100%;
	left: -20px;
	margin-top: -1px;
	height: 8px;
	width: 8px;
	border: solid #388ae5;
	border-width: 1px 1px 0 0;
	-webkit-transform-origin: right;
	transform-origin: right;
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg)
}

.ce-block--drop-target .ce-block__content:after {
	content: "";
	position: absolute;
	top: 100%;
	height: 1px;
	width: 100%;
	color: #388ae5;
	background: repeating-linear-gradient(90deg, #388ae5, #388ae5 1px, #fff 0, #fff 6px)
}

.ce-block a {
	cursor: pointer;
	text-decoration: underline
}

.ce-block b {
	font-weight: 700
}

.ce-block i {
	font-style: italic
}

@media ( min-width :651px) {
	.codex-editor--narrow .ce-block--focused {
		margin-right: -50px;
		padding-right: 50px
	}
}

.wobble {
	-webkit-animation-name: wobble;
	animation-name: wobble;
	-webkit-animation-duration: .4s;
	animation-duration: .4s
}

@
-webkit-keyframes wobble { 0%{
	-webkit-transform: translateZ(0);
	transform: translateZ(0)
}

15
%
{
-webkit-transform
:
translate3d(
-5%
,
0
,
0
)
rotate(
-5deg
);
transform
:
translate3d(
-5%
,
0
,
0
)
rotate(
-5deg
)
}
30
%
{
-webkit-transform
:
translate3d(
2%
,
0
,
0
)
rotate(
3deg
);
transform
:
translate3d(
2%
,
0
,
0
)
rotate(
3deg
)
}
45
%
{
-webkit-transform
:
translate3d(
-3%
,
0
,
0
)
rotate(
-3deg
);
transform
:
translate3d(
-3%
,
0
,
0
)
rotate(
-3deg
)
}
60
%
{
-webkit-transform
:
translate3d(
2%
,
0
,
0
)
rotate(
2deg
);
transform
:
translate3d(
2%
,
0
,
0
)
rotate(
2deg
)
}
75
%
{
-webkit-transform
:
translate3d(
-1%
,
0
,
0
)
rotate(
-1deg
);
transform
:
translate3d(
-1%
,
0
,
0
)
rotate(
-1deg
)
}
to {
	-webkit-transform: translateZ(0);
	transform: translateZ(0)
}

}
@
keyframes wobble { 0%{
	-webkit-transform: translateZ(0);
	transform: translateZ(0)
}

15
%
{
-webkit-transform
:
translate3d(
-5%
,
0
,
0
)
rotate(
-5deg
);
transform
:
translate3d(
-5%
,
0
,
0
)
rotate(
-5deg
)
}
30
%
{
-webkit-transform
:
translate3d(
2%
,
0
,
0
)
rotate(
3deg
);
transform
:
translate3d(
2%
,
0
,
0
)
rotate(
3deg
)
}
45
%
{
-webkit-transform
:
translate3d(
-3%
,
0
,
0
)
rotate(
-3deg
);
transform
:
translate3d(
-3%
,
0
,
0
)
rotate(
-3deg
)
}
60
%
{
-webkit-transform
:
translate3d(
2%
,
0
,
0
)
rotate(
2deg
);
transform
:
translate3d(
2%
,
0
,
0
)
rotate(
2deg
)
}
75
%
{
-webkit-transform
:
translate3d(
-1%
,
0
,
0
)
rotate(
-1deg
);
transform
:
translate3d(
-1%
,
0
,
0
)
rotate(
-1deg
)
}
to {
	-webkit-transform: translateZ(0);
	transform: translateZ(0)
}

}
@
-webkit-keyframes bounceIn { 0%,20%,40%,60%,80%,
	to {-webkit-animation-timing-function: cubic-bezier(.215, .61, .355, 1);
	animation-timing-function: cubic-bezier(.215, .61, .355, 1)
}

0
%
{
-webkit-transform
:
scale3d(
.9
,
.9
,
.9
);
transform
:
scale3d(
.9
,
.9
,
.9
)
}
20
%
{
-webkit-transform
:
scale3d(
1.03
,
1.03
,
1.03
);
transform
:
scale3d(
1.03
,
1.03
,
1.03
)
}
60
%
{
-webkit-transform
:
scaleX(
1
);
transform
:
scaleX(
1
)
}
}
@
keyframes bounceIn { 0%,20%,40%,60%,80%,
	to {-webkit-animation-timing-function: cubic-bezier(.215, .61, .355, 1);
	animation-timing-function: cubic-bezier(.215, .61, .355, 1)
}

0
%
{
-webkit-transform
:
scale3d(
.9
,
.9
,
.9
);
transform
:
scale3d(
.9
,
.9
,
.9
)
}
20
%
{
-webkit-transform
:
scale3d(
1.03
,
1.03
,
1.03
);
transform
:
scale3d(
1.03
,
1.03
,
1.03
)
}
60
%
{
-webkit-transform
:
scaleX(
1
);
transform
:
scaleX(
1
)
}
}
@
-webkit-keyframes selectionBounce { 0%,20%,40%,60%,80%,
	to {-webkit-animation-timing-function: cubic-bezier(.215, .61, .355, 1);
	animation-timing-function: cubic-bezier(.215, .61, .355, 1)
}

50
%
{
-webkit-transform
:
scale3d(
1.01
,
1.01
,
1.01
);
transform
:
scale3d(
1.01
,
1.01
,
1.01
)
}
70
%
{
-webkit-transform
:
scaleX(
1
);
transform
:
scaleX(
1
)
}
}
@
keyframes selectionBounce { 0%,20%,40%,60%,80%,
	to {-webkit-animation-timing-function: cubic-bezier(.215, .61, .355, 1);
	animation-timing-function: cubic-bezier(.215, .61, .355, 1)
}

50
%
{
-webkit-transform
:
scale3d(
1.01
,
1.01
,
1.01
);
transform
:
scale3d(
1.01
,
1.01
,
1.01
)
}
70
%
{
-webkit-transform
:
scaleX(
1
);
transform
:
scaleX(
1
)
}
}
@
-webkit-keyframes buttonClicked { 0%,20%,40%,60%,80%,
	to {-webkit-animation-timing-function: cubic-bezier(.215, .61, .355, 1);
	animation-timing-function: cubic-bezier(.215, .61, .355, 1)
}

0
%
{
-webkit-transform
:
scale3d(
.95
,
.95
,
.95
);
transform
:
scale3d(
.95
,
.95
,
.95
)
}
60
%
{
-webkit-transform
:
scale3d(
1.02
,
1.02
,
1.02
);
transform
:
scale3d(
1.02
,
1.02
,
1.02
)
}
80
%
{
-webkit-transform
:
scaleX(
1
);
transform
:
scaleX(
1
)
}
}
@
keyframes buttonClicked { 0%,20%,40%,60%,80%,
	to {-webkit-animation-timing-function: cubic-bezier(.215, .61, .355, 1);
	animation-timing-function: cubic-bezier(.215, .61, .355, 1)
}

0
%
{
-webkit-transform
:
scale3d(
.95
,
.95
,
.95
);
transform
:
scale3d(
.95
,
.95
,
.95
)
}
60
%
{
-webkit-transform
:
scale3d(
1.02
,
1.02
,
1.02
);
transform
:
scale3d(
1.02
,
1.02
,
1.02
)
}
80
%
{
-webkit-transform
:
scaleX(
1
);
transform
:
scaleX(
1
)
}
}
@
-webkit-keyframes panelShowing { 0%{
	opacity: 0;
	-webkit-transform: translateY(-8px) scale(.9);
	transform: translateY(-8px) scale(.9)
}

70
%
{
opacity
:
1;
-webkit-transform
:
translateY(
2px
);
transform
:
translateY(
2px
)
}
to {
	-webkit-transform: translateY(0);
	transform: translateY(0)
}

}
@
keyframes panelShowing { 0%{
	opacity: 0;
	-webkit-transform: translateY(-8px) scale(.9);
	transform: translateY(-8px) scale(.9)
}

70
%
{
opacity
:
1;
-webkit-transform
:
translateY(
2px
);
transform
:
translateY(
2px
)
}
to {
	-webkit-transform: translateY(0);
	transform: translateY(0)
}

}
.cdx-block {
	padding: .4em 0
}

.cdx-input {
	border: 1px solid rgba(201, 201, 204, .48);
	-webkit-box-shadow: inset 0 1px 2px 0 rgba(35, 44, 72, .06);
	box-shadow: inset 0 1px 2px 0 rgba(35, 44, 72, .06);
	border-radius: 3px;
	padding: 10px 12px;
	outline: none;
	width: 100%;
	-webkit-box-sizing: border-box;
	box-sizing: border-box
}

.cdx-input[data-placeholder]:before {
	position: static !important;
	display: inline-block;
	width: 0;
	white-space: nowrap;
	pointer-events: none
}

.cdx-settings-button {
	display: -webkit-inline-box;
	display: -ms-inline-flexbox;
	display: inline-flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	width: 34px;
	height: 34px;
	line-height: 34px;
	padding: 0 !important;
	text-align: center;
	border-radius: 3px;
	cursor: pointer;
	border: 0;
	outline: none;
	background-color: transparent;
	vertical-align: bottom;
	color: #000;
	margin: 0
}

.cdx-settings-button:hover {
	background-color: #eff2f5
}

.cdx-settings-button--focused {
	-webkit-box-shadow: inset 0 0 0 1px rgba(7, 161, 227, .08);
	box-shadow: inset 0 0 0 1px rgba(7, 161, 227, .08);
	background: rgba(34, 186, 255, .08) !important
}

.cdx-settings-button--focused-animated {
	-webkit-animation-name: buttonClicked;
	animation-name: buttonClicked;
	-webkit-animation-duration: .25s;
	animation-duration: .25s
}

.cdx-settings-button:not(:nth-child(3n+3)) {
	margin-right: 3px
}

.cdx-settings-button:nth-child(n+4) {
	margin-top: 3px
}

.cdx-settings-button--active {
	color: #388ae5
}

.cdx-loader {
	position: relative;
	border: 1px solid rgba(201, 201, 204, .48)
}

.cdx-loader:before {
	content: "";
	position: absolute;
	left: 50%;
	top: 50%;
	width: 18px;
	height: 18px;
	margin: -11px 0 0 -11px;
	border: 2px solid rgba(201, 201, 204, .48);
	border-left-color: #388ae5;
	border-radius: 50%;
	-webkit-animation: cdxRotation 1.2s linear infinite;
	animation: cdxRotation 1.2s linear infinite
}

@
-webkit-keyframes cdxRotation { 0%{
	-webkit-transform: rotate(0deg);
	transform: rotate(0deg)
}

to {
	-webkit-transform: rotate(1turn);
	transform: rotate(1turn)
}

}
@
keyframes cdxRotation { 0%{
	-webkit-transform: rotate(0deg);
	transform: rotate(0deg)
}

to {
	-webkit-transform: rotate(1turn);
	transform: rotate(1turn)
}

}
.cdx-button {
	padding: 13px;
	border-radius: 3px;
	border: 1px solid rgba(201, 201, 204, .48);
	font-size: 14.9px;
	background: #fff;
	-webkit-box-shadow: 0 2px 2px 0 rgba(18, 30, 57, .04);
	box-shadow: 0 2px 2px 0 rgba(18, 30, 57, .04);
	color: #707684;
	text-align: center;
	cursor: pointer
}

.cdx-button:hover {
	background: #fbfcfe;
	-webkit-box-shadow: 0 1px 3px 0 rgba(18, 30, 57, .08);
	box-shadow: 0 1px 3px 0 rgba(18, 30, 57, .08)
}

.cdx-button svg {
	height: 20px;
	margin-right: .2em;
	margin-top: -2px
}

.ce-stub {
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	width: 100%;
	padding: 3.5em 0;
	margin: 17px 0;
	border-radius: 3px;
	background: #fcf7f7;
	color: #b46262
}

.ce-stub__info {
	margin-left: 20px
}

.ce-stub__title {
	margin-bottom: 3px;
	font-weight: 600;
	font-size: 18px;
	text-transform: capitalize
}

.ce-stub__subtitle {
	font-size: 16px
}

.codex-editor.codex-editor--rtl {
	direction: rtl
}

.codex-editor.codex-editor--rtl .cdx-list {
	padding-left: 0;
	padding-right: 40px
}

.codex-editor.codex-editor--rtl .ce-toolbar__plus {
	right: -34px;
	left: auto
}

.codex-editor.codex-editor--rtl .ce-toolbar__actions {
	right: auto;
	left: -34px
}

@media ( max-width :650px) {
	.codex-editor.codex-editor--rtl .ce-toolbar__actions {
		margin-left: 0;
		margin-right: auto;
		padding-right: 0;
		padding-left: 10px
	}
}

.codex-editor.codex-editor--rtl .ce-settings {
	left: 5px;
	right: auto
}

.codex-editor.codex-editor--rtl .ce-settings:before {
	right: auto;
	left: 25px
}

.codex-editor.codex-editor--rtl .ce-settings__button:not(:nth-child(3n+3))
	{
	margin-left: 3px;
	margin-right: 0
}

.codex-editor.codex-editor--rtl .ce-conversion-tool__icon {
	margin-right: 0;
	margin-left: 10px
}

.codex-editor.codex-editor--rtl .ce-inline-toolbar__dropdown {
	border-right: 0 solid transparent;
	border-left: 1px solid rgba(201, 201, 204, .48);
	margin: 0 -6px 0 6px
}

.codex-editor.codex-editor--rtl .ce-inline-toolbar__dropdown .icon--toggler-down
	{
	margin-left: 0;
	margin-right: 4px
}

@media ( min-width :651px) {
	.codex-editor--narrow.codex-editor--rtl .ce-toolbar__plus {
		left: 0;
		right: 5px
	}
}

@media ( min-width :651px) {
	.codex-editor--narrow.codex-editor--rtl .ce-toolbar__actions {
		left: -5px
	}
}
</style>
<style id="codex-tooltips-style">
.ct {
	z-index: 999;
	opacity: 0;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	pointer-events: none;
	-webkit-transition: opacity 50ms ease-in, -webkit-transform 70ms
		cubic-bezier(.215, .61, .355, 1);
	transition: opacity 50ms ease-in, -webkit-transform 70ms
		cubic-bezier(.215, .61, .355, 1);
	transition: opacity 50ms ease-in, transform 70ms
		cubic-bezier(.215, .61, .355, 1);
	transition: opacity 50ms ease-in, transform 70ms
		cubic-bezier(.215, .61, .355, 1), -webkit-transform 70ms
		cubic-bezier(.215, .61, .355, 1);
	will-change: opacity, top, left;
	-webkit-box-shadow: 0 8px 12px 0 rgba(29, 32, 43, .17), 0 4px 5px -3px
		rgba(5, 6, 12, .49);
	box-shadow: 0 8px 12px 0 rgba(29, 32, 43, .17), 0 4px 5px -3px
		rgba(5, 6, 12, .49);
	border-radius: 9px
}

.ct, .ct:before {
	position: absolute;
	top: 0;
	left: 0
}

.ct:before {
	content: "";
	bottom: 0;
	right: 0;
	background-color: #1d202b;
	z-index: -1;
	border-radius: 4px
}

@
supports(-webkit-mask-box-image:url( "")) { .
	ct: before{border-radius:0;
	-webkit-mask-box-image:
		url('data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"><path d="M10.71 0h2.58c3.02 0 4.64.42 6.1 1.2a8.18 8.18 0 013.4 3.4C23.6 6.07 24 7.7 24 10.71v2.58c0 3.02-.42 4.64-1.2 6.1a8.18 8.18 0 01-3.4 3.4c-1.47.8-3.1 1.21-6.11 1.21H10.7c-3.02 0-4.64-.42-6.1-1.2a8.18 8.18 0 01-3.4-3.4C.4 17.93 0 16.3 0 13.29V10.7c0-3.02.42-4.64 1.2-6.1a8.18 8.18 0 013.4-3.4C6.07.4 7.7 0 10.71 0z"/></svg>')
		48% 41% 37.9% 53.3%
}

}
@media (- -mobile ) {
	.ct {
		display: none
	}
}

.ct__content {
	padding: 6px 10px;
	color: #cdd1e0;
	font-size: 12px;
	text-align: center;
	letter-spacing: .02em;
	line-height: 1em
}

.ct:after {
	content: "";
	width: 8px;
	height: 8px;
	position: absolute;
	background-color: #1d202b;
	z-index: -1
}

.ct--bottom {
	-webkit-transform: translateY(5px);
	transform: translateY(5px)
}

.ct--bottom:after {
	top: -3px;
	left: 50%;
	-webkit-transform: translateX(-50%) rotate(-45deg);
	transform: translateX(-50%) rotate(-45deg)
}

.ct--top {
	-webkit-transform: translateY(-5px);
	transform: translateY(-5px)
}

.ct--top:after {
	top: auto;
	bottom: -3px;
	left: 50%;
	-webkit-transform: translateX(-50%) rotate(-45deg);
	transform: translateX(-50%) rotate(-45deg)
}

.ct--left {
	-webkit-transform: translateX(-5px);
	transform: translateX(-5px)
}

.ct--left:after {
	top: 50%;
	left: auto;
	right: 0;
	-webkit-transform: translate(41.6%, -50%) rotate(-45deg);
	transform: translate(41.6%, -50%) rotate(-45deg)
}

.ct--right {
	-webkit-transform: translateX(5px);
	transform: translateX(5px)
}

.ct--right:after {
	top: 50%;
	left: 0;
	-webkit-transform: translate(-41.6%, -50%) rotate(-45deg);
	transform: translate(-41.6%, -50%) rotate(-45deg)
}

.ct--shown {
	opacity: 1;
	-webkit-transform: none;
	transform: none
}
</style>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no,viewport-fit=cover">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- /v3/post/write -->


<link rel="apple-touch-icon"
	href="https://www.millie.co.kr/favicon/ios-icon.png">
<link rel="apple-touch-icon-precomposed"
	href="https://www.millie.co.kr/favicon/ios-icon.png">
<link rel="shortcut icon" type="image/png"
	href="https://www.millie.co.kr/favicon/android-icon.png">
<title>글쓰기 │ 밀리의 서재</title>
<link
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/vendor.524cdf1d4325d722f545.css"
	rel="stylesheet">
<link
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/millie.4a1320ab272ffa081fae.css"
	rel="stylesheet">
<style type="text/css">
.vue-slider-dot {
	position: absolute;
	-webkit-transition: all 0s;
	transition: all 0s;
	z-index: 5
}

.vue-slider-dot:focus {
	outline: none
}

.vue-slider-dot-tooltip {
	position: absolute;
	visibility: hidden
}

.vue-slider-dot-hover:hover .vue-slider-dot-tooltip,
	.vue-slider-dot-tooltip-show {
	visibility: visible
}

.vue-slider-dot-tooltip-top {
	top: -10px;
	left: 50%;
	-webkit-transform: translate(-50%, -100%);
	transform: translate(-50%, -100%)
}

.vue-slider-dot-tooltip-bottom {
	bottom: -10px;
	left: 50%;
	-webkit-transform: translate(-50%, 100%);
	transform: translate(-50%, 100%)
}

.vue-slider-dot-tooltip-left {
	left: -10px;
	top: 50%;
	-webkit-transform: translate(-100%, -50%);
	transform: translate(-100%, -50%)
}

.vue-slider-dot-tooltip-right {
	right: -10px;
	top: 50%;
	-webkit-transform: translate(100%, -50%);
	transform: translate(100%, -50%)
}
</style>
<style type="text/css">
.vue-slider-marks {
	position: relative;
	width: 100%;
	height: 100%
}

.vue-slider-mark {
	position: absolute;
	z-index: 1
}

.vue-slider-ltr .vue-slider-mark, .vue-slider-rtl .vue-slider-mark {
	width: 0;
	height: 100%;
	top: 50%
}

.vue-slider-ltr .vue-slider-mark-step, .vue-slider-rtl .vue-slider-mark-step
	{
	top: 0
}

.vue-slider-ltr .vue-slider-mark-label, .vue-slider-rtl .vue-slider-mark-label
	{
	top: 100%;
	margin-top: 10px
}

.vue-slider-ltr .vue-slider-mark {
	-webkit-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%)
}

.vue-slider-ltr .vue-slider-mark-step {
	left: 0
}

.vue-slider-ltr .vue-slider-mark-label {
	left: 50%;
	-webkit-transform: translateX(-50%);
	transform: translateX(-50%)
}

.vue-slider-rtl .vue-slider-mark {
	-webkit-transform: translate(50%, -50%);
	transform: translate(50%, -50%)
}

.vue-slider-rtl .vue-slider-mark-step {
	right: 0
}

.vue-slider-rtl .vue-slider-mark-label {
	right: 50%;
	-webkit-transform: translateX(50%);
	transform: translateX(50%)
}

.vue-slider-btt .vue-slider-mark, .vue-slider-ttb .vue-slider-mark {
	width: 100%;
	height: 0;
	left: 50%
}

.vue-slider-btt .vue-slider-mark-step, .vue-slider-ttb .vue-slider-mark-step
	{
	left: 0
}

.vue-slider-btt .vue-slider-mark-label, .vue-slider-ttb .vue-slider-mark-label
	{
	left: 100%;
	margin-left: 10px
}

.vue-slider-btt .vue-slider-mark {
	-webkit-transform: translate(-50%, 50%);
	transform: translate(-50%, 50%)
}

.vue-slider-btt .vue-slider-mark-step {
	top: 0
}

.vue-slider-btt .vue-slider-mark-label {
	top: 50%;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%)
}

.vue-slider-ttb .vue-slider-mark {
	-webkit-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%)
}

.vue-slider-ttb .vue-slider-mark-step {
	bottom: 0
}

.vue-slider-ttb .vue-slider-mark-label {
	bottom: 50%;
	-webkit-transform: translateY(50%);
	transform: translateY(50%)
}

.vue-slider-mark-label, .vue-slider-mark-step {
	position: absolute
}
</style>
<style type="text/css">
.vue-slider {
	position: relative;
	-webkit-box-sizing: content-box;
	box-sizing: content-box;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	display: block;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0)
}

.vue-slider-rail {
	position: relative;
	width: 100%;
	height: 100%;
	-webkit-transition-property: width, height, left, right, top, bottom;
	transition-property: width, height, left, right, top, bottom
}

.vue-slider-process {
	position: absolute;
	z-index: 1
}
</style>
<script async="" src="//static.ads-twitter.com/uwt.js"></script>
<script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script>
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" async=""
	src="https://www.googletagmanager.com/gtag/js?id=G-3WR64L2XW1&amp;l=dataLayer&amp;cx=c"></script>
<script type="text/javascript" async=""
	src="https://www.googletagmanager.com/gtag/js?id=UA-92156018-1&amp;l=dataLayer&amp;cx=c"></script>
<script async=""
	src="https://www.googletagmanager.com/gtag/js?id=UA-92156018-1"
	rel="preconnect" charset="utf-8"></script>
<link rel="preload"
	href="https://d3udu241ivsax2.cloudfront.net/common/mds/fonts/mds-icon-v3.woff2"
	as="font" type="font/woff2" crossorigin="crossorigin">
<link rel="preload"
	href="https://d3udu241ivsax2.cloudfront.net/common/mds/fonts/SpoqaHanSansNeo-Regular.woff2"
	as="font" type="font/woff2" crossorigin="crossorigin">
<link rel="preload"
	href="https://d3udu241ivsax2.cloudfront.net/common/mds/fonts/SpoqaHanSansNeo-Bold.woff2"
	as="font" type="font/woff2" crossorigin="crossorigin">
<link rel="preload"
	href="https://d3udu241ivsax2.cloudfront.net/common/mds/fonts/NotoSerifKR-Black.woff2"
	as="font" type="font/woff2" crossorigin="crossorigin">
<meta http-equiv="origin-trial"
	content="A751Xsk4ZW3DVQ8WZng2Dk5s3YzAyqncTzgv+VaE6wavgTY0QHkDvUTET1o7HanhuJO8lgv1Vvc88Ij78W1FIAAAAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjgwNjUyNzk5LCJpc1RoaXJkUGFydHkiOnRydWV9">
<script type="text/javascript" async=""
	src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/771298710/?random=1669357417429&amp;cv=11&amp;fst=1669357417429&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2wgb90&amp;u_w=1707&amp;u_h=1067&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2Fpost%2Fwrite&amp;ref=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2FbookDetail%2F179580688%3Freferrer%3Dhome&amp;tiba=%EB%B0%80%EB%A6%AC%EC%9D%98%20%EC%84%9C%EC%9E%AC&amp;auid=492487846.1665120667&amp;uaa=x86&amp;uab=64&amp;uafvl=Microsoft%2520Edge%3B107.0.1418.56%7CChromium%3B107.0.5304.110%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;rfmt=3&amp;fmt=4"></script>
<script type="text/javascript" async=""
	src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/715358239/?random=1669357417430&amp;cv=11&amp;fst=1669357417430&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2wgb90&amp;u_w=1707&amp;u_h=1067&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2Fpost%2Fwrite&amp;ref=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2FbookDetail%2F179580688%3Freferrer%3Dhome&amp;tiba=%EB%B0%80%EB%A6%AC%EC%9D%98%20%EC%84%9C%EC%9E%AC&amp;auid=492487846.1665120667&amp;uaa=x86&amp;uab=64&amp;uafvl=Microsoft%2520Edge%3B107.0.1418.56%7CChromium%3B107.0.5304.110%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;rfmt=3&amp;fmt=4"></script>
<meta http-equiv="origin-trial"
	content="A9+ldib+sKhGj2FcIjq5GnvBZFuIiXID0+NkE6k7cEk71MhaHFGqo3wUlUFmZ6d9w0KPwx9UxGiCTYWtRnTGDQkAAACAeyJvcmlnaW4iOiJodHRwczovL2NyaXRlby5uZXQ6NDQzIiwiZmVhdHVyZSI6IlByaXZhY3lTYW5kYm94QWRzQVBJcyIsImV4cGlyeSI6MTY4MDY1Mjc5OSwiaXNTdWJkb21haW4iOnRydWUsImlzVGhpcmRQYXJ0eSI6dHJ1ZX0=">
<meta http-equiv="origin-trial"
	content="AzLNuh8GFzfIOcwvhEg7Ymr7YCzlYVTKeD7i2iETABbRf+sL2FAx+r+HlTtxSi1zgUFxBlJVoxgLjuhqiwTjAw4AAACAeyJvcmlnaW4iOiJodHRwczovL2NyaXRlby5jb206NDQzIiwiZmVhdHVyZSI6IlByaXZhY3lTYW5kYm94QWRzQVBJcyIsImV4cGlyeSI6MTY4MDY1Mjc5OSwiaXNTdWJkb21haW4iOnRydWUsImlzVGhpcmRQYXJ0eSI6dHJ1ZX0=">
<meta http-equiv="origin-trial"
	content="A0KGawWMfAygakxUO+Z3rulPwK2j0AqkLneiEt4pAI951GYaafeHNV9Ya+PAn7s0y12QSrfTjc9LdOUU+QfkdQwAAACAeyJvcmlnaW4iOiJodHRwczovL2NyaXRlby5jb206NDQzIiwiZmVhdHVyZSI6IlByaXZhY3lTYW5kYm94QWRzQVBJcyIsImV4cGlyeSI6MTY2OTc2NjM5OSwiaXNTdWJkb21haW4iOnRydWUsImlzVGhpcmRQYXJ0eSI6dHJ1ZX0=">
<link rel="stylesheet" type="text/css"
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/styles~b2b~post.34bf510f66b4cbe50dcb.css">
<script charset="utf-8"
	src="https://d3udu241ivsax2.cloudfront.net/v3/js/styles~b2b~post.ec47850d685614e8dcf2.js"></script>
<script charset="utf-8"
	src="https://d3udu241ivsax2.cloudfront.net/v3/js/b2b~post.bd6b43da88711c609f30.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/post.777bb9ac8c585d9e2375.css">
<script charset="utf-8"
	src="https://d3udu241ivsax2.cloudfront.net/v3/js/post.911217d92139bac202c2.js"></script>
<style type="text/css">
.cdx-notify--error {
	background: #fffbfb !important
}

.cdx-notify--error::before {
	background: #fb5d5d !important
}

.cdx-notify__input {
	max-width: 130px;
	padding: 5px 10px;
	background: #f7f7f7;
	border: 0;
	border-radius: 3px;
	font-size: 13px;
	color: #656b7c;
	outline: 0
}

.cdx-notify__input:-ms-input-placeholder {
	color: #656b7c
}

.cdx-notify__input::placeholder {
	color: #656b7c
}

.cdx-notify__input:focus:-ms-input-placeholder {
	color: rgba(101, 107, 124, .3)
}

.cdx-notify__input:focus::placeholder {
	color: rgba(101, 107, 124, .3)
}

.cdx-notify__button {
	border: none;
	border-radius: 3px;
	font-size: 13px;
	padding: 5px 10px;
	cursor: pointer
}

.cdx-notify__button:last-child {
	margin-left: 10px
}

.cdx-notify__button--cancel {
	background: #f2f5f7;
	box-shadow: 0 2px 1px 0 rgba(16, 19, 29, 0);
	color: #656b7c
}

.cdx-notify__button--cancel:hover {
	background: #eee
}

.cdx-notify__button--confirm {
	background: #34c992;
	box-shadow: 0 1px 1px 0 rgba(18, 49, 35, .05);
	color: #fff
}

.cdx-notify__button--confirm:hover {
	background: #33b082
}

.cdx-notify__btns-wrapper {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-flow: row nowrap;
	flex-flow: row nowrap;
	margin-top: 5px
}

.cdx-notify__cross {
	position: absolute;
	top: 5px;
	right: 5px;
	width: 10px;
	height: 10px;
	padding: 5px;
	opacity: .54;
	cursor: pointer
}

.cdx-notify__cross::after, .cdx-notify__cross::before {
	content: '';
	position: absolute;
	left: 9px;
	top: 5px;
	height: 12px;
	width: 2px;
	background: #575d67
}

.cdx-notify__cross::before {
	transform: rotate(-45deg)
}

.cdx-notify__cross::after {
	transform: rotate(45deg)
}

.cdx-notify__cross:hover {
	opacity: 1
}

.cdx-notifies {
	position: fixed;
	z-index: 2;
	bottom: 20px;
	left: 20px;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		Oxygen, Ubuntu, Cantarell, "Fira Sans", "Droid Sans", "Helvetica Neue",
		sans-serif
}

.cdx-notify {
	position: relative;
	width: 220px;
	margin-top: 15px;
	padding: 13px 16px;
	background: #fff;
	box-shadow: 0 11px 17px 0 rgba(23, 32, 61, .13);
	border-radius: 5px;
	font-size: 14px;
	line-height: 1.4em;
	word-wrap: break-word
}

.cdx-notify::before {
	content: '';
	position: absolute;
	display: block;
	top: 0;
	left: 0;
	width: 3px;
	height: calc(100% - 6px);
	margin: 3px;
	border-radius: 5px;
	background: 0 0
}

@
keyframes bounceIn { 0%{
	opacity: 0;
	transform: scale(.3)
}

50
%
{
opacity
:
1;
transform
:
scale(
1.05
)
}
70
%
{
transform
:
scale(
.9
)
}
100
%
{
transform
:
scale(
1
)
}
}
.cdx-notify--bounce-in {
	animation-name: bounceIn;
	animation-duration: .6s;
	animation-iteration-count: 1
}

.cdx-notify--success {
	background: #fafffe !important
}

.cdx-notify--success::before {
	background: #41ffb1 !important
}
</style>
<style>
.ce-paragraph {
	line-height: 1.6em;
	outline: none;
}

.ce-paragraph[data-placeholder]:empty::before {
	content: attr(data-placeholder);
	color: #707684;
	font-weight: normal;
	opacity: 0;
}

/** Show placeholder at the first paragraph if Editor is empty */
.codex-editor--empty .ce-block:first-child .ce-paragraph[data-placeholder]:empty::before
	{
	opacity: 1;
}

.codex-editor--toolbox-opened .ce-block:first-child .ce-paragraph[data-placeholder]:empty::before,
	.codex-editor--empty .ce-block:first-child .ce-paragraph[data-placeholder]:empty:focus::before
	{
	opacity: 0;
}

.ce-paragraph p:first-of-type {
	margin-top: 0;
}

.ce-paragraph p:last-of-type {
	margin-bottom: 0;
}
</style>
<style>
.embed-tool--loading .embed-tool__caption {
	display: none;
}

.embed-tool--loading .embed-tool__preloader {
	display: block;
}

.embed-tool--loading .embed-tool__content {
	display: none;
}

.embed-tool__preloader {
	display: none;
	position: relative;
	height: 200px;
	box-sizing: border-box;
	border-radius: 5px;
	border: 1px solid #e6e9eb;
}

.embed-tool__preloader::before {
	content: '';
	position: absolute;
	z-index: 3;
	left: 50%;
	top: 50%;
	width: 30px;
	height: 30px;
	margin-top: -25px;
	margin-left: -15px;
	border-radius: 50%;
	border: 2px solid #cdd1e0;
	border-top-color: #388ae5;
	box-sizing: border-box;
	animation: embed-preloader-spin 2s infinite linear;
}

.embed-tool__url {
	position: absolute;
	bottom: 20px;
	left: 50%;
	transform: translateX(-50%);
	max-width: 250px;
	color: #7b7e89;
	font-size: 11px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.embed-tool__content {
	width: 100%;
}

.embed-tool__caption {
	margin-top: 7px;
}

.embed-tool__caption[contentEditable=true][data-placeholder]::before {
	position: absolute;
	content: attr(data-placeholder);
	color: #707684;
	font-weight: normal;
	opacity: 0;
}

.embed-tool__caption[contentEditable=true][data-placeholder]:empty::before
	{
	opacity: 1;
}

.embed-tool__caption[contentEditable=true][data-placeholder]:empty:focus::before
	{
	opacity: 0;
}

@
keyframes embed-preloader-spin { 0% {
	transform: rotate(0deg);
}
100
%
{
transform
:
rotate(
360deg
);
}
}
</style>
<style>
.ce-tune-alignment--right {
	text-align: right;
}

.ce-tune-alignment--center {
	text-align: center;
}

.ce-tune-alignment--left {
	text-align: left;
}
</style>
<style type="text/css">
.ce-block--drop-target .ce-block__content {
	outline-color: #a0a0a0;
	outline-style: dashed;
	outline-width: 1px;
}

.ce-block--drop-target .ce-block__content:before {
	content: "";
	position: absolute;
	top: 50%;
	left: -20px;
	margin-top: -1px;
	height: 8px;
	width: 8px;
	border: solid #a0a0a0;
	border-width: 1px 1px 0 0;
	-webkit-transform-origin: right;
	transform-origin: right;
	-webkit-transform: rotate(45deg);
	transform: rotate(45deg);
}

.ce-block--drop-target .ce-block__content:after {
	background: none;
}
</style>
</head>
<body>
	<div data-v-c1337ae8="" id="wrap" class="web-mount">
		<!---->
		<!---->
		<!---->
		<section data-v-c1337ae8="" class="content">
			<div data-v-88efba62="" data-v-c1337ae8=""
				class="post-write write desktop">
				<div data-v-3f5a4ca5="" data-v-88efba62="" id="header"
					class="header">
					<div data-v-3f5a4ca5="" class="header-inner">
						<div data-v-3f5a4ca5="" class="header-left">
							<div data-v-3f5a4ca5="" class="header-link flex-container">
								<a data-v-3f5a4ca5="" href="/" class="logo"><svg
										data-v-3f5a4ca5="" width="50" height="20" viewBox="0 0 50 20"
										fill="none" xmlns="http://www.w3.org/2000/svg">
										<path data-v-3f5a4ca5=""
											d="M20 10C20 15.5228 15.5228 20 10 20C6.24133 20 2.96699 17.9263 1.25866 14.8606C3.04941 14.5987 3.43218 12.1546 3.8283 9.62522L3.82838 9.62473C3.86946 9.3624 3.9107 9.09903 3.95366 8.83721C4.11974 7.82499 4.2933 7.44186 4.65134 7.44186C5.00937 7.44186 5.18293 7.82499 5.34901 8.83721C5.392 9.0992 5.43325 9.3626 5.47436 9.6251C5.8936 12.3021 6.2979 14.8837 8.37227 14.8837C10.4466 14.8837 10.8509 12.3022 11.2702 9.62522C11.3113 9.36272 11.3525 9.0992 11.3955 8.83721C11.5616 7.82499 11.7352 7.44186 12.0932 7.44186C12.4512 7.44186 12.6248 7.82499 12.7909 8.83721C12.8339 9.09923 12.8751 9.36268 12.9162 9.62522C13.3355 12.3022 13.7398 14.8837 15.8141 14.8837C17.8885 14.8837 18.2928 12.3022 18.712 9.62522C18.7531 9.36268 18.7944 9.09923 18.8374 8.83721C19.0035 7.82499 19.177 7.44186 19.5351 7.44186C19.6511 7.44186 19.6803 7.47944 19.7075 7.58934C19.8986 8.36142 20 9.16887 20 10Z"
											fill="var(--ui-10)"></path> <path data-v-3f5a4ca5=""
											d="M0 10C0 10.3631 0.0151074 10.9328 0.105302 11.456C0.275012 12.4405 0.470552 13.0233 0.930406 13.0233C1.39026 13.0233 1.57154 12.3605 1.74759 11.0767C1.78373 10.8394 1.81819 10.5875 1.85396 10.3261L1.85403 10.3256C1.98436 9.37298 2.13204 8.29348 2.44146 7.33278C2.84654 6.12799 3.51236 5.11628 4.65134 5.11628C5.79031 5.11628 6.45613 6.12799 6.86121 7.33278C7.17063 8.29348 7.31831 9.37293 7.44864 10.3256C7.48443 10.5872 7.51892 10.8393 7.55509 11.0767C7.73113 12.3605 7.91241 13.0233 8.37227 13.0233C8.83212 13.0233 9.0134 12.3605 9.18945 11.0767C9.22562 10.8393 9.2601 10.5872 9.29589 10.3256C9.42622 9.37293 9.5739 8.29348 9.88332 7.33278C10.2884 6.12799 10.9542 5.11628 12.0932 5.11628C13.2322 5.11628 13.898 6.12799 14.3031 7.33278C14.6125 8.29348 14.7602 9.37293 14.8905 10.3256C14.9263 10.5872 14.9608 10.8393 14.9969 11.0767C15.173 12.3605 15.3543 13.0233 15.8141 13.0233C16.274 13.0233 16.4553 12.3605 16.6313 11.0767C16.6675 10.8393 16.702 10.5872 16.7378 10.3256C16.8681 9.37293 17.0158 8.29348 17.3252 7.33278C17.6359 6.40873 18.0999 5.59827 18.8132 5.27073C17.126 2.13306 13.8121 0 10 0C4.47715 0 0 4.47715 0 10Z"
											fill="var(--ui-10)"></path> <path data-v-3f5a4ca5=""
											d="M23.809 3.14978C23.5246 3.14978 23.286 3.2507 23.0934 3.44336C22.9007 3.63602 22.7998 3.87455 22.7998 4.14061C22.7998 4.42501 22.9007 4.66354 23.0934 4.8562C23.286 5.04886 23.5246 5.14978 23.809 5.14978C24.0842 5.14978 24.3136 5.04886 24.5062 4.8562C24.6989 4.66354 24.7998 4.42501 24.7998 4.14061C24.7998 3.86538 24.6989 3.63602 24.5062 3.44336C24.3227 3.2507 24.0842 3.14978 23.809 3.14978Z"
											fill="var(--ui-10)"></path> <rect data-v-3f5a4ca5=""
											x="22.8896" y="6.39999" width="1.8" height="11.5" rx="0.9"
											fill="var(--ui-10)"></rect> <rect data-v-3f5a4ca5="" x="27.5"
											y="1.90002" width="1.8" height="16" rx="0.9"
											fill="var(--ui-10)"></rect> <rect data-v-3f5a4ca5="" x="32"
											y="1.90002" width="1.8" height="16" rx="0.9"
											fill="var(--ui-10)"></rect> <path data-v-3f5a4ca5=""
											d="M37.5092 3.14978C37.2248 3.14978 36.9862 3.2507 36.7936 3.44336C36.6009 3.63602 36.5 3.87455 36.5 4.14061C36.5 4.42501 36.6009 4.66354 36.7936 4.8562C36.9862 5.04886 37.2248 5.14978 37.5092 5.14978C37.7844 5.14978 38.0138 5.04886 38.2064 4.8562C38.3991 4.66354 38.5 4.42501 38.5 4.14061C38.5 3.86538 38.3991 3.63602 38.2064 3.44336C38.0138 3.2507 37.7844 3.14978 37.5092 3.14978Z"
											fill="var(--ui-10)"></path> <rect data-v-3f5a4ca5=""
											x="36.5801" y="6.40002" width="1.8" height="11.5" rx="0.9"
											fill="var(--ui-10)"></rect> <path data-v-3f5a4ca5=""
											d="M42.4462 12.6743H49.1291C49.3779 12.6743 49.5912 12.5954 49.7512 12.4378C49.9022 12.289 49.9822 12.1138 50 11.9037C49.9467 9.20666 47.8849 7.03503 45.3167 7C45.29 7 45.2722 7 45.2544 7C44.6679 7 44.0992 7.11384 43.5748 7.32399C43.3349 7.41156 43.1127 7.51664 42.8906 7.63923C42.1441 8.0683 41.5486 8.66375 41.131 9.42557C40.7844 10.056 40.58 10.7566 40.5267 11.5184C40.5178 11.5797 40.5178 11.6497 40.5089 11.711C40.5089 11.7986 40.5 11.8949 40.5 11.9825C40.5 11.9912 40.5 11.9912 40.5 12C40.5 12 40.5 12 40.5 12.0088C40.5 12.9632 40.7222 13.8301 41.1665 14.5832C41.2909 14.7933 41.4331 14.9947 41.5842 15.1786C42.4551 16.2907 43.7703 17 45.2544 17C45.3255 17 45.3877 17 45.4588 16.9912C45.5477 16.9912 45.6277 17 45.7166 17C46.2764 17 46.8718 16.8949 47.4761 16.6935C48.0893 16.4921 48.6048 16.2207 49.0136 15.9054C49.1291 15.8179 49.218 15.7215 49.2624 15.6077C49.3246 15.4939 49.3513 15.3713 49.3513 15.2312C49.3513 14.7671 48.9691 14.3905 48.4981 14.3905C48.2582 14.3905 48.0449 14.4869 47.8938 14.6357C47.8583 14.6532 47.8227 14.6795 47.7872 14.7058C47.5384 14.8984 47.2095 15.056 46.8274 15.1874C46.4364 15.3187 46.0631 15.38 45.7077 15.38C44.8012 15.38 44.0281 15.1261 43.3971 14.6182C42.8372 14.1716 42.4729 13.5849 42.304 12.8757L42.2862 12.8144C42.2685 12.6918 42.4462 12.6743 42.4462 12.6743ZM45.2544 8.61996C46.7119 8.61996 47.9205 9.58319 48.1427 10.7741C48.1427 10.7828 48.1338 11.0806 47.8138 11.1506C47.805 11.1506 47.7961 11.1506 47.7872 11.1594C47.7072 11.1594 47.6272 11.1594 47.565 11.1594C47.0674 11.1594 46.5164 11.1594 45.2989 11.1594C44.4546 11.1594 43.9214 11.1331 42.6862 11.1506C42.4107 11.0893 42.3662 10.8529 42.3662 10.7916C42.5706 9.59194 43.7881 8.61996 45.2544 8.61996Z"
											fill="var(--ui-10)"></path></svg></a>
								<p data-v-3f5a4ca5="" class="logo-text">
									포스트<a data-v-3f5a4ca5=""
										href="/shelf/shelf_main.html?library_seq=2253534"
										class="user-name">낭비없는삶은낭만없는삶의 서재</a>
								</p>
							</div>
						</div>
						<div data-v-3f5a4ca5="" class="header-right flex-container">
							<!---->
							<a data-v-3f5a4ca5="" href="/v3/post/502411" target="_blank"
								class="guide-btn"><i data-v-3f5a4ca5=""
								class="mds-icon--info"></i> <span data-v-3f5a4ca5="">가이드</span></a>
							<div data-v-3f5a4ca5="" class="nav-btn">
								<button data-v-3f5a4ca5="" type="button"
									class="publish-btn mds-button mds-button--secondary mds-button--flex mds-button--h32 mds-button--r4">
									<span>발행</span>
								</button>
								<div data-v-3f5a4ca5="" class="post-settings"
									style="display: none;">
									<h3 data-v-3f5a4ca5="">포스트 공개 설정</h3>
									<div data-v-3f5a4ca5="" class="public-private flex-container">
										<label data-v-3f5a4ca5=""
											class="mds-radio mds-radio--primary mds-radio--button mds-radio--checked"><input
											type="radio" id="input-17" name="post-setting" value="105">
											<span class="mds-radio-view"><span class="check ir"></span>
												<span class="label">공개</span></span></label> <label data-v-3f5a4ca5=""
											class="mds-radio mds-radio--primary mds-radio--button"><input
											type="radio" id="input-18" name="post-setting" value="104">
											<span class="mds-radio-view"><span class="check ir"></span>
												<span class="label">비공개</span></span></label>
									</div>
									<div data-v-3f5a4ca5="" class="post-bottom flex-container">
										<span data-v-3f5a4ca5="" class="no-comments-wrap"><label
											data-v-3f5a4ca5=""
											class="mds-check-box mds-check-box--secondary"><input
												type="checkbox" id="input-19" value="false"> <span
												class="mds-check-box-view"><span class="check"></span>
													<span class="label">댓글 기능 사용하지 않기</span></span></label></span>
										<div data-v-3f5a4ca5="" class="post-btn-wrap">
											<button data-v-3f5a4ca5="" type="button"
												class="post-btn flex-container mds-button mds-button--secondary mds-button--line mds-button--flex mds-button--h32 mds-button--r4">
												<span><i data-v-3f5a4ca5="" class="mds-icon--check"></i>
													발행 </span>
											</button>
										</div>
									</div>
								</div>
								<!---->
							</div>
						</div>
					</div>
					<div class="ce-inline-toolbar__buttons">
						<div class="inline-tool-format" data-tool="format">
							<button class="ce-inline-tool format-trigger" type="button">
								텍스트 <i><svg width="12" height="12" viewBox="0 0 12 12"
										fill="none" style="fill: none"
										xmlns="http://www.w3.org/2000/svg"> <path
											d="M3 5L6 8L9 5" stroke="#A5A5A5" stroke-linecap="round"
											stroke-linejoin="round"></path> </svg> </i>
							</button>
							<ul class="format-dropdown">
								<li class="format-dropdown-item">
									<button data-format="heading" data-level="1" type="button">제목1</button>
								</li>
								<li class="format-dropdown-item">
									<button data-format="heading" data-level="2" type="button">제목2</button>
								</li>
								<li class="format-dropdown-item">
									<button data-format="heading" data-level="3" type="button">제목3</button>
								</li>
								<li class="format-dropdown-item">
									<button data-format="paragraph" type="button">본문</button>
								</li>
								<li class="format-dropdown-item">
									<button data-format="caption" type="button">캡션</button>
								</li>
								<li class="format-dropdown-item">
									<button data-format="quote" type="button">인용구</button>
								</li>
							</ul>
						</div>
						<div class="inline-tool-color" data-tool="textColor">
							<button class="ce-inline-tool color-trigger color-button"
								type="button">
								<span></span>
							</button>
							<div class="color-palette">

								<button class="ce-inline-tool color-button" data-color="white"
									type="button">
									<span style="background-color: rgb(250, 250, 250)"></span>
								</button>

								<button class="ce-inline-tool color-button" data-color="gray"
									type="button">
									<span style="background-color: rgb(151, 154, 157)"></span>
								</button>

								<button class="ce-inline-tool color-button" data-color="black"
									type="button">
									<span style="background-color: rgb(7, 1, 22)"></span>
								</button>

								<button class="ce-inline-tool color-button"
									data-color="yellowDeep" type="button">
									<span style="background-color: rgb(244, 194, 21)"></span>
								</button>

								<button class="ce-inline-tool color-button" data-color="pink"
									type="button">
									<span style="background-color: rgb(220, 145, 203)"></span>
								</button>

								<button class="ce-inline-tool color-button" data-color="red"
									type="button">
									<span style="background-color: rgb(241, 47, 34)"></span>
								</button>

								<button class="ce-inline-tool color-button"
									data-color="yellowGreen" type="button">
									<span style="background-color: rgb(154, 201, 30)"></span>
								</button>

								<button class="ce-inline-tool color-button"
									data-color="oliveGreen" type="button">
									<span style="background-color: rgb(51, 126, 18)"></span>
								</button>

								<button class="ce-inline-tool color-button"
									data-color="tealDeep" type="button">
									<span style="background-color: rgb(6, 113, 106)"></span>
								</button>

								<button class="ce-inline-tool color-button"
									data-color="blueLight" type="button">
									<span style="background-color: rgb(2, 175, 239)"></span>
								</button>

								<button class="ce-inline-tool color-button" data-color="blue"
									type="button">
									<span style="background-color: rgb(1, 118, 200)"></span>
								</button>

								<button class="ce-inline-tool color-button"
									data-color="blueDeep" type="button">
									<span style="background-color: rgb(11, 68, 177)"></span>
								</button>

								<button class="ce-inline-tool color-button" data-color="violet"
									type="button">
									<span style="background-color: rgb(167, 83, 167)"></span>
								</button>

								<button class="ce-inline-tool color-button" data-color="purple"
									type="button">
									<span style="background-color: rgb(123, 77, 198)"></span>
								</button>

								<button class="ce-inline-tool color-button"
									data-color="purpleDeep" type="button">
									<span style="background-color: rgb(40, 6, 136)"></span>
								</button>

							</div>
						</div>
						<div class="inline-tool-alignment" data-tool="alignment">
							<button class="ce-inline-tool alignment-trigger" type="button">
								<i><svg width="25" height="24" viewBox="0 0 25 24"
										fill="none" xmlns="http://www.w3.org/2000/svg"> <path
											fill-rule="evenodd" clip-rule="evenodd"
											d="M5.5 8C5.5 7.44772 5.94772 7 6.5 7H19C19.5523 7 20 7.44772 20 8C20 8.55228 19.5523 9 19 9H6.5C5.94772 9 5.5 8.55228 5.5 8ZM5.5 13C5.5 12.4477 5.94772 12 6.5 12H12.75C13.3023 12 13.75 12.4477 13.75 13C13.75 13.5523 13.3023 14 12.75 14H6.5C5.94772 14 5.5 13.5523 5.5 13ZM6.5 17C5.94772 17 5.5 17.4477 5.5 18C5.5 18.5523 5.94772 19 6.5 19H19C19.5523 19 20 18.5523 20 18C20 17.4477 19.5523 17 19 17H6.5Z"
											fill="#6F6F6F"></path> </svg> </i><i><svg width="12" height="12"
										viewBox="0 0 12 12" fill="none" style="fill: none"
										xmlns="http://www.w3.org/2000/svg"> <path
											d="M3 5L6 8L9 5" stroke="#A5A5A5" stroke-linecap="round"
											stroke-linejoin="round"></path> </svg> </i>
							</button>
							<ul class="alignment-dropdown">
								<li>
									<button class="ce-inline-tool is-active" data-alignment="left"
										type="button">
										<svg width="25" height="24" viewBox="0 0 25 24" fill="none"
											xmlns="http://www.w3.org/2000/svg"> <path
												fill-rule="evenodd" clip-rule="evenodd"
												d="M5.5 8C5.5 7.44772 5.94772 7 6.5 7H19C19.5523 7 20 7.44772 20 8C20 8.55228 19.5523 9 19 9H6.5C5.94772 9 5.5 8.55228 5.5 8ZM5.5 13C5.5 12.4477 5.94772 12 6.5 12H12.75C13.3023 12 13.75 12.4477 13.75 13C13.75 13.5523 13.3023 14 12.75 14H6.5C5.94772 14 5.5 13.5523 5.5 13ZM6.5 17C5.94772 17 5.5 17.4477 5.5 18C5.5 18.5523 5.94772 19 6.5 19H19C19.5523 19 20 18.5523 20 18C20 17.4477 19.5523 17 19 17H6.5Z"
												fill="#6F6F6F"></path> </svg>
									</button>
								</li>
								<li>
									<button class="ce-inline-tool" data-alignment="center"
										type="button">
										<svg width="25" height="24" viewBox="0 0 25 24" fill="none"
											xmlns="http://www.w3.org/2000/svg"> <path
												fill-rule="evenodd" clip-rule="evenodd"
												d="M5.5 8C5.5 7.44772 5.94772 7 6.5 7H19C19.5523 7 20 7.44772 20 8C20 8.55228 19.5523 9 19 9H6.5C5.94772 9 5.5 8.55228 5.5 8ZM8.5 13C8.5 12.4477 8.94772 12 9.5 12H15.75C16.3023 12 16.75 12.4477 16.75 13C16.75 13.5523 16.3023 14 15.75 14H9.5C8.94772 14 8.5 13.5523 8.5 13ZM6.5 17C5.94772 17 5.5 17.4477 5.5 18C5.5 18.5523 5.94772 19 6.5 19H19C19.5523 19 20 18.5523 20 18C20 17.4477 19.5523 17 19 17H6.5Z"
												fill="#6F6F6F"></path> </svg>
									</button>
								</li>
								<li>
									<button class="ce-inline-tool" data-alignment="right"
										type="button">
										<svg width="25" height="24" viewBox="0 0 25 24" fill="none"
											xmlns="http://www.w3.org/2000/svg"> <path
												fill-rule="evenodd" clip-rule="evenodd"
												d="M5.5 8C5.5 7.44772 5.94772 7 6.5 7H19C19.5523 7 20 7.44772 20 8C20 8.55228 19.5523 9 19 9H6.5C5.94772 9 5.5 8.55228 5.5 8ZM11.5 13C11.5 12.4477 11.9477 12 12.5 12H18.75C19.3023 12 19.75 12.4477 19.75 13C19.75 13.5523 19.3023 14 18.75 14H12.5C11.9477 14 11.5 13.5523 11.5 13ZM6.5 17C5.94772 17 5.5 17.4477 5.5 18C5.5 18.5523 5.94772 19 6.5 19H19C19.5523 19 20 18.5523 20 18C20 17.4477 19.5523 17 19 17H6.5Z"
												fill="#6F6F6F"></path> </svg>
									</button>
								</li>
							</ul>
						</div>
						<button type="button" class="ce-inline-tool" data-tool="bold">
							<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
								style="fill: none" xmlns="http://www.w3.org/2000/svg"> <path
									d="M7.39583 20C7.02083 20 6.69444 19.88 6.41667 19.64C6.13889 19.4 6 19.1133 6 18.78V7.22C6 6.88667 6.13194 6.6 6.39583 6.36C6.67361 6.12 7.00694 6 7.39583 6H13C14.3333 6 15.3958 6.36 16.1875 7.08C16.9931 7.78667 17.3958 8.74 17.3958 9.94C17.3958 10.5133 17.2361 11.06 16.9167 11.58C16.5972 12.0867 16.1736 12.48 15.6458 12.76V12.82C16.3681 13.06 16.9375 13.4533 17.3542 14C17.7847 14.5467 18 15.1733 18 15.88C18 16.68 17.8056 17.3933 17.4167 18.02C17.0278 18.6467 16.4861 19.1333 15.7917 19.48C15.0972 19.8267 14.3056 20 13.4167 20H7.39583ZM12.9583 11.88C13.4167 11.88 13.8056 11.7 14.125 11.34C14.4583 10.98 14.625 10.5467 14.625 10.04C14.625 9.49333 14.4722 9.06 14.1667 8.74C13.875 8.42 13.4722 8.26 12.9583 8.26H8.70833V11.88H12.9583ZM13.375 17.74C13.9444 17.74 14.3958 17.58 14.7292 17.26C15.0625 16.9267 15.2292 16.4733 15.2292 15.9C15.2292 15.34 15.0625 14.9067 14.7292 14.6C14.4097 14.28 13.9583 14.12 13.375 14.12H8.70833V17.74H13.375Z"
									fill="#6F6F6F"></path> </svg>
						</button>
						<button type="button" class="ce-inline-tool" data-tool="underline">
							<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
								style="fill: none" xmlns="http://www.w3.org/2000/svg"> <path
									d="M12.5093 18.3737C11.4648 18.3737 10.5198 18.1626 9.67432 17.7404C8.84122 17.3182 8.18843 16.7346 7.71593 15.9895C7.24342 15.2445 7.00717 14.4001 7.00717 13.4563V6.84401C7.00717 6.24796 7.21856 5.79472 7.64132 5.48428C8.06408 5.16143 8.6858 5 9.50646 5V13.4563C9.50646 14.2883 9.78001 14.9527 10.3271 15.4494C10.8742 15.9461 11.6016 16.1944 12.5093 16.1944C13.417 16.1944 14.1444 15.9461 14.6915 15.4494C15.2386 14.9527 15.5122 14.2883 15.5122 13.4563V6.84401C15.5122 6.23555 15.7236 5.7761 16.1463 5.46566C16.5691 5.15522 17.1908 5 18.0115 5V13.4563C18.0115 14.4001 17.7752 15.2445 17.3027 15.9895C16.8302 16.7346 16.1712 17.3182 15.3257 17.7404C14.4926 18.1626 13.5538 18.3737 12.5093 18.3737Z"
									fill="#6F6F6F"></path> <path d="M6 20.0687H19V21H6V20.0687Z"
									fill="#6F6F6F"></path> </svg>
						</button>
						<button type="button" class="ce-inline-tool" data-tool="italic">
							<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
								style="fill: none" xmlns="http://www.w3.org/2000/svg"> <path
									d="M13.9181 9.06007C13.4648 9.06007 13.0981 8.94007 12.8181 8.70007C12.5381 8.44674 12.3981 8.12674 12.3981 7.74007C12.3981 7.20674 12.6048 6.7534 13.0181 6.38007C13.4315 6.00673 13.9248 5.82007 14.4981 5.82007C14.9381 5.82007 15.2981 5.94673 15.5781 6.20007C15.8581 6.44007 15.9981 6.7534 15.9981 7.14007C15.9981 7.6734 15.7915 8.12674 15.3781 8.50007C14.9781 8.8734 14.4915 9.06007 13.9181 9.06007ZM12.1181 9.99976H15.1381L11.5981 19.9998H8.57812L12.1181 9.99976Z"
									fill="#6F6F6F"></path> </svg>
						</button>
						<button type="button" class="ce-inline-tool ce-inline-tool--link"
							data-tool="link">
							<svg class="icon icon--link" width="14px" height="10px">
								<use xmlns:xlink="http://www.w3.org/1999/xlink"
									xlink:href="#link"></use></svg>
							<svg class="icon icon--unlink" width="15px" height="11px">
								<use xmlns:xlink="http://www.w3.org/1999/xlink"
									xlink:href="#unlink"></use></svg>
						</button>
						<div class="inline-tool-link" data-tool="hyperLink">
							<button class="ce-inline-tool link-trigger" data-tool="hyperLink"
								type="button">
								<svg width="24" height="24" style="fill: none"
									viewBox="0 0 24 24" fill="none"
									xmlns="http://www.w3.org/2000/svg"> <path
										d="M12 13.5H13.457C15.138 13.5 16.5 12.0102 16.5 10.0502C16.5 9.1086 16.1794 8.20561 15.6088 7.53982C15.0381 6.87403 14.2641 6.5 13.457 6.5H7.5H5.043C3.362 6.5 2 7.98983 2 9.94983C2 10.8914 2.3206 11.7944 2.89127 12.4602C3.46195 13.126 4.23595 13.5 5.043 13.5"
										stroke="#6F6F6F" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"></path> <path
										d="M12.5 10.5H11.043C9.36198 10.5 7.99998 11.9898 7.99998 13.9498C7.99998 14.8914 8.32058 15.7944 8.89125 16.4602C9.46192 17.126 10.2359 17.5 11.043 17.5H17H19.457C21.138 17.5 22.5 16.0102 22.5 14.0502C22.5 13.1086 22.1794 12.2056 21.6087 11.5398C21.0381 10.874 20.2641 10.5 19.457 10.5"
										stroke="#6F6F6F" stroke-width="2" stroke-linecap="round"
										stroke-linejoin="round"></path> </svg>
							</button>

						</div>
						<button type="button" class="ce-inline-tool" data-tool="code">
							<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
								style="fill: none" xmlns="http://www.w3.org/2000/svg"> <g
									clip-path="url(#clip0)"> <path
									d="M7.71814 16.75C7.47338 16.7504 7.23704 16.6607 7.05414 16.498L2.8349 12.7474C2.38741 12.3496 2.38741 11.6504 2.83488 11.2526L7.33514 7.25203C7.53422 7.08173 7.79218 6.99635 8.05356 7.01426C8.31493 7.03217 8.55884 7.15193 8.73283 7.3478C8.90682 7.54367 8.99699 7.8 8.98396 8.06166C8.97093 8.32332 8.85573 8.56942 8.66314 8.74703L5.00414 12L8.38214 15.002C8.5339 15.1367 8.64111 15.3143 8.68954 15.5114C8.73797 15.7084 8.72532 15.9155 8.65327 16.1051C8.58122 16.2948 8.45319 16.4581 8.28616 16.5733C8.11914 16.6884 7.92103 16.7501 7.71814 16.75ZM16.6631 16.748L21.1634 12.7474C21.6109 12.3496 21.6109 11.6504 21.1634 11.2527L16.9441 7.50203C16.7459 7.32593 16.4858 7.23579 16.2211 7.25145C15.9564 7.26711 15.7087 7.38728 15.5326 7.58553C15.3565 7.78378 15.2664 8.04387 15.2821 8.30858C15.2977 8.57328 15.4179 8.82093 15.6161 8.99703L18.9941 12L15.3351 15.252C15.1368 15.4281 15.0165 15.6758 15.0007 15.9406C14.985 16.2054 15.075 16.4656 15.2511 16.664C15.4272 16.8624 15.6749 16.9827 15.9397 16.9985C16.2045 17.0142 16.4648 16.9241 16.6631 16.748ZM11.9851 18.165L13.9851 6.16503C14.0107 6.03389 14.0097 5.89894 13.9823 5.76818C13.9548 5.63741 13.9015 5.51347 13.8253 5.40368C13.7492 5.29389 13.6518 5.20048 13.5389 5.12895C13.426 5.05743 13.3 5.00925 13.1682 4.98727C13.0364 4.96528 12.9015 4.96993 12.7716 5.00093C12.6416 5.03194 12.5192 5.08868 12.4115 5.1678C12.3038 5.24693 12.2131 5.34682 12.1447 5.46159C12.0762 5.57637 12.0315 5.70369 12.0131 5.83603L10.0131 17.836C9.98757 17.9672 9.98853 18.1021 10.016 18.2329C10.0434 18.3637 10.0968 18.4876 10.173 18.5974C10.2491 18.7072 10.3465 18.8006 10.4594 18.8721C10.5722 18.9436 10.6983 18.9918 10.8301 19.0138C10.9619 19.0358 11.0968 19.0311 11.2267 19.0001C11.3567 18.9691 11.4791 18.9124 11.5868 18.8333C11.6945 18.7541 11.7852 18.6542 11.8536 18.5395C11.922 18.4247 11.9668 18.2974 11.9851 18.165Z"
									fill="#6F6F6F"></path> </g> <defs> <clipPath id="clip0"> <rect
									width="20" height="20" fill="white" transform="translate(2 2)"></rect> </clipPath> </defs> </svg>
						</button>
						<button type="button" class="ce-inline-tool" data-tool="mark">
							<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
								style="fill: none" xmlns="http://www.w3.org/2000/svg"> <g
									clip-path="url(#clip0)"> <path fill-rule="evenodd"
									clip-rule="evenodd"
									d="M11.8986 8.37089C11.1567 9.11288 11.1566 10.3159 11.8986 11.0579L12.0411 11.2003L11.9679 11.2735L6.9939 16.2475C5.60798 17.6334 6.58953 20.0031 8.54953 20.0031L14.4892 20.0031C15.0727 20.0031 15.6323 19.7713 16.0449 19.3588L18.049 17.3546L18.1222 17.2814L18.2626 17.4219C19.0046 18.1638 20.2076 18.1638 20.9496 17.4219L23.0709 15.3005C23.4224 14.9491 23.4224 14.3792 23.0709 14.0277C22.7195 13.6763 22.1496 13.6763 21.7981 14.0277L19.6768 16.1491C19.6378 16.1881 19.5745 16.1881 19.5354 16.1491L13.1714 9.7851C13.1324 9.74605 13.1324 9.68273 13.1714 9.64368L15.2928 7.52236C15.6442 7.17089 15.6442 6.60104 15.2928 6.24957C14.9413 5.89809 14.3714 5.89809 14.02 6.24957L11.8986 8.37089ZM8.94953 18.2031L9.89575 18.2031L10.1294 18.2031L14.4892 18.2031C14.5953 18.2031 14.6971 18.161 14.7721 18.086L15.5034 17.3546L16.7762 16.0818L15.5034 14.809L14.5135 13.8191L13.2407 12.5463L11.9679 13.8191L9.38385 16.4031L9.21861 16.5684L8.54953 17.2374L8.26669 17.5203C8.0147 17.7723 8.19317 18.2031 8.54953 18.2031L8.94953 18.2031Z"
									fill="#6F6F6F"></path> <rect x="1" y="18.2014" width="5"
									height="1.79861" rx="0.899307" fill="#6F6F6F"></rect> </g> <defs> <clipPath
									id="clip0"> <rect width="24" height="24"
									fill="white"></rect> </clipPath> </defs> </svg>
						</button>
						<div class="inline-tool-list" data-tool="listGroup">
							<button class="ce-inline-tool list-trigger" type="button"
								data-list="unordered">
								<i><svg width="24" height="24" viewBox="0 0 24 24"
										fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M8 12H16" stroke="#6F6F6F" stroke-width="2"
											stroke-linecap="round" stroke-linejoin="round"></path>
										<path d="M8 7H18" stroke="#6F6F6F" stroke-width="2"
											stroke-linecap="round" stroke-linejoin="round"></path>
										<path d="M8 17H18" stroke="#6F6F6F" stroke-width="2"
											stroke-linecap="round" stroke-linejoin="round"></path>
										<rect x="3" y="6" width="2" height="2" rx="1" fill="#6F6F6F"></rect>
										<rect x="3" y="11" width="2" height="2" rx="1" fill="#6F6F6F"></rect>
										<rect x="3" y="16" width="2" height="2" rx="1" fill="#6F6F6F"></rect></svg></i>
							</button>
							<button class="ce-inline-tool list-trigger" type="button"
								data-list="ordered">
								<i><svg width="24" height="24" viewBox="0 0 24 24"
										fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M10 12H16.4" stroke="#6F6F6F" stroke-width="2"
											stroke-linecap="round" stroke-linejoin="round"></path>
										<path d="M10 7H18" stroke="#6F6F6F" stroke-width="2"
											stroke-linecap="round" stroke-linejoin="round"></path>
										<path d="M10 17H18" stroke="#6F6F6F" stroke-width="2"
											stroke-linecap="round" stroke-linejoin="round"></path>
										<path
											d="M7.153 9.328V10H4.663V9.328H5.503V7.123C5.503 7.067 5.504 7.011 5.506 6.955C5.508 6.897 5.511 6.839 5.515 6.781L5.017 7.195C4.973 7.229 4.929 7.25 4.885 7.258C4.843 7.264 4.803 7.264 4.765 7.258C4.727 7.25 4.693 7.237 4.663 7.219C4.633 7.199 4.611 7.179 4.597 7.159L4.303 6.769L5.665 5.626H6.433V9.328H7.153ZM6.928 17.16C7.028 17.16 7.107 17.188 7.165 17.244C7.223 17.298 7.252 17.37 7.252 17.46V18H4.18V17.7C4.18 17.642 4.192 17.58 4.216 17.514C4.24 17.448 4.282 17.388 4.342 17.334L5.602 16.065C5.71 15.957 5.804 15.854 5.884 15.756C5.964 15.658 6.03 15.562 6.082 15.468C6.134 15.372 6.173 15.277 6.199 15.183C6.225 15.087 6.238 14.986 6.238 14.88C6.238 14.706 6.196 14.573 6.112 14.481C6.03 14.387 5.904 14.34 5.734 14.34C5.596 14.34 5.479 14.377 5.383 14.451C5.289 14.523 5.224 14.613 5.188 14.721C5.146 14.831 5.091 14.904 5.023 14.94C4.955 14.976 4.858 14.984 4.732 14.964L4.24 14.877C4.272 14.659 4.333 14.469 4.423 14.307C4.515 14.145 4.628 14.01 4.762 13.902C4.898 13.794 5.053 13.714 5.227 13.662C5.401 13.608 5.588 13.581 5.788 13.581C6.004 13.581 6.198 13.613 6.37 13.677C6.544 13.739 6.692 13.826 6.814 13.938C6.936 14.05 7.029 14.184 7.093 14.34C7.159 14.494 7.192 14.664 7.192 14.85C7.192 15.01 7.169 15.158 7.123 15.294C7.079 15.43 7.018 15.56 6.94 15.684C6.862 15.806 6.771 15.925 6.667 16.041C6.565 16.155 6.456 16.271 6.34 16.389L5.485 17.265C5.595 17.231 5.704 17.205 5.812 17.187C5.92 17.169 6.02 17.16 6.112 17.16H6.928Z"
											fill="#6F6F6F"></path></svg></i>
							</button>
						</div>
					</div>
				</div>
				<section data-v-88efba62="" class="contents">
					<div data-v-88efba62="" class="editor-heding">
						<h1 data-v-88efba62="" contenteditable="true"></h1>
						<div data-v-88efba62="" class="title-count">0 / 80</div>
					</div>
					<div data-v-88efba62="" class="editor-body">
						<div data-v-88efba62="" class="editor-holder">
							<div id="editorjs">
								<div class="codex-editor">
									<div class="codex-editor__redactor"
										style="padding-bottom: 300px;">
										<div class="ce-block">
											<div class="ce-tune-alignment--left">
												<div class="ce-block__content">
													<p class="ce-paragraph cdx-block" contenteditable="true"
														data-placeholder="tab을 눌러 다양한 요소를 추가하세요">aaaaaaaaaaaaa</p>
												</div>
											</div>
										</div>
										<div class="ce-block ce-block--focused">
											<div class="ce-tune-alignment--left">
												<div class="ce-block__content">
													<p class="ce-paragraph cdx-block" contenteditable="true"
														data-placeholder="tab을 눌러 다양한 요소를 추가하세요"></p>
												</div>
											</div>
										</div>
									</div>
									<div hidden="" style="display: none;">
										<!--?xml version="1.0" encoding="utf-8"?-->
										<svg xmlns="http://www.w3.org/2000/svg">
<symbol id="arrow-down" viewBox="0 0 14 14">
  <path transform="matrix(1 0 0 -1 0 14)"
												d="M8.024 4.1v8.6a1.125 1.125 0 0 1-2.25 0V4.1L2.18 7.695A1.125 1.125 0 1 1 .59 6.104L6.103.588c.44-.439 1.151-.439 1.59 0l5.516 5.516a1.125 1.125 0 0 1-1.59 1.59L8.023 4.1z"></path>

</symbol>
<symbol id="arrow-up" viewBox="0 0 14 14">
    <path
												d="M8.024 4.1v8.6a1.125 1.125 0 0 1-2.25 0V4.1L2.18 7.695A1.125 1.125 0 1 1 .59 6.104L6.103.588c.44-.439 1.151-.439 1.59 0l5.516 5.516a1.125 1.125 0 0 1-1.59 1.59L8.023 4.1z"></path>

</symbol>
<symbol id="bold" viewBox="0 0 12 14">
											<path
												d="M5.997 14H1.72c-.618 0-1.058-.138-1.323-.415C.132 13.308 0 12.867 0 12.262V1.738C0 1.121.135.676.406.406.676.136 1.114 0 1.719 0h4.536c.669 0 1.248.041 1.738.124.49.083.93.242 1.318.478a3.458 3.458 0 0 1 1.461 1.752c.134.366.2.753.2 1.16 0 1.401-.7 2.426-2.1 3.075 1.84.586 2.76 1.726 2.76 3.42 0 .782-.2 1.487-.602 2.114a3.61 3.61 0 0 1-1.623 1.39 5.772 5.772 0 0 1-1.471.377c-.554.073-1.2.11-1.939.11zm-.21-6.217h-2.95v4.087h3.046c1.916 0 2.874-.69 2.874-2.072 0-.707-.248-1.22-.745-1.537-.496-.319-1.238-.478-2.225-.478zM2.837 2.13v3.619h2.597c.707 0 1.252-.067 1.638-.2.385-.134.68-.389.883-.765.16-.267.239-.566.239-.897 0-.707-.252-1.176-.755-1.409-.503-.232-1.27-.348-2.301-.348H2.836z"></path>
</symbol>
<symbol id="cross" viewBox="0 0 237 237">
  <path transform="rotate(45 280.675 51.325)"
												d="M191 191V73c0-5.523 4.477-10 10-10h25c5.523 0 10 4.477 10 10v118h118c5.523 0 10 4.477 10 10v25c0 5.523-4.477 10-10 10H236v118c0 5.523-4.477 10-10 10h-25c-5.523 0-10-4.477-10-10V236H73c-5.523 0-10-4.477-10-10v-25c0-5.523 4.477-10 10-10h118z"></path>

</symbol>
<symbol id="dots" viewBox="0 0 8 8">
  <circle cx="6.5" cy="1.5" r="1.5"></circle>
  <circle cx="6.5" cy="6.5" r="1.5"></circle>
  <circle cx="1.5" cy="1.5" r="1.5"></circle>
  <circle cx="1.5" cy="6.5" r="1.5"></circle>

</symbol>
<symbol id="italic" viewBox="0 0 4 11">
    <path
												d="M3.289 4.17L2.164 9.713c-.078.384-.238.674-.48.87-.243.198-.52.296-.831.296-.312 0-.545-.1-.699-.302-.153-.202-.192-.49-.116-.864L1.15 4.225c.077-.38.232-.665.466-.857a1.25 1.25 0 01.818-.288c.312 0 .55.096.713.288.163.192.21.46.141.801zm-.667-2.09c-.295 0-.53-.09-.706-.273-.176-.181-.233-.439-.173-.77.055-.302.207-.55.457-.745C2.45.097 2.716 0 3 0c.273 0 .5.088.68.265.179.176.238.434.177.771-.06.327-.21.583-.45.767-.24.185-.502.277-.785.277z"></path>

</symbol>
<symbol id="link" viewBox="0 0 14 10">
  <path
												d="M6 0v2H5a3 3 0 000 6h1v2H5A5 5 0 115 0h1zm2 0h1a5 5 0 110 10H8V8h1a3 3 0 000-6H8V0zM5 4h4a1 1 0 110 2H5a1 1 0 110-2z"></path>

</symbol>
<symbol id="plus" viewBox="0 0 14 14">
    <path
												d="M8.05 5.8h4.625a1.125 1.125 0 0 1 0 2.25H8.05v4.625a1.125 1.125 0 0 1-2.25 0V8.05H1.125a1.125 1.125 0 0 1 0-2.25H5.8V1.125a1.125 1.125 0 0 1 2.25 0V5.8z"></path>

</symbol>
<symbol id="sad-face" viewBox="0 0 52 52">
    <path fill="#D76B6B" fill-rule="nonzero"
												d="M26 52C11.64 52 0 40.36 0 26S11.64 0 26 0s26 11.64 26 26-11.64 26-26 26zm0-3.25c12.564 0 22.75-10.186 22.75-22.75S38.564 3.25 26 3.25 3.25 13.436 3.25 26 13.436 48.75 26 48.75zM15.708 33.042a2.167 2.167 0 1 1 0-4.334 2.167 2.167 0 0 1 0 4.334zm23.834 0a2.167 2.167 0 1 1 0-4.334 2.167 2.167 0 0 1 0 4.334zm-15.875 5.452a1.083 1.083 0 1 1-1.834-1.155c1.331-2.114 3.49-3.179 6.334-3.179 2.844 0 5.002 1.065 6.333 3.18a1.083 1.083 0 1 1-1.833 1.154c-.913-1.45-2.366-2.167-4.5-2.167s-3.587.717-4.5 2.167z"></path>

</symbol>
<symbol id="toggler-down">
  <path
												d="M6.5 9.294a.792.792 0 01-.562-.232L2.233 5.356a.794.794 0 011.123-1.123L6.5 7.377l3.144-3.144a.794.794 0 011.123 1.123L7.062 9.062a.792.792 0 01-.562.232z"></path>

</symbol>
<symbol id="unlink" viewBox="0 0 15 11">
  <path
												d="M13.073 2.099l-1.448 1.448A3 3 0 009 2H8V0h1c1.68 0 3.166.828 4.073 2.099zM6.929 4l-.879.879L7.172 6H5a1 1 0 110-2h1.929zM6 0v2H5a3 3 0 100 6h1v2H5A5 5 0 115 0h1zm6.414 7l2.122 2.121-1.415 1.415L11 8.414l-2.121 2.122L7.464 9.12 9.586 7 7.464 4.879 8.88 3.464 11 5.586l2.121-2.122 1.415 1.415L12.414 7z"></path>

</symbol>
											<symbol id="code">
											<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
												style="fill: none" xmlns="http://www.w3.org/2000/svg"> <g
													clip-path="url(#clip0)"> <path
													d="M7.71814 16.75C7.47338 16.7504 7.23704 16.6607 7.05414 16.498L2.8349 12.7474C2.38741 12.3496 2.38741 11.6504 2.83488 11.2526L7.33514 7.25203C7.53422 7.08173 7.79218 6.99635 8.05356 7.01426C8.31493 7.03217 8.55884 7.15193 8.73283 7.3478C8.90682 7.54367 8.99699 7.8 8.98396 8.06166C8.97093 8.32332 8.85573 8.56942 8.66314 8.74703L5.00414 12L8.38214 15.002C8.5339 15.1367 8.64111 15.3143 8.68954 15.5114C8.73797 15.7084 8.72532 15.9155 8.65327 16.1051C8.58122 16.2948 8.45319 16.4581 8.28616 16.5733C8.11914 16.6884 7.92103 16.7501 7.71814 16.75ZM16.6631 16.748L21.1634 12.7474C21.6109 12.3496 21.6109 11.6504 21.1634 11.2527L16.9441 7.50203C16.7459 7.32593 16.4858 7.23579 16.2211 7.25145C15.9564 7.26711 15.7087 7.38728 15.5326 7.58553C15.3565 7.78378 15.2664 8.04387 15.2821 8.30858C15.2977 8.57328 15.4179 8.82093 15.6161 8.99703L18.9941 12L15.3351 15.252C15.1368 15.4281 15.0165 15.6758 15.0007 15.9406C14.985 16.2054 15.075 16.4656 15.2511 16.664C15.4272 16.8624 15.6749 16.9827 15.9397 16.9985C16.2045 17.0142 16.4648 16.9241 16.6631 16.748ZM11.9851 18.165L13.9851 6.16503C14.0107 6.03389 14.0097 5.89894 13.9823 5.76818C13.9548 5.63741 13.9015 5.51347 13.8253 5.40368C13.7492 5.29389 13.6518 5.20048 13.5389 5.12895C13.426 5.05743 13.3 5.00925 13.1682 4.98727C13.0364 4.96528 12.9015 4.96993 12.7716 5.00093C12.6416 5.03194 12.5192 5.08868 12.4115 5.1678C12.3038 5.24693 12.2131 5.34682 12.1447 5.46159C12.0762 5.57637 12.0315 5.70369 12.0131 5.83603L10.0131 17.836C9.98757 17.9672 9.98853 18.1021 10.016 18.2329C10.0434 18.3637 10.0968 18.4876 10.173 18.5974C10.2491 18.7072 10.3465 18.8006 10.4594 18.8721C10.5722 18.9436 10.6983 18.9918 10.8301 19.0138C10.9619 19.0358 11.0968 19.0311 11.2267 19.0001C11.3567 18.9691 11.4791 18.9124 11.5868 18.8333C11.6945 18.7541 11.7852 18.6542 11.8536 18.5395C11.922 18.4247 11.9668 18.2974 11.9851 18.165Z"
													fill="#6F6F6F"></path> </g> <defs> <clipPath id="clip0"> <rect
													width="20" height="20" fill="white"
													transform="translate(2 2)"></rect> </clipPath> </defs> </svg> <svg width="24"
												height="24" style="fill: none" viewBox="0 0 24 24"
												fill="none" xmlns="http://www.w3.org/2000/svg">
												<g clip-path="url(#clip0_2756:57912)">
												<rect x="3" y="4" width="18" height="15" rx="1"
													stroke="#6F6F6F" stroke-width="2"></rect>
												<path
													d="M6.5 20L13.8081 8.40975C14.1578 7.85514 14.9377 7.78147 15.3851 8.2608L21.5 14.8125"
													stroke="#6F6F6F" stroke-width="2"></path>
												<rect x="6" y="7" width="3" height="3" rx="1.5"
													stroke="#6F6F6F" stroke-width="2"></rect></g>
												<defs>
												<clipPath id="clip0_2756:57912">
												<rect width="20" height="17" fill="white"
													transform="translate(2 3)"></rect></clipPath></defs></svg></symbol></svg>
									</div>
									<div class="codex-editor-overlay">
										<div class="codex-editor-overlay__container">
											<div class="codex-editor-overlay__rectangle"
												style="display: none; inset: 425px calc(100% - 165px) calc(100% - 427px) 164px;"></div>
										</div>
									</div>
									<div class="ce-toolbar ce-toolbar--opened"
										style="transform: translate3d(0px, 56px, 0px);">
										<div class="ce-toolbar__content">
											<div class="ce-toolbar__actions ce-toolbar__actions--opened">
												<div class="ce-toolbar__actions-buttons">
													<span class="ce-toolbar__settings-btn" draggable="true"><svg
															class="icon icon--dots" width="8px" height="8px">
															<use xmlns:xlink="http://www.w3.org/1999/xlink"
																xlink:href="#dots"></use></svg></span>
												</div>
												<div class="ce-settings">
													<div class="ce-settings__plugin-zone"></div>
													<div class="ce-settings__default-zone"></div>
												</div>
											</div>
											<div class="ce-toolbar__plus"
												style="transform: translate3d(0px, calc(22px - 50%), 0px);">
												<svg width="24" height="24" style="fill: none"
													viewBox="0 0 24 24" fill="none"
													xmlns="http://www.w3.org/2000/svg"> <path
														fill-rule="evenodd" clip-rule="evenodd"
														d="M12 4.5C12.2761 4.5 12.5 4.72386 12.5 5V19C12.5 19.2761 12.2761 19.5 12 19.5C11.7239 19.5 11.5 19.2761 11.5 19V5C11.5 4.72386 11.7239 4.5 12 4.5Z"
														fill="#A7A39A"></path> <path fill-rule="evenodd"
														clip-rule="evenodd"
														d="M19.5 12C19.5 12.2761 19.2761 12.5 19 12.5L5 12.5C4.72386 12.5 4.5 12.2761 4.5 12C4.5 11.7239 4.72386 11.5 5 11.5L19 11.5C19.2761 11.5 19.5 11.7239 19.5 12Z"
														fill="#A7A39A"></path> </svg>
											</div>
											<div class="ce-toolbox"
												style="transform: translate3d(0px, calc(22px - 50%), 0px);">
												<li class="ce-toolbox__button" data-tool="book"><div
														class="tool-btn">
														<svg width="18" height="20" style="fill: none"
															viewBox="0 0 18 20" fill="none"
															xmlns="http://www.w3.org/2000/svg">
															<path
																d="M1.5 3.75C1.5 2.50736 2.50736 1.5 3.75 1.5H16.5V18.5H3.75C2.50736 18.5 1.5 17.4926 1.5 16.25V3.75Z"
																stroke="#6F6F6F" stroke-width="2" stroke-linecap="round"
																stroke-linejoin="round"></path>
															<path d="M5.5 1.5V14.5" stroke="#6F6F6F" stroke-width="2"
																stroke-linecap="round" stroke-linejoin="round"></path>
															<path
																d="M1.5 16.5C1.5 15.3954 2.39543 14.5 3.5 14.5H16.5V18.5H3.5C2.39543 18.5 1.5 17.6046 1.5 16.5V16.5Z"
																stroke="#6F6F6F" stroke-width="2" stroke-linecap="round"
																stroke-linejoin="round"></path></svg>
														<p>책</p>
													</div></li>
												<li class="ce-toolbox__button" data-tool="highlight"><div
														class="tool-btn">
														<svg width="24" height="24" style="fill: none"
															viewBox="0 0 24 24" fill="none"
															xmlns="http://www.w3.org/2000/svg">
															<mask id="path-2-outside-1_2756:57897"
																maskUnits="userSpaceOnUse" x="2" y="3" width="20"
																height="16" fill="black">
															<rect fill="white" x="2" y="3" width="20" height="16"></rect>
															<path
																d="M6.4783 10.7081C6.4783 10.4486 6.52066 10.1459 6.60539 9.8C6.69012 9.41081 6.88076 8.97838 7.1773 8.5027C7.51622 7.98378 7.83395 7.57297 8.1305 7.27027C8.42705 6.92432 8.8295 6.55676 9.33787 6.16756C9.50733 6.03784 9.63442 5.90811 9.71915 5.77838C9.84624 5.6054 9.84624 5.43243 9.71915 5.25946L9.6556 5.19459C9.48615 5.06486 9.29551 5 9.08369 5C8.87187 5 8.70241 5.04324 8.57532 5.12973C8.3635 5.25946 8.1305 5.41081 7.87631 5.58378C7.62213 5.71351 7.36794 5.88648 7.11376 6.1027C6.81721 6.31892 6.52066 6.57838 6.22411 6.88108C5.96993 7.14054 5.73693 7.44324 5.52511 7.78919C5.01674 8.56756 4.63546 9.36756 4.38128 10.1892C4.12709 11.0108 4 11.8108 4 12.5892C4 13.7568 4.29655 14.7946 4.88965 15.7027C5.52511 16.5676 6.45712 17 7.68567 17C8.44823 17 9.12605 16.7189 9.71915 16.1568C10.3546 15.5946 10.6723 14.8811 10.6723 14.0162C10.6723 13.2378 10.397 12.5243 9.84624 11.8757C9.29551 11.1838 8.63887 10.8378 7.87631 10.8378C7.83395 10.8378 7.68567 10.8811 7.43149 10.9676C7.21967 11.0108 7.05021 11.0324 6.92312 11.0324C6.7113 11.0757 6.58421 11.0757 6.54184 11.0324C6.49948 10.9459 6.4783 10.8378 6.4783 10.7081ZM15.806 10.7081C15.806 10.4486 15.8483 10.1459 15.9331 9.8C16.0178 9.41081 16.2084 8.97838 16.505 8.5027C16.8439 7.98378 17.1616 7.57297 17.4582 7.27027C17.7547 6.92432 18.1572 6.55676 18.6655 6.16756C18.835 6.03784 18.9621 5.90811 19.0468 5.77838C19.1739 5.6054 19.1739 5.43243 19.0468 5.25946L18.9833 5.19459C18.8138 5.06486 18.6232 5 18.4113 5C18.1995 5 18.0301 5.04324 17.903 5.12973C17.6912 5.25946 17.4582 5.41081 17.204 5.58378C16.9498 5.71351 16.6956 5.88648 16.4414 6.1027C16.1449 6.31892 15.8483 6.57838 15.5518 6.88108C15.2976 7.14054 15.0646 7.44324 14.8528 7.78919C14.3444 8.56756 13.9631 9.36756 13.7089 10.1892C13.4548 11.0108 13.3277 11.8108 13.3277 12.5892C13.3277 13.7568 13.6242 14.7946 14.2173 15.7027C14.8528 16.5676 15.7848 17 17.0133 17C17.7759 17 18.4537 16.7189 19.0468 16.1568C19.6823 15.5946 20 14.8811 20 14.0162C20 13.2378 19.7246 12.5243 19.1739 11.8757C18.6232 11.1838 17.9665 10.8378 17.204 10.8378C17.1616 10.8378 17.0133 10.8811 16.7592 10.9676C16.5473 11.0108 16.3779 11.0324 16.2508 11.0324C16.039 11.0757 15.9119 11.0757 15.8695 11.0324C15.8271 10.9459 15.806 10.8378 15.806 10.7081Z"></path></mask>
															<path
																d="M6.60539 9.8L8.54798 10.2758L8.55412 10.2507L8.55962 10.2254L6.60539 9.8ZM7.1773 8.5027L5.50281 7.40906L5.49127 7.42672L5.48011 7.44463L7.1773 8.5027ZM8.1305 7.27027L9.55916 8.66988L9.60569 8.62239L9.64896 8.57192L8.1305 7.27027ZM9.33787 6.16756L8.12212 4.5795L8.12211 4.57951L9.33787 6.16756ZM9.71915 5.77838L8.10743 4.59416L8.07479 4.63859L8.04464 4.68475L9.71915 5.77838ZM9.71915 5.25946L11.3309 4.07526L11.247 3.96106L11.1478 3.85983L9.71915 5.25946ZM9.6556 5.19459L11.0843 3.79497L10.9845 3.69316L10.8714 3.60653L9.6556 5.19459ZM8.57532 5.12973L9.61987 6.83528L9.66082 6.8102L9.70052 6.78319L8.57532 5.12973ZM7.87631 5.58378L8.78549 7.36519L8.89752 7.30801L9.00151 7.23724L7.87631 5.58378ZM7.11376 6.1027L8.29204 7.71876L8.35256 7.67464L8.40961 7.62611L7.11376 6.1027ZM6.22411 6.88108L4.79545 5.48147L4.79545 5.48147L6.22411 6.88108ZM5.52511 7.78919L7.19961 8.88283L7.21555 8.85842L7.23077 8.83355L5.52511 7.78919ZM4.38128 10.1892L6.29193 10.7803L6.29193 10.7803L4.38128 10.1892ZM4.88965 15.7027L3.21514 16.7963L3.24529 16.8425L3.27793 16.8869L4.88965 15.7027ZM9.71915 16.1568L8.39397 14.6588L8.36824 14.6816L8.3433 14.7052L9.71915 16.1568ZM9.84624 11.8757L8.28144 13.1212L8.30116 13.146L8.32164 13.1701L9.84624 11.8757ZM7.43149 10.9676L7.83155 12.9271L7.95572 12.9018L8.07571 12.861L7.43149 10.9676ZM6.92312 11.0324V9.03243H6.72107L6.5231 9.07284L6.92312 11.0324ZM6.54184 11.0324L4.74574 11.9122L4.88758 12.2018L5.11324 12.4321L6.54184 11.0324ZM15.9331 9.8L17.8756 10.2758L17.8818 10.2507L17.8873 10.2254L15.9331 9.8ZM16.505 8.5027L14.8305 7.40906L14.8189 7.42672L14.8078 7.44463L16.505 8.5027ZM17.4582 7.27027L18.8868 8.66988L18.9333 8.62239L18.9766 8.57191L17.4582 7.27027ZM18.6655 6.16756L17.4498 4.5795L17.4498 4.57951L18.6655 6.16756ZM19.0468 5.77838L17.4351 4.59417L17.4024 4.63859L17.3723 4.68474L19.0468 5.77838ZM19.0468 5.25946L20.6585 4.07527L20.5746 3.96107L20.4755 3.85984L19.0468 5.25946ZM18.9833 5.19459L20.4119 3.79498L20.3122 3.69317L20.199 3.60653L18.9833 5.19459ZM17.903 5.12973L18.9475 6.83528L18.9885 6.8102L19.0282 6.78319L17.903 5.12973ZM17.204 5.58378L18.1131 7.36519L18.2252 7.30801L18.3292 7.23724L17.204 5.58378ZM16.4414 6.1027L17.6197 7.71876L17.6802 7.67463L17.7373 7.62611L16.4414 6.1027ZM15.5518 6.88108L16.9804 8.2807L16.9804 8.28069L15.5518 6.88108ZM14.8528 7.78919L16.5273 8.88283L16.5432 8.85842L16.5584 8.83355L14.8528 7.78919ZM13.7089 10.1892L15.6196 10.7803V10.7803L13.7089 10.1892ZM14.2173 15.7027L12.5428 16.7963L12.5729 16.8425L12.6056 16.8869L14.2173 15.7027ZM19.0468 16.1568L17.7216 14.6588L17.6959 14.6816L17.671 14.7052L19.0468 16.1568ZM19.1739 11.8757L17.6091 13.1212L17.6288 13.146L17.6493 13.1701L19.1739 11.8757ZM16.7592 10.9676L17.1592 12.9271L17.2834 12.9018L17.4034 12.861L16.7592 10.9676ZM16.2508 11.0324V9.03243H16.0487L15.8508 9.07284L16.2508 11.0324ZM15.8695 11.0324L14.0734 11.9122L14.2152 12.2018L14.4409 12.4321L15.8695 11.0324ZM8.4783 10.7081C8.4783 10.6559 8.48832 10.5193 8.54798 10.2758L4.66281 9.32422C4.553 9.77255 4.4783 10.2414 4.4783 10.7081H8.4783ZM8.55962 10.2254C8.58013 10.1312 8.65376 9.91486 8.8745 9.56078L5.48011 7.44463C5.10775 8.0419 4.80011 8.69038 4.65116 9.37456L8.55962 10.2254ZM8.8518 9.59634C9.14869 9.14178 9.38586 8.84678 9.55916 8.66988L6.70183 5.87066C6.28204 6.29916 5.88375 6.82579 5.50281 7.40906L8.8518 9.59634ZM9.64896 8.57192C9.82666 8.36461 10.1151 8.09131 10.5536 7.75562L8.12211 4.57951C7.54386 5.0222 7.02743 5.48404 6.61204 5.96862L9.64896 8.57192ZM10.5536 7.75563C10.84 7.53643 11.1481 7.24794 11.3937 6.87201L8.04464 4.68475C8.08499 4.62297 8.11861 4.58663 8.13163 4.57335C8.14479 4.55991 8.14417 4.56262 8.12212 4.5795L10.5536 7.75563ZM11.3309 6.96259C11.585 6.61674 11.8145 6.12497 11.8145 5.51892C11.8145 4.91287 11.585 4.4211 11.3309 4.07526L8.10742 6.44365C7.98041 6.27078 7.81447 5.95199 7.81447 5.51892C7.81447 5.08584 7.98041 4.76704 8.10743 4.59416L11.3309 6.96259ZM11.1478 3.85983L11.0843 3.79497L8.22695 6.59421L8.29049 6.65908L11.1478 3.85983ZM10.8714 3.60653C10.3558 3.21181 9.73858 3 9.08369 3V7C8.98192 7 8.86401 6.9838 8.74131 6.94205C8.61877 6.90036 8.5174 6.84202 8.43985 6.78266L10.8714 3.60653ZM9.08369 3C8.61779 3 8.01285 3.09333 7.45012 3.47627L9.70052 6.78319C9.39198 6.99315 9.12594 7 9.08369 7V3ZM7.53076 3.42418C7.28616 3.57399 7.02583 3.74337 6.75111 3.93033L9.00151 7.23724C9.23516 7.07824 9.44084 6.94493 9.61987 6.83528L7.53076 3.42418ZM6.96714 3.80238C6.55348 4.0135 6.17111 4.27885 5.81791 4.57929L8.40961 7.62611C8.56478 7.49412 8.69077 7.41353 8.78549 7.36519L6.96714 3.80238ZM5.93548 4.48664C5.53721 4.77702 5.15777 5.11162 4.79545 5.48147L7.65278 8.28069C7.88355 8.04513 8.09721 7.86081 8.29204 7.71876L5.93548 4.48664ZM4.79545 5.48147C4.42443 5.86019 4.10092 6.28511 3.81944 6.74482L7.23077 8.83355C7.37293 8.60137 7.51543 8.4209 7.65278 8.28069L4.79545 5.48147ZM3.85061 6.69555C3.24872 7.61711 2.78403 8.58503 2.47062 9.59809L6.29193 10.7803C6.48689 10.1501 6.78475 9.51802 7.19961 8.88283L3.85061 6.69555ZM2.47062 9.59809C2.16337 10.5913 2 11.5906 2 12.5892H6C6 12.031 6.09082 11.4304 6.29193 10.7803L2.47062 9.59809ZM2 12.5892C2 14.1141 2.39329 15.538 3.21514 16.7963L6.56415 14.6091C6.19981 14.0512 6 13.3994 6 12.5892H2ZM3.27793 16.8869C4.3486 18.3441 5.92615 19 7.68567 19V15C6.98808 15 6.70161 14.791 6.50136 14.5185L3.27793 16.8869ZM7.68567 19C8.99902 19 10.1596 18.4949 11.095 17.6083L8.3433 14.7052C8.09251 14.9429 7.89743 15 7.68567 15V19ZM11.0443 17.6547C12.1183 16.7046 12.6723 15.4413 12.6723 14.0162H8.67234C8.67234 14.3208 8.5909 14.4846 8.39397 14.6588L11.0443 17.6547ZM12.6723 14.0162C12.6723 12.7182 12.1978 11.5552 11.3708 10.5812L8.32164 13.1701C8.59619 13.4935 8.67234 13.7574 8.67234 14.0162H12.6723ZM11.411 10.6301C10.549 9.54709 9.34972 8.83784 7.87631 8.83784V12.8378C7.92801 12.8378 8.04205 12.8205 8.28144 13.1212L11.411 10.6301ZM7.87631 8.83784C7.62164 8.83784 7.41267 8.88859 7.38226 8.89549C7.30318 8.91343 7.22985 8.93379 7.17338 8.95026C7.05776 8.98397 6.92518 9.02724 6.78727 9.07416L8.07571 12.861C8.19198 12.8214 8.26063 12.7998 8.29329 12.7903C8.31095 12.7851 8.29852 12.7893 8.26711 12.7964C8.25117 12.8 8.21507 12.8079 8.16574 12.8156C8.14028 12.8196 8.10436 12.8247 8.06065 12.829C8.01873 12.833 7.95486 12.8378 7.87631 12.8378V8.83784ZM7.03143 9.00798C6.96209 9.02214 6.91698 9.02916 6.89238 9.0323C6.88068 9.03379 6.87719 9.03395 6.88094 9.03367C6.88439 9.03342 6.89906 9.03243 6.92312 9.03243V13.0324C7.24574 13.0324 7.56586 12.9814 7.83155 12.9271L7.03143 9.00798ZM6.5231 9.07284C6.47107 9.08347 6.53698 9.06486 6.66894 9.06486C6.73582 9.06486 6.88875 9.06903 7.084 9.11885C7.26882 9.16601 7.63526 9.29064 7.97045 9.63276L5.11324 12.4321C5.46961 12.7958 5.86783 12.9367 6.09501 12.9947C6.33263 13.0553 6.53851 13.0649 6.66894 13.0649C6.92798 13.0649 7.16335 13.0246 7.32314 12.992L6.5231 9.07284ZM8.33795 10.1527C8.46793 10.418 8.4783 10.6335 8.4783 10.7081H4.4783C4.4783 11.0421 4.53104 11.4739 4.74574 11.9122L8.33795 10.1527ZM17.806 10.7081C17.806 10.6559 17.816 10.5193 17.8756 10.2758L13.9905 9.32422C13.8807 9.77256 13.806 10.2414 13.806 10.7081H17.806ZM17.8873 10.2254C17.9078 10.1312 17.9814 9.91485 18.2022 9.56077L14.8078 7.44463C14.4354 8.0419 14.1278 8.69038 13.9788 9.37456L17.8873 10.2254ZM18.1795 9.59634C18.4763 9.14178 18.7135 8.84679 18.8868 8.66988L16.0295 5.87065C15.6097 6.29916 15.2114 6.82579 14.8305 7.40906L18.1795 9.59634ZM18.9766 8.57191C19.1543 8.3646 19.4428 8.09131 19.8813 7.75562L17.4498 4.57951C16.8715 5.0222 16.3551 5.48405 15.9397 5.96862L18.9766 8.57191ZM19.8813 7.75563C20.1676 7.53643 20.4758 7.24794 20.7213 6.87201L17.3723 4.68474C17.4127 4.62297 17.4463 4.58663 17.4593 4.57335C17.4725 4.55991 17.4718 4.56262 17.4498 4.5795L19.8813 7.75563ZM20.6585 6.96258C20.9126 6.61673 21.1421 6.12496 21.1421 5.51892C21.1421 4.91288 20.9126 4.42111 20.6585 4.07527L17.4351 6.44365C17.3081 6.27078 17.1421 5.95199 17.1421 5.51892C17.1421 5.08585 17.3081 4.76705 17.4351 4.59417L20.6585 6.96258ZM20.4755 3.85984L20.4119 3.79498L17.5546 6.59421L17.6181 6.65907L20.4755 3.85984ZM20.199 3.60653C19.6834 3.21181 19.0662 3 18.4113 3V7C18.3096 7 18.1917 6.9838 18.069 6.94205C17.9464 6.90036 17.8451 6.84202 17.7675 6.78265L20.199 3.60653ZM18.4113 3C17.9455 3 17.3405 3.09333 16.7778 3.47627L19.0282 6.78319C18.7196 6.99315 18.4536 7 18.4113 7V3ZM16.8584 3.42418C16.6138 3.57399 16.3535 3.74337 16.0788 3.93032L18.3292 7.23724C18.5628 7.07824 18.7685 6.94493 18.9475 6.83528L16.8584 3.42418ZM16.2948 3.80238C15.8811 4.0135 15.4988 4.27885 15.1456 4.57929L17.7373 7.62611C17.8924 7.49412 18.0184 7.41353 18.1131 7.36519L16.2948 3.80238ZM15.2631 4.48664C14.8649 4.77702 14.4854 5.11162 14.1231 5.48147L16.9804 8.28069C17.2112 8.04513 17.4249 7.86081 17.6197 7.71876L15.2631 4.48664ZM14.1231 5.48146C13.7521 5.86018 13.4286 6.2851 13.1471 6.74483L16.5584 8.83355C16.7006 8.60138 16.8431 8.4209 16.9804 8.2807L14.1231 5.48146ZM13.1783 6.69555C12.5764 7.61711 12.1117 8.58503 11.7983 9.59809L15.6196 10.7803C15.8146 10.1501 16.1124 9.51802 16.5273 8.88283L13.1783 6.69555ZM11.7983 9.59809C11.491 10.5913 11.3277 11.5906 11.3277 12.5892H15.3277C15.3277 12.031 15.4185 11.4304 15.6196 10.7803L11.7983 9.59809ZM11.3277 12.5892C11.3277 14.1141 11.7209 15.538 12.5428 16.7963L15.8918 14.6091C15.5275 14.0512 15.3277 13.3994 15.3277 12.5892H11.3277ZM12.6056 16.8869C13.6763 18.3441 15.2538 19 17.0133 19V15C16.3157 15 16.0293 14.791 15.829 14.5185L12.6056 16.8869ZM17.0133 19C18.3267 19 19.4873 18.4949 20.4227 17.6083L17.671 14.7052C17.4202 14.9429 17.2251 15 17.0133 15V19ZM20.372 17.6547C21.446 16.7046 22 15.4413 22 14.0162H18C18 14.3208 17.9186 14.4846 17.7216 14.6588L20.372 17.6547ZM22 14.0162C22 12.7182 21.5254 11.5552 20.6985 10.5812L17.6493 13.1701C17.9239 13.4935 18 13.7574 18 14.0162H22ZM20.7387 10.6301C19.8766 9.54709 18.6774 8.83784 17.204 8.83784V12.8378C17.2557 12.8378 17.3697 12.8205 17.6091 13.1212L20.7387 10.6301ZM17.204 8.83784C16.9493 8.83784 16.7403 8.88859 16.7099 8.89549C16.6308 8.91343 16.5575 8.93379 16.501 8.95025C16.3854 8.98397 16.2528 9.02724 16.1149 9.07416L17.4034 12.861C17.5196 12.8214 17.5883 12.7998 17.6209 12.7903C17.6386 12.7851 17.6262 12.7893 17.5948 12.7964C17.5788 12.8 17.5427 12.8079 17.4934 12.8156C17.4679 12.8196 17.432 12.8247 17.3883 12.829C17.3464 12.833 17.2825 12.8378 17.204 12.8378V8.83784ZM16.3591 9.00798C16.2897 9.02214 16.2446 9.02916 16.22 9.0323C16.2083 9.03379 16.2049 9.03395 16.2086 9.03367C16.2121 9.03342 16.2267 9.03243 16.2508 9.03243V13.0324C16.5734 13.0324 16.8935 12.9814 17.1592 12.9271L16.3591 9.00798ZM15.8508 9.07284C15.7987 9.08347 15.8646 9.06486 15.9966 9.06486C16.0635 9.06486 16.2164 9.06903 16.4117 9.11885C16.5965 9.16601 16.9629 9.29064 17.2981 9.63277L14.4409 12.4321C14.7973 12.7958 15.1955 12.9367 15.4227 12.9947C15.6603 13.0553 15.8662 13.0649 15.9966 13.0649C16.2556 13.0649 16.491 13.0246 16.6508 12.992L15.8508 9.07284ZM17.6656 10.1527C17.7956 10.418 17.806 10.6336 17.806 10.7081H13.806C13.806 11.0421 13.8587 11.4739 14.0734 11.9122L17.6656 10.1527Z"
																fill="#6F6F6F" mask="url(#path-2-outside-1_2756:57897)"></path></svg>
														<p>하이라이트</p>
													</div></li>
												<li class="ce-toolbox__button" data-tool="bookShelf"><div
														class="tool-btn">
														<svg width="24" height="24" style="fill: none"
															viewBox="0 0 24 24" fill="none"
															xmlns="http://www.w3.org/2000/svg">
															<path
																d="M3 17.0013V6.00128C3 5.449 3.44772 5.00128 4 5.00128H6.98918C7.54112 5.00128 7.98869 5.44845 7.98918 6.00038L7.9991 17.0004C7.9996 17.553 7.55174 18.0013 6.9991 18.0013H4C3.44772 18.0013 3 17.5536 3 17.0013Z"
																stroke="#6F6F6F" stroke-width="2"></path>
															<path
																d="M8 16.9993V5.99933C8 5.44704 8.44772 4.99933 9 4.99933H11.9892C12.5411 4.99933 12.9887 5.44649 12.9892 5.99843L12.9991 16.9984C12.9996 17.5511 12.5517 17.9993 11.9991 17.9993H9C8.44772 17.9993 8 17.5516 8 16.9993Z"
																stroke="#6F6F6F" stroke-width="2"></path>
															<path
																d="M17.0959 17.1304L14.2729 7.17817C14.1222 6.64685 14.4307 6.09395 14.962 5.94323L17.6253 5.18779C18.1562 5.03717 18.7089 5.34522 18.86 5.87607L21.692 15.8257C21.8433 16.3572 21.5348 16.9107 21.0031 17.0615L18.3309 17.8195C17.7995 17.9702 17.2466 17.6617 17.0959 17.1304Z"
																stroke="#6F6F6F" stroke-width="2"></path></svg>
														<p>책장</p>
													</div></li>
												<li class="ce-toolbox__button" data-tool="videos"><div
														class="tool-btn">
														<svg width="24" height="24" style="fill: none"
															viewBox="0 0 24 24" fill="none"
															xmlns="http://www.w3.org/2000/svg">
															<path
																d="M3 8.52494C3 6.46993 4.55718 4.74927 6.60198 4.54479L8.41786 4.3632C10.8 4.12499 13.2 4.12499 15.5821 4.3632L17.398 4.54479C19.4428 4.74927 21 6.46993 21 8.52494V14.4751C21 16.5301 19.4428 18.2507 17.398 18.4552L15.5821 18.6368C13.2 18.875 10.8 18.875 8.41787 18.6368L6.60199 18.4552C4.55718 18.2507 3 16.5301 3 14.4751V8.52494Z"
																stroke="#6F6F6F" stroke-width="2"></path>
															<path d="M10 13.8162V9.17147L14.4367 11.4276L10 13.8162Z"
																stroke="#6F6F6F" stroke-width="2"></path></svg>
														<p>비디오</p>
													</div></li>
												<li class="ce-toolbox__button" data-tool="images"><div
														class="tool-btn">
														<svg width="24" height="24" style="fill: none"
															viewBox="0 0 24 24" fill="none"
															xmlns="http://www.w3.org/2000/svg">
															<g clip-path="url(#clip0_2756:57912)">
															<rect x="3" y="4" width="18" height="15" rx="1"
																stroke="#6F6F6F" stroke-width="2"></rect>
															<path
																d="M6.5 20L13.8081 8.40975C14.1578 7.85514 14.9377 7.78147 15.3851 8.2608L21.5 14.8125"
																stroke="#6F6F6F" stroke-width="2"></path>
															<rect x="6" y="7" width="3" height="3" rx="1.5"
																stroke="#6F6F6F" stroke-width="2"></rect></g>
															<defs>
															<clipPath id="clip0_2756:57912">
															<rect width="20" height="17" fill="white"
																transform="translate(2 3)"></rect></clipPath></defs></svg>
														<p>이미지</p>
													</div></li>
												<li class="ce-toolbox__button" data-tool="linktool"><div
														class="tool-btn">
														<svg width="24" height="24" style="fill: none"
															viewBox="0 0 24 24" fill="none"
															xmlns="http://www.w3.org/2000/svg">
															<path
																d="M12 13.5H13.457C15.138 13.5 16.5 12.0102 16.5 10.0502C16.5 9.1086 16.1794 8.20561 15.6088 7.53982C15.0381 6.87403 14.2641 6.5 13.457 6.5H7.5H5.043C3.362 6.5 2 7.98983 2 9.94983C2 10.8914 2.3206 11.7944 2.89127 12.4602C3.46195 13.126 4.23595 13.5 5.043 13.5"
																stroke="#6F6F6F" stroke-width="2" stroke-linecap="round"
																stroke-linejoin="round"></path>
															<path
																d="M12.5 10.5H11.043C9.36198 10.5 7.99998 11.9898 7.99998 13.9498C7.99998 14.8914 8.32058 15.7944 8.89125 16.4602C9.46192 17.126 10.2359 17.5 11.043 17.5H17H19.457C21.138 17.5 22.5 16.0102 22.5 14.0502C22.5 13.1086 22.1794 12.2056 21.6087 11.5398C21.0381 10.874 20.2641 10.5 19.457 10.5"
																stroke="#6F6F6F" stroke-width="2" stroke-linecap="round"
																stroke-linejoin="round"></path></svg>
														<p>링크</p>
													</div></li>
												<li class="ce-toolbox__button" data-tool="delimiter"><div
														class="tool-btn">
														<svg width="24" height="24" viewBox="0 0 24 24"
															fill="none" xmlns="http://www.w3.org/2000/svg">
															<rect y="11" width="24" height="2" rx="1" fill="#6F6F6F"></rect></svg>
														<p>구분선</p>
													</div></li>
											</div>
										</div>
									</div>
									<div class="ce-inline-toolbar ce-inline-toolbar--left-oriented"
										style="left: 484px; top: 37px;">
										<div class="ce-inline-toolbar__toggler-and-button-wrapper">
											<div class="ce-inline-toolbar__dropdown">
												<div class="ce-inline-toolbar__dropdown-content"></div>
												<svg class="icon icon--toggler-down" width="13px"
													height="13px">
													<use xmlns:xlink="http://www.w3.org/1999/xlink"
														xlink:href="#toggler-down"></use></svg>
											</div>
										</div>
										<div class="ce-inline-toolbar__actions">
											<input placeholder="링크를 추가하세요" class="ce-inline-tool-input">
										</div>
										<div class="ce-conversion-toolbar">
											<div class="ce-conversion-toolbar__label">Convert to</div>
											<div class="ce-conversion-toolbar__tools">
												<div class="ce-conversion-tool" data-tool="paragraph">
													<div class="ce-conversion-tool__icon"></div>
													Text
												</div>
												<div class="ce-conversion-tool" data-tool="heading">
													<div class="ce-conversion-tool__icon"></div>
													Heading
												</div>
												<div class="ce-conversion-tool" data-tool="list">
													<div class="ce-conversion-tool__icon">
														<svg width="17" height="13" viewBox="0 0 17 13"
															xmlns="http://www.w3.org/2000/svg"> <path
																d="M5.625 4.85h9.25a1.125 1.125 0 0 1 0 2.25h-9.25a1.125 1.125 0 0 1 0-2.25zm0-4.85h9.25a1.125 1.125 0 0 1 0 2.25h-9.25a1.125 1.125 0 0 1 0-2.25zm0 9.85h9.25a1.125 1.125 0 0 1 0 2.25h-9.25a1.125 1.125 0 0 1 0-2.25zm-4.5-5a1.125 1.125 0 1 1 0 2.25 1.125 1.125 0 0 1 0-2.25zm0-4.85a1.125 1.125 0 1 1 0 2.25 1.125 1.125 0 0 1 0-2.25zm0 9.85a1.125 1.125 0 1 1 0 2.25 1.125 1.125 0 0 1 0-2.25z"></path></svg>
													</div>
													List
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!---->
						</div>
					</div>
				</section>
				<!---->
				<!---->
				<!---->
				<!---->
			</div>
		</section>
		<!---->
		<!---->
		<!---->
		<!---->
	</div>
	
	<script async=""
		src="https://www.googletagmanager.com/gtm.js?id=GTM-MPM86K5"></script>
	<script async=""
		src="https://www.googletagmanager.com/gtm.js?id=GTM-NTPPL2M"></script>
	<script src="https://millie.co.kr/common/js/tracking.js"></script>
	<script type="text/javascript" id=""
		src="https://wcs.naver.net/wcslog.js"></script>
	<script type="text/javascript" id=""
		src="https://wcs.naver.net/wcslog.js"></script>
	<script type="text/javascript" id="">!function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","863315557137080");fbq("track","PageView");</script>
	<noscript>
		<img height="1" width="1" style="display: none"
			src="https://www.facebook.com/tr?id=863315557137080&amp;ev=PageView&amp;noscript=1">
	</noscript>
	<script type="text/javascript" id=""
		src="//static.criteo.net/js/ld/ld.js"></script>
	<script type="text/javascript" id="" charset="UTF-8"
		src="//t1.daumcdn.net/adfit/static/kp.js"></script>
	<script type="text/javascript" id="">!function(d,e,f,a,b,c){d.twq||(a=d.twq=function(){a.exe?a.exe.apply(a,arguments):a.queue.push(arguments)},a.version="1.1",a.queue=[],b=e.createElement(f),b.async=!0,b.src="//static.ads-twitter.com/uwt.js",c=e.getElementsByTagName(f)[0],c.parentNode.insertBefore(b,c))}(window,document,"script");twq("init","o087e");twq("track","PageView");</script>

	<div id="wp_tg_cts" style="display: none;">
		<script id="wp_tag_script_1669357417489" charset="UTF-8"
			src="https://astg.widerplanet.com/delivery/wpc.php?v=1&amp;ver=4.0&amp;r=1&amp;md=bs&amp;ga=1hjvecr-uskfro-3-1&amp;wp_uid=2-c9bf3b18eb3948657509617f2772763c-s1661407732.232608%7Cwindows_10%7Cedge-t2jfze&amp;ty=Home&amp;ti=52062&amp;hcuid=d5d4cd07616a542891b7ec2d0257b3a24b69856e&amp;device=web&amp;charset=UTF-8&amp;tc=1669357417489&amp;ref=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2FbookDetail%2F179580688%3Freferrer%3Dhome&amp;loc=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2Fpost%2Fwrite"></script>
		<script id="wp_onsite_script" charset="UTF-8"
			src="https://cdn-aitg.widerplanet.com/onsite/onsite.js"></script>
	</div>
	<script type="text/javascript" id="">var UserAgent=navigator.userAgent,widerplanet_device=null!=UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i)||null!=UserAgent.match(/LG|SAMSUNG|Samsung/)?"mobile":"web",wptg_tagscript_vars=wptg_tagscript_vars||[];wptg_tagscript_vars.push(function(){return{wp_hcuid:"undefined",ti:"52062",ty:"Home",device:widerplanet_device}});</script>
	<script type="text/javascript" id=""
		src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>
	<script type="text/javascript" id="" charset="UTF-8"
		src="//t1.daumcdn.net/adfit/static/kp.js"></script>
	<script type="text/javascript" id="">if(!wcs_add)var wcs_add={};wcs_add.wa="s_1b6be27b0956";if(!_nasa)var _nasa={};wcs.inflow();</script>


	<script type="text/javascript" id="">if(!wcs_add)var wcs_add={};wcs_add.wa="s_1b6be27b0956";if(!_nasa)var _nasa={};window.wcs&&(wcs_do(_nasa),console.log("wcs send!",wcs));</script>


	<script type="text/javascript" id="">window.criteo_q=window.criteo_q||[];window.criteo_q.push({event:"setAccount",account:55644},{event:"setSiteType",type:""},{event:"viewHome"});</script>
	<script type="text/javascript" id="">kakaoPixel("4237922289572623356").pageView();</script>

	<script type="text/javascript" id="">kakaoPixel("5057430883487430749").pageView("\ud0dc\uadf8\uac12\uc785\ub825");</script>
	<div id="criteo-tags-div" style="display: none;"></div>
	<div class="ct">
		<div class="ct__content"></div>
	</div>
	<div class="ct">
		<div class="ct__content"></div>
	</div>
	<div class="ct">
		<div class="ct__content"></div>
	</div>
	<div class="ct ct--bottom" style="left: 500.167px; top: 433.719px;">
		<div class="ct__content">
			<div class="ce-toolbox-button-tooltip">책 추가</div>
		</div>
	</div>
</body>
</html>