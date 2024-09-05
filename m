Return-Path: <linux-kbuild+bounces-3387-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B16F96CC28
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 03:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 014E0B2437C
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Sep 2024 01:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E17523AD;
	Thu,  5 Sep 2024 01:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G3MXffba"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CED1EBFEB;
	Thu,  5 Sep 2024 01:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725499192; cv=none; b=QBZ6UkQbMMccS926cGnw8Ym+2i6h/1MwrLghqkLEuTCRJ1bhBFbLROktRGPBChG11g3sQHlBfcraP14qYBG3iwN2yNq7POZQRtbR4IAQUj2hLMPyhuf/Lwuu1w3Cu9sAdsokdh7WlG7U3UgqiSZ3+ZaQz3jcG/rE0CsUSysuz/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725499192; c=relaxed/simple;
	bh=2030roQObHKMD07MYVmrkVNTgGeX8KWnT4BgIJmDcMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=shFM6yfneWqOpT7nvo1DhsoPrcXhjEaznq7cRKJ5I4zVj77DL1IKf1sHrIqe2cAxcjGw+WUluBd5S0mgb2WhU/RDZIl5a8qOzv1aeYvfoln6jUe387VpK6vnDTiVDPtDxgDT2XDv0NA2Z8J07AH+xxA+G3foAhhedqF+j9fO6nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G3MXffba; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3F5C4CEC8;
	Thu,  5 Sep 2024 01:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725499191;
	bh=2030roQObHKMD07MYVmrkVNTgGeX8KWnT4BgIJmDcMU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G3MXffbazN9EZG5EMYdkQbXUjX91lqjSxqQwcqp/1CxDBoOc1VuLaLIme+BZ2roWd
	 fT120jhuIQw18y07vxNuxa6LEgZzhh7jgOwV1g/q/ChReV8H4hO8sRJcQzloOMyGJg
	 figU2AAjKXsvXOi1fXVB93bdQOzgNbtSNC2V+3FsOL08GaiqgW1CW8wlUEYSWU1AqB
	 Ql6p9WRwtQPHXdOYVttYRC5J13wsm3Ncjlq70xNJlKFnf6i2uRHL090sAMsalLp+s1
	 WFfIuKgsGHZ4OKYGiBiJdEyydAbNWR9T2LoAfe5AIOFTb6C6S0TcsT18D0Zd0Vf1eQ
	 TzFrQkGLpKY9Q==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5334b0e1a8eso168141e87.0;
        Wed, 04 Sep 2024 18:19:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3aH7a/wZ2bJ5kbTuRb8+pIR5iaWK0QxI4cZ0p91xA4D/wZZ8MyJ2/7E63qXS055LapyqH34/Q7g9oFBI=@vger.kernel.org, AJvYcCVADf8/hoiyFac9Dh1pUw9K7aqBHl1KqH7/7ibL/V6EcxgbjMWu09mOnlJYqnNraDpxqDEmDNdJui6KHaatoww=@vger.kernel.org, AJvYcCWKX+JhoJlpByHPkk62CFbEivWZqoX70yhiEtR0zCo7mj9pYKddzs9qr8TNPUXyKcRGC7X2WcaHWTOf2dU5@vger.kernel.org
X-Gm-Message-State: AOJu0YyVjrCy7lsRvLAbfmSxaBBls0FDyCr5B5vd9Zq+zTU6h+8ieJXJ
	Vp0+dhb4QMGqhJav0gnBKvzw9xX+TyzE8pyYqhEV9RCIeDh+ofGpXydRHmz+eUyCn6wMm8gU9qC
	BN0DHYS+JNjMLGlbgO2wWrLYGBrA=
X-Google-Smtp-Source: AGHT+IF1S6v2KNIhGOZ4cv9q3lTpmiKDe9DRF/mzNEjxzA3Vdc+CY+N3vgCLk5zSrB3AtBSyj3C1NAQKG+yhUCoZzHo=
X-Received: by 2002:a05:6512:1382:b0:530:da96:a986 with SMTP id
 2adb3069b0e04-53546b8dac1mr11309551e87.47.1725499190276; Wed, 04 Sep 2024
 18:19:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808221138.873750-1-ojeda@kernel.org> <CAH5fLgh9Moq_9M+zMu300ohK=mPqkLyS6cpQ6An2Q3THCPFjaA@mail.gmail.com>
 <CANiq72kUBPnua1Pob++-6SJ8MeGxQMfrePY9SQVd0DZp5VU-2A@mail.gmail.com>
In-Reply-To: <CANiq72kUBPnua1Pob++-6SJ8MeGxQMfrePY9SQVd0DZp5VU-2A@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 5 Sep 2024 10:19:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNASHdd8Gv6OpXnP3tywrTA6iEZVqZGLb0V-vV_VUR-ksWQ@mail.gmail.com>
Message-ID: <CAK7LNASHdd8Gv6OpXnP3tywrTA6iEZVqZGLb0V-vV_VUR-ksWQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] kbuild: rust: add `RUSTC_VERSION` and
 reconfig/rebuild support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 2:40=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Aug 19, 2024 at 9:29=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > I tested this together with Rust Binder. I also ran this patchset
> > through Android's CI setup to verify that it works in builds with
> > CONFIG_RUST disabled. It passes both with and without a Rust compiler
> > available to the build system.
> >
> > Tested-by: Alice Ryhl <aliceryhl@google.com>
> >
> > I'm happy to rerun these tests for new versions.
>
> Thanks a lot Alice, that is very useful.
>
> I sent v2, in case you have time to give it another go.
>
> Cheers,
> Miguel


With the nit in 1/6 fixed (No need to resend if you fix it locally)


Acked-by: Masahiro Yamada <masahiroy@kernel.org>




--=20
Best Regards
Masahiro Yamada

