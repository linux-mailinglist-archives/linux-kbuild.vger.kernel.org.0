Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABEA21EA260
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 13:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbgFALCd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 07:02:33 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:36892 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbgFALCc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 07:02:32 -0400
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 051B1vMN023247
        for <linux-kbuild@vger.kernel.org>; Mon, 1 Jun 2020 20:01:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 051B1vMN023247
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1591009318;
        bh=2A8BiQ2C6m8mmQHoEiI+viGJtBzaIt7jwl52ER4RNZc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TxbTZ81iyqWHi+WSdlmeJqAvrua9r1og7wZQLRwA3yFhvqpydXp8Gu8AFma3aHhVm
         2ae1q5+r1gnsMBtqg7CF80SBVvREmbz4ygKGMETZ033g1XAIxy532I6JYL9uSyK/Ry
         1Maqvj4W8I6IFVaA+CtjVyb2zyFTb9nvpl5rf22019zzZiRfMgiq3BWul/YRNrcpm1
         P8UgFQpqYb3skl1pOuKRazoYf/AxnB4yJ5+V3XMi0j4PrhfkeW4OcTdTFFtYGGShfz
         /TnK6Ld/NPYDi46P8menUCNjNZR+boMwWqXwmZGKJHUtOJ/7hvNEKDsqGiiMDeo/ap
         xVXy2OZ7I5nhA==
X-Nifty-SrcIP: [209.85.222.41]
Received: by mail-ua1-f41.google.com with SMTP id w20so3184238uaa.2
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Jun 2020 04:01:57 -0700 (PDT)
X-Gm-Message-State: AOAM530wYn//ujjokT44BujKNW5Fu8GyMSnJeD4tIWT6Oxg7Cca3l/gp
        1GDykraYV8Mb/Tzd9efcSzn7EkMlrRInN+qikEQ=
X-Google-Smtp-Source: ABdhPJybXbyp5oQGsb1N9ajYnfBghU9oC5Stlgx389RP1r28blfT6MVsyBLazY7Frl/QhKVPtFRrOJL5xRH+uSZX5gM=
X-Received: by 2002:ab0:7313:: with SMTP id v19mr14034880uao.121.1591009316621;
 Mon, 01 Jun 2020 04:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <1590920904-60002-1-git-send-email-alios_sys_security@linux.alibaba.com>
In-Reply-To: <1590920904-60002-1-git-send-email-alios_sys_security@linux.alibaba.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 1 Jun 2020 20:01:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS290zRibWqbu1AxQ1W9afPR21OYSia+xkqwoot9zRd2w@mail.gmail.com>
Message-ID: <CAK7LNAS290zRibWqbu1AxQ1W9afPR21OYSia+xkqwoot9zRd2w@mail.gmail.com>
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


You are right, but please avoid the interrogatory sentence.

Shall I reword as follows?


The original intent should be to filter out all local symbols
starting with '.L', so the dot should be escaped.





>
> [1]. mksysmap: Add h8300 local symbol pattern
>
> Signed-off-by: AliOS system security <alios_sys_security@linux.alibaba.com>
> ---
>  scripts/mksysmap | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/mksysmap b/scripts/mksysmap
> index a35acc0..9aa23d1 100755
> --- a/scripts/mksysmap
> +++ b/scripts/mksysmap
> @@ -41,4 +41,4 @@
>  # so we just ignore them to let readprofile continue to work.
>  # (At least sparc64 has __crc_ in the middle).
>
> -$NM -n $1 | grep -v '\( [aNUw] \)\|\(__crc_\)\|\( \$[adt]\)\|\( .L\)' > $2
> +$NM -n $1 | grep -v '\( [aNUw] \)\|\(__crc_\)\|\( \$[adt]\)\|\( \.L\)' > $2
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
