Return-Path: <linux-kbuild+bounces-5224-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 455B09F9E1F
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Dec 2024 04:49:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C0F7162718
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Dec 2024 03:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150C013B5A9;
	Sat, 21 Dec 2024 03:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JW4zkmQ/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF772A1CA;
	Sat, 21 Dec 2024 03:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734752940; cv=none; b=YZ5yyOcXCBfAtlov9g30hms+mWu3bLKOQTOOLir4iTk9JGaV7a0GRzXC9aTLHYEcSEWRRMmLDOduJKw9PMoVFC+d1PeQeluwwOuMwJEWtuGmDUcCu+S/yDMY/RS1E9Jw4G+S9+CaGy/dKN8g7/Y2J85WY//dcXSOJKplnmDEdhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734752940; c=relaxed/simple;
	bh=UNI3UaUhfIKqixDczGoqkpQOXug8etyv5+hNBAgleug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eRPX/fX5jy1wMouQ91g4macm/GajOY8em4elT3pXoAnvgydYleC9hcBCdB16XmgRXMsHMTIf6+FATRH1YnYpW+OMoy1MmVktVpfIhZ8d2zf7MvthzFi1+PqLlSu4ZA6zwYmzF3JDiVzpAwgg80E4YxvMal6XPHrZX/ar/Fe36Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JW4zkmQ/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F9C5C4CED0;
	Sat, 21 Dec 2024 03:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734752939;
	bh=UNI3UaUhfIKqixDczGoqkpQOXug8etyv5+hNBAgleug=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JW4zkmQ/JTB8CG3NJg8KDDuFVJYRsGU0hDBn31+cEJ19BxHYzT+MHXvnvVtaGLeIW
	 hz7nnRNpQHjuoTKUz07Q/zsjcE2KnDvVZhFnFPOshNZ7zstWgj7ER70uIJukgHhalP
	 dOcm24mmm5sinUJFOoZcxPXW6w7iVnsPWynk8bjCZD/Xqa/hdMurzPjmR7kvR6v22i
	 ihkwTGLhUy085qoyT2fSw1Q2YfAHE34u1WnzbcwvUyPHkLHuFGSvUzm2s7tNAU0d/D
	 6YpzGTprZJVllqrrnE9aDN7iG69eI8Q20CYDUdNLSEt4gxVXYD9v6ag9Go1/x8ARuA
	 rTJFQuE7Unybg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so2715219e87.2;
        Fri, 20 Dec 2024 19:48:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVbBSa/GcnHp+lMvoZ7pGpdcRqOFNDfYX+9JkKulglOUQdhISyMEdcVmg8/sLwSryyif+fCQLsLy9gD1Bg=@vger.kernel.org, AJvYcCVp07hPDUqhWh6b/IJxGIbog/8HQkdIiwARm6dyT1hKDoMh3d+W1bxN3CgIS2np5vAIGRnlrgYqj7ZyNV0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6FX2eEea/CvOPhWuIAYg+EG+5rdcqVeiNVRWhktN5mnGLivTd
	yw7TJ6+OoP+DsHJl4V9ITH0aq0adw296Ml+8701adM/nBrIhl2C10nvuBEEnAj0boJ2gmyGRYRJ
	Fxjz2t8Jacboll+AAcwoeqaTjlpg=
X-Google-Smtp-Source: AGHT+IFOrqTNy9uQwMIc/GqD69uQcsH+EyKvFd0xFkKyHD8cHE/AD2XDnBVZQAugO7KUyJj/6TAZxur0SN+KQJS1UpU=
X-Received: by 2002:a05:6512:b86:b0:542:1b63:2e52 with SMTP id
 2adb3069b0e04-542295229f2mr1622626e87.6.1734752937979; Fri, 20 Dec 2024
 19:48:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212154619.2235767-1-masahiroy@kernel.org>
 <12257d86-a4bc-4e98-bd0f-39ec41f1756d@nvidia.com> <5963c8b3-7e03-4f2d-9198-f02cc3140313@nvidia.com>
In-Reply-To: <5963c8b3-7e03-4f2d-9198-f02cc3140313@nvidia.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 21 Dec 2024 12:48:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ5Fw97MKSMGeMWk+Fj5=tGpJVQxAO4LTG7BLY3iaPHkg@mail.gmail.com>
Message-ID: <CAK7LNAQ5Fw97MKSMGeMWk+Fj5=tGpJVQxAO4LTG7BLY3iaPHkg@mail.gmail.com>
Subject: Re: [PATCH] modpost: distinguish same module paths from different
 dump files
