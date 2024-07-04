Return-Path: <linux-kbuild+bounces-2376-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14904927B19
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 18:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 949951F2329A
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 16:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE741B29C7;
	Thu,  4 Jul 2024 16:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nr7PuG3B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7542E4C70;
	Thu,  4 Jul 2024 16:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720110357; cv=none; b=gCSC7M85w/wLz91QB1rJQrSizBp/aAWprmzJGSsHA1Uzrmsxt/jIIX691j1QUGVutqootidBOT19p1thIIK61/hHDrg0BABcViVKSzDZehC7ZnvdDUJd91eUwqhpowTHiSk9Lvnp0Ko1Fjdv40XH6VVpEZ1UroZK5M5DyLpFzZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720110357; c=relaxed/simple;
	bh=iCXqnvh6cbIUfDjetXYNLtKQ0NiMc2Tgha15dKs5h48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F5A7zrzrmJP6b0Ar73ZE6NH5awBDRuqjsQNvt6lASwUrSKcpkb/vwqHnXmA4DD+9RVEJtNwScls4E+7ud45qN5j7pzptLleEa5QDqBGWKUG8Gd1Mq7d3OeeqwJ94ue0Xpsw4h/5aUA/ooSg5BsghyyxaIyKkw3bL/H18184gKp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nr7PuG3B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C30C4AF0C;
	Thu,  4 Jul 2024 16:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720110356;
	bh=iCXqnvh6cbIUfDjetXYNLtKQ0NiMc2Tgha15dKs5h48=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Nr7PuG3BoKXFh4CWpakGR0ZxCBuKKr5sqz0lc2n4VtYQTaeh5KUBCe+BQwQyS13vS
	 0+z4LHxRd4jc1oxE+rPGT5mzROD1Iwk1lGTJQjCXfnmBZgbidnvGi5WMgl4kM7BrAA
	 SbXkImQk6MG5qbtfwlSf6xFRK0boTSBKuQngtBfMXJtlHaHQa8hoKugZxWJeYR9jDQ
	 Ii3lR41wbaGYVqshVHPO0ugujJZfsX+/4R2qDPCOAvi/mWLA7NcvXZYJSykKrL4jEX
	 1GLG8hvm/AkluDaRnBFOcklOO7pRz5fMJM/rRZqdQ1M1S95IizZAxIlZo8ZWLKuIpP
	 2ja8mAH83LaBA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ec3f875e68so9715891fa.0;
        Thu, 04 Jul 2024 09:25:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYPO/izoiKXjLLCAqlL6DnnkdHmIDRNgGKW31Qzwwd3cjRUwhihEkU88eVyQoMTV22aK6xoYlIeyvvzqKzPdrxMEH9wXJJ6pFvoXb4jeLZ8xQ1uWH5uUg/PcMI/TN1hUrKNa1qxPyxFa1r
X-Gm-Message-State: AOJu0YwzFhJba52TVkDU8ANhaLpZ5GK0Sm6e/N1aT6vaKXg6CMh3hQEA
	VCsJtFHgUSzxt9XQ3sPiplEDs5RtS+hliTn0c2X/TNWxkSXLZg0D0wY2O07+wbfd2MDAwQ7GIEQ
	v/Wp/HoDA1TMzOm8b6Q1ZYf6x0vY=
X-Google-Smtp-Source: AGHT+IGD86Y3yNSBwHLJxoaxiEmt4dcexOXB2GCuahH50y0/b4u8e6BoPe+EPtPiuZcc61PgqP+Jpim9CUp7D50EsZE=
X-Received: by 2002:a05:651c:1694:b0:2eb:d816:7a67 with SMTP id
 38308e7fff4ca-2ee8ed8f6d2mr14474271fa.16.1720110355568; Thu, 04 Jul 2024
 09:25:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627231919.2461945-1-elsk@google.com>
In-Reply-To: <20240627231919.2461945-1-elsk@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 5 Jul 2024 01:25:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR_=AWh1aE4iev1xtcfTAAHNOhwq3gF+h6DFzz9x39qPw@mail.gmail.com>
Message-ID: <CAK7LNAR_=AWh1aE4iev1xtcfTAAHNOhwq3gF+h6DFzz9x39qPw@mail.gmail.com>
Subject: Re: [PATCH v3] kconfig: recursive checks drop file/lineno
To: HONG Yifan <elsk@google.com>
Cc: kernel-team@android.com, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 8:19=E2=80=AFAM HONG Yifan <elsk@google.com> wrote:
>
> This prevents segfault when getting filename and lineno in recursive
> checks.
>
> If the following snippet is found in Kconfig:
>
> [Test code 1]
>
> config FOO
>         bool
>         depends on BAR
>         select BAR
>
> ... without BAR defined; then if one runs `make tinyconfig`, there is a
> segfault.



You do not need to mention tinyconfig because the same error happens
on any command.



... without BAR defined, there is a segfault.







