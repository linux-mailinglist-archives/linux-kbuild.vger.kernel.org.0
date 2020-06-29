Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4237420D64A
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jun 2020 22:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731775AbgF2TS4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jun 2020 15:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731758AbgF2TOU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 15:14:20 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA549C08EA4D;
        Sun, 28 Jun 2020 22:55:02 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49wGsq67rhz9sQt;
        Mon, 29 Jun 2020 15:54:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1593410101;
        bh=Jh0SmCOzWGYUXyeIgZMSmN1pyztkyV9tCktpTHdG1i8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=BybM+kRzXXhESpdzgGc8v3JB79Vlzk3vA79SnZQQwaV1CyaostawEhvEsPizyn5ni
         mjvAYZpXe9D14yRzLQkEWsiwft6LzwUmSLO89yP3t9zLEsD+h7in5CqCItOw3sUnXR
         XR+PrHFFIh1Ruw6CrJF20kEkaITEUNaIHZC08UfgEZ8Putxpw5kSYKPHNxeYkigt4c
         wbS4tjp+GQZq9Z2ufwA0RhBt6wAqdoTijQHNpLODJsGwpEFKRWcu7n9lm2IGDlK13B
         k9wjzdSQGsDp4Wip6l38PVkFqw/f9pFWx+EErzZH+ebnzKJZrzt962Cws7xNX2yiy3
         NIHL1cwW1rRiA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Ingo Molnar <mingo@redhat.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Paul Mackerras <paulus@samba.org>,
        Rich Felker <dalias@libc.org>,
        Russell King <linux@armlinux.org.uk>,
        Steven Rostedt <rostedt@goodmis.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] kbuild: introduce ccflags-remove-y and asflags-remove-y
In-Reply-To: <20200628015041.1000002-1-masahiroy@kernel.org>
References: <20200628015041.1000002-1-masahiroy@kernel.org>
Date:   Mon, 29 Jun 2020 15:57:11 +1000
Message-ID: <87imfa8le0.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:
> CFLAGS_REMOVE_<file>.o works per object, that is, there is no
> convenient way to filter out flags for every object in a directory.
>
> Add ccflags-remove-y and asflags-remove-y to make it easily.
>
> Use ccflags-remove-y to clean up some Makefiles.
>
> Suggested-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/arm/boot/compressed/Makefile | 6 +-----
>  arch/powerpc/xmon/Makefile        | 3 +--
>  arch/sh/boot/compressed/Makefile  | 5 +----
>  kernel/trace/Makefile             | 4 ++--
>  lib/Makefile                      | 5 +----
>  scripts/Makefile.lib              | 4 ++--
>  6 files changed, 8 insertions(+), 19 deletions(-)
>
> diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
> index 89c76ca35640..55cbcdd88ac0 100644
> --- a/arch/powerpc/xmon/Makefile
> +++ b/arch/powerpc/xmon/Makefile
> @@ -7,8 +7,7 @@ UBSAN_SANITIZE := n
>  KASAN_SANITIZE := n
>  
>  # Disable ftrace for the entire directory
> -ORIG_CFLAGS := $(KBUILD_CFLAGS)
> -KBUILD_CFLAGS = $(subst $(CC_FLAGS_FTRACE),,$(ORIG_CFLAGS))
> +ccflags-remove-y += $(CC_FLAGS_FTRACE)

This could be:

ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)

Similar to kernel/trace/Makefile below.

I don't mind though.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
> index 6575bb0a0434..7492844a8b1b 100644
> --- a/kernel/trace/Makefile
> +++ b/kernel/trace/Makefile
> @@ -2,9 +2,9 @@
>  
>  # Do not instrument the tracer itself:
>  
> +ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
> +
>  ifdef CONFIG_FUNCTION_TRACER
> -ORIG_CFLAGS := $(KBUILD_CFLAGS)
> -KBUILD_CFLAGS = $(subst $(CC_FLAGS_FTRACE),,$(ORIG_CFLAGS))
>  
>  # Avoid recursion due to instrumentation.
>  KCSAN_SANITIZE := n
