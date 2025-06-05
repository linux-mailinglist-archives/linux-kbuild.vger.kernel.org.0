Return-Path: <linux-kbuild+bounces-7372-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 317B9ACF842
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Jun 2025 21:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC6983AF8F5
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Jun 2025 19:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB9C27E7C8;
	Thu,  5 Jun 2025 19:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5LgfZyS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1220327E7C0;
	Thu,  5 Jun 2025 19:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749152852; cv=none; b=ImjCDyE6cTvdElIUvJQu6YVlzl5DGkzwCyRd3z6cmta88C7Uxc6phJwVujuMHUR+v8vj63Ggrwj2TtNDNUAh6fAc/cJLGzZx+Uu8teZB9bf4Rl+NG/bhXCVO2DGgMrVDvHCMFuxHKnBOs4gQnemgVg7Nov7N25v9P24J5eVYnyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749152852; c=relaxed/simple;
	bh=eo11vjDRDq3mejcd/trm8I0EIFj0unuN7KWTXiP41yI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W6379a9Aq5hEDp+nBpPoy1gdJHFVkt+s+TrXpsMXq6uifzgTNl4+7S4vrrCSccLU88Pw9MqxdzGD0e5V4q1QEeRux4RZS7BnOXtWgNcdWY1v+8bdhFMAd8H9WNv6unSSn4EF2Udk+RSg+EFn9bp7CkEPalo9R6vjbSMhh7et5nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5LgfZyS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C13C4AF09;
	Thu,  5 Jun 2025 19:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749152851;
	bh=eo11vjDRDq3mejcd/trm8I0EIFj0unuN7KWTXiP41yI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y5LgfZyS/f6dTfukaOa5EZknrw1NvbGK38N0kKjZ+u+29y5cEjd9t+HxeIgZ8//E3
	 2VbmSAQ0YMMmqEwF5yilmvivfkgCljMMJl4GBA05zqfCSYtzC6bCbT6btOwlUBfuhT
	 hfe9VCSiwTtwVsibHtvl+K1tB6HJ/z9Yk3PVUiIcvnrANVa/GnF4HOm3nKWAh6lpu3
	 XTsbclrmOOTfOMKvonIYjaPQe4ltL+RGHLhokde2k92FXyMe4oDCwV76BvVRV2u1tt
	 rAiCYcz3kYlqslH8Ju90xaFcej7EaLqIFoniILjgt2Bk9pSAbqAw+WyW3qL4EnezQp
	 4KGa6RqfJlLUw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54acc0cd458so1560236e87.0;
        Thu, 05 Jun 2025 12:47:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVtMESgddFeW1b2GZ4a637U06WeafNDDSUKCC4FL2QqD8FCCkBpzHSBJJasI+UGS7jQYhiZyisvbwktZYLt@vger.kernel.org, AJvYcCVzzqBUWylDox5EDQfQm5xqrtObMhOaRZ3XWPNoV5npjokw7WbymyleQpuJutawGxR9oczAkKNiMFzKlKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDXxMIYRX8FDhZ87LWu9XewI6ILnmy7ayxwHNQd+gmU6P+XSBV
	MGHHtM7OP2MPxc0iUFBbnigKtZaOcBc9u2cF7hDknfM1zziayEECgU3sYEXTaujid7k5gj/hQmd
	avUnf1FgYsj9Rm94a/jPgkv7QTmtUz8E=
X-Google-Smtp-Source: AGHT+IG/t1ZgYzQF9Iw/v7rqbGhn0QbUWNjdjy5Q0ho67l7BfjUpQgBElJkOQZ9REIPKzBLsATG/rIE5qUVdx6OU2iI=
X-Received: by 2002:a05:6512:4017:b0:54a:fa5a:e9b1 with SMTP id
 2adb3069b0e04-55366bd49fdmr101656e87.10.1749152850238; Thu, 05 Jun 2025
 12:47:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603130213.338518-1-petr.pavlu@suse.com>
