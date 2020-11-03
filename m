Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4ACF2A5A12
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Nov 2020 23:27:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729904AbgKCW1R (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Nov 2020 17:27:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729782AbgKCW1R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Nov 2020 17:27:17 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55149C061A04
        for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2020 14:27:17 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id 1so9285673ple.2
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Nov 2020 14:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3g/UXdTcvEaVpEpHCFk6DWCyxnMD9jfZ4IYbgmoi5Do=;
        b=uq428C0MISj1+Yl3N5njjURIa/fb2YaK/JiA0AEh+acv8LHAXJ7l0yTVpCqIB6Qr3o
         QRceQ69dCamC4YCnafirBV/b52//G3ZG/U3YJIABb7lP7NPRk4BPkds/NfGKod7xn/AU
         pVbJDMR8Y/vSDADnZbMUgZFib80urJO1Sb+GncvjQKy9wsVQ3/SBq0jKbcDZ0EVCqCoV
         QP53Q4L17XlBU1RROAaBjEw/LUqKoF5rQBM+ClVV6UlEChNhO+guriWVeNo7MkjxxVx9
         xGA01uekR50k6+ccmbEr+cf/7zkpKcVdUrwRJhEF44xWzdGv3A4UN5QoKt1E2+IKv6J6
         kjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3g/UXdTcvEaVpEpHCFk6DWCyxnMD9jfZ4IYbgmoi5Do=;
        b=I+J6KAukK7aeqfojARUIaTYt0bakXIL0YD4Cy4srsKDE3HtHna8KNQNjyfTuxcyxhW
         s/t2B5/CGOTkGD4mP1ZjuacQ3gDgstMOX158d2c1gscfLKcI/HjRtwPN4ceK7H1FAb64
         mUhfj+dxyMntl6T8jQH3T8FGsVaYl7eBfBcdwIRifQM7hvxVw/fI/HRm/XyqUn5iJhT3
         EWw/XIrCsJXYFTsxmXEugXCe4blNP81PWFdo2YBjKUh6YPiRnemYTAy4OkkXO5zDbmtK
         /64YMcebP8Q+rH6UaFr/bMyoB3oRWKR3zIaOgBkMLJyaN6MRD6/nQImpWpmGjMglMBeY
         8wPQ==
X-Gm-Message-State: AOAM531+l+GrWvKv0P6ixT2TGaW6pnoGELqX2j+2rF7OV6u5LUgEhwa+
        lXlrBh7L8Imt1rJLS+wEes95SPNf6OaKqpXk2hmslsB4mhU=
X-Google-Smtp-Source: ABdhPJyzqR5QvlI4cfiyph6xzOX86tQ5A8IroUFqjIYkfjsSV1kYveibhPKE50Q3QeizC8CNh1NZNbCh9lgi7xuOhV0=
X-Received: by 2002:a17:902:ee85:b029:d6:c43e:2321 with SMTP id
 a5-20020a170902ee85b02900d6c43e2321mr12767000pld.29.1604442436696; Tue, 03
 Nov 2020 14:27:16 -0800 (PST)
MIME-Version: 1.0
References: <20201022012106.1875129-1-ndesaulniers@google.com> <20201022014448.mcx5n7unf7kkka3o@google.com>
In-Reply-To: <20201022014448.mcx5n7unf7kkka3o@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 3 Nov 2020 14:27:05 -0800
Message-ID: <CAKwvOdmLN5BWAh35z2LyHvQ_P4pgyCaFohOphpgXUmMAehnV_g@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: implement support for DWARF5
To:     Fangrui Song <maskray@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 21, 2020 at 6:44 PM Fangrui Song <maskray@google.com> wrote:
>
> On 2020-10-21, 'Nick Desaulniers' via Clang Built Linux wrote:
> >DWARF5 is the latest standard of the DWARF debug info format.
> >
> >Feature detection of DWARF5 is onerous, especially given that we've
> >removed $(AS), so we must query $(CC) for DWARF5 assembler directive
> >support. Further -gdwarf-X where X is an unsupported value doesn't
> >produce an error in $(CC). GNU `as` only recently gained support for
> >specifying -gdwarf-5.
> >
> >The DWARF version of a binary can be validated with:
>
> To be more correct: this is just the version number of the .debug_info section.
> Other sections can use different version numbers.
> (For example, GNU as still does not support version 5 .debug_line)

How do you recommend we validate that then?

>
> >$ llvm-dwarfdump vmlinux | head -n 5 | grep version
> >or
> >$ readelf --debug-dump=info vmlinux 2>/dev/null | grep Version
> >diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> >index cd14444bf600..0382808ef9fe 100644
> >--- a/include/asm-generic/vmlinux.lds.h
> >+++ b/include/asm-generic/vmlinux.lds.h
> >@@ -828,7 +828,11 @@
> >               .debug_types    0 : { *(.debug_types) }                 \
> >               /* DWARF 5 */                                           \
> >               .debug_macro    0 : { *(.debug_macro) }                 \
> >-              .debug_addr     0 : { *(.debug_addr) }
> >+              .debug_addr     0 : { *(.debug_addr) }                  \
> >+              .debug_line_str 0 : { *(.debug_line_str) }              \
> >+              .debug_loclists 0 : { *(.debug_loclists) }              \
> >+              .debug_rnglists 0 : { *(.debug_rnglists) }              \
> >+              .debug_str_offsets 0 : { *(.debug_str_offsets) }
>
> Consider adding .debug_names for the accelerator table.
> It is the DWARF v5 version of .debug_pub{names,types} (which are mentioned
> a few lines above).

I hadn't seen that section produced in my limited testing.  Being a
fan of TDD, I kind of would like to see the linker warn on orphan
section placement, then add it to the list, as I did with the above.
Do you have more info on when or how .debug_pub* can be produced?

Thanks for the rest of the feedback, I'll incorporate it into v2.

-- 
Thanks,
~Nick Desaulniers
