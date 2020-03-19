Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB68718AE33
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2020 09:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgCSIQD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Mar 2020 04:16:03 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:58816 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727014AbgCSIQD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Mar 2020 04:16:03 -0400
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 02J8FtlK011028
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Mar 2020 17:15:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 02J8FtlK011028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1584605756;
        bh=tRaRYCa+I5NGfhdtCP46IcnjdheIQectFyEVwKEcAg4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nw232Ihop7KigQUlfHzgif8CK5ReZUh1ArOCCSv+6h5Dqmp0yycbi4Mfjk00Va/TG
         E0i11cS/xtLXvgkzZKbTYS9BNG5EsczOOnXEqobyXO8c4JzLoUxH//koyR5Xc9lulx
         EwrjP3CVprTkwSrBAjbEsn6aJIVxQXWvf7IktpxzEkZvZY6G/atzXLpBPZYjxV4UWg
         CoKbiyd5kkIO1k1z8EdErRAh4hxGxuzrQPcMCKynWzSybLLuvfB4TbEIDPzYt/I7f7
         Zh4Q4OH75LU0U+qEaTs2YSPRjrnRCQ+NKjSjqATzTK1TRA1Olae8phMOOzAJEPgeLj
         aoiMmn5gn+HrA==
X-Nifty-SrcIP: [209.85.221.175]
Received: by mail-vk1-f175.google.com with SMTP id q8so464976vka.8
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Mar 2020 01:15:56 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2/G6BL0owzncp1JC/tCMXhhP+HzrZSz0Ze19Oz+UZMfDrvIi/O
        a8zgiAhe2OqaXKi6FGIvPo3TdBqGc2EEt0/bwdI=
X-Google-Smtp-Source: ADFU+vsALxsOnVyjXCXtSvGp/PakmoBIDf1u1Wo7HNgKMpO+iRWaZzW7FyCbhETxYAJ9PD+XTP6vOhXa/Mk8xF/gpIM=
X-Received: by 2002:a1f:32cf:: with SMTP id y198mr1493218vky.96.1584605755219;
 Thu, 19 Mar 2020 01:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <306f76fc-c445-6578-d4fe-5e462861920c@mir.dev>
In-Reply-To: <306f76fc-c445-6578-d4fe-5e462861920c@mir.dev>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 19 Mar 2020 17:15:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNASO=52Vr+agnxBqAGDBcZeYF1q4xYiiSZaDQsviD4kp4g@mail.gmail.com>
Message-ID: <CAK7LNASO=52Vr+agnxBqAGDBcZeYF1q4xYiiSZaDQsviD4kp4g@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/kallsyms: fix wrong kallsyms_relative_base
To:     Mikhail Petrov <Mikhail.Petrov@mir.dev>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 12, 2020 at 5:37 AM Mikhail Petrov <Mikhail.Petrov@mir.dev> wrote:
>
> There is the code in the read_symbol function in 'scripts/kallsyms.c':
>
>         if (is_ignored_symbol(name, type))
>                 return NULL;
>
>         /* Ignore most absolute/undefined (?) symbols. */
>         if (strcmp(name, "_text") == 0)
>                 _text = addr;
>
> But the is_ignored_symbol function returns true for name="_text" and
> type='A'. So the next condition is not executed and the _text variable
> is always zero.
>
> It makes the wrong kallsyms_relative_base symbol as a result of the code
> (CONFIG_KALLSYMS_BASE_RELATIVE is defined):
>
>         if (base_relative) {
>                 output_label("kallsyms_relative_base");
>                 output_address(relative_base);
>                 printf("\n");
>         }
>
> Because the output_address function uses the _text variable.
>
> So the kallsyms_lookup function and all related functions in the kernel
> do not work properly. For example, the stack trace in oops:
>
>  Call Trace:
>  [aa095e58] [809feab8] kobj_ns_ops_tbl+0x7ff09ac8/0x7ff1c1c4 (unreliable)
>  [aa095e98] [80002b64] kobj_ns_ops_tbl+0x7f50db74/0x80000010
>  [aa095ef8] [809c3d24] kobj_ns_ops_tbl+0x7feced34/0x7ff1c1c4
>  [aa095f28] [80002ed0] kobj_ns_ops_tbl+0x7f50dee0/0x80000010
>  [aa095f38] [8000f238] kobj_ns_ops_tbl+0x7f51a248/0x80000010
>
> The right stack trace:
>
>  Call Trace:
>  [aa095e58] [809feab8] module_vdu_video_init+0x2fc/0x3bc (unreliable)
>  [aa095e98] [80002b64] do_one_initcall+0x40/0x1f0
>  [aa095ef8] [809c3d24] kernel_init_freeable+0x164/0x1d8
>  [aa095f28] [80002ed0] kernel_init+0x14/0x124
>  [aa095f38] [8000f238] ret_from_kernel_thread+0x14/0x1c
>
> Signed-off-by: Mikhail Petrov <Mikhail.Petrov@mir.dev>



Applied with the following info:

[masahiroy@kernel.org
This issue happens on binutils <= 2.22
The following commit fixed it:
https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d2667025dd30611514810c28bee9709e4623012a

The symbol type is 'T' on binutils >= 2.23
The current minimal supported binutils version is 2.21
]



Thanks.



> ---
>
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index 0133dfaaf352..3e8dea6e0a95 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -195,13 +195,13 @@ static struct sym_entry *read_symbol(FILE *in)
>                 return NULL;
>         }
>
> -       if (is_ignored_symbol(name, type))
> -               return NULL;
> -
> -       /* Ignore most absolute/undefined (?) symbols. */
>         if (strcmp(name, "_text") == 0)
>                 _text = addr;
>
> +       /* Ignore most absolute/undefined (?) symbols. */
> +       if (is_ignored_symbol(name, type))
> +               return NULL;
> +
>         check_symbol_range(name, addr, text_ranges, ARRAY_SIZE(text_ranges));
>         check_symbol_range(name, addr, &percpu_range, 1);
>


--
Best Regards
Masahiro Yamada
