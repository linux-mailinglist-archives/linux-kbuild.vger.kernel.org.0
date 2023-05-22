Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 187E970C4BA
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 May 2023 19:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbjEVR4e (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 May 2023 13:56:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbjEVR4d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 May 2023 13:56:33 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D874FD
        for <linux-kbuild@vger.kernel.org>; Mon, 22 May 2023 10:56:32 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-62381fe42b3so28155476d6.0
        for <linux-kbuild@vger.kernel.org>; Mon, 22 May 2023 10:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684778191; x=1687370191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXu554m4l5lkSSuU8scTxxrh2rIrybtjbuunAaVMS6M=;
        b=6R6Xuz2WYLNqFqcWYkB0qy2OU0/5A3pSp0iCnWyFXcYtVRqyRaHQLbLQLMqWvoHAqi
         XPWUW5l2o5IiTHg3rNo8prwF/RdW7LUARZN7hh9nsQb44h0f/mShSlGLyEY3Fo02NnEq
         mY8LsRltpXZTF7FEmcbR21SLlkxHoFLateRbuk9e15CEZhvkSc2GwnaS8w0M1/huJrv1
         SIT36mOhZWPOUooNL2fX1pigwzj3PLMjQMn3rDrJsNwV6oxjnYaPAOKqtwOqbAk079fm
         M0vRj8IlimWn1G6Xkb68aq/Yr5VbJBhiTi7cIcoN8RULEZsS+MRLq9fXQREeNBvMrbRG
         Oj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684778191; x=1687370191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXu554m4l5lkSSuU8scTxxrh2rIrybtjbuunAaVMS6M=;
        b=QG6QTjKroLKvlj31mhLALNbtJYLDbQ49/WOGcrxSfj61njbsTfZXqHlYfSN/uPvPwA
         EZz2n3LkFmEiiJS70VqdtWKiWRr8Ed78DXPet36UlExYPwa96O/bVT8d6EKxoe+oFh0t
         NZS69va816REDb1U/mZohGS10bxNtiFfZnaXK/0uql9HhqktuScWbLDErg8wIVIItIPf
         N5M7e6IZMfqS3L3i2FPvCgkWHwrR6uRMFPdLlkK+UcwtllTTUCzHT1aGrIJIl7DZ0Pgp
         /BbAPRzBXm8XgAWJt+cR99Tg3CSxazL0PFP+SvuTjOjozgLKlfb6AVfUndAdhnTaEEd6
         8BHw==
X-Gm-Message-State: AC+VfDwXKedy1DKyD8cPeMu9CsTdJPbDpx0m2QzWgzjrd83YdPMlD+Dg
        J9wpo9b3bja/I0+KWHJmd9aIHAMBgjD2SxxJFKNDFb9oVzgJTftnvQw=
X-Google-Smtp-Source: ACHHUZ5Uq3GLy2552YvGQzU2l81xm6dJRT1S3/tG40LO8/m91yXrfSuKs/vkOcRY60K0hOUGLFl6C46t29ez4Ieg8GI=
X-Received: by 2002:ad4:4eef:0:b0:624:c497:526a with SMTP id
 dv15-20020ad44eef000000b00624c497526amr12884208qvb.24.1684778191057; Mon, 22
 May 2023 10:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230521160426.1881124-1-masahiroy@kernel.org> <20230521160426.1881124-3-masahiroy@kernel.org>
In-Reply-To: <20230521160426.1881124-3-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 22 May 2023 10:56:20 -0700
Message-ID: <CAKwvOd=B+dKWjxD-K-8btROvywp_Nei=CREeYZdCvKSGuHHJOA@mail.gmail.com>
Subject: Re: [PATCH v6 02/20] modpost: fix section mismatch message for R_ARM_ABS32
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Fangrui Song <maskray@google.com>
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

+ linux-arm-kernel and some folks who might know another idea.

On Sun, May 21, 2023 at 9:05=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> addend_arm_rel() processes R_ARM_ABS32 in a wrong way.
>
> Here, simple test code.
>
>   [test code 1]
>
>     #include <linux/init.h>
>
>     int __initdata foo;
>     int get_foo(int x) { return foo; }
>
> If you compile it with ARM versatile_defconfig, modpost will show the
> symbol name, (unknown).
>
>   WARNING: modpost: vmlinux.o: section mismatch in reference: get_foo (se=
ction: .text) -> (unknown) (section: .init.data)
>
> If you compile it for other architectures, modpost will show the correct
> symbol name.
>
>   WARNING: modpost: vmlinux.o: section mismatch in reference: get_foo (se=
ction: .text) -> foo (section: .init.data)
>
> For R_ARM_ABS32, addend_arm_rel() sets r->r_addend to a wrong value.
>
> I just mimicked the code in arch/arm/kernel/module.c.
>
> However, there is more difficulty for ARM.
>
> Here, test code.
>
>   [test code 2]
>
>     #include <linux/init.h>
>
>     int __initdata foo;
>     int get_foo(int x) { return foo; }
>
>     int __initdata bar;
>     int get_bar(int x) { return bar; }
>
> With this commit applied, modpost will show the following messages
> for ARM versatile_defconfig:
>
>   WARNING: modpost: vmlinux.o: section mismatch in reference: get_foo (se=
ction: .text) -> foo (section: .init.data)
>   WARNING: modpost: vmlinux.o: section mismatch in reference: get_bar (se=
ction: .text) -> foo (section: .init.data)
>
> The reference from 'get_bar' to 'foo' seems wrong.
>
> I have no solution for this because it is true in assembly level.
>
> In the following output, relocation at 0x1c is no longer associated
> with 'bar'. The two relocation entries point to the same symbol, and
> the offset to 'bar' is encoded in the instruction 'r0, [r3, #4]'.
>
>   Disassembly of section .text:
>
>   00000000 <get_foo>:
>      0: e59f3004          ldr     r3, [pc, #4]   @ c <get_foo+0xc>
>      4: e5930000          ldr     r0, [r3]
>      8: e12fff1e          bx      lr
>      c: 00000000          .word   0x00000000
>
>   00000010 <get_bar>:
>     10: e59f3004          ldr     r3, [pc, #4]   @ 1c <get_bar+0xc>
>     14: e5930004          ldr     r0, [r3, #4]
>     18: e12fff1e          bx      lr
>     1c: 00000000          .word   0x00000000
>
>   Relocation section '.rel.text' at offset 0x244 contains 2 entries:
>    Offset     Info    Type            Sym.Value  Sym. Name
>   0000000c  00000c02 R_ARM_ABS32       00000000   .init.data
>   0000001c  00000c02 R_ARM_ABS32       00000000   .init.data
>
> When find_elf_symbol() gets into a situation where relsym->st_name is
> zero, there is no guarantee to get the symbol name as written in C.
>
> I am keeping the current logic because it is useful in many architectures=
,
> but the symbol name is not always correct depending on the optimization
> of the relocation. I left some comments in find_tosym().
>
> Fixes: 56a974fa2d59 ("kbuild: make better section mismatch reports on arm=
")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v6:
>  - More detailed commit log
>
>  scripts/mod/modpost.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 71de14544432..34fbbd85bfde 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1124,6 +1124,10 @@ static Elf_Sym *find_tosym(struct elf_info *elf, E=
lf64_Sword addr,
>         if (relsym->st_name !=3D 0)
>                 return relsym;
>
> +       /*
> +        * Strive to find a better symbol name, but the resulting name do=
es not
> +        * always match the symbol referenced in the original code.
> +        */
>         relsym_secindex =3D get_secindex(elf, relsym);
>         for (sym =3D elf->symtab_start; sym < elf->symtab_stop; sym++) {
>                 if (get_secindex(elf, sym) !=3D relsym_secindex)
> @@ -1306,12 +1310,12 @@ static int addend_386_rel(struct elf_info *elf, E=
lf_Shdr *sechdr, Elf_Rela *r)
>  static int addend_arm_rel(struct elf_info *elf, Elf_Shdr *sechdr, Elf_Re=
la *r)
>  {
>         unsigned int r_typ =3D ELF_R_TYPE(r->r_info);
> +       Elf_Sym *sym =3D elf->symtab_start + ELF_R_SYM(r->r_info);
> +       unsigned int inst =3D TO_NATIVE(*reloc_location(elf, sechdr, r));
>
>         switch (r_typ) {
>         case R_ARM_ABS32:
> -               /* From ARM ABI: (S + A) | T */
> -               r->r_addend =3D (int)(long)
> -                             (elf->symtab_start + ELF_R_SYM(r->r_info));
> +               r->r_addend =3D inst + sym->st_value;
>                 break;
>         case R_ARM_PC24:
>         case R_ARM_CALL:
> --
> 2.39.2
>


--=20
Thanks,
~Nick Desaulniers
