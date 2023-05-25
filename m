Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 284B7711395
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 May 2023 20:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233677AbjEYSUc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 May 2023 14:20:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232918AbjEYSUb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 May 2023 14:20:31 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB6EE2
        for <linux-kbuild@vger.kernel.org>; Thu, 25 May 2023 11:20:29 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-75b0830e2eeso759185a.1
        for <linux-kbuild@vger.kernel.org>; Thu, 25 May 2023 11:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685038828; x=1687630828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCFwna0ZpFAdGQRWMH6jYRvTC2leLI59IYmfIfFBrQo=;
        b=i2L79myoQlGuU9HZiujoADn1olZFfTlcKzr4sK8xIyDMtXtfZcOC1phgq3QrIZefe4
         84XxfmasQhy0QiSFwg+TvcTx0bW0/KzDH2fbjI46cHHao9tC1y3pXWi0COrDoIAGqf8f
         Nytu7TY3MICsmo/SbpqQXB5qRigW0fc18QTNHgL0AajoD8v4hnshMDA2kPpTdr+jeUby
         8Ex9A2uty8LM2VfibYrZVCIDbSNl5Ag5AHjsqdJgI/xLDT+EaLnb5rdbB1lA+e9o1c8v
         XPfuL4pnpJ/zM2RL0k7CvEX2JV2WaVZ0Btrq3BGf6c4KWPx6dUrBz1ypqOX7lF5yZnZF
         pn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685038828; x=1687630828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCFwna0ZpFAdGQRWMH6jYRvTC2leLI59IYmfIfFBrQo=;
        b=EYbimXzOqvxMaZZ8azFUmdJkeCST2O6dFTQ/En6XgYGLgiJP9/oxdqDt3yilAnuSOn
         FFvNhLdNSWn6BNd10kqMBg9zWMlSbO16NNHCFyvw3Grlx3jfPfasbPibaMJkuQOA/XNr
         FRuFj1dbewTykdgiSRva6GaEA7zCCU51DivBvc9rKgdVBd00+rwPUI8VHBFGuHsnLcPo
         FbNmPIjUob4f71Qo8QFNnf5E6/DwK4f2wGE964JLWcOSa0SDzgpSa7dmG7TL8f2fPTPo
         3EFcC43vmHFytUtykathe0skmjglVvG/RTHzGqP0PnJP0C0dIWk2yK8uCgjxl6EfqfYj
         cFgA==
X-Gm-Message-State: AC+VfDx9B+9n7nXBTFad9JxeeAwFjb2RMNiWF6cHzW4QZ1SzbW8saxJ0
        oANadz8TmhR2Et8gU3vqUHJxiGNAcQE0Q4rLPUSO3Q==
X-Google-Smtp-Source: ACHHUZ4sKrG3vHBSbytFDQA5PU48D9Zc3ltGjkwSmz07UsEQIQKqY16gba14KrfP3Tr6I8ThqsdZrtDsylHMeki5bZ0=
X-Received: by 2002:a05:620a:8c84:b0:75b:23a1:d85d with SMTP id
 ra4-20020a05620a8c8400b0075b23a1d85dmr3021511qkn.31.1685038828513; Thu, 25
 May 2023 11:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230521160426.1881124-1-masahiroy@kernel.org> <20230521160426.1881124-20-masahiroy@kernel.org>
In-Reply-To: <20230521160426.1881124-20-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 25 May 2023 11:20:17 -0700
Message-ID: <CAKwvOd=O9E1RBhk-hUYNX=EuhP4qQoH0M-wQjpyEZM5QG6+==A@mail.gmail.com>
Subject: Re: [PATCH v6 19/20] modpost: merge two similar section mismatch warnings
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
> In case of section mismatch, modpost shows slightly different messages.
>
> For extable section mismatch:
>
>  "%s(%s+0x%lx): Section mismatch in reference to the %s:%s\n"
>
> For the other cases:
>
>  "%s: section mismatch in reference: %s (section: %s) -> %s (section: %s)=
\n"
>
> They are similar. Merge them.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/mod/modpost.c | 18 +++---------------
>  1 file changed, 3 insertions(+), 15 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 852cc164c77e..e7561fa57478 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1135,21 +1135,10 @@ static void default_mismatch_handler(const char *=
modname, struct elf_info *elf,
>
>         sec_mismatch_count++;
>
> -       switch (mismatch->mismatch) {
> -       case TEXT_TO_ANY_INIT:
> -       case DATA_TO_ANY_INIT:
> -       case TEXTDATA_TO_ANY_EXIT:
> -       case XXXINIT_TO_SOME_INIT:
> -       case XXXEXIT_TO_SOME_EXIT:
> -       case ANY_INIT_TO_ANY_EXIT:
> -       case ANY_EXIT_TO_ANY_INIT:
> -               warn("%s: section mismatch in reference: %s (section: %s)=
 -> %s (section: %s)\n",
> -                    modname, fromsym, fromsec, tosym, tosec);
> -               break;
> -       case EXTABLE_TO_NON_TEXT:
> -               warn("%s(%s+0x%lx): Section mismatch in reference to the =
%s:%s\n",
> -                    modname, fromsec, (long)faddr, tosec, tosym);
> +       warn("%s: section mismatch in reference: %s (section: %s) -> %s (=
section: %s)\n",
> +            modname, fromsym, fromsec, tosym, tosec);
>
> +       if (mismatch->mismatch =3D=3D EXTABLE_TO_NON_TEXT) {
>                 if (match(tosec, mismatch->bad_tosec))
>                         fatal("The relocation at %s+0x%lx references\n"
>                               "section \"%s\" which is black-listed.\n"
> @@ -1169,7 +1158,6 @@ static void default_mismatch_handler(const char *mo=
dname, struct elf_info *elf,
>                 else
>                         error("%s+0x%lx references non-executable section=
 '%s'\n",
>                               fromsec, (long)faddr, tosec);
> -               break;
>         }
>  }
>
> --
> 2.39.2
>


--=20
Thanks,
~Nick Desaulniers
