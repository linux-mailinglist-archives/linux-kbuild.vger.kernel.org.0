Return-Path: <linux-kbuild+bounces-6048-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7DAA5BE77
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 12:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EB4C16B1B0
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 11:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98216250C1F;
	Tue, 11 Mar 2025 11:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BUpJzpgv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8952505AE;
	Tue, 11 Mar 2025 11:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741691112; cv=none; b=oCCYHnsEG3lQdMEbiWiGpMWcsGwMVZxRlL/CROwbUED2lmIVf0UW5JKQZjsCcUWbnBhEt3GOAkWWEHKDGt7oSxVtBaxC4YWQCRBNyD+fT9CZCB4tj+oX20rSBCF4Iv2sK83BbzWUuIG06HUfoExijNWtO4D2H7TK8LTrZVOUPdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741691112; c=relaxed/simple;
	bh=BiHmDYOuzUjfVhezNhiaK4e3WiBwtSghS5TMbOSMbhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HImlfDD4zX3R6xx+axSacBjMTB79MfGlungXAeQ5da3lpZ1V6O+tn8DBMvXhqdf0PcC4LonCVUKG1xVho4sWwP4LreGSWKo+yOfGJug/Qb5NC3G0rIGpQFrtEOFZs1gg2xYyXyB7Iea+2TFCvVHz4q1XS6cGd7EhS5kA8THUm34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BUpJzpgv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B129C4CEE9;
	Tue, 11 Mar 2025 11:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741691112;
	bh=BiHmDYOuzUjfVhezNhiaK4e3WiBwtSghS5TMbOSMbhY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BUpJzpgvO46/fHm0lQGpknJzkyRXqNRP9L8armM4SyU2ePvn0SjzecH4SuJK3qLjJ
	 /C16bBN0A5zza7lLivOxkkVMpEgSDVblkn4KDwjWHrR70viR99+ot+OVC8dqdagknQ
	 sia+/1UiwzdKuaMedHQrKFPWncnxfB/PPwOtSkX0snCtePRnwCBeV/bHVTNpl7GfnE
	 ZiUjFujNFuAAAoUpVqpgKlx4e45fm0pQ5OTgx8k0tTVoyUKsSFbmSxWsM+jcklJ6Ra
	 WF53BiyQQNemWxu9CIJDNnk9L7sJJAp5hhpi3elWnZ/mdNEjmivcoCPXT3MyLwjZwc
	 ggcFkav+N3Heg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30797730cbdso56279831fa.3;
        Tue, 11 Mar 2025 04:05:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVg/Fj8yDMp3ftVHw/ATWyMw/ZAJ/nCErf2oHRhJoz1hzA8fVE9sYz+SUsd1TH9vJ+C1VxbOs4Td29uBiOi@vger.kernel.org, AJvYcCWHHy2hOhsbn/bWjdKY7YPoODQGm2Jm/lDyheAfjGv36OF3Ho16+y2Lh/8IBY5OEa6mdcEeSOPYr1dx6dI=@vger.kernel.org, AJvYcCX8k3j9Os/Vy0xuyHdTJa1u7IMrblZRvOkufZUvz+/P07WnneoqCMh8jMP7sSuA7awP3kr/lVDcFtMi/NBcSrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvNX/maDENFrC8HmVWu8DtJlxOD+hAu8h2Z9a4ze7+BKrgYjCF
	qbWtFsSEZDImJCR2GYB7eWt3sGb2C6YxG8UUj5xw9Ef1F2A/zN+gR/2MwzDmoKXc+aOXCVmguNi
	yw1y9EtoETx8oMguS7wpUM3j0BHI=
X-Google-Smtp-Source: AGHT+IGOFIDfX9MZ/eIx+BRhPpz5HIYVrm/mXus767BMsorp4XqzU7zW79c2E/z3oT1nJUc5A5tpgawcytKkW1A431I=
X-Received: by 2002:a05:6512:224f:b0:545:1e2d:6b73 with SMTP id
 2adb3069b0e04-54990e5d317mr5302820e87.13.1741691110968; Tue, 11 Mar 2025
 04:05:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219-rust-path-remap-v2-1-8ce2c10d4d66@weissschuh.net>
In-Reply-To: <20250219-rust-path-remap-v2-1-8ce2c10d4d66@weissschuh.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 11 Mar 2025 20:04:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNASvSShHcf-gL52cF0PGYOx=nJvvbfeGjPVtpEa+t78Kew@mail.gmail.com>
X-Gm-Features: AQ5f1Jr91UjOmYq0vXb1xyKqplM7uLhxpXEIt_A2xO8VqfT5Gc9ntPiiMiy5pso
Message-ID: <CAK7LNASvSShHcf-gL52cF0PGYOx=nJvvbfeGjPVtpEa+t78Kew@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild, rust: use -fremap-path-prefix to make paths relative
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 6:22=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> Remap source path prefixes in all output, including compiler
> diagnostics, debug information, macro expansions, etc.
> This removes a few absolute paths from the binary and also makes it
> possible to use core::panic::Location properly.
>
> Equivalent to the same configuration done for C sources in
> commit 1d3730f0012f ("kbuild: support -fmacro-prefix-map for external mod=
ules")
> and commit a73619a845d5 ("kbuild: use -fmacro-prefix-map to make __FILE__=
 a relative path").
>
> Link: https://doc.rust-lang.org/rustc/command-line-arguments.html#--remap=
-path-prefix-remap-source-names-in-output
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
> Changes in v2:
> - Drop the usage of $(call rustc-option)
> - Link to v1: https://lore.kernel.org/r/20250210-rust-path-remap-v1-1-021=
c48188df1@weissschuh.net
> ---

Applied to linux-kbuild.
Thanks.


>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Makefile b/Makefile
> index 9e0d63d9d94b90672f91929e5e148e5a0c346cb6..9ed2222fafd4fa37a367b87a5=
c681936368318e7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1068,6 +1068,7 @@ endif
>  # change __FILE__ to the relative path to the source directory
>  ifdef building_out_of_srctree
>  KBUILD_CPPFLAGS +=3D $(call cc-option,-fmacro-prefix-map=3D$(srcroot)/=
=3D)
> +KBUILD_RUSTFLAGS +=3D --remap-path-prefix=3D$(srcroot)/=3D
>  endif
>
>  # include additional Makefiles when needed
>
> ---
> base-commit: beeb78d46249cab8b2b8359a2ce8fa5376b5ad2d
> change-id: 20250210-rust-path-remap-e97cec71e61a
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>


--=20
Best Regards
Masahiro Yamada

