Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF037DD5CF
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Oct 2023 19:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347032AbjJaSHi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Oct 2023 14:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347017AbjJaSHh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Oct 2023 14:07:37 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0795A3
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Oct 2023 11:07:34 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32d9effe314so4045405f8f.3
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Oct 2023 11:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698775653; x=1699380453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SL7XBKc+RaoWRznnIRBT+ecFmqke4jto2dLiQ9BSdJk=;
        b=po/HyosUunlaPd2Sr5UmuUlDaOZ+ZN/hBFEIPWgk+ywxM+56FXjsARKagseq7qiOmO
         XZ1lgkw04zDgF2+HBqZS2g8vNVvtrhiChZei6pglu+pgtxP3fs8M9iPw0gk1RldZABg8
         FCs750Jbdt1rtTrzoTzhC9YhbRWEIJRl2NITSCLcBmN24CJk8Grf/Iq3QkizWYrpu2xS
         wwKRw1WFUDm2jbjdGFr/2orGAAYUXgB3HD8Nh8EglfFu0Z7dynHyfahI2+VUj2xNWBok
         aRCj2EeXWw11mF2I7BRZ5xU+KA5TOLXh4LIvQYrozpSlWEneqQx+kzsMKySHV2WWB/0w
         FiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698775653; x=1699380453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SL7XBKc+RaoWRznnIRBT+ecFmqke4jto2dLiQ9BSdJk=;
        b=rhoLwNbmcMcmsI16UksvcUENnutpw8OrpeVJMAJm7hVQ9VzFt4e7HfLHMSN6MNozyN
         Sg1YEBXn9uJkVnxufAKjwtXNOQT5EAY68iLrGUswA76lTWhAHnYXPoLuFxLv5PEmxYXk
         IC38u8Cs6GCHXnCSa+eelWySt48Ead3GdsTGs92M+BFgtpAa2mjXv9s3q2ikUd35AnVK
         KE5+VXv2OjPw62gK0j4ud0xr0k0bowQz2t3dpC1N8ao4l4OdC322bDjl4ne5agfdRBq/
         mGOK1YpoXlE0d5eLi9LVThMx8RgUdde40nQ8lg4HYqzWgIAaAAi1OtoFKDka1yb8A5Dy
         3Ruw==
X-Gm-Message-State: AOJu0YxEt+BkkyW7xhMBd7Z/4jcqwmoe0t978h5zbNdcMRqQYhCyXlkQ
        +FYVym3k6NYE16OtNaPzhIJKHHahQWY4H9gaFT3vEw==
X-Google-Smtp-Source: AGHT+IHFLsB+x/Jlf8dLEZRxjUW+xtrhgdxgtcISHIyXwdiZB6X7J6AA6vWN4rFFxV90avuFKCaXlLTBqMN6bjVrnP8=
X-Received: by 2002:a05:600c:4708:b0:402:ff8d:609b with SMTP id
 v8-20020a05600c470800b00402ff8d609bmr11137029wmo.33.1698775653184; Tue, 31
 Oct 2023 11:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231031174627.684576-1-masahiroy@kernel.org>
In-Reply-To: <20231031174627.684576-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 31 Oct 2023 11:07:22 -0700
Message-ID: <CAKwvOd=TmAh-eAmOzRxb6Gri8AfOXc7t9mPXgDgDTtAnegZ3iw@mail.gmail.com>
Subject: Re: [PATCH] modpost: fix section mismatch message for RELA
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Albert Ou <aou@eecs.berkeley.edu>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-riscv@lists.infradead.org, Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 31, 2023 at 10:46=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> The section mismatch check prints a bogus symbol name on some
> architectures.
>
> [test code]
>
>   #include <linux/init.h>
>
>   int __initdata foo;
>   int get_foo(void) { return foo; }
>
> If you compile it with GCC for riscv or loongarch, modpost will show an
> incorrect symbol name:
>
>   WARNING: modpost: vmlinux: section mismatch in reference: get_foo+0x8 (=
section: .text) -> done (section: .init.data)
>
> To get the correct symbol address, st_value must be added
>
> This issue has never been noticed since commit 93684d3b8062 ("kbuild:
> include symbol names in section mismatch warnings") presumably because
> st_value becomes zero on most architectures when the referenced symbol
> is looked up. It is not true for riscv or loongarch, at least.
>
> With this fix, modpost will show the correct symbol name:
>
>   WARNING: modpost: vmlinux: section mismatch in reference: get_foo+0x8 (=
section: .text) -> foo (section: .init.data)
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/mod/modpost.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 973b5e5ae2dd..cb6406f485a9 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1383,13 +1383,15 @@ static void section_rela(struct module *mod, stru=
ct elf_info *elf,
>         const Elf_Rela *rela;
>
>         for (rela =3D start; rela < stop; rela++) {
> +               Elf_Sym *tsym;
>                 Elf_Addr taddr, r_offset;
>                 unsigned int r_type, r_sym;
>
>                 r_offset =3D TO_NATIVE(rela->r_offset);
>                 get_rel_type_and_sym(elf, rela->r_info, &r_type, &r_sym);
>
> -               taddr =3D TO_NATIVE(rela->r_addend);
> +               tsym =3D elf->symtab_start + r_sym;
> +               taddr =3D tsym->st_value + TO_NATIVE(rela->r_addend);
>
>                 switch (elf->hdr->e_machine) {
>                 case EM_RISCV:
> @@ -1404,7 +1406,7 @@ static void section_rela(struct module *mod, struct=
 elf_info *elf,
>                         break;
>                 }
>
> -               check_section_mismatch(mod, elf, elf->symtab_start + r_sy=
m,
> +               check_section_mismatch(mod, elf, tsym,
>                                        fsecndx, fromsec, r_offset, taddr)=
;
>         }
>  }
> --
> 2.40.1
>


--=20
Thanks,
~Nick Desaulniers
