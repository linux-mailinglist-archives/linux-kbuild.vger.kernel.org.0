Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 262E37273D2
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Jun 2023 02:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjFHAng (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Jun 2023 20:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbjFHAnf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Jun 2023 20:43:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A19626A0
        for <linux-kbuild@vger.kernel.org>; Wed,  7 Jun 2023 17:43:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E8B64642B1
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Jun 2023 00:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3BBC433D2
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Jun 2023 00:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686185010;
        bh=UaDBi+gNXBWdRed5gVt2069d+4kESBsCRW8V7h6Gs9o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LN0ayjP8FW1nTukqMdzejiYAKhuBeCXE43C/Zp0ksm9AjfNNDajg2zAisuYCHrNG7
         tPaE6Tm8GxXUnh2z1JdcXCc99P6/LxWgqL3i3DuvvVx9itHOZMJ6iXNsUr5TSD/gnX
         ovoV7ZcdhknxL7XLuzOaZFtjGr4Vs8WNrteAuPt9WfC7Zf6nnD4KIHMm9VX6lyG7D1
         AkOU6sYeiwB2Q5E9qDaAW3EfroRGCXKgUQIpnLu1JzywimXjn2utQioWUoeZVbEVwn
         AaG19j+RgtOkJ66glwPHdakI7QSF7209dhAs6/uuRyUqV/yreimnAMMH4qQmkPvpou
         uBHUSZmMXGRdA==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-55b171c1e16so38605eaf.1
        for <linux-kbuild@vger.kernel.org>; Wed, 07 Jun 2023 17:43:30 -0700 (PDT)
X-Gm-Message-State: AC+VfDzxyhh9mYIiqgE+td8ou4hsg9TE8ixJnv3WqQRqh+pSJMrK7+p1
        OtEFUpOwgrJnrdcLSr9eMMRwAYWvcsNltIJTFpo=
X-Google-Smtp-Source: ACHHUZ5qyIUsHK1GN1aYppMEHQFxgPwt1ADhTQKC2ySJqauaEa+rGb9cPkFCUJ7qjB12Xl36nX66tcxM5BaQk8ceulE=
X-Received: by 2002:a4a:ea89:0:b0:558:aaa4:baf6 with SMTP id
 r9-20020a4aea89000000b00558aaa4baf6mr5308997ooh.3.1686185009572; Wed, 07 Jun
 2023 17:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230309120103.61108-1-vincenzopalazzodev@gmail.com>
 <CAK7LNAR0uMvf+k7LPXtMjigKFPeNu5m5EhAkvk2RVRHkdjdbdg@mail.gmail.com> <CT6OSU5FVKQH.2JBA7PNTYRA23@vincent-arch>
In-Reply-To: <CT6OSU5FVKQH.2JBA7PNTYRA23@vincent-arch>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 8 Jun 2023 09:42:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQOznJ8cz6kMi2=X2Atp=PdB6EH1E0Hf=N2xH9suvsySw@mail.gmail.com>
Message-ID: <CAK7LNAQOznJ8cz6kMi2=X2Atp=PdB6EH1E0Hf=N2xH9suvsySw@mail.gmail.com>
Subject: Re: [PATCH v2] script: modpost: emit a warning when the description
 is missing
To:     Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Cc:     linux-kbuild@vger.kernel.org, Roland Kletzing <devzero@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 8, 2023 at 5:06=E2=80=AFAM Vincenzo Palazzo
<vincenzopalazzodev@gmail.com> wrote:
>
> > On Thu, Mar 9, 2023 at 9:01=E2=80=AFPM Vincenzo Palazzo
> > <vincenzopalazzodev@gmail.com> wrote:
> > >
> > > Emit a warning when the mod description is missed and only
> > > when the W=3D1 is enabled.
> > >
> > > Reported-by: Roland Kletzing <devzero@web.de>
> > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D10770
> > > Signed-off-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
> > > ---
> > >  scripts/mod/modpost.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > > index efff8078e395..433518dfc472 100644
> > > --- a/scripts/mod/modpost.c
> > > +++ b/scripts/mod/modpost.c
> > > @@ -1824,6 +1824,10 @@ static void read_symbols(const char *modname)
> > >                 }
> > >         }
> > >
> > > +#ifdef WARN
> > > +       if (!get_modinfo(&info, "description"))
> > > +               warn("missing MODULE_DESCRIPTION() in %s\n", modname)=
;
> > > +#endif
> > >         for (sym =3D info.symtab_start; sym < info.symtab_stop; sym++=
) {
> > >                 symname =3D remove_dot(info.strtab + sym->st_name);
> >
> >
> > Sorry for the delay.
> >
> > Users need to do "make HOSTCFLAGS=3D-DWARN" to make it work,
> > but nobody would do it.
> >
> >
> > I did a ground work:
> > https://patchwork.kernel.org/project/linux-kbuild/patch/20230606094159.=
1910369-1-masahiroy@kernel.org/
> >
>
> Uh, thanks for doing this!
>
> >
> >
> > Then, you can do like this:
> >
> >   if (extra_warn && !get_modinfo(&info, "description"))
> >            warn("missing MODULE_DESCRIPTION() in %s\n", modname);
> >
>
> Do you preferer that I rebase on top of your patch? or just waiting that
> your patch will be in next?


Whichever. Your patch changes a different hunk,
so no merge conflict would happen anyway.



--=20
Best Regards
Masahiro Yamada
