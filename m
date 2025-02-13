Return-Path: <linux-kbuild+bounces-5733-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF5BA3369B
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 05:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69B9E3A8273
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 04:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2AB20550B;
	Thu, 13 Feb 2025 04:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZZJJhRk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BD72054FD
	for <linux-kbuild@vger.kernel.org>; Thu, 13 Feb 2025 04:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739419743; cv=none; b=fRVF79Vig8rfnk/sbOMQhlTh875YYaKr/W8jzrYDQNgXlMqvw+eqZSkmlZTQlpLoKrJ8VaKmS046iXLS0i7tqUF4iRCD0UQCs99x2r6MBpSLJMj2SlBrKPK8PdZEmbBasyJLilxY3YWuRxI0hD1tnHxRLk/cb5xSoTHvI1H/t2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739419743; c=relaxed/simple;
	bh=vfM2sNuEWmKeXRVSA6qX/PFL8NMRyW8zQNh/gpt/C9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EciLVfgCNAyRthmBNJRc4mTGvwiU2pUAcZMm7XyTFxrfRwO0L8AdJit0HU9I5Z0mBRbbvf/A1pvyK/CJdAtuOOqnFcg8Azis1cJ8KVKFP8hwCphKlvPkZmXmaEGEliLnUk1v5rxFvAa6vfrgYtnZuueUglyGhKdvdtJKPkmsHyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZZJJhRk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21F6C4CEE6
	for <linux-kbuild@vger.kernel.org>; Thu, 13 Feb 2025 04:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739419742;
	bh=vfM2sNuEWmKeXRVSA6qX/PFL8NMRyW8zQNh/gpt/C9s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mZZJJhRklEWcT7s1t+Gc8hPa8sGmh36xKI531fB0qbaugiMbM9Xj961ag6L6KmunO
	 nV3jmw0RexeHe5c6LIts8CTRao81nj6n6u4opI2lRI5jZoVMNIwu4N0XqQeyZsbVxI
	 vw62+9f9o5kBxLIjQi5tr+y7uikuuGY/nX9GbFjdsHuJsC8TM3N4i+AZlFj6ME0HpD
	 Boo77RGT6E7DEzujrqD6RVum5Wbd31309Y4Z9jN2jidtyS9fGkpgGfX0WOYLQYKZyo
	 05W99LQHgCsZcZ/vwPgjCu3/hZDQsL9fpdqVgtNHOmoS4RX9rFqvnM87leava+OPYK
	 0EvVElLQ7oPTA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54509f46614so383294e87.0
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Feb 2025 20:09:02 -0800 (PST)
X-Gm-Message-State: AOJu0YzSEiezQohzQpyQTnqqLdsK+zmkDOtcvJ5y85zP54ee6wGQwRbA
	opE64EBuv42cEXh4Z9WZf4v5GkhnqZwXX0aSMbxQub/CvSniuRFbKV0PxEZoCHOPuNYufkUa6gf
	CnPE9jIX7Mi17nN5mbA4VGqAgnGg=
X-Google-Smtp-Source: AGHT+IGgl9zB3oDaJg9LMakRXbluhQajcfH8DQA+88gL3paaKrm+BKJHQeEfURGsh59uvKDOAG6ld7QVxz2CJSgXohM=
X-Received: by 2002:ac2:5e76:0:b0:542:a73d:a39c with SMTP id
 2adb3069b0e04-54518182f4fmr1538906e87.49.1739419741527; Wed, 12 Feb 2025
 20:09:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250212154537.235297-1-ant.v.moryakov@gmail.com>
In-Reply-To: <20250212154537.235297-1-ant.v.moryakov@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 13 Feb 2025 13:08:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNATQgMWhB0wbdeAYTRUyR9f8pKyrqt1m_YjwdAzYv9M5ZA@mail.gmail.com>
X-Gm-Features: AWEUYZnUwwilJCoymb_SQ9Hgu8_XrTvQTDz41vkXPDdy0IdP3fXtQYv-7rExOFQ
Message-ID: <CAK7LNATQgMWhB0wbdeAYTRUyR9f8pKyrqt1m_YjwdAzYv9M5ZA@mail.gmail.com>
Subject: Re: [PATCH] scripts: kconfig: Fix potential NULL pointer dereference in
To: Anton Moryakov <ant.v.moryakov@gmail.com>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 12:45=E2=80=AFAM Anton Moryakov
<ant.v.moryakov@gmail.com> wrote:
>
> The function `prop_get_symbol` may return NULL, which was not checked
> before dereferencing the pointer in `menu_finalize`. This could lead
> to undefined behavior or crashes.


Please attach a simple test case that leads to a crash.



>
> This commit adds a NULL check before accessing `es->rev_dep.expr` and
> `es->implied.expr`. If `es` is NULL, a warning is logged, and the
> operation is skipped.
>
> Triggers found by static analyzer Svace.

In my understanding, P_SELECT always has  a non-NULL ->expr
if you look at the code in scripts/kconfig/parser.y

  menu_add_symbol(P_SELECT, $2, $3);


$2 is the selected symbol, and passed to expr_alloc_symbol()








> Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>
>
> ---
>  scripts/kconfig/menu.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 0fe7f3255a..3fb3ab4637 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -400,12 +400,18 @@ void menu_finalize(struct menu *parent)
>                                  */
>                                 if (prop->type =3D=3D P_SELECT) {
>                                         struct symbol *es =3D prop_get_sy=
mbol(prop);
> -                                       es->rev_dep.expr =3D expr_alloc_o=
r(es->rev_dep.expr,
> -                                                       expr_alloc_and(ex=
pr_alloc_symbol(menu->sym), expr_copy(dep)));
> +                                       if (es) {
> +                                               es->rev_dep.expr =3D expr=
_alloc_or(es->rev_dep.expr,
> +                                                               expr_allo=
c_and(expr_alloc_symbol(menu->sym), expr_copy(dep)));
> +                                       } else
> +                                               menu_warn(menu, "select p=
roperty has no symbol");
>                                 } else if (prop->type =3D=3D P_IMPLY) {
>                                         struct symbol *es =3D prop_get_sy=
mbol(prop);
> -                                       es->implied.expr =3D expr_alloc_o=
r(es->implied.expr,
> -                                                       expr_alloc_and(ex=
pr_alloc_symbol(menu->sym), expr_copy(dep)));
> +                                       if (es) {
> +                                               es->implied.expr =3D expr=
_alloc_or(es->implied.expr,
> +                                                               expr_allo=
c_and(expr_alloc_symbol(menu->sym), expr_copy(dep)));
> +                                       } else
> +                                               menu_warn(menu, "imply pr=
operty has no symbol");
>                                 }
>                         }
>                 }
> --
> 2.30.2
>
>


--=20
Best Regards
Masahiro Yamada

