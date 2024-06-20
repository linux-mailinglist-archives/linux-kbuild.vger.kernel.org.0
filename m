Return-Path: <linux-kbuild+bounces-2226-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6D8911279
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2024 21:47:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E9301F22CDE
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2024 19:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3874778C;
	Thu, 20 Jun 2024 19:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nxQPAvoq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC392D61B
	for <linux-kbuild@vger.kernel.org>; Thu, 20 Jun 2024 19:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718912838; cv=none; b=oNxwDvmAnDG6L3huAeEymAA+g3NbxiZfrTWwTEDi243njICtxcjs9rWocs/rIZ9C5lRl3m7ys4hVHfBVqR+FwzgAAmMxbIGBe1gPGSZ7faAceveXw7iTsGQu1pp4AplRXsKz/XmigD4oSZ/VXIboGG4EYeePg+bXPgT7vIawfuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718912838; c=relaxed/simple;
	bh=zs1NxhWtnvLR59IPuu/odnOwYISzP0AUSOcCFZnANHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3MLorSuw9BOVF186oxwRweaCSYuJFKlGMnulDjr1x5shTawXT3zWc9pNZfIYRbjGi5HWTtjLy8yTpXtG0L89iYY/XkNJTZUJS5dT2GlFhtrcP3znLodE4U5b8RqE/n/tIcxE5UQ/9ZXcoByAksNfefw/bn36mMBN3jEX+nYCZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nxQPAvoq; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57a16f4b8bfso244a12.0
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Jun 2024 12:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718912834; x=1719517634; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kC5KvblJ8xsBSJleOqs3L2QxdMuT+RmhG5Cz1VcpBj0=;
        b=nxQPAvoqgwdoovB/9OpNwhuSCE5gixvj3vObSJZ062ZB6oEvSvpGkej4bjE4wcBNrV
         yXZsNVRL9+6vyS2LU21eXLtgftfWwcIhKh50iVzNgkrrLC7dTF2qJK9Tu05GLxufXQa+
         /8LCfEu0cLKnEBbO1ARtIo4ZSORB/aOz8hqpkXDONSpXGacRKV6wTbFk99/UbpdGovlP
         0KTxOWc5ZuMTH47LeXnCZ3txfnH5vnL8wpt0Hox4OipeTXVbBR/PeCHmzqUmYNpHzqdf
         AtPs7OybJq8OvvSkp8qtOtbUtMtenK/paY4hqnW8SjJxw9s6T8PiIkx9L128EawDcNkY
         +DFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718912834; x=1719517634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kC5KvblJ8xsBSJleOqs3L2QxdMuT+RmhG5Cz1VcpBj0=;
        b=eGkH7s8zxs5Jui5NSbosjATLWgghmoJpkJo+0Sky41afpHH2O10dL8fm1szrHaOyKj
         +iwtkepE7uBTyKqYHI/SqO1oazfDa8AJPx9HVjz/NWiTOBEiGaGa7egNtoSA0iIUEIgz
         RyoajFuUecp8cWdWMeI3HEGsMcsqiAaGIc5USvS+dVBnXRX+BwrVfQNKI4fdXzy9YsI8
         UlelWUmu1aqk/d2qRpGuDk0GUjBQga6mdZ7nXxOoofNL2Uv4AnDlOFTiWsI0ZCw66gbb
         qYo71P3ci+7yREpkTWdkAfVS3uZbas0NZoNo31pP5VTf4RduLGhaJYZcKyoxJkt8cs8n
         1g+g==
X-Forwarded-Encrypted: i=1; AJvYcCXu8ZWTg3oF06rqXupWUHozlp72Dtgy++z3H1MzfScTxOiN8czuBLz8S3liLWwP2FYhyTFoViX8sPFVoZc4bHQde5/jChW2fRnAbLC6
X-Gm-Message-State: AOJu0Yz7Cx1xfbfgkz3MmI57eASGAKLW9h/7+QybGuaLdqSEjG/WTmrs
	J/rVq0KtWvh88kPetig4mTxXMcj9/uatlkg3wRXkN2SXzKmNLrJrNVMPTe4IytbnnWRHIfmWCgT
	rQFXYSvuuidZFdkdofljcPSbjppMh7lx7MQ8i
