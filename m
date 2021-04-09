Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B53E2359DF2
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Apr 2021 13:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232469AbhDILvw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Apr 2021 07:51:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbhDILvv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Apr 2021 07:51:51 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC042C061760;
        Fri,  9 Apr 2021 04:51:38 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id d12so1462276iod.12;
        Fri, 09 Apr 2021 04:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=hZuwsXlFEKsc4YD4j7Gs3CXLME7CKIHW1tceSVydmro=;
        b=YWxml39dBvA2WXxRMCWCVC+9Dmk8/cUVGj878DovUpCWCgZv8zKCnyBTmeB+dEI4H0
         K2hy14VF7afTMfBCeVdEb0TLQOpO1V3OwjqT+ZTZ537+43o+xzS4dao43XCTjgAd18L5
         VYHQAGjdu4EigD8Xhu0vHgBV/ufa1GMfUEPJ3zsPDOPXVFrZtaZPgtNmNd4yCUHJFrHV
         N8pnuDkeOCbK5aZJI5yEaNcO+r4kwP9xRPkd6DLE4uldYaUV2KzvT4BvT8vjEmRLkIs8
         ld32sZ5l1cYze5JxZzNtTYulz6lYPGhdM8AuSC64to/XFYmkbkoDvm6AkKzh2t8E8/gB
         OslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=hZuwsXlFEKsc4YD4j7Gs3CXLME7CKIHW1tceSVydmro=;
        b=lYN5C3rDHvtcR6GiBy/GMwiB1aFXNAus6oYbPIRJjCTxEimsoFUSrb6o72bgyME8tD
         oXX8uzpEs8utlDAbnwrowr0x00dju0/qIjljBeLSmz8fU9b9+i+sGlc1ZI5VtKWh4I7B
         upeF1ynGtAaZBJ9h8sqbOI4/pHPCZxSZlGPHNsw3O9PV4RyUp1pCEZBAIj0/GRHiVk5P
         rsG6/lWGEVniSrS4mQ0o1Kybk+4X8XWNkmuOmeG/sjMACqDVzw2kOr7qcELHcsZ2al5m
         E/o0CkAEdC/cEMqkIFPTscoyXSz+LWIrcSq0i5SlnZNRWoVNecZJ78bbkNuqlMiAaPcK
         +ixQ==
X-Gm-Message-State: AOAM533FyciJX0QMfK0Y9ticmmTwDoZJtWMdkpBP1KFN1lZ0LlXbjp7R
        X7L42IgX9C4qbfwWhitTTMRuogHn1GH6yrzH4zWSlK3JzTciow==
X-Google-Smtp-Source: ABdhPJyb05xsvIXPk6HYPoPa37KUWp1rOB+P87BWuGwWA15tteFqafTjEylSBQO2el9Om5X1T4ae5jqUnfgl6k099bo=
X-Received: by 2002:a6b:c843:: with SMTP id y64mr2213556iof.57.1617969098185;
 Fri, 09 Apr 2021 04:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210407160927.222092-1-lucjan.lucjanov@gmail.com>
 <20210409111033.2465074-1-lucjan.lucjanov@gmail.com> <CA+icZUWbYd3z-+FDoXGx5UQcY4R1BuBn5V=o0d06=XADOZD8gQ@mail.gmail.com>
