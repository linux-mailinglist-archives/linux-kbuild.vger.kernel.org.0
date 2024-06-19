Return-Path: <linux-kbuild+bounces-2218-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A5690E159
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Jun 2024 03:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44F252842D9
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Jun 2024 01:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058D863A9;
	Wed, 19 Jun 2024 01:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDCGVi9O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2FCCA40;
	Wed, 19 Jun 2024 01:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718761047; cv=none; b=fr/+zLuEDqNHCufXlYVk4YUD06AiNBt8TvxAomRMNwC1zb+e4LEs38R/LV8ijijQ0lDQlvlEBmRBuNwhLg6A1f4pLVgQUfpqWtCCvSFXc1ZanhhCsw3koAfkh/uUr8Xe1kZlmMKofNTFYncVwsJEXQqJ6c6SWRd+LkTQvoIhLwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718761047; c=relaxed/simple;
	bh=7KPk+eUpUpVkXhfAm4cYEHZmPxsTEAG5Bit5UYU3VHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UNDpI3AoB6qtFatobsMDqGFIjTVkZu/6BBDEk7yN1tW2y99pwqhlK8ULuQOcmh0dDQDY948ngj/UseL2l1fChZD59KF8VI4t+lnVc3puYQpjIsLbS1ExVtIF7SMmAfpeOw2VXSFHjLoJOqOs0MnW1gbVVGnWERscalcAMBvUtcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDCGVi9O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629E7C4AF1C;
	Wed, 19 Jun 2024 01:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718761047;
	bh=7KPk+eUpUpVkXhfAm4cYEHZmPxsTEAG5Bit5UYU3VHc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JDCGVi9O560pnYhznCNHxS7Ejy23bQCmeAa6F0lbqt8CI25Z/JZLp3+hXMZWW7rdg
	 Fb1YOQX8pddpmSSe6rnt3CLQPBSFLn/pDjSh1TlghkSOQQrks23kHTelhWF4nl7ZQG
	 TPeikpifkJVdpbb+GPzL0gNksthVgX1Mu5T8z34zfQi3VrqHHwM+4c8hTvhap/9ruR
	 rOJeXMtXpynSullMduUi3AU4zn7s/rsmpzktzOAYeIGkyUgW5lXLGh+fgCDjvSiK/o
	 rLYS7R4QcY170Bl6jYaTKAntDaw9JpyMQOqh3GfVFpQsh6/dhaFx4kogjEaypc9HqE
	 DmhUNxC0XUpIg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52c819f6146so8007851e87.1;
        Tue, 18 Jun 2024 18:37:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUf+Dv+UzYXYkQWKMngyg/crjsAx89soJ6Ydyrbb5PRINsg8HIfmRjCwRGdZ+Ou5UG/kRp4qYmYy09MsqIpVULV77UcP6xUhwnFhwlOkfBbCPH9IqMIAjo0F8ZTkb34z9OTJsulrqfrWJhF
X-Gm-Message-State: AOJu0YyJZLtLJtBc34oelozk7teiUlS4lR22rj7p0Ey4Qztj0dt3Yn+c
	ZIcoC0r4IV+hQYnJd2/ZWAYSdFaaLMuwtpBD759oaWPM7dKTMFhf8FTcwsaE5dlA8VbGP1AFBeO
	/jPvov2dYopDWJh+PcVV4UDgLH1E=
X-Google-Smtp-Source: AGHT+IEK7oJtpoJScl8nb4APMXGgqAM5F71c5kuZrKvsrbng6BgrHAlh94+h8812eKok2YCS89SeZykcmYtIEYM6jFE=
X-Received: by 2002:a19:6a12:0:b0:52c:8ea2:9a82 with SMTP id
 2adb3069b0e04-52ccaa65765mr660342e87.35.1718761046016; Tue, 18 Jun 2024
 18:37:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618185609.4096399-1-elsk@google.com>
In-Reply-To: <20240618185609.4096399-1-elsk@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 19 Jun 2024 10:36:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS2621mLaaUPSJqLPTCeowYSAXgoO9uKhF8uTeNK1jU8Q@mail.gmail.com>
Message-ID: <CAK7LNAS2621mLaaUPSJqLPTCeowYSAXgoO9uKhF8uTeNK1jU8Q@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Prevent segfault when getting filename
To: Yifan Hong <elsk@google.com>
Cc: kernel-team@android.com, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 3:56=E2=80=AFAM Yifan Hong <elsk@google.com> wrote:
>
> ... and lineno in recursive checks.
>
> If the following snippet is found in Kconfig:
>
> config FOO
>         tristate
>         depends on BAR
>         select BAR
>         help
>           foo
>
> ... without BAR defined; then if one runs
> `make tinyconfig`, there is a segfault.
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
>
> Similarly, menu is also accessed without NULL
> checks. However, sym_lookup() creates entry
> that is not a choice, so technically it shouldn't
> fall into the state where menu is NULL for
> choices. But I mechnically apply the NULL check
> anyways for completeness.
>
> This mechnical patch avoids the segfault. The
> above snippet produces the following error with
> this patch:
>
>   Kconfig:34:error: recursive dependency detected!
>   Kconfig:34:   symbol FOO depends on BAR
>   ???:-1:       symbol BAR is selected by FOO
>
> That being said, I am not sure if it is the right
> fix conceptually and in functionality.



  "???:-1:       symbol BAR is selected by FOO"

