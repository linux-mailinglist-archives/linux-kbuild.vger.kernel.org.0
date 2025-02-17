Return-Path: <linux-kbuild+bounces-5797-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A8EA384A1
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2025 14:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8F4B3A2BD2
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2025 13:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6795121C9EC;
	Mon, 17 Feb 2025 13:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKxRCQ2Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9413521C9EA;
	Mon, 17 Feb 2025 13:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739798627; cv=none; b=uevP0MTteBy0rqC+lVf3tHi4ln+MnoQno8TA5+pDIiDA4qMuN5xC1vM2WsNxmxYLmcdmoafk/u54yL59ekA3liuYdWBXbdqbKUMF5cc5b7M2Iq1rZJ/uPU/XMtSDpdYP0gDwx4282CzDJ7IqUbWwYAn8ONvYsI6UU4FZV5s39ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739798627; c=relaxed/simple;
	bh=kt/K5przm46mL2H8Okc3eEm+BVm/V5KSx7283IGAhU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmDTjomMgL5rqlU6g72Y9JYGN+nbbvOti/uSID2MKGfA0X4MCTn34oXe2Icv0rmwZbqkhDEzlRKJc23pRxciltnx7GNpgqUxNYuVWhivifyeZvAVsL0Dv2K8YkdoF1rJeD7Ogvv8KF6+AFGEveWYnU+ppGVPromElCunhBGM68Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKxRCQ2Q; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-216513f8104so9081065ad.2;
        Mon, 17 Feb 2025 05:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739798625; x=1740403425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBj0h8f4FM1FBb+FMFSuMLsKQtkdRR7R06+FZTQQ6jk=;
        b=XKxRCQ2QrghVAWzc7JW9Km0EO7NDYXH1osozDFy9ED1BThFJEG/159WG4FCwkX91xJ
         ypOpM5rF0MTxLEZkVS9+W2YfetBL5GRXogD6OfZuj267vr9O9LomUOn+HE0j1aCQWa3E
         qa3szQwzHL6QnjhG8yywarFLbMcS/6yuSCxF/niPPop/uZlTTRYp7URVatV/S+dwiYCD
         yP8Lrmy7mq/RrR6vmu753Njblt/QCUpFQ1D6Ry01aNlFj4hGNfxubRDF6CtrnqIOlsMZ
         oh1nqObp/gHHDqVnj/YdnSotkqoH7hGjdzq3k8pnBT43fgqf3JdrIBugFmL1TbeYPMsL
         U3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739798625; x=1740403425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yBj0h8f4FM1FBb+FMFSuMLsKQtkdRR7R06+FZTQQ6jk=;
        b=b+IxyfllcMwXSvcbFMqvp4HtuSLGlAtCtRfYKWkinfNpui02JASNvvimyrJfGuMIxy
         z/0gyARySFvDrCktT5XVsJQLtES3dituR3+LoRoevcTDMztlXKPIL6ezEvYLCT1uOoqv
         /aUtGcwpA9RLTcZofhYBPQZ0uUl3OZ3rgYMS7ZRlnjMH/VoHZ104ruZ50S35qixUYg7u
         piTVos/eMu4kRVU5ZjwX3E89eSii7ZwJSDJyYIcsCwPGHf2tqpahKn+5nxxVBwponNL9
         oFjJGxIyS6zoqfG5/BBEOzpIJ0H4YcJyGs5BNDMjetJHggopIoeqUTGgrJ372tWlcmyu
         mYAw==
