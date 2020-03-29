Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1549D196CC4
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2020 13:05:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbgC2LFD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 29 Mar 2020 07:05:03 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:22887 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727875AbgC2LFD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Mar 2020 07:05:03 -0400
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 02TB4oUV031333;
        Sun, 29 Mar 2020 20:04:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 02TB4oUV031333
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585479891;
        bh=CZAmvYzErNjohE2ADOOoYKCxYdv4vojfbTYidYBQq1Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qSVFHnIIJnBUjLMS19vCe82bGiz9+8Q/kU6nr+DoilpyKEKa47A0mjbQjjaUdRqsA
         +NIP9MNPShJN/4pHZjZZsz8wSgewg6yxu0AbQO6V6sdY5UpqSaCYp5FW3p8HyVksJN
         dv0kU0IIorFxlDYUlBqYegu4o3gCQem4XKUvYArmUwpGexUuEs6KYNsL1Vnn6W1HMC
         z5Mm8lctTDtW5ABVSGLlYf/RxaoqUDeHR0VCMFnBCozN9LZONIpTO034NwPhxAUAQ/
         BLAqo0bjZ5uCSZUm67v4p55mf3WzyW7Xk9f1mliOFIO/hz4rWqdZuRscWD7frpptrw
         mlg263302QbKg==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id u11so9162806vsg.2;
        Sun, 29 Mar 2020 04:04:51 -0700 (PDT)
X-Gm-Message-State: AGi0PuaqlSAKqJIJURE/LbTE8Z4tGvIUzNS+kfX4HcpreEsdZH9PPa0X
        pX1bDmMa/IXI5s3z19RbIQHKV2gAjCsr6swdfhM=
X-Google-Smtp-Source: APiQypLko5mdsw5ozmMfBLEpr95LzigdeNWgB5ufKaG/GiPb+WkiNKTf7WbJ1iHXvX0yrsN3B4dkgtViqohO/kWsPYU=
X-Received: by 2002:a67:8745:: with SMTP id j66mr4371097vsd.181.1585479890191;
 Sun, 29 Mar 2020 04:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200325031433.28223-1-masahiroy@kernel.org> <20200325031433.28223-2-masahiroy@kernel.org>
 <202003251906.973AD868@keescook>
In-Reply-To: <202003251906.973AD868@keescook>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 29 Mar 2020 20:04:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNARRZ3_z6tjuGJ=PUw5JUtP5AM31wYpr0mnn9yq6VfzQOA@mail.gmail.com>
Message-ID: <CAK7LNARRZ3_z6tjuGJ=PUw5JUtP5AM31wYpr0mnn9yq6VfzQOA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: add -Wall to KBUILD_HOSTCXXFLAGS
To:     Kees Cook <keescook@chromium.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        Emese Revfy <re.emese@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 26, 2020 at 11:06 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Mar 25, 2020 at 12:14:32PM +0900, Masahiro Yamada wrote:
> > Add -Wall to catch more warnings for C++ host programs.
> >
> > When I submitted the previous version, the 0-day bot reported
> > -Wc++11-compat warnings for old GCC:
> >
> >   HOSTCXX -fPIC scripts/gcc-plugins/latent_entropy_plugin.o
> > In file included from /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/tm.h:28:0,
> >                  from scripts/gcc-plugins/gcc-common.h:15,
> >                  from scripts/gcc-plugins/latent_entropy_plugin.c:78:
> > /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/config/elfos.h:102:21: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
> >     fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\
> >                      ^
> > /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/config/elfos.h:170:24: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
> >        fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",  \
> >                         ^
> > In file included from /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/tm.h:42:0,
> >                  from scripts/gcc-plugins/gcc-common.h:15,
> >                  from scripts/gcc-plugins/latent_entropy_plugin.c:78:
> > /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/defaults.h:126:24: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
> >        fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",  \
> >                         ^
> >
> > The source of the warnings is in the plugin headers, so we have no
> > control of it. I just suppressed them by adding -Wno-c++11-compat to
> > scripts/gcc-plugins/Makefile.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Acked-by: Kees Cook <keescook@chromium.org>
>
> -Kees


Applied to linux-kbuild.



-- 
Best Regards
Masahiro Yamada