In-Reply-To: <20250603130213.338518-1-petr.pavlu@suse.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 6 Jun 2025 04:46:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQxXR64=GjMOnr_hpEqLWEZwH_XUkvkmp0xabryE8WG0Q@mail.gmail.com>
X-Gm-Features: AX0GCFuhiyDSrCsvy5dO9Ne53j6nqEURNxG8AhcaMWTlYdu4Hd3e-Lt_NpGC5C0
Message-ID: <CAK7LNAQxXR64=GjMOnr_hpEqLWEZwH_XUkvkmp0xabryE8WG0Q@mail.gmail.com>
Subject: Re: [PATCH v2] genksyms: Fix enum consts from a reference affecting
 new values
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 10:02=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> Enumeration constants read from a symbol reference file can incorrectly
> affect new enumeration constants parsed from an actual input file.
>
> Example:
>
>  $ cat test.c
>  enum { E_A, E_B, E_MAX };
>  struct bar { int mem[E_MAX]; };
>  int foo(struct bar *a) {}
>  __GENKSYMS_EXPORT_SYMBOL(foo);
>
>  $ cat test.c | ./scripts/genksyms/genksyms -T test.0.symtypes
>  #SYMVER foo 0x070d854d
>
>  $ cat test.0.symtypes
>  E#E_MAX 2
>  s#bar struct bar { int mem [ E#E_MAX ] ; }
>  foo int foo ( s#bar * )
>
>  $ cat test.c | ./scripts/genksyms/genksyms -T test.1.symtypes -r test.0.=
symtypes
>  <stdin>:4: warning: foo: modversion changed because of changes in enum c=
onstant E_MAX
>  #SYMVER foo 0x9c9dfd81
>
>  $ cat test.1.symtypes
>  E#E_MAX ( 2 ) + 3
>  s#bar struct bar { int mem [ E#E_MAX ] ; }
>  foo int foo ( s#bar * )
>
> The __add_symbol() function includes logic to handle the incrementation o=
f
> enumeration values, but this code is also invoked when reading a referenc=
e
> file. As a result, the variables last_enum_expr and enum_counter might be
> incorrectly set after reading the reference file, which later affects
> parsing of the actual input.
>
> Fix the problem by splitting the logic for the incrementation of
> enumeration values into a separate function process_enum() and call it fr=
om
> __add_symbol() only when processing non-reference data.
>
> Fixes: e37ddb825003 ("genksyms: Track changes to enum constants")
> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
> ---
>
> Changes since v1 [1]:
> - Remove the unnecessary condition 'type =3D=3D SYM_ENUM' in process_enum=
().


Applied to linux-kbuild. Thanks.



> [1] https://lore.kernel.org/linux-kbuild/20250527142318.14175-1-petr.pavl=
u@suse.com/
>
>  scripts/genksyms/genksyms.c | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
> index 8b0d7ac73dbb..83e48670c2fc 100644
> --- a/scripts/genksyms/genksyms.c
> +++ b/scripts/genksyms/genksyms.c
> @@ -181,13 +181,9 @@ static int is_unknown_symbol(struct symbol *sym)
>                         strcmp(defn->string, "{") =3D=3D 0);
>  }
>
> -static struct symbol *__add_symbol(const char *name, enum symbol_type ty=
pe,
> -                           struct string_list *defn, int is_extern,
> -                           int is_reference)
> +static struct string_list *process_enum(const char *name, enum symbol_ty=
pe type,
> +                                       struct string_list *defn)
>  {
> -       unsigned long h;
> -       struct symbol *sym;
> -       enum symbol_status status =3D STATUS_UNCHANGED;
>         /* The parser adds symbols in the order their declaration complet=
es,
>          * so it is safe to store the value of the previous enum constant=
 in
>          * a static variable.
> @@ -216,7 +212,7 @@ static struct symbol *__add_symbol(const char *name, =
enum symbol_type type,
>                                 defn =3D mk_node(buf);
>                         }
>                 }
> -       } else if (type =3D=3D SYM_ENUM) {
> +       } else {
>                 free_list(last_enum_expr, NULL);
>                 last_enum_expr =3D NULL;
>                 enum_counter =3D 0;
> @@ -225,6 +221,23 @@ static struct symbol *__add_symbol(const char *name,=
 enum symbol_type type,
>                         return NULL;
>         }
>
> +       return defn;
> +}
> +
> +static struct symbol *__add_symbol(const char *name, enum symbol_type ty=
pe,
> +                           struct string_list *defn, int is_extern,
> +                           int is_reference)
> +{
> +       unsigned long h;
> +       struct symbol *sym;
> +       enum symbol_status status =3D STATUS_UNCHANGED;
> +
> +       if ((type =3D=3D SYM_ENUM_CONST || type =3D=3D SYM_ENUM) && !is_r=
eference) {
> +               defn =3D process_enum(name, type, defn);
> +               if (defn =3D=3D NULL)
> +                       return NULL;
> +       }
> +
>         h =3D crc32(name);
>         hash_for_each_possible(symbol_hashtable, sym, hnode, h) {
>                 if (map_to_ns(sym->type) !=3D map_to_ns(type) ||
>
> base-commit: 546b1c9e93c2bb8cf5ed24e0be1c86bb089b3253
> --
> 2.49.0
>
>


--=20
Best Regards
Masahiro Yamada

