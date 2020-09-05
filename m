Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1D0125E91E
	for <lists+linux-kbuild@lfdr.de>; Sat,  5 Sep 2020 18:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728378AbgIEQrs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 5 Sep 2020 12:47:48 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:34155 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbgIEQrn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Sep 2020 12:47:43 -0400
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 085GlJOk000457;
        Sun, 6 Sep 2020 01:47:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 085GlJOk000457
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1599324440;
        bh=WR0bUM9T7LXFMSFmz2BS4Q5V6eLhM2TfOjWdlYyHYy0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BGLB/Gh4BxIyd3MXGwO/D729tqd8QTQIW41sN2YyTXq+KM2cQupv5Bx6vLPJKe3MZ
         N1kiNI3kX5tO3/qVewo2VJSOZlgLFEmCLIyaqTNwpoGv+7h7FX7ljrbAApRvlvAKxK
         1yF1V90ZMlL6W5IaNO2d8/kNgoJ1fuNYqBXHUfLgsi3qiJv68nn/rIwrdEi5eNV3LB
         8DjZyTx6Uk9ckHe5ivqwYys1thQritnd5OjfGTZx6DfKfxQa95wN7CJmVzt1rBx0NU
         OT4ZwnsptCXQnlvheUHri4cSERQsw9k7G2i3W8A0chiPoqTgiQPDXT+xPlfSQun2AF
         xTiEdLhtftZzw==
X-Nifty-SrcIP: [209.85.216.45]
Received: by mail-pj1-f45.google.com with SMTP id 2so4617016pjx.5;
        Sat, 05 Sep 2020 09:47:19 -0700 (PDT)
X-Gm-Message-State: AOAM5335dP9JW4CKwtpK2AlQdfLeLfvhFQjt/e7vIc3ZQRHeRiLJQe1d
        tcWm0DbMIr1z+L44F12gV8Oj6ojCwmO8pY1PJzQ=
X-Google-Smtp-Source: ABdhPJzJmsShrbOUEJxOxuAXOyM95frh8L0q+IG67LzJ2hNAXX4+/c3IOYdKUPYByAuCYZhqyfRzuHJcsRuA8CQ30ks=
X-Received: by 2002:a17:902:b60d:: with SMTP id b13mr13657520pls.48.1599324439018;
 Sat, 05 Sep 2020 09:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200904201258.795438-1-efremov@linux.com> <20200904201258.795438-3-efremov@linux.com>
In-Reply-To: <20200904201258.795438-3-efremov@linux.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 6 Sep 2020 01:46:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR4W1=BcaV9N-6PXUTQB65cDRm_k2WOgXFic+DOj+DXTA@mail.gmail.com>
Message-ID: <CAK7LNAR4W1=BcaV9N-6PXUTQB65cDRm_k2WOgXFic+DOj+DXTA@mail.gmail.com>
Subject: Re: [PATCH 2/2] csky: Drop GZFLAGS definition
To:     Denis Efremov <efremov@linux.com>
Cc:     Guo Ren <guoren@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-csky@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 5, 2020 at 5:14 AM Denis Efremov <efremov@linux.com> wrote:
>
> Drop the definition of GZFLAGS because it's not used.
>
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
>  arch/csky/Makefile | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/csky/Makefile b/arch/csky/Makefile
> index 37f593a4bf53..715b839bf998 100644
> --- a/arch/csky/Makefile
> +++ b/arch/csky/Makefile
> @@ -1,6 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  OBJCOPYFLAGS           :=-O binary
> -GZFLAGS                        :=-9



Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>




>  ifdef CONFIG_CPU_HAS_FPU
>  FPUEXT = f
> --
> 2.26.2
>


-- 
Best Regards
Masahiro Yamada
