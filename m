Return-Path: <linux-kbuild+bounces-4983-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C749E2FDB
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2024 00:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFD56B2917F
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 23:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE5620A5E5;
	Tue,  3 Dec 2024 23:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g5GZLFX+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9181FC10C
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Dec 2024 23:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733268396; cv=none; b=TMY6/HItzsrMcz85UCHGdvzIMoIU51rqI3QNkZVF9ZFHYEy4/ee5lDNB2h49KBviP4Be21V8HYxzKxnZ9O1ADBDvhbzExw0T4Vg3seibWSlq+TjnKLod3Jr9J75NIyyFbgM+ofL+C4tEuDeWWwLO2Hrhu2c6ZS5RBDUPw/qDCt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733268396; c=relaxed/simple;
	bh=A+NygRxfATzmDDYl4BW+aoTxyFsALc+e05mYyvBpsWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZDxxxwjxrH3JAqOOF2Te7KH8gLbBTCQid+radA3Wm1I/Tm7YRJPeo0Z0Jpxc1nAyjdQs5MLHjolpHpUxZNh7puA76sU0quXwHmE1qXyIoePFfO+4n2pBwfo5fMXhCaTA6q+Er63yBBjV15Q7sTbBoI+HKK7YzgsYLPihxGVc1MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g5GZLFX+; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5cf9ef18ae9so527188a12.1
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Dec 2024 15:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733268393; x=1733873193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0gsOOV1IK0tbYsC9eBpU6WfUiWf0dqVzzhWYdaHF04=;
        b=g5GZLFX+dNpdx1YYUJf5LjvBATqDc4vNwiLsd5Vg5f/Q0v1vpIo5LbOagutF6tWpuq
         6YPnniNdcTWkE0F9Pvnvrnyoz9rQRpLflynsw2tat7MCaNvjdvbRURLlw6ilPDuWJGjM
         jwltgiwduh6ZCo5qqzKW6ZY9o5YAhNmfK1NZ7+gO96u9qTwIAKxCwQT3n6BFbosUl7NU
         KJy+Azpyyugs2JXMN6hZZfh1JmHZOlJqSATah+9PVo8y6wgRdTm6n6ssGamQGnEs+vHT
         4lOi6RHdVh+hafoWNSS7MvnG4IuACOc9ad8h6t6tXTl5T+0V+0QY0DDdQXw4VU8auBjZ
         kqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733268393; x=1733873193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0gsOOV1IK0tbYsC9eBpU6WfUiWf0dqVzzhWYdaHF04=;
        b=pARA/4YriXR+h+w1UAQuS0Akk9U/Lwiq8I3tPtIzRyzGJeTpk9m6kEl0LO8NNyx4c6
         dUAyQgFpqElnr+vPywfh2b658LcHk5FEOYCTQklff9sdCdONM98Ojd0BNy3HJaAvIFxW
         vt77eU4UWJjoJdHuVWrHuLbUkqr5mGimkWMLgkH6uOmCxhkHFVU4q8Xiv+tXhy1fjfrG
         rv5JLeuB8Sxi7iL4Z7DnJHDyP+1mVCjuvoB85ooqvI68MLkQREPzWTUmFr7+usQ4nfC6
         IIwmYILr2Oa7z2aQbDNYcHl5OZcSpf0telLZIK4Egrdgwr4fIQObGggxepg+SWip61I4
         38yw==
X-Forwarded-Encrypted: i=1; AJvYcCX8Gmuz+FShkl5SMemWQgxHq4H8j4M4kEGJsP4A0CaJkqAPz3QbGnmxCjTrSmc8wcgNv+ms7+dwAbcpB+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUH10D9w00YPo+fbSWdlJD5f6kT1duhmaVbwBEKioApjp4Z47w
	zjlpXpLoQQJWLi3CKN8fGFFBgn8qnrzeT1zz5ogM9/VtjEbbyeeKgbvbyBKvlY7rXW0gPrGV/IZ
	O74o4ai/dLcs6EAT7rTkErDqDk+jRPQovpwP5
