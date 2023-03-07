Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 591FE6AD4B9
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Mar 2023 03:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjCGCfj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Mar 2023 21:35:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbjCGCfi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Mar 2023 21:35:38 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 381A0311E2
        for <linux-kbuild@vger.kernel.org>; Mon,  6 Mar 2023 18:35:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 63116B81334
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Mar 2023 02:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24CA3C433EF
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Mar 2023 02:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678156526;
        bh=q2fZ/UlmXQ8To5hVEPNvC7ejALFIX/medHVUv3bnrwU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fdLgGo2c4BTk5+Kn5h1oZMDvH5Ewh1VHj9h2wKlCJK8PyqLrI34Ccq1pLqWvxBbfF
         jE4MvVqUqYdIt+J7IfKmbUeirPLgou1GLA82ci8MmdFaeB048HRpgM25x3g14M16Lg
         +VdOfADPxhp4UeAu9MCJ2kmBilGLWwF2zTdct9Dlr6r3++iyiN5uCwnzhS5VQX/LaD
         nsSKiXGvccya0xQmvzgXd++PZQPi7kuYMOE2gfzvOlTO5s3evl+2zex/h0hbjnl2e7
         dZw60r6RGPeuXpNoVkuBm96Zv+s5oRX6yN85WmM+ABv1YRcm5obvuPkrx2SsUOkpUz
         pIE553uwLEF2A==
Received: by mail-ot1-f48.google.com with SMTP id o4-20020a9d6d04000000b00694127788f4so6466343otp.6
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Mar 2023 18:35:26 -0800 (PST)
X-Gm-Message-State: AO0yUKXv+e3xoA1437WlwocijozwrWCjKWmUmAYIJ1XU0/3m0ux8KnJW
        yK9H0WdlHV56R4ZlOnoZgh/k7mQju1yZ4Oo00D0=
X-Google-Smtp-Source: AK7set9/zH0KJ5IQB4oZqsEvMR8oOsOzuHz3hkJNXAseAzNLhB/kJV8xmt87gjBSqpRqk8DswP4+zpsGx6hrc8Lm+Pw=
X-Received: by 2002:a9d:6090:0:b0:694:634:8fd8 with SMTP id
 m16-20020a9d6090000000b0069406348fd8mr4387629otj.1.1678156525378; Mon, 06 Mar
 2023 18:35:25 -0800 (PST)
MIME-Version: 1.0
References: <20230306174159.145224-1-vincenzopalazzodev@gmail.com>
In-Reply-To: <20230306174159.145224-1-vincenzopalazzodev@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 7 Mar 2023 11:34:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS598SxdLDoVLFdBtEynzhFZHD0Z1cHeuDHLaJJvL6b0w@mail.gmail.com>
Message-ID: <CAK7LNAS598SxdLDoVLFdBtEynzhFZHD0Z1cHeuDHLaJJvL6b0w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] script: modpost: emit warning when description is missing
To:     Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Cc:     linux-kbuild@vger.kernel.org, Roland Kletzing <devzero@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 7, 2023 at 2:42=E2=80=AFAM Vincenzo Palazzo
<vincenzopalazzodev@gmail.com> wrote:
>
> Emit a warning when the mod description is missed.
>
> Reported-by: Roland Kletzing <devzero@web.de>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D10770
> Signed-off-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
> ---
>  scripts/mod/modpost.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index efff8078e395..c63156ba4e5e 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1824,6 +1824,9 @@ static void read_symbols(const char *modname)
>                 }
>         }
>
> +       if (!get_modinfo(&info, "description"))
> +               warn("missing MODULE_DESCRIPTION() in %s\n", modname);
> +
>         for (sym =3D info.symtab_start; sym < info.symtab_stop; sym++) {
>                 symname =3D remove_dot(info.strtab + sym->st_name);
>
> --
> 2.39.2
>


Linus requires a clean build log these days.
This patch would sprinkle warning messages,
and I am sure it will result in a rejection.


The best we can do would print the warnings
only when W=3D1.









--=20
Best Regards
Masahiro Yamada
