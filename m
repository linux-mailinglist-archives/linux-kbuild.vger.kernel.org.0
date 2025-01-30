Return-Path: <linux-kbuild+bounces-5568-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1ACA227B2
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jan 2025 03:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A2D6165667
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jan 2025 02:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCC412C499;
	Thu, 30 Jan 2025 02:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cq66AvgL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1773470814;
	Thu, 30 Jan 2025 02:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738204553; cv=none; b=epdQn45g3G8trZ6DjxS6zcrSqWrbPtOH3nriVQTW1cPRg0yvxuy1l66FNdNMVV3Soxq/zRdzHm7uk3HAMOK7Eg3Y7U1+dFedYHLt+9FHYNdSyV0m0v+eOc2Lw2EOz1L3/jsAx6M7Z3U8YTAUoB8cxtbVVqZJ+a8j3Zp7rQuCzF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738204553; c=relaxed/simple;
	bh=T0RovnnXWTxM6L/zQT97fVSjSrKG8gRUFwQkT/Zrhik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t3f6F7ZQOgC7adkvcGX/ZAj6E91vP+I0v3ah5rA5GPpeWx1/hGEmA+JTBmT5mtBmm4yhyv00Qw71QSxVrtL3APv+ybJHr5WCLWY+eCd056oD+3al777HyRqgVwY0I/jXW+gmkR+0hqweVw3PQVhtIZWVorIQrNHbNLeW5SWjDQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cq66AvgL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903FAC4CEE4;
	Thu, 30 Jan 2025 02:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738204552;
	bh=T0RovnnXWTxM6L/zQT97fVSjSrKG8gRUFwQkT/Zrhik=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Cq66AvgLr3NzPqeAHIOw4GZ+r9B1Mn//sRDrLU4WB7q8Hpr51ieznc3qpMzKY6fZQ
	 C+JLlckm1cHdsAlncbx7FB6a+8gXDkpipLL+H+xdOs8aZUkcdEUK9V4SxwRb1LhDA0
	 b2ixFKYk7V0NS0RUpM9AAD/eERjp2NtzqBz+ugZDLdbbL3kRJ3tzh1Qi0EMQyAvB7g
	 ltBo2q8sAwjj2I1fZAHiiHFQPzQGxRvtQ3bY06zGFXmc84KpXx5e0ACUwYdGOdp9dD
	 igFTLanf1sRYoaJO+JDzCovUBLxGKrVpaFkCNsvHvOzSdDdWIHzNFoHZWHNZUxWHFH
	 9x8SdOv61MULQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-540218726d5so299329e87.2;
        Wed, 29 Jan 2025 18:35:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVAQv81mTloR6pm0DYEOJ6YG5PYmHyRTyNC9iFhU4mF5WNbLkvunB/v5LMmniOqC2VN3x/RLcnPOy874bu0@vger.kernel.org, AJvYcCVfBFinFmSTlZcOUBQAABdBoaGVT85mYRj3kglchjDapAryZf32+HrLAXj1mfgZeFKO1IKwMIDX8wOruq2HQFc=@vger.kernel.org, AJvYcCXpUWWwPL6AC1hXodOXwV/85s4k+N7CsoVCjOYmx7rRaAQlCnHirO9vh2bUDJ2/tpPqjPwawDk2lnkuOs0T@vger.kernel.org
X-Gm-Message-State: AOJu0YxqjHC9I3iqS8DhT9rWboO+dAvXXjnhB78O5SrP9AxeJBU3cBlR
	Ojz2lgv6D2letZXK49HKkHDIcFEE+Ubx5fxfofmZwRLHRQh6RSPY51FRbJdyQlJ7zV+hk9PiMZp
	k3eAT3S06Dl+mmXv54vmpD3YSzG4=
X-Google-Smtp-Source: AGHT+IFMGErUnujwP3n6bW5wKMD+e0J+f1mcVybdVxr5wZnJ6lnpYxeSgL8sUGrrVHOPGXiCPNWj/PN3Kut7CtsOPp8=
X-Received: by 2002:ac2:55ab:0:b0:540:2549:b5ad with SMTP id
 2adb3069b0e04-543e4beab7dmr1443386e87.22.1738204551169; Wed, 29 Jan 2025
 18:35:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250127190636.it.745-kees@kernel.org> <20250127191031.245214-3-kees@kernel.org>
