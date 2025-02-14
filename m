Return-Path: <linux-kbuild+bounces-5752-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB311A353C9
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Feb 2025 02:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F35716AA02
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Feb 2025 01:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757FA5BAF0;
	Fri, 14 Feb 2025 01:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCpZJaSM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A51537FF;
	Fri, 14 Feb 2025 01:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739497159; cv=none; b=e0mu2Lk5/rVGQErZeWR7BN6ESeeLmDffV19w5BS63GpWjCGfPQigbTKk47SJ3jnE9Ts/YTgvcVETscB2AtscF+x3sxvwQczXIlXsLK9iEQSflzLEeCBr+wWt7h/0rENIVh6uCf755pGMjIvkJeXUg9RsURSG5PSjJ3Yq/6a1ahk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739497159; c=relaxed/simple;
	bh=9IxhGYBiqmCXEOQC+SsmBi/iEnbY572YamGs8pAzvaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nbkEhELlaQ6SZ1aknZwYCFXpwX+oRAgDqTm/HMo3vMdi2UnqNXucLxtgRcVr2bV7hLXdF7omcrD39/A3e8uW6MZhLOUnKOPKQcdQP3t04ldlgtPSUK9vx4vZgJmjISdBAT0B+Gz7O2GivNUXKmQeUu3oOa1x+F+pEgUDA9nHJ5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCpZJaSM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A42C4CEE5;
	Fri, 14 Feb 2025 01:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739497158;
	bh=9IxhGYBiqmCXEOQC+SsmBi/iEnbY572YamGs8pAzvaI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QCpZJaSMvwlOtPipw6P2cmUd735GYuoTwoZ7oGgyosvm9q5hKR/SP0A5/TSGHCFA+
	 BR0kVj9fAbXBEOmNfXfu+V08GkWLc/YOV/KSr0fXaxAa/WlhEChsxDOYG85kX7Fo11
	 ESawMtQbxeG4MFhh5rm/fegF36JvEBXWBb2Tg+AuuDrzGRtQtuZ0TVuH23pcKt6/2h
	 /2a+2mWeeUp/ifkZWJfWtpPYVEd3JfboIquEElv2t5QIDp8w5zBoSbD2oUzftfRakW
	 cK7tx/mQJGvYTJBmVK/RTGoIhDCESXELHgOVsGk0mcVloBzOlbuikspPotWHdJxPLP
	 u7haketNbg8kQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30615661f98so16858041fa.2;
        Thu, 13 Feb 2025 17:39:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUw+dXNXKgQLFCOGMwDW0dxRyT9KeiSw0WigCMYFVX3g5ACZnryRZK50hH4ZGpkwihKxZNYpZBR1PFZpGOm@vger.kernel.org, AJvYcCW3qt8PVatSxYeUBC0+6XJsafeOr+oiiOkLQwSqbg65v2mKH/zUf83zd8PhfNLunZynntDpcFSnD0NpCcVOscM=@vger.kernel.org, AJvYcCWaN8bUvobNP+sceXv1/wPS7xekUmGEy7IfRNDZrNwApOCpgtxClKzhqXDIPNJGLhVTbwtmCSOe9EA=@vger.kernel.org, AJvYcCXkZS933uOtNCpEDGeTST38J1e7ooxPVGkj+1KvXg1X0J+cKaz/0BdhOBoHkT+iTy18mChSKhb+oG9cYH2H@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbe4a0pPVAB2Sf+gpShliVffO5qGX+BT2L0UxLGMeP3NKRKCDR
	qhtFOMqAUsiVdhGL2s/jUdsm+DU/dSra3lQ6MXCZKf1rxjdCp+If5yKhhYgxth2ZeQ34s5Ef+2U
	ksBb6k3iU9PE7QPQaDnmH/cDYR4g=
X-Google-Smtp-Source: AGHT+IGEYz+WkoUrySCxtqr7dpKbi6V2S+88qBoYDexCvVUD02b8yZebnuEPHDd5b4ywaSPaelkedcVjstzog0U1ao8=
X-Received: by 2002:a05:6512:1281:b0:545:ee3:f3be with SMTP id
 2adb3069b0e04-5451dd88faemr1651337e87.10.1739497157461; Thu, 13 Feb 2025
 17:39:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210164245.282886-1-ojeda@kernel.org>
In-Reply-To: <20250210164245.282886-1-ojeda@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 14 Feb 2025 10:38:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQBFX5q6yyKBJoxMoD5d9SwdKm0c23J4+LpjwA1eh=bZw@mail.gmail.com>
X-Gm-Features: AWEUYZnI4fpDKGlVQ3nPgTvxchXJzpHlGyUSt2uP8tA04Q4qKsA6VL1SMVCFHCo
Message-ID: <CAK7LNAQBFX5q6yyKBJoxMoD5d9SwdKm0c23J4+LpjwA1eh=bZw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add rustc-min-version support function
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 1:43=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Introduce `rustc-min-version` support function that mimics
> `{gcc,clang}-min-version` ones, following commit 88b61e3bff93
> ("Makefile.compiler: replace cc-ifversion with compiler-specific macros")=
.
>
> In addition, use it in the first use case we have in the kernel (which
> was done independently to minimize the changes needed for the fix).
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> This is based on top of the fix so that the fix remains as simple as
> possible:
>
>     https://lore.kernel.org/rust-for-linux/20250210163732.281786-1-ojeda@=
kernel.org/
>



Do you want me to pick it up to kbuild tree,
or will you take it with my Ack?

If you go with the latter,
Acked-by: Masahiro Yamada <masahiroy@kernel.org>



--=20
Best Regards
Masahiro Yamada

