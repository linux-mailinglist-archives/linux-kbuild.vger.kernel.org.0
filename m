Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1744070C4F9
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 May 2023 20:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233533AbjEVSK7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 May 2023 14:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233499AbjEVSK6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 May 2023 14:10:58 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21DD6FD
        for <linux-kbuild@vger.kernel.org>; Mon, 22 May 2023 11:10:57 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-623a5f60355so28186246d6.1
        for <linux-kbuild@vger.kernel.org>; Mon, 22 May 2023 11:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684779056; x=1687371056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5hLux43PwuTCN+/APBXSBXWMEmqN2R3favTYL/ElZk=;
        b=NXUgppSfp1jycfs5NbP0pPTli65OqYShPJgsPGGfvS3yPWFSLzdEyW9caG17yxD7wn
         qtxVr5WIqVyKk7Eh2v8mIZbs8nt304EMbJQJjvAnPkxaCkb/FQMHw1Td7zyolIuVY0PH
         voPU3+BNzovLyJq/pA891yfO7V1gHHgb6FoHhzS6krXvqSBssvKuZH8PBTfJGtvuM1zK
         UVfLY8IdsbPv7mvr2+CbdijXxLrNRJYcPfbhz5Ga7h0Gd+0HtjD3ZoU+zSBgyHXTgjvQ
         0vBQCsyzAwWGNIVI1vHYe31IW/3l2DSTOZt+FxXVEXAOnTqVgf5CUhvZ74WrDCSqQL0W
         uCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684779056; x=1687371056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5hLux43PwuTCN+/APBXSBXWMEmqN2R3favTYL/ElZk=;
        b=a5Rdv3USQxhM730Nb63X4ue17A7+o/5BUpOQ0nQQaB2zKDbHsyvpXNiYq4ZFSI4pys
         pWnSv6jsOYdVYVnCd/7rx7ZI8GPjGssJlOTzdpq9TQ5WZrYzAb1kMAU+gHPa5e97DSDf
         iwk3HTCIqXrfiTD1xe2Sv8rXz0ojZisBmSQdT06vmJ83H+zhp4+ETd8vqfrexHRenXDl
         sCV0L3a0Sb/oshwraIc9T7elykpxlOtjy4PzuLeiDhksI9UaJHZEjHM77zx+BiHpxytf
         pe/BqxsSrY86Gq2VjBx/yWuYX2LigLYJ37uu92bDUmv6V1vqyYewqgO+/J8mSHxJlo8l
         JIwQ==
X-Gm-Message-State: AC+VfDwedhLFx7x5jeLPI7FnaZeDzOKjS3yrq4CQVwM0dtmMgIZM35pc
        QjhXEMblPtLc4DEwsupwC2f0G6F1tnWrryRr48x4EcbyHPEL6uIzAJo=
X-Google-Smtp-Source: ACHHUZ4o42p7x5XPW+JHzAZUsVUOdKiqSdUAkYpKJXv0IdpJ2wJD+m6RlMQKXJpAgbJUv8fnWIra5gIZFPDbRTWHfl0=
X-Received: by 2002:a05:6214:1247:b0:621:68e8:99a4 with SMTP id
 r7-20020a056214124700b0062168e899a4mr21475772qvv.8.1684779056082; Mon, 22 May
 2023 11:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230521160426.1881124-1-masahiroy@kernel.org> <20230521160426.1881124-5-masahiroy@kernel.org>
In-Reply-To: <20230521160426.1881124-5-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 22 May 2023 11:10:45 -0700
Message-ID: <CAKwvOdkKedXoVoRB6Jts0vunyRHsruL0_VmPn6CYJwNiiu38Dg@mail.gmail.com>
Subject: Re: [PATCH v6 04/20] modpost: remove unused argument from secref_whitelist()
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 21, 2023 at 9:05=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> secref_whitelist() does not use the argument 'mismatch'.

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/mod/modpost.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index ed2301e951a9..d2329ac32177 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1035,8 +1035,7 @@ static const struct sectioncheck *section_mismatch(
>   *   refsymname =3D *.constprop.*
>   *
>   **/
> -static int secref_whitelist(const struct sectioncheck *mismatch,
> -                           const char *fromsec, const char *fromsym,
> +static int secref_whitelist(const char *fromsec, const char *fromsym,
>                             const char *tosec, const char *tosym)
>  {
>         /* Check for pattern 1 */
> @@ -1206,7 +1205,7 @@ static void default_mismatch_handler(const char *mo=
dname, struct elf_info *elf,
>         tosym =3D sym_name(elf, to);
>
>         /* check whitelist - we may ignore it */
> -       if (!secref_whitelist(mismatch, fromsec, fromsym, tosec, tosym))
> +       if (!secref_whitelist(fromsec, fromsym, tosec, tosym))
>                 return;
>
>         sec_mismatch_count++;
> --
> 2.39.2
>


--=20
Thanks,
~Nick Desaulniers