is weird, as there is no property
like "selected by".

It should print the file and lineno of
"select BAR".





The existing code is already wrong.

In the past, I was thinking of fixing it to reference
the relevant menu entry.


Currently, it points to an unrelated location.



[Test Code]


config FOO
       bool

config BAR
       bool

config FOO
       bool "FOO"
       depends on BAR
       select BAR




$ make defconfig
*** Default configuration is based on 'x86_64_defconfig'
Kconfig:1:error: recursive dependency detected!
Kconfig:1: symbol FOO depends on BAR
Kconfig:4: symbol BAR is selected by FOO
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"




"Kconfig:1: symbol FOO depends on BAR"
points to the other unrelated definition
because "depends on BAR" appears the second
entry starting line 7.




So, I am not keen on applying another cheap fix
to already-wrong code.

If you want to fix it now, please remove all
file/lineno logs from this function.

Then, somebody may rewrite the code some day.










>
> Signed-off-by: Yifan Hong <elsk@google.com>
> ---
>  scripts/kconfig/symbol.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
>
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 8df0a75f40b9..72ab4f274289 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -1045,6 +1045,8 @@ static void sym_check_print_recursive(struct symbol=
 *last_sym)
>         struct menu *menu =3D NULL;
>         struct property *prop;
>         struct dep_stack cv_stack;
> +       const char *filename =3D NULL;
> +       int lineno =3D 0;
>
>         if (sym_is_choice_value(last_sym)) {
>                 dep_stack_insert(&cv_stack, last_sym);
> @@ -1060,6 +1062,10 @@ static void sym_check_print_recursive(struct symbo=
l *last_sym)
>         }
>
>         for (; stack; stack =3D stack->next) {
> +               filename =3D "???";
> +               lineno =3D 0;
> +               menu =3D NULL;
> +
>                 sym =3D stack->sym;
>                 next_sym =3D stack->next ? stack->next->sym : last_sym;
>                 prop =3D stack->prop;
> @@ -1073,45 +1079,52 @@ static void sym_check_print_recursive(struct symb=
ol *last_sym)
>                                 if (prop->menu)
>                                         break;
>                         }
> +                       if (menu) {
> +                               filename =3D menu->filename;
> +                               lineno =3D menu->lineno;
> +                       }
> +               } else if (prop) {
> +                       filename =3D prop->filename;
> +                       lineno =3D prop->lineno;
>                 }
>                 if (stack->sym =3D=3D last_sym)
>                         fprintf(stderr, "%s:%d:error: recursive dependenc=
y detected!\n",
> -                               prop->filename, prop->lineno);
> +                               filename, lineno);
>
>                 if (sym_is_choice(sym)) {
>                         fprintf(stderr, "%s:%d:\tchoice %s contains symbo=
l %s\n",
> -                               menu->filename, menu->lineno,
> +                               filename, lineno,
>                                 sym->name ? sym->name : "<choice>",
>                                 next_sym->name ? next_sym->name : "<choic=
e>");
>                 } else if (sym_is_choice_value(sym)) {
>                         fprintf(stderr, "%s:%d:\tsymbol %s is part of cho=
ice %s\n",
> -                               menu->filename, menu->lineno,
> +                               filename, lineno,
>                                 sym->name ? sym->name : "<choice>",
>                                 next_sym->name ? next_sym->name : "<choic=
e>");
>                 } else if (stack->expr =3D=3D &sym->dir_dep.expr) {
>                         fprintf(stderr, "%s:%d:\tsymbol %s depends on %s\=
n",
> -                               prop->filename, prop->lineno,
> +                               filename, lineno,
>                                 sym->name ? sym->name : "<choice>",
>                                 next_sym->name ? next_sym->name : "<choic=
e>");
>                 } else if (stack->expr =3D=3D &sym->rev_dep.expr) {
>                         fprintf(stderr, "%s:%d:\tsymbol %s is selected by=
 %s\n",
> -                               prop->filename, prop->lineno,
> +                               filename, lineno,
>                                 sym->name ? sym->name : "<choice>",
>                                 next_sym->name ? next_sym->name : "<choic=
e>");
>                 } else if (stack->expr =3D=3D &sym->implied.expr) {
>                         fprintf(stderr, "%s:%d:\tsymbol %s is implied by =
%s\n",
> -                               prop->filename, prop->lineno,
> +                               filename, lineno,
>                                 sym->name ? sym->name : "<choice>",
>                                 next_sym->name ? next_sym->name : "<choic=
e>");
>                 } else if (stack->expr) {
>                         fprintf(stderr, "%s:%d:\tsymbol %s %s value conta=
ins %s\n",
> -                               prop->filename, prop->lineno,
> +                               filename, lineno,
>                                 sym->name ? sym->name : "<choice>",
>                                 prop_get_type_name(prop->type),
>                                 next_sym->name ? next_sym->name : "<choic=
e>");
>                 } else {
>                         fprintf(stderr, "%s:%d:\tsymbol %s %s is visible =
depending on %s\n",
> -                               prop->filename, prop->lineno,
> +                               filename, lineno,
>                                 sym->name ? sym->name : "<choice>",
>                                 prop_get_type_name(prop->type),
>                                 next_sym->name ? next_sym->name : "<choic=
e>");
> --
> 2.45.2.627.g7a2c4fd464-goog
>
>


--
Best Regards
Masahiro Yamada

