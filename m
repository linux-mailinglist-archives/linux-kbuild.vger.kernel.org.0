Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 240B1320942
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Feb 2021 09:54:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbhBUIyZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 21 Feb 2021 03:54:25 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:51096 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbhBUIyV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Feb 2021 03:54:21 -0500
X-Greylist: delayed 335 seconds by postgrey-1.27 at vger.kernel.org; Sun, 21 Feb 2021 03:54:20 EST
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 11L8r0CO004841;
        Sun, 21 Feb 2021 17:53:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 11L8r0CO004841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613897581;
        bh=u37K3+qAwR0sUTzWOWIwPsO25Vh/vdCNmym9gGt+TM0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=1MzDHxMDnrEeNiUTmrhliQTe/oiWbM2HjMxw/DI2Ti3IvBcL0nuRrQNTYE4d0rgop
         GSrGJvilNhN8AWbCGTAY+5XFNRdSWzLAKVl60IxKDsFxxeoEPgsyFw+uScDy82NUxY
         WiRvcFLva5T9VsaXpPVKVpMjsqpm+WjLTy1HGQSRrZGetoHCyRcjbNWfwgidFR2nEe
         J/L3nD1jl7taB11DAHShYbLZ/RiTXP5NDpsKVwLADEsyF9Pf6ObPkZvzNQoFsH57SJ
         zP4ShjjIL5rzp8qmL5zA0c0XvrCTBIqnCMGp9t3SQgRuNAEFpt9I5KUNPSYpu5wQlK
         n+x6S2XcME8Uw==
X-Nifty-SrcIP: [209.85.215.175]
Received: by mail-pg1-f175.google.com with SMTP id n10so8181090pgl.10;
        Sun, 21 Feb 2021 00:53:01 -0800 (PST)
X-Gm-Message-State: AOAM530ID7HFA/k7EgdGKeqayy1Ak52D/+Bcon2xwjuG6TuGaFJIxBE8
        IPs3n9DX34eqZCSPA7DfFtwigOm5EpDYcjt8+L0=
X-Google-Smtp-Source: ABdhPJwCYDuoHAzYbJO1A2ugunCCef/tJuG6TpI0QILuNu4F4QtCv7Swfe+SSXIg/Yyz3udjxxuF6swSgyd6RWcHhZ0=
X-Received: by 2002:a63:34c9:: with SMTP id b192mr15845885pga.175.1613897580356;
 Sun, 21 Feb 2021 00:53:00 -0800 (PST)
MIME-Version: 1.0
References: <20210215181511.2840674-1-mic@digikod.net> <20210215181511.2840674-2-mic@digikod.net>
In-Reply-To: <20210215181511.2840674-2-mic@digikod.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 21 Feb 2021 17:52:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR+vDUg-_9LiasvpuJi2BqkNOz+ufNFErHL-nQrFTixeg@mail.gmail.com>
Message-ID: <CAK7LNAR+vDUg-_9LiasvpuJi2BqkNOz+ufNFErHL-nQrFTixeg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] kconfig: Remove duplicate call to sym_get_string_value()
To:     =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc:     James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Nicolas Iooss <nicolas.iooss@m4x.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 16, 2021 at 3:15 AM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> =
wrote:
>
> From: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
>
> Use the saved returned value of sym_get_string_value() instead of
> calling it twice.
>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
> Link: https://lore.kernel.org/r/20210215181511.2840674-2-mic@digikod.net
> ---


Applied to linux-kbuild. Thanks.



>  scripts/kconfig/conf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index db03e2f45de4..18a233d27a8d 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -137,7 +137,7 @@ static int conf_string(struct menu *menu)
>                 printf("%*s%s ", indent - 1, "", menu->prompt->text);
>                 printf("(%s) ", sym->name);
>                 def =3D sym_get_string_value(sym);
> -               if (sym_get_string_value(sym))
> +               if (def)
>                         printf("[%s] ", def);
>                 if (!conf_askvalue(sym, def))
>                         return 0;
> --
> 2.30.0
>


--=20
Best Regards
Masahiro Yamada
