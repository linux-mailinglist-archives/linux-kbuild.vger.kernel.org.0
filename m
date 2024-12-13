Return-Path: <linux-kbuild+bounces-5123-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9DC9F0CBC
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 13:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF04216274F
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 12:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2717E1DCB09;
	Fri, 13 Dec 2024 12:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBbapU80"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA2AB640;
	Fri, 13 Dec 2024 12:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734094470; cv=none; b=WCSaEeRC92rQ2EjJIwgR80d9Zgup7dI39bGDGL2PdDAAdW2evJQRFEWp6vLGpSfSF1W3dEuzuKb9SP9OSwOAELVu3+Oq305XQUcl81IMHhZcwRm56Ah4P/paY1RRMfmYdoDiAdT0WIwrUH8u3N6rjP64dufzXbUsYfydt2B9pOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734094470; c=relaxed/simple;
	bh=qX9CQORPfhHhUnYRNCuiCL54UEvqGl7G3XM71Ad67zE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GHJmTwAzfBF6pn03wWN0EVfrmG8ytGms25q7FslzhQQMYduGys9vgFO8F1t7tpDEf7XUKyPvXnKl3t1JCfoRDvqTcLmHSJzfGHD1FRi/aI1NN2/TOwBwznkGQpNd5V5/7jy36fkyv2S1gMaEHDFDkfIQ0FQEu6KQIlPOrui7SPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBbapU80; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ef7733a1dcso225109a91.3;
        Fri, 13 Dec 2024 04:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734094467; x=1734699267; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7lnX6pvesFm1bbysPw8dNJ52plSEA0FJvjad/vogKs=;
        b=QBbapU80UhK/vyICRFqGvdL7GwM3CxLWtPEzFSmiElUwuaQwo8Ijzc1an5KR1xDhxB
         uxi44uSpA6heav3o7iiARdhNOCyRpzoSM+nYskg+gkR7MPCpvvnHflLJQPyl3AGEZX7l
         KqNSNGI0UjCPLgmk7WtLhIiiTmB/RN6rh10DJrSEDvSc3guZcy/UfErtwF7DZvh8LiQs
         N0N+yrBHvah8O3Fawtau8djfeJxN2gh12YGUb7e57oT7sisTNFbNNE+1oO/qHe/dVWFB
         IEAprHHj+N0q4gA64bXut8RjQDLHk78s3sfqyOc5NOlTbCe1u42TA4X8O1YPcSO5Mzkx
         6f5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734094467; x=1734699267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M7lnX6pvesFm1bbysPw8dNJ52plSEA0FJvjad/vogKs=;
        b=TtXtEoiIw5PA65ZDNHgWORyUB4DvbDAx4Kugr8vB+uzns961tpsLJ/r6ZxEtndBlW0
         PshgWu7c4ePi2JggA2nxciEKz+5Tfyls3hKRoJi1YC83N6dZhShn4VxxszxKKPQhC5Nx
         Zx/D8yT9aWyg/TANJ0AUFbUPC93+ptRVhh5QRtkDwSk45ZtQG699G7FaVXuSIXz3QjDl
         4b8yH8FVPyHH1OVHlMiJ9T51ACx/7VTzG1vo8/vxV49OXVjr+/8DowGaIl18Kec6T8oA
         StjysH+7H8/RXxPUlZIR5NGSLLJXB0RU7J+L+FIu9FoLKTxWg9wgIdTJoKDr1GedSLyF
         9Fkw==
X-Forwarded-Encrypted: i=1; AJvYcCVWubTEynDERkq5miamBEj31pEzWYXS5BRkFlEhOl5Kk95gzymxvkSb3mBzOtjaAZs+lLvuvxjSPVsbfnjB@vger.kernel.org, AJvYcCVxeblgi6jFR/MJ4cVqqSC6TouoMpI4D8MfbYAB4sL0NDr1Gkz7LF+KDOeOnFTMTUD3g/Q/ZZ5lm+mg0HnGpV0=@vger.kernel.org, AJvYcCXXoMU9BL5Cre5Ekz+YvLU3eTvCYPyCiD/z0JaiFJ3TwK0l2f799EARuhwUf/9QPugu5cSfuiuB+kXQiqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyevBTqRmzOoqb3ZAZifsRuAtzos42M1l7yYDdf0dIccAh0fZ82
	v4EMzhXsxKvhYuycsTI+Y3YIMQkWys4TTHR5XmHIealKrUb1nRgLNsQWLQkDKzGiD+ZcgJ1V1M2
	wuQu5f7sHGE+5f0F6/jqYUI37ENo=
