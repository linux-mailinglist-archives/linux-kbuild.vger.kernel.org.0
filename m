Return-Path: <linux-kbuild+bounces-2975-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDB79519D8
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 13:27:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B09961C20DE3
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 11:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1871AE87C;
	Wed, 14 Aug 2024 11:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVKKvBc+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70221AE878;
	Wed, 14 Aug 2024 11:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723634854; cv=none; b=Do1/skG205JyLcPl7X8H9k2ZJ0yUYFRtBNifhD78HhOnXOp8vHfc1/HZNcbNjJIlkkjob2ITQ8vRB0AS5WjZLv+0a/wSZZDlMB+Okzdr6f27gkw3L7tr+acZ2UDlYG8ypXquJBN8QvU4bC6jVGMWSrfDQdbDbF0Rv3IS53eJ4OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723634854; c=relaxed/simple;
	bh=WhU+e2jgq65ehnrJrXCUVJzjobCEAHClPzzdVgzZ17Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQiFhWvAQ9QUqr/lgVmOK+Rt6Y3gQcfdRAK3V7m0Jwszd6nIWmxm7v8+hyUkhKvkJrjAILApBaEM09YUa3uT19nkbV/MrWKcPLzQHlfA5m1lqae9cf1eLJF59C8zkzZgUWqdYHSwsP5V54IVZDnr8s8+rjittgGIh6B4MqWfGQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVKKvBc+; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2cf213128a1so4388503a91.2;
        Wed, 14 Aug 2024 04:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723634852; x=1724239652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhU+e2jgq65ehnrJrXCUVJzjobCEAHClPzzdVgzZ17Y=;
        b=UVKKvBc+uf6JL3LR/x/iPT18ImoK+QVFtHMBIfoJZWUrR6/fxsVKQvCn8kongne0hp
         nnb65BYAsO2bjk2GBMtJO172rmRwZGe60m6vvfVnw77jSN0kq160ppkcJwOOebzDSW9L
         onj+fhQ5bWRMTFILRoBtQmJ8Fw5f3OD0HCLJWtkDJZttIcpXwOszkSNB0C0nISc4oluZ
         Fdkosf7Gg0QZXF6/p2g1jbdiwRxBZOM9MadGEYJb4mvMFHrgMNif0wSTSnu2vh/+UVxJ
         RnOmCY8b8qzpCoGeNe/xV+bJXoO2k8YYEEfsYSYl43qD1POTfoiopY+m9biCySPxzGKj
         MA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723634852; x=1724239652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhU+e2jgq65ehnrJrXCUVJzjobCEAHClPzzdVgzZ17Y=;
        b=ItNKZlL0PKllrJnYeNy27d46mkYl6diqs+u9cXVokUZ8zD69C/MWleWXRBFvYhetm5
         TonTW3pGchACbHAW0TX4x0A7+UMpH/qOZHJbudUnguCmX4x+HH0IKMHLQYD64kroPLaZ
         QhzxwHVTLnDD45LAYOIA19N5XL6rFb6afW3hubJB6OLDW/rFB0L5Us4Nhevp9LSyMRXE
         oj1heCLKBT4A+MIVtAZjahIq+RnQ25PRV9RkIiFFIlZggflyKEs0TZeK1U57MHR8RKul
         7mo+PAuxJAQhJfr0x+aSOrUxHic5Fscr+a6BF1aHDfGoRphWpxRLDjKMtzMGRCbkCwzq
         PyQg==
X-Forwarded-Encrypted: i=1; AJvYcCW4n9gPZG0srIhLx1Elk1S31P+A6kf+TC9MxiTCtFUzcdp7cK0DzDhbHzb1tY5t+MRn8TnBwPRFEUDjaTAPOKjTKjGMdkinME7mE68phrUH1acaWCwFtPHH4Ys22HwNDxUWBL8I5cJFe2BhfkOFs1d1zc8Eo5fuj5PbiTCNfbVhMV2kvsBh/TC5T7c=
X-Gm-Message-State: AOJu0YxfTUcPEEZfP8GvYh4qFQJndW7dLy+T2ndWxtfswVe8PxC3v/NG
	gREveFf2ginBWuKS0OlsjZ+vuKMt8+I8dlpL8AtXT6fH/9MH+tepJNOmeh2FWIINNL81Tn8zWUx
	rCteJB4GyeI9DlyMdA/fbKhTDVbA=
X-Google-Smtp-Source: AGHT+IELKdSoSWG2UnYMmakzdFiUo5k7VT5bKKAkwEl/PovcViSJbpFA/Q4ffrafWGIOvcGXFiTjP48gn1Htq58EQOQ=
X-Received: by 2002:a17:90b:1949:b0:2c9:9ad5:7ca2 with SMTP id
 98e67ed59e1d1-2d3aaa8d177mr2841773a91.13.1723634851943; Wed, 14 Aug 2024
 04:27:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812232910.2026387-1-mmaurer@google.com> <20240812232910.2026387-2-mmaurer@google.com>
In-Reply-To: <20240812232910.2026387-2-mmaurer@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Aug 2024 13:27:19 +0200
Message-ID: <CANiq72khUrha-a+59KYZgc63w-3P9=Dp_fs=+sgmV_A17q+PTA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] kbuild: rust: Define probing macros for rustc
To: Matthew Maurer <mmaurer@google.com>
Cc: dvyukov@google.com, ojeda@kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, aliceryhl@google.com, 
	samitolvanen@google.com, Nicolas Schier <nicolas@fjasle.eu>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 1:29=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> 1. `rustc` support will soon be a minimum rather than a pinned version.

In the meantime, this happened, so we should update this sentence.

> 2. We already support multiple LLVMs linked into `rustc`, and these are

I guess you mean `rustc` is able to use multiple major versions of
LLVM -- or what do you mean by "multiple LLVMs linked"?

> +# $(rustc-option,<flag>)
> +# Return y if the Rust compiler supports <flag>, n otherwise
> +# Calls to this should be guarded so that they are not evaluated if
> +# CONFIG_HAVE_RUST is not set.

Hmm... why `HAVE_RUST`? Should that be `RUST_IS_AVAILABLE`? Or what is
the intention? Perhaps a comment would help here -- e.g. something
like the comment I used in the original approach [1]. Otherwise we
will forget... :)

Also, I guess you wanted to relax the precondition as much as
possible, which is great, just to double check, do we expect a case
outside `RUST=3Dy`?

> rustc-option =3D $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(R=
USTC) $(1) --crate-type=3Drlib /dev/null -o .tmp_$$/tmp.rlib)

I also had `out-dir` [1] since, if I remember correctly, `rustc` may
create temporary files in a potentially read-only location even in
this case.

Also, should we do `-Dwarnings` here?

> +# If you are testing for unstable features, consider `rustc-min-version`
> +# instead, as features may have different completeness while available.

`rustc-min-version` is not mainline yet -- we don't have a user yet,
but I can send it if so.

Thanks!

[1] https://github.com/Rust-for-Linux/linux/pull/1087#issuecomment-22184453=
03

Cheers,
Miguel

