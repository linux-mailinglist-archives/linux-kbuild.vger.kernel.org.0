Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4E7C72405E
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Jun 2023 13:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbjFFLCq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Jun 2023 07:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236847AbjFFLCA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Jun 2023 07:02:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A601E170A
        for <linux-kbuild@vger.kernel.org>; Tue,  6 Jun 2023 03:59:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2ACBA627DD
        for <linux-kbuild@vger.kernel.org>; Tue,  6 Jun 2023 10:59:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F11FC433D2
        for <linux-kbuild@vger.kernel.org>; Tue,  6 Jun 2023 10:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686049166;
        bh=hOryDi6NGsZWiznkDW3w5OXrj6F8q8KIFhJK693Ytqc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qAj5wPyZsVH0r+xGXG4U0TFP+4NN/Cj8jVkK+w89kLoCcg7iV0usT+srPeEeTZ6r5
         5VD27Zn3L8pwZx8IVoASMBmKzGA5WlrZJVH4uZKufLcTrwv71ottfSHuM3F4JfE+Te
         bZ4NMk7BOmALzl+hABh8GcXDrHkXNBAnnMXtzC8FG795dreIkGQRrqzoLVyBgc4815
         YuZuHA/bzSXwkubFstHJEVjnb1dU9aruhwdO7aKBBIF7dk7ucKykdeUyFm5FGLtDh9
         qwI6APiszkRkisG0E52z0dH4GsItkMyxaXOvffLTjZjitcO0l7lXd1+3ItVYAFXxM6
         Akzoqv4bHBuwA==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1a2ad8f4075so4599861fac.2
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Jun 2023 03:59:26 -0700 (PDT)
X-Gm-Message-State: AC+VfDyOJVwMQwq+xf9EvvERhvWf2Y+jx4WJ8ij76w9Ph7vfQDVUhNfr
        OgJZX09ULqETFMb6H1qYeW7ZwpvYtci4j2AKMow=
X-Google-Smtp-Source: ACHHUZ6x3RyITLue3UQ/DbtoiJfjT6JU9xLGz/3fFTkfQBxA+iVVbRsv8o9RBrPs4EZzN8qMkKjCYXwuMfmSv1kMbI4=
X-Received: by 2002:a05:6871:6aaf:b0:187:85c1:8075 with SMTP id
 zf47-20020a0568716aaf00b0018785c18075mr1991255oab.15.1686049165892; Tue, 06
 Jun 2023 03:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230309120103.61108-1-vincenzopalazzodev@gmail.com>
In-Reply-To: <20230309120103.61108-1-vincenzopalazzodev@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 6 Jun 2023 19:58:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR0uMvf+k7LPXtMjigKFPeNu5m5EhAkvk2RVRHkdjdbdg@mail.gmail.com>
Message-ID: <CAK7LNAR0uMvf+k7LPXtMjigKFPeNu5m5EhAkvk2RVRHkdjdbdg@mail.gmail.com>
Subject: Re: [PATCH v2] script: modpost: emit a warning when the description
 is missing
To:     Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Cc:     linux-kbuild@vger.kernel.org, Roland Kletzing <devzero@web.de>
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

On Thu, Mar 9, 2023 at 9:01=E2=80=AFPM Vincenzo Palazzo
<vincenzopalazzodev@gmail.com> wrote:
>
> Emit a warning when the mod description is missed and only
> when the W=3D1 is enabled.
>
> Reported-by: Roland Kletzing <devzero@web.de>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D10770
> Signed-off-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
> ---
>  scripts/mod/modpost.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index efff8078e395..433518dfc472 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1824,6 +1824,10 @@ static void read_symbols(const char *modname)
>                 }
>         }
>
> +#ifdef WARN
> +       if (!get_modinfo(&info, "description"))
> +               warn("missing MODULE_DESCRIPTION() in %s\n", modname);
> +#endif
>         for (sym =3D info.symtab_start; sym < info.symtab_stop; sym++) {
>                 symname =3D remove_dot(info.strtab + sym->st_name);


Sorry for the delay.

Users need to do "make HOSTCFLAGS=3D-DWARN" to make it work,
but nobody would do it.


I did a ground work:
https://patchwork.kernel.org/project/linux-kbuild/patch/20230606094159.1910=
369-1-masahiroy@kernel.org/



Then, you can do like this:

  if (extra_warn && !get_modinfo(&info, "description"))
           warn("missing MODULE_DESCRIPTION() in %s\n", modname);




> --
> 2.39.2
>


--=20
Best Regards
Masahiro Yamada
