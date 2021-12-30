Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59D51481F31
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Dec 2021 19:31:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241701AbhL3Sbk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Dec 2021 13:31:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233228AbhL3Sbk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Dec 2021 13:31:40 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2DA6C061574
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Dec 2021 10:31:39 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id m19so57013277ybf.9
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Dec 2021 10:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JP5kiPGw0N0oi5xSZm+ISguC0oX5vc7WiKHH8sRb6Bk=;
        b=PDOo4NGA+JWALhHknpcOO+4JAgLgYO13CeQB3gQa/gjVoUYjKJ6o09cp7s2qABTIXt
         kmo2zbQjSCl93GSBoQQvgqrZZjVONwg1DqnMmlcUFrcyhy1s+Zssb4zOhmWrc9y0HqSp
         HSwJViWXz1iaunrmIdbPOBKG1UCeQCUFTJfb1YCp4UoTzx/aDSqJ90c/JQHbbPW2+pB6
         /01tAa36sPtmfeo+OaWiC8vLE/xkj1F2G5V5eXZLkKKJL2nx+cyu4eWdl5JflDddcc5Z
         ChXHcbHulpVmYI55zRdTNEhYVrGPy4EgZLgEPgli0o2fgCU+eT5h6BPQFtfut1eLkloD
         B2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JP5kiPGw0N0oi5xSZm+ISguC0oX5vc7WiKHH8sRb6Bk=;
        b=5fRBEaaoKu3bg+GIL2E6lDphwNzXQQyf1myvIS/titQrqRgCqRGSyue1LpRqNb7BLB
         4KkogCKvQPFBFy10Cm6wFVoAbFLltGRN+84xsB4AQ3UEzbcijBxNl9elawhTf/gQ+NwX
         pkzRlHXk2oLwscCqraEDMpfmcu5SsXDiisr4GBfgjWDEiFietWj9NLcYxGtQ6DbjYmN+
         3fyK6A6BYcjNQdsos5MH4WwCxJdS+xoO5sePXzidFSlIM0cQ76t4GAEveys9arKlsuZ6
         Jp4eozbo6ir9wTsV0W5407ZSCscLK9BCWL3meigbD18A1G0QpmNS4jo6R6pcCVjoB7VG
         dyRw==
X-Gm-Message-State: AOAM532lAq7dR9aOyhz3Y23TPMI+SEiKjB6IrClmHovmGaza0IWG1XNm
        m5jw8vUWZ6Ct4Knt7gWBj1f5byT8usenwK8dblax8Q==
X-Google-Smtp-Source: ABdhPJy1mifAcHASiq5T0VrQGF0UUuFWmc9T30vsJuNoN6G21ys/G/ibBLAo4HPnkKhC2ktRgJEaxHdror0bkuziioM=
X-Received: by 2002:a25:98c4:: with SMTP id m4mr39483356ybo.613.1640889098887;
 Thu, 30 Dec 2021 10:31:38 -0800 (PST)
MIME-Version: 1.0
References: <20211223002209.1092165-1-alexandr.lobakin@intel.com>
 <20211223002209.1092165-3-alexandr.lobakin@intel.com> <Yc2Tqc69W9ukKDI1@zn.tnic>
In-Reply-To: <Yc2Tqc69W9ukKDI1@zn.tnic>
From:   =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date:   Thu, 30 Dec 2021 10:31:27 -0800
Message-ID: <CAFP8O3K1mkiCGMTEeuSifZtr2piHsKTjP5TOA25nqpv2SrbzYQ@mail.gmail.com>
Subject: Re: [PATCH v9 02/15] livepatch: use `-z unique-symbol` if available
 to nuke pos-based search
