Return-Path: <linux-kbuild+bounces-3269-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DA8962FE0
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 20:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD8701C25601
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 18:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9069B1AB503;
	Wed, 28 Aug 2024 18:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0DA1P7s"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2AC1AB517;
	Wed, 28 Aug 2024 18:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724869384; cv=none; b=TBVky7kVJE94047FkI5Bn/74sNZ42f435IowKhfD/oCGqB05gSglqKru5eXqSbLRgX+nKIUkq2PQBkBBpQ8dZDBq+HCtBF+25n0y4jLbZrPFhnOh7Byh5ghNdvaYgvf2hUbQnQxPQnsNN+XreurWeb+ofOSsSfF33/ZcIZhnz/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724869384; c=relaxed/simple;
	bh=ZPEqj12unuqmbPhzrpB4Ppp8Gj6/0C6oJfxOrcdRY0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jg1/YfDHGF9Hb4ThTLNmktCZF055CFdvaWkxBpxanQ092Qu8GibYq1QkHF2gL01TbYiIB25kCKU72k31Uk1GvnOsjhZpIRKj17nONm22z0/rizc5O8whuoipxfgYAymlevxFaz2/6tHLQfqtEUN9NL9p31TE9RoL2BEnFixznSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0DA1P7s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB78C4CEC3;
	Wed, 28 Aug 2024 18:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724869383;
	bh=ZPEqj12unuqmbPhzrpB4Ppp8Gj6/0C6oJfxOrcdRY0I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=n0DA1P7s0d0BPkuK3LGk5IbracbSzFfGUzBDgYdFmSISF4MC+kGhamJ15wVkr9oR/
	 OGp2B46q0v75xMBXwgbRkuTEEGaNRs/SdkVmTYi7D5Jw/mBHgRnVKBs9aLoXX8RJ/v
	 aQpNEBudFC2uLwyhomWruCwHwZ6SM+coUvFhyV9JmgUj7mCyvxRuI4UqKM1Pln7hUw
	 k/omBsyOKEF0xDcATy/CsaCk7hzH1npu4b6AHWP6tbLUZ6oRR6ygh//1y7MQOGzcxp
	 Xfwzircjr2bmkPsekkMd13OODhQfwYlJAC7SZbPJrwEvGbCGQWyQBL8KASWX0Hp1VK
	 ULtYS6NomzywA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f401b2347dso9493791fa.1;
        Wed, 28 Aug 2024 11:23:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3FurQofjYcnz8hzspqRWI0fuzqQwGh5nE4vViqaQ+fLDCIVCWAe4K+/BSvIY9aa7wwJKveR0Fl4zvpKdwCQk=@vger.kernel.org, AJvYcCVsp84wZejNGVpE7693m83+2k3o+1b8t+XEcH2r7hk8VlJf9uJnZ4AOLSzh9u2PMbftwtQf73acal4MWdydRw==@vger.kernel.org, AJvYcCWjIeGsobA35P8rWXhEVglWrEpP3FI0kLIk1JPFDB4DY5yjDtvzo/5a86nErMRGXu6C6rNiHB3DGLKq6oY=@vger.kernel.org, AJvYcCXdVFbf4vbBvWlWDgvwv1ZXjBPtHjS4Weo2HtI1F0JMEDfXVE08CNe21RsI/J9A1Dr+3qvTzLgeSYtfvb7V@vger.kernel.org
X-Gm-Message-State: AOJu0YwQqYRx4X4YoVxTFM5rRI2/F3jWT5k/mGZP3tczLK/hmNy4jl8v
	QLgQo5yFNbMKlR7A9TCrUj65/MgAC8yAsFgI4f8cXTZ/kW2oueb6yQ+9k3HZ/W0p+DkIdJsOW1Z
	Q64NuxDhVmkT9xTFJ7Vr0KLuQ5lk=
X-Google-Smtp-Source: AGHT+IFg/5nvahms9IA0cUD2Xy1KvSzEcJhA3j5EkczAEmqOQM4lkIGJmdCODQo4ptJgRj5W19BUN7qyBinuvwGprpM=
X-Received: by 2002:a2e:b8d6:0:b0:2f3:f1cf:5314 with SMTP id
 38308e7fff4ca-2f6129ba3d2mr175401fa.10.1724869382232; Wed, 28 Aug 2024
 11:23:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com> <20240815173903.4172139-24-samitolvanen@google.com>