In-Reply-To: <20250127191031.245214-3-kees@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 30 Jan 2025 11:35:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ8RCAKWhwWNVA6jv-MGNCRFjsiBw2U6Y+3SDmv=7XGJg@mail.gmail.com>
X-Gm-Features: AWEUYZn4_c25TVQTqoLVdGfmnUT7NotqVxqLcoXnpzgN0PqT25tgrCqcg-3QAlM
Message-ID: <CAK7LNAQ8RCAKWhwWNVA6jv-MGNCRFjsiBw2U6Y+3SDmv=7XGJg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] kbuild: Use -fzero-init-padding-bits=all
To: Kees Cook <kees@kernel.org>
Cc: Jakub Jelinek <jakub@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 4:10=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> GCC 15 introduces a regression in "=3D { 0 }" style initialization of
> unions that Linux has depended on for eliminating uninitialized variable
> contents. GCC does not seem likely to fix it[1], instead suggesting[2]
> that affected projects start using -fzero-init-padding-bits=3Dunions.
>
> To avoid future surprises beyond just the current situation with unions,
> enable -fzero-init-padding-bits=3Dall when available (GCC 15+). This will
> correctly zero padding bits in unions and structs that might have been
> left uninitialized, and will make sure there is no immediate regression
> in union initializations. As seen in the stackinit KUnit selftest union
> cases, which were passing before, were failing under GCC 15:
>
>     not ok 18 test_small_start_old_zero
>     ok 29 test_small_start_dynamic_partial # SKIP XFAIL uninit bytes: 63
>     ok 32 test_small_start_assigned_dynamic_partial # SKIP XFAIL uninit b=
ytes: 63
>     ok 67 test_small_start_static_partial # SKIP XFAIL uninit bytes: 63
>     ok 70 test_small_start_static_all # SKIP XFAIL uninit bytes: 56
>     ok 73 test_small_start_dynamic_all # SKIP XFAIL uninit bytes: 56
>     ok 82 test_small_start_assigned_static_partial # SKIP XFAIL uninit by=
tes: 63
>     ok 85 test_small_start_assigned_static_all # SKIP XFAIL uninit bytes:=
 56
>     ok 88 test_small_start_assigned_dynamic_all # SKIP XFAIL uninit bytes=
: 56
>
> The above all now pass again with -fzero-init-padding-bits=3Dall added.
>
> This also fixes the following cases for struct initialization that had
> been XFAIL until now because there was no compiler support beyond the
> larger "-ftrivial-auto-var-init=3Dzero" option:
>
>     ok 38 test_small_hole_static_all # SKIP XFAIL uninit bytes: 3
>     ok 39 test_big_hole_static_all # SKIP XFAIL uninit bytes: 124
>     ok 40 test_trailing_hole_static_all # SKIP XFAIL uninit bytes: 7
>     ok 42 test_small_hole_dynamic_all # SKIP XFAIL uninit bytes: 3
>     ok 43 test_big_hole_dynamic_all # SKIP XFAIL uninit bytes: 124
>     ok 44 test_trailing_hole_dynamic_all # SKIP XFAIL uninit bytes: 7
>     ok 58 test_small_hole_assigned_static_all # SKIP XFAIL uninit bytes: =
3
>     ok 59 test_big_hole_assigned_static_all # SKIP XFAIL uninit bytes: 12=
4
>     ok 60 test_trailing_hole_assigned_static_all # SKIP XFAIL uninit byte=
s: 7
>     ok 62 test_small_hole_assigned_dynamic_all # SKIP XFAIL uninit bytes:=
 3
>     ok 63 test_big_hole_assigned_dynamic_all # SKIP XFAIL uninit bytes: 1=
24
>     ok 64 test_trailing_hole_assigned_dynamic_all # SKIP XFAIL uninit byt=
es: 7
>
> All of the above now pass when built under GCC 15. Tests can be seen
> with:
>
>     ./tools/testing/kunit/kunit.py run stackinit --arch=3Dx86_64 \
>         --make_option CC=3Dgcc-15
>
> Clang continues to fully initialize these kinds of variables[3] with
> additional flags.
>
> Suggested-by: Jakub Jelinek <jakub@redhat.com>
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D118403 [1]
> Link: https://lore.kernel.org/linux-toolchains/Z0hRrrNU3Q+ro2T7@tucnak/ [=
2]
> Link: https://github.com/llvm/llvm-project/commit/7a086e1b2dc05f54afae359=
1614feede727601fa [3]
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---



Acked-by: Masahiro Yamada <masahiroy@kernel.org>






> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nicolas Schier <nicolas@fjasle.eu>
> Cc: linux-kbuild@vger.kernel.org
> ---
>  scripts/Makefile.extrawarn | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 1d13cecc7cc7..eb719f6d8d53 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -77,6 +77,9 @@ KBUILD_CFLAGS +=3D $(call cc-option,-Werror=3Ddesignate=
d-init)
>  # Warn if there is an enum types mismatch
>  KBUILD_CFLAGS +=3D $(call cc-option,-Wenum-conversion)
>
> +# Explicitly clear padding bits during variable initialization
> +KBUILD_CFLAGS +=3D $(call cc-option,-fzero-init-padding-bits=3Dall)
> +
>  KBUILD_CFLAGS +=3D -Wextra
>  KBUILD_CFLAGS +=3D -Wunused
>
> --
> 2.34.1
>


--=20
Best Regards
Masahiro Yamada

