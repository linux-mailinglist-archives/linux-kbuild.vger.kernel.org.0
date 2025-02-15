Return-Path: <linux-kbuild+bounces-5760-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FB6A36E43
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 13:57:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15B78189353D
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 12:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B922AD2D;
	Sat, 15 Feb 2025 12:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a29d4oib"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A2423BB;
	Sat, 15 Feb 2025 12:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739624228; cv=none; b=CuB3ns4etTmmGuhh9DyQtDgDdylaEn4XzzOFfVJWfWRNwHQIc2D3lGkp3P7ST8h+fPFTpQnigbLFP1Sl9cz/+E4hvlxCf9nAn77Hf+WFyMXXwpLa22PQ9iFgpJ9IUedXnGhweCxCOIaUrCkB5APqrTr64Ww/7lPd34ZZnPx0V7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739624228; c=relaxed/simple;
	bh=kM7YDOX7M089oM6EaB2+Gynk23YBNP4Ux48RkU99e+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dCQ406vWo7G9/OWcqFUlsiaZ6e6BSdj5oBIHlNEZ4UseZbsBNFf6j6/Wv4nsa7OsPSt8OdlAod8JudOS5EzXifZO/lYlutBKiImtNDjvLZZKtOa3B8Vak1whvvDxr1BFihlMr+hpbrhGeD9cMNhCaqht/qbf7UfpfHcmspbXiEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a29d4oib; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0FFAC4CEF1;
	Sat, 15 Feb 2025 12:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739624228;
	bh=kM7YDOX7M089oM6EaB2+Gynk23YBNP4Ux48RkU99e+U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a29d4oib83MWmvJt0oTvfXiQ5oMAhhrNXdt5RTMzCfZRFbTwIrZ/20Gz3HsYlxDG0
	 fM+gWxfKAEq2BLQ6kvXNsZJ2wmH7kh0TTwtBhIcSeBvZuD/JsQTuCfoN9aQoX9AZHi
	 yxuxQmyN+210ij21vPATeYCLBBwx3h0/sJCFFA7HAdzrOWXNTKp+HPfpaW/65a/n2e
	 JgTs9MaQmiPfJJ7GdAVhHvfa1QlNAtkfJdIw6wEn972YsrfD1ZPoUfZY/JVzUKr/5x
	 /nGOA2HIO/5yYOirABW/Y9fV69hQVE4RQZbx7yFw+kgIHeR4qzY6Iwch5CT0FBg0Fl
	 IOQgxoJyR8uWw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3098088c630so1702091fa.1;
        Sat, 15 Feb 2025 04:57:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUMUlkkNH1VIiLGygHaq8aNWhrr/aFVESlyjMIMSwiOUCiOYysmwuGiu5q4A9dIpZIbSIKLWrhwW5kUpr4=@vger.kernel.org, AJvYcCUcfQP2Jvq/B82YONmqRfqTJt4ZG621x46fUKbvv8GVmRkJO80XzOjnXWMxVhkVe/vyfMICeZkUs7whqsWM5C4=@vger.kernel.org, AJvYcCVsvXmn/ZLT8OPaD1BK+4pdnh88P4SJ+hyPmrgWSGfo9DQiBoSCXmq14FUQpG7pDzkqio3iWjh6bgcX42nM@vger.kernel.org
X-Gm-Message-State: AOJu0YwnAgKOBSXfmpJTyto9MLQ388FDLk54pYQJcSt28cZbqc7VBlwS
	xYUmY/01phNKwfr7k8N6eAR48v+3mILXIDyAmjxJmz/AKKHbTTb4327JBLE/iCXvVQe50v9ncvV
	LHFdAeBnf3MzFve6ftFsV/ri/R2g=
X-Google-Smtp-Source: AGHT+IEsTZF/aaIkd2W2yDE7XhrivBIrlJSlG4EYc08U5lemoAf3PC4tUJ7UZ+YVghk5SfORdtSUmhtioANUwm1uA24=
X-Received: by 2002:a2e:b2d0:0:b0:308:efdd:b184 with SMTP id
 38308e7fff4ca-30927a6fa08mr9447091fa.10.1739624226481; Sat, 15 Feb 2025
 04:57:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-rust-path-remap-v1-1-021c48188df1@weissschuh.net>
In-Reply-To: <20250210-rust-path-remap-v1-1-021c48188df1@weissschuh.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 15 Feb 2025 21:56:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNATOgb0Wry50Mjoa=o4FkzG-Jf-5FjbKsf3DCN7dybwMgw@mail.gmail.com>
X-Gm-Features: AWEUYZlqwTgp-wnBM-VhIxcv_BtmOE0JijNrv0Drs7vRsuia8wiRS1nsqb348YU
Message-ID: <CAK7LNATOgb0Wry50Mjoa=o4FkzG-Jf-5FjbKsf3DCN7dybwMgw@mail.gmail.com>
Subject: Re: [PATCH] kbuild, rust: use -fremap-path-prefix to make paths relative
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 2:11=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisss=
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
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>


I will apply this if Miguel gives Ack.




> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Makefile b/Makefile
> index 9e0d63d9d94b90672f91929e5e148e5a0c346cb6..ac35083180c825b72f13149ec=
3acfd7d6d74ef98 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1068,6 +1068,7 @@ endif
>  # change __FILE__ to the relative path to the source directory
>  ifdef building_out_of_srctree
>  KBUILD_CPPFLAGS +=3D $(call cc-option,-fmacro-prefix-map=3D$(srcroot)/=
=3D)
> +KBUILD_RUSTFLAGS +=3D $(call rustc-option,--remap-path-prefix=3D$(srcroo=
t)/=3D)
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

