Return-Path: <linux-kbuild+bounces-1155-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAFE870B33
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 21:10:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C658B220C8
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 20:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FCC7A715;
	Mon,  4 Mar 2024 20:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PYxUFNrp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156D279DD2
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 20:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709583026; cv=none; b=Ct3MUCGhwqAYh/cVhDc3L1Flhdq4ao3ffc+Cf758kyq3FypDXcuEhx1Uf49zLNCEoD+Zc4neoaWVYBCUVeyqNb0dZ/45LBHTzpEMtepYPJFoGU89RBCH+60ncQX5xUvpHPiupotc64VP0svBP6Wi9rz+OCHPUEI8vrLVeOcqqAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709583026; c=relaxed/simple;
	bh=kdQKu3RoxSzAKnls9h9y9cqdioEJoGugPDVhLaSIEWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JezISOJcXCaCEZy8gn37OaQDvEHD+ELaifPPLI+o6V0Wmx97NH1mdv4tzuhQf7KZbDYurg+XwYAJGJT9TORpVgaXURgVrjlch0/0lien7zQj6XHNGpVWD7CSAuZEtbtjnhtlsseDQIwBlIHZGGIhlTr5tkpRqJybsKSrj4rddNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PYxUFNrp; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7da6e831958so1436661241.0
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Mar 2024 12:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709583023; x=1710187823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdQKu3RoxSzAKnls9h9y9cqdioEJoGugPDVhLaSIEWc=;
        b=PYxUFNrpyCeymfEAxMBzc4agC+5XiwQCCZYnTUkmQFqdDahVVc4vUxnB8DcSKoY5bq
         4geU2Yr0BX0rURJWivnGOQoqRhyW6uAx3mytZBhDA2uS2Y1aBhIIORC1Lxo2MyTPc3mW
         QDdVn9UAphU/f0pxlRUIbEta03BZACtTBHAWlxr49iK08KKJzU6pGykqeyQyMDHMTHT6
         WEiHYJ0tGKHKYpw/OdPnQbHiBE/d/pCpf4q3hgJIbRPh/oyzKiBfPHK259AFDxVZca3n
         Io6XR8wxU2YWx/V9XapFB9/uHQNugXXctpB9N57qtQTBuNunb1yenSV/ZNTcGkQf+LkU
         +U8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709583023; x=1710187823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kdQKu3RoxSzAKnls9h9y9cqdioEJoGugPDVhLaSIEWc=;
        b=vT7v0bKji2il+aZX0sv9YPW26SnKWdXSfODrlZUKYDiv8wvB0JSE6OYd+73zofmego
         Db4qwKDISR1SrwEYv7ZGexifa8390+eKY9jQE9QoUN4XVWONTMPxdh8Bi08tZx2Pr2AH
         ik8b/1NIvNXgx/Y2WaY8qoKgTY57T9IeDnAwsfp7QuAIYBEZSjMoVl90DWWxOPc0Q/CQ
         CS8bDogPl0D7IZPPkzmZ/xZwwOYRfgMoJnb2iZTq1nnUEAC4IzOayk0g+N7xakL20L1O
         OvnovGMo/Jrei4Tfq9hA3FdABeudcU1bydDb2z60swg+qmKu4EV3MDqKN1M/95Rhpcxf
         ioLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoKjnVH3FPF7toh4R57UUK3WwVWeSrFRi3SHf1gtdzXCLRYXqg5HLXEOVYXvQtJLwAltxezML2Dwykvw2In6U0LvlAfzMxhv03F00I
X-Gm-Message-State: AOJu0YwUOEHYiBgWhMZqsElez2Yc5MXplFDcaDLb9IAtU/m4oadwivV4
	VNy6HyY3NmhxRIaWXedB21LhBpuQRkh/Mqg2RGm7rISveHhpnHEr7AlyOM5WIJBw+JrxcESFWUs
	lw1RAnr62Imti39vlKbl3zm/MkkoUTdaUBRuYGM2Fj4Ep6c3LdEqQ
X-Google-Smtp-Source: AGHT+IEVa0EzaUVXzcVxUqw7hDykrrvfsa29Bpt49sVGOlnxc+uITAdGh6g6OsI7IoCnd6Z9sxW1oBlNNGF5IRZ3iR4=
X-Received: by 2002:a05:6102:3a66:b0:470:c99d:6776 with SMTP id
 bf6-20020a0561023a6600b00470c99d6776mr7873661vsb.13.1709583022912; Mon, 04
 Mar 2024 12:10:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240304-shadow-call-stack-v1-1-f055eaf40a2c@google.com>
In-Reply-To: <20240304-shadow-call-stack-v1-1-f055eaf40a2c@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 4 Mar 2024 12:09:44 -0800
Message-ID: <CABCJKuem3GbLO-G7+wi8LPA8rFgNzFVjNof7zcAO1UGJR4u44Q@mail.gmail.com>
Subject: Re: [PATCH] rust: add flags for shadow call stack sanitizer
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Ard Biesheuvel <ardb@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2024 at 5:17=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> Add flags to support the shadow call stack sanitizer, both in the
> dynamic and non-dynamic modes.
>
> Right now, the compiler will emit the warning "unknown feature specified
> for `-Ctarget-feature`: `reserve-x18`". However, the compiler still
> passes it to the codegen backend, so the flag will work just fine. Once
> rustc starts recognizing the flag (or provides another way to enable the
> feature), it will stop emitting this warning. See [1] for the relevant
> issue.
>
> Currently, the compiler thinks that the aarch64-unknown-none target
> doesn't support -Zsanitizer=3Dshadow-call-stack, so the build will fail i=
f
> you enable shadow call stack in non-dynamic mode. However, I still think
> it is reasonable to add the flag now, as it will at least fail the build
> when using an invalid configuration, until the Rust compiler is fixed to
> list -Zsanitizer=3Dshadow-call-stack as supported for the target. See [2]
> for the feature request to add this.
>
> I have tested this change with Rust Binder on an Android device using
> CONFIG_DYNAMIC_SCS. Without the -Ctarget-feature=3D+reserve-x18 flag, the
> phone crashes immediately on boot, and with the flag, the phone appears
> to work normally.
>
> Link: https://github.com/rust-lang/rust/issues/121970 [1]
> Link: https://github.com/rust-lang/rust/issues/121972 [2]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> It's not 100% clear to me whether this patch is enough for full SCS
> support in Rust. If there is some issue where this makes things compile
> and work without actually applying SCS to the Rust code, please let me
> know. Is there some way to verify that it is actually working?

Perhaps you could write a Rust version of the CFI_BACKWARD test in LKDTM?

Alternatively, the simplest way to verify this is to look at the
disassembly and verify that shadow stack instructions are emitted to
Rust functions too. In case of dynamic SCS, you might need to dump
function memory in a debugger to verify that PAC instructions were
patched correctly. If they're not, the code will just quietly continue
working without using shadow stacks.

> This patch raises the question of whether we should change the Rust
> aarch64 support to use a custom target.json specification. If we do
> that, then we can fix both the warning for dynamic SCS and the
> build-failure for non-dynamic SCS without waiting for a new version of
> rustc with the mentioned issues fixed.

Sure, having a custom target description for the kernel might be
useful for other purposes too. In the meantime:

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

