Return-Path: <linux-kbuild+bounces-5655-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1F2A2BE45
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 09:42:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E67B165E69
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 08:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7350E1C6FEE;
	Fri,  7 Feb 2025 08:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B6fHfOkh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EB11C3BE7;
	Fri,  7 Feb 2025 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917753; cv=none; b=DN7TTBfLisI4pDswzWQTyHQ6Avtxq//bW4x5gkbbS5aahot5qCfCto94OsdADr0m4gH+8ZKl8XZ8VhHPXq6ihVPoT3tUOMd3V7nyeKIBPWU/bYlD8TtJyfxP/xtKs94p6k7nZ2QwK9YgUj/S8VuhorHFpnqcpbdgg0Ppt0M04O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917753; c=relaxed/simple;
	bh=AuPrUvdSWitPRAE+h+ANddMSDsAvNkv1nRO3Efw0aro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oYMY/qadHiWGDmWfB1l3vqYRrSjm7UBI7IE8nYHpffhjI5H9Rmh21+CEyR4+B5/5jg/Fv7jwETtXek1wsAvxO154soadAvcg/Y3lnG1fG0InpFfHhRxHgLGdTUHCbSMVAM8GNr693f6pebv1Ie8b01U67VLqgaKjJc2MRGSxrkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B6fHfOkh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A38C4CEEA;
	Fri,  7 Feb 2025 08:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738917752;
	bh=AuPrUvdSWitPRAE+h+ANddMSDsAvNkv1nRO3Efw0aro=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=B6fHfOkhQhjkrB03aMQNFjHnARa1vt3eEVnD7kMHhO1yzOY5Uuh25gcijhy0ibi4r
	 NCZe27212J/G2LRJsW/CkLYtKpZ8CCTaNH18oJruKXOFSJl/QyR8B1qLiYeJXkNvxD
	 LqTfezgNMM10h71IpfjeWYu1iie8oHXc8YoOqIMyFoMEq9ffp1KemCTX85yikFgQRo
	 Z6x4qoZUi4zLpHXjAKio4gy3pI6dwYTH0LH6UWRf7T8CSTTY/7DYHkrhiMhK+2OAUp
	 lZrKs2lC0ahlzheet6hlwbGcmBVdR7F5AAHyYLtku2UASaNpVZYrn+0t13+/3i3fw9
	 P4lccnKsz4jnw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5426fcb3c69so1644501e87.3;
        Fri, 07 Feb 2025 00:42:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVnwd4awy6v7wTo9hTueNLeNZcZHhZywnrMuXt/rx1tEsjyN1CpoWSDMUaMKycF4BJKUVIDkbl3HgD3CqLT1Q==@vger.kernel.org, AJvYcCWpFq2qw3I+55/voabaMaqYszW/fIOKX9YE+K8PnShYVvVAstck4WNToszAIYsIA0M7MKUMcQjSE4wBgs0=@vger.kernel.org, AJvYcCXltYCC5+4BDiii6+f9q8HHKarg7KF6zWrr7vfjCwnSzWAttWktGctFyDy/TcsWIwmewEgWTU9ClQPIU+JU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5TkLUmZirJMRMqqoNpV8utRiWXNaaNG7BsgmDOo8MJ8YtLRFt
	jkPyx6NGsu/cQZ6v+Y95Fyu5LLpqkaXsQ8IUMELw2Ue04FmBcoAZBd3ExtPm6sODEebCn63S9O0
	Z2wtbR2tYlLSKBQAVzfWYz5ex62s=
X-Google-Smtp-Source: AGHT+IFrtXV92ziCCN4dQc69VOWMn2dNXBrvH5C769LoLaeXFbUH0bEIcIdff/o2p9hAE8nM4JNZlic8CyuGvzyzuG8=
X-Received: by 2002:a05:6512:2355:b0:540:2da2:f282 with SMTP id
 2adb3069b0e04-54414ae0c64mr608756e87.42.1738917751296; Fri, 07 Feb 2025
 00:42:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202145946.108093528@infradead.org> <20241202150810.496784892@infradead.org>
