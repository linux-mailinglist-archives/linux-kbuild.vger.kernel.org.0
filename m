Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E011B2CE2AC
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Dec 2020 00:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729689AbgLCX3H (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Dec 2020 18:29:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgLCX3G (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Dec 2020 18:29:06 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA8FBC061A53
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Dec 2020 15:28:26 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id q10so2407447pfn.0
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Dec 2020 15:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VZd5mQQ4Yh6641GciI7/R39T5bgJu4Raw0a7sjqJGxc=;
        b=Tl6txBU+3C9StAbudDXRNLyIAPS31KsI9v4twNU6Lq+WPY8iNFC55TLj2WdGnJasBe
         m8Os8PGEga/OHzYnd54fc4sQu8wFbUi73y+mDxRe9oGIm+/uJna1eZkgTLcjWILpVTR0
         FsFs07nx9N4iB7xQIeReeQ311cqPgZYbuKsWXWACa8Q1/HG85TCg3caSCIY0sQ+h7dJo
         zmetcLxThqzMpLebJWiyMJBYjMWhPMMEaura+uPwdRrUiU45M9YUT/Hysck9HJhFmpOU
         V1YtRlRrBovZueUcBi0tjNBAxVi0DCl2XjGILJYVJlWfQXu8Tgfyp1ePvSo93fwGZYii
         Da8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VZd5mQQ4Yh6641GciI7/R39T5bgJu4Raw0a7sjqJGxc=;
        b=V/R51cPzMhIRXYPKB3iI4UG6L4tsZHz/zg8ZDWESwrgIH9M3gNFDF27/AvVTgHRhZn
         K1ubc7en2aZdyhDGs08/8CxhAywc0Pdxp2q/NV8LslRpUvNpD0cMVLI1yB6Fzjg/wpWK
         PabkVDYAYX95vNc5bAVktj2Pa/b/leo3g8wJcGuyFD2m5gK2v8BFq3E4cvfSA3WxbaQB
         47OdTpL5elLMRrkzGBbB8+xYnXF5yulLwcssb2RMTLHRbsZn2SBgRl2b0ZVtrfSZofg/
         nQX6WGt4KNaSyW26BPedsCz4dxbAGgzDfx33OMKzNNfgOR7Q05bUrgrGtbTp4h3t3Zqz
         LqTw==
X-Gm-Message-State: AOAM533TVsVbPvaeSEahb06Xnf46+5SFXqo9sVG43ytZ3+ria2f9pChc
        gN5FXP76kJRekIrwrLxfCSp557pe8/Zrrbke27BQxQ==
X-Google-Smtp-Source: ABdhPJw5+vhOJybk2PqdIzO8tvVhjakR2H8TlBvhIEtUQpj58a9GObaMbVe9KgN6sVYMw0swRHNxFOSQXEoEgcJnQVU=
X-Received: by 2002:a63:3247:: with SMTP id y68mr5151471pgy.10.1607038106075;
 Thu, 03 Dec 2020 15:28:26 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
 <20201104005343.4192504-1-ndesaulniers@google.com> <20201104005343.4192504-5-ndesaulniers@google.com>
 <20201124172836.GA346213@rani.riverdale.lan> <CAKwvOdkGvLrPr4pHi4LKCF5t74+wencdy7r38d3k_4pC9pQYwQ@mail.gmail.com>
In-Reply-To: <CAKwvOdkGvLrPr4pHi4LKCF5t74+wencdy7r38d3k_4pC9pQYwQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 3 Dec 2020 15:28:14 -0800
Message-ID: <CAKwvOdmEVM67v8PqPWHP-VyGTkQpkWv8FdOTbxQ-7ebvSummMA@mail.gmail.com>
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

On Thu, Dec 3, 2020 at 3:22 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Tue, Nov 24, 2020 at 9:28 AM Arvind Sankar <nivedita@alum.mit.edu> wrote:
> >
> > On Tue, Nov 03, 2020 at 04:53:43PM -0800, Nick Desaulniers wrote:
> > > DWARF v5 is the latest standard of the DWARF debug info format.
> > >
> > > Feature detection of DWARF5 is onerous, especially given that we've
> > > removed $(AS), so we must query $(CC) for DWARF5 assembler directive
> > > support.  GNU `as` only recently gained support for specifying
> > > -gdwarf-5.
> >
> > With gcc, using -gdwarf-5 even without -Wa,--gdwarf-5 results in
> > considerably smaller debug info. gcc does not seem to generate the .file 0
> > directive that causes older GNU as to barf.
> >
> > Should the assembler support check be restricted to CC_IS_CLANG?
>
> No, because if LLVM_IAS=1 then the assembler support need not be checked.

Also, if your version of GCC supports DWARF Version 5, but your
version of GAS does not, then I'm more inclined to not allow
CONFIG_DEBUG_INFO_DWARF5 to be selectable, rather than mix and match
or partially support this for one but not the other.  Either all tools
used support DWARF 5, or you don't get to use DWARF 5.

> > >  config DEBUG_INFO_BTF
> > > diff --git a/scripts/test_dwarf5_support.sh b/scripts/test_dwarf5_support.sh
> > > new file mode 100755
> > > index 000000000000..156ad5ec4274
> > > --- /dev/null
> > > +++ b/scripts/test_dwarf5_support.sh
> > > @@ -0,0 +1,9 @@
> > > +#!/bin/sh
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +
> > > +# Test that assembler accepts -gdwarf-5 and .file 0 directives, which were bugs
> > > +# in binutils < 2.35.
> > > +# https://sourceware.org/bugzilla/show_bug.cgi?id=25612
> > > +# https://sourceware.org/bugzilla/show_bug.cgi?id=25614
> > > +set -e
> > > +echo '.file 0 "filename"' | $* -Wa,-gdwarf-5 -c -x assembler -o /dev/null -
> >
> > This also actually needs --gdwarf-5 to really check the support for the
> > option, but older versions should error on the .file 0 in any case.
>
> Based on Jakub's feedback on the earlier thread
> https://lore.kernel.org/lkml/20201104121934.GT3788@tucnak/
> it sounds like the dwarf version also needs to be dumped since GCC 5 <
> x < 7 accepts --gdwarf-5, but did not produce DWARF Version 5 debug
> info.

Sigh...llvm-readelf doesn't accept --debug-dump=info for checking the
DWARF version; llvm-dwarfdump works with no args...at this point I'm
tempted to just version check GCC.
-- 
Thanks,
~Nick Desaulniers