In-Reply-To: <CA+icZUWbYd3z-+FDoXGx5UQcY4R1BuBn5V=o0d06=XADOZD8gQ@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 9 Apr 2021 13:51:16 +0200
Message-ID: <CA+icZUWC-1uhVK52v=twDWSKqbBMAh=Fp0iXA0Acoq_AYxOnWQ@mail.gmail.com>
Subject: Re: Subject: Re: [PATCH v3] kbuild: add support for zstd compressed modules
To:     Piotr Gorski <lucjan.lucjanov@gmail.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        masahiroy@kernel.org, oleksandr@natalenko.name
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 9, 2021 at 1:31 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Fri, Apr 9, 2021 at 1:10 PM Piotr Gorski <lucjan.lucjanov@gmail.com> wrote:
> >
> > I originally posted the patch in a different form [1] even before Masahiro's changes.
> > I've been testing this solution since December last year and posted it in March this year,
> > after I made sure everything was working fine. This patch was tested by Oleksandr and he also didn't report any objections. [2]
> >
> > Masahiro notified me about the planned changes [3] and asked me to resend this patch, adjusted to those changes, which I did.
> >
> > My current logs:
> >
> > lucjan@archlinux ~ $ zgrep CONFIG_DEBUG_INFO /proc/config.gz
> > CONFIG_DEBUG_INFO=y
> > # CONFIG_DEBUG_INFO_REDUCED is not set
> > # CONFIG_DEBUG_INFO_COMPRESSED is not set
> > # CONFIG_DEBUG_INFO_SPLIT is not set
> > CONFIG_DEBUG_INFO_DWARF4=y
> > CONFIG_DEBUG_INFO_BTF=y
> > CONFIG_DEBUG_INFO_BTF_MODULES=y
> > lucjan@archlinux ~ $ zgrep CONFIG_MODULE_COMPRESS_ZSTD /proc/config.gz
> > CONFIG_MODULE_COMPRESS_ZSTD=y
> > CONFIG_MODULE_COMPRESS_ZSTD_LEVEL=19
> >
> > Pay no attention to CONFIG_MODULE_COMPRESS_ZSTD_LEVEL as this is not in the upstream, it's an additional patch I use.
> >
> > The only difference - I don't use clang. Maybe those who use will comment on this.
> > I relied on the opinions of Oleksander and a dozen other users who reported no errors in using zstd module compression.
> >
> > [1] https://marc.info/?l=linux-kbuild&m=161710402402989&w=2
> >
> > [2] https://marc.info/?l=linux-kbuild&m=161710503403517&w=2
> >
> > [3] https://marc.info/?l=linux-kbuild&m=161780602730829&w=2
>
> I am a big fan of ZSTD and have it as default in all available Linux
> Kconfigs and Debian's initramfs-tools.
> So, I am highly interested in getting this fixed.
>
> Unfortunately, I have thrown away my yesterday's Clang-LTO build and
> switched to Clang-CFI with builddeb - should do handle the same way.
>
> I see three iwlwifi.ko (as an example):
>
> $ LC_ALL=C ll drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
> -rw-r--r-- 1 dileks dileks 8.2M Apr  9 11:07
> drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
>
> $ file drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
> drivers/net/wireless/intel/iwlwifi/iwlwifi.ko: ELF 64-bit LSB
> relocatable, x86-64, version 1 (SYSV),
> BuildID[sha1]=78d593f4fd2b8efe81caeb8f1ea729107a33e244, with
> debug_info, not stripped
>
> That iwlwifi.ko with debug-info is optimized when moving to
> debian/linux-image-dbg directory:
>
> $ LC_ALL=C ll debian/linux-image-dbg/usr/lib/debug/lib/modules/5.12.0-rc6-5-amd64-clang12-cfi/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
> -rw-r--r-- 1 dileks dileks 7.9M Apr  9 11:18
> debian/linux-image-dbg/usr/lib/debug/lib/modules/5.12.0-rc6-5-amd64-clang12-cfi/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
>
> $ file debian/linux-image-dbg/usr/lib/debug/lib/modules/5.12.0-rc6-5-amd64-clang12-cfi/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
> debian/linux-image-dbg/usr/lib/debug/lib/modules/5.12.0-rc6-5-amd64-clang12-cfi/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko:
> ELF 64-bit LSB relocatable, x86-64, version 1 (SYSV),
> BuildID[sha1]=78d593f4fd2b8efe81caeb8f1ea729107a33e244, with
> debug_info, not stripped
>
> And think it's shrunk down and included debian/linux-image directory:
>
> $ LC_ALL=C ll debian/linux-image/lib/modules/5.12.0-rc6-5-amd64-clang12-cfi/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
> -rw-r--r-- 1 dileks dileks 694K Apr  9 11:18
> debian/linux-image/lib/modules/5.12.0-rc6-5-amd64-clang12-cfi/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
>
> $ file debian/linux-image/lib/modules/5.12.0-rc6-5-amd64-clang12-cfi/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko
> debian/linux-image/lib/modules/5.12.0-rc6-5-amd64-clang12-cfi/kernel/drivers/net/wireless/intel/iwlwifi/iwlwifi.ko:
> ELF 64-bit LSB relocatable, x86-64, version 1 (SYSV),
> BuildID[sha1]=78d593f4fd2b8efe81caeb8f1ea729107a33e244, not stripped
>
> I speculate both iwlwifi.ko below debian directory should be ZSTD-compressed.
> Fact is the one with debug-info is done correctly.
> Might be builddeb script needs a special treatment.
>

OK, I see (sorry Gmail truncates my paste of snippet).

We need to add in this block a CONFIG_MODULE_COMPRESS_XXX handling:

[ scripts/package/builddeb ]

#159: if is_enabled CONFIG_MODULES; then
...
#184: fi

Maybe other scripts in scripts/package/ directory, too.

What do you say Masahiro?

I have to admit I never used any compression for kernel-modules before
and after recent changes in <kbuild.git#kbuild>.

- Sedat -

[1] https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/tree/scripts/package/builddeb?h=kbuild#n159
