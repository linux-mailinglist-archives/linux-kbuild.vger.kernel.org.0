Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FAA118B3C
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2019 16:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbfEIOJC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 May 2019 10:09:02 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:26127 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbfEIOJC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 10:09:02 -0400
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x49E8mVK014119;
        Thu, 9 May 2019 23:08:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x49E8mVK014119
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557410929;
        bh=EZMLary+S+9G6cLchLp//JUrbW4OA+W27VKESK3gpQQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mOhCkhFl5O8yiIT+wwl0Y92WkVEr496DrkVp96FpOjHU+bVqIEhGzEBJAKz477626
         REEq0wRshE0LNDOq+e40XhyHP5Uxu9TUZT2fDHSawEHhyh9F6yKNe1QsEMZg8se4Fg
         8hq+gaxSNRblDwzAzbLI6rCfFaWB+0kxbOrahHkKkz3TF8WAVO6YlyYCigEfD/rtXU
         dRLfwPj80JvcmojwnWptihjUPX3e6p8LuQ08PHBV4IZSktNPShrJ6PSqvSsjjHcWrh
         QNmGn6WJh/SNI3JByG7726vOALdFvnWosyvoaZVl/cmZoWyeeEXA0SqltXLocLdD5y
         Ey2mL/VmTjJQA==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id o10so1467280vsp.12;
        Thu, 09 May 2019 07:08:48 -0700 (PDT)
X-Gm-Message-State: APjAAAVHDx3AEvOARZwSKvJ9KmQN5iX0YgnWn93ah/3RCY0b9BCK0xmE
        MCYJNR+mURXSaGJDC5O6HPUFCxJ3SkhEX75MmHw=
X-Google-Smtp-Source: APXvYqyXqKJ3SsM3Ps8XtfCp7GyYivlSpdHI1xek9RndBNDO1WT3kBOSIoE8oM8e7mGqFya2uRNXk1RdUg629T6kvyw=
X-Received: by 2002:a67:f109:: with SMTP id n9mr2198293vsk.181.1557410927513;
 Thu, 09 May 2019 07:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <1557146820-13059-1-git-send-email-krzk@kernel.org>
In-Reply-To: <1557146820-13059-1-git-send-email-krzk@kernel.org>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 9 May 2019 23:08:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNATFKHmgi+7LktGJg9FRJr3BoZb=r+OdPE4rf=q1WE0j3g@mail.gmail.com>
Message-ID: <CAK7LNATFKHmgi+7LktGJg9FRJr3BoZb=r+OdPE4rf=q1WE0j3g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: kbuild: Add pattern for scripts/*vmlinux*
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 6, 2019 at 9:47 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> scripts/link-vmlinux.sh is part of kbuild so extend the pattern to match
> any vmlinux related scripts.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to linux-kbuild.

Thanks.


> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c61c49dd3643..aa0a61c7736b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8523,6 +8523,7 @@ F:        scripts/Kbuild*
>  F:     scripts/Makefile*
>  F:     scripts/basic/
>  F:     scripts/mk*
> +F:     scripts/*vmlinux*
>  F:     scripts/mod/
>  F:     scripts/package/
>
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
