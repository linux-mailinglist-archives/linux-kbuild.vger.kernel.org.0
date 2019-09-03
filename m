Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD39FA6D14
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Sep 2019 17:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727667AbfICPjs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Sep 2019 11:39:48 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:34429 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729589AbfICPjs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Sep 2019 11:39:48 -0400
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x83Fdi8F009932;
        Wed, 4 Sep 2019 00:39:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x83Fdi8F009932
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567525185;
        bh=mNQ/8Q4lNQ2CgeCETQDXp73cvMbK+QmBj7K2vN48yOY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LI2L8c7Dydp4FNoa/m04U8sBZr24ewfpewGxysI5dRM0Q/wT8MsnW2ZV6qhzRwp+j
         gGuYWjhJjWihsnF/VRI9u6ZyXy+gUn/uoQ3IVNBzkkpd0m/clEPWDBxfI2uL0Jw8x8
         rgcwtNtORkx/8AJin3veS316ZNwM8FVCyjbPznMj95UuAVpl0DkxW5FvCe30G5ZsPZ
         /OStfgi/vOzcBTSACf3ut+SODJ03M+WUz6ne4Ag+1tQxdOJJpXgDQMSE9P+MiEJVZP
         +DjGcPdQJukty30ys0FswxjiLpPoR9X/T6o3ryQrcTY7PGaNAVSZQYEfJfHn13mL/E
         pn9Qz22/3Ckhw==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id i128so11593816vsc.7;
        Tue, 03 Sep 2019 08:39:44 -0700 (PDT)
X-Gm-Message-State: APjAAAVrAC9b5V34qQuXt4+WP8GqUpEW0oPG4KPx0LaOpgh1hBpvmjnS
        hNuRCVs5wxmSKOgq2Jks+Mvsj3BuGweXloH6Px8=
X-Google-Smtp-Source: APXvYqxClUo4hmFiaBOaF3Bg7pczDjRMUbD9av9h9lJvgIWGJYlSIcpebE6uSVbl53YuUMcivb3JuT6HOYFTfBHcWQI=
X-Received: by 2002:a67:f418:: with SMTP id p24mr1417399vsn.215.1567525183683;
 Tue, 03 Sep 2019 08:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190828055425.24765-1-yamada.masahiro@socionext.com>
 <20190828055425.24765-2-yamada.masahiro@socionext.com> <20190828182017.GB127646@archlinux-threadripper>
 <CAKwvOd=r5Y8hQQBeKZ6zAokPdyeT2AVKFsdviTvwV5AyDQQHrw@mail.gmail.com>
 <CA+icZUWmmC7CruvXx6U0cdXMLaMWJadU=T61E0om1rOuW3==pw@mail.gmail.com> <CA+icZUXX6YG7=4n60A3_HiTYE0SkNXd8yr4-pqfOsqg66QvXzw@mail.gmail.com>
In-Reply-To: <CA+icZUXX6YG7=4n60A3_HiTYE0SkNXd8yr4-pqfOsqg66QvXzw@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 4 Sep 2019 00:39:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQLM2RXELr=WY7O8UEHx3EQZKeQdfZ_Ko4wTTPe0ZrqHg@mail.gmail.com>
Message-ID: <CAK7LNAQLM2RXELr=WY7O8UEHx3EQZKeQdfZ_Ko4wTTPe0ZrqHg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: allow Clang to find unused static inline
 functions for W=1 build
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Sven Schnelle <svens@stackframe.org>,
        Xiaozhou Liu <liuxiaozhou@bytedance.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 30, 2019 at 6:52 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> Just as a sidenote:
>
> From [PATCH v2] kbuild: enable unused-function warnings for W= build with Clang:
>
> "Per the documentation [1], -Wno-unused-function will also disable
> -Wunneeded-internal-declaration, which can help find bugs like
> commit 8289c4b6f2e5 ("platform/x86: mlx-platform: Properly use
> mlxplat_mlxcpld_msn201x_items"). (pointed out by Nathan Chancellor)
> I added -Wunneeded-internal-declaration to address it.
>
> If you contribute to code clean-up, please run "make CC=clang W=1"
> and check -Wunused-function warnings. You will find lots of unused
> functions."

This information is unrelated to this version,
so I dropped it.


> Isn't that missing in your double?
>
> - Sedat -
>
> [1] https://lkml.org/lkml/2019/8/27/729



-- 
Best Regards
Masahiro Yamada