In-Reply-To: <20241202150810.496784892@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 7 Feb 2025 17:41:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNASVq=2K25vy8o=Lni2PGoHpyYogwt6E5CeNSnxXFpeduA@mail.gmail.com>
X-Gm-Features: AWEUYZlo5sGUrFExV3ZUCu1O31RzYjEFrwi3VsZ7k737-eDfWY6D9h0VSx77xyU
Message-ID: <CAK7LNASVq=2K25vy8o=Lni2PGoHpyYogwt6E5CeNSnxXFpeduA@mail.gmail.com>
Subject: Re: [PATCH -v2 5/7] module: Extend the MODULE_ namespace parsing
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
> Instead of only accepting "MODULE_${name}", extend it with a comma
> separated list of module names and add tail glob support.
>
> That is, something like: "MODULE_foo-*,bar" is now possible.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  kernel/module/main.c  |   39 ++++++++++++++++++++++++++++++++++-----
>  scripts/mod/modpost.c |   40 ++++++++++++++++++++++++++++++++++------
>  2 files changed, 68 insertions(+), 11 deletions(-)
>
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -1061,6 +1061,38 @@ static char *get_modinfo(const struct lo
>         return get_next_modinfo(info, tag, NULL);
>  }
>
> +/*
> + * @namespace ~=3D "MODULE_foo-*,bar", match @modname to 'foo-*' or 'bar=
'

Please add a proper kdoc style comment block.




Rather than an underscore, I prefer a colon, which rarely appears in file n=
ames.

How about "module:foo-*,bar"  instead of  "MODULE_foo-*,bar"  ?







> + */
> +static bool verify_module_namespace(const char *namespace, const char *m=
odname)
> +{
> +       size_t len, modlen =3D strlen(modname);
> +       const char *sep;
> +       bool glob;
> +
> +       if (strncmp(namespace, "MODULE_", 7) !=3D 0)
> +               return false;
> +
> +       for (namespace +=3D 7; *namespace; namespace =3D sep) {
> +               sep =3D strchrnul(namespace, ',');
> +               len =3D sep - namespace;
> +
> +               glob =3D false;
> +               if (sep[-1] =3D=3D '*') {
> +                       len--;
> +                       glob =3D true;
> +               }


Why only limited to the trailing wildcard?

Did you consider using glob_match()?



> +
> +               if (*sep)
> +                       sep++;
> +
> +               if (strncmp(namespace, modname, len) =3D=3D 0 && (glob ||=
 len =3D=3D modlen))
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
>  static int verify_namespace_is_imported(const struct load_info *info,
>                                         const struct kernel_symbol *sym,
>                                         struct module *mod)
> @@ -1070,11 +1102,8 @@ static int verify_namespace_is_imported(
>
>         namespace =3D kernel_symbol_namespace(sym);
>         if (namespace && namespace[0]) {
> -               /*
> -                * Implicitly import MODULE_${mod->name} namespace.
> -                */
> -               if (strncmp(namespace, "MODULE_", 7) =3D=3D 0 &&
> -                   strcmp(namespace+7, mod->name) =3D=3D 0)
> +
> +               if (verify_module_namespace(namespace, mod->name))
>                         return 0;
>
>                 for_each_modinfo_entry(imported_namespace, info, "import_=
ns") {
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1565,7 +1565,6 @@ static const char *mod_basename(const ch
>
>  static void read_symbols(const char *modname)
>  {
> -       char module_namespace[MODULE_NAME_LEN + 8];
>         const char *symname;
>         char *version;
>         char *license;
> @@ -1601,10 +1600,6 @@ static void read_symbols(const char *mod
>                      namespace =3D get_next_modinfo(&info, "import_ns", n=
amespace))
>                         add_namespace(&mod->imported_namespaces, namespac=
e);
>
> -               snprintf(module_namespace, sizeof(module_namespace), "MOD=
ULE_%s",
> -                        mod_basename(mod->name));
> -               add_namespace(&mod->imported_namespaces, module_namespace=
);
> -
>                 if (extra_warn && !get_modinfo(&info, "description"))
>                         warn("missing MODULE_DESCRIPTION() in %s\n", modn=
ame);
>         }
> @@ -1687,6 +1682,38 @@ void buf_write(struct buffer *buf, const
>         buf->pos +=3D len;
>  }
>
> +/*
> + * @namespace ~=3D "MODULE_foo-*,bar", match @modname to 'foo-*' or 'bar=
'

Same comment as in kernel/module/main.c


> + */
> +static bool module_namespace(const char *namespace, const char *modname)
> +{
> +       size_t len, modlen =3D strlen(modname);
> +       const char *sep;
> +       bool glob;
> +
> +       if (strncmp(namespace, "MODULE_", 7) !=3D 0)
> +               return false;


If you see the existing code closely, strstarts() helper is used everywhere=
.

I would write like this:

         static const char *prefix =3D "module:";

          if (!strstarts(namespace, prefix))
                        return false;




> +
> +       for (namespace +=3D 7; *namespace; namespace =3D sep) {


I tend to avoid the magic number, 7.

Just like this:
https://github.com/torvalds/linux/blob/v6.14-rc1/scripts/mod/file2alias.c#L=
1494





> +               sep =3D strchrnul(namespace, ',');
> +               len =3D sep - namespace;
> +
> +               glob =3D false;
> +               if (sep[-1] =3D=3D '*') {
> +                       len--;
> +                       glob =3D true;
> +               }
> +
> +               if (*sep)
> +                       sep++;
> +
> +               if (strncmp(namespace, modname, len) =3D=3D 0 && (glob ||=
 len =3D=3D modlen))
> +                       return true;
> +       }

Same as kernel/module/main.c.

If you see around line 700 in this file,
you will find fnmatch() is already used for glob matching.






> +
> +       return false;
> +}
> +
>  static void check_exports(struct module *mod)
>  {
>         struct symbol *s, *exp;
> @@ -1714,7 +1741,8 @@ static void check_exports(struct module
>
>                 basename =3D mod_basename(mod->name);
>
> -               if (!contains_namespace(&mod->imported_namespaces, exp->n=
amespace)) {
> +               if (!module_namespace(exp->namespace, basename) &&
> +                   !contains_namespace(&mod->imported_namespaces, exp->n=
amespace)) {
>                         modpost_log(!allow_missing_ns_imports,
>                                     "module %s uses symbol %s from namesp=
ace %s, but does not import it.\n",
>                                     basename, exp->name, exp->namespace);
>
>


--
Best Regards
Masahiro Yamada

