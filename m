Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC726DB4F1
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Apr 2023 22:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbjDGUMz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Apr 2023 16:12:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjDGUMy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Apr 2023 16:12:54 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D727FBBB8
        for <linux-kbuild@vger.kernel.org>; Fri,  7 Apr 2023 13:12:53 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-23f8be2d34eso237280a91.2
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Apr 2023 13:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680898373; x=1683490373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5mYams1Om5vGKqMiylWUp4/KwLeRIpwwY8Rdx8IDJM=;
        b=FrKxlg6OAQXebFijrGcZUtm+iDlBYVl95CUmNYQuXGR8OrVOWgJ7gaZCA4m0bDzfeV
         ylq7a7nIgBKdbRw6eB+gjLN/jqoNgL6CUDD+9hPYtbSEmS3ZXvEGJWtlS43bejz17gnP
         nBrsq6EVy30ZVNbnpuYJIEseQAtOBU5TgoNYcX333ndOgADEYFHKhshlpwD/VnNH2nyI
         uoQtJlcbLGd5UoYfbo5cZ/yVHHNBNb22HxR3cBkTo8c4lTCKAP7y3TFCo7hosaPp0uM4
         NBz7bbQAhBwfvGA4wGzjOogXBqTl4PrspwHHxXnBodJ0SV1+blI/H4ykGNUdpKBKRlDV
         ymYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680898373; x=1683490373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5mYams1Om5vGKqMiylWUp4/KwLeRIpwwY8Rdx8IDJM=;
        b=RPgWARIjjWgSXlTb2Hhm1ePLSyA6SuXNyUKQ9xCTgZdqw4toP9IfhL9j8C1+b0UtiQ
         Qm0ime8F7WTEWbyVczFA1ZahzxNH/ZEJbXeb/YlrMEJx8JWFe8PcrNSXNTNVd4UrWbmD
         NPXzKoE0YjHoqBClDKz7ad3LRLcl29hgJ5sR/Wb8W8iEyu6lyBGYvmjDUE8XIdeV367X
         BtttDtjZt8SNaSA35REnEjnSgrMttYSmlT+o+qytNBzShHjG1UNAOTlythaVgAdP50Ok
         TKUVbQ5cKZMuZkITiErHIejLFkpK0vQwBgQwSEMUMQsYfkhGXVP5FhrvFU+JguDH/FJ7
         kixw==
X-Gm-Message-State: AAQBX9db1DiC1cH0oJJFbHr8hD16mKqZpP/Zub5Het3jfqk9kuJKq9ge
        eKHeelayJk9co8tv2++hwpKzLvKoRN3CZXGFqoznZw==
X-Google-Smtp-Source: AKy350aN6BrRdc4IJwbEKfxvNrr4JkL+vHVSKoHcPfr1050DMbmBnb2k6qGK0zUzmftpgVE8rmNCVMndQ52SJ+pC9kU=
X-Received: by 2002:a05:6a00:2e23:b0:62a:d87a:a375 with SMTP id
 fc35-20020a056a002e2300b0062ad87aa375mr1767877pfb.4.1680898373036; Fri, 07
 Apr 2023 13:12:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230308115243.82592-1-masahiroy@kernel.org> <20230308115243.82592-4-masahiroy@kernel.org>
In-Reply-To: <20230308115243.82592-4-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 7 Apr 2023 13:12:41 -0700
Message-ID: <CAKwvOd=MLHjGPSyVtmtW=1P=n2OLCXEFG+L=wLPVr4Orwuu2Xg@mail.gmail.com>
Subject: Re: [PATCH 4/8] scripts/kallsyms: exclude symbols generated by itself dynamically
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhen Lei <thunder.leizhen@huawei.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 8, 2023 at 3:53=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> Drop the symbols generated by scripts/kallsyms itself automatically
> instead of maintaining the symbol list manually.
>
> Pass the kallsyms object from the previous kallsyms step (if it exists)
> as the third parameter of scripts/mksysmap, which will weed out the
> generated symbols from the input to the next kallsyms step.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/kallsyms.c      | 17 -----------------
>  scripts/link-vmlinux.sh |  6 +++---
>  scripts/mksysmap        | 11 ++++++++++-
>  3 files changed, 13 insertions(+), 21 deletions(-)
>
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index 8148e880f78e..e572fda6fe42 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -104,23 +104,6 @@ static bool is_ignored_symbol(const char *name, char=
 type)
