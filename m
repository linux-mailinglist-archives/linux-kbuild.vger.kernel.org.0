Return-Path: <linux-kbuild+bounces-5476-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9E5A0FE05
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 02:24:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8662B7A28ED
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2025 01:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395EC224B0F;
	Tue, 14 Jan 2025 01:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/OFefak"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB6AEC5;
	Tue, 14 Jan 2025 01:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736817855; cv=none; b=jQnoGSZA3AIJ86bhe4eYtwNSrwGQz+2gXbitOqEzpSkXOADpDCQNfZ/AG+3BkEV0L8zytm4s2zEMpe3CilN7sxTtVoVl6vvRJ4E/w6MHdEtVzWtAAICXuUYo/SSTOY9LMONx0LDwbO6JA1p9VFB5wXJP8rq5fJJO2KITkeXHVr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736817855; c=relaxed/simple;
	bh=Mw/uM5Ym6k7+JQGzxbmSntpOK76IhsQgazeny9kZpSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UCE+eJSj3TChbgCwte/38lXcx0XpMzs3g3+ypo0nXUU4aeLV+Ll3K28F84CsWeJ99UWEpqBkIeYx0YGjq5JDM7ZG/NxxpBktaT40fBzPeSKXdJpSmHGGehyn4Ez8tmrKzMXE//8hb/Akt4mMhHsxWAwU41PikMw5S/TDiUUP0LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/OFefak; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D84C4CED6;
	Tue, 14 Jan 2025 01:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736817854;
	bh=Mw/uM5Ym6k7+JQGzxbmSntpOK76IhsQgazeny9kZpSI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c/OFefakTWLHt4RLBm6Ul2Cah1c4K+81hwDMg1aReArbl5hBXOd2I7ginnjOkNkvy
	 2Ln6lAZWzG90D4jQhGfvNs9JA9085EIgseRhtmhLrcxjchImMJqLRlGJ47p5aSYDYm
	 Mvod6GsZ7IbAWwWmvtvSCDYGRdCaz4PwtHScaAtdK7ZnLPmX7EC7N/EnEkSuPiPDTy
	 e5QEMiG24YkpibwvGyCJESVzZEFfECqVS9eMBV8hDqOG5zS1XOONqhLu29inpQDzZc
	 1+KR29hZ9/Cb+ZiGD/BTGFj1+h8BpqwryGlcko+hwHR5lyelQCBdbrA5v4JO/lcHiQ
	 Wctp/adXuCADQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-303548a933aso39637151fa.3;
        Mon, 13 Jan 2025 17:24:14 -0800 (PST)
X-Gm-Message-State: AOJu0YzJfaHR5sFyFM01LKEqt7UsMxpCi43fGpl2ku+QlxVhszt32AlO
	+91SQpphNbH0LE7rk70rGZuYs+mRHMxXkbT/TLEgH+HdL1sGDBo+d38cU3EykHgyOZuKRF+6LiK
	sfENckaIwLNR54TF7WHCE2sLP0MI=
X-Google-Smtp-Source: AGHT+IGjpo0xLbCIK81v86xEKewUwszJmTglvNYh3aYVxji4p/FS1JfjtB1EZRkEurPPie4C8wfgJz8ZoARWQdtwbL8=
X-Received: by 2002:a2e:a99b:0:b0:302:3a28:76cf with SMTP id
 38308e7fff4ca-305f45db297mr80149771fa.25.1736817853119; Mon, 13 Jan 2025
 17:24:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113150253.3097820-1-masahiroy@kernel.org> <20250113150253.3097820-5-masahiroy@kernel.org>
In-Reply-To: <20250113150253.3097820-5-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 14 Jan 2025 10:23:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQvV7EVdNdZ-oM27ouREohwvf49U+uCfoqB8Dkm7E-7Og@mail.gmail.com>
X-Gm-Features: AbW1kvb9pZ1ecFlR4ZE4y55hSNBNmT9t1iyNuDu7CPzyvI7rPGghgaQ9x4ic4Sg
Message-ID: <CAK7LNAQvV7EVdNdZ-oM27ouREohwvf49U+uCfoqB8Dkm7E-7Og@mail.gmail.com>
Subject: Re: [PATCH 04/17] genksyms: fix 6 shift/reduce conflicts and 5
 reduce/reduce conflicts
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 12:03=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> The genksyms parser has ambiguities in its grammar, which are currently
> suppressed by a workaround in scripts/genksyms/Makefile.
>
> Building genksyms with W=3D1 generates the following warnings:
>
>     YACC    scripts/genksyms/parse.tab.[ch]
>   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflict=
s-sr]
>   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflic=
ts-rr]
>   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' t=
o generate conflict counterexamples
>
> The comment in the parser describes the current problem:
>
>     /* This wasn't really a typedef name but an identifier that
>        shadows one.  */
>
> Consider the following simple C code:
>
>     typedef int foo;
>     void my_func(foo foo) {}
>
> In the function parameter list (foo foo), the first 'foo' is a type
> specifier (typedef'ed as 'int'), while the second 'foo' is an identifier.
>
> However, the lexer cannot distinguish between the two. Since 'foo' is
> already typedef'ed, the lexer returns TYPE for both instances, instead
> of returning IDENT for the second one.
>
> To support shadowed identifiers, IDENT can be reduced to either a

   IDENT -> TYPE


> simple_type_specifier or a direct_abstract_declarator, which creates
> a grammatical ambiguity.
>
> Without analyzing the grammar context, it is very difficult to resolve
> this correctly.
>
> This commit introduces a flag, dont_want_type_specifier, which allows
> the parser to inform the lexer whether an identifier is expected. When
> dont_want_type_specifier is true, the type lookup is suppressed, and
> the lexer returns IDENT regardless of any preceding typedef.
>
> After this commit, only 3 shift/reduce conflicts will remain.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>


--=20
Best Regards
Masahiro Yamada