To: Jon Hunter <jonathanh@nvidia.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 7:48=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 12/12/2024 20:17, Jon Hunter wrote:
> >
> > On 12/12/2024 15:46, Masahiro Yamada wrote:
> >> Since commit 13b25489b6f8 ("kbuild: change working directory to extern=
al
> >> module directory with M=3D"), module paths are always relative to the =
top
> >> of the external module tree.
> >>
> >> The module paths recorded in Module.symvers is no longer globally uniq=
ue
> >> when they are passed via KBUILD_EXTRA_SYMBOLS for building other exter=
nal
> >> modules, which may result in false positive "exported twice" errors.
> >> Such errors should not occur because external modules should be able t=
o
> >> override in-tree modules.
> >>
> >> To address this, record the dump file path in struct module and check =
it
> >> when searching for a module.
> >>
> >> Fixes: 13b25489b6f8 ("kbuild: change working directory to external
> >> module directory with M=3D")
> >> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> >> Closes: https://lore.kernel.org/all/eb21a546-a19c-40df-b821-
> >> bbba80f19a3d@nvidia.com/
> >> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> >> ---
> >>
> >>   scripts/mod/modpost.c | 17 +++++++++--------
> >>   scripts/mod/modpost.h |  3 ++-
> >>   2 files changed, 11 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> >> index fb787a5715f5..94ee49207a45 100644
> >> --- a/scripts/mod/modpost.c
> >> +++ b/scripts/mod/modpost.c
> >> @@ -155,12 +155,13 @@ char *get_line(char **stringp)
> >>   /* A list of all modules we processed */
> >>   LIST_HEAD(modules);
> >> -static struct module *find_module(const char *modname)
> >> +static struct module *find_module(const char *filename, const char
> >> *modname)
> >>   {
> >>       struct module *mod;
> >>       list_for_each_entry(mod, &modules, list) {
> >> -        if (strcmp(mod->name, modname) =3D=3D 0)
> >> +        if (!strcmp(mod->dump_file, filename) &&
> >> +            !strcmp(mod->name, modname))
> >>               return mod;
> >>       }
> >>       return NULL;
> >> @@ -2030,10 +2031,10 @@ static void read_dump(const char *fname)
> >>               continue;
> >>           }
> >> -        mod =3D find_module(modname);
> >> +        mod =3D find_module(fname, modname);
> >>           if (!mod) {
> >>               mod =3D new_module(modname, strlen(modname));
> >> -            mod->from_dump =3D true;
> >> +            mod->dump_file =3D fname;
> >>           }
> >>           s =3D sym_add_exported(symname, mod, gpl_only, namespace);
> >>           sym_set_crc(s, crc);
> >> @@ -2052,7 +2053,7 @@ static void write_dump(const char *fname)
> >>       struct symbol *sym;
> >>       list_for_each_entry(mod, &modules, list) {
> >> -        if (mod->from_dump)
> >> +        if (mod->dump_file)
> >>               continue;
> >>           list_for_each_entry(sym, &mod->exported_symbols, list) {
> >>               if (trim_unused_exports && !sym->used)
> >> @@ -2076,7 +2077,7 @@ static void write_namespace_deps_files(const
> >> char *fname)
> >>       list_for_each_entry(mod, &modules, list) {
> >> -        if (mod->from_dump || list_empty(&mod->missing_namespaces))
> >> +        if (mod->dump_file || list_empty(&mod->missing_namespaces))
> >>               continue;
> >>           buf_printf(&ns_deps_buf, "%s.ko:", mod->name);
> >> @@ -2194,7 +2195,7 @@ int main(int argc, char **argv)
> >>           read_symbols_from_files(files_source);
> >>       list_for_each_entry(mod, &modules, list) {
> >> -        if (mod->from_dump || mod->is_vmlinux)
> >> +        if (mod->dump_file || mod->is_vmlinux)
> >>               continue;
> >>           check_modname_len(mod);
> >> @@ -2205,7 +2206,7 @@ int main(int argc, char **argv)
> >>           handle_white_list_exports(unused_exports_white_list);
> >>       list_for_each_entry(mod, &modules, list) {
> >> -        if (mod->from_dump)
> >> +        if (mod->dump_file)
> >>               continue;
> >>           if (mod->is_vmlinux)
> >> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> >> index 49848fcbe2a1..8b72c227ebf4 100644
> >> --- a/scripts/mod/modpost.h
> >> +++ b/scripts/mod/modpost.h
> >> @@ -95,14 +95,15 @@ struct module_alias {
> >>   /**
> >>    * struct module - represent a module (vmlinux or *.ko)
> >>    *
> >> + * @dump_file: path to the .symvers file if loaded from a file
> >>    * @aliases: list head for module_aliases
> >>    */
> >>   struct module {
> >>       struct list_head list;
> >>       struct list_head exported_symbols;
> >>       struct list_head unresolved_symbols;
> >> +    const char *dump_file;
> >>       bool is_gpl_compatible;
> >> -    bool from_dump;        /* true if module was loaded from
> >> *.symvers */
> >>       bool is_vmlinux;
> >>       bool seen;
> >>       bool has_init;
> >
> >
> > Thanks for fixing!
> >
> > Tested-by: Jon Hunter <jonathanh@nvidia.com>
>
>
> I have not seen this land in -next yet. Would be great to get this applie=
d.
>

Now applied to linux-kbuild/fixes.


--=20
Best Regards
Masahiro Yamada

