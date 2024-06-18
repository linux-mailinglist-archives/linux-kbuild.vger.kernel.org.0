Return-Path: <linux-kbuild+bounces-2205-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB1990D9C9
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 18:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24D4B284608
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 16:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B421A4D8CB;
	Tue, 18 Jun 2024 16:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Db4IlbGe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC251CAB3;
	Tue, 18 Jun 2024 16:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718729271; cv=none; b=BcpDuMA/9QP7D7i88jaeBsfSF5lfcIp0xbAbltqFTJ1Z2XsXyoI5jjCe3fzkQ+byLJtR57cwavANNIuQb+0QbCn/F684VZlN0qMxIyBccxi6MHCGeK59cZ0KubDNyPjbbU702uekJQwLBQJSGrREkkjdY9t4HEHRP+Ja2ifDD08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718729271; c=relaxed/simple;
	bh=O+Ua60eev2B1V6SP3KTevYZsh7kC8GvQf+as3ZGll/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dtwyVQhQJ1rRRdArzWwx0gil4L22pzMBln8Vyne5E/pC39z3scCzXPNuxWbKoOzGxHHgheDj/6JJmoBXAwM1AMEbiY4oe8Af0GsGv5m5EM2xnaAQCeCFbnhD6KjrwbLKLRpc8EIuB+VA+Qb/b/kB7jbIFMn5UkwYRoTKLjUKQbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Db4IlbGe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E531EC4AF1D;
	Tue, 18 Jun 2024 16:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718729270;
	bh=O+Ua60eev2B1V6SP3KTevYZsh7kC8GvQf+as3ZGll/k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Db4IlbGe1E3P/op/b2rV9UKHa0QCWKlGd9mLonRv0WXGADgaqXjj0P4L9F3lOx+f5
	 JNycpO+pUCw1m9p6rYwafhpwJPn9jLoFY6u4mR+3RJk7l/K+XwpRufXQ4QnMPoeayv
	 Eej1ZaGWW9vK6M+lhG2tzJmaFWwuUqOEiQ97nm1FcxKsbR9DFGxGlIC8ktL3CfBAwT
	 Zg4GVevOJUUNxs03Eu3PxGpLgyUNdQdShUaOJRAIh8dYxYNqtTc4kuiEkO8p/XX7DP
	 PxiyOvBmp7SLucwUucvwag3aN5Sj0ZeIrF6GDVkHoGJQLTj3JJgLu5cZn93c9HJgnO
	 1fvaZNAHq5YNQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ec002caeb3so73840071fa.2;
        Tue, 18 Jun 2024 09:47:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUoS7SBAHqJ0Kj8oC6axmmkoqIO3j/vgYZ8dtVvgxEgLDTsMbPD0DIiWFj051uof4B92X14p9Y75bNjJqqE7FhXu+b9CW5thjVJjzfvl3UukvJ+wn4WTF9b+K4kvzrnqEcGC56mAZKR4SfOqivzmyKZen8nKOonMoIlHEv1JVI+YvHAxcvuKSPNLOxKkHLrFIofTnEqXwPJWEQiFqAE1ZxR12R1dF4BNO3u
X-Gm-Message-State: AOJu0YwM9blqUvnr1hoB+radwC4N1r6v4MD6w5QjM+ewsu6AgBH8Q98F
	5xHKT4cnIbAqQSGKfeH5cKr4qYGJIfSYvgP59oBRwYU4MSkQxeS8J3tLWTSMS1w04WQr08fXGuW
	D9CGQwDGX/vQ6/unSjnP/BxPM/Gc=
X-Google-Smtp-Source: AGHT+IFW826RD5cza2s9cAYBN55yUo4AXyQjgjCzfT/VOKirWlwO/S4IOBBg3gLNDhgLRZbh6yddWtZbzFeRUOQnSAg=
X-Received: by 2002:a05:6512:32c9:b0:52c:84d1:180e with SMTP id
 2adb3069b0e04-52ccaaa28ecmr93639e87.67.1718729269540; Tue, 18 Jun 2024
 09:47:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617175818.58219-17-samitolvanen@google.com> <20240617175818.58219-30-samitolvanen@google.com>
