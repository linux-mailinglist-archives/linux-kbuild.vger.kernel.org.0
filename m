Return-Path: <linux-kbuild+bounces-2423-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 659CB9298B4
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Jul 2024 17:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 049B1B25000
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Jul 2024 15:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49E426AC1;
	Sun,  7 Jul 2024 15:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKa+uu17"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFB51865B;
	Sun,  7 Jul 2024 15:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720366849; cv=none; b=UxpZcwQJU/t9UFyVn6iwr7ybUHYUcvuPbNt1J+hRVlrBRuo2ceAVwZyo2YELkFyf31L0VbLGoegr0SitAmM41no8ok9UOvq2KKhjRilGdh2zTR8iOiu7XLlMCRI2tlaRo+wNLtUxP8HyQTP78JwsQWYQb/lNLQtENEcIa9dkZHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720366849; c=relaxed/simple;
	bh=Ebpk4xmCeSnhCg+GU2h3gK6yRFEje2anfveX6+FCeos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeamhivTynEz8gCuJaQdRhensBeRxUznAC92UhPT9g1zSHivvyme9w/GV28CXcrlUwv+2doAsVNYl4UhwL5hG/lkTM7hlHh6PQ42A3SHJbVrSby+fZy/b1bDZ7paeVyGzml8ElDTebrh9r64B2mFH6ZTvwrTQVgI78aCzfC0SQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKa+uu17; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E4B4C3277B;
	Sun,  7 Jul 2024 15:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720366849;
	bh=Ebpk4xmCeSnhCg+GU2h3gK6yRFEje2anfveX6+FCeos=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eKa+uu17RbhrCsgJp0jLOARZJD60InlJdl5yw/Q4GxU84wbRG52kLmXQ3nUHvZkF1
	 AS3zY3lgEugXpP5nVMtuoBTcJUUdD9gijCGWHwToEry9AFcV3Hm3zBGfigBuoT2oiH
	 crOiE3b0Z/TV0PgTQna6B3mByS/Zb+o+BJ2RbrjPCF+lqkRVPYNP+qAY85FB3K/QZ6
	 suArffe6jZEMAfgovB8GTEEgouYwdoEDG/UkR8Z765gbncBXmNQ6eN4LDeiIPDiVVj
	 iDGKVDFVslwBl+6picTJPx4t0jaEOxwyLnBByH1OFNMCTcVxDmtL5Tq9fv39uWuFE7
	 A+AC9ebnp5NLw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52e9a550e9fso3580453e87.0;
        Sun, 07 Jul 2024 08:40:48 -0700 (PDT)
X-Gm-Message-State: AOJu0YxBp6YQAWZXcvcqQa4oqdbmeMH9f05Vc5cjQFg0ABc+mBFVRl3Y
	FXskegyf/aowqe2svfHvzKun0Ox3n6QS51YCcb5j+jqXC70jtCTdd51fL1FqQdeMfyb25axOSiv
	WPHLrJ7NH78/vPmN/31esm+RoyKQ=
X-Google-Smtp-Source: AGHT+IFEzbOjTWB2ykT2MNNANIPfDMTbw6aphNsdhMO2wfQT018J6OSNZ1W1kadGeiO2TQ6SilV43mMhW8ZC8/GEj1U=
X-Received: by 2002:a05:6512:2009:b0:52c:89b3:6d74 with SMTP id
 2adb3069b0e04-52ea0dcc74cmr3044865e87.6.1720366847616; Sun, 07 Jul 2024
 08:40:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240707153856.2483047-1-masahiroy@kernel.org> <20240707153856.2483047-3-masahiroy@kernel.org>
In-Reply-To: <20240707153856.2483047-3-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 8 Jul 2024 00:40:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT2cZJAkFjOT=-pkV83TW_mCaymoeNt9xMNGSPYrti_mw@mail.gmail.com>
Message-ID: <CAK7LNAT2cZJAkFjOT=-pkV83TW_mCaymoeNt9xMNGSPYrti_mw@mail.gmail.com>
Subject: Re: [PATCH 3/4] kconfig: remove P_CHOICEVAL property
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

