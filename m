Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3A2726A5D
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jun 2023 22:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjFGUGQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Jun 2023 16:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjFGUGP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Jun 2023 16:06:15 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D57C5E2
        for <linux-kbuild@vger.kernel.org>; Wed,  7 Jun 2023 13:06:10 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f6ef9a928fso63475575e9.3
        for <linux-kbuild@vger.kernel.org>; Wed, 07 Jun 2023 13:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686168369; x=1688760369;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdRnCgke/pAfmv2+8fkUYL0NAY1RGBJed+E3d5gQAno=;
        b=sg2GfMunLVDpasjeXapA/Vi2IwQdIkk91Eu+SSVJdhMYLX31liUmxSzC7BGseVtxgg
         jiao65X8rEX8u/zDS0fdlF+EmjPHIztLQKA+1+uSSLK27j0OPXk2QL+1Nx6OBOgeFTpv
         t8LLCMJ9CSe3kHU6Fe/UmDd9JFjjc3oxGF4HLMMf7Qk0aDyg0tSNENTL1GTw9l+NpQlL
         SvVLyj8EPuhikU19VkfEUvB10qTE9WihUzJV2MtMqCXJ0r3LNYeYXStQbrJAA6V802xF
         JEQ7z57UQsMIcs9tWjPhJn8cfpxM4FisrC0ECUTp6ZooMe8xgDJvCZznzNW6gPuvhjKp
         yAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686168369; x=1688760369;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HdRnCgke/pAfmv2+8fkUYL0NAY1RGBJed+E3d5gQAno=;
        b=gY8eDCXk9r/fOpijKsUSfsYsZ+4mrhYMDpB1jht9YPcmxlm0uii8WDiHNbVt3zJBuh
         IfTj7wBU7QMsDhoxckteTRK1yiPuqDBCIRJ+XOhqyptE8i5t9HWpUMNHiWsshwvjnSfF
         0K0DPvcbwOgGZdbRz8OtY8Khp8Hn+HEnYowZKLyB7CUL/QjG0c7Wj0FD2QZCF+K6c06N
         kF0CIPF+AA48T/EApaUDLOjifUIgbVivP+9G1RAIz4hfhNFqPUzQgkhBL3yzb2QbeAfK
         /R7cg4+boEG8TEdGWath8OKcC7jZqXINxAvUDqUiCr+azVUPLS7nOrJBDuJtCRXUZiCt
         OQ5Q==
X-Gm-Message-State: AC+VfDxN9EDdak3Qrm8eQSfql8eyeGvYZZmHc3mSwRGIL20kwvrexN3v
        sfhcYHDY6FnF0ccoyslXUqzI0+1qkPMZjw==
X-Google-Smtp-Source: ACHHUZ4V0HI2m+eFOqpCNC8B7aiq803t5jmLEwj7fN1DquZQSHhysaTIMb5upRdWLXiu1qbDhFrL/g==
X-Received: by 2002:a7b:c858:0:b0:3f7:3991:e128 with SMTP id c24-20020a7bc858000000b003f73991e128mr5341085wml.2.1686168368952;
        Wed, 07 Jun 2023 13:06:08 -0700 (PDT)
Received: from localhost ([146.70.132.254])
        by smtp.gmail.com with ESMTPSA id t16-20020a1c7710000000b003f7f2a1484csm2512092wmi.5.2023.06.07.13.06.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 13:06:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 07 Jun 2023 22:06:07 +0200
Message-Id: <CT6OSU5FVKQH.2JBA7PNTYRA23@vincent-arch>
Cc:     <linux-kbuild@vger.kernel.org>, "Roland Kletzing" <devzero@web.de>
Subject: Re: [PATCH v2] script: modpost: emit a warning when the description
 is missing
From:   "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To:     "Masahiro Yamada" <masahiroy@kernel.org>
X-Mailer: aerc 0.15.1
References: <20230309120103.61108-1-vincenzopalazzodev@gmail.com>
 <CAK7LNAR0uMvf+k7LPXtMjigKFPeNu5m5EhAkvk2RVRHkdjdbdg@mail.gmail.com>
In-Reply-To: <CAK7LNAR0uMvf+k7LPXtMjigKFPeNu5m5EhAkvk2RVRHkdjdbdg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> On Thu, Mar 9, 2023 at 9:01=E2=80=AFPM Vincenzo Palazzo
> <vincenzopalazzodev@gmail.com> wrote:
> >
> > Emit a warning when the mod description is missed and only
> > when the W=3D1 is enabled.
> >
> > Reported-by: Roland Kletzing <devzero@web.de>
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D10770
> > Signed-off-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
> > ---
> >  scripts/mod/modpost.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index efff8078e395..433518dfc472 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -1824,6 +1824,10 @@ static void read_symbols(const char *modname)
> >                 }
> >         }
> >
> > +#ifdef WARN
> > +       if (!get_modinfo(&info, "description"))
> > +               warn("missing MODULE_DESCRIPTION() in %s\n", modname);
> > +#endif
> >         for (sym =3D info.symtab_start; sym < info.symtab_stop; sym++) =
{
> >                 symname =3D remove_dot(info.strtab + sym->st_name);
>
>
> Sorry for the delay.
>
> Users need to do "make HOSTCFLAGS=3D-DWARN" to make it work,
> but nobody would do it.
>
>
> I did a ground work:
> https://patchwork.kernel.org/project/linux-kbuild/patch/20230606094159.19=
10369-1-masahiroy@kernel.org/
>

Uh, thanks for doing this!

>
>
> Then, you can do like this:
>
>   if (extra_warn && !get_modinfo(&info, "description"))
>            warn("missing MODULE_DESCRIPTION() in %s\n", modname);
>

Do you preferer that I rebase on top of your patch? or just waiting that=20
your patch will be in next?