In-Reply-To: <20240617175818.58219-30-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 19 Jun 2024 01:47:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNARL-Mtva-WuU-uktZsN3y1zyUNnFnZ25vRbQZ6M0wK0-g@mail.gmail.com>
Message-ID: <CAK7LNARL-Mtva-WuU-uktZsN3y1zyUNnFnZ25vRbQZ6M0wK0-g@mail.gmail.com>
Subject: Re: [PATCH 13/15] modpost: Add support for hashing long symbol names
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 2:58=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Rust frequently has symbol names longer than MODULE_NAME_LEN, because
> the full namespace path is encoded into the mangled name. Instead of
> modpost failing when running into a long name with CONFIG_MODVERSIONS,
> store a hash of the name in struct modversion_info.
>
> To avoid breaking userspace tools that parse the __versions array,
> include a null-terminated hash function name at the beginning of the
> name string, followed by a binary hash. In order to keep .mod.c files
> more human-readable, add a comment with the full symbol name before the
> array entry. Example output in rust_minimal.mod.c:
>
>   static const struct modversion_info ____versions[]
>   __used __section("__versions") =3D {
>         /* _RNvNtNtCs1cdwasc6FUb_6kernel5print14format_strings4INFO */
>         { 0x9ec5442f, "sha256\x00\x56\x96\xf4\x27\xdb\x4a\xbf[...]" },
>         { 0x1d6595b1, "_RNvNtCs1cdwasc6FUb_6kernel5print11call_printk" },
>         { 0x3c642974, "__rust_dealloc" },
>         ...
>   };
>
> modprobe output for the resulting module:
>
>   $ modprobe --dump-modversions rust_minimal.ko
>   0x9ec5442f    sha256
>   0x1d6595b1    _RNvNtCs1cdwasc6FUb_6kernel5print11call_printk
>   0x3c642974    __rust_dealloc
>   ...
>
> While the output is less useful, the tool continues to work and can be
> later updated to produce more helpful output for hashed symbols.
>
> Note that this patch adds a generic SHA-256 implementation to modpost
> adapted from the Crypto API, but other hash functions may be used in
> future if needed.
>
> Suggested-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  scripts/mod/Makefile  |   4 +-
>  scripts/mod/modpost.c |  20 ++-
>  scripts/mod/modpost.h |  20 +++
>  scripts/mod/symhash.c | 327 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 364 insertions(+), 7 deletions(-)
>  create mode 100644 scripts/mod/symhash.c
>
> diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
> index c729bc936bae..ddd59ea9027e 100644
> --- a/scripts/mod/Makefile
> +++ b/scripts/mod/Makefile
> @@ -4,7 +4,7 @@ CFLAGS_REMOVE_empty.o +=3D $(CC_FLAGS_LTO)
>  hostprogs-always-y     +=3D modpost mk_elfconfig
>  always-y               +=3D empty.o
>
> -modpost-objs   :=3D modpost.o file2alias.o sumversion.o symsearch.o
> +modpost-objs   :=3D modpost.o file2alias.o symhash.o sumversion.o symsea=
rch.o
>
>  devicetable-offsets-file :=3D devicetable-offsets.h
>
> @@ -15,7 +15,7 @@ targets +=3D $(devicetable-offsets-file) devicetable-of=
fsets.s
>
>  # dependencies on generated files need to be listed explicitly
>
> -$(obj)/modpost.o $(obj)/file2alias.o $(obj)/sumversion.o $(obj)/symsearc=
h.o: $(obj)/elfconfig.h
> +$(obj)/modpost.o $(obj)/file2alias.o $(obj)/symhash.o $(obj)/sumversion.=
o $(obj)/symsearch.o: $(obj)/elfconfig.h
>  $(obj)/file2alias.o: $(obj)/$(devicetable-offsets-file)
>
>  quiet_cmd_elfconfig =3D MKELF   $@
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index f48d72d22dc2..2631e3e75a5c 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1900,7 +1900,10 @@ static void add_exported_symbols(struct buffer *bu=
f, struct module *mod)
>   **/
>  static void add_versions(struct buffer *b, struct module *mod)
>  {
> +       char hash[SYMHASH_STR_LEN];
>         struct symbol *s;
> +       const char *name;
> +       size_t len;
>
>         if (!modversions)
>                 return;
> @@ -1917,13 +1920,20 @@ static void add_versions(struct buffer *b, struct=
 module *mod)
>                                 s->name, mod->name);
>                         continue;
>                 }
> -               if (strlen(s->name) >=3D MODULE_NAME_LEN) {
> -                       error("too long symbol \"%s\" [%s.ko]\n",
> -                             s->name, mod->name);
> -                       break;
> +               len =3D strlen(s->name);
> +               /*
> +                * For symbols with a long name, use the hash format, but=
 include
> +                * the full symbol name as a comment to keep the generate=
d files
> +                * human-readable.
> +                */
> +               if (len >=3D MODULE_NAME_LEN) {
> +                       buf_printf(b, "\t/* %s */\n", s->name);
> +                       name =3D symhash_str(s->name, len, hash);
> +               } else {
> +                       name =3D s->name;
>                 }
>                 buf_printf(b, "\t{ %#8x, \"%s\" },\n",
> -                          s->crc, s->name);
> +                          s->crc, name);
>         }
>
>         buf_printf(b, "};\n");
> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index ee43c7950636..cd2eb718936b 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -183,6 +183,26 @@ void handle_moddevtable(struct module *mod, struct e=
lf_info *info,
>                         Elf_Sym *sym, const char *symname);
>  void add_moddevtable(struct buffer *buf, struct module *mod);
>
> +/* symhash.c */
> +/*
> + * For symbol names longer than MODULE_NAME_LEN, encode a hash of the
> + * symbol name in version information as follows:
> + *
> + * <hash name>\0<binary hash of the symbol name>
> + *
> + * e.g. as a string in .mod.c files:
> + * "sha256\x00\xNN{32}"
> + *
> + * The string is null terminated after the hash name to avoid breaking
> + * userspace tools that parse the __versions table and don't understand
> + * the format.
> + */
> +#define SYMHASH_STR_PREFIX     "sha256\\x00"
> +#define SYMHASH_STR_PREFIX_LEN (sizeof(SYMHASH_STR_PREFIX) - 1)
> +#define SYMHASH_STR_LEN                (SYMHASH_STR_PREFIX_LEN + 4*32 + =
1)
> +
> +char *symhash_str(const char *name, size_t len, char hash_str[SYMHASH_ST=
R_LEN]);
> +
>  /* sumversion.c */
>  void get_src_version(const char *modname, char sum[], unsigned sumlen);
>
> diff --git a/scripts/mod/symhash.c b/scripts/mod/symhash.c
> new file mode 100644
> index 000000000000..d0c9cf5f1f6c
> --- /dev/null
> +++ b/scripts/mod/symhash.c
> @@ -0,0 +1,327 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * symhash.c
> + *
> + * Symbol name hashing using a SHA-256 implementation adapted from the
> + * Cryptographic API.
> + */
> +#include <byteswap.h>
> +#include "modpost.h"
> +
> +#if HOST_ELFDATA =3D=3D ELFDATA2MSB
> +/* Big endian */
> +#define be32_to_cpu(val) (val)
> +#define cpu_to_be32(val) (val)
> +#define cpu_to_be64(val) (val)
> +#else
> +/* Little endian */
> +#define be32_to_cpu(val) bswap_32(val)
> +#define cpu_to_be32(val) bswap_32(val)
> +#define cpu_to_be64(val) bswap_64(val)
> +#endif
> +
> +#define barrier_data(ptr) __asm__ __volatile__("": :"r"(ptr) :"memory")




I know this is a copy-paste of the kernel space code,
but is barrier_data() also necessary for host programs?





> +
> +static inline void memzero_explicit(void *s, size_t count)
> +{
> +       memset(s, 0, count);
> +       barrier_data(s);
> +}
> +



--
Best Regards
Masahiro Yamada

