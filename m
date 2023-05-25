Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F37E07113B3
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 May 2023 20:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234112AbjEYSbD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 May 2023 14:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233304AbjEYSbB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 May 2023 14:31:01 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C0A12C
        for <linux-kbuild@vger.kernel.org>; Thu, 25 May 2023 11:31:00 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6238417112aso332646d6.2
        for <linux-kbuild@vger.kernel.org>; Thu, 25 May 2023 11:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685039459; x=1687631459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jDegPyLBipvm6iybaf/47fdtdrcldJ6L3Z0Wtmu4vk=;
        b=TgaA4Qj8BT25QvIHzgG8TGPwyAWQ4G/lILzI1izsVWq6pifR/1PbwlaKisfKncg/Ur
         uiHe4VKkgp2yMhZApjbL6hE6wAObfcrgag0GXttT6ruEumkMX7/Ns0rUxQWDNVDHwm4a
         /U/DjRF35FG0tYsZ9lgma2CDpeAHG32s57BBu+1jNo8KfGaSRYehD8Sj/nYPW0jDHhGF
         gu+TXJDT4o4Pu1pccABUNd7H56Vq6McGg1arRbq1vkp9lpFgtu2wJPF+mxsJK52fdmCS
         2JWe09ePs/+YjI71OAHXKNZwRm1OkF2jg4wItQsyzgod6ojrPHbJe8Js5ewwZ0yLrhn2
         Ypyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685039459; x=1687631459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6jDegPyLBipvm6iybaf/47fdtdrcldJ6L3Z0Wtmu4vk=;
        b=Kg5vWK8uFDSd4ks3IpZ/K1mymDYofZuroBE0wQdi9Qv5gfwwIg7csPYlBG312UZWZB
         RX5iCtupK7PoPaWZTwB4uPd3DLnlrLiVmlBoftXBaYE1yaZoc6IuGlldoB69CLskr726
         YYxDDaCD3uan51DOX/wmY4WOGG9NnMTQoB5OcLm0liu4IzEtMgCATIk4Zl5blydp6Q6p
         Fi9QPmLWOc1mOO32Fk0z+ko1EMlfJWB5T6ksnBdiwITHGwF3DBtl/FxnXf6GK6zMCHw3
         TEl5M/FcrfWR7uJMf1rVw11cEl2ebrRloNxiTGCT2c38a0Hr5DXa0IK3/OJOITPivBGV
         9S6g==
X-Gm-Message-State: AC+VfDyWj5MAeInjwvL3ei1AxvmebRCUyzhTlql+2nO2lwHqRtQunHBR
        f7iPUuLnkcE0tVhHXNE8HLZCnZFHkC86zMzj0Mf4Bg==
X-Google-Smtp-Source: ACHHUZ7UlV21dXVPEAwDoDbhPAAJISp+BZa1rwWu3AY5tI3L9BycUzPvcH0U8e4q/cFtZLlBI2TfrcoafOA+/jNprt0=
X-Received: by 2002:a05:6214:27cf:b0:61f:1a72:6c89 with SMTP id
 ge15-20020a05621427cf00b0061f1a726c89mr1723666qvb.34.1685039459561; Thu, 25
 May 2023 11:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230521160426.1881124-1-masahiroy@kernel.org> <20230521160426.1881124-17-masahiroy@kernel.org>
In-Reply-To: <20230521160426.1881124-17-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 25 May 2023 11:30:48 -0700
Message-ID: <CAKwvOd=aF19UauHr76tQNzn=Hzihv5TzaOw4Tj7HzYYgvMaFKw@mail.gmail.com>
Subject: Re: [PATCH v6 16/20] modpost: merge fromsec=DATA_SECTIONS entries in
 sectioncheck table
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
> You can merge these entries.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/mod/modpost.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 516323c3910a..aea9d6cd243d 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -884,12 +884,7 @@ static const struct sectioncheck sectioncheck[] =3D =
{
>  },
>  {
>         .fromsec =3D { DATA_SECTIONS, NULL },
> -       .bad_tosec =3D { ALL_XXXINIT_SECTIONS, NULL },
> -       .mismatch =3D DATA_TO_ANY_INIT,
> -},
> -{
> -       .fromsec =3D { DATA_SECTIONS, NULL },
> -       .bad_tosec =3D { INIT_SECTIONS, NULL },
> +       .bad_tosec =3D { ALL_XXXINIT_SECTIONS, INIT_SECTIONS, NULL },
>         .mismatch =3D DATA_TO_ANY_INIT,
>  },
>  {
> --
> 2.39.2
>


--=20
Thanks,
~Nick Desaulniers
