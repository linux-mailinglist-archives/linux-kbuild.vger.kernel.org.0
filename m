Return-Path: <linux-kbuild+bounces-2264-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 883349197C2
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Jun 2024 21:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D01F9B21BC2
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Jun 2024 19:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D481617CA0E;
	Wed, 26 Jun 2024 19:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y05iWcMC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE76A14F102;
	Wed, 26 Jun 2024 19:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719429480; cv=none; b=jyrzLkq5u6qtPWSehArWejVTt7CAu1hw+zhtixpCPE0YX1hki1JxqPHvdnie1wOI7ciPNh7vwfH2U7zhgoPsCvPOKtFnWot6qw3FsYRqzzseAMntr9T98dFvWmJPxO7BF0S9rDMQR/txAbO7e1yD4gMH8R5uqgp2+PaMYAtUxSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719429480; c=relaxed/simple;
	bh=grd6BdzULWUXbZakZSaAu05NEZUpwSDujvpdFcqCx+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HYkHUJMMl+IiMPku7qrJWot5LOausxaf0C3HF0hPPYqiFly6gp3mGyM924MNxD9/x/oZLi7hMZmLAD9474B2vBUvrrpsk8S0TQZk2u6KzGfCK1z9Zq0k7aDjCwpL5pXwG2UlQANc4z8zHVzkm7CLFQBO3zcqH1egIC/C6qtN/3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y05iWcMC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4048FC116B1;
	Wed, 26 Jun 2024 19:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719429480;
	bh=grd6BdzULWUXbZakZSaAu05NEZUpwSDujvpdFcqCx+c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y05iWcMCFfIb+0JpCuoJV4aXt9Y7L1K3Yeyzxw7g1ik9Rfaw2oMJADQruRoW3H00V
	 35EJUKBjIGrLJX39qdKbUzeM/ToaxPL42m77TN+40Gj/z8TyJ/kfuzL8+ygvefKlWC
	 Qfy8U6PO5NK8COuyyc87J12EYbmdSomC28Wt6hstmuQgirTEBgGVHWXE9rEpOR3q57
	 i6AVTw2noX27ZQboSzqp++HYKULxorHuHT2wyshc9xNETh7T+TK3ia7GlY8ptGGZPB
	 7YqO9DtHtCwyHtUls8TiDpR0C2kbMPcwLohS1crUJU68ZV2jaHy8J63ySNaA2nUp00
	 7foSGUczpolWg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ec5fad1984so55430851fa.0;
        Wed, 26 Jun 2024 12:18:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVluIdEHc/0qu75ds1vSczc2ndOrpges+l8u9EvsfSwf3CMAjnLoWT8nw9b//H/cQOx8GIoGOWxZO+ysZGJu5AfakHIjGfH2CydzBCNXh0p84ue5atfKIiTjHfsvxuI4JH/YxDy2hErzTU6
X-Gm-Message-State: AOJu0YwCBJHQlg+3Iekj9rFXREuAUSfJoZmwkW7kfz9Kq253zi+AKoqI
	s2okwsD2AEANjttnJ3flfciZXQzOObExVgI8IEeLsmpZwk0rlrRZaYjY2mQ90A/KykKqn7lgRKZ
	jGxJNDD9DQsbLzaS8A5VjaIKoBaQ=
X-Google-Smtp-Source: AGHT+IF6K2SvSPc26F65UX/2qB/o6vWwDPOV4e3/d65jrysvsECLpn+dMw4xJ0x1qOr5FrOo5GCc0E4qASZVXGvTnnM=
X-Received: by 2002:a2e:9ccd:0:b0:2ee:44f7:cc76 with SMTP id
 38308e7fff4ca-2ee44f7ccb7mr16077161fa.47.1719429478916; Wed, 26 Jun 2024
 12:17:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620211112.500465-1-elsk@google.com>
In-Reply-To: <20240620211112.500465-1-elsk@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 27 Jun 2024 04:17:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQmcY01i+feMGDEAZrhVrTh8v-4sis75-gaoSYZxF+p6Q@mail.gmail.com>
Message-ID: <CAK7LNAQmcY01i+feMGDEAZrhVrTh8v-4sis75-gaoSYZxF+p6Q@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: recursive checks drop file/lineno
To: HONG Yifan <elsk@google.com>
Cc: kernel-team@android.com, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 6:11=E2=80=AFAM HONG Yifan <elsk@google.com> wrote:
>
> This prevents segfault when getting filename
> and lineno in recursive checks.
>
> If the following snippet is found in Kconfig:
>
> [Test code 1]
>
> config FOO
>        tristate
>        depends on BAR
>        select BAR
>        help
>          foo



config FOO
        bool
        depends on BAR
        select BAR


is enough to produce this issue.




> ... without BAR defined; then if one runs
> `make tinyconfig`, there is a segfault.

There is no need to provide the particular command
because this issue occurs for any 'make *config' command.





>
>   Kconfig:34:error: recursive dependency detected!
>   Kconfig:34:   symbol FOO depends on BAR
>   make[4]: *** [scripts/kconfig/Makefile:85: allnoconfig] Segmentation fa=
ult
>
> This is because of the following. BAR is
> a fake entry created by sym_lookup() with prop
> being NULL. In the recursive check, there is a
> NULL check for prop to fall back to
> stack->sym->prop if stack->prop is NULL. However,
> in this case, stack->sym points to the fake BAR
> entry created by sym_lookup(), so prop is still
> NULL. prop was then referenced without additional
> NULL checks, causing segfault.


Each line is too short.

You can wrap lines around 70-columns.



