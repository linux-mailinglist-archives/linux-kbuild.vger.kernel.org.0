Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 384AD133FA5
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jan 2020 11:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgAHKsf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Jan 2020 05:48:35 -0500
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:42830 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726462AbgAHKsf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jan 2020 05:48:35 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=shile.zhang@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0Tn9hx8y_1578480506;
Received: from ali-6c96cfdd1403.local(mailfrom:shile.zhang@linux.alibaba.com fp:SMTPD_---0Tn9hx8y_1578480506)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 08 Jan 2020 18:48:27 +0800
Subject: Re: [PATCH] x86: orc: fix unused-function warning
To:     Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org
References: <20200107213127.209139-1-arnd@arndb.de>
From:   Shile Zhang <shile.zhang@linux.alibaba.com>
Message-ID: <b977064f-f187-dfba-2765-cd9cafe1cdf2@linux.alibaba.com>
Date:   Wed, 8 Jan 2020 18:48:26 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200107213127.209139-1-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Arnd,

Thanks for you work!
But sorry for I have been fix this warning via a delta-patch as following:
https://lore.kernel.org/lkml/157838258393.30329.5371781726464192052.tip-bot2@tip-bot2/

FYI.

BRs
Shile

On 2020/1/8 05:31, Arnd Bergmann wrote:
> The orc unwinder contains a new warning:
>
> arch/x86/kernel/unwind_orc.c:210:12: error: 'orc_sort_cmp' defined but not used [-Werror=unused-function]
>   static int orc_sort_cmp(const void *_a, const void *_b)
>              ^~~~~~~~~~~~
> arch/x86/kernel/unwind_orc.c:190:13: error: 'orc_sort_swap' defined but not used [-Werror=unused-function]
>   static void orc_sort_swap(void *_a, void *_b, int size)
>               ^~~~~~~~~~~~~
>
> Move the #ifdef to hide the now unused functions.
>
> Fixes: f14bf6a350df ("x86/unwind/orc: Remove boot-time ORC unwind tables sorting")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/x86/kernel/unwind_orc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
> index abdf8911a1fb..538152cca46b 100644
> --- a/arch/x86/kernel/unwind_orc.c
> +++ b/arch/x86/kernel/unwind_orc.c
> @@ -187,6 +187,7 @@ static struct orc_entry *orc_find(unsigned long ip)
>   	return orc_ftrace_find(ip);
>   }
>   
> +#ifdef CONFIG_MODULES
>   static void orc_sort_swap(void *_a, void *_b, int size)
>   {
>   	struct orc_entry *orc_a, *orc_b;
> @@ -229,7 +230,6 @@ static int orc_sort_cmp(const void *_a, const void *_b)
>   	return orc_a->sp_reg == ORC_REG_UNDEFINED && !orc_a->end ? -1 : 1;
>   }
>   
> -#ifdef CONFIG_MODULES
>   void unwind_module_init(struct module *mod, void *_orc_ip, size_t orc_ip_size,
>   			void *_orc, size_t orc_size)
>   {

