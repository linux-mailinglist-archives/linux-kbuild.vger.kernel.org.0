Return-Path: <linux-kbuild+bounces-9367-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D434FC2B099
	for <lists+linux-kbuild@lfdr.de>; Mon, 03 Nov 2025 11:27:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0F6C43413B0
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Nov 2025 10:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5E72FE045;
	Mon,  3 Nov 2025 10:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zIxJkZKH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536D12FDC57
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Nov 2025 10:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762165628; cv=none; b=ebtVmyOygrbROQKd8Amm9eKgvmjqLyseg+h5jN7iJuZLLS7qyMl+7gU8gWCxeQIc3vXMRvJ3OSF74vIsopnTF0khd8MzV66kaXg3F3mfyZVD+FNxlM0YL6KwK8T686a0Rs1vkGWktBBAfRFMR0dROIEzguTnapxnaU9lxqiA2qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762165628; c=relaxed/simple;
	bh=zeOd2iozLHY5E9/h0Dlh5Vw9vcim7rHAVynPoeVlDd8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qr4UPwuEkqByhnxYujKPzFYSHEEXzDFMcgVuZB+ArFgApp0dJ6a1w8m53CRcLWTgRb20A0e2yTubXxwoEFHBZYdSBMbDchMyCEKoUTTiDP5iDtpG3ekN91Gxp6ekFX/k+D81DTLZOnS3cG3ruBt86fvqeGlGNt8K/aJhLOlVyfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zIxJkZKH; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-64081e1f6a0so2671570a12.1
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Nov 2025 02:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762165622; x=1762770422; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wfDOrMXlo4clgAlmd0PnLLaSk5oU7JsCtleVfGyOwWI=;
        b=zIxJkZKHSZ3lz3lJLBL+zcCRrFzuoWJeOor3hsp6P+YtJAJPCG37FeEze8N69kb5UD
         GW7694VoF4U5fMr2+632bubmariUisxjfBr9V5UmWcvF11ZrtJegEM89VN+g3h1pr22B
         GLHXqIfJ/eIiP/uwPiORfCtjwf2pSkxzv9O817JXvtIs6TRyqTFQa1k0jlE0kzcyrx8u
         EYJ5Lrg+HooYSBe2k5bPThTZYf7UzUmCZ8gZ15y78rwc+aDVA1eONWYtUQMOj4QJRB5+
         THO01hJ+Be0ZlyVfQMQkHL/lrxo9Go9wzmpICGvycLMeqf/IcJTLKsMf8vUjT9WHw1Kg
         VrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762165622; x=1762770422;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wfDOrMXlo4clgAlmd0PnLLaSk5oU7JsCtleVfGyOwWI=;
        b=apEXkk2fETURJ9OfUt/mD9lCZOwraw/KiBj3Bx2PK6Sy8+UzM235iM//fo+36kvPHF
         8xir593vx8hSCXf0z40q7htk0xI33UT0Ke46FMz/h5ABs+r2PfQL8MBkJnJvyifYlVFL
         p1kHiDoTdNlCGuAVyTfTB49g4D7wnjTQKvdCLeOCCsZmvaEoSas7rDr3WV6Iz0l4Zuaf
         c/t5QSRDx1zcOOYhr/7Tz+BAu+OQuf2TN9IHosSzQRuq17vd7Fvx+JnMCH1/b1SLD+Ys
         d1L0j4babJKGi/CNlZWQ85eEayMWRNlcfr0dGnrwDg/zITPKceHRE7JUi9g2DT1206Ks
         /9OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo5aSi79fuOw4ytcg+Eu3+7XKZiWSWZBy+gkY6iBkHIpsKiIwWasiGZp2rrIAjOdAF41VHiIRls31Z1yA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQnsJDLJQ5SlUri6Op4MxQ2qojZqI56naPLU+lltdvLefaDDGk
	pk0mnmNkyymGDZdjiazWJaIW4vVV0PiBQJUIz3KWQNQ46So0sYQhMnEZ3yPRHPJz1WzDFNvbXM/
	hB9TRq1VXG4vFP30aOQ==
