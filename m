Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4442D2D466F
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Dec 2020 17:11:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729725AbgLIQKN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 9 Dec 2020 11:10:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbgLIQKM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Dec 2020 11:10:12 -0500
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52EFCC0617A6
        for <linux-kbuild@vger.kernel.org>; Wed,  9 Dec 2020 08:09:31 -0800 (PST)
Received: by mail-vs1-xe41.google.com with SMTP id w18so1148537vsk.12
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Dec 2020 08:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nqyEOFHVM5Ky3nbjp7naROpurgTB2x9ZG+Hz5wH8wPU=;
        b=enl+HYZfvbCMKTqutKGkL4DEIVorJ/taYS/JJw+IfqHlE5cVy/zslMzRYwk2VdL0wr
         s43qvZaWjhm/0laGuZtBRiui2gDEsXPAouZwsdj9LIev9pb2X/bwrRXUz4XQTOg3gVSD
         oU/wAXdv54FAHrtCWR59AqwHnZVb1iQ5qyFEXrsxKVlxFgEsa1wy3FjVzPGnpuhILmIW
         zeGKaFuVPAWhnS6yaQBw6k4xASuW/5YzXjkd2dqGVGtP6DkVDRKUww9R9SaonJ1JE+Q9
         lzNtBdhD0wjbRFTlp/UFs5dlfE7SYVAYipT8+m8J2FPZ6M4UOJscZl9ID0t64scrmJIq
         Nq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nqyEOFHVM5Ky3nbjp7naROpurgTB2x9ZG+Hz5wH8wPU=;
        b=o0RN6BIpxKyB2xFhO1NI/AYeTtGFltC+X99JfafdWRPX8VI/om7ATy5bJWZNQky55e
         8scSJR1B/51FQbScJ2evU1PPisC//7sjydSUVzR0ioyEacQYMoEvxUjeKNI3AlBx3EWy
         qwaZ4JCpkhInCzpXmm0SaCBe9wbNFCqwFxwHrEekfHci0JXqGPOehWsYsMnN5pGgWj2z
         rOuXKswhwaxpTMSgaMgZot8v7jcExUvzlOOQc9Tr23T5kmN87PqO7LV7QlEpR1rwEfNI
         yadBWpYise9+Dm+gKBEqiwnDt4MBWyCAZ0Ff/gGPThZlj36D4IGvT6THcLs696msXhnp
         K8xQ==
X-Gm-Message-State: AOAM531E4swGqT+2T84Q2uZ8CzbgdhlNBv3xzE+StXOfeZJgCW3D9tVn
        XD3E0sQVx7/PBgmz0sMYNWjcmbTWcDjHq0mgltVsxQ==
X-Google-Smtp-Source: ABdhPJygyHjARSrnsdIbp51NuTL1nsIMlAfXLy2zaWgCIgwi3WqDnANYwazmXhxW1QwBlbPUShTlfc50yzUmoDM5q7s=
X-Received: by 2002:a67:4341:: with SMTP id q62mr2124127vsa.14.1607530169863;
 Wed, 09 Dec 2020 08:09:29 -0800 (PST)
MIME-Version: 1.0
References: <20201201213707.541432-1-samitolvanen@google.com>
 <CAK8P3a1WEAo2SEgKUEs3SB7n7QeeHa0=cx_nO==rDK0jjDArow@mail.gmail.com>
 <CABCJKueCHo2RYfx_A21m+=d1gQLR9QsOOxCsHFeicCqyHkb-Kg@mail.gmail.com>
 <CAK8P3a1Xfpt7QLkvxjtXKcgzcWkS8g9bmxD687+rqjTafTzKrg@mail.gmail.com> <CAK8P3a3O65m6Us=YvCP3QA+0kqAeEqfi-DLOJa+JYmBqs8-JcA@mail.gmail.com>
In-Reply-To: <CAK8P3a3O65m6Us=YvCP3QA+0kqAeEqfi-DLOJa+JYmBqs8-JcA@mail.gmail.com>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Wed, 9 Dec 2020 08:09:18 -0800
Message-ID: <CABCJKud-4p2CnTyC5qjREL+Z_q8sD6cYE-0QU7poVKALgoVcNQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/16] Add support for Clang LTO
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Will Deacon <will@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 8, 2020 at 1:02 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Tue, Dec 8, 2020 at 9:59 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > Attaching the config for "ld.lld: error: Never resolved function from
> >   blockaddress (Producer: 'LLVM12.0.0' Reader: 'LLVM 12.0.0')"
>
> And here is a new one: "ld.lld: error: assignment to symbol
> init_pg_end does not converge"

Thanks for these. I can reproduce the "Never resolved function from
blockaddress" issue with full LTO, but I couldn't reproduce this one
with ToT Clang, and the config doesn't have LTO enabled:

$ grep LTO 0x2824F594_defconfig
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y

Is this the correct config file?

Sami
