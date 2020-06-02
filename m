Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C77541EB326
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2020 03:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgFBBvh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 21:51:37 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:36414 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbgFBBvg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 21:51:36 -0400
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0521pDHp029563
        for <linux-kbuild@vger.kernel.org>; Tue, 2 Jun 2020 10:51:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0521pDHp029563
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1591062674;
        bh=FNDz1auD6V6DS09BAXdMW0RI0SzkdV2z6MoK5g+q/sw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OA0JnAnUpiwNW7YrFf7P+JF7Q/b9tixuB9ffuZP4RcEmYzievgaIsxk0BZ8Ojini7
         8NfsyWDkyJKzDg/BdZmS3mlYT9nXcPepbYWaRyhhc5TmtKPllsHyn5H/4aJJbvtWzE
         m/8CovvvCLZeD98s9ETcpnVTblLfFwUvj8IxvHpjC541PpEWkGLkBsmawJxCF79/3a
         r5N3xgSmDpZHxuuZXB8hjLT+/pDdI7QpCd0HGg5scM9kHMldhIbALpd27vbxOFHKek
         MYUaxe1FuPhnSQX6r0LP+woqWcBZJrzLZ1CQX9Vy3QUyiTivXsE9/bIUhPsAQumf3L
         /HHfDLG8+5JbQ==
X-Nifty-SrcIP: [209.85.221.172]
Received: by mail-vk1-f172.google.com with SMTP id f126so499794vkb.13
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Jun 2020 18:51:14 -0700 (PDT)
X-Gm-Message-State: AOAM533rgBwHQEhDzB0BnDPhAoL1rKgs/YC0txsvtyP3lmFHvuJANVAN
        hl47rr//Rd/X/i/tukzRpXicafhoRJ3R1kz4rDc=
X-Google-Smtp-Source: ABdhPJzahFP+JcHNbtSPHkr/ynKKuZi+L048sKVsB31HKWiIcaorluYcPspA7QZHNVqvGYJLUTIVkppl5SA2el8ufjc=
X-Received: by 2002:a1f:a906:: with SMTP id s6mr14647474vke.26.1591062673079;
 Mon, 01 Jun 2020 18:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <1590920904-60002-1-git-send-email-alios_sys_security@linux.alibaba.com>
In-Reply-To: <1590920904-60002-1-git-send-email-alios_sys_security@linux.alibaba.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 2 Jun 2020 10:50:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNATDKUbtJPNuFtbBTd2sg3=Fn_E_fq_9VP0oK1BT7mo0KA@mail.gmail.com>
Message-ID: <CAK7LNATDKUbtJPNuFtbBTd2sg3=Fn_E_fq_9VP0oK1BT7mo0KA@mail.gmail.com>
Subject: Re: [PATCH] mksysmap: Fix the mismatch of '.L' symbols in System.map
To:     AliOS system security <alios_sys_security@linux.alibaba.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 31, 2020 at 7:28 PM AliOS system security
<alios_sys_security@linux.alibaba.com> wrote:
>
> When System.map was generated, the kernel used mksysmap to filter the
> kernel symbols, but all the symbols with the second letter 'L' in the
> kernel were filtered out, not just the symbols starting with 'dot + L'.
>
> For example:
> ashimida@ubuntu:~/linux$ cat System.map |grep ' .L'
> ashimida@ubuntu:~/linux$ nm -n vmlinux |grep ' .L'
> ffff0000088028e0 t bLength_show
> ......
> ffff0000092e0408 b PLLP_OUTC_lock
> ffff0000092e0410 b PLLP_OUTA_lock
>
> I see that in the original patch[1], the original intent should be to
> filter all local symbols starting with '.L', so I wonder if the code
> here may add a '\' before '.L'?
>
> [1]. mksysmap: Add h8300 local symbol pattern
>
> Signed-off-by: AliOS system security <alios_sys_security@linux.alibaba.com>


I think you should submit this patch
with your real name instead of
the team name.




-- 
Best Regards
Masahiro Yamada
