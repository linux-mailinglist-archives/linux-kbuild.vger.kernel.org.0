Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA3841FA7E
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Oct 2021 11:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232644AbhJBJCA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 2 Oct 2021 05:02:00 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:46087 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232630AbhJBJCA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Oct 2021 05:02:00 -0400
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 192901xr018821;
        Sat, 2 Oct 2021 18:00:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 192901xr018821
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1633165202;
        bh=JHz4i+8pt4AvIQSo/7hCa7srH2sFG4p4+x14KmlkQwI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fjb2UGCQvBDOOJwhMIwjj37f0VL0q89Ixt04GMjEb+m/hbQyw8x+vfZtajuOIsBC9
         VEY+Pj5ksURjNe5ZBEEPToMHrE+CHpMK27vOE06umTQKIpgODLybziyzz4Rgnz1LPm
         4AA3VigjRv3XMxB4RLmHkHYDcQTioWb/c6kNhC6z4RzSI8EPO2RurM3Qiw5+iVmWQO
         PoI3voLim0zDJRpvgACNDeSUe6eoSJCGTI0XhZmV8zM3Y2C30kDzHGV2Xw17KdXbsg
         beT+b5aM/fYv/HhxD3aO9QzOaj0LckIJ1yp4TbOBsM91mWstOX7wukrAHHSk+pDPTW
         Kysj8Ge9YLevA==
X-Nifty-SrcIP: [209.85.215.176]
Received: by mail-pg1-f176.google.com with SMTP id s75so824370pgs.5;
        Sat, 02 Oct 2021 02:00:01 -0700 (PDT)
X-Gm-Message-State: AOAM533Fecq62i7STSOXf5/KGA4JwtueQbyl/M6NXyBwZrckkXL5RZEM
        pxFhZO2xyKZ9afq5HcAQ58ZWwu4vSSsETHR0ytM=
X-Google-Smtp-Source: ABdhPJyeKNU0+QuV7Nj1yDalOKASW70c+miq82NS0k/L1i49x1prYQRUn8QHaTYY2YCXA87C1wDCxSvL9q1QYMBizGc=
X-Received: by 2002:a63:aa0b:: with SMTP id e11mr2143764pgf.128.1633165200771;
 Sat, 02 Oct 2021 02:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211001053253.1223316-1-masahiroy@kernel.org>
 <20211001053253.1223316-10-masahiroy@kernel.org> <20211001112831.499A27FEFB@deb-nschier.ads.avm.de>
In-Reply-To: <20211001112831.499A27FEFB@deb-nschier.ads.avm.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 2 Oct 2021 17:59:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT9wepoi92fMLta-kwQBLfYjPJ8tVKCAw_jnUBkXxnPYg@mail.gmail.com>
Message-ID: <CAK7LNAT9wepoi92fMLta-kwQBLfYjPJ8tVKCAw_jnUBkXxnPYg@mail.gmail.com>
Subject: Re: [PATCH 10/10] [for next only] kconfig: generate include/generated/rustc_cfg
To:     Nicolas Schier <n.schier@avm.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 1, 2021 at 8:29 PM <n.schier@avm.de> wrote:
>
> On Fri, Oct 01, 2021 at 02:32:53PM +0900, Masahiro Yamada wrote:
> > This patch is not intended for the mainline.
> >
> > I created this patch for Stephen Rothwell to resolve the merge
> > conflicts more easily.
> >
> > The Rust tree is touching scripts/kconfig/confdata.c to generate
> > include/generated/rustc_cfg, which would cause complicated conflicts
> > with changes from the kbuild tree.
> >
> > I re-implemented it to produce the equaivalent rustc_cfg.
> >
> > I also fixed the memory leak; the original code from the Rust tree
> > did not free the malloc'ed pointer.
> >
> > Stephen:
> > When you resolve the conflicts in confdata.c, please take this one.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/kconfig/confdata.c | 42 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >
> > diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> > index 9ece2f3b61a6..4767f3810cf4 100644
> > --- a/scripts/kconfig/confdata.c
> > +++ b/scripts/kconfig/confdata.c
> > @@ -603,6 +603,9 @@ static const struct comment_style comment_style_c = {
> >
> >  static void conf_write_heading(FILE *fp, const struct comment_style *cs)
> >  {
> > +     if (!cs) /* no heading for rustc_cfg? */
> > +             return;
> > +
> >       fprintf(fp, "%s\n", cs->comment_block_begin);
> >
> >       fprintf(fp, "%s Automatically generated file; DO NOT EDIT.\n",
> > @@ -750,6 +753,39 @@ static void print_symbol_for_c(FILE *fp, struct symbol *sym)
> >       free(escaped);
> >  }
> >
> > +/* rustc configuration */
> > +static void print_symbol_for_rustc_cfg(FILE *fp, struct symbol *sym)
> > +{
> > +     const char *val;
> > +     char *escaped;
> > +
> > +     if (sym->type == S_UNKNOWN)
> > +             return;
> > +
> > +     val = sym_get_string_value(sym);
> > +     escaped = escape_string_value(val);
> > +
> > +     if (sym->type == S_BOOLEAN || sym->type == S_TRISTATE) {
> > +             if (*val == 'n')
> > +                     return;
>
> I'd expect a "free(escaped);" here.


Thank you for catching it.

I just sent v2.





-- 
Best Regards
Masahiro Yamada
