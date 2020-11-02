Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC3A2A239C
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Nov 2020 04:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbgKBDlz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 1 Nov 2020 22:41:55 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:39611 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727461AbgKBDly (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 1 Nov 2020 22:41:54 -0500
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 0A23fTqi011088
        for <linux-kbuild@vger.kernel.org>; Mon, 2 Nov 2020 12:41:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 0A23fTqi011088
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1604288490;
        bh=yNJRBGTAq7Odtzod8U+nLm0OItNGRvmNlP2pO6gxjNY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=b15lUUepPjweMP0FmecBQlEHP4Pf/bLMrS/5WIkwoIj8kpZw6nDToq1+Ez2v/L2UE
         dMZHM6j06yvS4FPcy+xUhz9PKbhybblGiG9FeSzc6X5d+dhkIdnsB7zwZwthcxYMm2
         W0b7vCvw4c+PMEtYFSsRK7lH0RYZiAG3jCN0foJkOWgq6gITzd2COLoGUaik+yVFqW
         QQmvd97QLAexcGtvF4K9dkXX9/+RtsUePgRUADuDmMlLVjQBQtRH2xsi9tRGlfUMMe
         hrk+K1kwNtoSnSo2fzqJ5gwHFvSsxHuBpABnWZThYuIVDwa6og4IusUbesa58vcptm
         aXoMOjgI3gyUg==
X-Nifty-SrcIP: [209.85.210.173]
Received: by mail-pf1-f173.google.com with SMTP id z3so3516147pfz.6
        for <linux-kbuild@vger.kernel.org>; Sun, 01 Nov 2020 19:41:30 -0800 (PST)
X-Gm-Message-State: AOAM532oMm8dZbk+ilzFfRzaI1H4wMCin3vj94Bq/or4dwXK+83sKBZp
        g2GpUyvG+HIh2Qm1ZJMEjVO+8UiH717sXBJM9+0=
X-Google-Smtp-Source: ABdhPJysbG0ChYkt+kzHskpni7SnIDVIjrFtN7xEfKe2ArKwcquc1h2fRC7gYOEIXRQPZV/jkOJVVWhSqClP0ZsP5sE=
X-Received: by 2002:a17:90a:c209:: with SMTP id e9mr4358839pjt.87.1604288489546;
 Sun, 01 Nov 2020 19:41:29 -0800 (PST)
MIME-Version: 1.0
References: <20201029155152.2467-1-boris@codesynthesis.com> <20201029155152.2467-2-boris@codesynthesis.com>
In-Reply-To: <20201029155152.2467-2-boris@codesynthesis.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 2 Nov 2020 12:40:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNAShmEWzL8fen4A-rRfeRYpe_tOTr66rtsLnbRnXGg2wag@mail.gmail.com>
Message-ID: <CAK7LNAShmEWzL8fen4A-rRfeRYpe_tOTr66rtsLnbRnXGg2wag@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: make lkc.h self-sufficient #include-wise
To:     Boris Kolpackov <boris@codesynthesis.com>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 30, 2020 at 12:52 AM Boris Kolpackov
<boris@codesynthesis.com> wrote:
>
> Signed-off-by: Boris Kolpackov <boris@codesynthesis.com>
> ---
>  scripts/kconfig/lkc.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
> index 8454649..3e2c70e 100644
> --- a/scripts/kconfig/lkc.h
> +++ b/scripts/kconfig/lkc.h
> @@ -6,6 +6,10 @@
>  #ifndef LKC_H
>  #define LKC_H
>
> +#include <stdio.h>
> +#include <assert.h>
> +#include <stdlib.h>
> +
>  #include "expr.h"
>
>  #ifdef __cplusplus
> --
> 2.29.0
>

Applied to linux-kbuild.

-- 
Best Regards
Masahiro Yamada