>
>   Kconfig:34:error: recursive dependency detected!
>   Kconfig:34:   symbol FOO depends on BAR
>   make[4]: *** [scripts/kconfig/Makefile:85: allnoconfig] Segmentation fa=
ult
>
> This is because of the following. BAR is a fake entry created by
> sym_lookup() with prop being NULL. In the recursive check, there is a
> NULL check for prop to fall back to stack->sym->prop if stack->prop is
> NULL. However, in this case, stack->sym points to the fake BAR entry
> created by sym_lookup(), so prop is still NULL. prop was then referenced
> without additional NULL checks, causing segfault.
>
> As the previous email thread suggests, the file and lineno for select is
> also wrong:
>
> [Test code 2]
>
> config FOO
>        bool
>
> config BAR
>        bool
>
> config FOO
>        bool "FOO"
>        depends on BAR
>        select BAR
>
>   $ make defconfig
>   *** Default configuration is based on 'x86_64_defconfig'
>   Kconfig:1:error: recursive dependency detected!
>   Kconfig:1: symbol FOO depends on BAR
>   Kconfig:4: symbol BAR is selected by FOO
>   [...]
>
> Kconfig:4 should be Kconfig:10.
>
> This patch deletes the wrong and segfault-prone filename/lineno
> inference completely. With this patch, Test code 1 yields:
>
> error: recursive dependency detected!
>         symbol FOO depends on BAR
>         symbol BAR is selected by FOO
>
> Link: https://lore.kernel.org/linux-kbuild/20240620211112.500465-1-elsk@g=
oogle.com/
> Signed-off-by: HONG Yifan <elsk@google.com>
>
> --
> v3: Rebase on top of
>     https://lore.kernel.org/linux-kbuild/20240626182212.3758235-1-masahir=
oy@kernel.org/T/#t
>     & resolve merge conflicts. Fix
>     scripts/kconfig/tests/err_recursive_dep/expected_stderr
> v2: Delete all filenames/lineno completely as suggested by
>     masahiroy@kernel.org
> ---
>  scripts/kconfig/symbol.c                      | 40 +++++++------------
>  .../tests/err_recursive_dep/expected_stderr   | 36 ++++++++---------
>  2 files changed, 33 insertions(+), 43 deletions(-)
>
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index c05d188a1857..e22c8769f44f 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -1068,10 +1068,10 @@ static void sym_check_print_recursive(struct symb=
ol *last_sym)
>  {
>         struct dep_stack *stack;
>         struct symbol *sym, *next_sym;
> -       struct menu *menu =3D NULL;
>         struct menu *choice;
>         struct property *prop;
>         struct dep_stack cv_stack;
> +       enum prop_type type;
>
>         choice =3D sym_get_choice_menu(last_sym);
>         if (choice) {
> @@ -1094,49 +1094,39 @@ static void sym_check_print_recursive(struct symb=
ol *last_sym)
>                 if (prop =3D=3D NULL)
>                         prop =3D stack->sym->prop;


As I said in the v2 review, please remove:


                if (prop =3D=3D NULL)
                         prop =3D stack->sym->prop;

These two lines are useless.







> -               /* for choice values find the menu entry (used below) */
> -               if (sym_is_choice(sym) || sym_is_choice_value(sym)) {
> -                       for (prop =3D sym->prop; prop; prop =3D prop->nex=
t) {
> -                               menu =3D prop->menu;
> -                               if (prop->menu)
> -                                       break;
> -                       }
> -               }
> +               if (prop =3D=3D NULL)
> +                       type =3D P_UNKNOWN;
> +               else
> +                       type =3D prop->type;
> +


Bikeshed:

I personally prefer this:


                 type =3D prop ? prop->type : P_UNKNOWN;





>                 if (stack->sym =3D=3D last_sym)
> -                       fprintf(stderr, "%s:%d:error: recursive dependenc=
y detected!\n",
> -                               prop->filename, prop->lineno);
> +                       fprintf(stderr, "error: recursive dependency dete=
cted!\n");
>
>                 if (sym_is_choice(next_sym)) {
>                         choice =3D list_first_entry(&next_sym->menus, str=
uct menu, link);
>
> -                       fprintf(stderr, "%s:%d:\tsymbol %s is part of cho=
ice block at %s:%d\n",
> -                               menu->filename, menu->lineno,
> +                       fprintf(stderr, "\tsymbol %s is part of choice bl=
ock at %s:%d\n",
>                                 sym->name ? sym->name : "<choice>",
>                                 choice->filename, choice->lineno);
>                 } else if (stack->expr =3D=3D &sym->dir_dep.expr) {
> -                       fprintf(stderr, "%s:%d:\tsymbol %s depends on %s\=
n",
> -                               prop->filename, prop->lineno,
> +                       fprintf(stderr, "\tsymbol %s depends on %s\n",
>                                 sym->name ? sym->name : "<choice>",
>                                 next_sym->name);
>                 } else if (stack->expr =3D=3D &sym->rev_dep.expr) {
> -                       fprintf(stderr, "%s:%d:\tsymbol %s is selected by=
 %s\n",
> -                               prop->filename, prop->lineno,
> +                       fprintf(stderr, "\tsymbol %s is selected by %s\n"=
,
>                                 sym->name, next_sym->name);
>                 } else if (stack->expr =3D=3D &sym->implied.expr) {
> -                       fprintf(stderr, "%s:%d:\tsymbol %s is implied by =
%s\n",
> -                               prop->filename, prop->lineno,
> +                       fprintf(stderr, "\tsymbol %s is implied by %s\n",
>                                 sym->name, next_sym->name);
>                 } else if (stack->expr) {
> -                       fprintf(stderr, "%s:%d:\tsymbol %s %s value conta=
ins %s\n",
> -                               prop->filename, prop->lineno,
> +                       fprintf(stderr, "\tsymbol %s %s value contains %s=
\n",
>                                 sym->name ? sym->name : "<choice>",
> -                               prop_get_type_name(prop->type),
> +                               prop_get_type_name(type),
>                                 next_sym->name);
>                 } else {
> -                       fprintf(stderr, "%s:%d:\tsymbol %s %s is visible =
depending on %s\n",
> -                               prop->filename, prop->lineno,
> +                       fprintf(stderr, "\tsymbol %s %s is visible depend=
ing on %s\n",
>                                 sym->name ? sym->name : "<choice>",
> -                               prop_get_type_name(prop->type),
> +                               prop_get_type_name(type),
>                                 next_sym->name);
>                 }
>         }

--=20
Best Regards
Masahiro Yamada

