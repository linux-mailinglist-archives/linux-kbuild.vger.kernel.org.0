Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 471F7513DE9
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Apr 2022 23:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352633AbiD1VxP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Apr 2022 17:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352704AbiD1Vww (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Apr 2022 17:52:52 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2CF4C42D5
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Apr 2022 14:49:18 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id q185so8376457ljb.5
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Apr 2022 14:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+PxAAmkjgu5tODqXDwsgtMxyhrqsec+04FO6jxzyCcc=;
        b=EgMf4wGlKR2P4qmTIR+eqAHCPohzmdgt/qhnbyKZ4lDdOt7a2A7KkIvmRUYj3ORv/2
         ctRYHxbEdH2bVz9z7jidHdTMqxGWNNbHKkOcq1JPkBTDkr2KywCmhFn1VIhFj07TRW0J
         tO44QxZ/hvGFifP6BvM1SsRBXK/Wpt80VuD+LYMULc1NK5J4u7qRHmwTQNRCnIocu6oc
         2gc0M+ITg74EzCn09TOpQVb2U+Eg/vp0XIn+OY99YAqNaTSkV7FhpYDzkZpuRwvbIak7
         cDYVACnvJB9wBAtQ/uz0O8N7txvXwNncqCpkJsJ7hXYhVonAw0nwosMtUU0Un9iCH/TS
         8wDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+PxAAmkjgu5tODqXDwsgtMxyhrqsec+04FO6jxzyCcc=;
        b=HkYCKQUaxcKaEYW2wfN/+a75RA+VgvmQNRm6siamM3L2t17L3jNm8xX4IdNhnddFVR
         aFX7K/kAvT3HCW4zQ0r+4wkE2xlEjPZghEMuEOabpv6Tt7H1NJxYw7U/Lew1S91FUK4s
         onfFSMQYWKlEJK0d45JRKDn0yxTW13aasC4Bc2HpNe7HosiLcNQHN74KaqQ6NuqjVjgq
         a3oh3UAw7USkDI2/xeyFwgn4D7uFCFxq9iW1lIfpPR12BR02TBAgfxD0ixyQNGLE6npp
         vqkfleIeoHCnXsKEije9doXNfcFQKmkX6WtXjs5v/8T95e5Jdy3PkRNRnMIHseocIUAV
         uyHQ==
X-Gm-Message-State: AOAM530ETJABZW6sBl2oD4nfauDTFchjW7/7e10kGvG+9BsVU/FXLUVv
        g04UQf+QCcb86cJYEgGtHFn9FcyQmYcBZuN9ojTOUg==
X-Google-Smtp-Source: ABdhPJxeDVaq0Pvja4JeHCOk2oQ2ZlUxjPVKsJFApZLIQJQHRDw1GXu/scJSktw+wQosBxZQ2bpqpujznJscwVBecOQ=
X-Received: by 2002:a2e:854b:0:b0:24f:b98:e2d2 with SMTP id
 u11-20020a2e854b000000b0024f0b98e2d2mr17407442ljj.165.1651182556685; Thu, 28
 Apr 2022 14:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220424190811.1678416-1-masahiroy@kernel.org> <20220424190811.1678416-25-masahiroy@kernel.org>
In-Reply-To: <20220424190811.1678416-25-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 28 Apr 2022 14:49:04 -0700
Message-ID: <CAKwvOdkJJnJt_jj_1n6QP31UoTqcS5aVUYAExdR8wY61EmRDFQ@mail.gmail.com>
Subject: Re: [PATCH 24/27] modpost: generate linker script to collect symbol versions
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Apr 24, 2022 at 12:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Merge version CRCs per vmlinux or per module.
>
> These linker scripts will be fed to the final link stage.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  .gitignore            |  1 +
>  Makefile              |  1 +
>  scripts/mod/modpost.c | 27 +++++++++++++++++++++++++++
>  3 files changed, 29 insertions(+)
>
> diff --git a/.gitignore b/.gitignore
> index 265959544978..f9dad6b917e6 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -42,6 +42,7 @@
>  *.so.dbg
>  *.su
>  *.symtypes
> +*.symver.lds
>  *.symversions
>  *.tab.[ch]
>  *.tar
> diff --git a/Makefile b/Makefile
> index 235d68fa1470..0779db3d1c0c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1859,6 +1859,7 @@ clean: $(clean-dirs)
>                 -o -name '*.c.[012]*.*' \
>                 -o -name '*.ll' \
>                 -o -name '*.gcno' \
> +               -o -name '*.symver.lds' \
>                 -o -name '*.*.symversions' \) -type f -print | xargs rm -f
>
>  # Generate tags for editors
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 43ab4f000ae3..ef779ada04c6 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2577,6 +2577,30 @@ static void write_dump(const char *fname)
>         free(buf.p);
>  }
>
> +static void write_symversions_lds(struct module *mod)
> +{
> +       struct buffer buf = { };
> +       struct symbol *sym;
> +       char lds_file[PATH_MAX];
> +       int ret;
> +
> +       ret = snprintf(lds_file, sizeof(lds_file), "%s.symver.lds", mod->name);
> +       if (ret >= sizeof(lds_file)) {
> +               error("%s: too long path was truncated\n", lds_file);
> +               return;

If this exceptional case occurs, we should probably halt or return an
error code to main?

> +       }
> +
> +       list_for_each_entry(sym, &mod->exported_symbols, list) {
> +               if (!sym->crc_valid)
> +                       continue;
> +
> +               buf_printf(&buf, "__crc_%s = 0x%08x;\n", sym->name, sym->crc);
> +       }
> +
> +       write_if_changed(&buf, lds_file);
> +       free(buf.p);
> +}
> +
>  static void write_namespace_deps_files(const char *fname)
>  {
>         struct module *mod;
> @@ -2673,6 +2697,9 @@ int main(int argc, char **argv)
>                 char fname[PATH_MAX];
>                 int ret;
>
> +               if (modversions && !mod->from_dump)
> +                       write_symversions_lds(mod);
> +
>                 if (mod->is_vmlinux || mod->from_dump)
>                         continue;
>
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
