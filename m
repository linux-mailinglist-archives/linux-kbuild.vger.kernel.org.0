Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D834B1DD9BD
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2020 23:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729822AbgEUV5s (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 May 2020 17:57:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728327AbgEUV5r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 May 2020 17:57:47 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A72C0C061A0E
        for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2020 14:57:47 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id x11so2526889plv.9
        for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2020 14:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TSxKnnFyDzr5TIHifuloj5+MkU6+ljp348ta4rzKVFY=;
        b=dXPScmAfnnkj9oY/tpSN6s3fJBAyh5t4mLgKXCVK2k9C2HWkYwHDlsyOSnA66Lc1wL
         DB+PCswLKQvb4ERWbQ7d0MauTLwD7VmEJpoB7iOvzLNhLgb+v9MM2ALex8qL7yejKFC8
         zvEv3AJh5U/NYpcqCbu1Ca5zJfJwz3GiybXXZvONi1eKvlg60oi01n7PO7EABV7ACRWG
         QBARStGvuBoTIjbo4OPEhppS9Qm8kjrvgzbdn6C35l+0fF14fiS/8liemSwfPkOZ6jW8
         bz1oCACwbRm+9e2WjFxNJ3h4LDE8kksrFNNiV75bZu5rWCaREs3htKCCpPLgzd2IelvM
         bGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TSxKnnFyDzr5TIHifuloj5+MkU6+ljp348ta4rzKVFY=;
        b=AckUqOHmgPakkburAcE2PyvU2UjgP0JDgFT6EJpDRXmxrYx5NnmwOhZAMLLhJq4PbE
         DEbl//M2nlisvSQVe7xL9yrc7RBpZzCvEX5lDe6CNxSKWwMDlE2C9ABg0Bpg5wUgCXvG
         JE4QgCbNsRglCVbbfnh5P5TPprtptdphFOD7j9CdeQys0osffPGzw3nU64jVwWNNrOxU
         wlrbzsti5DOQ9mcxdDIy7z5y3W/mz1aQ1s4s+yjloZ1rxL80T8O0/5JhTL+lZmmNCG32
         Apz+zg6fjt9mN2Gizaw9SX6SFZFJJTHwMVuTysxTnok+0nnX/7wwe5rUd5pnnZXQpXEn
         iiXQ==
X-Gm-Message-State: AOAM533R61loXfBkoZCBbVy0cJsvYx7bTwer7DLgnU22lHpkL0Oo1hLj
        FVP10+wtoE9fsMNA/C2ulev6wCDIKrAi6LjJnMMzMA==
X-Google-Smtp-Source: ABdhPJwcxYwlDtUvYmfrQ2zA/sDeHoaekf+9/G8kXzhN7oimGZllsEK1KOn7uZZQ+Ay0tgfc5cAMR+k+4Sfd9KxH1yU=
X-Received: by 2002:a17:90b:4c47:: with SMTP id np7mr679103pjb.101.1590098266861;
 Thu, 21 May 2020 14:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <10f4fb0b-1012-b0e6-af05-0aa5a906de21@redhat.com>
 <20200520193637.6015-1-ndesaulniers@google.com> <CAK7LNAS_PMz9r3e1UcuM+r18JC2KeM2RqGOms1u3kVzN_N1MmA@mail.gmail.com>
In-Reply-To: <CAK7LNAS_PMz9r3e1UcuM+r18JC2KeM2RqGOms1u3kVzN_N1MmA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 21 May 2020 14:57:34 -0700
Message-ID: <CAKwvOd=jOr4ZaLx-dSNTqZnGRATY1PZktUfu4JGWKRwRH=Ujnw@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: support compressed debug info
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Sedat Dilek <sedat.dilek@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Nick Clifton <nickc@redhat.com>,
        David Blaikie <blakie@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 20, 2020 at 7:48 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> > Suggested-by: Fangrui Song <maskray@google.com>
>
>
> Suggested-by -> Reviewed-by
>
> https://patchwork.kernel.org/patch/11524939/#23349551

Yes, my mistake.

> > Suggested-by: Nick Clifton <nickc@redhat.com>
>
>
> I do not know where this tag came from.
>
> Nick Clifton taught us the version rule of binutils,but did not state
> anything about this patch itself.
>
> https://patchwork.kernel.org/patch/11524939/#23355175
>
>
> > Suggested-by: Sedat Dilek <sedat.dilek@gmail.com>
>
> I do not see the source of this tag, either...

Not all contributions to open source need to be in the form of
patches.  Both Sedat and Nick gave suggestions which ultimately
informed the contents of this patch.  They should be rewarded for
their efforts, and incentivized to help improve the code base further.
I think suggested by tags are a good way to do that; but if it's
against a written convention or if you still disagree, it's not the
end of the world to me, and you may drop those tags from the v3.

> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -225,6 +225,21 @@ config DEBUG_INFO_REDUCED
> >           DEBUG_INFO build and compile times are reduced too.
> >           Only works with newer gcc versions.
> >
> > +config DEBUG_INFO_COMPRESSED
> > +       bool "Compressed debugging information"
> > +       depends on DEBUG_INFO
> > +       depends on $(cc-option,-gz=zlib)
> > +       depends on $(as-option,-Wa,--compress-debug-sections=zlib)
>
> This does not work. (always false)

Technically, always true. `-Wa` disables all warnings from the
assembler.  Also, I did test this via `make menuconfig`.

> You cannot enable this option.
>
> The comma between -Wa and --compress-debug-sections=zlib
> is eaten by Kconfig parser because commas are delimiters
> of function parameters.
>
>
> Please write like this.
>
>     depends on $(as-option,-Wa$(comma)--compress-debug-sections=zlib)

You're right, I knew this bug forgot. Will fix in v3.

> > +       depends on $(ld-option,--compress-debug-sections=zlib)
> > +       help
> > +         Compress the debug information using zlib.  Requires GCC 5.0+ or Clang
> > +         5.0+, binutils 2.26+, and zlib.
> > +
> > +         Users of dpkg-deb via scripts/package/builddeb may
> > +         wish to set the $KDEB_COMPRESS env var to "none" to avoid recompressing
> > +         the debug info again with a different compression scheme, which can
> > +         result in larger binaries.
>
> No. This is not correct.
>
> CONFIG_DEBUG_INFO_COMPRESSED compresses the only debug info part.
> The other parts still get by benefit from the default KDEB_COMPRESS=xz.
>
>
> The numbers are here:
>
>
> CONFIG_DEBUG_INFO_COMPRESSED=y
> -rw-r--r-- 1 masahiro masahiro 209077584 May 21 11:19
> linux-image-5.7.0-rc5+-dbg_5.7.0-rc5+-26_amd64.deb
>
>
> CONFIG_DEBUG_INFO_COMPRESSED=y and KDEB_COMPRESS=none
> -rw-r--r-- 1 masahiro masahiro 643051712 May 21 11:22
> linux-image-5.7.0-rc5+-dbg_5.7.0-rc5+-27_amd64.deb
>
>
> CONFIG_DEBUG_INFO_COMPRESSED=n
> -rw-r--r-- 1 masahiro masahiro 112200308 May 21 11:40
> linux-image-5.7.0-rc5+-dbg_5.7.0-rc5+-30_amd64.deb
>
>
>
>
> For the deb package size perspective,
> it is better to keep KDEB_COMPRESS as default.
>
> The main motivation for changing KDEB_COMPRESS
> is the build speed.  (see commit 1a7f0a34ea7d05)
>
>
>
>
> CONFIG_DEBUG_INFO_COMPRESSED has a downside
> for the debug deb package, but we need to accept it.

Ah, I see. Thank you for those measurements.  I'll send a v3 with
fixed up help text, but ultimately, I don't really care what it says
here.  Please feel empowered to reword it should you choose to accept
+ apply it.
-- 
Thanks,
~Nick Desaulniers