>  {
>         /* Symbol names that exactly match to the following are ignored.*=
/
>         static const char * const ignored_symbols[] =3D {
> -               /*
> -                * Symbols which vary between passes. Passes 1 and 2 must=
 have
> -                * identical symbol lists. The kallsyms_* symbols below a=
re
> -                * only added after pass 1, they would be included in pas=
s 2
> -                * when --all-symbols is specified so exclude them to get=
 a
> -                * stable symbol list.
> -                */
> -               "kallsyms_addresses",
> -               "kallsyms_offsets",
> -               "kallsyms_relative_base",
> -               "kallsyms_num_syms",
> -               "kallsyms_names",
> -               "kallsyms_markers",
> -               "kallsyms_token_table",
> -               "kallsyms_token_index",
> -               "kallsyms_seqs_of_names",
> -               /* Exclude linker generated symbols which vary between pa=
sses */

^ Do we want to retain this comment for the below two symbols?

>                 "_SDA_BASE_",           /* ppc */
>                 "_SDA2_BASE_",          /* ppc */
>                 NULL
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 32e573943cf0..679eb4653b16 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -174,7 +174,7 @@ kallsyms_step()
>         kallsyms_S=3D${kallsyms_vmlinux}.S
>
>         vmlinux_link ${kallsyms_vmlinux} "${kallsymso_prev}" ${btf_vmlinu=
x_bin_o}
> -       mksysmap ${kallsyms_vmlinux} ${kallsyms_vmlinux}.syms
> +       mksysmap ${kallsyms_vmlinux} ${kallsyms_vmlinux}.syms ${kallsymso=
_prev}
>         kallsyms ${kallsyms_vmlinux}.syms ${kallsyms_S}
>
>         info AS ${kallsyms_S}
> @@ -188,7 +188,7 @@ kallsyms_step()
>  mksysmap()
>  {
>         info NM ${2}
> -       ${CONFIG_SHELL} "${srctree}/scripts/mksysmap" ${1} ${2}
> +       ${CONFIG_SHELL} "${srctree}/scripts/mksysmap" ${1} ${2} ${3}
>  }
>
>  sorttable()
> @@ -277,7 +277,7 @@ if is_enabled CONFIG_DEBUG_INFO_BTF && is_enabled CON=
FIG_BPF; then
>         ${RESOLVE_BTFIDS} vmlinux
>  fi
>
> -mksysmap vmlinux System.map
> +mksysmap vmlinux System.map ${kallsymso}
>
>  if is_enabled CONFIG_BUILDTIME_TABLE_SORT; then
>         info SORTTAB vmlinux
> diff --git a/scripts/mksysmap b/scripts/mksysmap
> index 8ea1955e03c6..1efd61ee0bac 100755
> --- a/scripts/mksysmap
> +++ b/scripts/mksysmap
> @@ -4,7 +4,7 @@
>  # tools to retrieve the actual addresses of symbols in the kernel.
>  #
>  # Usage
> -# mksysmap vmlinux System.map
> +# mksysmap vmlinux System.map [exclude]
>
>
>  #####
> @@ -51,4 +51,13 @@ ${NM} -n ${1} | sed >${2} -e "
>
>  # for LoongArch?
>  / L0$/d
> +
> +# ----------------------------------------------------------------------=
-----
> +# Ignored kallsyms symbols
> +#
> +# If the 3rd parameter exists, symbols from it will be omitted from the =
output.
> +# This makes kallsyms have the identical symbol lists in the step 1 and =
2.
> +# Without this, the step2 would get new symbols generated by scripts/kal=
lsyms.c
> +# when CONFIG_KALLSYMS_ALL is enabled. That might require one more pass.
> +$(if [ $# -ge 3 ]; then ${NM} ${3} | sed -n '/ U /!s:.* \([^ ]*\)$:/ \1$=
/d:p'; fi)
>  "
> --
> 2.34.1
>


--=20
Thanks,
~Nick Desaulniers
