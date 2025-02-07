Return-Path: <linux-kbuild+bounces-5660-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DD6A2C898
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 17:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3678188C263
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 16:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CE9A18DB38;
	Fri,  7 Feb 2025 16:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWG3AaIH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F027A18DB33;
	Fri,  7 Feb 2025 16:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945375; cv=none; b=S8Dse3H+JEhkG0d3WOPuuYrxMw+wEXsA7jehfbJpo+ajaaCVcicZJ4qC7eq4fKL8bvgIKB0GFpANFeDjuTfwYgES4ekvP/EbLUEjPlI/ExBtQ25V0YAPd8muehUL81FcJchz5WOD2ceQYP4HEf5JEJ89aGyq3PuPvhphpYU1WLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945375; c=relaxed/simple;
	bh=cmqtt2HmWbRFcUX563+yFj+rTEctJSsCOhe/8byNEE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CJP9aMpEc39pKCMRJR+gRi2s7NthCNCVKoES78ZtjgIS9iWuLMTVCLpm6YJ+Cb2sUKP3SkEBO9Myd4gQ3KCWwkjeGY1yYzxpmXO/i6FJbC/rHSiNFNFcFQjxKt45EYV2JfkXpO0kENdMgoS12LoFhUob2pq3VKrrbLNho1BSJUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWG3AaIH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58277C4CED1;
	Fri,  7 Feb 2025 16:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738945374;
	bh=cmqtt2HmWbRFcUX563+yFj+rTEctJSsCOhe/8byNEE0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tWG3AaIHOBtcKyUQlhqoIw7tcZ3IINlim04reoKO66wCyJtO9/qdtjMG74/AKkJDO
	 H70mza84LSpflO9SfW9Ib13d5RzrGmwZELc4sCsODPMSS74Vs7TphFEaRs/HAVAczo
	 zi3i2yhtjHARRVNFirHNbUpEddwNTqrSq6I4gNAvu2+nsVDLi9VkzJMyxdOub4D80Z
	 L7/t0rvEtTT7GSKy3qC7o5mBsPnz5i6MAPxnmwysX3aIlx/X7ue5MLupF87dkfmKm8
	 VyJI6kwHVF7aEtAOPpg3I4SU74+be+oJCf0xq/YjANtX8z3xVoiln3KUerIx+4m2IG
	 9vQUrCquK3sAQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30797730cbdso22005371fa.3;
        Fri, 07 Feb 2025 08:22:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUlmH2kaxQsg6yVkb8+0vcKAyHKRWLcfymNYS5DnRtMTthObB2g4xM/TiQNUvGESr3Xa+a7heS1EDafyCvn@vger.kernel.org, AJvYcCVlRAMo5Jp6IoW9ncBZVH0Hnb90P/+RFOCKeaPkfWv2D4Sz20BjhO23N2tORcWnz4z1iqt71JkyRPJBV+h/6w==@vger.kernel.org, AJvYcCXLFLu2s/rm2O8P+FsiDGnLEXtwardKpqGUHgxNgC+mHxfBJ6/W52OwU3AKXaNyvPIYTxMcEw5h690reXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0VWLj+iO0IsB4xWc35PTOgbIsRcNGB5bq9n1ZPH+xuKOTscKX
	GFlm13LX4u+LQHcur/1wi0oCkTJO+OJPgOhVIWhpZPjq2gZ3dSTsSmZIFMEL0bF10a2PavkwJI0
	qDoxUfGhWqh6VQ8zCQDfLgWgn2DY=
X-Google-Smtp-Source: AGHT+IFJcy3Yuv5VaABaDY//hTvQflodlFGP+ZZj7CaKUT7Bh9xOZE38/nQoyKYMjsWb5WDDuG9eek5bXyiovp+jcBY=
X-Received: by 2002:a05:651c:1507:b0:302:3c78:4ea4 with SMTP id
 38308e7fff4ca-307e586a99amr10502581fa.30.1738945373005; Fri, 07 Feb 2025
 08:22:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202145946.108093528@infradead.org> <20241202150810.382545529@infradead.org>