X-Forwarded-Encrypted: i=1; AJvYcCWBrK5kfRmWDl/Y++dA6/5tlJwqSeo4VaF3QSSucQZVxghNNcXAsUm7hLUNmXbndxC6X3ahZzSDME85r3B0HZw=@vger.kernel.org, AJvYcCWb1dRKm0z14O0fgG5Hshoca/N1yac+Y8DRhgVT+CAlgQqcEgNYpfE0OmWDXGvID8YOQDpN/Uql+BrDNUU=@vger.kernel.org, AJvYcCXVFaVvTSvBlBHtmpQZxBG3xRWF5Ek6URWJYxy9rOtdiwJ2lwEKJ1eGL3oB99FHGGVGJrtte3JoErpINeT+@vger.kernel.org
X-Gm-Message-State: AOJu0YxHnnmpLmLZQNV0HZEUjwKJ7eJD6G8n24OODWzWnAroh3EA8qAL
	J9+jvccpiEzk22k32mmKk3okqqGztYUQkO3/cJ7J8yj12+mbr+GyF0lafOiYtEXuhL8WW3f+TB2
	HcybjUxzcIrmH3tzbiqaju1h/5nI=
X-Gm-Gg: ASbGnctA9SC3ikjUwveGeVSjqvKyOk9iWNlklF8htWPi3rg+Kpr1Hh6Zir9ozw64ZEl
	QiqJaavq2zS3CEtFDbkzC07Xa/3017jSWgYOLTi3G8lisTbibsJp4FmBM0n5cC7HtgjNZQrfj
X-Google-Smtp-Source: AGHT+IEF2AmyB4qFalTyuT+96mQHIf4HLj5D4oC3auklR/J0qUGpWNF/G8ASHHj7MI3eLorFnXVP76TvfTwC3mkYoKA=
X-Received: by 2002:a17:903:3d04:b0:21b:d105:26a7 with SMTP id
 d9443c01a7336-2210401a440mr58843155ad.6.1739798623888; Mon, 17 Feb 2025
 05:23:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-rust-path-remap-v1-1-021c48188df1@weissschuh.net>
In-Reply-To: <20250210-rust-path-remap-v1-1-021c48188df1@weissschuh.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Feb 2025 14:23:31 +0100
X-Gm-Features: AWEUYZl_xoW-q_Uo1mBzKspdAgUlp5rPZusT5g_C-77oKHze5Aq-wQBZJQ9o7Aw
Message-ID: <CANiq72mcpVL1YXyDFi-PrbQ2Uh0WUA_VNqLZaOeqQnpY5HnX8Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild, rust: use -fremap-path-prefix to make paths relative
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Masahiro Yamada <masahiroy@kernel.org>, Ben Hutchings <ben@decadent.org.uk>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Urgau <urgau@numericable.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 6:11=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> Remap source path prefixes in all output, including compiler
> diagnostics, debug information, macro expansions, etc.

Hmm... We don't do all the cases in the C side -- the docs ask to use
`KCFLAGS` when one wants to remove them in the debug info:

    https://docs.kernel.org/kbuild/reproducible-builds.html#absolute-filena=
mes

I am not sure if there is a reason not to cover all cases in C (Cc'ing Ben)=
.

If there is a reason to not do it for the debug info by default (or if
we want to make it consistent with C even if there is no reason), then
I think we would need `-Zremap-path-scope=3D...` too, which is still
unstable, sadly (Cc'ing Urgau who implemented it for Rust 1.75.0):

    https://doc.rust-lang.org/nightly/unstable-book/compiler-flags/remap-pa=
th-scope.html
    https://github.com/rust-lang/rust/issues/111540

In such case, we would also need probably to mention in the
`reproducible-builds` docs how to achieve the same as in C (e.g.
passing an extra `-Zremap-path-scope=3Ddebug`, since it aggregates with
the previous ones, according to compiler flag docs).

>  # change __FILE__ to the relative path to the source directory

Perhaps we could add a note to this comment with what we do in the Rust sid=
e.

> +KBUILD_RUSTFLAGS +=3D $(call rustc-option,--remap-path-prefix=3D$(srcroo=
t)/=3D)

I don't think we need `rustc-option`, since the flag is available
since a long time ago (Rust 1.26.0).

So we should be able to just do:

    KBUILD_RUSTFLAGS +=3D --remap-path-prefix=3D$(srcroot)/=3D

Cheers,
Miguel

