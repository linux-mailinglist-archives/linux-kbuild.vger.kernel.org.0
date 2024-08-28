Return-Path: <linux-kbuild+bounces-3249-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE19961FFE
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 08:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 847B11C23616
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 06:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A72715746F;
	Wed, 28 Aug 2024 06:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1UawVKJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0505713C670;
	Wed, 28 Aug 2024 06:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724827842; cv=none; b=E3Np5rxfch09sSAkwmm0PPttTaca/FLeObszecLoSvZ7E+aFKjRg8kCPmA/ryjA3icfs+8kU88BZlRIVjWFBupyysskVakUppLpyZ9ia1OnTikIETvgcMQNb71ncuSvrcJ6qYhFXYx+l9SZqNy9E8wpdZ8WglBF1p5M7srgl3pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724827842; c=relaxed/simple;
	bh=Yb6We/5BV0z/R0UKdSV1tM+gyWec8gvt8hftmjbezaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H144gEYarhrkBWShBHtbqd3BB3GZPTxJ7ROV3qcz16mG6iKhba5VjpH5Ay4dV6aJL3bIZt2WPMjWEfpgGZXpEAD9QL1FuQKPH4qIDdiXLGuPB6fGy41fuyZiehZIMRZ3EgPO+1P8CXlEFQ7DgiO7uZNQ1E2Kpm1MoljmUI8VPok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1UawVKJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD6DDC4FE81;
	Wed, 28 Aug 2024 06:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724827841;
	bh=Yb6We/5BV0z/R0UKdSV1tM+gyWec8gvt8hftmjbezaQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N1UawVKJ1UD4ukkfF8wAXJlNG+DdNq07j2WhADtMWFRQX3GePm9Oewwdtjfuonxvd
	 fMnPihaFW/ateC9+rtF9nb0jBmIt9rUoMfHpP4Z5LqTMmpbODBmlN0JiZ4mcMrQ+Kz
	 rSan17ZBc5NxzYWQ3J4xUh8XbSUJi6j1FiAdjYq0UF2UuAZt4ZXdfaENg14YSuqSvW
	 1R1k+QmfOv1sIruBf1V3q/2n5oEILtpq5rzKxswMuBuD2MKRPTLy/KAnLn3ZDA4Xe9
	 b1lvpI1mofMpf7vQ2iOocFIgV4qFy3auGtbzZaLeu1EHRSvRBoBOLaTlLGMKwu4huY
	 PyHijBx5Jxquw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso1912407e87.0;
        Tue, 27 Aug 2024 23:50:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMYWYpjMnG4kt2ta4XJrAGn/m/hg8NysIlRF2E1LCQy7FS6wPoALKBK+YGpK8iTuaSQ9dMH4PaidIUkJg2@vger.kernel.org, AJvYcCVkLuhZVYl0UlEx6mZrrf4XW+X1bvN4ORrQUUYDyUuurbC1eeBvElGu4JCfqV9i3uG1qZ1qV6H1x8F6nzI=@vger.kernel.org, AJvYcCW/baYxHiBZFGt09aW7l8kn5zyMhi7ZGjFvtCdFKSIof5RDR6CmioeZVbsLaipwASFVQWgU7+l4vACGu/s8xg==@vger.kernel.org, AJvYcCXUkUh0Yop63DEj59v25Jzgksj6Jf6EftPaVbio2lZKG+nN3LGlOcSQl3qsiZ3FKzrP7rj79/i5Kz8Nz6u5NqU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1PQIi5MrwsOrbnNyu29/52AIP7Yk+xMHOgoQzZEX5oakMP8IY
	XGVpiowQI24zmyLr1eS1i1zLLeZ9uu6Ld6I2kNBlHyrq1H7NIpeJKyeHjaFhV/aj6eY0naGADGN
	S5TvkRrxd8+XQqO1k+QehtSFcrko=
X-Google-Smtp-Source: AGHT+IENzQvn4bzOP2nf8sy5Gl2O9cPo5Ffr2dp0+gYjzGWy6e/a5CG3BLbfeQDgWqBgT1Ic8k3iykMWTaoXDj1bzIk=
X-Received: by 2002:a05:6512:3b29:b0:52e:f2a6:8e1a with SMTP id
 2adb3069b0e04-5346c628bc1mr717001e87.29.1724827840086; Tue, 27 Aug 2024
 23:50:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com> <20240815173903.4172139-25-samitolvanen@google.com>
In-Reply-To: <20240815173903.4172139-25-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 28 Aug 2024 15:50:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNATb8zbwEVgM+_=CaYSysov6YBMbKjy8+t8CrRA_72jxuQ@mail.gmail.com>
Message-ID: <CAK7LNATb8zbwEVgM+_=CaYSysov6YBMbKjy8+t8CrRA_72jxuQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/19] gendwarfksyms: Add support for type pointers
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 2:39=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> The compiler may choose not to emit type information in DWARF for
> external symbols. Clang, for example, does this for symbols not
> defined in the current TU.
>
> To provide a way to work around this issue, add support for
> __gendwarfksyms_ptr_<symbol> pointers that force the compiler to emit
> the necessary type information in DWARF also for the missing symbols.
>
> Example usage:
>
>   #define GENDWARFKSYMS_PTR(sym) \
>       static typeof(sym) *__gendwarfksyms_ptr_##sym __used  \
>           __section(".discard.gendwarfksyms") =3D &sym;
>
>   extern int external_symbol(void);
>   GENDWARFKSYMS_PTR(external_symbol);
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>




