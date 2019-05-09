Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFC2818E91
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2019 19:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbfEIRBe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 May 2019 13:01:34 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46126 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbfEIRBd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 13:01:33 -0400
Received: by mail-pl1-f195.google.com with SMTP id bi2so1418754plb.13
        for <linux-kbuild@vger.kernel.org>; Thu, 09 May 2019 10:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LdvvFe4BkIp3b7mnRhmSmtM8iVd7O7mPWgxjVeW2r74=;
        b=YvZ6FfLqkCLwg0RXt97ETkf1zBpl0R5wJOGGli5uw/GEl0JXidDWRTX84yjlUV0OaL
         rfiJgBIlmZYZEzGBjJl1Pfimc6Y8KtyD18DrFBOG70zW94DGzIONHMCGFqB9UPFSoWTM
         TbOK2BLlrTlkRfRC5Z1FQ2TTsq+yLTjQ/Kngu9p7ExpOc5qdlY2FN3K/QVyxD5TLoFBb
         vZbeK5PK5UB2Ivd1FSiOC2bCestoGrXt3DXDTEzQci427useXy2/dx71RyIo34hspYkD
         mI4jfGHYQ9Z/SKbVjMAgQL8IK8o+8OG36dgk216Fz0YOgkOX/Dgu9KREW18seIY1pPu1
         nLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LdvvFe4BkIp3b7mnRhmSmtM8iVd7O7mPWgxjVeW2r74=;
        b=lcts3tl+4pLXSDxiwXCiyo6fq4zAq1mGI27lt5rHr0o50bsmG1QO+kEBmMOKpiJfQV
         PRl9cn6fnnRG+wDG8UYUtnLK9md/U85NuYmMm1Mtie8J230O+lZBqAtTwIGdYoNpUqSh
         vR8Vihhx5+kSK/6zhFQl8blIpzXeTZMrk0XJkQMgC27etKsfsjDtLjQXlmmZb1h1G4mO
         C+5j0MP6CWzt+DmbRSxkkE9yDuX7QsANn1xSgd6+Eh7DWRh9q2BNcHSZRJQq/6I2wb6A
         IIeDzp7O2mXHIj+HK448lDUr33drrIn08HKCeYzw5mAWonKchCNi/6E0pMlyXvveeeKF
         sDDw==
X-Gm-Message-State: APjAAAX6kcUDPjjBOYiHUJ2KVHihfWw2oTnhHnGT1KUWWnbPL1k75Q9u
        4I1zGuBi84kCwkCcKEBhS5cNOf941Qy9xhpGjqMhlQ==
X-Google-Smtp-Source: APXvYqwDxtDS2K1shctsc+8evA6YFokeIrz181rTl7BWeAC13GrDNtUhiD/aN1XuWZ/gK8GEc59YncloA04rNVSkgvI=
X-Received: by 2002:a17:902:e287:: with SMTP id cf7mr6577691plb.217.1557421292762;
 Thu, 09 May 2019 10:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNASpsid7_sh4rdRNSTwZ1YtW_+uH2eoarJNNUttntQZ-kg@mail.gmail.com>
 <20190509114824.25866-1-natechancellor@gmail.com> <CA+icZUUN7cVXnkUv9DzYC7voys_CS=DJDm19EeYSWPyQwVdXVw@mail.gmail.com>
In-Reply-To: <CA+icZUUN7cVXnkUv9DzYC7voys_CS=DJDm19EeYSWPyQwVdXVw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 9 May 2019 10:01:21 -0700
Message-ID: <CAKwvOdkofHbT0qTvEkevvKUmzw5Ex5AD0wm+u4KYm7-HHMrnow@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Don't try to add '-fcatch-undefined-behavior' flag
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> On Thu, May 9, 2019 at 1:49 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > This is no longer a valid option in clang, it was removed in 3.5, which
> > we don't support.
> >
> > https://github.com/llvm/llvm-project/commit/cb3f812b6b9fab8f3b41414f24e90222170417b4

lol, good catch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> >
>
> Cool.
>
> Can you test with -mglobal-merge (inverted -mno-global-merge) which is
> default for Clang?

Looks like these were added in r234668 in 2015, which would've been
Clang 3.6.2, according to:
http://releases.llvm.org/

I'd be fine with dropping the option check there.

There's a few here (-Qunused-arguments) that don't need cc-option
checks.  I recommend someone audit all of them, rather than send a
bunch of little patches.
-- 
Thanks,
~Nick Desaulniers