To:     Alexander Lobakin <alexandr.lobakin@intel.com>
Cc:     Borislav Petkov <bp@alien8.de>, linux-hardening@vger.kernel.org,
        x86@kernel.org, Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Kristen Carlson Accardi <kristen@linux.intel.com>,
        Kees Cook <keescook@chromium.org>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Ard Biesheuvel <ardb@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        Bruce Schlobohm <bruce.schlobohm@intel.com>,
        Jessica Yu <jeyu@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Miroslav Benes <mbenes@suse.cz>,
        Evgenii Shatokhin <eshatokhin@virtuozzo.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Marios Pomonis <pomonis@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Nicolas Pitre <nico@fluxnic.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arch@vger.kernel.org, live-patching@vger.kernel.org,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 30, 2021 at 3:11 AM Borislav Petkov <bp@alien8.de> wrote:
>
> On Thu, Dec 23, 2021 at 01:21:56AM +0100, Alexander Lobakin wrote:
> > [PATCH v9 02/15] livepatch: use `-z unique-symbol` if available to nuke pos-based search
>
> nuke?
>
> I think you wanna say something about avoiding position-based search if
> toolchain supports -z ...
>
> > Position-based search, which means that if we have several symbols
> > with the same name, we additionally need to provide an "index" of
> > the desired symbol, is fragile. Par exemple, it breaks when two
>                                   ^^^^^^^^^^^^
>
> We already have hard time with the English in commit messages, let's
> avoid the French pls.
>
> > symbols with the same name are located in different sections.
> >
> > Since a while, LD has a flag `-z unique-symbol` which appends
> > numeric suffixes to the functions with the same name (in symtab
> > and strtab).
> > Check for its availability and always prefer when the livepatching
> > is on.
>
> Why only then?
>
> It looks to me like we want this unconditionally, no?
>
> > This needs a little adjustment to the modpost to make it
> > strip suffixes before adding exports.
> >
> > depmod needs some treatment as well, tho its false-positibe warnings
>
> Unknown word [false-positibe] in commit message, suggestions:
>         ['false-positive', 'false-positioned', 'prepositional']
>
> Please introduce a spellchecker into your patch creation workflow.
>
> > about unknown symbols are harmless and don't alter the return code.
> > And there is a bunch more livepatch code to optimize-out after
> > introducing this, but let's leave it for later.
>
> ...
>
> > @@ -171,17 +173,21 @@ static int klp_find_object_symbol(const char *objname, const char *name,
> >
> >       /*
> >        * Ensure an address was found. If sympos is 0, ensure symbol is unique;
> > -      * otherwise ensure the symbol position count matches sympos.
> > +      * otherwise ensure the symbol position count matches sympos. If the LD
> > +      * `-z unique` flag is enabled, sympos checks are not relevant.
>            ^^^^^^^^^^^
>
> -z unique-symbol
>
> >        */
> > -     if (args.addr == 0)
> > +     if (args.addr == 0) {
> >               pr_err("symbol '%s' not found in symbol table\n", name);
> > -     else if (args.count > 1 && sympos == 0) {
> > +     } else if (IS_ENABLED(CONFIG_LD_HAS_Z_UNIQUE_SYMBOL)) {
> > +             goto out_ok;
>
> This is silly - just do it all here.
>
> > +     } else if (args.count > 1 && sympos == 0) {
> >               pr_err("unresolvable ambiguity for symbol '%s' in object '%s'\n",
> >                      name, objname);
> >       } else if (sympos != args.count && sympos > 0) {
> >               pr_err("symbol position %lu for symbol '%s' in object '%s' not found\n",
> >                      sympos, name, objname ? objname : "vmlinux");
> >       } else {
> > +out_ok:
> >               *addr = args.addr;
> >               return 0;
> >       }
>
> Looks straight-forward otherwise but I'm no livepatcher so I'd prefer if
> they have a look too.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
>

Apologies since I haven't read the patch series.

The option does not exist in ld.lld and I am a bit concerning about
its semantics: https://maskray.me/blog/2020-11-15-explain-gnu-linker-options#z-unique-symbol

I thought that someone forwarded my comments (originally posted months
on a feature request ago) here but seems not.
(I am a ld.lld maintainer.)