X-Google-Smtp-Source: AGHT+IHwuqa0D889DXQaSRhjVB1+vf6HuVZPdZ0dFMqaFRJYupdHFFDJlT4I+gEtDu5oDvQCV/bUQC5bT0t24Rn2kX8=
X-Received: by 2002:a05:6402:34d3:b0:57c:d45d:7571 with SMTP id
 4fb4d7f45d1cf-57d2ec83536mr78510a12.6.1718912833288; Thu, 20 Jun 2024
 12:47:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618185609.4096399-1-elsk@google.com> <CAK7LNAS2621mLaaUPSJqLPTCeowYSAXgoO9uKhF8uTeNK1jU8Q@mail.gmail.com>
In-Reply-To: <CAK7LNAS2621mLaaUPSJqLPTCeowYSAXgoO9uKhF8uTeNK1jU8Q@mail.gmail.com>
From: Yifan Hong <elsk@google.com>
Date: Thu, 20 Jun 2024 12:46:37 -0700
Message-ID: <CAABy=s3_mjevo7U5w-F35DPNGzooht4OW1nTDrU+DttZUhpmkA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Prevent segfault when getting filename
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: kernel-team@android.com, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 6:37=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Wed, Jun 19, 2024 at 3:56=E2=80=AFAM Yifan Hong <elsk@google.com> wrot=
e:
> >
> > ... and lineno in recursive checks.
> >
> > If the following snippet is found in Kconfig:
> >
> > config FOO
> >         tristate
> >         depends on BAR
> >         select BAR
> >         help
> >           foo
> >
> > ... without BAR defined; then if one runs
> > `make tinyconfig`, there is a segfault.
> >
> >   Kconfig:34:error: recursive dependency detected!
> >   Kconfig:34:   symbol FOO depends on BAR
> >   make[4]: *** [scripts/kconfig/Makefile:85: allnoconfig] Segmentation =
fault
> >
> > This is because of the following. BAR is
> > a fake entry created by sym_lookup() with prop
> > being NULL. In the recursive check, there is a
> > NULL check for prop to fall back to
> > stack->sym->prop if stack->prop is NULL. However,
> > in this case, stack->sym points to the fake BAR
> > entry created by sym_lookup(), so prop is still
> > NULL. prop was then referenced without additional
> > NULL checks, causing segfault.
> >
> > Similarly, menu is also accessed without NULL
> > checks. However, sym_lookup() creates entry
> > that is not a choice, so technically it shouldn't
> > fall into the state where menu is NULL for
> > choices. But I mechnically apply the NULL check
> > anyways for completeness.
> >
> > This mechnical patch avoids the segfault. The
> > above snippet produces the following error with
> > this patch:
> >
> >   Kconfig:34:error: recursive dependency detected!
> >   Kconfig:34:   symbol FOO depends on BAR
> >   ???:-1:       symbol BAR is selected by FOO
> >
> > That being said, I am not sure if it is the right
> > fix conceptually and in functionality.
>
>
>
>   "???:-1:       symbol BAR is selected by FOO"
>
> is weird, as there is no property
> like "selected by".
>
> It should print the file and lineno of
> "select BAR".
>
>
>
>
>
> The existing code is already wrong.
>
> In the past, I was thinking of fixing it to reference
> the relevant menu entry.
>
>
> Currently, it points to an unrelated location.
>
>
>
> [Test Code]
>
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
>
>
>
> $ make defconfig
> *** Default configuration is based on 'x86_64_defconfig'
> Kconfig:1:error: recursive dependency detected!
> Kconfig:1: symbol FOO depends on BAR
> Kconfig:4: symbol BAR is selected by FOO
> For a resolution refer to Documentation/kbuild/kconfig-language.rst
> subsection "Kconfig recursive dependency limitations"
>
>
>
>
> "Kconfig:1: symbol FOO depends on BAR"
> points to the other unrelated definition
> because "depends on BAR" appears the second
> entry starting line 7.
>
>
>
>
> So, I am not keen on applying another cheap fix
> to already-wrong code.
>
> If you want to fix it now, please remove all
> file/lineno logs from this function.

Thanks for your reply, Masahiro!

Do you mean to delete the file/lineno for "selected by" only, or for the wh=
ole
sym_check_print_recursive function? It appears to me that some file/lineno
information (Like `Kconfig:1: symbol FOO` above) is still useful. I
agree that the
`Kconfig:4` is wrong, though.

I think a segfault indicates that the program is
not robust against bad user input. In my opinion, it should fail gracefully=
 with
some information to tell the user. I wish I can fix this properly; but
unfortunately
I am not too familiar with this code. That was why I only provided a
mechanical fix.

