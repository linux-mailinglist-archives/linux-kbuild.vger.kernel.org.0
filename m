Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 580103ED986
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Aug 2021 17:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbhHPPJe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 11:09:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:57448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229550AbhHPPJe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 11:09:34 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 220BE60EFE;
        Mon, 16 Aug 2021 15:09:02 +0000 (UTC)
Date:   Mon, 16 Aug 2021 11:08:55 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Daniel Bristot de Oliveira <bristot@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] Makefile: use -Wno-main in the full kernel tree
Message-ID: <20210816110855.4bb594d4@oasis.local.home>
In-Reply-To: <20210813224131.25803-1-rdunlap@infradead.org>
References: <20210813224131.25803-1-rdunlap@infradead.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 13 Aug 2021 15:41:31 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> When using gcc (SUSE Linux) 7.5.0 (on openSUSE 15.3), I see a
> build warning:
> 
> ../kernel/trace/trace_osnoise.c: In function 'start_kthread':
> ../kernel/trace/trace_osnoise.c:1461:8: warning: 'main' is usually a function [-Wmain]
>   void *main = osnoise_main;
>         ^~~~
> 
> Quieten that warning by using "-Wno-main". It's OK to use "main" as a
> declaration name in the kernel.
> 
> Build-tested on most ARCHes.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Suggested-by: Steven Rostedt <rostedt@goodmis.org>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Daniel Bristot de Oliveira <bristot@kernel.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> ---
>  Makefile |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20210812.orig/Makefile
> +++ linux-next-20210812/Makefile
> @@ -522,7 +522,7 @@ KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-P
>  KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
>  		   -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE \
>  		   -Werror=implicit-function-declaration -Werror=implicit-int \
> -		   -Werror=return-type -Wno-format-security \
> +		   -Werror=return-type -Wno-format-security -Wno-main \

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve

>  		   -std=gnu89
>  KBUILD_CPPFLAGS := -D__KERNEL__
>  KBUILD_RUST_TARGET := $(srctree)/arch/$(SRCARCH)/rust/target.json

