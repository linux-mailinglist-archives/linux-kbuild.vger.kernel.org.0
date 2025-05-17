Return-Path: <linux-kbuild+bounces-7138-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 938B5ABA896
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 May 2025 08:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 655EF3BACCA
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 May 2025 06:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369511B423C;
	Sat, 17 May 2025 06:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YmWqEzCI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C222F29;
	Sat, 17 May 2025 06:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747465002; cv=none; b=bslNg89cQ0MXvHYq8800MzA8nbTPTTvktdSsR8TzwgTcNnNnvQSrgCvX3U5fhJg6MRLyfw+LRZzS5vcPR2SwxaAxB9yTppG1c7F0s9YWNGsmTjh6LJpLsA1PB82TncAlxM8XYiSzhVKj8IpOIYHqFRbjKwV+RhStLAc77DSKbIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747465002; c=relaxed/simple;
	bh=BhYsGe9wLxF17h5tOiqbKIX5W3NIyifbgbAy2Jh4JBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VjoF3Famt+Ga+W7SSZnp9ChR8H5qUo5mIOtsRqqflgTzyKSbXvnAsk5cc4/mBFZDiebf2N4klwSzijr2WCfQfrmd1XRnP13GGLJRWtU8hJ2cA111b5r7f/v6PCckp/zGXT0PmVMCYJHF0R6vPC1CLp0vVIkOOoy/jh14iWIJRVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YmWqEzCI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2C7C4CEF1;
	Sat, 17 May 2025 06:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747465001;
	bh=BhYsGe9wLxF17h5tOiqbKIX5W3NIyifbgbAy2Jh4JBA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YmWqEzCIKmBqG9vOSk9Z6cjQfDMg8Cx1nofS/9QGwjv3upNunxoritp7+ZTwPjNNP
	 1tgidJWQ5a1xsIZj2Dnp9hguVrPA2r8nD0Q14ccI83c7q9/LpxTillm6JeDzDvkoRX
	 awMIy7j7iK1gXgq18J/Aiupwx086ZOjM7lelCZL1vNogok1BC3SQy1DqLHawIT3tiM
	 Sl8M/NR5LVylFEog6Ma3GKZFWaIouXMtFi0zz6Z4aDDvIvBkiJZ4PQKianpq+/Knlh
	 0UEXOSnglum5zp38WDBOSGscEbpzEVKIwj6OWDuEoB9GrCXQ6UKvxav3tuc0Y8ez/S
	 mT1WD3sxc6heA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-549b116321aso3093068e87.3;
        Fri, 16 May 2025 23:56:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6NiDvEPpcyIj8fEN/C6U87DE3ZGjeZ56xmF6HMesQl7WvMH9qi7MyX20U5a9fFms2fAj8FroddLc9SyC2@vger.kernel.org, AJvYcCVD7+N+e3Tzh57nIR2KJqRUsFj1vAAnxyz9K/HpaNrqBRIwFz+wbLzRdyzEBJwW8JJ2ACyAY08j0ZrsJeE=@vger.kernel.org, AJvYcCXSNTRspd4yBU9B1TGLCMO4gRYTnt558hhCgzf2y+aaPhpXP7aImrBMMzmkQPXLPSs1fwPesaz0FJRC32dy5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw36EezUGyu6qeKIMgyIuz2MG9UoBlydZsDVtRCAzJ2TKdTlir
	uCkO0Ym34TxT4hkvdc80bVlLDf68fquKPWUacpi/fffsHPQrQvWHcgIMyC5kZ1W5h076veisjwY
	SjcYd97kM0oegRE7zXx+YvtowQ4kg/Ps=
X-Google-Smtp-Source: AGHT+IED1QhsadOxq5xJyEGC12oqNOkouaFcOBzItV1yDOs13w5rQwGpPyByzShdx2u94DFX1JAeuwyLpC1Dc1YmTjM=
X-Received: by 2002:a05:6512:428b:b0:550:e5c4:b0a1 with SMTP id
 2adb3069b0e04-550e977f264mr1321840e87.11.1747465000039; Fri, 16 May 2025
 23:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502141204.500293812@infradead.org> <20250502141844.046738270@infradead.org>