X-Gm-Gg: ASbGncuONAqonnl756S0UNLEHfzerCj22s0LbXJdSepnpQpc4LZCyZgIJLLY3Z27gJ5
	4zEVJZZeOlukJyAXwq7zDXuVrOtPz+SNVGX7+foLPXOl6YRPAE+nItV9bD07ASsLX
X-Google-Smtp-Source: AGHT+IG44HltO60JYgYmVvMEo3QlcFo1P0mYiAAGDSp4Skz4zAxbxt9ZfqfNSvUY79c414MNywqlUX98rVVFvuuFn2Y=
X-Received: by 2002:a05:6402:1d49:b0:5d0:e9a8:4c96 with SMTP id
 4fb4d7f45d1cf-5d10c2498d8mr3918350a12.9.1733268392481; Tue, 03 Dec 2024
 15:26:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241112184455.855133-1-ojeda@kernel.org> <CAH5fLghFZTG2X_mYE2yGJwPM31NrJdkA-cpZTCYsdghR8YdY8Q@mail.gmail.com>
In-Reply-To: <CAH5fLghFZTG2X_mYE2yGJwPM31NrJdkA-cpZTCYsdghR8YdY8Q@mail.gmail.com>
From: "Hong, Yifan" <elsk@google.com>
Date: Tue, 3 Dec 2024 15:25:56 -0800
Message-ID: <CAABy=s1sEzJZBR6Mt+ujFY_SSbU_OgKDtOs0+bxXQhTo9QZtGA@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rust: add PROCMACROLDFLAGS
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 5:34=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Tue, Nov 12, 2024 at 7:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> w=
rote:
> >
> > From: HONG Yifan <elsk@google.com>
> >
> > These are flags to be passed when linking proc macros for the Rust
> > toolchain. If unset, it defaults to $(KBUILD_HOSTLDFLAGS).
> >
> > This is needed because the list of flags to link hostprogs is not
> > necessarily the same as the list of flags used to link libmacros.so.
> > When we build proc macros, we need the latter, not the former (e.g. whe=
n
> > using a Rust compiler binary linked to a different C library than host
> > programs).
> >
> > To distinguish between the two, introduce this new variable to stand
> > out from KBUILD_HOSTLDFLAGS used to link other host progs.
> >
> > Signed-off-by: HONG Yifan <elsk@google.com>
> > Link: https://lore.kernel.org/r/20241017210430.2401398-2-elsk@google.co=
m
> > [ v3:
> >
> >   - `export`ed the variable. Otherwise it would not be visible in
> >     `rust/Makefile`.
>
> Despite the missing export, the previous version worked for us too.
> I'm not sure why that is.

It happened to pass the build when KBUILD_HOSTLDFLAGS was empty, which
was the case when it was not exported. But that was definitely not the
original intention of this patch. Thanks for catching it! I have
verified that v3 correctly exports the variable to sub-make and still
works for our case.

>
> >   - Removed "additional" from the documentation and commit message,
> >     since this actually replaces the other flags, unlike other cases.
> >
> >   - Added example of use case to documentation and commit message.
> >     Thanks Alice for the details on what Google needs!
> >
> >   - Instead of `HOSTLDFLAGS`, used `KBUILD_HOSTLDFLAGS` as the fallback
> >     to preserve the previous behavior as much as possible, as discussed
> >     with Alice/Yifan. Thus moved the variable down too (currently we
> >     do not modify `KBUILD_HOSTLDFLAGS` elsewhere) and avoided
> >     mentioning `HOSTLDFLAGS` directly in the documentation.
> >
> >   - Fixed documentation header formatting.
> >
> >   - Reworded slightly.
> >
> >          - Miguel ]
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
>
> Tested-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: HONG Yifan <elsk@google.com>

