Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 544E0374738
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 May 2021 19:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235137AbhEERvl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 5 May 2021 13:51:41 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:51277 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235437AbhEERux (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 May 2021 13:50:53 -0400
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 145HnT4c026749;
        Thu, 6 May 2021 02:49:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 145HnT4c026749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1620236970;
        bh=nSV7YvY1jsh1RlgXEamC+ihQwA3aUn1iY974kTqUP1g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JTOstHlAyQTcU14RFxSdyVJvqQPTkaxJtbov5rOXAktzCihRXgnVKUax6P0FtcFEr
         HuQesNpnXRlESMgW+RBTvM9DJUNboDLmayDUR7s0xXZu9vGka6cWMAoJaVQs/AklJf
         fYSoFMNWj6prIgJUXSbYEcPCozyq8Mw/0Ub1y/K6lN+L3DeQuNVKAAs94509FIgDuF
         GLElzRPq6B3w8VQF8wzi7N/vSkDTvFsWfz59BVGEJU0jyJJLHaEtXge7dAVju+/kjy
         26iI/eCUmIU9PTX+R2yhXqhTiyNDmYGlobaFwEwwoJjldbDKVeC/WqP9v68XJRs0L+
         VfaYH0QgAljEg==
X-Nifty-SrcIP: [209.85.210.181]
Received: by mail-pf1-f181.google.com with SMTP id k19so2561411pfu.5;
        Wed, 05 May 2021 10:49:29 -0700 (PDT)
X-Gm-Message-State: AOAM530pGrNNF+Ygr7BmRn/HFOTqMFcCqRW80YWqIzsSG2MxGl+Q0T2f
        MIk5l1U3eu/z0g6P7fqaGSywJ75LU0RsWVDE6Ro=
X-Google-Smtp-Source: ABdhPJyRgIzrnThPyMguFQ6fr8HsV+NGzV2n1EhNAOfpLnWjJLf811XhMf2jP2brZcxdIY7tJazgWPKjBIEMLd9i7Xw=
X-Received: by 2002:aa7:94af:0:b029:28e:80ff:cc1d with SMTP id
 a15-20020aa794af0000b029028e80ffcc1dmr18610673pfl.63.1620236968427; Wed, 05
 May 2021 10:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210425062407.1183801-1-masahiroy@kernel.org>
In-Reply-To: <20210425062407.1183801-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 6 May 2021 02:48:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNARq4+uU0OZgn9ZjLaD960B-VH65k7CHHW0fqnK8S4CP4g@mail.gmail.com>
Message-ID: <CAK7LNARq4+uU0OZgn9ZjLaD960B-VH65k7CHHW0fqnK8S4CP4g@mail.gmail.com>
Subject: Re: [PATCH 1/5] kernel/.gitgnore: remove stale timeconst.h and hz.bc
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Apr 25, 2021 at 3:24 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> timeconst.h and hz.bc used to exist in kernel/.
>
> Commit 5cee96459726 ("time/timers: Move all time(r) related files into
> kernel/time") moved them to kernel/time/.
>
> Commit 0a227985d4a9 ("time: Move timeconst.h into include/generated")
> moved timeconst.h to include/generated/ and removed hz.bc .
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.


>
>  kernel/.gitignore | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/kernel/.gitignore b/kernel/.gitignore
> index 78701ea37c97..4abc4e033ed8 100644
> --- a/kernel/.gitignore
> +++ b/kernel/.gitignore
> @@ -1,4 +1,2 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  kheaders.md5
> -timeconst.h
> -hz.bc
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
