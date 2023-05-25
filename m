Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF9317114CE
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 May 2023 20:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242198AbjEYSlO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 May 2023 14:41:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242527AbjEYSkm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 May 2023 14:40:42 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90614270F
        for <linux-kbuild@vger.kernel.org>; Thu, 25 May 2023 11:38:16 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6238b15d298so744126d6.0
        for <linux-kbuild@vger.kernel.org>; Thu, 25 May 2023 11:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685039795; x=1687631795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctZyno1jlRx7ypzgPMMZHkRj+UPDt+eB6LEWuTexkNk=;
        b=JZWysbdBY5ARXUdTWnuTnFcCwuDlZF3MjLry3Y3NJ51NWsa2SQar8nwpG3HwKhtK97
         jFcsCU5OAKNdZoapZgAx0xW9OhHnmZ+kGtA1NZeA8IE4n697ejnF4Y40i3o5eL2YWT3N
         ApBtaFSMNlEuMQVqw/B6nhSDFpXVRRZkrZMVwiDN0U5rVi3avb09lBj6wA1BXbYsHPT5
         wsxjqWPrnONWt88Xo8zI5BXp2CgLR1wU2dthsp/nO980xgTYBxfXJQbEaIJAH8Nho1le
         4Bl24vn/NHiB1H/t8FrV7dz2Nz44bmgCIxvb1G8ie2IZCXZ0cBjhEwUykY9nGeHJ76A3
         PkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685039795; x=1687631795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctZyno1jlRx7ypzgPMMZHkRj+UPDt+eB6LEWuTexkNk=;
        b=YoIYP4YOMud4DWPfMMHhzETW9gn5cscst3J3RiF3i5gVu1rASZwXX/HzjK7sUC8L2h
         Ike0/t3GdFizE1PSiLXuTKBoqqyk5JS8cAZPfcExC2T/XREFMXB+YLiG1XR+fJGItbCV
         0RtMl3pQ2l53FWUB/Z7+U9zBJKczvbqrPt2uzFuIDxTFi+aPjv7WxZoKVMrQ275/u2+T
         vYL+ypgBZg8na3Pt7GM1a4I1e43wmkKC1OeKXo8ysWUL102V3YN5Tb/vdg4zqDmU9HLQ
         gxfADC/BFYDhp2wM+gLrxjkE3NYLPzU9F+niSVQf0RnoMxBlP8RRcJvJzYH3TU1OVooY
         ElUg==
X-Gm-Message-State: AC+VfDyXuyK3uEwHYXd+TBBd2tuT8nstxp91faZABCTYSOwUU6+KoWrA
        Iyt26dufgSHYkupAH8clm0v/tdq7h1pfc3HYvTqIHF/5QMgrBKsXa61jwA==
X-Google-Smtp-Source: ACHHUZ7MG6eA+ZeuNFc1YY9P7eZcgIycX4tYDYofQ9DZFSMsEXI9wnymJAzJNO0AjjZcZCxsOstMfpF1NSBZLycVjA8=
X-Received: by 2002:a05:6214:130b:b0:621:451b:6e1c with SMTP id
 pn11-20020a056214130b00b00621451b6e1cmr2470051qvb.6.1685039794889; Thu, 25
 May 2023 11:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230521160426.1881124-1-masahiroy@kernel.org> <20230521160426.1881124-18-masahiroy@kernel.org>
In-Reply-To: <20230521160426.1881124-18-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 25 May 2023 11:36:23 -0700
Message-ID: <CAKwvOdnv-=eXtgwuZ8URz_FjnUansgg3MeuGGRf2C=Wr+VGkrA@mail.gmail.com>
Subject: Re: [PATCH v6 17/20] modpost: merge bad_tosec=ALL_EXIT_SECTIONS
 entries in sectioncheck table
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
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 21, 2023 at 9:05=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> There is no distinction between TEXT_TO_ANY_EXIT and DATA_TO_ANY_EXIT.
> Just merge them.

Can something similar be done for ALL_PCI_INIT_SECTIONS and
ALL_XXXINIT_SECTIONS? (as a follow up)

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/mod/modpost.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index aea9d6cd243d..b5f7f4811c39 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -844,8 +844,7 @@ static const char *const optim_symbols[] =3D { "*.con=
stprop.*", NULL };
>  enum mismatch {
>         TEXT_TO_ANY_INIT,
>         DATA_TO_ANY_INIT,
> -       TEXT_TO_ANY_EXIT,
> -       DATA_TO_ANY_EXIT,
> +       TEXTDATA_TO_ANY_EXIT,
>         XXXINIT_TO_SOME_INIT,
>         XXXEXIT_TO_SOME_EXIT,
>         ANY_INIT_TO_ANY_EXIT,
> @@ -888,14 +887,9 @@ static const struct sectioncheck sectioncheck[] =3D =
{
>         .mismatch =3D DATA_TO_ANY_INIT,
>  },
>  {
> -       .fromsec =3D { TEXT_SECTIONS, NULL },
> +       .fromsec =3D { TEXT_SECTIONS, DATA_SECTIONS, NULL },
>         .bad_tosec =3D { ALL_EXIT_SECTIONS, NULL },
> -       .mismatch =3D TEXT_TO_ANY_EXIT,
> -},
> -{
> -       .fromsec =3D { DATA_SECTIONS, NULL },
> -       .bad_tosec =3D { ALL_EXIT_SECTIONS, NULL },
> -       .mismatch =3D DATA_TO_ANY_EXIT,
> +       .mismatch =3D TEXTDATA_TO_ANY_EXIT,
>  },
>  /* Do not reference init code/data from meminit code/data */
>  {
> @@ -1162,8 +1156,7 @@ static void default_mismatch_handler(const char *mo=
dname, struct elf_info *elf,
>         switch (mismatch->mismatch) {
>         case TEXT_TO_ANY_INIT:
>         case DATA_TO_ANY_INIT:
> -       case TEXT_TO_ANY_EXIT:
> -       case DATA_TO_ANY_EXIT:
> +       case TEXTDATA_TO_ANY_EXIT:
>         case XXXINIT_TO_SOME_INIT:
>         case XXXEXIT_TO_SOME_EXIT:
>         case ANY_INIT_TO_ANY_EXIT:
> --
> 2.39.2
>


--=20
Thanks,
~Nick Desaulniers
