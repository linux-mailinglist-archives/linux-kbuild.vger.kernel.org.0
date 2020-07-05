Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8154214DA7
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Jul 2020 17:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgGEPaO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 5 Jul 2020 11:30:14 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:59550 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbgGEPaO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Jul 2020 11:30:14 -0400
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 065FTsUq031049;
        Mon, 6 Jul 2020 00:29:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 065FTsUq031049
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593962995;
        bh=bXQYGMwFGx1Mq9judW5YHmqoj9lB8SkXZtg1zFbHUec=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=T/EFA6EN2ET/Fi6UgSlwzebkiMFqUpevgSyBdh7548He6gem+BOhfz3jKq+p1i1Rm
         MxZHmpQqWWh4cj7mhBsMQzjSEQQcU0xazBxNfTjWzoB3OqJzNZHmjc9pViVUnogWpz
         hptPMVeCBBeNtpP7A7hJcmQa2MkmlV5+Z5S93NSlTXogg5p+yCsWby68tqtrBHk9zX
         WMIirG1kcciEI7UzU5aqQOvG0kFkoXtaIP27L/sry66UnkHyMzoub8+3a0x7LSdpZg
         0oLX+CHJ5Jm7ygMN0W4/Lbff0Jel+WYYzJcQ4y240FaO9xWE57JUgyjalZoQ+Resmg
         xaXs8EdFtZ12A==
X-Nifty-SrcIP: [209.85.222.46]
Received: by mail-ua1-f46.google.com with SMTP id f11so840777uao.9;
        Sun, 05 Jul 2020 08:29:54 -0700 (PDT)
X-Gm-Message-State: AOAM5335DQfvEMKfBqf6FiknErD1aMSx5G5BTKsw12y5tlHaJdDsGCZU
        bM5GJcmF2YGK9rgBiHD1s3b8iK96JLl4JrtvNic=
X-Google-Smtp-Source: ABdhPJwRWWyAw5fo1xg0Q+IpoYY9kvqqZaqHPXsF7B2eb9XTN0c68Rg8Zi3Nw5VoVzlomxmzgCAPQ1b4TP+6GThMZDc=
X-Received: by 2002:ab0:21c6:: with SMTP id u6mr15213472uan.109.1593962993363;
 Sun, 05 Jul 2020 08:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200629085911.1676554-1-masahiroy@kernel.org>
 <CAKwvOd=qe5KE1vdUYQmpsW2zmDbk5i-MgRujs9B7wqnAj+af0w@mail.gmail.com>
 <CAK7LNAR49jFZkEmBqpACE0V_-VyCXfFRcKe1Zq+cqO65QX1ozg@mail.gmail.com> <CANiq72nE+1F3yM+e9XzfphzOe3mb9DUcRCAtPuLMyFE4Rh38pg@mail.gmail.com>
In-Reply-To: <CANiq72nE+1F3yM+e9XzfphzOe3mb9DUcRCAtPuLMyFE4Rh38pg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 6 Jul 2020 00:29:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNATRAuEXp+Wz7f_VUTSFS4jqmdTE4Xugi1MZozimsj6zuA@mail.gmail.com>
Message-ID: <CAK7LNATRAuEXp+Wz7f_VUTSFS4jqmdTE4Xugi1MZozimsj6zuA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: make Clang build userprogs for target architecture
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 1, 2020 at 4:13 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jun 30, 2020 at 6:26 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > I can reproduce this in the following
> > simple test code:
> >
> >
> > ----------------->8----------------
> > #include <stdio.h>
> >
> > int main(void)
> > {
> >         ssize_t x = 1;
> >
> >         printf("%zd", x);
> >
> >         return 0;
> > }
> > --------------->8-------------------
>
> That is the old implicit int rule. Try including sys/types.h or
> compiling with a standard like -std=c99 for instance.
>
> Cheers,
> Miguel

Hmm, adding '#include <sys/types.h>' did not make any difference.




If I add -std=c99, I get a different error.


$ clang -std=c99 --target=aarch64-linux-gnu test.c
test.c:5:10: error: unknown type name 'ssize_t'; did you mean 'size_t'?
         ssize_t x = 1;
         ^~~~~~~
         size_t
/home/masahiro/tools/clang-latest/lib/clang/11.0.0/include/stddef.h:46:23:
note: 'size_t' declared here
typedef __SIZE_TYPE__ size_t;
                      ^
1 error generated.





In contrast, 'size_t' has no problem.


----------------->8----------------
#include <stdio.h>

int main(void)
{
         size_t x = 1;

         printf("%zu", x);

         return 0;
}
--------------->8-------------------

$ clang  --target=aarch64-linux-gnu test.c
[ No warning ]




--
Best Regards
Masahiro Yamada
