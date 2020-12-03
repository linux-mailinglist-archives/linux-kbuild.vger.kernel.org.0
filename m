Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A914F2CD1D3
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Dec 2020 09:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730001AbgLCIwj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Dec 2020 03:52:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:33618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729947AbgLCIwi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Dec 2020 03:52:38 -0500
X-Gm-Message-State: AOAM530gGc3YZhI+fM6k+0eIZox6/6tJB7GTrqYZpnuydhMgArhhXGF5
        lY+2jsIxXMsyhvsA3uNcd88hMsU2whj1ocAn0CY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1606985517;
        bh=a+yWvdSDdE24FX9vt8IOCe36Vtka+wQtK+114SX022M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ErTTATeZKbJjFhiphL0HIFp4bCRlFwWs66KSdKMr6YCy5y1Q6mWOJK0gDZSqidDp2
         F3tIoSYZV3thvyafVZHCnC+IJxl6MLHOmsAh7zX80HTMcMFLDD7jooPzP1+/5FNVRv
         CdhLbuyvXpQypxYoC9mpv79pPKwPwn9Wy9G9Hhbi9kjZaeu2Q2QAlC5YIhkg26xBUJ
         QrrHnq6HwbMd5TSHi4fmVH0zb8LdkbX4pMGotg4rWx2Q+Z3KsiWEqBj+4pNVvZxwg8
         tp9pxJVnofjz/luDuNoMUOzc3hHyIKJaqN+OPzm9AL5l1QrATyaPtkjZdvSwiwJiJI
         1MaEXtgwrz/mQ==
X-Google-Smtp-Source: ABdhPJwqlFh25Vd2LWewK1tFkHa0IexqR/iEcj0p/vayAtATNnza5AAw65FicXja6uAVRpV8qxCkg9JUOsft8wUYtHI=
X-Received: by 2002:a9d:be1:: with SMTP id 88mr1415604oth.210.1606985516770;
 Thu, 03 Dec 2020 00:51:56 -0800 (PST)
MIME-Version: 1.0
References: <20201203004437.389959-1-keescook@chromium.org> <20201203004437.389959-6-keescook@chromium.org>
In-Reply-To: <20201203004437.389959-6-keescook@chromium.org>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 3 Dec 2020 09:51:40 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Br8JFJX2PxyjVxMPMhi-y8mxf+vdEAZQq_Wm2wYP7ZA@mail.gmail.com>
Message-ID: <CAK8P3a1Br8JFJX2PxyjVxMPMhi-y8mxf+vdEAZQq_Wm2wYP7ZA@mail.gmail.com>
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

On Thu, Dec 3, 2020 at 1:44 AM Kees Cook <keescook@chromium.org> wrote:
>
> With UBSAN_OBJECT_SIZE disabled for GCC, only UBSAN_ALIGNMENT remained
> a noisy UBSAN option. Disable it for COMPILE_TEST so the rest of UBSAN
> can be used for full all*config builds or other large combinations.
>
> Link: https://lore.kernel.org/lkml/CAHk-=wgXW=YLxGN0QVpp-1w5GDd2pf1W-FqY15poKzoVfik2qA@mail.gmail.com/
> Signed-off-by: Kees Cook <keescook@chromium.org>

Have you checked if this has a notable impact on allmodconfig compile speed
with gcc or clang? I think I've seen significant increases in build times before
with this, but I don't remember the actual magnitude.

Making it 20% slower would probably be ok, but making it twice as slow might
be too much.

       Arnd