Commit ddb5cdbafaaad6b99d7007ae1740403124502d03
had a similar idea; it has a reference to each
export symbol, including the ones defined in different TUs,
but in assembly code.

Didn't it suffice your need?





> ---
>  scripts/gendwarfksyms/dwarf.c         | 26 +++++++++++++++++++++++++-
>  scripts/gendwarfksyms/gendwarfksyms.h |  6 ++++++
>  scripts/gendwarfksyms/symbols.c       | 16 ++++++++++++++++
>  3 files changed, 47 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.=
c
> index 71cfab0553da..956b30224316 100644
> --- a/scripts/gendwarfksyms/dwarf.c
> +++ b/scripts/gendwarfksyms/dwarf.c
> @@ -94,6 +94,28 @@ static int process_variable(struct state *state, Dwarf=
_Die *die)
>         return check(process(state, "variable;\n"));
>  }
>
> +static int process_symbol_ptr(struct state *state, Dwarf_Die *die)
> +{
> +       Dwarf_Die ptr_type;
> +       Dwarf_Die type;
> +
> +       if (!get_ref_die_attr(die, DW_AT_type, &ptr_type) ||
> +           dwarf_tag(&ptr_type) !=3D DW_TAG_pointer_type) {
> +               error("%s must be a pointer type!", get_name(die));
> +               return -1;
> +       }
> +
> +       if (!get_ref_die_attr(&ptr_type, DW_AT_type, &type)) {
> +               error("%s pointer missing a type attribute?", get_name(di=
e));
> +               return -1;
> +       }
> +
> +       if (dwarf_tag(&type) =3D=3D DW_TAG_subroutine_type)
> +               return check(process_subprogram(state, &type));
> +       else
> +               return check(process_variable(state, &ptr_type));
> +}
> +
>  static int process_exported_symbols(struct state *state, Dwarf_Die *die)
>  {
>         int tag =3D dwarf_tag(die);
> @@ -114,7 +136,9 @@ static int process_exported_symbols(struct state *sta=
te, Dwarf_Die *die)
>
>                 debug("%s", state->sym->name);
>
> -               if (tag =3D=3D DW_TAG_subprogram)
> +               if (is_symbol_ptr(get_name(&state->die)))
> +                       check(process_symbol_ptr(state, &state->die));
> +               else if (tag =3D=3D DW_TAG_subprogram)
>                         check(process_subprogram(state, &state->die));
>                 else
>                         check(process_variable(state, &state->die));
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksym=
s/gendwarfksyms.h
> index cb9106dfddb9..8f6acd1b8f8f 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.h
> +++ b/scripts/gendwarfksyms/gendwarfksyms.h
> @@ -61,6 +61,11 @@ extern bool debug;
>  /*
>   * symbols.c
>   */
> +
> +/* See symbols.c:is_symbol_ptr */
> +#define SYMBOL_PTR_PREFIX "__gendwarfksyms_ptr_"
> +#define SYMBOL_PTR_PREFIX_LEN (sizeof(SYMBOL_PTR_PREFIX) - 1)
> +
>  struct symbol_addr {
>         uint32_t section;
>         Elf64_Addr address;
> @@ -78,6 +83,7 @@ struct symbol {
>         struct hlist_node name_hash;
>  };
>
> +extern bool is_symbol_ptr(const char *name);
>  extern int symbol_read_exports(FILE *file);
>  extern int symbol_read_symtab(int fd);
>  extern struct symbol *symbol_get(const char *name);
> diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symb=
ols.c
> index f96acb941196..d6d016458ae1 100644
> --- a/scripts/gendwarfksyms/symbols.c
> +++ b/scripts/gendwarfksyms/symbols.c
> @@ -41,6 +41,20 @@ static int __for_each_addr(struct symbol *sym, symbol_=
callback_t func,
>         return processed;
>  }
>
> +/*
> + * For symbols without debugging information (e.g. symbols defined in ot=
her
> + * TUs), we also match __gendwarfksyms_ptr_<symbol_name> symbols, which =
the
> + * kernel uses to ensure type information is present in the TU that expo=
rts
> + * the symbol. A __gendwarfksyms_ptr pointer must have the same type as =
the
> + * exported symbol, e.g.:
> + *
> + *   typeof(symname) *__gendwarf_ptr_symname =3D &symname;
> + */
> +bool is_symbol_ptr(const char *name)
> +{
> +       return name && !strncmp(name, SYMBOL_PTR_PREFIX, SYMBOL_PTR_PREFI=
X_LEN);
> +}
> +
>  static int for_each(const char *name, bool name_only, symbol_callback_t =
func,
>                     void *data)
>  {
> @@ -49,6 +63,8 @@ static int for_each(const char *name, bool name_only, s=
ymbol_callback_t func,
>
>         if (!name || !*name)
>                 return 0;
> +       if (is_symbol_ptr(name))
> +               name +=3D SYMBOL_PTR_PREFIX_LEN;
>
>         hash_for_each_possible_safe(symbol_names, match, tmp, name_hash,
>                                     name_hash(name)) {
> --
> 2.46.0.184.g6999bdac58-goog
>


--=20
Best Regards
Masahiro Yamada

