Return-Path: <linux-kbuild+bounces-4540-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AB89BFF70
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 08:56:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 948FC1C21A8C
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 07:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B404B1BDAA2;
	Thu,  7 Nov 2024 07:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gIuVNVMA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E131B0F1B;
	Thu,  7 Nov 2024 07:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730966184; cv=none; b=n1uv6NB3bYpqy+acCMJKwUMDkHu5cLRRXKWstvVBpnNP7vIrprO4u9/a8/jZJMOVkk0I8+THc340CuM9E1Lgudf9V/0BGNJag9W92XFsQer73NTqJ7XZNciWLYj1oxbm38J4zigyNni+6pzvaooJuL5gtETuueEgY+8Iq8Qc/LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730966184; c=relaxed/simple;
	bh=H3pCeT1f/GQchoZ3mMrj8m2JtI9DVlMipd6Yu5PvWUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EWgUw5uYR577g95Y0JqAMzHHtrEpbTTpNwKsYrz2mvYsF3d3E6eKfyUuJvJTkLk2tIBKaoL203vboYxIJyNv8YCK5zzWnSE+fLiZ4uWS74bI3rBFBjzNk6bwqqkua+5+GA/mJDt89/DMYvTWgqS0s6nme+O/tf5Etv/5aKhjSkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gIuVNVMA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E91DC4CED4;
	Thu,  7 Nov 2024 07:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730966184;
	bh=H3pCeT1f/GQchoZ3mMrj8m2JtI9DVlMipd6Yu5PvWUM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gIuVNVMAbXd9/HtkS+8H1wk9FJR5HUyn9VJjKGqJsRfhyqU5AvUDS/EjZ+hj0ui6c
	 JNwveAD7BBkVmt9hT+38Qt0z+MMBBJKyd/Ckyu97iQB5mswJCheamr9OGdTJ8+dfqi
	 ST4Wqjb7k4HxdQL7orleNV/MBwKGkjR8agSFUQxiMxpjhjbkZVl29Qdwjxw/UpAnQs
	 nAGX4J63x0j16+KuxIjcITlwpYNxBaAEs9QXXz8BS5uQf8aVbouAuSrZwDkQVbR460
	 KooIm+uHQ/yFyBJE45es7GvPOv1aB4qvftHPxRAz/RODuBq9kJ4xD95lfP0/D7FXBB
	 nF21gkI6zD7hA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso509447e87.1;
        Wed, 06 Nov 2024 23:56:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUszpksTOANfyj0voPF2tPPOMeUFhutQCuEqtm1pPjdJzHkY9sDLpZajxSQJ25cEidAUMxkVflO+Nxng8yX@vger.kernel.org, AJvYcCXC9QeU20XfXRo/b9EIFGfknJGRNXuiLinX+JoiMzPGaFfXZ8XkCabxNPlBJ9RnjxPLTw9oBkdd/QxEMXL33w==@vger.kernel.org, AJvYcCXaW+BioE6/deXYagFEQKn0oJhFmfBz9XQz0QjNAAZJQodLH7eaocAJia036LEBYC7iG3dIOlltp+AEnP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdXmAllqY6ewfz/m1ZruZvNRzxAFIWUXg3cXnERk0liNnHBymt
	5nTT8R7Xn+hmgAHaIMcdDch6KSYwmwDHt7PSXFqyCeKr/lNLRyjjp7z3NJRUBgpydxnferhVtKj
	ANDk1l0RDktMKMZu6ZohH+LufJag=
X-Google-Smtp-Source: AGHT+IH3mUviMNCL2whoyU7R6ArRvJ8fVJVmXtxaaC2PzOr7Y2fYk0JNI88WXOtllTzMVzZJdftWCg89agbp7bgfDAs=
X-Received: by 2002:a05:6512:33d5:b0:539:f12f:2531 with SMTP id
 2adb3069b0e04-53d840a60a0mr17845e87.50.1730966182510; Wed, 06 Nov 2024
 23:56:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241106190240.GR10375@noisy.programming.kicks-ass.net>
In-Reply-To: <20241106190240.GR10375@noisy.programming.kicks-ass.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 7 Nov 2024 16:55:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ-wMTOaCuBab-JOfz4ggefNiEBmiKCUpuFncTqS0P3xQ@mail.gmail.com>
Message-ID: <CAK7LNAQ-wMTOaCuBab-JOfz4ggefNiEBmiKCUpuFncTqS0P3xQ@mail.gmail.com>
Subject: Re: [RFC] module: Strict per-modname namespaces
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, nathan@kernel.org, 
	nicolas@fjasle.eu, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	hch@infradead.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 4:02=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> Hi,
>
> I've been wanting $topic for a while, and having just stumbled into the
> whole namespace thing by accident, I figured I'd give it a go, most if
> the hard parts seem to have already been done.
>
> It reserves and disallows imports on any "MODULE_${name}" namespace,
> while it implicitly adds the same namespace to every module.
>
> This allows exports targeted at specific modules and no others -- one
> random example included. I've hated the various kvm exports we've had
> for a while, and strictly limiting them to the kvm module helps
> alleviate some abuse potential.
>
> ---
>  arch/x86/kernel/fpu/core.c |  2 +-
>  kernel/module/main.c       | 28 ++++++++++++++++++++++++++--
>  scripts/mod/modpost.c      | 29 ++++++++++++++++++++---------
>  3 files changed, 47 insertions(+), 12 deletions(-)
>
> diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
> index 1209c7aebb21..23b188a53d9d 100644
> --- a/arch/x86/kernel/fpu/core.c
> +++ b/arch/x86/kernel/fpu/core.c
> @@ -366,7 +366,7 @@ int fpu_swap_kvm_fpstate(struct fpu_guest *guest_fpu,=
 bool enter_guest)