X-Google-Smtp-Source: AGHT+IHA/3waiBho0mXu28WwEu1WqeXYiiwR6bIsXlP4vDe3/Ww+rW0qIjmyU+AvmPyU6HG0yyjcIpqx3mZy7js=
X-Received: from ednd3.prod.google.com ([2002:a50:f683:0:b0:640:9915:7946])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:42d2:b0:639:4c9:9c9e with SMTP id 4fb4d7f45d1cf-64076f745edmr9836758a12.10.1762165622423;
 Mon, 03 Nov 2025 02:27:02 -0800 (PST)
Date: Mon, 3 Nov 2025 10:27:01 +0000
In-Reply-To: <20251102212853.1505384-2-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251102212853.1505384-1-ojeda@kernel.org> <20251102212853.1505384-2-ojeda@kernel.org>
Message-ID: <aQiDdZvRNrBkrB-U@google.com>
Subject: Re: [PATCH 2/2] rust: kbuild: workaround `rustdoc` doctests modifier bug
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Nov 02, 2025 at 10:28:53PM +0100, Miguel Ojeda wrote:
> The `rustdoc` modifiers bug [1] was fixed in Rust 1.90.0 [2], for which
> we added a workaround in commit abbf9a449441 ("rust: workaround `rustdoc`
> target modifiers bug").
> 
> However, `rustdoc`'s doctest generation still has a similar issue [3],
> being fixed at [4], which does not affect us because we apply the
> workaround to both, and now, starting with Rust 1.91.0 (released
> 2025-10-30), `-Zsanitizer` is a target modifier too [5], which means we
> fail with:
> 
>       RUSTDOC TK rust/kernel/lib.rs
>     error: mixing `-Zsanitizer` will cause an ABI mismatch in crate `kernel`
>      --> rust/kernel/lib.rs:3:1
>       |
>     3 | //! The `kernel` crate.
>       | ^
>       |
>       = help: the `-Zsanitizer` flag modifies the ABI so Rust crates compiled with different values of this flag cannot be used together safely
>       = note: unset `-Zsanitizer` in this crate is incompatible with `-Zsanitizer=kernel-address` in dependency `core`
>       = help: set `-Zsanitizer=kernel-address` in this crate or unset `-Zsanitizer` in `core`
>       = help: if you are sure this will not cause problems, you may use `-Cunsafe-allow-abi-mismatch=sanitizer` to silence this error
> 
> A simple way around is to add the sanitizer to the list in the existing
> workaround (especially if we had not started to pass the sanitizer
> flags in the previous commit, since in that case that would not be
> necessary). However, that still applies the workaround in more cases
> than necessary.
> 
> Instead, only modify the doctests flags to ignore the check for
> sanitizers, so that it is more local (and thus the compiler keeps checking
> it for us in the normal `rustdoc` calls). Since the previous commit
> already treated the `rustdoc` calls as kernel objects, this should allow
> us in the future to easily remove this workaround when the time comes.
> 
> By the way, the `-Cunsafe-allow-abi-mismatch` flag overwrites previous
> ones rather than appending, so it needs to be all done in the same flag.
> Moreover, unknown modifiers are rejected, and thus we have to gate based
> on the version too.

Ah .. we may want to file a bug for that.

> Finally, `-Zsanitizer-cfi-normalize-integers` is not affected, so it is
> not needed in the workaround.
> 
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned in older LTSs).
> Link: https://github.com/rust-lang/rust/issues/144521 [1]
> Link: https://github.com/rust-lang/rust/pull/144523 [2]
> Link: https://github.com/rust-lang/rust/issues/146465 [3]
> Link: https://github.com/rust-lang/rust/pull/148068 [4]
> Link: https://github.com/rust-lang/rust/pull/138736 [5]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

