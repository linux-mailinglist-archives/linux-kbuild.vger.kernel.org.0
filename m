Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08D5A707475
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 May 2023 23:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjEQVld (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 May 2023 17:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjEQVld (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 May 2023 17:41:33 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B668B2D5A
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 14:41:29 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-62382e9cb8dso5949956d6.2
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 14:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684359689; x=1686951689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDq+b2ZfYYDFmAo9WgDly+IUe6hIbHfQ/RLSHSxP/78=;
        b=O78miNZ1V/XTjemeCQCMyarMfE++byFmzniA7NwgMp2CBONkaU2iBWLTbM+Zz4GS25
         LVMsWrD9H65jBdbIHt1sHivauDHvxci/eVgdGDHVog9i0VC1by156yVFqYaHWYBXKom1
         ku9WVSgsumEjW1yVhEREq5SYY1hd9OwSRm9RYmUbYFXxtJd08FZwXqSUz73rEa8MuRBu
         cNrR9TXHYnbnYOvmMX2kRLQZyn4Jyv12Tu3Uj3fL1JfZuf/CNZVSuZf/uQJsbUkpyAoK
         Tq58blgqS0nqy0MTN0wNisYWzX8pSoP34ez+bok3iv6aB/JvAsvLffV1HDwM/BbIgEns
         pC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684359689; x=1686951689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDq+b2ZfYYDFmAo9WgDly+IUe6hIbHfQ/RLSHSxP/78=;
        b=Xo7om9ygja9v0HPCPvymPf/S9lCiWc69Mf+RBGHLggp+HfntWzFi4LeZSTzA8BDuke
         cFDow3bXupCkD1Q35gIa6DpRkJ0MC/3DamHeRDvNoc3TIvVO6LDiBLq1cixPzzxzv+M9
         5zbbCh+GZDjoDYrAlXMOwX15LDFi+DJathnlxIBPGsVQJE46+gvEkxsljMiBkLO1HU1j
         sDM/zlNSDAPWpXLIsRt/bT4Y5bbwvCQqq+Na4OcsPIXYvoKxFbjEPvjsE0Amf4/v3vKB
         otNE8wb8hfs8+QDUfVPYjtxn6iRu9v/tXOLjrH7mNkhEz+U3Jqa4EnkNYs00ny+obljv
         4tqQ==
X-Gm-Message-State: AC+VfDwdKBALaOXitJ1SjiVsalvpHTgb1mVytS+Iucio4C90KmeJsJU/
        zhWixnSXI/8i1NGwvyf631wYBxUzigpusVi/3beryQ==
X-Google-Smtp-Source: ACHHUZ5ttIRXBgugBrH6LyTmA9hxubwzkf0SzUaf5KfnQd9ndw5lPFwIl2BLSNkFdtpO6q592cwB7akX2DYN3VG2MHE=
X-Received: by 2002:a05:6214:ca1:b0:616:4e24:ff28 with SMTP id
 s1-20020a0562140ca100b006164e24ff28mr2773332qvs.0.1684359688719; Wed, 17 May
 2023 14:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230515005419.1293357-1-masahiroy@kernel.org>
In-Reply-To: <20230515005419.1293357-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 17 May 2023 14:41:17 -0700
Message-ID: <CAKwvOdkMYKhm1gaDGxqa=J136J1=+vSv=fEVYNJR430Px5Qy6A@mail.gmail.com>
Subject: Re: [PATCH] modpost: fix section mismatch message for R_ARM_ABS32
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Russell King <linux@armlinux.org.uk>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Sam Ravnborg <sam@ravnborg.org>
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

On Sun, May 14, 2023 at 5:54=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> The section mismatch check does not show proper warning messages for ARM.
>
> Here, very simple test code.
>
>     #include <linux/init.h>
>
>     static int __initdata foo;
>
>     void set_foo(int x)
>     {
>             foo =3D x;
>     }
>
>     int get_foo(int x)
>     {
>             return foo;
>     }
>
> If I compile it for ARM, modpost does not show the symbol name.
>
>   WARNING: modpost: vmlinux.o: section mismatch in reference: set_foo (se=
ction: .text) -> (unknown) (section: .init.data)
>   WARNING: modpost: vmlinux.o: section mismatch in reference: get_foo (se=
ction: .text) -> (unknown) (section: .init.data)
>
> If I compile it for other architectures, modpost shows the correct symbol=
 name.
>
>   WARNING: modpost: vmlinux.o: section mismatch in reference: set_foo (se=
ction: .text) -> foo (section: .init.data)
>   WARNING: modpost: vmlinux.o: section mismatch in reference: get_foo (se=
ction: .text) -> foo (section: .init.data)
>
> For R_ARM_ABS32, addend_arm_rel() sets r->r_addend to a wrong value.
>
> arch/arm/kernel/module.c handles R_ARM_ABS32 as follows:
>
>         case R_ARM_ABS32:
>         case R_ARM_TARGET1:
>                 *(u32 *)loc +=3D sym->st_value;
>
> I just mimicked it in modpost.
>
> Fixes: 56a974fa2d59 ("kbuild: make better section mismatch reports on arm=
")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/mod/modpost.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index d4531d09984d..c93780d93caf 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1460,12 +1460,13 @@ static int addend_386_rel(struct elf_info *elf, E=
lf_Shdr *sechdr, Elf_Rela *r)
>  static int addend_arm_rel(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Re=
la *r)
>  {
>         unsigned int r_typ =3D ELF_R_TYPE(r->r_info);
> +       unsigned int *location =3D reloc_location(elf, sechdr, r);

If `location` is only used in one case of the switch, consider
computing `location` only in that case.

> +       Elf_Sym *sym;
>
>         switch (r_typ) {
>         case R_ARM_ABS32:
> -               /* From ARM ABI: (S + A) | T */
> -               r->r_addend =3D (int)(long)
> -                             (elf->symtab_start + ELF_R_SYM(r->r_info));
> +               sym =3D elf->symtab_start + ELF_R_SYM(r->r_info);
> +               r->r_addend =3D TO_NATIVE(*location) + sym->st_value;
>                 break;
>         case R_ARM_PC24:
>         case R_ARM_CALL:
> --
> 2.39.2
>


--=20
Thanks,
~Nick Desaulniers