P_CHOICEVAL -> SYMBOL_CHOICEVAL


On Mon, Jul 8, 2024 at 12:39=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> This flag is unneeded because a choice member can be detected by
> other means.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/kconfig/expr.h   | 1 -
>  scripts/kconfig/gconf.c  | 2 +-
>  scripts/kconfig/lkc.h    | 5 +----
>  scripts/kconfig/menu.c   | 5 -----
>  scripts/kconfig/symbol.c | 6 ++++++
>  5 files changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
> index 54b008c0161d..6e47e0ad6e6e 100644
> --- a/scripts/kconfig/expr.h
> +++ b/scripts/kconfig/expr.h
> @@ -131,7 +131,6 @@ struct symbol {
>
>  #define SYMBOL_CONST      0x0001  /* symbol is const */
>  #define SYMBOL_CHECK      0x0008  /* used during dependency checking */
> -#define SYMBOL_CHOICEVAL  0x0020  /* used as a value in a choice block *=
/
>  #define SYMBOL_VALID      0x0080  /* set when symbol.curr is calculated =
*/
>  #define SYMBOL_WRITE      0x0200  /* write symbol to file (KCONFIG_CONFI=
G) */
>  #define SYMBOL_WRITTEN    0x0800  /* track info to avoid double-write to=
 .config */
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index 6b50e25133e3..c0f46f189060 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -1070,7 +1070,7 @@ static gchar **fill_row(struct menu *menu)
>                 row[COL_BTNVIS] =3D GINT_TO_POINTER(FALSE);
>                 return row;
>         }
> -       if (sym->flags & SYMBOL_CHOICEVAL)
> +       if (sym_is_choice_value(sym))
>                 row[COL_BTNRAD] =3D GINT_TO_POINTER(TRUE);
>
>         stype =3D sym_get_type(sym);
> diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
> index 3fa46610f25f..401bdf36323a 100644
> --- a/scripts/kconfig/lkc.h
> +++ b/scripts/kconfig/lkc.h
> @@ -128,10 +128,7 @@ static inline bool sym_is_choice(const struct symbol=
 *sym)
>         return sym->name =3D=3D NULL;
>  }
>
> -static inline bool sym_is_choice_value(const struct symbol *sym)
> -{
> -       return sym->flags & SYMBOL_CHOICEVAL ? true : false;
> -}
> +bool sym_is_choice_value(const struct symbol *sym);
>
>  static inline bool sym_has_value(const struct symbol *sym)
>  {
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 2a9b4c4f4428..cd34cc5aefcf 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -467,11 +467,6 @@ static void _menu_finalize(struct menu *parent, bool=
 inside_choice)
>                 sym->dir_dep.expr =3D expr_alloc_or(sym->dir_dep.expr, pa=
rent->dep);
>         }
>         for (menu =3D parent->list; menu; menu =3D menu->next) {
> -               if (sym && sym_is_choice(sym) &&
> -                   menu->sym && !sym_is_choice_value(menu->sym)) {
> -                       menu->sym->flags |=3D SYMBOL_CHOICEVAL;
> -               }
> -
>                 /*
>                  * This code serves two purposes:
>                  *
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 3255bf310cb2..6c6f238c4f7b 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -871,6 +871,11 @@ bool sym_is_changeable(const struct symbol *sym)
>         return !sym_is_choice(sym) && sym->visible > sym->rev_dep.tri;
>  }
>
> +bool sym_is_choice_value(const struct symbol *sym)
> +{
> +       return !list_empty(&sym->choice_link);
> +}
> +
>  HASHTABLE_DEFINE(sym_hashtable, SYMBOL_HASHSIZE);
>
>  struct symbol *sym_lookup(const char *name, int flags)
> @@ -908,6 +913,7 @@ struct symbol *sym_lookup(const char *name, int flags=
)
>         symbol->type =3D S_UNKNOWN;
>         symbol->flags =3D flags;
>         INIT_LIST_HEAD(&symbol->menus);
> +       INIT_LIST_HEAD(&symbol->choice_link);
>
>         hash_add(sym_hashtable, &symbol->node, hash);
>
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

