Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5C7772A556
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Jun 2023 23:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbjFIV12 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Jun 2023 17:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjFIV12 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Jun 2023 17:27:28 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416FC35BE
        for <linux-kbuild@vger.kernel.org>; Fri,  9 Jun 2023 14:27:27 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-39c68a3c5b9so966151b6e.0
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Jun 2023 14:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686346046; x=1688938046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79ZPKjidrQgRLDsSa7QpphQvIoGIPOgBv8OBV9Mr61s=;
        b=OmL+6fhI7tyv31jaIEJF48y0gvfk2e7g/YcVV/TchHMCLdNaYV2CzWK8kQuzD/dv/9
         rTU/i+ZudaE16UswrcKoUpeeGi0HUwFPVBnaSmKQJJOgVa3Eq8V+n13qwOa752MnSl2G
         nxSEwD1NWrt7mf//t+SmSBmJgTuVeV4gMU1migsjs0jZD+MD/nkUl4208EAkmiOfnr0o
         Pdk+OX2fGo1y9OhDkE4XlcZQatI4VjvMhgKaQB1qeRRUCtJwzQdeRdjYq8AuTXidJNg7
         oCxH6RjrmVM9T2O6vCylxuSqnorPvIGwyHfKmEZm3JLiWuPEakfE+DbsSrv+OlhDMV7Z
         9diA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686346046; x=1688938046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79ZPKjidrQgRLDsSa7QpphQvIoGIPOgBv8OBV9Mr61s=;
        b=QK3TWES0kLwHDvTau7C6Zluca9bLFiVeXAHwzAhC91k77QuPAcYaCpsgRMCAr1y1nK
         IBDU+/ve4WOE/WQjVwzBQYMa7GrQNstrZgcFsKb6txIAAKb7fXeJ8ZRnwd7uvSAVtd0j
         C2SoW3xhD3gjNp0Xs3JbQlk9act1/cqzs4POUdkcYXWaPiWpkRMPX9K1dEQASuVGPEfQ
         cb2zgyQgMWylZGSesCnifey4w5wR6lG4sb/jPqvnLW8lv37zuYPEwGJUVNcdZoL7XCNf
         9SSTISEsEyqUGtTx6gg1JyMJY43Dq/rkYYqKP/knpmfqOOM8UA4n7igxqCznZb99DORb
         9jaA==
X-Gm-Message-State: AC+VfDxBOk0LcL4C/BgUmkJkAgGwvqfCwciJe7V247hO/ZpHeE0Qk6CW
        YWmVbiKCO2xaXo8CWOSse5ch5l0nPgTZkhDh7fNQ6MNhFzfazW1KF8c=
X-Google-Smtp-Source: ACHHUZ50Fx2ISvtOB/iuSEZqXAVM8l4sckFy6gt9/EnvPJel+X8zQgM7yZZYCTQwM1yl0Jrlq/5lb1VPEjdiLi0n0ec=
X-Received: by 2002:a05:6358:c519:b0:129:c7b0:27fb with SMTP id
 fb25-20020a056358c51900b00129c7b027fbmr2233226rwb.26.1686346046206; Fri, 09
 Jun 2023 14:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230608142428.256985-1-masahiroy@kernel.org> <20230608142428.256985-11-masahiroy@kernel.org>
In-Reply-To: <20230608142428.256985-11-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 9 Jun 2023 14:26:57 -0700
Message-ID: <CAKwvOdny3yGugmEUUK_Zm7WNUeKHZrCk+9j-svGi9URHZVpDng@mail.gmail.com>
Subject: Re: [PATCH v7 10/11] modpost: show offset from symbol for section
 mismatch warnings
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-um@lists.infradead.org
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

On Thu, Jun 8, 2023 at 7:24=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> Currently, modpost only shows the symbol names and section names, so it
> repeats the same message if there are multiple relocations in the same
> symbol. It is common the relocation spans across multiple instructions.
>
> It is better to show the offset from the symbol.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/mod/modpost.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 85df3f3ba9ee..40967ed816df 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1147,8 +1147,8 @@ static void default_mismatch_handler(const char *mo=
dname, struct elf_info *elf,
>
>         sec_mismatch_count++;
>
> -       warn("%s: section mismatch in reference: %s (section: %s) -> %s (=
section: %s)\n",
> -            modname, fromsym, fromsec, tosym, tosec);
> +       warn("%s: section mismatch in reference: %s+0x%x (section: %s) ->=
 %s (section: %s)\n",
> +            modname, fromsym, (unsigned int)(faddr - from->st_value), fr=
omsec, tosym, tosec);
>
>         if (mismatch->mismatch =3D=3D EXTABLE_TO_NON_TEXT) {
>                 if (match(tosec, mismatch->bad_tosec))
> --
> 2.39.2
>


--=20
Thanks,
~Nick Desaulniers
