Return-Path: <linux-kbuild+bounces-3944-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8AB995196
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 16:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAAA528208B
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 14:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05B81E0DF1;
	Tue,  8 Oct 2024 14:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KhNtMd+9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DF61DFE00
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Oct 2024 14:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728397475; cv=none; b=lgG4uir0dOlHGHiwGuI3BCu26edLIziA5rkv64ebk9+w1qwdnhT0Ugf0Sxu3LMqbpKDWFQPJJkraL/UVhvpSpMCG5q0O9Mwmxz527oNSuIW0CMxfu6gpo19eJMpMpSglS9cFrhPQvxbDZ3oPkPg/9zl6/EYxuE9pourakhS1gQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728397475; c=relaxed/simple;
	bh=ie53Rqu0p0p5Q7qB7cRsGyaHkBLuhapsKf0BBTl/N2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WkCNFi0XDKMmCfsnI+45e22GGCjA7Jy97mHuEzGvTbs/o36baqd7OoOJlVKqvqJz0m0QzSJxdlX9C06tA/S/L/oI6lLoidUEsoI5YcGcLZwChq7vqKILrWPB08vMIfx1hjmrJzEbAyeIV6XUOAI7H7k5Ol+T7KlEO2y24WnQgWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KhNtMd+9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d372c1942so227355f8f.0
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Oct 2024 07:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728397471; x=1729002271; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iI48V9hbHM/hfCZ0F7BwPhazsI3Vlms6ZGs7WY+S/2s=;
        b=KhNtMd+9Yqh0tSHcc0yq5KFnrokoVtHlO6bH7/xDP3/N5h0gZ5Gjqn7FDmQOYnZQdm
         zmqGeP0nnfINcFNb44yTVcss4Cr3LCAnotrEYEoG+YjWpzXhNfnjLDAs/GKgh+SLbwD5
         nvh/ko2+MabdCylLp29D22iLMyuLVNjzHLBgR5Z/x0g10rx5jxK8nOUSOgzuXVD+6voy
         6HJE2tQ71tOk0jLqwoTQExI1qyQGJIeP5HVkFxJKqtZFLsorR8wMsrEzxd6HioThRWFk
         iOKNMKlgvHtlg4X9PAtyZWDoQeXwpfPHP2c1tKDhffcT/8KwGyGlfn08HFgG30awkTaj
         uZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728397471; x=1729002271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iI48V9hbHM/hfCZ0F7BwPhazsI3Vlms6ZGs7WY+S/2s=;
        b=VuSQQc8OSO5p7PwCUawbuEHUDKJT8Zm6jwHH2QqI8b34p8/sJ7Nv/qBkVfAWfYlbcp
         fwVNbLgo3a4vG9/vdVizCTOv85OaFWKfX6xWXbhDeSGfIT15wQgguJhabWWhlkcO+I1N
         KyWJLgm8+fC55hX9C++NgmNAwZaDyVUY7yWwNJhCrSTCnswq7zhnJifbQccgfeRVYBR6
         ed0TmYNFcG5CdQyrnZH7rZhCOaAZjBFDa9YniiAnsUHcWblI72ifkykGMz+RHtYEHR4o
         Tztw8elJRB3PWTmyFTiOPP5Ct5wH6iVfoyvXEZN/af3OGI6Qa8tFQyttWEY32dReA56f
         +qmw==
X-Forwarded-Encrypted: i=1; AJvYcCXoVLFp47snBj+hEVJDYWubOadUJhO6so42QldwH1CA2cz1bCmdUv1xavjRy/EtvjdKlH8EZrsS73IXwHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFPYhNygUFuQBQjU9Guqc3QlKFzi9j8qSGEcx1DVTijgkyqOGX
	sQU4KqELXxxauwoMc7FX3TIppL0SxvHBcwHE5s68x4JS9NmtfthClPJvwT5yZHqGVHAoMNeJjnk
	Gvc5G7S/p1CIgxtb4DDHBveHqd+Tnq7zZ3Tdl
X-Google-Smtp-Source: AGHT+IFqb8vzJcF3MljPcuDJmH7CI/WUdIuIbv0HGGdZgod4f5Iy4iGbgYewcH5OpIoFQ0Hz/dOI8gyf2RkTC2m7ljU=
X-Received: by 2002:a5d:40cc:0:b0:37c:cf84:4d9e with SMTP id
 ffacd0b85a97d-37d0e8df41cmr7926081f8f.38.1728397471099; Tue, 08 Oct 2024
 07:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rustc-option-bootstrap-v1-1-9eb06261d4f7@google.com>
In-Reply-To: <20241008-rustc-option-bootstrap-v1-1-9eb06261d4f7@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 8 Oct 2024 16:24:17 +0200
Message-ID: <CAH5fLgieyO79OnLbFik5awASQub0VDErZmbrcQECDr-e41_ohg@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: add RUSTC_BOOTSTRAP to rustc-option
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 3:49=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> When using unstable features with the Rust compiler, you must either use
> a nightly compiler release or set the RUSTC_BOOTSTRAP environment
> variable. Otherwise, the compiler will emit a compiler error. This
> environment variable is missing when rustc-option is executed, so add
> the environment variable.
>
> This change is necessary to avoid two kinds of problems:
>
> 1. When using rustc-option to test whether a -Z flag is available, the
>    check will always fail, even if the flag is available.
> 2. If KBUILD_RUSTFLAGS happens to contain any -Z flags from the
>    environment, even if unrelated to the flag being tested, then all
>    invocations of rustc-option everywhere will fail.
>
> I was not actually able to trigger the second kind of problem with the
> makefiles that exist today, but it seems like it could easily start
> being a problem due to complicated interactions between changes. It is
> better to fix this now so it doesn't surprise us later.
>
> I added the flag under try-run as this seemed like the easiest way to
> make sure that the fix applies to all variations of rustc-option,
> including new ones added in the future.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

It should be "export". Also, this doesn't seem to be sufficient at
all. Now I'm running into this error:

make[1]: Entering directory '/home/aliceryhl/lout'
warning: ignoring --out-dir flag due to -o flag

error[E0463]: can't find crate for `std`
  |
  =3D note: the `aarch64-unknown-none` target may not be installed
  =3D help: consider downloading the target with `rustup target add
aarch64-unknown-none`
  =3D help: consider building the standard library from source with
`cargo build -Zbuild-std`

error: aborting due to 1 previous error; 1 warning emitted

For more information about this error, try `rustc --explain E0463`.

I think this patch is going to need more work. Sorry for sending it prematu=
rely.

Alice

