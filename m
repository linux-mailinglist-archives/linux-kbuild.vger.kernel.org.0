Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 885953AF4E7
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Jun 2021 20:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232073AbhFUSX3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Jun 2021 14:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231838AbhFUSXV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Jun 2021 14:23:21 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65EF7C0F26FA
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Jun 2021 11:11:00 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id x24so31657772lfr.10
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Jun 2021 11:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3c/Dj9Fc5BgdLF0O+HyOscCTfHQWUTCXKiHfvqmH+Xs=;
        b=LVtCC8Uqq0BDy6lpRBXE9HmSawC4RvRPlernkLbJMgwCvUmYxrxEYR9ANOYv+bzCka
         sLaMnxRAh8ObIy3XgWia/tzNHd6XG9Fq3w6/KMgBg4S+trxxvgc7+5LrC2wB3WDOprnc
         tdAkrh4Sh1ba+x5BK1wouLDQXtq1USPm4i8BuhAX08yrSRcJLeKQSOrA9mFkckhIdofR
         u42dYsiMJ0VfppUq1olij7Ubwi4sB7T3t6S4kuMBsEbBJdpSZ8PIoG1z1VsGMany983o
         xI1+XlH/nPGpWJF4LU1i28gPkHKolp82YjOB0fswTNf54a2RsPuUQkETWfSoLkXXA5dO
         Q6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3c/Dj9Fc5BgdLF0O+HyOscCTfHQWUTCXKiHfvqmH+Xs=;
        b=i6OP6UvC/No2xn5z2kgStZKo+nh9DcGsaCJ5WX6B846ZqF3yp7TZoRJllsmv0FoUnj
         eGn/u4LXGBy/o6nPV/r1DtHquHKjt2j1tG/PBY0ieFY0ueV9alNVCT8oszSV426lTjuC
         9xVTJuyxLAHJggNdFZkr+IoK8U5/xaaT9gGM8fMiAcKjwy6Kn+bDmth6IVVEtZ8D16oi
         QQ+OUyOsC1yuwZjlU9sdwRFBTx8kXWlAmS84fFHGYLXfJ89Eyo0LgXBmnCXOWPWhxqdG
         RupYCXenicQRCwQQHFr+ZULr8C74S4wL3e03/9G2enJSqaaR2XnDlaBqtQ5APNc9/ZWC
         Zz+Q==
X-Gm-Message-State: AOAM533dM4hhUZ6xecQ4iQWoF5Il1rrKzq84QAtebpiaWa7wPx5Lu4lb
        4jgbcouw2EvqHnL/CkZ0fqnYaTcXjSDhhtM2Bu5Rzg==
X-Google-Smtp-Source: ABdhPJw9xyLjqcMGtf1syN3OkvZTu30GhQYhz168mpGIwJCCD5sulB0prikKeQAZRs1lp6b2Hz3+9ry1G7AHm0pycs8=
X-Received: by 2002:ac2:4c83:: with SMTP id d3mr15097330lfl.543.1624299058430;
 Mon, 21 Jun 2021 11:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210618233023.1360185-1-ndesaulniers@google.com>
 <20210618233023.1360185-2-ndesaulniers@google.com> <CANiq72kjyiAQn2+ijZKFo7SY3z+dCV6fGXYP1O_Mq7Ui3EqSzQ@mail.gmail.com>
 <CANiq72nbbqeD2dv3z0y3rN-_kdnh=9-pD7oSyWUfaG8oJ2y_8A@mail.gmail.com>
In-Reply-To: <CANiq72nbbqeD2dv3z0y3rN-_kdnh=9-pD7oSyWUfaG8oJ2y_8A@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 21 Jun 2021 11:10:48 -0700
Message-ID: <CAKwvOd=B6LV9rZmtPacfz_F10jj1wrovoGu8yvdOqKZ69-T6mQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] compiler_attributes.h: define __no_profile, add to noinstr
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Martin Liska <mliska@suse.cz>,
        Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Fangrui Song <maskray@google.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Johannes Berg <johannes.berg@intel.com>,
        linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 19, 2021 at 4:32 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Jun 19, 2021 at 1:26 PM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > I am not sure if it is best or not to have the GCC link in order to be
> > consistent with the rest of the links (they are for the docs only). Do
> > we know if GCC going to implement it soon?
>
> i.e. if GCC does not implement it yet we use elsewhere this kind of
> marker instead:
>
>      * Optional: not supported by gcc
>
> The first of its kind, normally it is clang/icc there ;-)

:^) GCC does have an attribute since GCC 7.1 for this.
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=80223#c11
I'm moving Clang over to use that in
https://reviews.llvm.org/D104658
Once that lands, I'll send a v2 (without carrying any reviewed by tags).

>
> We could nevertheless have the link there, something like:
>
>     * Optional: not supported by GCC
>                 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=80223

-- 
Thanks,
~Nick Desaulniers
