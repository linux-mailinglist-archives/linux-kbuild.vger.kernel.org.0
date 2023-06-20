Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4EE7367B3
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jun 2023 11:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232322AbjFTJ2L (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Jun 2023 05:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232323AbjFTJ12 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Jun 2023 05:27:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E62C199
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jun 2023 02:26:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D85ED610A2
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jun 2023 09:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD00C433C8
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jun 2023 09:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687253217;
        bh=qhrRbmxAtwc4R26hREfKuPSB6zNwFUyMSbBaEhCNUg8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ajv3bVk7Re1ZgkUKMUl1hbibPtE3P9e6mbGCG28uq/R5M8DiwBn8oCZqwBhASNIdn
         srAwQn/P76UsrVArVHV4owCt1hIzn6JPFOvsh1EFVxShnQ6005HPOXJapQ0yvMo5/u
         gGQ6KLXKA0gVzN2GVo5LXaU3tmeIgTgneOP7nu+eOzPfzoSrQb18qpJBxa+D1nFWzF
         TyQMUxi+HzFYPL85bm9YtmSwyCEwO3/Og58an2dmM3NIabJ3DPAgpL4XEEgbqFh67v
         DA9tOJG/rhy2GL4spRk7jZkF4Q+7EpLVtsyWwdq/Soh7INYsg9Db7uRdDP7NoysOgW
         HEQ8XNU2SBClg==
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3a034e628fcso686817b6e.1
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jun 2023 02:26:57 -0700 (PDT)
X-Gm-Message-State: AC+VfDxqgjb6shPQeTlzswiZ2VinSqk8eVydheL/X01QjEXwuB8pZ9w2
        1e/Ah6wVeN6Es3zMEv+SivXfU2U/h/gDDo+yWEo=
X-Google-Smtp-Source: ACHHUZ4ds8695YflvbPqM5PiC/sZci7eYsdXoZW+PCBijMCWWyenfMiASLL5sWeM87ZAJRvl4LbgWA55jVkyRTGFRt0=
X-Received: by 2002:a05:6808:4c5:b0:39a:28ba:9431 with SMTP id
 a5-20020a05680804c500b0039a28ba9431mr6179435oie.12.1687253216551; Tue, 20 Jun
 2023 02:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230615234037.244446-1-vincenzopalazzodev@gmail.com> <ZJBOQy0d+V0qLZns@buildd.core.avm.de>
In-Reply-To: <ZJBOQy0d+V0qLZns@buildd.core.avm.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 20 Jun 2023 18:26:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNASYGGqjNmJtVrkNr-k+mbH09LMyfRQoosmvdvobP1_CEQ@mail.gmail.com>
Message-ID: <CAK7LNASYGGqjNmJtVrkNr-k+mbH09LMyfRQoosmvdvobP1_CEQ@mail.gmail.com>
Subject: Re: [PATCH v4] script: modpost: emit a warning when the description
 is missing
To:     Nicolas Schier <n.schier@avm.de>,
        Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Cc:     linux-kbuild@vger.kernel.org, devzero@web.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 19, 2023 at 9:47=E2=80=AFPM Nicolas Schier <n.schier@avm.de> wr=
ote:
>
> On Fri, Jun 16, 2023 at 01:40:37AM +0200, Vincenzo Palazzo wrote:
> > Emit a warning when the mod description is missed and only
> > when the W=3D1 is enabled.
> >
> > Based on top: https://patchwork.kernel.org/project/linux-kbuild/patch/2=
0230606094159.1910369-1-masahiroy@kernel.org/
> >
> > Sorry the version 3 is wrong, there is no reason
> > to wrap the if under the `W`.
>
> You probably wanted to put this paragraph below the trailer block
> (separated by another '---').


I removed this paragraph and applied to linux-kbuild.

Thanks.









> >
> > Reported-by: Roland Kletzing <devzero@web.de>
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D10770
> > Signed-off-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
> > ---
>
> Tested-by: Nicolas Schier <n.schier@avm.de>
>
>
> >  scripts/mod/modpost.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index d4531d09984d..0cdf8d655bd3 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -1818,6 +1818,8 @@ static void read_symbols(const char *modname)
> >               }
> >       }
> >
> > +     if (extra_warn && !get_modinfo(&info, "description"))
> > +             warn("missing MODULE_DESCRIPTION() in %s\n", modname);
> >       for (sym =3D info.symtab_start; sym < info.symtab_stop; sym++) {
> >               symname =3D remove_dot(info.strtab + sym->st_name);
> >
> > --
> > 2.41.0
> >



--=20
Best Regards
Masahiro Yamada
