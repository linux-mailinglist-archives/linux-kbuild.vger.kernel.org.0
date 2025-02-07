Return-Path: <linux-kbuild+bounces-5658-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B40BA2C7B1
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 16:48:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0E773A5901
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 15:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8D423F278;
	Fri,  7 Feb 2025 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lXyKOf/r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A02238D4F;
	Fri,  7 Feb 2025 15:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943160; cv=none; b=J1G/8NuTUCRYrZFoIRW8nukE/j/b68vpQM6kpsgCuuDDmRnk8+1MvNY3FmVFeyLzmqeb1JSL/5Gb+Mt7ngABEC3AKay5Opi1BuA+bMlfZxNEpX6kaMe3zhPEO+iVTrRGe73AUHFQurG8ohqaMD8Lgw7p8KO1n8Th3FcvmpNJ5t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943160; c=relaxed/simple;
	bh=7pn7F/toAYXULdsZ+KZ9V1Ye15ECgQfIOBRNB0uvGFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fu8pFnz8+y7KpgJbckJHY0igWb4B80rztrYMaE3WbL7tXgmiSsbh92ce8fBdjR2mBVJP431xdNqgWpBTHG9DJJySfE8JHTMPFTKdHPfFlPD3tJVWWTIQfGmY6PEOJtTWW6u2lx41RwWuBd0SKUWwG3J+bL17v/JaIb1G2MWpzoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lXyKOf/r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256B2C4CEE7;
	Fri,  7 Feb 2025 15:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738943159;
	bh=7pn7F/toAYXULdsZ+KZ9V1Ye15ECgQfIOBRNB0uvGFM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lXyKOf/rv7LLec8IcTkiVpleC798uCqVHXtkpUc7asRSxQsLbGigUbTCC5Jh82ksa
	 TSanE922RbqnEIvvz++fbEo10kcZsWT4jBfcQdz6gmNoRsPTSEzuYT+VfM02FNh4Ro
	 MURGDGSH3Q5brf97Sq3PUjWcrkRpC5rPUhUjqvL7UuW7pzXVmuqM4tgdhmM7gwUaxO
	 xVGbUuP4R9u6HOx1bTNiC2/u94kxRqj5YN2i1pX7FZuyLTu/4R7N/d2izN2foXW9Ib
	 3TBnJ0wh0dmQqQsogRa/jxSLfUZZejLvP6qCT5/AGtTGDU9Is0wihq4VElLdZ520PS
	 VWLysm6fHeShQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-544fee2f3d5so421646e87.2;
        Fri, 07 Feb 2025 07:45:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0E9gamvB4puJYSADHybhOtL1r0oDfVKFjQTf15CtlGJzXtWa5vdraRfYU1+lskWkM00y8bY60cz/R8EY=@vger.kernel.org, AJvYcCXGzjCMTB0nXYAKvex+64no65vIc9sqG+Mv6eQ7iBdhHctlGAnqA/ZeMDOzEG04NzhFsDUJr9d+OsaqMgOaTg==@vger.kernel.org, AJvYcCXi+rpNEaGN7Ja8JgvNrAcQKl4XY2eX0qKUCK9WyRokD0JW/rn92+6Wmx3h4ErXVM44MtSSVyQ54isiEOpG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0rGsa7LnnX6CTcyvNbJpbGY8EtkGAwacYQEIGP+I9Hdf9CTGn
	gDkXWWs+5vQmSszQv4B0ZyZ6J3CiETNrkhnVaaEjU2c163N1cwHbRxDgNVg7OAt0ltnla5hiKwQ
	gDiGHyoNFCam5L/qWrpYNDAR5WK0=
X-Google-Smtp-Source: AGHT+IGEtf1RrX05zYVQaG2m3sIrqIutrJIuGXBHRy3HNJnqkIZ1wcnCBkSVsTzMdfzxJDroRzufS0WtJ3GoW4++3/0=
X-Received: by 2002:a05:6512:788:b0:540:353a:5b1f with SMTP id
 2adb3069b0e04-54414a61a62mr1006324e87.0.1738943157758; Fri, 07 Feb 2025
 07:45:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202145946.108093528@infradead.org> <20241202150810.496784892@infradead.org>
In-Reply-To: <20241202150810.496784892@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 8 Feb 2025 00:45:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT9yyCFApF=HgmvTjHiAyAagzvRfu+cx0_D+7FBxpzk9Q@mail.gmail.com>
X-Gm-Features: AWEUYZlYu6UXW0LQCOjms6nXmViQaDQ6fta0mbAiM8E_FlpDz6G_2CYugwctx14
Message-ID: <CAK7LNAT9yyCFApF=HgmvTjHiAyAagzvRfu+cx0_D+7FBxpzk9Q@mail.gmail.com>
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

When module_namespace() fails, the following error message is shown:

  ERROR: modpost: module bar uses symbol foo from namespace
MODULE_kvm, but does not import it.


We get a hint from this error message, but the solution
is not MODULE_IMPORT_NS();

'make nsdeps' will try to solve this by adding

  MODULE_IMPORT_NS("MODULE_kvm");

Apparently, this does not work.

Not sure if you want to solve the issue.



--=20
Best Regards
Masahiro Yamada