I am happy to remove the file/lineno's; I just want to confirm which to rem=
ove.

>
> Then, somebody may rewrite the code some day.
>
>
>
>
>
>
>
>
>
>
> >
> > Signed-off-by: Yifan Hong <elsk@google.com>
> > ---
> >  scripts/kconfig/symbol.c | 29 +++++++++++++++++++++--------
> >  1 file changed, 21 insertions(+), 8 deletions(-)
> >
> > diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> > index 8df0a75f40b9..72ab4f274289 100644
> > --- a/scripts/kconfig/symbol.c
> > +++ b/scripts/kconfig/symbol.c
> > @@ -1045,6 +1045,8 @@ static void sym_check_print_recursive(struct symb=
ol *last_sym)
> >         struct menu *menu =3D NULL;
> >         struct property *prop;
> >         struct dep_stack cv_stack;
> > +       const char *filename =3D NULL;
> > +       int lineno =3D 0;
> >
> >         if (sym_is_choice_value(last_sym)) {
> >                 dep_stack_insert(&cv_stack, last_sym);
> > @@ -1060,6 +1062,10 @@ static void sym_check_print_recursive(struct sym=
bol *last_sym)
> >         }
> >
> >         for (; stack; stack =3D stack->next) {
> > +               filename =3D "???";
> > +               lineno =3D 0;
> > +               menu =3D NULL;
> > +
> >                 sym =3D stack->sym;
> >                 next_sym =3D stack->next ? stack->next->sym : last_sym;
> >                 prop =3D stack->prop;
> > @@ -1073,45 +1079,52 @@ static void sym_check_print_recursive(struct sy=
mbol *last_sym)
> >                                 if (prop->menu)
> >                                         break;
> >                         }
> > +                       if (menu) {
> > +                               filename =3D menu->filename;
> > +                               lineno =3D menu->lineno;
> > +                       }
> > +               } else if (prop) {
> > +                       filename =3D prop->filename;
> > +                       lineno =3D prop->lineno;
> >                 }
> >                 if (stack->sym =3D=3D last_sym)
> >                         fprintf(stderr, "%s:%d:error: recursive depende=
ncy detected!\n",
> > -                               prop->filename, prop->lineno);
> > +                               filename, lineno);
> >
> >                 if (sym_is_choice(sym)) {
> >                         fprintf(stderr, "%s:%d:\tchoice %s contains sym=
bol %s\n",
> > -                               menu->filename, menu->lineno,
> > +                               filename, lineno,
> >                                 sym->name ? sym->name : "<choice>",
> >                                 next_sym->name ? next_sym->name : "<cho=
ice>");
> >                 } else if (sym_is_choice_value(sym)) {
> >                         fprintf(stderr, "%s:%d:\tsymbol %s is part of c=
hoice %s\n",
> > -                               menu->filename, menu->lineno,
> > +                               filename, lineno,
> >                                 sym->name ? sym->name : "<choice>",
> >                                 next_sym->name ? next_sym->name : "<cho=
ice>");
> >                 } else if (stack->expr =3D=3D &sym->dir_dep.expr) {
> >                         fprintf(stderr, "%s:%d:\tsymbol %s depends on %=
s\n",
> > -                               prop->filename, prop->lineno,
> > +                               filename, lineno,
> >                                 sym->name ? sym->name : "<choice>",
> >                                 next_sym->name ? next_sym->name : "<cho=
ice>");
> >                 } else if (stack->expr =3D=3D &sym->rev_dep.expr) {
> >                         fprintf(stderr, "%s:%d:\tsymbol %s is selected =
by %s\n",
> > -                               prop->filename, prop->lineno,
> > +                               filename, lineno,
> >                                 sym->name ? sym->name : "<choice>",
> >                                 next_sym->name ? next_sym->name : "<cho=
ice>");
> >                 } else if (stack->expr =3D=3D &sym->implied.expr) {
> >                         fprintf(stderr, "%s:%d:\tsymbol %s is implied b=
y %s\n",
> > -                               prop->filename, prop->lineno,
> > +                               filename, lineno,
> >                                 sym->name ? sym->name : "<choice>",
> >                                 next_sym->name ? next_sym->name : "<cho=
ice>");
> >                 } else if (stack->expr) {
> >                         fprintf(stderr, "%s:%d:\tsymbol %s %s value con=
tains %s\n",
> > -                               prop->filename, prop->lineno,
> > +                               filename, lineno,
> >                                 sym->name ? sym->name : "<choice>",
> >                                 prop_get_type_name(prop->type),
> >                                 next_sym->name ? next_sym->name : "<cho=
ice>");
> >                 } else {
> >                         fprintf(stderr, "%s:%d:\tsymbol %s %s is visibl=
e depending on %s\n",
> > -                               prop->filename, prop->lineno,
> > +                               filename, lineno,
> >                                 sym->name ? sym->name : "<choice>",
> >                                 prop_get_type_name(prop->type),
> >                                 next_sym->name ? next_sym->name : "<cho=
ice>");
> > --
> > 2.45.2.627.g7a2c4fd464-goog
> >
> >
>
>
> --
> Best Regards
> Masahiro Yamada


On Tue, Jun 18, 2024 at 6:37=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Wed, Jun 19, 2024 at 3:56=E2=80=AFAM Yifan Hong <elsk@google.com> wrot=
e:
> >
> > ... and lineno in recursive checks.
> >
> > If the following snippet is found in Kconfig:
> >
> > config FOO
> >         tristate
> >         depends on BAR
> >         select BAR
> >         help
> >           foo
> >
> > ... without BAR defined; then if one runs
> > `make tinyconfig`, there is a segfault.
> >
> >   Kconfig:34:error: recursive dependency detected!
> >   Kconfig:34:   symbol FOO depends on BAR
> >   make[4]: *** [scripts/kconfig/Makefile:85: allnoconfig] Segmentation =
fault
> >
> > This is because of the following. BAR is
> > a fake entry created by sym_lookup() with prop
> > being NULL. In the recursive check, there is a
> > NULL check for prop to fall back to
> > stack->sym->prop if stack->prop is NULL. However,
> > in this case, stack->sym points to the fake BAR
> > entry created by sym_lookup(), so prop is still
> > NULL. prop was then referenced without additional
> > NULL checks, causing segfault.
> >
> > Similarly, menu is also accessed without NULL
> > checks. However, sym_lookup() creates entry
> > that is not a choice, so technically it shouldn't
> > fall into the state where menu is NULL for
> > choices. But I mechnically apply the NULL check
> > anyways for completeness.
> >
> > This mechnical patch avoids the segfault. The
> > above snippet produces the following error with
> > this patch:
> >
> >   Kconfig:34:error: recursive dependency detected!
> >   Kconfig:34:   symbol FOO depends on BAR
> >   ???:-1:       symbol BAR is selected by FOO
> >
> > That being said, I am not sure if it is the right
> > fix conceptually and in functionality.
>
>
>
>   "???:-1:       symbol BAR is selected by FOO"
>
> is weird, as there is no property
> like "selected by".
>
> It should print the file and lineno of
> "select BAR".
>
>
>
>
>
> The existing code is already wrong.
>
> In the past, I was thinking of fixing it to reference
> the relevant menu entry.
>
>
> Currently, it points to an unrelated location.
>
>
>
> [Test Code]
>
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
>
>
>
> $ make defconfig
> *** Default configuration is based on 'x86_64_defconfig'
> Kconfig:1:error: recursive dependency detected!
> Kconfig:1: symbol FOO depends on BAR
> Kconfig:4: symbol BAR is selected by FOO
> For a resolution refer to Documentation/kbuild/kconfig-language.rst
> subsection "Kconfig recursive dependency limitations"
>
>
>
>
> "Kconfig:1: symbol FOO depends on BAR"
> points to the other unrelated definition
> because "depends on BAR" appears the second
> entry starting line 7.
>
>
>
>
> So, I am not keen on applying another cheap fix
> to already-wrong code.
>
> If you want to fix it now, please remove all
> file/lineno logs from this function.
>
> Then, somebody may rewrite the code some day.
>
>
>
>
>
>
>
>
>
>
> >
> > Signed-off-by: Yifan Hong <elsk@google.com>
> > ---
> >  scripts/kconfig/symbol.c | 29 +++++++++++++++++++++--------
> >  1 file changed, 21 insertions(+), 8 deletions(-)
> >
> > diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> > index 8df0a75f40b9..72ab4f274289 100644
> > --- a/scripts/kconfig/symbol.c
> > +++ b/scripts/kconfig/symbol.c
> > @@ -1045,6 +1045,8 @@ static void sym_check_print_recursive(struct symb=
ol *last_sym)
> >         struct menu *menu =3D NULL;
> >         struct property *prop;
> >         struct dep_stack cv_stack;
> > +       const char *filename =3D NULL;
> > +       int lineno =3D 0;
> >
> >         if (sym_is_choice_value(last_sym)) {
> >                 dep_stack_insert(&cv_stack, last_sym);
> > @@ -1060,6 +1062,10 @@ static void sym_check_print_recursive(struct sym=
bol *last_sym)
> >         }
> >
> >         for (; stack; stack =3D stack->next) {
> > +               filename =3D "???";
> > +               lineno =3D 0;
> > +               menu =3D NULL;
> > +
> >                 sym =3D stack->sym;
> >                 next_sym =3D stack->next ? stack->next->sym : last_sym;
> >                 prop =3D stack->prop;
> > @@ -1073,45 +1079,52 @@ static void sym_check_print_recursive(struct sy=
mbol *last_sym)
> >                                 if (prop->menu)
> >                                         break;
> >                         }
> > +                       if (menu) {
> > +                               filename =3D menu->filename;
> > +                               lineno =3D menu->lineno;
> > +                       }
> > +               } else if (prop) {
> > +                       filename =3D prop->filename;
> > +                       lineno =3D prop->lineno;
> >                 }
> >                 if (stack->sym =3D=3D last_sym)
> >                         fprintf(stderr, "%s:%d:error: recursive depende=
ncy detected!\n",
> > -                               prop->filename, prop->lineno);
> > +                               filename, lineno);
> >
> >                 if (sym_is_choice(sym)) {
> >                         fprintf(stderr, "%s:%d:\tchoice %s contains sym=
bol %s\n",
> > -                               menu->filename, menu->lineno,
> > +                               filename, lineno,
> >                                 sym->name ? sym->name : "<choice>",
> >                                 next_sym->name ? next_sym->name : "<cho=
ice>");
> >                 } else if (sym_is_choice_value(sym)) {
> >                         fprintf(stderr, "%s:%d:\tsymbol %s is part of c=
hoice %s\n",
> > -                               menu->filename, menu->lineno,
> > +                               filename, lineno,
> >                                 sym->name ? sym->name : "<choice>",
> >                                 next_sym->name ? next_sym->name : "<cho=
ice>");
> >                 } else if (stack->expr =3D=3D &sym->dir_dep.expr) {
> >                         fprintf(stderr, "%s:%d:\tsymbol %s depends on %=
s\n",
> > -                               prop->filename, prop->lineno,
> > +                               filename, lineno,
> >                                 sym->name ? sym->name : "<choice>",
> >                                 next_sym->name ? next_sym->name : "<cho=
ice>");
> >                 } else if (stack->expr =3D=3D &sym->rev_dep.expr) {
> >                         fprintf(stderr, "%s:%d:\tsymbol %s is selected =
by %s\n",
> > -                               prop->filename, prop->lineno,
> > +                               filename, lineno,
> >                                 sym->name ? sym->name : "<choice>",
> >                                 next_sym->name ? next_sym->name : "<cho=
ice>");
> >                 } else if (stack->expr =3D=3D &sym->implied.expr) {
> >                         fprintf(stderr, "%s:%d:\tsymbol %s is implied b=
y %s\n",
> > -                               prop->filename, prop->lineno,
> > +                               filename, lineno,
> >                                 sym->name ? sym->name : "<choice>",
> >                                 next_sym->name ? next_sym->name : "<cho=
ice>");
> >                 } else if (stack->expr) {
> >                         fprintf(stderr, "%s:%d:\tsymbol %s %s value con=
tains %s\n",
> > -                               prop->filename, prop->lineno,
> > +                               filename, lineno,
> >                                 sym->name ? sym->name : "<choice>",
> >                                 prop_get_type_name(prop->type),
> >                                 next_sym->name ? next_sym->name : "<cho=
ice>");
> >                 } else {
> >                         fprintf(stderr, "%s:%d:\tsymbol %s %s is visibl=
e depending on %s\n",
> > -                               prop->filename, prop->lineno,
> > +                               filename, lineno,
> >                                 sym->name ? sym->name : "<choice>",
> >                                 prop_get_type_name(prop->type),
> >                                 next_sym->name ? next_sym->name : "<cho=
ice>");
> > --
> > 2.45.2.627.g7a2c4fd464-goog
> >
> >
>
>
> --
> Best Regards
> Masahiro Yamada

