Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04411133828
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jan 2020 01:58:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725812AbgAHA6X (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jan 2020 19:58:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:46022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725601AbgAHA6X (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jan 2020 19:58:23 -0500
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 06FFD20656;
        Wed,  8 Jan 2020 00:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578445102;
        bh=n1XqwT16/zPyBPZ62ev8+HYwivyuSN6tPQ8E0cRLlrY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=0yN2ZkwZ24etUHtKYoGN3f9D7JHWDUCLWz8kTAdyfV/8JrNFDGbmYSbU1ECJ+QWZc
         3GtaVHnfzZ0Qq22b9rNsWpGQ3kSO+iGoyES2CEueDd1u58GPO++JXm9SD0GLeUxqQk
         wlGph7jq5uQZOU2SHhSFOY60M/B/yasU2V4YHQIo=
Date:   Wed, 8 Jan 2020 09:58:16 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Shile Zhang <shile.zhang@linux.alibaba.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86: orc: fix unused-function warning
Message-Id: <20200108095816.76dd48134cadc997bf4c5ece@kernel.org>
In-Reply-To: <20200107213127.209139-1-arnd@arndb.de>
References: <20200107213127.209139-1-arnd@arndb.de>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue,  7 Jan 2020 22:31:20 +0100
Arnd Bergmann <arnd@arndb.de> wrote:

> The orc unwinder contains a new warning:
> 
> arch/x86/kernel/unwind_orc.c:210:12: error: 'orc_sort_cmp' defined but not used [-Werror=unused-function]
>  static int orc_sort_cmp(const void *_a, const void *_b)
>             ^~~~~~~~~~~~
> arch/x86/kernel/unwind_orc.c:190:13: error: 'orc_sort_swap' defined but not used [-Werror=unused-function]
>  static void orc_sort_swap(void *_a, void *_b, int size)
>              ^~~~~~~~~~~~~
> 
> Move the #ifdef to hide the now unused functions.
> 
> Fixes: f14bf6a350df ("x86/unwind/orc: Remove boot-time ORC unwind tables sorting")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me.

Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>

Thank you,

> ---
>  arch/x86/kernel/unwind_orc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
> index abdf8911a1fb..538152cca46b 100644
> --- a/arch/x86/kernel/unwind_orc.c
> +++ b/arch/x86/kernel/unwind_orc.c
> @@ -187,6 +187,7 @@ static struct orc_entry *orc_find(unsigned long ip)
>  	return orc_ftrace_find(ip);
>  }
>  
> +#ifdef CONFIG_MODULES
>  static void orc_sort_swap(void *_a, void *_b, int size)
>  {
>  	struct orc_entry *orc_a, *orc_b;
> @@ -229,7 +230,6 @@ static int orc_sort_cmp(const void *_a, const void *_b)
>  	return orc_a->sp_reg == ORC_REG_UNDEFINED && !orc_a->end ? -1 : 1;
>  }
>  
> -#ifdef CONFIG_MODULES
>  void unwind_module_init(struct module *mod, void *_orc_ip, size_t orc_ip_size,
>  			void *_orc, size_t orc_size)
>  {
> -- 
> 2.20.0
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