>
> As the previous email thread suggests, the file
> and lineno for select is also wrong:
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
> $ make defconfig
> *** Default configuration is based on 'x86_64_defconfig'
> Kconfig:1:error: recursive dependency detected!
> Kconfig:1: symbol FOO depends on BAR
> Kconfig:4: symbol BAR is selected by FOO
> [...]
>
> Kconfig:4 should be Kconfig:10.
>
> This patch deletes the wrong and segfault-prone
> filename/lineno inference completely. With this
> patch, Test code 1 yields:
>
> error: recursive dependency detected!
>         symbol FOO depends on BAR
>         symbol BAR is selected by FOO
>
> Link: https://lore.kernel.org/linux-kbuild/20240618185609.4096399-1-elsk@=
google.com/
> Signed-off-by: HONG Yifan <elsk@google.com>
>
> --
> v2: Delete all filenames/lineno completely as
> suggested by masahiroy@kernel.org


This will break 'make testconfig' because you did not adjust

scripts/kconfig/tests/err_recursive_dep/expected_stderr




I cleaned up the function a little more.

Please adjust scripts/kconfig/tests/err_recursive_dep/expected_stderr
and rebase the patch on top of this:

https://lore.kernel.org/linux-kbuild/20240626182212.3758235-1-masahiroy@ker=
nel.org/T/#t




> ---
>  scripts/kconfig/symbol.c | 43 +++++++++++++++-------------------------
>  1 file changed, 16 insertions(+), 27 deletions(-)
>
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 8df0a75f40b9..3974e46a8533 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -1042,9 +1042,9 @@ static void sym_check_print_recursive(struct symbol=
 *last_sym)
>  {
>         struct dep_stack *stack;
>         struct symbol *sym, *next_sym;
> -       struct menu *menu =3D NULL;
>         struct property *prop;
>         struct dep_stack cv_stack;
> +       enum prop_type type;
>
>         if (sym_is_choice_value(last_sym)) {
>                 dep_stack_insert(&cv_stack, last_sym);
> @@ -1066,54 +1066,43 @@ static void sym_check_print_recursive(struct symb=
ol *last_sym)
>                 if (prop =3D=3D NULL)
>                         prop =3D stack->sym->prop;


Please remove these two lines as well.
It is useless for getting 'type'.






>
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
>                 if (stack->sym =3D=3D last_sym)
> -                       fprintf(stderr, "%s:%d:error: recursive dependenc=
y detected!\n",
> -                               prop->filename, prop->lineno);
> +                       fprintf(stderr, "error: recursive dependency dete=
cted!\n");
>
>                 if (sym_is_choice(sym)) {
> -                       fprintf(stderr, "%s:%d:\tchoice %s contains symbo=
l %s\n",
> -                               menu->filename, menu->lineno,
> +                       fprintf(stderr, "\tchoice %s contains symbol %s\n=
",
>                                 sym->name ? sym->name : "<choice>",
>                                 next_sym->name ? next_sym->name : "<choic=
e>");
>                 } else if (sym_is_choice_value(sym)) {
> -                       fprintf(stderr, "%s:%d:\tsymbol %s is part of cho=
ice %s\n",
> -                               menu->filename, menu->lineno,
> +                       fprintf(stderr, "\tsymbol %s is part of choice %s=
\n",
>                                 sym->name ? sym->name : "<choice>",
>                                 next_sym->name ? next_sym->name : "<choic=
e>");
>                 } else if (stack->expr =3D=3D &sym->dir_dep.expr) {
> -                       fprintf(stderr, "%s:%d:\tsymbol %s depends on %s\=
n",
> -                               prop->filename, prop->lineno,
> +                       fprintf(stderr, "\tsymbol %s depends on %s\n",
>                                 sym->name ? sym->name : "<choice>",
>                                 next_sym->name ? next_sym->name : "<choic=
e>");
>                 } else if (stack->expr =3D=3D &sym->rev_dep.expr) {
> -                       fprintf(stderr, "%s:%d:\tsymbol %s is selected by=
 %s\n",
> -                               prop->filename, prop->lineno,
> +                       fprintf(stderr, "\tsymbol %s is selected by %s\n"=
,
>                                 sym->name ? sym->name : "<choice>",
>                                 next_sym->name ? next_sym->name : "<choic=
e>");
>                 } else if (stack->expr =3D=3D &sym->implied.expr) {
> -                       fprintf(stderr, "%s:%d:\tsymbol %s is implied by =
%s\n",
> -                               prop->filename, prop->lineno,
> +                       fprintf(stderr, "\tsymbol %s is implied by %s\n",
>                                 sym->name ? sym->name : "<choice>",
>                                 next_sym->name ? next_sym->name : "<choic=
e>");
>                 } else if (stack->expr) {
> -                       fprintf(stderr, "%s:%d:\tsymbol %s %s value conta=
ins %s\n",
> -                               prop->filename, prop->lineno,
> +                       fprintf(stderr, "\tsymbol %s %s value contains %s=
\n",
>                                 sym->name ? sym->name : "<choice>",
> -                               prop_get_type_name(prop->type),
> +                               prop_get_type_name(type),
>                                 next_sym->name ? next_sym->name : "<choic=
e>");
>                 } else {
> -                       fprintf(stderr, "%s:%d:\tsymbol %s %s is visible =
depending on %s\n",
> -                               prop->filename, prop->lineno,
> +                       fprintf(stderr, "\tsymbol %s %s is visible depend=
ing on %s\n",
>                                 sym->name ? sym->name : "<choice>",
> -                               prop_get_type_name(prop->type),
> +                               prop_get_type_name(type),
>                                 next_sym->name ? next_sym->name : "<choic=
e>");
>                 }
>         }
> --
> 2.45.2.741.gdbec12cfda-goog
>


--
Best Regards
Masahiro Yamada

