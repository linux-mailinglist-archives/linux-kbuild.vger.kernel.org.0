Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38BA25537B6
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jun 2022 18:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353867AbiFUQRA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Jun 2022 12:17:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353149AbiFUQQ7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Jun 2022 12:16:59 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4819CB7F5
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Jun 2022 09:16:58 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id a29so23227778lfk.2
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Jun 2022 09:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ygOru1V+CqPdzVlc6g44G4+f/031CtJpK0ffalP9wKU=;
        b=ALJuFmJ2MgWHsuPdnOlWpIyCex1dQSuCHk/q8YBpxShXJT0+RwR/eiW/lM3EwY8BkE
         JxAx4j5NqMwY6W132S4o14HPBRTVQf1eO8Pt+Dr3GmnKV4muxrKAl1O8QGy68M51ipQl
         vk2SiezwIGLezoPwDEA2c5p4XsZm9LIO9eMaYy5uG5g4PJGsgmwIDeuiGNW/RBA6U3Xx
         vJh4/o+nmEivSp/gQCzsr7cUKJrIxBU/sG0soxK5OHfpJpNaaqL3IHqL+lyESjHuVyGk
         2+0JFYZVnJBkYz8Q0xIE3j2nsmoCGPbBaTAZzLSdsGZCP0UpZNOZ3xofoQ2IaZRKCnU9
         YNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ygOru1V+CqPdzVlc6g44G4+f/031CtJpK0ffalP9wKU=;
        b=HmnJwoMqF31EzeoBL+9Lz5oTcIHV489L/ZLbrWxWoDrPDFGw1Xs43M69cPR4QrVY2w
         xMLdroTCsyu0CK6EF0nXINjJKKJD3xAwi/P/Ykbc0MlSi+SDEKfB+dFL4Z4Yvn4VdFz3
         ngf7qLGzDh8FeXQkVP0/tXLepLHz3DxkmGbKaC9Q3d3xk2Twg6C+ZWX1M1hMTMSpDY3L
         vwa+FjnW3oIcbGP87feexqqWbG8t8WsX5kafWILUseV9rkf9quXgrys1IaXdZAsrO5Z1
         xHttcmOxipNDKOPe37ZsYnE/Ly37kfVQW5F4xGjxsBCyTOKJJRhBDILB+BUcOxkFOAK8
         zFHw==
X-Gm-Message-State: AJIora+r+gde1Bl44TDtrxkjiF6IuZZAvVx6FO0yO4066oNMv9XddTiD
        1k3Li22jfI7bs/bM3OcSYi/Uf2FWgzLxsNyxVhlozg==
X-Google-Smtp-Source: AGRyM1vl1kY/rfhG1ekDV3os5WgRq3Ow+TaCeNvDbKOJv/JFufeYfnJVlZvB6TAjyXdD2IgK0AXe8ylYTmXYo/BB1uQ=
X-Received: by 2002:ac2:4d22:0:b0:47f:65b5:35ec with SMTP id
 h2-20020ac24d22000000b0047f65b535ecmr8877385lfk.432.1655828216350; Tue, 21
 Jun 2022 09:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220621133526.29662-1-mikoxyzzz@gmail.com>
In-Reply-To: <20220621133526.29662-1-mikoxyzzz@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 21 Jun 2022 09:16:45 -0700
Message-ID: <CAKwvOd=Bmu40+_11GOBTeJBjToUf0LNG_RX0RiLcRLimUUkgcw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Kconfig: -O3 enablement
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Miko Larsson <mikoxyzzz@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Sean Christopherson <seanjc@google.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Chris Down <chris@chrisdown.name>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        John Ogness <john.ogness@linutronix.de>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Oleksandr Natalenko <oleksandr@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 21, 2022 at 6:35 AM Miko Larsson <mikoxyzzz@gmail.com> wrote:
>
> Hi,
>
> This very small series allows -O3 to be used for all architectures. The
> first patch marks -O3 as experimental, with the reasoning being that it
> might expose unwanted regressions to users, and the second patch
> actually allows -O3 by removing the "depend on ARC" string.

I think we should just remove -O3 support from KCONFIG.

If someone wants to mess around with "experimental features," there's
nothing stopping you from doing:

$ make KCFLAGS=-O3

>
> The reasoning behind this series is to open up -O3 so that bugs related
> to it (both compiler-related and kernel-related) can be discovered by
> eyeballs wanting to improve the "-O3 experience," as that might be
> beneficial to both compilers and the kernel. This has been attempted
> before [1], but unfortunately nothing ever came of it.
>
> [1] https://lore.kernel.org/lkml/20191211104619.114557-1-oleksandr@redhat.com/
>
> Cc: linux-kbuild@vger.kernel.org
> Cc: x86@kernel.org
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Sean Christopherson <seanjc@google.com>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Chris Down <chris@chrisdown.name>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: John Ogness <john.ogness@linutronix.de>
> Cc: Elliot Berman <quic_eberman@quicinc.com>
> Cc: Oleksandr Natalenko <oleksandr@redhat.com>
>
> Miko Larsson (2):
>   Kconfig: Mark -O3 as experimental
>   Kconfig: Allow -O3 for all architectures
>
>  init/Kconfig | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> --
> 2.36.1
>


-- 
Thanks,
~Nick Desaulniers
