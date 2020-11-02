Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF2D2A2D60
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Nov 2020 15:51:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbgKBOvD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Nov 2020 09:51:03 -0500
Received: from codesynthesis.com ([142.44.161.217]:46182 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbgKBOvA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Nov 2020 09:51:00 -0500
Received: from brak.codesynthesis.com (unknown [105.184.207.60])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id F14535F1DE;
        Mon,  2 Nov 2020 14:50:58 +0000 (UTC)
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 61B461A800C4; Mon,  2 Nov 2020 16:50:49 +0200 (SAST)
Date:   Mon, 2 Nov 2020 16:50:49 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: kconfig: qconf: SIGSEGV when clicking outside edit area
Message-ID: <boris.20201102164007@codesynthesis.com>
References: <boris.20201029163302@codesynthesis.com>
 <CAK7LNAQ6-MNVJ-n63cqrwn89xYaRnAnbgV46ExgqS-VghYaTdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
In-Reply-To: <CAK7LNAQ6-MNVJ-n63cqrwn89xYaRnAnbgV46ExgqS-VghYaTdQ@mail.gmail.com>
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Masahiro Yamada <masahiroy@kernel.org> writes:

> I cannot reproduce this problem.
> 
> 
> For example,
> 
> I visited "General setup" -> "Default hostname".
> 
> I double-clicked "(none)", then the edit box was activated.
> 
> I clicked outside of the edit box, and the edit box got deactivated.
> I saw no problem.

Yes, I just tried that and I cannot reproduce it this way either. No
can I reproduce it with a minimal example with just one int option.
The attached Kconfig (from a "Hello, World" example I am writing),
however, reproduces it for me reliably:

$ rm .config
$ ENABLE_FANCY=y .../qconf Kconfig

Then, in the "Fancy options" select "Name fallback" and inside double
click on "Max times to ask for name" to activate the edit box. After
that, clicking anywhere outside of this edit box causes a SIGSEGV for
me. Can you try that?

--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=Kconfig

menu "Basic options"

config IO
        bool "IO support"
        default y
        help
          Enable stdin/stdout input/output. Note that if this option is
          disabled, then you won't see any output.

comment "IO disabled, no output will be shown"
        depends on !IO

config PUNCT
        string "End of greeting punctuation"
        default "!"
        help
          Character for punctuating the end of the greeting sentence.

endmenu


menuconfig FANCY
        bool "Fancy options"
        default y
        depends on $(ENABLE_FANCY)
        help
          Enable more fancy configuration options.

if FANCY

# GREETING_*
#
choice
        prompt "Greeting"
        default GREETING_HELLO
        help
          String to use as a greeting.

config GREETING_HELLO
        bool "\"Hello\""
        select GREETING_BUILTIN

config GREETING_HI
        bool "\"Hi\""
        select GREETING_BUILTIN

config GREETING_HOWDY
        bool "\"Howdy\""
        select GREETING_BUILTIN

config GREETING_CUSTOM
        bool "Custom greeting"

endchoice

config GREETING_BUILTIN
        bool

comment "Using builtin greeting string"
        depends on GREETING_BUILTIN

config GREETING_TEXT
        string "Custom greeting" if GREETING_CUSTOM
        default "Hello" if GREETING_HELLO
        default "Hi"    if GREETING_HI
        default "Howdy" if GREETING_HOWDY
        help
          Custom string to use as a greeting.

# NAME_*
#
choice NAME_FALLBACK
       bool "Name fallback"
       optional
       help
         Fallback name to use if it is unspecified on the command line.

config NAME_ASK
        bool "Ask for name"
        depends on IO
        help
          Ask for the name to greet if it is unspecified on the command line.

config NAME_DEF
        bool "Use default name"
        help
          Use the default name to greet if it is unspecified on the command
          line.

endchoice

config NAME_ASK_MAX
        int "Max times to ask for name"
        default 5
        range 1 10
        depends on NAME_ASK
        help
          Maximum number of times to ask for the name to greet.

endif # menuconfig FANCY

--5vNYLRcllDrimb99--
