<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko" class="">

<head>
    <style id="editor-js-styles">
        .codex-editor {
            position: relative;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            z-index: 1
        }

        .codex-editor .hide,
        .codex-editor__redactor--hidden {
            display: none
        }

        .codex-editor__redactor [contenteditable]:empty:after {
            content: "\feff "
        }

        @media (min-width:651px) {
            .codex-editor--narrow .codex-editor__redactor {
                margin-right: 50px
            }
        }

        @media (min-width:651px) {
            .codex-editor--narrow.codex-editor--rtl .codex-editor__redactor {
                margin-left: 50px;
                margin-right: 0
            }
        }

        @media (min-width:651px) {
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

        .codex-editor--toolbox-opened [contentEditable=true][data-placeholder]:focus:before {
            opacity: 0 !important
        }

        @-webkit-keyframes editor-loader-spin {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg)
            }

            to {
                -webkit-transform: rotate(1turn);
                transform: rotate(1turn)
            }
        }

        @keyframes editor-loader-spin {
            0% {
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

        @media (max-width:650px) {
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

        @media (max-width:650px) and (max-width:650px) {
            .ce-toolbar {
                -webkit-box-shadow: 0 13px 7px -5px rgba(26, 38, 49, .09), 6px 15px 34px -6px rgba(33, 48, 73, .29);
                box-shadow: 0 13px 7px -5px rgba(26, 38, 49, .09), 6px 15px 34px -6px rgba(33, 48, 73, .29);
                border-bottom-color: #d5d7db
            }
        }

        @media (max-width:650px) {
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

        @media (max-width:650px) {
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

        @media (max-width:650px) {
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

        .ce-toolbar__plus--active,
        .ce-toolbar__plus:hover {
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

        @media (max-width:650px) {
            .ce-toolbar__plus {
                display: -webkit-inline-box !important;
                display: -ms-inline-flexbox !important;
                display: inline-flex !important;
                position: static;
                -webkit-transform: none !important;
                transform: none !important
            }
        }

        .ce-toolbar .ce-toolbox,
        .ce-toolbar__plus {
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

        @media (max-width:650px) {
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

        @media (max-width:650px) {
            .ce-toolbar__settings-btn {
                background: transparent
            }
        }

        @media (min-width:651px) {
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

        @media (max-width:650px) {
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

        .ce-toolbox__button--active,
        .ce-toolbox__button:hover {
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

        @media (min-width:651px) {
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

        @media (max-width:650px) {
            .ce-inline-toolbar {
                -webkit-box-shadow: 0 13px 7px -5px rgba(26, 38, 49, .09), 6px 15px 34px -6px rgba(33, 48, 73, .29);
                box-shadow: 0 13px 7px -5px rgba(26, 38, 49, .09), 6px 15px 34px -6px rgba(33, 48, 73, .29);
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
            transition: transform .15s ease, opacity .25s ease, -webkit-transform .15s ease;
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

        .ce-inline-tool--link .icon--unlink,
        .ce-inline-tool--unlink .icon--link {
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

        @media (max-width:650px) {
            .ce-conversion-toolbar {
                -webkit-box-shadow: 0 13px 7px -5px rgba(26, 38, 49, .09), 6px 15px 34px -6px rgba(33, 48, 73, .29);
                box-shadow: 0 13px 7px -5px rgba(26, 38, 49, .09), 6px 15px 34px -6px rgba(33, 48, 73, .29);
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
            transition: transform .1s ease, opacity .1s ease, -webkit-transform .1s ease;
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

        @media (max-width:650px) {
            .ce-settings {
                -webkit-box-shadow: 0 13px 7px -5px rgba(26, 38, 49, .09), 6px 15px 34px -6px rgba(33, 48, 73, .29);
                box-shadow: 0 13px 7px -5px rgba(26, 38, 49, .09), 6px 15px 34px -6px rgba(33, 48, 73, .29);
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

        @media (max-width:650px) {
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

        @media (max-width:650px) {
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

        .ce-block--selected .ce-block__content .ce-stub,
        .ce-block--selected .ce-block__content img {
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

        @media (min-width:651px) {
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

        @-webkit-keyframes wobble {
            0% {
                -webkit-transform: translateZ(0);
                transform: translateZ(0)
            }

            15% {
                -webkit-transform: translate3d(-5%, 0, 0) rotate(-5deg);
                transform: translate3d(-5%, 0, 0) rotate(-5deg)
            }

            30% {
                -webkit-transform: translate3d(2%, 0, 0) rotate(3deg);
                transform: translate3d(2%, 0, 0) rotate(3deg)
            }

            45% {
                -webkit-transform: translate3d(-3%, 0, 0) rotate(-3deg);
                transform: translate3d(-3%, 0, 0) rotate(-3deg)
            }

            60% {
                -webkit-transform: translate3d(2%, 0, 0) rotate(2deg);
                transform: translate3d(2%, 0, 0) rotate(2deg)
            }

            75% {
                -webkit-transform: translate3d(-1%, 0, 0) rotate(-1deg);
                transform: translate3d(-1%, 0, 0) rotate(-1deg)
            }

            to {
                -webkit-transform: translateZ(0);
                transform: translateZ(0)
            }
        }

        @keyframes wobble {
            0% {
                -webkit-transform: translateZ(0);
                transform: translateZ(0)
            }

            15% {
                -webkit-transform: translate3d(-5%, 0, 0) rotate(-5deg);
                transform: translate3d(-5%, 0, 0) rotate(-5deg)
            }

            30% {
                -webkit-transform: translate3d(2%, 0, 0) rotate(3deg);
                transform: translate3d(2%, 0, 0) rotate(3deg)
            }

            45% {
                -webkit-transform: translate3d(-3%, 0, 0) rotate(-3deg);
                transform: translate3d(-3%, 0, 0) rotate(-3deg)
            }

            60% {
                -webkit-transform: translate3d(2%, 0, 0) rotate(2deg);
                transform: translate3d(2%, 0, 0) rotate(2deg)
            }

            75% {
                -webkit-transform: translate3d(-1%, 0, 0) rotate(-1deg);
                transform: translate3d(-1%, 0, 0) rotate(-1deg)
            }

            to {
                -webkit-transform: translateZ(0);
                transform: translateZ(0)
            }
        }

        @-webkit-keyframes bounceIn {

            0%,
            20%,
            40%,
            60%,
            80%,
            to {
                -webkit-animation-timing-function: cubic-bezier(.215, .61, .355, 1);
                animation-timing-function: cubic-bezier(.215, .61, .355, 1)
            }

            0% {
                -webkit-transform: scale3d(.9, .9, .9);
                transform: scale3d(.9, .9, .9)
            }

            20% {
                -webkit-transform: scale3d(1.03, 1.03, 1.03);
                transform: scale3d(1.03, 1.03, 1.03)
            }

            60% {
                -webkit-transform: scaleX(1);
                transform: scaleX(1)
            }
        }

        @keyframes bounceIn {

            0%,
            20%,
            40%,
            60%,
            80%,
            to {
                -webkit-animation-timing-function: cubic-bezier(.215, .61, .355, 1);
                animation-timing-function: cubic-bezier(.215, .61, .355, 1)
            }

            0% {
                -webkit-transform: scale3d(.9, .9, .9);
                transform: scale3d(.9, .9, .9)
            }

            20% {
                -webkit-transform: scale3d(1.03, 1.03, 1.03);
                transform: scale3d(1.03, 1.03, 1.03)
            }

            60% {
                -webkit-transform: scaleX(1);
                transform: scaleX(1)
            }
        }

        @-webkit-keyframes selectionBounce {

            0%,
            20%,
            40%,
            60%,
            80%,
            to {
                -webkit-animation-timing-function: cubic-bezier(.215, .61, .355, 1);
                animation-timing-function: cubic-bezier(.215, .61, .355, 1)
            }

            50% {
                -webkit-transform: scale3d(1.01, 1.01, 1.01);
                transform: scale3d(1.01, 1.01, 1.01)
            }

            70% {
                -webkit-transform: scaleX(1);
                transform: scaleX(1)
            }
        }

        @keyframes selectionBounce {

            0%,
            20%,
            40%,
            60%,
            80%,
            to {
                -webkit-animation-timing-function: cubic-bezier(.215, .61, .355, 1);
                animation-timing-function: cubic-bezier(.215, .61, .355, 1)
            }

            50% {
                -webkit-transform: scale3d(1.01, 1.01, 1.01);
                transform: scale3d(1.01, 1.01, 1.01)
            }

            70% {
                -webkit-transform: scaleX(1);
                transform: scaleX(1)
            }
        }

        @-webkit-keyframes buttonClicked {

            0%,
            20%,
            40%,
            60%,
            80%,
            to {
                -webkit-animation-timing-function: cubic-bezier(.215, .61, .355, 1);
                animation-timing-function: cubic-bezier(.215, .61, .355, 1)
            }

            0% {
                -webkit-transform: scale3d(.95, .95, .95);
                transform: scale3d(.95, .95, .95)
            }

            60% {
                -webkit-transform: scale3d(1.02, 1.02, 1.02);
                transform: scale3d(1.02, 1.02, 1.02)
            }

            80% {
                -webkit-transform: scaleX(1);
                transform: scaleX(1)
            }
        }

        @keyframes buttonClicked {

            0%,
            20%,
            40%,
            60%,
            80%,
            to {
                -webkit-animation-timing-function: cubic-bezier(.215, .61, .355, 1);
                animation-timing-function: cubic-bezier(.215, .61, .355, 1)
            }

            0% {
                -webkit-transform: scale3d(.95, .95, .95);
                transform: scale3d(.95, .95, .95)
            }

            60% {
                -webkit-transform: scale3d(1.02, 1.02, 1.02);
                transform: scale3d(1.02, 1.02, 1.02)
            }

            80% {
                -webkit-transform: scaleX(1);
                transform: scaleX(1)
            }
        }

        @-webkit-keyframes panelShowing {
            0% {
                opacity: 0;
                -webkit-transform: translateY(-8px) scale(.9);
                transform: translateY(-8px) scale(.9)
            }

            70% {
                opacity: 1;
                -webkit-transform: translateY(2px);
                transform: translateY(2px)
            }

            to {
                -webkit-transform: translateY(0);
                transform: translateY(0)
            }
        }

        @keyframes panelShowing {
            0% {
                opacity: 0;
                -webkit-transform: translateY(-8px) scale(.9);
                transform: translateY(-8px) scale(.9)
            }

            70% {
                opacity: 1;
                -webkit-transform: translateY(2px);
                transform: translateY(2px)
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

        @-webkit-keyframes cdxRotation {
            0% {
                -webkit-transform: rotate(0deg);
                transform: rotate(0deg)
            }

            to {
                -webkit-transform: rotate(1turn);
                transform: rotate(1turn)
            }
        }

        @keyframes cdxRotation {
            0% {
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

        @media (max-width:650px) {
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

        .codex-editor.codex-editor--rtl .ce-settings__button:not(:nth-child(3n+3)) {
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

        .codex-editor.codex-editor--rtl .ce-inline-toolbar__dropdown .icon--toggler-down {
            margin-left: 0;
            margin-right: 4px
        }

        @media (min-width:651px) {
            .codex-editor--narrow.codex-editor--rtl .ce-toolbar__plus {
                left: 0;
                right: 5px
            }
        }

        @media (min-width:651px) {
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
            -webkit-transition: opacity 50ms ease-in, -webkit-transform 70ms cubic-bezier(.215, .61, .355, 1);
            transition: opacity 50ms ease-in, -webkit-transform 70ms cubic-bezier(.215, .61, .355, 1);
            transition: opacity 50ms ease-in, transform 70ms cubic-bezier(.215, .61, .355, 1);
            transition: opacity 50ms ease-in, transform 70ms cubic-bezier(.215, .61, .355, 1), -webkit-transform 70ms cubic-bezier(.215, .61, .355, 1);
            will-change: opacity, top, left;
            -webkit-box-shadow: 0 8px 12px 0 rgba(29, 32, 43, .17), 0 4px 5px -3px rgba(5, 6, 12, .49);
            box-shadow: 0 8px 12px 0 rgba(29, 32, 43, .17), 0 4px 5px -3px rgba(5, 6, 12, .49);
            border-radius: 9px
        }

        .ct,
        .ct:before {
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

        @supports(-webkit-mask-box-image:url("")) {
            .ct:before {
                border-radius: 0;
                -webkit-mask-box-image: url('data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"><path d="M10.71 0h2.58c3.02 0 4.64.42 6.1 1.2a8.18 8.18 0 013.4 3.4C23.6 6.07 24 7.7 24 10.71v2.58c0 3.02-.42 4.64-1.2 6.1a8.18 8.18 0 01-3.4 3.4c-1.47.8-3.1 1.21-6.11 1.21H10.7c-3.02 0-4.64-.42-6.1-1.2a8.18 8.18 0 01-3.4-3.4C.4 17.93 0 16.3 0 13.29V10.7c0-3.02.42-4.64 1.2-6.1a8.18 8.18 0 013.4-3.4C6.07.4 7.7 0 10.71 0z"/></svg>') 48% 41% 37.9% 53.3%
            }
        }

        @media (--mobile) {
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
    <!-- /v3/post/598825?nav_hidden=y -->


    <link rel="apple-touch-icon" href="https://www.millie.co.kr/favicon/ios-icon.png">
    <link rel="apple-touch-icon-precomposed" href="https://www.millie.co.kr/favicon/ios-icon.png">
    <link rel="shortcut icon" type="image/png" href="https://www.millie.co.kr/favicon/android-icon.png">
    <title>트렌드코리아 2023 | 밀리의 서재</title>
    <link href="https://d3udu241ivsax2.cloudfront.net/v3/style/vendor.524cdf1d4325d722f545.css" rel="stylesheet">
    <link href="https://d3udu241ivsax2.cloudfront.net/v3/style/millie.4a1320ab272ffa081fae.css" rel="stylesheet">
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

        .vue-slider-ltr .vue-slider-mark,
        .vue-slider-rtl .vue-slider-mark {
            width: 0;
            height: 100%;
            top: 50%
        }

        .vue-slider-ltr .vue-slider-mark-step,
        .vue-slider-rtl .vue-slider-mark-step {
            top: 0
        }

        .vue-slider-ltr .vue-slider-mark-label,
        .vue-slider-rtl .vue-slider-mark-label {
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

        .vue-slider-btt .vue-slider-mark,
        .vue-slider-ttb .vue-slider-mark {
            width: 100%;
            height: 0;
            left: 50%
        }

        .vue-slider-btt .vue-slider-mark-step,
        .vue-slider-ttb .vue-slider-mark-step {
            left: 0
        }

        .vue-slider-btt .vue-slider-mark-label,
        .vue-slider-ttb .vue-slider-mark-label {
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

        .vue-slider-mark-label,
        .vue-slider-mark-step {
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
    <script async="true" type="text/javascript"
        src="https://sslwidget.criteo.com/event?a=55644&amp;v=5.12.3&amp;p0=e%3Dexd%26site_type%3Dd&amp;p1=e%3Dvh&amp;p2=e%3Ddis&amp;adce=1&amp;bundle=vwjfTV9KUHVoQ0ZibFRxck5mTEx2M3plNWx4NzElMkJGVGV1SXMxZE5PRHR0aUZrNkF5N0dPS0Z2eHljTWs4R3E4dXFEYTZ3YnVMb2JGYUdKbVY1Y0x0WHk5cDZlRzFhNmFQeDRUTW0yd3lqOE9tJTJGQXdCN2FLR01zR0pYVVNjYTV4eHVYbmQ2cklBdTdNaHljQ0tsTmRMeUZXVVFnJTNEJTNE&amp;tld=millie.co.kr&amp;fu=https%253A%252F%252Fwww.millie.co.kr%252Fv3%252Fpost%252F598825%253Fnav_hidden%253Dy&amp;pu=https%253A%252F%252Fwww.millie.co.kr%252Fv3%252FbookDetail%252F179580688%253Freferrer%253Dhome&amp;dtycbr=83485"
        data-owner="criteo-tag"></script>
    <script async="" src="//static.ads-twitter.com/uwt.js"></script>
    <script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script>
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
    <script type="text/javascript" async=""
        src="https://www.googletagmanager.com/gtag/js?id=G-3WR64L2XW1&amp;l=dataLayer&amp;cx=c"></script>
    <script type="text/javascript" async=""
        src="https://www.googletagmanager.com/gtag/js?id=UA-92156018-1&amp;l=dataLayer&amp;cx=c"></script>
    <script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-92156018-1" rel="preconnect" charset="utf-8">
    </script>
    <link rel="preload" href="https://d3udu241ivsax2.cloudfront.net/common/mds/fonts/mds-icon-v3.woff2" as="font"
        type="font/woff2" crossorigin="crossorigin">
    <link rel="preload" href="https://d3udu241ivsax2.cloudfront.net/common/mds/fonts/SpoqaHanSansNeo-Regular.woff2"
        as="font" type="font/woff2" crossorigin="crossorigin">
    <link rel="preload" href="https://d3udu241ivsax2.cloudfront.net/common/mds/fonts/SpoqaHanSansNeo-Bold.woff2"
        as="font" type="font/woff2" crossorigin="crossorigin">
    <link rel="preload" href="https://d3udu241ivsax2.cloudfront.net/common/mds/fonts/NotoSerifKR-Black.woff2" as="font"
        type="font/woff2" crossorigin="crossorigin">
    <meta http-equiv="origin-trial"
        content="A751Xsk4ZW3DVQ8WZng2Dk5s3YzAyqncTzgv+VaE6wavgTY0QHkDvUTET1o7HanhuJO8lgv1Vvc88Ij78W1FIAAAAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjgwNjUyNzk5LCJpc1RoaXJkUGFydHkiOnRydWV9">
    <script type="text/javascript" async=""
        src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/771298710/?random=1669630763743&amp;cv=11&amp;fst=1669630763743&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2wgb90&amp;u_w=1707&amp;u_h=1067&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2Fpost%2F598825%3Fnav_hidden%3Dy&amp;ref=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2FbookDetail%2F179580688%3Freferrer%3Dhome&amp;tiba=%EB%B0%80%EB%A6%AC%EC%9D%98%20%EC%84%9C%EC%9E%AC&amp;auid=492487846.1665120667&amp;uaa=x86&amp;uab=64&amp;uafvl=Microsoft%2520Edge%3B107.0.1418.56%7CChromium%3B107.0.5304.110%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;rfmt=3&amp;fmt=4">
    </script>
    <script type="text/javascript" async=""
        src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/715358239/?random=1669630763744&amp;cv=11&amp;fst=1669630763744&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2wgb90&amp;u_w=1707&amp;u_h=1067&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2Fpost%2F598825%3Fnav_hidden%3Dy&amp;ref=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2FbookDetail%2F179580688%3Freferrer%3Dhome&amp;tiba=%EB%B0%80%EB%A6%AC%EC%9D%98%20%EC%84%9C%EC%9E%AC&amp;auid=492487846.1665120667&amp;uaa=x86&amp;uab=64&amp;uafvl=Microsoft%2520Edge%3B107.0.1418.56%7CChromium%3B107.0.5304.110%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;rfmt=3&amp;fmt=4">
    </script>
    <script type="text/javascript" async=""
        src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/715358239/?random=1669630763745&amp;cv=11&amp;fst=1669630763745&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2wgb90&amp;u_w=1707&amp;u_h=1067&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2Fpost%2F598825%3Fnav_hidden%3Dy&amp;ref=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2FbookDetail%2F179580688%3Freferrer%3Dhome&amp;tiba=%EB%B0%80%EB%A6%AC%EC%9D%98%20%EC%84%9C%EC%9E%AC&amp;auid=492487846.1665120667&amp;uaa=x86&amp;uab=64&amp;uafvl=Microsoft%2520Edge%3B107.0.1418.56%7CChromium%3B107.0.5304.110%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;rfmt=3&amp;fmt=4">
    </script>
    <meta http-equiv="origin-trial"
        content="A9+ldib+sKhGj2FcIjq5GnvBZFuIiXID0+NkE6k7cEk71MhaHFGqo3wUlUFmZ6d9w0KPwx9UxGiCTYWtRnTGDQkAAACAeyJvcmlnaW4iOiJodHRwczovL2NyaXRlby5uZXQ6NDQzIiwiZmVhdHVyZSI6IlByaXZhY3lTYW5kYm94QWRzQVBJcyIsImV4cGlyeSI6MTY4MDY1Mjc5OSwiaXNTdWJkb21haW4iOnRydWUsImlzVGhpcmRQYXJ0eSI6dHJ1ZX0=">
    <meta http-equiv="origin-trial"
        content="AzLNuh8GFzfIOcwvhEg7Ymr7YCzlYVTKeD7i2iETABbRf+sL2FAx+r+HlTtxSi1zgUFxBlJVoxgLjuhqiwTjAw4AAACAeyJvcmlnaW4iOiJodHRwczovL2NyaXRlby5jb206NDQzIiwiZmVhdHVyZSI6IlByaXZhY3lTYW5kYm94QWRzQVBJcyIsImV4cGlyeSI6MTY4MDY1Mjc5OSwiaXNTdWJkb21haW4iOnRydWUsImlzVGhpcmRQYXJ0eSI6dHJ1ZX0=">
    <meta http-equiv="origin-trial"
        content="A0KGawWMfAygakxUO+Z3rulPwK2j0AqkLneiEt4pAI951GYaafeHNV9Ya+PAn7s0y12QSrfTjc9LdOUU+QfkdQwAAACAeyJvcmlnaW4iOiJodHRwczovL2NyaXRlby5jb206NDQzIiwiZmVhdHVyZSI6IlByaXZhY3lTYW5kYm94QWRzQVBJcyIsImV4cGlyeSI6MTY2OTc2NjM5OSwiaXNTdWJkb21haW4iOnRydWUsImlzVGhpcmRQYXJ0eSI6dHJ1ZX0=">
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/styles~b2b~post.34bf510f66b4cbe50dcb.css">
    <script charset="utf-8" src="https://d3udu241ivsax2.cloudfront.net/v3/js/styles~b2b~post.553e14cafc16e88dc99b.js">
    </script>
    <script charset="utf-8" src="https://d3udu241ivsax2.cloudfront.net/v3/js/b2b~post.3c41464196d71ea4ad2a.js"></script>
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/post.777bb9ac8c585d9e2375.css">
    <script charset="utf-8" src="https://d3udu241ivsax2.cloudfront.net/v3/js/post.15a2ea08a64ec91391a9.js"></script>
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

        .cdx-notify__cross::after,
        .cdx-notify__cross::before {
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
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif
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

        @keyframes bounceIn {
            0% {
                opacity: 0;
                transform: scale(.3)
            }

            50% {
                opacity: 1;
                transform: scale(1.05)
            }

            70% {
                transform: scale(.9)
            }

            100% {
                transform: scale(1)
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
        .codex-editor--empty .ce-block:first-child .ce-paragraph[data-placeholder]:empty::before {
            opacity: 1;
        }

        .codex-editor--toolbox-opened .ce-block:first-child .ce-paragraph[data-placeholder]:empty::before,
        .codex-editor--empty .ce-block:first-child .ce-paragraph[data-placeholder]:empty:focus::before {
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

        .embed-tool__caption[contentEditable=true][data-placeholder]:empty::before {
            opacity: 1;
        }

        .embed-tool__caption[contentEditable=true][data-placeholder]:empty:focus::before {
            opacity: 0;
        }

        @keyframes embed-preloader-spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
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
            <div data-v-474ad036="" data-v-c1337ae8="" class="view">
     
                <div data-v-474ad036="" class="view-expand">
                    <div data-v-474ad036="" class="title">
                        <div data-v-474ad036="" class="title-inner container">
                            <h1 data-v-474ad036="" id="blog_title" name="blog_title">${requestScope.blog.blog_title}</h1> 
                                <div data-v-474ad036="" class="writer-info">
                                    <p data-v-474ad036="" class="name" id="id">${requestScope.blog.id}</p>
                                    <p data-v-474ad036="" class="date" id="blog_date"> ･ ${requestScope.blog.blog_date}</p>
                                </div>
                        </div>
                    </div>
                    <div data-v-474ad036="" class="detail" style="--loader-top:210px;">
                        <div data-v-474ad036="" class="detail-inner container">
                            <div data-v-474ad036="" class="editor-holder">
                                <div id="editorjs" class="read-only">
                                    <div class="codex-editor">
                                        <div class="codex-editor__redactor" style="padding-bottom: 300px;">
                                            <div class="ce-block">
                                                <div class="ce-tune-alignment--left">
                                                    <div class="ce-block__content">
                                                        ${requestScope.blog.blog_content}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
              
                <div data-v-35475912="" data-v-474ad036="" class="comment">
                    <div data-v-35475912="" class="comment-inner container">
                        <h3 data-v-35475912="" class="comment-title">댓글 <span data-v-35475912=""
                                class="comment-title-length">0</span></h3>
                        <ul data-v-35475912="" class="comment-list"></ul>
                        <div data-v-35475912="" class="register flex-container">
                            <div data-v-35475912="" class="user-img"
                                style="margin-right: 0px; background-image: url(&quot;https://ofbxchnhqinp910256.cdn.ntruss.com/160/e5e634f89bd1050c99a5b84cc95caa64.png?type=w&amp;w=160&amp;quality=100&quot;);">
                            </div>
                            <div data-v-35475912="" class="register-box">
                                <div data-v-35475912="" class="register-box-inner"><span data-v-35475912="">댓글</span>
                                    <p data-v-35475912="" contenteditable="plaintext-only" data-placeholder="내용 입력"></p>
                                </div>
                            </div> <button data-v-35475912="" type="button"
                                class="post-btn flex-container mds-button mds-button--secondary mds-button--flex mds-button--h56 mds-button--r4"><span>등록</span></button>
                        </div>
                    </div>
                   
                </div>
             
            </div>
        </section>
     
    </div>
   
    <script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-MPM86K5"></script>
    <script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-NTPPL2M"></script>
    <script src="https://millie.co.kr/common/js/tracking.js"></script>
    <script type="text/javascript" id="" src="https://wcs.naver.net/wcslog.js"></script>
    <script type="text/javascript" id="" src="https://wcs.naver.net/wcslog.js"></script>
    <script type="text/javascript" id="">
        ! function (b, e, f, g, a, c, d) {
            b.fbq || (a = b.fbq = function () {
                    a.callMethod ? a.callMethod.apply(a, arguments) : a.queue.push(arguments)
                }, b._fbq || (b._fbq = a), a.push = a, a.loaded = !0, a.version = "2.0", a.queue = [], c = e
                .createElement(f), c.async = !0, c.src = g, d = e.getElementsByTagName(f)[0], d.parentNode
                .insertBefore(c, d))
        }(window, document, "script", "https://connect.facebook.net/en_US/fbevents.js");
        fbq("init", "863315557137080");
        fbq("track", "PageView");
    </script>
    <noscript><img height="1" width="1" style="display:none"
            src="https://www.facebook.com/tr?id=863315557137080&amp;ev=PageView&amp;noscript=1"></noscript>
    <script type="text/javascript" id="" src="//static.criteo.net/js/ld/ld.js"></script>
    <script type="text/javascript" id="" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
    <script type="text/javascript" id="">
        ! function (d, e, f, a, b, c) {
            d.twq || (a = d.twq = function () {
                    a.exe ? a.exe.apply(a, arguments) : a.queue.push(arguments)
                }, a.version = "1.1", a.queue = [], b = e.createElement(f), b.async = !0, b.src =
                "//static.ads-twitter.com/uwt.js", c = e.getElementsByTagName(f)[0], c.parentNode.insertBefore(b, c)
                )
        }(window, document, "script");
        twq("init", "o087e");
        twq("track", "PageView");
    </script>

    <div id="wp_tg_cts" style="display:none;">
        <script id="wp_tag_script_1669630763767" charset="UTF-8"
            src="https://astg.widerplanet.com/delivery/wpc.php?v=1&amp;ver=4.0&amp;r=1&amp;md=bs&amp;ga=1hjvecr-uskfro-3-1&amp;wp_uid=2-c9bf3b18eb3948657509617f2772763c-s1661407732.232608%7Cwindows_10%7Cedge-t2jfze&amp;ty=Home&amp;ti=52062&amp;hcuid=d5d4cd07616a542891b7ec2d0257b3a24b69856e&amp;device=web&amp;charset=UTF-8&amp;tc=1669630763767&amp;ref=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2FbookDetail%2F179580688%3Freferrer%3Dhome&amp;loc=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2Fpost%2F598825%3Fnav_hidden%3Dy">
        </script>
        <script id="wp_onsite_script" charset="UTF-8" src="https://cdn-aitg.widerplanet.com/onsite/onsite.js"></script>
    </div>
    <script type="text/javascript" id="">
        var UserAgent = navigator.userAgent,
            widerplanet_device = null != UserAgent.match(
                /iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i
                ) || null != UserAgent.match(/LG|SAMSUNG|Samsung/) ? "mobile" : "web",
            wptg_tagscript_vars = wptg_tagscript_vars || [];
        wptg_tagscript_vars.push(function () {
            return {
                wp_hcuid: "undefined",
                ti: "52062",
                ty: "Home",
                device: widerplanet_device
            }
        });
    </script>
    <script type="text/javascript" id="" src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>
    <script type="text/javascript" id="" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
    <script type="text/javascript" id="">
        if (!wcs_add) var wcs_add = {};
        wcs_add.wa = "s_1b6be27b0956";
        if (!_nasa) var _nasa = {};
        wcs.inflow();
    </script>


    <script type="text/javascript" id="">
        if (!wcs_add) var wcs_add = {};
        wcs_add.wa = "s_1b6be27b0956";
        if (!_nasa) var _nasa = {};
        window.wcs && (wcs_do(_nasa), console.log("wcs send!", wcs));
    </script>


    <script type="text/javascript" id="">
        window.criteo_q = window.criteo_q || [];
        window.criteo_q.push({
            event: "setAccount",
            account: 55644
        }, {
            event: "setSiteType",
            type: ""
        }, {
            event: "viewHome"
        });
    </script>
    <script type="text/javascript" id="">
        kakaoPixel("4237922289572623356").pageView();
    </script>

    <script type="text/javascript" id="">
        kakaoPixel("5057430883487430749").pageView("\ud0dc\uadf8\uac12\uc785\ub825");
    </script>
    <div id="criteo-tags-div" style="display: none;"><iframe
            src="https://gum.criteo.com/syncframe?topUrl=www.millie.co.kr&amp;origin=onetag#{&quot;bundle&quot;:{&quot;origin&quot;:3,&quot;value&quot;:&quot;vwjfTV9KUHVoQ0ZibFRxck5mTEx2M3plNWx4NzElMkJGVGV1SXMxZE5PRHR0aUZrNkF5N0dPS0Z2eHljTWs4R3E4dXFEYTZ3YnVMb2JGYUdKbVY1Y0x0WHk5cDZlRzFhNmFQeDRUTW0yd3lqOE9tJTJGQXdCN2FLR01zR0pYVVNjYTV4eHVYbmQ2cklBdTdNaHljQ0tsTmRMeUZXVVFnJTNEJTNE&quot;},&quot;cw&quot;:true,&quot;optout&quot;:{&quot;origin&quot;:0,&quot;value&quot;:null},&quot;origin&quot;:&quot;onetag&quot;,&quot;pm&quot;:0,&quot;sid&quot;:{&quot;origin&quot;:0,&quot;value&quot;:null},&quot;tld&quot;:&quot;millie.co.kr&quot;,&quot;topUrl&quot;:&quot;www.millie.co.kr&quot;,&quot;version&quot;:&quot;5_12_3&quot;,&quot;ifa&quot;:{&quot;origin&quot;:0,&quot;value&quot;:null},&quot;lsw&quot;:true}"
            id="criteo-syncframe-onetag" width="0" height="0" frameborder="0"
            style="border-width:0px; margin:0px; display:none" title="Criteo GUM iframe"></iframe></div>
    <div class="ct">
        <div class="ct__content"></div>
    </div>
</body>

</html>