Return-Path: <linux-kbuild+bounces-4657-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB7C9C56D5
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2024 12:43:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46F49283695
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2024 11:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C332309A9;
	Tue, 12 Nov 2024 11:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxdfcXMT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81E7230998;
	Tue, 12 Nov 2024 11:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731411789; cv=none; b=RlEPEIHGzgncu0/8065j/+bhBWwbFAE4zwM7DTwoVorwpHkRi1UhPi5xSMXMffv4sHjVG8eWFdhktn8XiFv9bNggBEgz6AL/TX/zy61lRHCROXmWu58nJ2L9cVo74p5VZA3ebwMUvHgWCHRhhn9RO2R4z4r7q+2r2d/Nq2D9I6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731411789; c=relaxed/simple;
	bh=ywmrmwU61cquYWqHb3soWy5KtfML++9SbcjwKY7ZNaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzBMPidEcp5xrNAYUFZvCCZ6nuWkavyqpWDgXxlhOwoI/FZgFNxpEdHb9t2TdEkZYQIZGp7rG7tzDK+69p3+3yyMFVsjVkGRpj2Q0ESte5PqRaMQtba2pLih9O4u3j5IMxeyQG+xtV1HodvdQcEeWP34kg+E1PDLpx+Mwh4gGYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxdfcXMT; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e2a96b242cso66009a91.3;
        Tue, 12 Nov 2024 03:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731411787; x=1732016587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0z23DhUHW7wNW00l4MV+YrP9iRE6XDYN76aiQ5G0Vc=;
        b=bxdfcXMTMML0HDa+Fl3n1UlOKn2FOyA2a5ecccu2xTbhPPKR/zxPuxLwb15Imix97k
         iRms+RY/Z4s/sCg9oCCHvfaqXNeoVcvhQArgXxfKoJ9HUWD720Tr2c1fsz0brli4szqQ
         ZqqupYXHCDjpqI1GjFttUD3Nl7JXzD/ZyUUwA4WrxcSHuKos7aRsc7TDlUT5TdlFVn6z
         Sp+5jiFI3BJ7JWvC9tDtKolxbkSo5KgTrC7Q2mMYFO37BLskW+IykNV+jOUmNUGPGh1R
         W/BMKVIpGBqADdGa+NxBpolWri0k+si5H1/AXS7H969MoFHrZ1ycNa9E9yiWqXshX6c/
         d3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731411787; x=1732016587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0z23DhUHW7wNW00l4MV+YrP9iRE6XDYN76aiQ5G0Vc=;
        b=QBzFogRaJGHtAHhJiVK1fIWGA3YnWlGKzHay1BAeTSNgU7zPuZEZXTdB5qvWhCDdXj
         qzgTFn0LsDAX0t/wioMzkHvO+hlHfoFMMpTGsCiiPB5uWQFmaizM47cQQ4BOYbEHUUdx
         aQB8aEYTaQCxI5H0KmSXMBELqqKFTexYZhnh9L7s0pRWd44Edq/nHwfetTpvfORZr4OS
         u+eibAdUOsULpo0W6foyQ5DqoItpE4GJcd9oj1DvC1oeEEL5grvzEH0gFStdAO7HQ3Jv
         T4LOm9/ZVhtcybrb5s2LXwtQHcvOei0aAxcKSDqULFcL+xjz+D6M/rWj6AJPzdV5VLPg
         Sx1g==
X-Forwarded-Encrypted: i=1; AJvYcCUIlZ3+ud+unARJlxZWUMG87WCzLzA5PCuG0tYtj5lJAg+2oKKC43N5/Y/Jzoi3+e4vuh41iYtBWuKuGHkejCQ=@vger.kernel.org, AJvYcCVLRn8qxdkf6hqUGc+Jf/HXtmxVNEDoD9wXuiAjr9Q/q6ad1NulQNkg9LElGuSMuwSRnsOS0jN8MTJ1ms0=@vger.kernel.org, AJvYcCWhgWjBbiQmmhqXD2roEyWTerr5KOK2tkTxvUfT0ZEqA9VlaneeFlLhs7/iz+GxrDKjaZikWRaJ0dp9WNxR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Ix8NhwQCD+wXipMgACiyCjz9Am2IYP4xV0GkGbMnri2rB+t6
	jOHhKkQhuEG01KGgDAE1Ln1lvPQ9vdsetImVzQYlYJ6uCExhDejgsk6bKUP4ZZ2lv9WDjsjTuUI
	v/CP/JwUzR+7n9VBE1kLdEacoiRk=
X-Google-Smtp-Source: AGHT+IGggizb3kL12ZjnHA+9BEc8hjb63HpYjen5xTTmWs+MKPFBZ8CYn9vyQuK8cPPVTowrwyuTF+2y5HhglUBEUAA=
X-Received: by 2002:a17:90b:3ec5:b0:2e2:ada8:2984 with SMTP id
 98e67ed59e1d1-2e9b174818dmr8920433a91.4.1731411787013; Tue, 12 Nov 2024
 03:43:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241111201607.653149-1-ojeda@kernel.org>
