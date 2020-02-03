Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 541DF150043
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Feb 2020 02:28:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbgBCB2P (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Feb 2020 20:28:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:52434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726905AbgBCB2P (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Feb 2020 20:28:15 -0500
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AE96F20661;
        Mon,  3 Feb 2020 01:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580693294;
        bh=W0peBJrDi6x/1N6YOstYcNVeYP8M7k/WABnYabfP5CM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=uvZ/C2d1FMK5YyfCJvqaqy2sJ9zRxjWIu76YffAipKyFgniuU33gHbj4UVUzUwCZo
         9k2Hrqc50r3+isR1lffpVOryBtg1NmHCI4tud0U79buOut1dlpEDh3RSC83nmwFF96
         nSmo8o2kS2YmW4hWNZcMtDUUZ8MVRgtw/Z2TAbnY=
Date:   Mon, 3 Feb 2020 10:28:09 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marc Zyngier <maz@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] kallsyms: fix type of kallsyms_token_table[]
Message-Id: <20200203102809.7626e0bf9b83afc84c031f4c@kernel.org>
In-Reply-To: <20200202050922.12402-3-masahiroy@kernel.org>
References: <20200202050922.12402-1-masahiroy@kernel.org>
        <20200202050922.12402-3-masahiroy@kernel.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun,  2 Feb 2020 14:09:22 +0900
Masahiro Yamada <masahiroy@kernel.org> wrote:

> kallsyms_token_table[] only contains ASCII characters. It should be
> char instead of u8.

Indeed.

Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>

Thank you,

> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  kernel/kallsyms.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index 136ce049c4ad..53f84f685841 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -44,7 +44,7 @@ __attribute__((weak, section(".rodata")));
>  extern const unsigned long kallsyms_relative_base
>  __attribute__((weak, section(".rodata")));
>  
> -extern const u8 kallsyms_token_table[] __weak;
> +extern const char kallsyms_token_table[] __weak;
>  extern const u16 kallsyms_token_index[] __weak;
>  
>  extern const unsigned int kallsyms_markers[] __weak;
> @@ -58,7 +58,8 @@ static unsigned int kallsyms_expand_symbol(unsigned int off,
>  					   char *result, size_t maxlen)
>  {
>  	int len, skipped_first = 0;
> -	const u8 *tptr, *data;
> +	const char *tptr;
> +	const u8 *data;
>  
>  	/* Get the compressed symbol length from the first symbol byte. */
>  	data = &kallsyms_names[off];
> -- 
> 2.17.1
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
