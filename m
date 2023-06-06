Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2734B724998
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Jun 2023 18:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238366AbjFFQ5F (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Jun 2023 12:57:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238394AbjFFQ5C (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Jun 2023 12:57:02 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93397E62
        for <linux-kbuild@vger.kernel.org>; Tue,  6 Jun 2023 09:56:51 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-75d4df773b4so272728685a.0
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Jun 2023 09:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686070610; x=1688662610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVZDR6gfdCmd9+4Bn/JqJd8OBwkKX9TkLiOz9hszTFY=;
        b=S3q/a2ttSuaSgHm3W6VG7WYymmhWBFNNHqcMcrzu0Skww94XeQhvb2XEXdX3bjMCEG
         QPmTIU7a/CHc3vAt17/0qXAnr+i03NJnY1namxLk8NeKnTvPxSHthgLilV48thWiux1p
         824D5mKGebfA28KV4aLlzbYM3UnTFvgJjnkGOfT5h9ZqZFpPLHNhIONn8t318ZQAZ/RI
         nnnvzVvqKpmFmz3WQDWlsSN1AG44Jm2HYqPh/wJNkaXVHl6JOL3c6bhpXy09lERunmN6
         ByzyOQuiWVt24ODmXHAYXxKJMzfjH0yoLph8FlkI2KoNJLzmOypN4fJ5wwYCsfQ+E4cz
         AvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686070610; x=1688662610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVZDR6gfdCmd9+4Bn/JqJd8OBwkKX9TkLiOz9hszTFY=;
        b=ZgsXmcxpP6aEi/+jMnsDZHv+U0zE0bMhpu8LGoTYJFxnicoYFINo7EurwN4bQi5N7m
         HPjEoqj5kDtMMcZfcRWeGRV+OQp9nP/MZf++lBgnOWGLSAvcMmKtuEqxkRAdJaJ31yog
         TT74kDNCXuWp4TCUtAEJhpKtZymdP2suHZ9qmLuT7ZPyziAJ2fttszGT4HUm1ijnlvSS
         ZDgmDXJ5IEefeVMYnROCGq6kmDTvR945vWLFoPHyG+//NCztD7Pe2ojvhhoSZCbimm1+
         TgfLAJ/0E7VGZLQfLdgvQtXhR7sVI23OlgQqFVOjXd2awmW5/P92tpgjX6timCDcHeIO
         eP/Q==
X-Gm-Message-State: AC+VfDwfPT+IbbSK9XLMu8/YrJ0YqvhHgk6rIPIdgKd/HZ0zBvexDetv
        Tn+eGu+8WCnv+sFaSwY38Z+Cj+eirfZtIJ2XAj+j6Q==
X-Google-Smtp-Source: ACHHUZ5d7mXf5uBLlKESniRxg4nBcTSg4GLECRbAPybDHAF72hwBmaQxg5JcYnit0FtEaoAjZiQ6wmPrlC384cinj4s=
X-Received: by 2002:a05:6214:528d:b0:623:8bb3:ad5c with SMTP id
 kj13-20020a056214528d00b006238bb3ad5cmr258734qvb.1.1686070609210; Tue, 06 Jun
 2023 09:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230606094159.1910369-1-masahiroy@kernel.org>
In-Reply-To: <20230606094159.1910369-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 6 Jun 2023 09:56:38 -0700
Message-ID: <CAKwvOdkfQiu-Y29xiOMERxnSy9aqN851AoogGYrnqdc4dcaHOA@mail.gmail.com>
Subject: Re: [PATCH] modpost: propagate W=1 build option to modpost
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

On Tue, Jun 6, 2023 at 2:42=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> "No build warning" is a strong requirement these days, so you must fix
> all issues before enabling a new warning flag.
>
> We often add a new warning to W=3D1 first so that the kbuild test robot
> blocks new breakages.
>
> This commit allows modpost to show extra warnings only when W=3D1
> (or KBUILD_EXTRA_WARN=3D1) is given.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Patch seems fine, but without anyone reading extra_warn, I'm curious
what new extra warnings you had in mind were?

> ---
>
>  scripts/Makefile.modpost | 1 +
>  scripts/mod/modpost.c    | 7 ++++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index 0980c58d8afc..074e27c0c140 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -47,6 +47,7 @@ modpost-args =3D                                       =
                                         \
>         $(if $(KBUILD_MODPOST_WARN),-w)                                  =
               \
>         $(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS))                      =
               \
>         $(if $(CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS)$(KBUILD_NSD=
EPS),-N)       \
> +       $(if $(findstring 1, $(KBUILD_EXTRA_WARN)),-W)                   =
               \
>         -o $@
>
>  modpost-deps :=3D $(MODPOST)
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index d10f5bdcb753..3ea5eb2b1029 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -42,6 +42,8 @@ static bool allow_missing_ns_imports;
>
>  static bool error_occurred;
>
> +static bool extra_warn;
> +
>  /*
>   * Cut off the warnings when there are too many. This typically occurs w=
hen
>   * vmlinux is missing. ('make modules' without building vmlinux.)
> @@ -2199,7 +2201,7 @@ int main(int argc, char **argv)
>         LIST_HEAD(dump_lists);
>         struct dump_list *dl, *dl2;
>
> -       while ((opt =3D getopt(argc, argv, "ei:mnT:o:awENd:")) !=3D -1) {
> +       while ((opt =3D getopt(argc, argv, "ei:mnT:o:aWwENd:")) !=3D -1) =
{
>                 switch (opt) {
>                 case 'e':
>                         external_module =3D true;
> @@ -2224,6 +2226,9 @@ int main(int argc, char **argv)
>                 case 'T':
>                         files_source =3D optarg;
>                         break;
> +               case 'W':
> +                       extra_warn =3D true;
> +                       break;
>                 case 'w':
>                         warn_unresolved =3D true;
>                         break;
> --
> 2.39.2
>


--=20
Thanks,
~Nick Desaulniers
