Return-Path: <linux-kbuild+bounces-22-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA607E9E4E
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Nov 2023 15:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54FF6280DD8
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Nov 2023 14:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19B1210E9;
	Mon, 13 Nov 2023 14:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQNxv/g1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11D9208DC;
	Mon, 13 Nov 2023 14:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D92C433C7;
	Mon, 13 Nov 2023 14:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699884836;
	bh=nEL9T7++gP1nGn/dMS7dDVUZEBwQg5LVDeNmJyp/zXQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bQNxv/g1FRP+dHdguSjl2OSOGwVROx2/T7yHTLUR3JJ9OHyidohNq90pId8h538RK
	 li6vP8M2fhdyW3sW9Sk5llHIE50tIfvtAvySvICVt7+QvRlSZsDlS0EjllwlPGA3b4
	 a6QlHy0sRYdg547fvtjfNCW0g1dU6Ujha9p7RkVfyHaVZhs3rnS9CTC5erzb/Jw2Y7
	 QXnuYg9QysM3gBCR+N4c42Dj0ieYerxxr/hk5TaFz1JSFheG13oHXyW9i82cuJy0GJ
	 Hia3SpelP9AASVnwt6qIIS1A3b1YCr3xHSFzl9cCVKu011lHVGYzDmaJYslv2T8q8H
	 o3Yn7ZbqEcIlw==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1efad296d42so2706166fac.2;
        Mon, 13 Nov 2023 06:13:56 -0800 (PST)
X-Gm-Message-State: AOJu0YwZxXiuHvVxvrPZ0fIC/32GoSicBCdK7RQoMnOenFyWWi3Auc2D
	dVYoqYSNdzzcMKJvz9vMZLeqwx2+FewPFt67Y7Y=
X-Google-Smtp-Source: AGHT+IHMF885MO2Ld8V6xmNxEgpBURyKIrBhLW1IpJYEzjdx3MFYv0o2DhB7dVIZ9jMVIecYgWUnzkCpdjMxQFeKJnQ=
X-Received: by 2002:a05:6870:bd46:b0:1e9:af65:e30b with SMTP id
 og6-20020a056870bd4600b001e9af65e30bmr10062404oab.38.1699884835520; Mon, 13
 Nov 2023 06:13:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231104211213.225891-1-yakoyoku@gmail.com>
In-Reply-To: <20231104211213.225891-1-yakoyoku@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 13 Nov 2023 23:13:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT4zKWn6+scn5wbaN2_x4wh4EYSuNxnaoQK1FfJK45MOw@mail.gmail.com>
Message-ID: <CAK7LNAT4zKWn6+scn5wbaN2_x4wh4EYSuNxnaoQK1FfJK45MOw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/2] rust: crates in other kernel directories
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 5, 2023 at 6:12=E2=80=AFAM Martin Rodriguez Reboredo
<yakoyoku@gmail.com> wrote:
>
> This RFC provides makes possible to have bindings for kernel subsystems
> that are compiled as modules.
>
> Previously, if you wanted to have Rust bindings for a subsystem, like
> AMBA for example, you had to put it under `rust/kernel/` so it came
> part of the `kernel` crate, but this came with many downsides. Namely
> if you compiled said subsystem as a module you've a dependency on it
> from `kernel`, which is linked directly on `vmlinux`.
>
> So instead of overpopulating `kernel` with a gazillion modules that
> throws you into dire straits you should rather have the bindings in the
> same directory as the subsystem you want to bind with and link it to
> it.
>
> With this patch Rust sources can be compiled into libraries for them to
> be consumed. These libraries are ar archives that follow the `.rlib`
> structure, namely a libfoo.rlib thin archive with a foo.foo.o object
> and a libfoo.rmeta rustc metadata as members. Such Rust crates get
> their symbols exposed and the `bindings` crate is made available for
> them.
>
> Also included there's a sample usage of this in another patch, but it
> is not meant to be merged as it remains as an example.
>
> If you want to use a crate with your Rust module just add a `rust-libs`
> variable in your Makefile with a value of the relative directory of
> said crate plus its name, e.g.
>
>     # Link with the foo crate
>     rust-libs +=3D ../path/to/foo




I will not provide a line-by-line review.


Just one thing I'd like to point out.

You assume the library (drivers/usb/core/*)
is built before its consumers (samples/rust/*).

If Kbuild ends up with building lib consumers first,
it will be a build error.



Kbuild descends into multiple directories in parallel building.

You cannot predict which directory is built first.








> Martin Rodriguez Reboredo (2):
>   kbuild: Build Rust crates as libraries
>   samples: rust: Add USB sample bindings
>
>  .gitignore                      |  2 ++
>  Makefile                        |  4 ++--
>  drivers/usb/core/Kconfig        |  7 ++++++
>  drivers/usb/core/Makefile       |  3 +++
>  drivers/usb/core/usb.rs         | 13 ++++++++++
>  rust/bindings/bindings_helper.h |  1 +
>  samples/rust/Kconfig            | 10 ++++++++
>  samples/rust/Makefile           |  3 +++
>  samples/rust/rust_usb_simple.rs | 22 +++++++++++++++++
>  scripts/Makefile.build          | 42 ++++++++++++++++++++++++++++++---
>  scripts/Makefile.lib            | 20 ++++++++++++----
>  scripts/Makefile.modfinal       |  9 +++++--
>  12 files changed, 125 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/usb/core/usb.rs
>  create mode 100644 samples/rust/rust_usb_simple.rs
>
> --
> 2.42.1
>


--=20
Best Regards
Masahiro Yamada

