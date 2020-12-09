Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F57D2D4A0E
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Dec 2020 20:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387612AbgLIT0P (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 9 Dec 2020 14:26:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:34744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387608AbgLIT0O (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Dec 2020 14:26:14 -0500
X-Gm-Message-State: AOAM532bcHb28fmrSW4OYjZhhMNlHS2vTPyBfEsrQoumlZoDIYC6xcH4
        0Y+dtD2vJrv2cQFI9YcrFeFQUFbkVl8t+Ik9gh0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607541933;
        bh=qT+7jBKPTe30tRze43jNxiJBNRQJrYUT3Mc3bhiB0v8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GWtFdSjmAD9OhMVtvID3zYlQWklxCseFFyfuMBDmFBryDlsOfV7W6/qnW38MjmKqe
         whY1OYPIQ7b2VkTHfBrHlT6paPN+TPVf/bB+vKZHNBHXKON6k8QY8E1WYZkdo37UEz
         COGVcDabpUmZSPs5eCeIFcbTrMBX12zi0ZNsIaOvT/UHDXKLXXdF6YU5zAiJegl55Y
         MXyVYyqKhMYulya3FVTrS6EBGdz08L+y4UmfL8H2lq9kfmSBS4e9gJBvlrUO3iK/nZ
         /LjXTtlD9CFBQ1cbDl+SS27pkaEqA+cIlN8zKrOa6z2w/CePf3ogm/l7+grXZV+TuN
         gUCqOQ3nT2WYg==
X-Google-Smtp-Source: ABdhPJzKYRHNwirnXEVnw/gCP3KlDllGDicuFsvGpUt5V8M00NU+6H68hjoKl0ujiX1q8Mle31vy1SwKsTp5azuVaMs=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr3125363otm.305.1607541932750;
 Wed, 09 Dec 2020 11:25:32 -0800 (PST)
MIME-Version: 1.0
References: <20201203004437.389959-1-keescook@chromium.org>
 <20201203004437.389959-6-keescook@chromium.org> <CAK8P3a1Br8JFJX2PxyjVxMPMhi-y8mxf+vdEAZQq_Wm2wYP7ZA@mail.gmail.com>
 <202012091045.34E3CC3FA@keescook>
In-Reply-To: <202012091045.34E3CC3FA@keescook>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 9 Dec 2020 20:25:16 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0SUthL19AsA0ZXRzngfgwHjM7mKootqAPbdbeJD7xEtw@mail.gmail.com>
Message-ID: <CAK8P3a0SUthL19AsA0ZXRzngfgwHjM7mKootqAPbdbeJD7xEtw@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] ubsan: Enable for all*config builds
To:     Kees Cook <keescook@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marco Elver <elver@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        George Popescu <georgepope@android.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Dec 9, 2020 at 7:46 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Dec 03, 2020 at 09:51:40AM +0100, Arnd Bergmann wrote:
> > On Thu, Dec 3, 2020 at 1:44 AM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > With UBSAN_OBJECT_SIZE disabled for GCC, only UBSAN_ALIGNMENT remained
> > > a noisy UBSAN option. Disable it for COMPILE_TEST so the rest of UBSAN
> > > can be used for full all*config builds or other large combinations.
> > >
> > > Link: https://lore.kernel.org/lkml/CAHk-=wgXW=YLxGN0QVpp-1w5GDd2pf1W-FqY15poKzoVfik2qA@mail.gmail.com/
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> >
> > Have you checked if this has a notable impact on allmodconfig compile speed
> > with gcc or clang? I think I've seen significant increases in build times before
> > with this, but I don't remember the actual magnitude.
> >
> > Making it 20% slower would probably be ok, but making it twice as slow might
> > be too much.
>
> And for Clang, it's about 7m40s before and 8m30s after, so roughly 12% slower.

Ok, that doesn't sound too bad then.

       Arnd