In-Reply-To: <20241111201607.653149-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 12 Nov 2024 12:42:55 +0100
Message-ID: <CANiq72mUu9V0tAFRYju5=B9-EZ9hbPVMabKJvHm67n7BgSVQXw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: warn on bindgen < 0.69.5 and libclang >= 19.1
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Ben Beasley <code@musicinmybrain.net>, 
	NoisyCoil <noisycoil@tutanota.com>, Matthias Geiger <werdahias@riseup.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 9:16=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> When testing a `clang` upgrade with Rust Binder, Alice encountered [1] a
> build failure caused by `bindgen` not translating some symbols related to
> tracepoints. This was caused by commit 2e770edd8ce1 ("[libclang] Compute
> the right spelling location") changing the behavior of a function exposed
> by `libclang`. `bindgen` fixed the regression in commit 600f63895f73
> ("Use clang_getFileLocation instead of clang_getSpellingLocation").
>
> However, the regression fix is only available in `bindgen` versions
> 0.69.5 or later (it was backported for 0.69.x). This means that when
> older bindgen versions are used with new versions of `libclang`, `bindgen=
`
> may do the wrong thing, which could lead to a build failure.
>
> Alice encountered the bug with some header files related to tracepoints,
> but it could also cause build failures in other circumstances. Thus,
> always emit a warning when using an old `bindgen` with a new `libclang`
> so that other people do not have to spend time chasing down the same
> bug.
>
> However, testing just the version is inconvenient, since distributions
> do patch their packages without changing the version, so I reduced the
> issue into the following piece of code that can trigger the issue:
>
>     #define F(x) int x##x
>     F(foo);
>
> In particular, an unpatched `bindgen` will ignore the macro expansion
> and thus not provide a declaration for the exported `int`.
>
> Thus add a build test to `rust_is_available.sh` using the code above
> (that is only triggered if the versions appear to be affected), following
> what we did for the 0.66.x issue.
>
> Moreover, I checked the status in the major distributions we have
> instructions for:
>
>   - Fedora 41 was affected but is now OK, since it now ships `bindgen`
>     0.69.5.
>
>     Thanks Ben for the quick reply on the updates that were ongoing.
>
>     Fedora 40 and earlier are OK (older `libclang`, and they also now
>     carry `bindgen` 0.69.5).
>
>   - Debian Sid was affected but is now OK, since they now ship a patched
>     `bindgen` binary (0.66.1-7+b3). The issue was reported to Debian by
>     email and then as a bug report [2].
>
>     Thanks NoisyCoil and Matthias for the quick replies. NoisyCoil handle=
d
>     the needed updates. Debian may upgrade to `bindgen` 0.70.x, too.
>
>     Debian Testing is OK (older `libclang` so far).
>
>   - Ubuntu non-LTS (oracular) is affected. The issue was reported to Ubun=
tu
>     by email and then as a bug report [3].
>
>     Ubuntu LTS is not affected (older `libclang` so far).
>
>   - Arch Linux, Gentoo Linux and openSUSE should be OK (newer `bindgen` i=
s
>     provided). Nix as well (older `libclang` so far).
>
> This issue was also added to our "live list" that tracks issues around
> distributions [4].
>
> Cc: Ben Beasley <code@musicinmybrain.net>
> Cc: NoisyCoil <noisycoil@tutanota.com>
> Cc: Matthias Geiger <werdahias@riseup.net>
> Link: https://lore.kernel.org/rust-for-linux/20241030-bindgen-libclang-wa=
rn-v1-1-3a7ba9fedcfe@google.com/ [1]
> Link: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1086510 [2]
> Link: https://bugs.launchpad.net/ubuntu/+source/rust-bindgen-cli/+bug/208=
6639 [3]
> Link: https://github.com/Rust-for-Linux/linux/issues/1127 [4]
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> We would like to put this into the merge window, or ideally very soon aft=
er as a
> "fix" (it is not really a fix, but it is very convenient for people wonde=
ring
> why their toolchain may not work, especially if tracepoints land in the m=
erge
> window as expected).
>
> v2 (based on Alice's v1):
>   - Fixed libclang version number (we use a different `get_canonical_vers=
ion`
>     that returns one more digit).
>   - Added build test -- now we can detect binaries like Debian's that are
>     patched but do not change the version number.
>   - Added tests.
>   - Explained the current status of the distributions in the commit messa=
ge.

Cc'ing Kbuild too, so that they are aware, just in case -- sorry, I
should have done that in the patch itself yesterday:

    https://lore.kernel.org/rust-for-linux/20241111201607.653149-1-ojeda@ke=
rnel.org/

Cheers,
Miguel