In-Reply-To: <20241202150810.382545529@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 8 Feb 2025 01:22:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR=ggfxVoQ=06PE4wkpyRCTvhpkkOSiRKx9eR2UezZK4Q@mail.gmail.com>
X-Gm-Features: AWEUYZmfD0d8kNyQgovnYG27v4vPW6XUfG6sLEAqd2r8Oq4UtqGrS8TIYA_JJmA
Message-ID: <CAK7LNAR=ggfxVoQ=06PE4wkpyRCTvhpkkOSiRKx9eR2UezZK4Q@mail.gmail.com>
Subject: Re: [PATCH -v2 4/7] module: Add module specific symbol namespace support
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, nathan@kernel.org, 
	nicolas@fjasle.eu, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	hch@infradead.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 12:11=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> Designate the "MODULE_${modname}" symbol namespace to mean: 'only
> export to the named module'.
>
> Notably, explicit imports of anything in the "MODULE_" space is
> forbidden. Modules implicitly get the "MODULE_${modname}" namespace
> added.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  kernel/module/main.c  |   28 ++++++++++++++++++++++++++--
>  scripts/mod/modpost.c |    5 +++++
>  2 files changed, 31 insertions(+), 2 deletions(-)
>
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -1070,6 +1070,13 @@ static int verify_namespace_is_imported(
>
>         namespace =3D kernel_symbol_namespace(sym);
>         if (namespace && namespace[0]) {
> +               /*
> +                * Implicitly import MODULE_${mod->name} namespace.
> +                */
> +               if (strncmp(namespace, "MODULE_", 7) =3D=3D 0 &&

strncmp() -> strstarts()

> +                   strcmp(namespace+7, mod->name) =3D=3D 0)
> +                       return 0;
> +


You can add verify_module_namespace() in this commit
with a simple implementation.

static bool verify_module_namespace(const char *namespace, const char *modn=
ame)
{
        const char *prefix =3D "module:";

        return strstarts(namespace, prefix) &&
                  !strcmp(namespace + strlen(prefix), modname);
}


Then, you can extend it in the next commit,
to support the glob pattern in verify_module_namespace()






> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1565,6 +1565,7 @@ static const char *mod_basename(const ch
>
>  static void read_symbols(const char *modname)
>  {
> +       char module_namespace[MODULE_NAME_LEN + 8];
>         const char *symname;
>         char *version;
>         char *license;
> @@ -1600,6 +1601,10 @@ static void read_symbols(const char *mod
>                      namespace =3D get_next_modinfo(&info, "import_ns", n=
amespace))
>                         add_namespace(&mod->imported_namespaces, namespac=
e);
>
> +               snprintf(module_namespace, sizeof(module_namespace), "MOD=
ULE_%s",
> +                        mod_basename(mod->name));
> +               add_namespace(&mod->imported_namespaces, module_namespace=
);
> +
>                 if (extra_warn && !get_modinfo(&info, "description"))
>                         warn("missing MODULE_DESCRIPTION() in %s\n", modn=
ame);
>         }


This is a noise change, as you immediately remove this code in the next com=
mit.

So, I recommend adding verify_module_namespace() in this commit.
Then, you can extend it in the next commit for glob pattern support.







index d4abcd8ee2ed..58fbcb6bb718 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1674,6 +1674,14 @@ void buf_write(struct buffer *buf, const char
*s, int len)
        buf->pos +=3D len;
 }

+static bool verify_module_namespace(const char *namespace, const char *mod=
name)
+{
+       const char *prefix =3D "module:";
+
+       return strstarts(namespace, prefix) &&
+               !strcmp(namespace + strlen(prefix), modname);
+}
+
 static void check_exports(struct module *mod)
 {
        struct symbol *s, *exp;
@@ -1701,7 +1709,8 @@ static void check_exports(struct module *mod)

                basename =3D mod_basename(mod->name);

-               if (!contains_namespace(&mod->imported_namespaces,
exp->namespace)) {
+               if (!verify_module_namespace(exp->namespace, mod->name) &&
+                   !contains_namespace(&mod->imported_namespaces,
exp->namespace)) {
                        modpost_log(!allow_missing_ns_imports,
                                    "module %s uses symbol %s from
namespace %s, but does not import it.\n",
                                    basename, exp->name, exp->namespace);








--
Best Regards
Masahiro Yamada

