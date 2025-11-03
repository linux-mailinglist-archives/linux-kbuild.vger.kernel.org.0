Return-Path: <linux-kbuild+bounces-9383-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79599C2D884
	for <lists+linux-kbuild@lfdr.de>; Mon, 03 Nov 2025 18:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8E001897F05
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Nov 2025 17:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96EA522541C;
	Mon,  3 Nov 2025 17:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="RL9oQ0iN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860BF21CFFA
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Nov 2025 17:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762192107; cv=none; b=UkESR5Dg3ISnYfyLXLrHb5KJHaRUzNx7ownYRmPUXei82PtojydP4+SOK1De/tYhoRggzbw2LOz6kXGtUKQc+JzFJenIEQkx+W7gcWY65Vsbyj8qw9JDHdklqUHWJiH3Pk4BqQ+BTpDADyOyJgOD4hDiPm71hRhDgahSDMr8EsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762192107; c=relaxed/simple;
	bh=DZohdGmwhvfS7Y62yh/IEXkOppV7V3lqoMgTejWulFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O86ne+NODa+ltJVKJ5dfeyXv9YSppBSOr5Z0D0SA74iXbIwDBugYn8i5htz2/SSGZdpx/op2DKDjawQvTF6hvpxTz14KjDtgiG8OZqxsI8v/VkCm8WnFZlEcdGheXRnL77oRiEkkTdbodUc2Qd+nwnihs2YI/iUh4OWAHFsEtOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtx.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=RL9oQ0iN; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-43323420387so6052475ab.2
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Nov 2025 09:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1762192103; x=1762796903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWkOe5YDiqYERha5LD7zMqeSoJ/N7fJr/JJ2cnjXNyg=;
        b=RL9oQ0iNkWnjynRpoeRSTn/PDDB+2Z2SiA/hlgrKBN0orRhtuTcBlBjncpxg9IS1wV
         wvl/0yvVKcIv+A4y7w0YmC3eGL33jnmkBFjBRnq4DT9h4KVAZ8GT0pV9xJEC6ZtsuqVc
         yHhU01Qmml7krU4BMRvzmvvDsmdQXOzWVVt/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762192103; x=1762796903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nWkOe5YDiqYERha5LD7zMqeSoJ/N7fJr/JJ2cnjXNyg=;
        b=VjsQ4CG4/E+jL7DTA86x1hdFtSI+hT2yxRVL6LkoZMJQtuMPNFZCnw7w+6WvVdb2LJ
         SZ+imj5DvPjhqkMfRgW5HR1i4agGqCDI85V9nv3APX0nM9mUmK3Hr1XGKR1lH3vZCfYu
         AAfMN2KepAJLOCtREgoTec0N7kDqpMybpfm71MoLzmdIVpbkv5dscXt4/4h73/G/1jQT
         aSwus33/H5TdFJA1EcW9wt9c4zEy9pfyTblAoF60Xr0tTYCDBZ1ORZzUCSmeEQMoQ5Se
         h3L3W4s9McHsvIQBUJSTlXcABkFENLjpTERsglqhGnOfZkIaqsyPIr5451U1AkcvWX/Y
         ytvg==
X-Forwarded-Encrypted: i=1; AJvYcCWPTqrg5y2hF2J6HGIj7umLxWB2+HdwO4nuLajVJGnJZNUCdyngJFFZFJhe4Lf3ZQbY6AwmtXakyzy1iak=@vger.kernel.org
X-Gm-Message-State: AOJu0YymsnJRtgNrJpl8C6OS91600J3kHp2N3206biA7dq6aBC07ELdE
	13kS+m2R5lVH9OtLw4DcKUXYzp4oCBqo4tHov8Em9o26hEm2NhLj/tM+A3lym3OYqqYHhw8OkZ0
	aZCGz7cOcgtKrwBXyX4ujoSl9qCpMvWckQCg/5CoF
X-Gm-Gg: ASbGncubX6FB1J6ad4VGOFpunBLXzmhIUTYAK1fOm/O7ccoy46aupE7K46BXx3B8gWJ
	B6H5+9FnEJ9IyqfMTUgYJ5pyaarvC3S8g+x/Lecme57ZrYwr+1NSLSyeXlquZuEpjsFkCzBa/GX
	EXeBAhFUhgMnZSG8JS/hENZYWF0j8re4o1RFgLX+KND5qqy5PTqRyJd3cmy3tFLeYzEBiM46eJS
	SaeBVZmuxrlZ9NdUWdAtnOiYwynRxb5YW+zRe2LVsH9O8MQDA4HoKRiKMMPNQ==
