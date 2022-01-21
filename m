Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3CF2495A6B
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Jan 2022 08:13:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245097AbiAUHNQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Jan 2022 02:13:16 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:19102 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378871AbiAUHNP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Jan 2022 02:13:15 -0500
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 20L7CsIq011697
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Jan 2022 16:12:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 20L7CsIq011697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1642749174;
        bh=zSEbmnEc6rlCkidZHoCGg2ou8Jcb/c4+npHXpBsvbOg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wobwUj2N2hU5mUfXvWz3hVLehZvM7l1LyG9YR1jUqOLoRglxHEa6SgjEpWVohBPWb
         N+oz7Vp6j10h+6/iky9KIkzJRHjLTiTYT3FtZmTXzWtmfsx4t3jc01vPlOCKsJDgWB
         RvrtafeEtmoTGEelFaU2tb9xG2j0IajxjfIzaJ2g8alkcstambGvZrPQaVAyrBAzuW
         lS9Lb3woh0i/Yc6lEdnATm6b91vqPssh6PbjnxK4dfyem98g0bapPCx4lZvjvOqZy8
         OtMSRJ+utSB7F6p5F8Z/BIMLU6eiuKWe4i/MoQWiW40cABtlPqH8QsQFx9jRxwBk/5
         tPZ3U1gGzJZ3g==
X-Nifty-SrcIP: [209.85.216.47]
Received: by mail-pj1-f47.google.com with SMTP id s61-20020a17090a69c300b001b4d0427ea2so12586327pjj.4
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Jan 2022 23:12:54 -0800 (PST)
X-Gm-Message-State: AOAM532I3uVcH56kTBgXvMqYwTpYlrsZkh+r9qrdtfCagAWT1AkZBB+q
        /eU7ci6QqIKZcaEy416vkuUk0mvsTdIivQ6UlwQ=
X-Google-Smtp-Source: ABdhPJyWyDVX7icvLfJE3ci3tI5x5ue42XKYQfACfz1KLnfwgnxlYzOF2twUBlw5BQgmi6HBaybPS/2BgEsMlhWUDng=
X-Received: by 2002:a17:903:283:b0:14a:8e80:cc85 with SMTP id
 j3-20020a170903028300b0014a8e80cc85mr2561409plr.99.1642749173564; Thu, 20 Jan
 2022 23:12:53 -0800 (PST)
MIME-Version: 1.0
References: <20220120192151.k46VF%steffen@sdaoden.eu>
In-Reply-To: <20220120192151.k46VF%steffen@sdaoden.eu>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 21 Jan 2022 16:12:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQOm8NYiTDQnd0P-UsGa7GurffQiWQgGh0Cze4wLmDmgA@mail.gmail.com>
Message-ID: <CAK7LNAQOm8NYiTDQnd0P-UsGa7GurffQiWQgGh0Cze4wLmDmgA@mail.gmail.com>
Subject: Re: Makefile: uses rsync(1), could this be optional?
To:     Steffen Nurpmeso <steffen@sdaoden.eu>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 21, 2022 at 4:31 AM Steffen Nurpmeso <steffen@sdaoden.eu> wrote:
>
> Hello.
>
> I sent this to linux-kernel@vger.kernel.org on the 15th, which
> seems to be legacy.  Just in case someone is wondering about the
> resend.

I did not see your previous post.
What is bad about using rsync?

>
> As a not-yet-tested low-quality Makefile suggestion, with modern
> GNU tools and find(1)'s -printf, wouldn't the following code work
> out gracefully in practice?  (Not subscribed.)
>
> Thanks for Linux!
>
> --- Makefile.orig       2022-01-15 19:33:59.337393371 +0100
> +++ Makefile    2022-01-15 19:34:07.447393217 +0100
> @@ -1260,8 +1288,17 @@ export INSTALL_HDR_PATH = $(objtree)/usr
>  quiet_cmd_headers_install = INSTALL $(INSTALL_HDR_PATH)/include
>        cmd_headers_install = \
>         mkdir -p $(INSTALL_HDR_PATH); \
> -       rsync -mrl --include='*/' --include='*\.h' --exclude='*' \
> -       usr/include $(INSTALL_HDR_PATH)
> +       if command -v rsync; then \
> +               rsync -mrl --include='*/' --include='*\.h' --exclude='*' \
> +               usr/include $(INSTALL_HDR_PATH);\
> +       else \
> +               cd usr;\
> +               find include/ -type f -name '*.h' -printf '%f %h\n' |\
> +               while read f d; do \
> +                       mkdir -p $(INSTALL_HDR_PATH)/$$d;\
> +                       cp -P $$d/$$f $(INSTALL_HDR_PATH)/$$d/$$f;\
> +               done;\
> +       fi
>
>  PHONY += headers_install
>  headers_install: headers
>
> --steffen
> |
> |Der Kragenbaer,                The moon bear,
> |der holt sich munter           he cheerfully and one by one
> |einen nach dem anderen runter  wa.ks himself off
> |(By Robert Gernhardt)



--
Best Regards
Masahiro Yamada
