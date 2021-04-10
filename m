Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D39C935AF77
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Apr 2021 20:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234831AbhDJSOH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Apr 2021 14:14:07 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:18800 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234738AbhDJSOG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Apr 2021 14:14:06 -0400
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 13AIDH0F031302;
        Sun, 11 Apr 2021 03:13:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 13AIDH0F031302
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618078398;
        bh=cMZNclGALT+gwxP7KWLDLy4Do1QRPGwcKNQy7ss3r4g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ChZg8qEvcPl1LAm/6WlaUFUizv2zl+NHFsESD2Bra0GcZpCAF/XOG6khq9Y64aa/z
         o4q+ax6RLAs1rWOOCGELXHPWaL45k0EiEn81301K4yT170K+UBy7u4MHVaAR3lapJ5
         bXHXdfdST2Pt0qqmzYaRpRUnfsmIsIcHNQ0GWN6A4wksAXZujX7iW/Gb1IMK6bO054
         yNnxFs2fbTC5KiEiJm3RMpQXR2JCKfrt/a4ZId5Z3o48rDMNYEGVYzWTk1dC6Qjrsv
         Wva4oH1n2eDt8t8q7uZRFjgJ6BP2qDnuz0uWlHACrsJlkNZR1D+Asy3pU3tvxxropU
         gowQLvOqBZJJQ==
X-Nifty-SrcIP: [209.85.216.50]
Received: by mail-pj1-f50.google.com with SMTP id u14-20020a17090a1f0eb029014e38011b09so4612pja.5;
        Sat, 10 Apr 2021 11:13:18 -0700 (PDT)
X-Gm-Message-State: AOAM530Z0pN73N7zEqpmf9aaUzs1ajZpfGiWOYuuaYkb9AtsBoAXUU2d
        tVgz1ZEMfTHGIMGZZCblYYo7GIgweS1yOn7s82A=
X-Google-Smtp-Source: ABdhPJyX1Dw6EitIA7ZNbc36JtuPnbwn3qlR4jpRQekNXt9qf2kYu+xcisS7Urq0/P9Zk5MZNc8sxWNnLBAWQdt+oVo=
X-Received: by 2002:a17:902:d645:b029:e8:ec90:d097 with SMTP id
 y5-20020a170902d645b02900e8ec90d097mr18473712plh.47.1618078397260; Sat, 10
 Apr 2021 11:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <f6218ac526a04fa4d4406f935bcc4eb4a7df65c4.1617917438.git.msuchanek@suse.de>
In-Reply-To: <f6218ac526a04fa4d4406f935bcc4eb4a7df65c4.1617917438.git.msuchanek@suse.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 11 Apr 2021 03:12:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR-zdHLpp7eQ_PUG6PQMKUKh2m0b80NGSxnxuXhjyT=3g@mail.gmail.com>
Message-ID: <CAK7LNAR-zdHLpp7eQ_PUG6PQMKUKh2m0b80NGSxnxuXhjyT=3g@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: dummy-tools: Add elfedit.
To:     Michal Suchanek <msuchanek@suse.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 9, 2021 at 6:31 AM Michal Suchanek <msuchanek@suse.de> wrote:
>
> elfedit is used in Makefile
>
>  Makefile:GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
>
> which causes this error getting printed
>
>  which: no elfedit in (./scripts/dummy-tools)


I am OK with this patch, but how did you reproduce it?




>
> Add elfedit to dummy-tools to avoid this error.
>
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
>  scripts/dummy-tools/elfedit | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 120000 scripts/dummy-tools/elfedit
>
> diff --git a/scripts/dummy-tools/elfedit b/scripts/dummy-tools/elfedit
> new file mode 120000
> index 000000000000..c0648b38dd42
> --- /dev/null
> +++ b/scripts/dummy-tools/elfedit
> @@ -0,0 +1 @@
> +ld
> \ No newline at end of file
> --
> 2.26.2
>


-- 
Best Regards
Masahiro Yamada