In-Reply-To: <20250502141844.046738270@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 17 May 2025 15:56:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT9wCZ5fenykaBsor-CwOuUXFdg2Fe1eGe_y7qR2X2Ysg@mail.gmail.com>
X-Gm-Features: AX0GCFv2k5ENnb4Z4yrV3GELMdtsaw61q2E5buwH6wDsjvXvKc0ZJBKZhhLErMM
Message-ID: <CAK7LNAT9wCZ5fenykaBsor-CwOuUXFdg2Fe1eGe_y7qR2X2Ysg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] module: Add module specific symbol namespace support
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, nathan@kernel.org, 
	nicolas@fjasle.eu, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	hch@infradead.org, gregkh@linuxfoundation.org, roypat@amazon.co.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 11:26=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> Designate the "module:${modname}" symbol namespace to mean: 'only
> export to the named module'.
>
> Notably, explicit imports of anything in the "module:" space is
> forbidden.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  kernel/module/main.c  |   33 +++++++++++++++++++++++++++++++--
>  scripts/mod/modpost.c |   11 ++++++++++-
>  2 files changed, 41 insertions(+), 3 deletions(-)
>
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -1083,6 +1083,14 @@ static char *get_modinfo(const struct lo
>         return get_next_modinfo(info, tag, NULL);
>  }
>
> +static bool verify_module_namespace(const char *namespace, const char *m=
odname)
> +{
> +       const char *prefix =3D "module:";
> +
> +       return strstarts(namespace, prefix) &&
> +              !strsmp(namespace + strlen(prefix), modname);
> +}
> +
>  static int verify_namespace_is_imported(const struct load_info *info,
>                                         const struct kernel_symbol *sym,
>                                         struct module *mod)
> @@ -1092,6 +1100,10 @@ static int verify_namespace_is_imported(
>
>         namespace =3D kernel_symbol_namespace(sym);
>         if (namespace && namespace[0]) {
> +
> +               if (verify_module_namespace(namespace, mod->name))
> +                       return 0;
> +
>                 for_each_modinfo_entry(imported_namespace, info, "import_=
ns") {
>                         if (strcmp(namespace, imported_namespace) =3D=3D =
0)
>                                 return 0;
> @@ -1659,15 +1671,30 @@ static void module_license_taint_check(s
>         }
>  }
>
> -static void setup_modinfo(struct module *mod, struct load_info *info)
> +static int setup_modinfo(struct module *mod, struct load_info *info)
>  {
>         const struct module_attribute *attr;
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
> +                * 'module:' prefixed namespaces are implicit, disallow
> +                * explicit imports.
> +                */
> +               if (strstarts(imported_namespace, "module:")) {
> +                       pr_err("%s: module tries to import module namespa=
ce: %s\n",
> +                              mod->name, imported_namespace);
> +                       return -EPERM;
> +               }


It is also possible to check this at compile-time, i.e., in modpost.

Does it make sense to check this at compile-time instead of
run-time?

(or check it both at compile-time and build-time?)



diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index c9ff4db26edb..30c8d8062792 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1597,9 +1597,14 @@ static void read_symbols(const char *modname)

                for (namespace =3D get_modinfo(&info, "import_ns");
                     namespace;
-                    namespace =3D get_next_modinfo(&info, "import_ns",
namespace))
+                    namespace =3D get_next_modinfo(&info, "import_ns",
namespace)) {
+                       if (strstarts(namespace, "module:"))
+                               error("%s: tries to import module
namespace \"%s\".\n");
+
                        add_namespace(&mod->imported_namespaces, namespace)=
;

+               }
+
                if (!get_modinfo(&info, "description"))
                        warn("missing MODULE_DESCRIPTION() in %s\n", modnam=
e);

        }














> +       }
> +
> +       return 0;
>  }
>
>  static void free_modinfo(struct module *mod)
> @@ -3335,7 +3362,9 @@ static int load_module(struct load_info
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
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1682,6 +1682,14 @@ void buf_write(struct buffer *buf, const
>         buf->pos +=3D len;
>  }
>
> +static bool verify_module_namespace(const char *namespace, const char *m=
odname)
> +{
> +       const char *prefix =3D "module:";
> +
> +       return strstarts(namespace, prefix) &&
> +              !strcmp(namespace + strlen(prefix), modname);
> +}
> +
>  static void check_exports(struct module *mod)
>  {
>         struct symbol *s, *exp;
> @@ -1709,7 +1717,8 @@ static void check_exports(struct module
>
>                 basename =3D get_basename(mod->name);
>
> -               if (!contains_namespace(&mod->imported_namespaces, exp->n=
amespace)) {
> +               if (!verify_module_namespace(exp->namespace, basename) &&
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