In-Reply-To: <20240815173903.4172139-24-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 29 Aug 2024 03:22:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNASAzsgmkWGOU7WWuBMmzG4vPRDQLjyW4sW+q46QZT=vnQ@mail.gmail.com>
Message-ID: <CAK7LNASAzsgmkWGOU7WWuBMmzG4vPRDQLjyW4sW+q46QZT=vnQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/19] gendwarfksyms: Add address matching
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
> The compiler may choose not to emit type information in DWARF for all
> aliases, but it's possible for each alias to be exported separately.
> To ensure we find type information for the aliases as well, read
> {section, address} tuples from the symbol table and match symbols also
> by address.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  scripts/gendwarfksyms/gendwarfksyms.c |   2 +
>  scripts/gendwarfksyms/gendwarfksyms.h |   7 ++
>  scripts/gendwarfksyms/symbols.c       | 161 +++++++++++++++++++++++++-
>  3 files changed, 165 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksym=
s/gendwarfksyms.c
> index d209b237766b..e2f8ee5a4bf3 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.c
> +++ b/scripts/gendwarfksyms/gendwarfksyms.c
> @@ -118,6 +118,8 @@ int main(int argc, const char **argv)
>                         return -1;
>                 }
>
> +               check(symbol_read_symtab(fd));
> +
>                 dwfl =3D dwfl_begin(&callbacks);
>                 if (!dwfl) {
>                         error("dwfl_begin failed for '%s': %s", object_fi=
les[n],
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksym=
s/gendwarfksyms.h
> index 03f3e408a839..cb9106dfddb9 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.h
> +++ b/scripts/gendwarfksyms/gendwarfksyms.h
> @@ -61,6 +61,10 @@ extern bool debug;
>  /*
>   * symbols.c
>   */
> +struct symbol_addr {
> +       uint32_t section;
> +       Elf64_Addr address;
> +};
>
>  static inline u32 name_hash(const char *name)
>  {
> @@ -69,10 +73,13 @@ static inline u32 name_hash(const char *name)
>
>  struct symbol {
>         const char *name;
> +       struct symbol_addr addr;
> +       struct hlist_node addr_hash;
>         struct hlist_node name_hash;
>  };
>
>  extern int symbol_read_exports(FILE *file);
> +extern int symbol_read_symtab(int fd);
>  extern struct symbol *symbol_get(const char *name);
>
>  /*
> diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symb=
ols.c
> index 673ad9cf9e77..f96acb941196 100644
> --- a/scripts/gendwarfksyms/symbols.c
> +++ b/scripts/gendwarfksyms/symbols.c
> @@ -6,11 +6,43 @@
>  #include "gendwarfksyms.h"
>
>  #define SYMBOL_HASH_BITS 15
> +
> +/* struct symbol_addr -> struct symbol */
> +static DEFINE_HASHTABLE(symbol_addrs, SYMBOL_HASH_BITS);
> +/* name -> struct symbol */
>  static DEFINE_HASHTABLE(symbol_names, SYMBOL_HASH_BITS);
>
> +static inline u32 symbol_addr_hash(const struct symbol_addr *addr)
> +{
> +       return jhash(addr, sizeof(struct symbol_addr), 0);
> +}
> +
>  typedef int (*symbol_callback_t)(struct symbol *, void *arg);
>
> -static int for_each(const char *name, symbol_callback_t func, void *data=
)
> +static int __for_each_addr(struct symbol *sym, symbol_callback_t func,
> +                          void *data)
> +{
> +       struct hlist_node *tmp;
> +       struct symbol *match =3D NULL;
> +       int processed =3D 0;
> +
> +       hash_for_each_possible_safe(symbol_addrs, match, tmp, addr_hash,
> +                                   symbol_addr_hash(&sym->addr)) {
> +               if (match =3D=3D sym)
> +                       continue; /* Already processed */
> +
> +               if (match->addr.section =3D=3D sym->addr.section &&
> +                   match->addr.address =3D=3D sym->addr.address) {
> +                       check(func(match, data));
> +                       ++processed;
> +               }
> +       }
> +
> +       return processed;
> +}
> +
> +static int for_each(const char *name, bool name_only, symbol_callback_t =
func,
> +                   void *data)
>  {
>         struct hlist_node *tmp;
>         struct symbol *match;
> @@ -23,9 +55,13 @@ static int for_each(const char *name, symbol_callback_=
t func, void *data)
>                 if (strcmp(match->name, name))
>                         continue;
>
> +               /* Call func for the match, and all address matches */
>                 if (func)
>                         check(func(match, data));
>
> +               if (!name_only && match->addr.section !=3D SHN_UNDEF)
> +                       return checkp(__for_each_addr(match, func, data))=
 + 1;
> +
>                 return 1;
>         }
>
> @@ -34,7 +70,7 @@ static int for_each(const char *name, symbol_callback_t=
 func, void *data)
>
>  static bool is_exported(const char *name)
>  {
> -       return checkp(for_each(name, NULL, NULL)) > 0;
> +       return checkp(for_each(name, true, NULL, NULL)) > 0;
>  }
>
>  int symbol_read_exports(FILE *file)
> @@ -57,13 +93,14 @@ int symbol_read_exports(FILE *file)
>                 if (is_exported(name))
>                         continue; /* Ignore duplicates */
>
> -               sym =3D malloc(sizeof(struct symbol));
> +               sym =3D calloc(1, sizeof(struct symbol));



I am tired of noise changes when reviewing this patch set.


2/19 added malloc(), which is immediately replaced with calloc() by 3/19.










--
Best Regards

Masahiro Yamada