X-Google-Smtp-Source: AGHT+IF9g9cwwuNwEQElfAQDhH0pHEpQX+9ymSaDZSx7wt1xXs7tDoLgwlfGaAsR869GJ5w28gauCBpymwrx1MG7HaA=
X-Received: by 2002:a05:6e02:470e:b0:433:22fc:bb9a with SMTP id
 e9e14a558f8ab-43322fcc5d4mr112236115ab.13.1762192102332; Mon, 03 Nov 2025
 09:48:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251102212853.1505384-1-ojeda@kernel.org> <20251102212853.1505384-2-ojeda@kernel.org>
 <aQiDdZvRNrBkrB-U@google.com>
In-Reply-To: <aQiDdZvRNrBkrB-U@google.com>
From: Justin Forbes <jmforbes@linuxtx.org>
Date: Mon, 3 Nov 2025 10:48:11 -0700
X-Gm-Features: AWmQ_blfBw9zTFrICe8pc1ZBkE8gZV528mb4K6Tu6zlEDetF0EtgCfFYO7hVTdg
Message-ID: <CAFxkdArACiepmcjk7GFH313db4cpXDcWouVy4a6zQTMR1aDmPA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kbuild: workaround `rustdoc` doctests modifier bug
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 3, 2025 at 3:28=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> On Sun, Nov 02, 2025 at 10:28:53PM +0100, Miguel Ojeda wrote:
> > The `rustdoc` modifiers bug [1] was fixed in Rust 1.90.0 [2], for which
> > we added a workaround in commit abbf9a449441 ("rust: workaround `rustdo=
c`
> > target modifiers bug").
> >
> > However, `rustdoc`'s doctest generation still has a similar issue [3],
> > being fixed at [4], which does not affect us because we apply the
> > workaround to both, and now, starting with Rust 1.91.0 (released
> > 2025-10-30), `-Zsanitizer` is a target modifier too [5], which means we
> > fail with:
> >
> >       RUSTDOC TK rust/kernel/lib.rs
> >     error: mixing `-Zsanitizer` will cause an ABI mismatch in crate `ke=
rnel`
> >      --> rust/kernel/lib.rs:3:1
> >       |
> >     3 | //! The `kernel` crate.
> >       | ^
> >       |
> >       =3D help: the `-Zsanitizer` flag modifies the ABI so Rust crates =
compiled with different values of this flag cannot be used together safely
> >       =3D note: unset `-Zsanitizer` in this crate is incompatible with =
`-Zsanitizer=3Dkernel-address` in dependency `core`
> >       =3D help: set `-Zsanitizer=3Dkernel-address` in this crate or uns=
et `-Zsanitizer` in `core`
> >       =3D help: if you are sure this will not cause problems, you may u=
se `-Cunsafe-allow-abi-mismatch=3Dsanitizer` to silence this error
> >
> > A simple way around is to add the sanitizer to the list in the existing
> > workaround (especially if we had not started to pass the sanitizer
> > flags in the previous commit, since in that case that would not be
> > necessary). However, that still applies the workaround in more cases
> > than necessary.
> >
> > Instead, only modify the doctests flags to ignore the check for
> > sanitizers, so that it is more local (and thus the compiler keeps check=
ing
> > it for us in the normal `rustdoc` calls). Since the previous commit
> > already treated the `rustdoc` calls as kernel objects, this should allo=
w
> > us in the future to easily remove this workaround when the time comes.
> >
> > By the way, the `-Cunsafe-allow-abi-mismatch` flag overwrites previous
> > ones rather than appending, so it needs to be all done in the same flag=
.
> > Moreover, unknown modifiers are rejected, and thus we have to gate base=
d
> > on the version too.
>
> Ah .. we may want to file a bug for that.
>
> > Finally, `-Zsanitizer-cfi-normalize-integers` is not affected, so it is
> > not needed in the workaround.
> >
> > Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned=
 in older LTSs).
> > Link: https://github.com/rust-lang/rust/issues/144521 [1]
> > Link: https://github.com/rust-lang/rust/pull/144523 [2]
> > Link: https://github.com/rust-lang/rust/issues/146465 [3]
> > Link: https://github.com/rust-lang/rust/pull/148068 [4]
> > Link: https://github.com/rust-lang/rust/pull/138736 [5]
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

I can verify that this fixes kernel builds with rust 1.91 in Fedora.

Tested-by: Justin M. Forbes <jforbes@fedoraproject.org>

