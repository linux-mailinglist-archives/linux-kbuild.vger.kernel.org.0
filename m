Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2D335B44D
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Apr 2021 14:39:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235310AbhDKMjr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 11 Apr 2021 08:39:47 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:39574 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbhDKMjr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Apr 2021 08:39:47 -0400
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 13BCdHBS028125;
        Sun, 11 Apr 2021 21:39:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 13BCdHBS028125
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618144757;
        bh=noTZWh4woocoSkvFec5Yy1Di/OLeNa5KJOE1I4yS2sY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HSnpEIN5QxNoNgBLgJ0GVvoh38HlulN+lk/kVlrA1WlDGoMxnfiXlfsa+irdNo7rP
         1ZgNfik6iyBnoQUnByjwCDwE2CJTSNSGuUb9gspOG8dDWtYEUGZ4fOHehrs11jggvv
         gFggMS6R218lf4VyXbZIueob9zba2RbMeKfCDD9xjOg+//lgXwSJwWSngj9vypWQXY
         GwsqF57VNWy7ngh/Vj7JTPzz6Nui66Kvk+RXIaa5MxUPdllHlxFCABTMeVMdj54EMU
         hv5KLVdalfFmGTGTt8cboI3xxlrdQUa1uEhKoUvVEjanqsid07QyrS0h9bSOvl/RgO
         V4vklu5IiEoVA==
X-Nifty-SrcIP: [209.85.215.176]
Received: by mail-pg1-f176.google.com with SMTP id h25so7265714pgm.3;
        Sun, 11 Apr 2021 05:39:17 -0700 (PDT)
X-Gm-Message-State: AOAM531zbI34WV9I0kTg6lzXobKtfUuhxxgc3aLfRe/pWjM4zHIa/jJg
        QzcOZbne8jRgDIggz0z107ia7EiXD6A2+M3YXP4=
X-Google-Smtp-Source: ABdhPJzTsCiahaDe7DD1NYRlUlSm1zmYl7UzW985Jxemp4EBqHvEnFFu93m15STC/xrYUG9xUIyXbH/IYfUHbeLwqc4=
X-Received: by 2002:a05:6a00:2303:b029:249:b91e:72f0 with SMTP id
 h3-20020a056a002303b0290249b91e72f0mr5753393pfh.80.1618144756513; Sun, 11 Apr
 2021 05:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <f6218ac526a04fa4d4406f935bcc4eb4a7df65c4.1617917438.git.msuchanek@suse.de>
 <04385380bee4847a8541c35418ff266b82d9cc13.1617917438.git.msuchanek@suse.de>
In-Reply-To: <04385380bee4847a8541c35418ff266b82d9cc13.1617917438.git.msuchanek@suse.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 11 Apr 2021 21:38:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNARLXZonwDp=nfYt4maJ0cdoErkREZzwY0Hd6-cKZ=Pd9A@mail.gmail.com>
Message-ID: <CAK7LNARLXZonwDp=nfYt4maJ0cdoErkREZzwY0Hd6-cKZ=Pd9A@mail.gmail.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: add pattern for dummy-tools.
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
> scripts/get_maintainer.pl does not find a maintainer for new files
> otherwise.
>
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---

Applied to linux-kbuild. Thanks.


>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c80ad735b384..ce631ec44e1a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9690,6 +9690,7 @@ F:        scripts/*vmlinux*
>  F:     scripts/Kbuild*
>  F:     scripts/Makefile*
>  F:     scripts/basic/
> +F:     scripts/dummy-tools/
>  F:     scripts/mk*
>  F:     scripts/mod/
>  F:     scripts/package/
> --
> 2.26.2
>


-- 
Best Regards
Masahiro Yamada
