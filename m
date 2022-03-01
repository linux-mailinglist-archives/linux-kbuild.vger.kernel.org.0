Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB454C977C
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Mar 2022 22:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234273AbiCAVFd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Mar 2022 16:05:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238484AbiCAVFc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Mar 2022 16:05:32 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB5A79383
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Mar 2022 13:04:49 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id g39so28935544lfv.10
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Mar 2022 13:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jpkBhqMELpJRUkOoHFKbzsupAYwAnlqKB8gXhGz5QEA=;
        b=gAEAIwp5TiyGoTgh4JNV+tH2eEHsDrzmeuag0zysI+PtG0mBbTlY+GQ2Irys79Qi+L
         cwZSjxBpwdC2wHTKgnSPUDEg4jG5Iqs6jc/4r4BP55ON/wZvI6SvnOqgbVfnTZXuNlCj
         Sko4sfN5Hk+tcMgzt8aDx7pTJ2JptgMqAsdqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jpkBhqMELpJRUkOoHFKbzsupAYwAnlqKB8gXhGz5QEA=;
        b=tm6ol0cztXem6k5yeQAuV6DMXp8+dhuHaeGangNd6WffZZfK07yaWDEO6s7v05SfnR
         Vs9122O+FiITqgttRob6B7pOHJH+540JgJpmkWaeDFLtKG3BNSVDPlxAD4Q2d1eTLVdZ
         AJJlsbkGXDR99uhd2K7FuoygxuhCPZEWcHKGyE8MvU7N5/xir5Jg2UhFTi+EIOHpm+vh
         6XpO6+vDHizPdQk33l5E1+fGkAGvBOrTBr+zt2rKhpU365/fWvXmSYZPk6vYKGKs4Mve
         EdFAQEBZ23y2BrXlPcCt10xoOwFNyt3MUVnUCVslrrLt75nvC0TTkesPrQqD7OMgSsC0
         WmKA==
X-Gm-Message-State: AOAM532d2s8jgWxYY2U8HaIk5qHoAy1HnmtrMHBQpzceRLE+IWPf0bhu
        hHrIqgCnxMNcOdSxaDs/SbHjsZ1p+6BTOSUQpQ4=
X-Google-Smtp-Source: ABdhPJweP7SmR+4Y1s0uDJDyiORf5GlNme3gqcoG+zvoxsTCfnYo65MtIIR0S0MllsCd8IgFW1FyLg==
X-Received: by 2002:a05:6512:31cf:b0:443:7eb6:3440 with SMTP id j15-20020a05651231cf00b004437eb63440mr16271976lfe.367.1646168686569;
        Tue, 01 Mar 2022 13:04:46 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id h21-20020a2e3a15000000b00245f3bffb9csm2188780lja.52.2022.03.01.13.04.42
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 13:04:43 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id u11so23561172lju.4
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Mar 2022 13:04:42 -0800 (PST)
X-Received: by 2002:a2e:bc17:0:b0:246:32b7:464 with SMTP id
 b23-20020a2ebc17000000b0024632b70464mr18195828ljf.506.1646168682597; Tue, 01
 Mar 2022 13:04:42 -0800 (PST)
MIME-Version: 1.0
References: <20220301075839.4156-2-xiam0nd.tong@gmail.com> <202203020135.5duGpXM2-lkp@intel.com>
 <CAHk-=wiVF0SeV2132vaTAcL1ccVDP25LkAgNgPoHXdFc27x-0g@mail.gmail.com> <CAK8P3a0QAECV=_Bu5xnBxjxUHLcaGjBgJEjfMaeKT7StR=acyQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0QAECV=_Bu5xnBxjxUHLcaGjBgJEjfMaeKT7StR=acyQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 1 Mar 2022 13:04:26 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiFbzpyt1-9ZAigFYU7R8g9mEgJho3w7yGYe0h-W==nsw@mail.gmail.com>
Message-ID: <CAHk-=wiFbzpyt1-9ZAigFYU7R8g9mEgJho3w7yGYe0h-W==nsw@mail.gmail.com>
Subject: Re: [PATCH 1/6] Kbuild: compile kernel with gnu11 std
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     kernel test robot <lkp@intel.com>,
        Xiaomeng Tong <xiam0nd.tong@gmail.com>,
        kbuild-all@lists.01.org, Jakob Koschel <jakobkoschel@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Jann Horn <jannh@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>, Netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 1, 2022 at 12:54 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> gcc-11 only shows the one line warning here.

What an odd warning. Not even a filename, much less a line number?

> The source is
>
> /* PCI CFG04 status fields */
> #define PCI_CFG04_STAT_BIT      16
> #define PCI_CFG04_STAT          0xffff0000
> #define PCI_CFG04_STAT_66_MHZ   (1 << 21)
> #define PCI_CFG04_STAT_FBB      (1 << 23)
> #define PCI_CFG04_STAT_MDPE     (1 << 24)
> #define PCI_CFG04_STAT_DST      (1 << 25)
> #define PCI_CFG04_STAT_STA      (1 << 27)
> #define PCI_CFG04_STAT_RTA      (1 << 28)
> #define PCI_CFG04_STAT_RMA      (1 << 29)
> #define PCI_CFG04_STAT_SSE      (1 << 30)
> #define PCI_CFG04_STAT_PE       (1 << 31)
> #define KORINA_STAT             (PCI_CFG04_STAT_MDPE | \
>                                  PCI_CFG04_STAT_STA | \
>                                  PCI_CFG04_STAT_RTA | \
>                                  PCI_CFG04_STAT_RMA | \
>                                  PCI_CFG04_STAT_SSE | \
>                                  PCI_CFG04_STAT_PE)
> #define KORINA_CNFG1            ((KORINA_STAT<<16)|KORINA_CMD)

Yeah, looks like that "<< 16" is likely just wrong.

I'm guessing that that KORINA_CNFG1 thing either ends up not
mattering, or - probably more likely - nobody really used that
platform at all. It has had pretty much zero updates sinced 2008.

               Linus
