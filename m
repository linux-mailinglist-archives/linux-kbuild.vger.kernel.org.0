Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21FFD2CE298
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Dec 2020 00:23:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727692AbgLCXXH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Dec 2020 18:23:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727223AbgLCXXH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Dec 2020 18:23:07 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE264C061A52
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Dec 2020 15:22:26 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id n7so2378292pgg.2
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Dec 2020 15:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S2evVpZUx4sUY7dWUP7rv8pY8q8EVmsWGDPP1XnlIFk=;
        b=WXnuoy84v9PFoh0yGywWUCdQtzX/ZN11G5fmsPPcyfgwYUVDhtfFmSY2dF81SliPjo
         bGT2Og1S58EhP/WctvWmW32jBosDdo15bXBZJJiLqUQldLXgdhmAHrkmEzcUdaQLrV/D
         Hz62BG50vOqBLptXseMWP+t3YltwmaAnYLeY6t2NEc/PZR3RMLZyFIlGPkQ9NNj8Z4UI
         m7auC5CxI3a+dxWFl0NLDGy3Du6wUoKzCEqBOwSiJvtYUdfsmqAd0XyLA8y9EovstVK4
         UVCasyFJa2CyPrl2BhjfzyfS1QcHqDAQWsZ6kUBdo08n9iZckpe1jlYbBLFDtUrpr+P2
         gGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S2evVpZUx4sUY7dWUP7rv8pY8q8EVmsWGDPP1XnlIFk=;
        b=HG8LydwbVsT5CkqWfbXIJK5TzigBrAcfskXuGsYoleAQOn1s343JShYH8g0efPh6cZ
         infjtbgfOvDhm4cI510Bxw2Mn2qqbAZ722ohCPQmgAzzF+nMbWgVV33wh97hb2aeKz8J
         ZGY5o5MHGPWRDTPGfpgTs+KjJcvrJDyrW5lUAFMcC7NOrE0KJuKeu0/EzNfdPPxct9e1
         kd9njbT6NoVDrE/G/Dqws4W56sMPe5HQ0IspNwR52rye42+jh5DNMSnPp6nm14Oi4aEs
         cMxke1UuXu2OgFFiZo+Bo/9QCtQOYSblOr9RsC4PuGP9/akm7S80Leqbt1VJef5m/S29
         LgNg==
X-Gm-Message-State: AOAM530igpA34NIvz01VSB74w6R5p14C4v2lJoQttSYDTJWtOehnQ+6h
        yHKFwIvCa/++I6gcDWFfvFCA6YjDtWoXgvW8rQKyXg==
X-Google-Smtp-Source: ABdhPJxjep3/3XGS8n/G3RXpwHMXIYzITsiAcNksBxCoP4xDH3vwycQLjF+qzMdX0EbBWQ9VwQ6iTP8PbGcXwG2WcRQ=
X-Received: by 2002:a63:8f4f:: with SMTP id r15mr5060126pgn.381.1607037746077;
 Thu, 03 Dec 2020 15:22:26 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
 <20201104005343.4192504-1-ndesaulniers@google.com> <20201104005343.4192504-5-ndesaulniers@google.com>
 <20201124172836.GA346213@rani.riverdale.lan>
In-Reply-To: <20201124172836.GA346213@rani.riverdale.lan>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 3 Dec 2020 15:22:14 -0800
Message-ID: <CAKwvOdkGvLrPr4pHi4LKCF5t74+wencdy7r38d3k_4pC9pQYwQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] Kbuild: implement support for DWARF v5
To:     Arvind Sankar <nivedita@alum.mit.edu>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Jakub Jelinek <jakub@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-toolchains@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Dmitry Golovin <dima@golovin.in>,
        Alistair Delva <adelva@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 24, 2020 at 9:28 AM Arvind Sankar <nivedita@alum.mit.edu> wrote:
>
> On Tue, Nov 03, 2020 at 04:53:43PM -0800, Nick Desaulniers wrote:
> > DWARF v5 is the latest standard of the DWARF debug info format.
> >
> > Feature detection of DWARF5 is onerous, especially given that we've
> > removed $(AS), so we must query $(CC) for DWARF5 assembler directive
> > support.  GNU `as` only recently gained support for specifying
> > -gdwarf-5.
>
> With gcc, using -gdwarf-5 even without -Wa,--gdwarf-5 results in
> considerably smaller debug info. gcc does not seem to generate the .file 0
> directive that causes older GNU as to barf.
>
> Should the assembler support check be restricted to CC_IS_CLANG?

No, because if LLVM_IAS=1 then the assembler support need not be checked.

>
> >  /* Stabs debugging sections. */
> >  #define STABS_DEBUG                                                  \
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 03c494eefabd..c5b54ba51060 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -274,6 +274,14 @@ config DEBUG_INFO_DWARF4
> >         It makes the debug information larger, but it significantly
> >         improves the success of resolving variables in gdb on optimized code.
> >
> > +config DEBUG_INFO_DWARF5
> > +     bool "Generate DWARF5 debuginfo"
> > +     depends on $(cc-option,-gdwarf-5)
> > +     depends on $(success,$(srctree)/scripts/test_dwarf5_support.sh $(CC) $(CLANG_FLAGS))
> > +     help
> > +       Genereate dwarf5 debug info. Requires binutils 2.35+, gcc 5.1+, and
> > +       gdb 8.0+.
> > +
> >  endchoice # "DWARF version"
>
> Perhaps this can be expanded with some description of the advantages of
> dwarf5 over dwarf4?

Will do.

>
> >
> >  config DEBUG_INFO_BTF
> > diff --git a/scripts/test_dwarf5_support.sh b/scripts/test_dwarf5_support.sh
> > new file mode 100755
> > index 000000000000..156ad5ec4274
> > --- /dev/null
> > +++ b/scripts/test_dwarf5_support.sh
> > @@ -0,0 +1,9 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +# Test that assembler accepts -gdwarf-5 and .file 0 directives, which were bugs
> > +# in binutils < 2.35.
> > +# https://sourceware.org/bugzilla/show_bug.cgi?id=25612
> > +# https://sourceware.org/bugzilla/show_bug.cgi?id=25614
> > +set -e
> > +echo '.file 0 "filename"' | $* -Wa,-gdwarf-5 -c -x assembler -o /dev/null -
>
> This also actually needs --gdwarf-5 to really check the support for the
> option, but older versions should error on the .file 0 in any case.

Based on Jakub's feedback on the earlier thread
https://lore.kernel.org/lkml/20201104121934.GT3788@tucnak/
it sounds like the dwarf version also needs to be dumped since GCC 5 <
x < 7 accepts --gdwarf-5, but did not produce DWARF Version 5 debug
info.

-- 
Thanks,
~Nick Desaulniers