>         fpregs_unlock();
>         return 0;
>  }
> -EXPORT_SYMBOL_GPL(fpu_swap_kvm_fpstate);
> +EXPORT_SYMBOL_NS_GPL(fpu_swap_kvm_fpstate, MODULE_kvm);
>
>  void fpu_copy_guest_fpstate_to_uabi(struct fpu_guest *gfpu, void *buf,
>                                     unsigned int size, u64 xfeatures, u32=
 pkru)
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index 49b9bca9de12..b30af879c2cb 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -1070,6 +1070,13 @@ static int verify_namespace_is_imported(const stru=
ct load_info *info,
>
>         namespace =3D kernel_symbol_namespace(sym);
>         if (namespace && namespace[0]) {
> +               /*
> +                * Implicitly import MODULE_${mod->name} namespace.
> +                */
> +               if (strncmp(namespace, "MODULE_", 7) =3D=3D 0 &&
> +                   strcmp(namespace+7, mod->name) =3D=3D 0)
> +                       return 0;
> +
>                 for_each_modinfo_entry(imported_namespace, info, "import_=
ns") {
>                         if (strcmp(namespace, imported_namespace) =3D=3D =
0)
>                                 return 0;
> @@ -1613,15 +1620,30 @@ static void module_license_taint_check(struct mod=
ule *mod, const char *license)
>         }
>  }
>
> -static void setup_modinfo(struct module *mod, struct load_info *info)
> +static int setup_modinfo(struct module *mod, struct load_info *info)
>  {
>         struct module_attribute *attr;
> +       char *imported_namespace;
>         int i;
>
>         for (i =3D 0; (attr =3D modinfo_attrs[i]); i++) {
>                 if (attr->setup)
>                         attr->setup(mod, get_modinfo(info, attr->attr.nam=
e));
>         }
> +
> +       for_each_modinfo_entry(imported_namespace, info, "import_ns") {
> +               /*
> +                * 'MODULE_' prefixed namespaces are implicit, disallow
> +                * explicit imports.
> +                */
> +               if (strstarts(imported_namespace, "MODULE_")) {
> +                       pr_err("%s: module tries to import module namespa=
ce: %s\n",
> +                              mod->name, imported_namespace);
> +                       return -EPERM;
> +               }
> +       }
> +
> +       return 0;
>  }
>
>  static void free_modinfo(struct module *mod)
> @@ -2935,7 +2957,9 @@ static int load_module(struct load_info *info, cons=
t char __user *uargs,
>                 goto free_unload;
>
>         /* Set up MODINFO_ATTR fields */
> -       setup_modinfo(mod, info);
> +       err =3D setup_modinfo(mod, info);
> +       if (err)
> +               goto free_modinfo;
>
>         /* Fix up syms, so that st_value is a pointer to location. */
>         err =3D simplify_symbols(mod, info);
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 107393a8c48a..d1de3044ee03 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1553,8 +1553,19 @@ static void mod_set_crcs(struct module *mod)
>         free(buf);
>  }
>
> +static const char *mod_basename(const char *modname)
> +{
> +       const char *basename =3D strrchr(modname, '/');
> +       if (basename)
> +               basename++;
> +       else
> +               basename =3D modname;
> +       return basename;
> +}
> +
>  static void read_symbols(const char *modname)
>  {
> +       char module_namespace[MODULE_NAME_LEN + 8];
>         const char *symname;
>         char *version;
>         char *license;
> @@ -1586,12 +1597,16 @@ static void read_symbols(const char *modname)
>                         license =3D get_next_modinfo(&info, "license", li=
cense);
>                 }
>
> -               namespace =3D get_modinfo(&info, "import_ns");
> -               while (namespace) {
> +               for (namespace =3D get_modinfo(&info, "import_ns"); names=
pace;
> +                    namespace =3D get_next_modinfo(&info, "import_ns", n=
amespace)) {

The conversion from while() to for() is an unrelated change.
Split it to a separate patch if you want to change it.


> +                       if (strstarts(namespace, "MODULE_"))
> +                               error("importing implicit module namespac=
e: %s\n", namespace);
> +
>                         add_namespace(&mod->imported_namespaces, namespac=
e);
> -                       namespace =3D get_next_modinfo(&info, "import_ns"=
,
> -                                                    namespace);
>                 }
> +               snprintf(module_namespace, sizeof(module_namespace), "MOD=
ULE_%s",
> +                        mod_basename(mod->name));
> +               add_namespace(&mod->imported_namespaces, module_namespace=
);
>
>                 if (extra_warn && !get_modinfo(&info, "description"))
>                         warn("missing MODULE_DESCRIPTION() in %s\n", modn=
ame);
> @@ -1700,11 +1715,7 @@ static void check_exports(struct module *mod)
>                 s->crc_valid =3D exp->crc_valid;
>                 s->crc =3D exp->crc;
>
> -               basename =3D strrchr(mod->name, '/');
> -               if (basename)
> -                       basename++;
> -               else
> -                       basename =3D mod->name;
> +               basename =3D mod_basename(mod->name);

This is an unrelated change.

So, it should be split into a separate prerequisite patch,
something like, "modpost: introduce mod_basename() helper"



>                 if (!contains_namespace(&mod->imported_namespaces, exp->n=
amespace)) {
>                         modpost_log(!allow_missing_ns_imports,



--=20
Best Regards
Masahiro Yamada

