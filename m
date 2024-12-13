Return-Path: <linux-kbuild+bounces-5129-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3AF9F1367
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 18:14:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AC78284220
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 17:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1531E4113;
	Fri, 13 Dec 2024 17:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ke3tSXs9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1791E377E;
	Fri, 13 Dec 2024 17:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734110093; cv=none; b=ZmN+dDHwdWEYi52pP0ad6GPaT4W8JRZ2+DeogHcoNDW5gzKfcGrmqiWESPnOfGQCDMvUVX2vZuG+AkFb73e3JWaeqGOhXltCebaDg4HctmqzmprnwiVVjrdtSO8Uqpgqquj80KQ5fuuVmLkQkwLj1wnyRPpWGP8o0ZOIGnr7o7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734110093; c=relaxed/simple;
	bh=DXa4W9GxaEmCk7xdM+h/enoKF//SqpkgmoFmdNO6ZRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J5P0dpMESg0YyVw/joAsKldSz7GUoujlzj4DI7Aixvq7xVA8AZAgwSIidmBGcPGx9/vryRmXp7aWwRvDvfGncNAsu1TYWHX1K4IOXpVFfeunLy+1wKIv0q6Hku2UnA5O4BtFu84N7xmZX9wJxIkrSWqqVbZbsiAinpsTCSLD6so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ke3tSXs9; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ef718cb473so241271a91.1;
        Fri, 13 Dec 2024 09:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734110091; x=1734714891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXa4W9GxaEmCk7xdM+h/enoKF//SqpkgmoFmdNO6ZRE=;
        b=Ke3tSXs9JKV1UZe9zGVWUcEYPq+iNGqBaTFhCqQ/44CKn5D6sEFgrO0CR8PTyDFa5k
         5xKwYtZTQBwiXpn1gfbbHwwGiO+35gGRQhXbTEbJHGdnvZv34KIlLAGjwjh8E/pzsWh+
         SNA/3g0AflX0k62pS1Bpy0nhaquw/4t6a2nhwY/BnegzrMh+MkbOSg/5HcgijaS92+3A
         mnWZHmchZg6PO9k+HjEJ1XxcJwsbCDA89qBRDQ8mnpsGmiyez/2AV3l6DHLpWrVMxF1L
         9YNRRmlKHYtsGMw088y4pMemz7SLT4oarOqJhYPHUS/84GOq8ZcxFawHByoF2R4lR2Mz
         jH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734110091; x=1734714891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXa4W9GxaEmCk7xdM+h/enoKF//SqpkgmoFmdNO6ZRE=;
        b=HGnMC7ESZTKCkjILkPfpagvmWE1j8g00YM6pqrn5fWNKShMqRBFAaBmNoE/VFZpwEt
         aILjuWNuhCtx3ANo26oY0NbLZ0kz9OUMikyroNryDB1ojDIqFDTXVNCq9PP3s/o1VJ6D
         0DSlEZbuXOhG8cG+gKsxmqbFO7yHnUF8AyYYjdU/xJlxdA9JM1zK93WNjFDWezRMT0qk
         kIFtY4wtJiBC9z8lwrI5tx9BKKfLdVbvPyvbJCJApEwKThLEWFoHjn/vDaT/9+bcW5pH
         fDhYEgEApgx3cI75MaXRwjmuX5hKif9rR1mSBOmW04Us1T3NaXLyURmXOaYewXehyEPp
         7b4g==
X-Forwarded-Encrypted: i=1; AJvYcCUfw5ka7kfXZGxAPdfaPO0Uk36xea6H3GrT9g/tFZhlMw/D4OiMOOcwt3v2Aa3XDT/NQ7ROqFUrvVdyS44=@vger.kernel.org, AJvYcCXSZB3o5dXb6/j4sx1ydSBdMj4S2BQ7KsH6uTM+vekfHtrB83s9xs0YXxUXScjWxv7sHHV2bjfcohwhLcLe@vger.kernel.org, AJvYcCXU1utJuluH5gRXt8lPJjfOxrQWplHjgZ2qXC3+1JyBnsWfLTjivSb0ZO/9uEKQ1GvXOX40LbJ4HG7dC/UrJL0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbbKfgr8dfxioK2G2Nl4MBznRKuH0Q0uiP/O/iTRSHIQkrRCAX
	wTur8Hz7z8w5qCCkqUrjE2tTlesnyFI+WMGoQrsmg0rAFJJFaDWVvpHjuSuiB6KcpHX0UHq3xz9
	uMvmEi14D4V4roPmt7NtH+Qn4Urcy4Tx1bCg=
X-Gm-Gg: ASbGncuQqDWYddsb6AGKaCRm7UK9zw4XtIpdB3Jvdx29ZDk2sZvqEsqOADVS/CqcygA
	1LYCc/nU3WOIM9N7v8JZ8EtT7lXUqmh1c2wxk6g==
X-Google-Smtp-Source: AGHT+IGuMlGMaI28Ia3NfUCgqkkdjulyORLsN43AgubKIZiZuD2P0LbX/OCkMN4/DrWZOaAh9abxsNe1bfzvL9V4yeM=
X-Received: by 2002:a17:90b:4ccc:b0:2ee:a558:b6bf with SMTP id
 98e67ed59e1d1-2f2904b6227mr1999125a91.8.1734110090755; Fri, 13 Dec 2024
 09:14:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
 <20241213-module-params-v3-v3-4-485a015ac2cf@kernel.org> <pw5PzA4YGsu7j6ET_-OYE2oq9l7ixtTTGhHtxMxmMP5ggHxLrjzMkNMvcMVjGPhu7FpBb2duDD3bRbtMJZZHIw==@protonmail.internalid>
 <CANiq72kb2ocNuE6n32vr4xCkZhZN0uPuCN3SFA1+Q5L+Ma4ByQ@mail.gmail.com> <87y10jd8o0.fsf@kernel.org>
In-Reply-To: <87y10jd8o0.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 13 Dec 2024 18:14:37 +0100
Message-ID: <CANiq72nBpVy911cVhNFM6teQ0EaE-xs0SB2Qx95O4=nKBdRDuQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] rust: add parameter support to the `module!` macro
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 2:17=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> scheduled for removal. Interior mutability via `SyncUnsafeCell` provides
> the same functionality and it is my understanding that this feature is
> on track to be stabilized.

I am not sure about the last bit, but even if it is on track, we do
not want to start using new language features or APIs that could
potentially change.

And even if it is a feature that we are sure will not change, we
should still let upstream Rust know before using it, since we are
actively discussing with them the remaining unstable items that the
kernel needs and they are putting the kernel in their roadmap.

So I suggest we mention it next week in the Rust/Rust for Linux meeting.

> Not sure. `val` being null not supposed to happen in the current
> configuration. It should be an unreachable state. So BUG is the right thi=
ng?

Since you can easily return an error in this situation, I would say
ideally a `WARN_ON_ONCE` + returning an error would be the best
option, and covers you in case the rest changes and someone forgets to
update this.

> Not in the current configuration. The parameters can only be declared
> "read only". It should be impossible for anyone to call this function.

What I meant is, can you avoid writing the function to begin with, by
leaving a null function pointer in the `kernel_param_ops` struct, i.e.
`None`?

Thanks!

Cheers,
Miguel

