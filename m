Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31DFD70742A
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 May 2023 23:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjEQVYs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 May 2023 17:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjEQVYr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 May 2023 17:24:47 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7834BFE
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 14:24:20 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-759219bed84so78821385a.0
        for <linux-kbuild@vger.kernel.org>; Wed, 17 May 2023 14:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684358656; x=1686950656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ml8oPK36I7ToUAH8tt/Yfo6x69yihZNiInjsICOE6/I=;
        b=jY+n5z6SZljQjlnPxAsk+uUV80QNM5CEWMGUUJ1VPZkChJbTSdEmf80gn7aglmGGBb
         HxLkJ8iUD++chvnb0pApuiL+FMNWI+3iTjd8etAE8IK8QcSpLt944ogIAj9e6FBpYDGs
         QvXFIPTtX3TGQJasnhMOl1W7lYDIJTWtiJ+39W8CY4ekx1C8DaHQe0w/cssRzc61Qnaj
         W7A3ZYExyp4I877R+p71xj51rb0NyvQzatuuxEcAKUWItt+/jxRdJFfMCMTh7dsFOGEV
         OwyZY4/5SZ1MWF42ti0pXojeGxV2Z9Bn49rTYkfzzDiKXfZskR2y67YrYuEL4xACIGZ8
         gN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684358656; x=1686950656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ml8oPK36I7ToUAH8tt/Yfo6x69yihZNiInjsICOE6/I=;
        b=LzxcYuj35HKRiU4a5dLv4TyXa+FGm1gwxoBCFS7c828xnMJRnqBvRrWUdvwNs27arw
         2JoXOEP+Ut84Gx0/6CcSbvM+aGzaW9q9sYx9aanUCFYHZiRlawT53+NRHMSgiavwFx9g
         7ieJeEpiIwc3gU+tm7PInXIr+sZ3zIBM6X+niwzMDzJhDOJ+RkrzX/wkERG1QAW0Z51B
         BsXz2GAgztqzHcxzPDYug7NEjiQWIF1HA/vv6QyNsl1gjBIdSK6Bei520Vjw20fWR6wj
         RvcM7DS3FHeciuelgNR88WY4DDWCWm+YBvHALha0yzFad9If8CuwFN4mBcnbjW+ezRkJ
         O0CA==
X-Gm-Message-State: AC+VfDwHfKDXeb9/oacMZtW2SzySKUyk+WuBhRz4APCqRxNxJLrECzys
        qv7jhO31DP0AulO/d6V6n51VcHK1ymcX6g5xdZYJFXwjUMiDSPeaq10=
X-Google-Smtp-Source: ACHHUZ4xbrBf1hiW2IU1NcTwCuNOM6I1Fog7WteVKVv8v1vplR2pyGXBc1uc7AvD7gkSiAE3A8aB4gL+5AJzczLEDeM=
X-Received: by 2002:ad4:5c86:0:b0:5e9:429b:559f with SMTP id
 o6-20020ad45c86000000b005e9429b559fmr2332945qvh.13.1684358656403; Wed, 17 May
 2023 14:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230514152739.962109-1-masahiroy@kernel.org> <20230514152739.962109-15-masahiroy@kernel.org>
 <CAKwvOdkZgu7wmaxFMKKjY1WscWto=vU=KAEO-pVmJ8+zegWG4g@mail.gmail.com>
In-Reply-To: <CAKwvOdkZgu7wmaxFMKKjY1WscWto=vU=KAEO-pVmJ8+zegWG4g@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 17 May 2023 14:24:03 -0700
Message-ID: <CAKwvOdnBNCRp1AYOaBQKOGvUGsmC4WKfF9cARgBjVuQPgKpB7g@mail.gmail.com>
Subject: Re: [PATCH v5 14/21] modpost: remove is_shndx_special() check from section_rel(a)
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Pitre <npitre@baylibre.com>,
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

On Wed, May 17, 2023 at 2:23=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Sun, May 14, 2023 at 8:28=E2=80=AFAM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > This check is unneeded. Without it, sec_name() will returns the null
> > string "", then section_mismatch() will return immediately.
> >
> > Anyway, special section indices do not appear quite often in these
> > loops.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Could almost eliminate is_shndx_special after this. I think there's
> only one callsite after this? (I should check with the series applied;
> this patch fails to apply on mainline if that's relevant for potential
> merge conflicts).
>
> Does doing that additional work speed things up though?

Either way,
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> > ---
> >
> >  scripts/mod/modpost.c | 16 ++++------------
> >  1 file changed, 4 insertions(+), 12 deletions(-)
> >
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index 0ef9d6964b6a..28db215ecc71 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -1370,7 +1370,6 @@ static int addend_mips_rel(struct elf_info *elf, =
Elf_Shdr *sechdr, Elf_Rela *r)
> >  static void section_rela(const char *modname, struct elf_info *elf,
> >                          Elf_Shdr *sechdr)
> >  {
> > -       Elf_Sym  *sym;
> >         Elf_Rela *rela;
> >         Elf_Rela r;
> >         unsigned int r_sym;
> > @@ -1413,11 +1412,8 @@ static void section_rela(const char *modname, st=
ruct elf_info *elf,
> >                                 continue;
> >                         break;
> >                 }
> > -               sym =3D elf->symtab_start + r_sym;
> > -               /* Skip special sections */
> > -               if (is_shndx_special(sym->st_shndx))
> > -                       continue;
> > -               check_section_mismatch(modname, elf, sym,
> > +
> > +               check_section_mismatch(modname, elf, elf->symtab_start =
+ r_sym,
> >                                        fsecndx, fromsec, r.r_offset, r.=
r_addend);
> >         }
> >  }
> > @@ -1425,7 +1421,6 @@ static void section_rela(const char *modname, str=
uct elf_info *elf,
> >  static void section_rel(const char *modname, struct elf_info *elf,
> >                         Elf_Shdr *sechdr)
> >  {
> > -       Elf_Sym *sym;
> >         Elf_Rel *rel;
> >         Elf_Rela r;
> >         unsigned int r_sym;
> > @@ -1472,11 +1467,8 @@ static void section_rel(const char *modname, str=
uct elf_info *elf,
> >                 default:
> >                         fatal("Please add code to calculate addend for =
this architecture\n");
> >                 }
> > -               sym =3D elf->symtab_start + r_sym;
> > -               /* Skip special sections */
> > -               if (is_shndx_special(sym->st_shndx))
> > -                       continue;
> > -               check_section_mismatch(modname, elf, sym,
> > +
> > +               check_section_mismatch(modname, elf, elf->symtab_start =
+ r_sym,
> >                                        fsecndx, fromsec, r.r_offset, r.=
r_addend);
> >         }
> >  }
> > --
> > 2.39.2
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
