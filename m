Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F61B181064
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2020 07:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgCKGHM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Mar 2020 02:07:12 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:62943 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbgCKGHM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Mar 2020 02:07:12 -0400
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 02B673Bu028416
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Mar 2020 15:07:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 02B673Bu028416
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1583906824;
        bh=9N9Y5sJTikYf5ukH0YyMGV4hMZypLsfAeRdTRFCzvLE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=r6TE7qhSznpwhBmWk7vdaHRtij6BTxrcZ3ci+ExFWgJPvUvstLVgjWtNg2P6seaY7
         bDab8litNfTgaKOUaiQDAZlZqqJi+qDKcHX0nEwmgXr4rf/VaSV+UqdgoZnTX4Mwol
         81KyEMpGNNBXAuxtW+CwuTJTvrr7eFFqjut4Z2ycXXLIBow4WwxaS8IvWWM9BrXY0o
         S8b3pI4gFD3WPHkOUOZ8E9VHab9AsbXSaIo7AnwyS+xZw940a/epYPC2Gh2SMzR/40
         2gwTkEeQLaWyApCcpRiGS6oXfPajAalYuG2+hFysrvaVETsSnk4DQl3iw0/IyFTAtB
         ZH4jXonzktygQ==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id n6so581307vsc.3
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2020 23:07:04 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2WKhaNSGqh5u+G71VuTj5ir8cDxll/ZB6MHLmEAzSo9vm9b/VA
        nXWZyLIuRi1DI8zwzXgQXkYAoEyHkyDSvBhKmPA=
X-Google-Smtp-Source: ADFU+vtoabjQiHvtNqcMrnRFxkYxEb5rF9kfWJXo0hAtqfPjDe0O6dY+/f1IfU+Mw6r4P4C/A9/XwnxnTX+Sx9FHyTk=
X-Received: by 2002:a67:f8d1:: with SMTP id c17mr968543vsp.179.1583906822909;
 Tue, 10 Mar 2020 23:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <da22e0ac-8da8-8a16-e8dd-b7065752cb4d@mir.dev>
In-Reply-To: <da22e0ac-8da8-8a16-e8dd-b7065752cb4d@mir.dev>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 11 Mar 2020 15:06:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNASput9F2XhAi4NUT7jx1z+-mSJXUDnqCfKGtXq_SNbohQ@mail.gmail.com>
Message-ID: <CAK7LNASput9F2XhAi4NUT7jx1z+-mSJXUDnqCfKGtXq_SNbohQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/kallsyms: fix wrong kallsyms_relative_base with CONFIG_KALLSYMS_BASE_RELATIVE
To:     Mikhail Petrov <Mikhail.Petrov@mir.dev>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Mikhail,

On Wed, Mar 11, 2020 at 5:34 AM Mikhail Petrov <Mikhail.Petrov@mir.dev> wrote:
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
> But the is_ignored_symbol function returns true for name="_text" and type='a'. So the next condition is not executed and the _text variable is always zero.
>
> It makes the wrong kallsyms_relative_base symbol as a result of the code:
>
>         if (base_relative) {
>                 output_label("kallsyms_relative_base");
>                 output_address(relative_base);
>                 printf("\n");
>         }
>
> Because the output_address function uses the _text variable.
>
> So the kallsyms_lookup function and all related functions in the kernel do not work properly. For example, the stack trace in oops:
>
>         Call Trace:
>         [aa095e58] [809feab8] kobj_ns_ops_tbl+0x7ff09ac8/0x7ff1c1c4 (unreliable)
>         [aa095e98] [80002b64] kobj_ns_ops_tbl+0x7f50db74/0x80000010
>         [aa095ef8] [809c3d24] kobj_ns_ops_tbl+0x7feced34/0x7ff1c1c4
>         [aa095f28] [80002ed0] kobj_ns_ops_tbl+0x7f50dee0/0x80000010
>         [aa095f38] [8000f238] kobj_ns_ops_tbl+0x7f51a248/0x80000010
>
> The right stack trace:
>
>         Call Trace:
>         [aa095e58] [809feab8] module_vdu_video_init+0x2fc/0x3bc (unreliable)
>         [aa095e98] [80002b64] do_one_initcall+0x40/0x1f0
>         [aa095ef8] [809c3d24] kernel_init_freeable+0x164/0x1d8
>         [aa095f28] [80002ed0] kernel_init+0x14/0x124
>         [aa095f38] [8000f238] ret_from_kernel_thread+0x14/0x1c
>
> Signed-off-by: Mikhail Petrov <Mikhail.Petrov@mir.dev>
>
> ---


Thanks for the patch.

Just for curiosity, on which architecrure
did you see  name="_text" and type='a' case ?


Could you wrap the commit log to avoid
this checkpatch warning?
WARNING: Possible unwrapped commit description (prefer a maximum 75
chars per line)


Also, could you shorten the patch subject
to make it fit in this limit?

Thanks.


-- 
Best Regards
Masahiro Yamada