X-Gm-Gg: ASbGncsi/BIHUodn+b3BhvtC89/klppzHIJbK7/AJZhrCAK0/Cl1Z97I3TS4+aYpArx
	hvncX2huU9qHYu7eqLCmRkQ+qocEk98t1Oqhrjw==
X-Google-Smtp-Source: AGHT+IGvucEnaiwg2rn7HNjFMCe4CcCSHAM26nUewErkdil6HFmiwrWXHjk2vWKd8ZBP9NRXw42RLJcwbNCGpeZOmHU=
X-Received: by 2002:a17:90a:e70f:b0:2ee:6a70:c5d1 with SMTP id
 98e67ed59e1d1-2f28fb5dbdfmr1554108a91.3.1734094466818; Fri, 13 Dec 2024
 04:54:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org> <20241213-module-params-v3-v3-4-485a015ac2cf@kernel.org>
In-Reply-To: <20241213-module-params-v3-v3-4-485a015ac2cf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 13 Dec 2024 13:54:14 +0100
Message-ID: <CANiq72kb2ocNuE6n32vr4xCkZhZN0uPuCN3SFA1+Q5L+Ma4ByQ@mail.gmail.com>
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

On Fri, Dec 13, 2024 at 12:33=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> +#![feature(sync_unsafe_cell)]

Please mention this in the commit message, the status of the feature
and justify the addition.

> +//! C header: [`include/linux/moduleparam.h`](../../../include/linux/mod=
uleparam.h)

Please use `srctree`.

> +/// Newtype to make `bindings::kernel_param` `Sync`.

Please add intra-doc links where applicable, e.g. `Sync` here.

> +unsafe extern "C" fn set_param<T>(
> +    val: *const core::ffi::c_char,
> +    param: *const crate::bindings::kernel_param,
> +) -> core::ffi::c_int
> +where
> +    T: ModuleParam,
> +{
> +    // NOTE: If we start supporting arguments without values, val _is_ a=
llowed
> +    // to be null here.
> +    assert!(!val.is_null());

Should this return an error instead?

> +/// Write a string representation of the current parameter value to `buf=
`.
> +///
> +/// # Safety
> +///
> +/// Must not be called.
> +///
> +/// # Note
> +///
> +/// This should not be called as we declare all parameters as read only.
> +#[allow(clippy::extra_unused_type_parameters)]
> +unsafe extern "C" fn get_param<T>(
> +    _buf: *mut core::ffi::c_char,
> +    _param: *const crate::bindings::kernel_param,
> +) -> core::ffi::c_int
> +where
> +    T: ModuleParam,
> +{
> +    unreachable!("Parameters are not readable");
> +}

Do we need this? Can't the `ops` callback be `null`?

> +/// The `arg` field of `param` must be an initialized instance of `Self`=
.

`Self`?

> +/// Generate a static [`kernel_param_ops`](../../../include/linux/module=
param.h) struct.

`srctree`.

> +/// Parse a token stream of the form `expected_name: "value",` and retur=
n the
> +/// string in the position of "value". Panics on parse error.

`# Panics` section.

> +/// `type` may be one of
> +///
> +/// - `i8`
> +/// - `u8`
> +/// - `i8`
> +/// - `u8`
> +/// - `i16`
> +/// - `u16`
> +/// - `i32`
> +/// - `u32`
> +/// - `i64`
> +/// - `u64`
> +/// - `isize`
> +/// - `usize`

Can these be intra-doc links?

Thanks!

Cheers,
Miguel

