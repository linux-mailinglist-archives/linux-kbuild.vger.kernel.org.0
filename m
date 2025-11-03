Return-Path: <linux-kbuild+bounces-9390-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFA8C2E5FA
	for <lists+linux-kbuild@lfdr.de>; Tue, 04 Nov 2025 00:06:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFD42189077B
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Nov 2025 23:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD5B2FD66D;
	Mon,  3 Nov 2025 23:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMiHZA1D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF0D2FC037
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Nov 2025 23:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762211159; cv=none; b=OKJ7FVz6Z/Tk+36W8dirVbOFgQ1Zb3SvYXFk2kkV+wuTdIWFXsbbwUf97a/vFJsa4EB4bUDJJPO4Rew0mscF6xa/kZdATx3+KcgVRHwh2ba5qJTs0h2rPg6RpBlwHS/OfQ7kI0m978QtsiRjkYJfGOQ4HCz2HhT3HRvxjrtmPLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762211159; c=relaxed/simple;
	bh=wpVJWBuenZcD3eSVXXuQBdHxyRZUm/ZGGvsoPgMAlCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LIvBl3KzkHB2QJ9U4SmhcT5ztzRHgKYcJ9OaR10F3IiGzl8+VGCGxQFK8at5b4dHr9PogiYS267Ho6X60YtMA7SadxIRJV3BMoV3Ms3aY35dT0QOcud6FRwm9bwvu28lHPvP4vC5yxv+RJO81XORHszP7c502N2CLiU0qIAdt48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMiHZA1D; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-28d18e933a9so4791045ad.3
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Nov 2025 15:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762211157; x=1762815957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogon7TK6sOugcfKJJppW+WnECgyNYUKvMApdomYEbKo=;
        b=CMiHZA1Dx3TONUc1uZHfqLTY7pYjVGhppzjfh99oqjSc5G6TRcS4jMtNzlwmIts3E3
         y8bFQ8QVMOTvVX/EpzNoQLJ3j64+hwAE4YusSzS3JcnVpcdu1UyJP3H4mRz60h7HjMCQ
         FR2fpLyws20tNwjfyEDwODyz0t9rhbE8W7Ws/cjVfAfYj3jIlwRwUw+S/yqhijCI6ZQ1
         7T233cgYC4xnP/sPKtzAmODvFl/bA+tWZnqOjLXrHHkYps3uQl9enlYMv78BNMvig5co
         iWg2ytYb/XHpX6IIc35vuYCyJOcq22owxU1WEBYOLGUL0nRDqvvHDgtoZ1+WevzBKGUC
         Q3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762211157; x=1762815957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogon7TK6sOugcfKJJppW+WnECgyNYUKvMApdomYEbKo=;
        b=BkKW2vezD0anozvDUq9IPSZjkeQkLX+MxNkLSfudvgsxu1VhwQb/Hdj/0zQZqrucBi
         jGsiyTsOp8wFklENB/xRHUwN2RKAgd3aV4coXQIkAPycIU1aZvbYo/LI0v714qFcp8Y0
         hGDTV0PIYCpTRkywwbPlTrzLzYiT3sjoJwN5UiYMZ0nRjVgueHlRPh6mgNt2SyRAYdEG
         Axzf+xwbMMeA6e5xbbJImvdqw6w8ClAEAyT73kcBlVHbWfiCq1/YY8hdcG5jzjATx3rz
         EYStS5VHBFnXPzSvfBze81AVL0OuoLk+GUSCxv1Lp5nouXRsxL+0uDkY91cbF6+p20ut
         yQLg==
X-Forwarded-Encrypted: i=1; AJvYcCX3fjMhq5UcRj5Nm419zYHvxWqXwDsakawyYENZKjqKMwwdMIQwI4mmTLSidJlTptDR5nbRYEP8+VWBDyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsWbybW8kyVvvWQU4fWKGdpvPsDPGiH976IOLvGf3IXuyKOWxB
	NdQqXpaoa24RuBscW6+aPZbEjlG5msd8J9BZxLFhgRO6Wuek3NdsdCy/3czs4l610tWn8UWZCnp
	hkbYIQHJLwRqEXi8HXmZJ9YI5pDo1m5I=
X-Gm-Gg: ASbGnct8z/ga4wTUNuCIyub7lANRmPRX/H9AvPyotmC9sf1Pn2+9nxoOCje76WjvOas
	J8naFB1mj26MHlAhBUDGJsSLxMk5DGQtLlUYvmMvI0zOPtNiWix1RQaIj3nYZM1xp0OEX+eMyh3
	QjCtbvhBZmQfUeXlxiaHnqEg/88tdpXKNpkWJscmz/d8yoSoEZicu2tDzGYqNATxHt+8S78f3kh
	5bkv+hWpTv6BNWe2XQu+E1MC2edXk2lJeb59z8GiE5RYWQDtv0OCo+uSNK1XrwP8ug9/7fFg1Iy
	ZZ3QmwMSChxU1aGgUTahtUM8YkT4ZYCWFk1qcV+2fwHLfS7O0LjhJnCtc6DQkF0kzaaRxsfMz82
	fgP/thGwxnXiP8g==
X-Google-Smtp-Source: AGHT+IHugv4iFaTOCN4EOCjTVF2FfjlZWUSHrrn/GBxoYhXzdeo7YpUX0U5SRp9TWEaFsHczNUaXZUgkuqVdFch+J/I=
X-Received: by 2002:a17:903:187:b0:290:ad79:c617 with SMTP id
 d9443c01a7336-2951a380699mr111057345ad.1.1762211157387; Mon, 03 Nov 2025
 15:05:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251102212853.1505384-1-ojeda@kernel.org>
In-Reply-To: <20251102212853.1505384-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 Nov 2025 00:05:45 +0100
X-Gm-Features: AWmQ_bkuLE73e6Hn0H_oMw4VNuro5lNa0qxJ-qywqWQaWYuKfzn120mRL3CMPr4
Message-ID: <CANiq72=0JJz5XDHGpiyQBd9AmPCr4veJ=2oJywyyqQB8iMxqvA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: kbuild: treat `build_error` and `rustdoc` as
 kernel objects
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 2, 2025 at 10:30=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Even if normally `build_error` isn't a kernel object, it should still
> be treated as such so that we pass the same flags. Similarly, `rustdoc`
> targets are never kernel objects, but we need to treat them as such.
>
> Otherwise, starting with Rust 1.91.0 (released 2025-10-30), `rustc`
> will complain about missing sanitizer flags since `-Zsanitizer` is a
> target modifier too [1]:
>
>     error: mixing `-Zsanitizer` will cause an ABI mismatch in crate `buil=
d_error`
>      --> rust/build_error.rs:3:1
>       |
>     3 | //! Build-time error.
>       | ^
>       |
>       =3D help: the `-Zsanitizer` flag modifies the ABI so Rust crates co=
mpiled with different values of this flag cannot be used together safely
>       =3D note: unset `-Zsanitizer` in this crate is incompatible with `-=
Zsanitizer=3Dkernel-address` in dependency `core`
>       =3D help: set `-Zsanitizer=3Dkernel-address` in this crate or unset=
 `-Zsanitizer` in `core`
>       =3D help: if you are sure this will not cause problems, you may use=
 `-Cunsafe-allow-abi-mismatch=3Dsanitizer` to silence this error
>
> Thus explicitly mark them as kernel objects.
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Link: https://github.com/rust-lang/rust/pull/138736 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied series to `rust-fixes` -- thanks everyone!

I will send another less urgent one for 1.92.0 (in beta now) that goes
on top of these here.

Cheers,
Miguel

