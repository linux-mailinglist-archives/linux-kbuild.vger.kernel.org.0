Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 010BD31066F
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Feb 2021 09:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbhBEIQ3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Feb 2021 03:16:29 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:34982 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbhBEIQ2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Feb 2021 03:16:28 -0500
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 1158FVrm015129;
        Fri, 5 Feb 2021 17:15:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 1158FVrm015129
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1612512931;
        bh=+466j/DCiKIThD/BdltYirFPy86aGxUTe/lVNI/SkZ0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=x4baPLwJ8gPMgXylHvH8SUqFkTsfFQI9JKph5lVyYWMPdzU5sX6bY7DIIPPxW1pym
         YjiSejcEwIghm1jF5eUGjW7qGjLBaqKWTA34sv+0rHf1h4KqC/JXmKWQQEqbVwGN8C
         Q7/4Kb9JnnCtf7Qvti0c4/iUrPL50EniXjgQ5j+vv5sE4dkzcOEkeiPk4AzJ2gs+rK
         7GP83pQHbaRq0wzmVEtW8nQYlcLwNJr7u7LDVIJDe9RMYkVTylin2+gpUnQf+BxIjB
         HmjRGIdlmY1pU/Udt8mp3DHkPL3ZJ1p5HB+txLna6HLuaVJhGKyIqLw7XjgCPyGMcZ
         mZuhAj4Yw1xDQ==
X-Nifty-SrcIP: [209.85.216.48]
Received: by mail-pj1-f48.google.com with SMTP id l18so3358371pji.3;
        Fri, 05 Feb 2021 00:15:31 -0800 (PST)
X-Gm-Message-State: AOAM531zE6J9T2vb9/h55FntLBQwnQrPApQ4jH3mNw1LDGlhdBUAIRPW
        gtp4SYl16yqsjlsh4ao/n8ZBFnaohiaTaBBpRQA=
X-Google-Smtp-Source: ABdhPJzXxIFsbTssin1UtFmmSm7ZCRaMX4ww/Sa2IRta+CnfpuWKelfFbb8sHCjIWFCP07XrAQW0KDtyud0N5iVKkEA=
X-Received: by 2002:a17:90a:184:: with SMTP id 4mr3057945pjc.87.1612512930722;
 Fri, 05 Feb 2021 00:15:30 -0800 (PST)
MIME-Version: 1.0
References: <20210204202054.1608664-1-sean.anderson@seco.com>
In-Reply-To: <20210204202054.1608664-1-sean.anderson@seco.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 5 Feb 2021 17:14:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNATi=4_ieMdi9OKXSF1yBiBDmtddG7ioYhre=hq988UePw@mail.gmail.com>
Message-ID: <CAK7LNATi=4_ieMdi9OKXSF1yBiBDmtddG7ioYhre=hq988UePw@mail.gmail.com>
Subject: Re: [PATCH] builddeb: Don't look for a missing Module.symvers
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 5, 2021 at 5:21 AM Sean Anderson <sean.anderson@seco.com> wrote=
:
>
> If deb-pkg is run with CONFIG_MODULES disabled, then make fails with
>
> find: =E2=80=98Module.symvers=E2=80=99: No such file or directory
> make[4]: *** [scripts/Makefile.package:87: intdeb-pkg] Error 1
> make[3]: *** [Makefile:1523: intdeb-pkg] Error 2
> make[2]: *** [debian/rules:9: binary-arch] Error 2
>
> Only add it to headerobjfiles if we actually have modules.
>
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---


I do not see this error any more after
the following commit was merged.


commit bac977cbc0d6731fb8e67c2be0e4acbd959e10b3
Author: Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed Oct 14 03:38:19 2020 +0900

    kbuild: deb-pkg: do not build linux-headers package if CONFIG_MODULES=
=3Dn







>  scripts/package/builddeb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 91a502bb97e8..19d44704832b 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -71,7 +71,11 @@ deploy_kernel_headers () {
>                         echo tools/objtool/objtool
>                 fi
>
> -               find arch/$SRCARCH/include Module.symvers include scripts=
 -type f
> +               if is_enabled CONFIG_MODULES; then
> +                       echo Module.symvers
> +               fi
> +
> +               find arch/$SRCARCH/include include scripts -type f
>
>                 if is_enabled CONFIG_GCC_PLUGINS; then
>                         find scripts/gcc-plugins -name \*.so
> --
> 2.25.1
>


--=20
Best Regards
Masahiro Yamada
