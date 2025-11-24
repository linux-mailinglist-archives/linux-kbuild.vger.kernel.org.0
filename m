Return-Path: <linux-kbuild+bounces-9792-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 808CEC7EBCD
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 02:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1A2543450B4
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 01:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE17254AE1;
	Mon, 24 Nov 2025 01:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQsADKf9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08827235045
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Nov 2025 01:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763947283; cv=none; b=n/6fckiIpjlXJA5T5w2GByk55WTk4otGsW0JMcStVkCkFTN4Vxvx98MAb5AydzOfMVq2qAxAGBTDdMLwixamvWvYJXA4RQclXvzDoWYXWgJD48TexDIXxXGNVcwbBdC4I9xetpMpye6Xpz233k9aH0k4jl5DAu2QXsISmjlAncE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763947283; c=relaxed/simple;
	bh=KCvg+ikTpFCXv53G51DcHrbuLvPBIVU9eusIF5PQAc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bGjisEtWpD1le4a2sVsNrq6/qoOcZ7ovk3vE3UB7e6zyFfJyMi7FNpQ7DKgks3tXCQWi6xydntpoaWnEei18qQ91fV54Jb9C27LRZprlgiQDJ2f5SIECn2M46q4dSKZCfNlHRQs0LlR8/2O6k9KLg9bVAEOvKQ51P/OPbgXvI0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQsADKf9; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-bc0dd142007so41657a12.2
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Nov 2025 17:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763947281; x=1764552081; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biyAaHpZ7UlWRRCyz7ZvvoeGUjsmQlOPvO+v8XJx/bc=;
        b=SQsADKf9IDPus5tv+CY7N9psMWWkUmsEqNFkS0qsvLWBCvGozAOXbuTI67jRVDjCj7
         cEV3prORe+WEzUeeGYGZkRDuKgJqRBDAGrZEAAay9PGrTX/rEzulshsJzOYIN8yMxiG4
         HpmzIFH1Nw2LQBZfF26EUw3uxo10ogQyu9RHIAMPi5rZWY7ktXdm2PnNxy/2g+d8rIlo
         FGShM64CtJsFnw0kp1G+kQFibAQKp+158YR4uVnWpJHHmKsRVC1TEYCBmRm2rYNpoCG3
         i2bufYQZOMUpb0IT+MgrI5gfRdSrvEGqqx01YJSjAcgoFqlTuA+OPutjkxwQp/08Glhx
         k8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763947281; x=1764552081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=biyAaHpZ7UlWRRCyz7ZvvoeGUjsmQlOPvO+v8XJx/bc=;
        b=GFFuD5KiGDXXL7ikr1EjpNidIcIQWlXEbbLQtZWcqhFXEz7wFzn5fnFets1pyGPoXW
         dQ8p5NvxmHec3QmhXcMhvOpxn9Qmyo+qMwBDVstSo5smYA62lI/jhnT6NKIi4BJPECgI
         1JHVxlsugUSrPtAXjNtGLOeQDS8OE6dqO2xKbhJvuiMFZa5VL14FX8W8ZOsj6tbcEbUg
         7usWrCAtEGQri69Ma5RcNBs2SAwfMoGcjcx+KObCsuSSGZxhunSW1lms1boWpKNuLou/
         +Lw1M5YGLKv02++aU03Yg8nMC0a1AgVRF1s5UprWBs8Ag3PmzCpeOufOIElBx/hloKc2
         jTLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlJFIdXBOHzLDcIAiIv0Sy85tid7p3UoEmV1XvYPvwE5Qld7BxSXjrRr0ZdSde97cadFIS43k/BgGs94g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Z8uS1lEWCnc/m6FOgtdIJNIEJSX3THyM2j+cSJxjllt5dsEl
	nAoMvWcmBsFoR9drqrozqtB8++9cAdrin/KuYGENPdSi1X+hnhOhNMjwQUSyQieE0a0+Nytikxq
	wu0QoPNiXDr4H/gjAY9kFxvPDBIzIERw=
X-Gm-Gg: ASbGncsYz9VguQKOPYVoEvsybyMfpzq9h9VxQTZNV9ulJMK02KyXYYxKvI86aIcVlvZ
	FY4/GLfaFNtnfQI/HHq6PgtXlGcvZJG1yCRLl3cbrGKXplUtolU4n82xqbs+P8ZBIKz3Qjb5aJY
	g3Jw0ozXwFOSiAQeHUDjGmpLhwBFb0JjWr9EU6fy8CJrcWzpzQqIBZTiqTTIlmpsfuOtNIY9mmq
	vJK/kpOifTC/C+HR+SXbw3M6JNUvV3WaW5eW3VM2l/oL2Y23KH8Fso22o2bSMrQ2nMF5Pi1N+WA
	bxRBq91IzkvUZkUhV5JeO65pxuFpQzpFf/LA0ytu7SFsRdbiBuuu4hOA5d2wvh0JEjCtm/7vE6N
	ILYGuFUrAFptLZw==
X-Google-Smtp-Source: AGHT+IF7uCgR8D7JuSAXIkPZpUGPSLX7RZ4rQ8XZiWkfQ1rTA8eM7wEtMX1LZxU2dGsl6gS27smUFSiUHNUF0PYkbLY=
X-Received: by 2002:a05:7300:ac82:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2a724c02369mr5716030eec.3.1763947281135; Sun, 23 Nov 2025
 17:21:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com> <20251124-gcc-rust-v4-v4-4-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-4-4e06e07421ae@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 02:21:08 +0100
X-Gm-Features: AWmQ_bnEyQjjwkSgNtuZsnn9EWb0bwxCuBV5MLpaTWl4ay19-nMkjpn6O6IgwyE
Message-ID: <CANiq72nqzPiiefC6Q9C0_rzoS8saL_EJ5qiTpMhZtG8pAsmmUw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] RISC-V: fix gcc + rust builds
To: Asuna Yang <spriteovo@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
	Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 1:23=E2=80=AFAM Asuna Yang <spriteovo@gmail.com> wr=
ote:
>
> Commit 33549fcf37ec ("RISC-V: disallow gcc + rust builds") disabled GCC
> + Rust builds for RISC-V due to differences in extension handling
> compared to LLVM.

This should mention what we are doing, i.e. re-enabling the GCC + Rust
support again.

Also, I would recommend avoiding to say "fix" in the title, unless it
is actually a fix, but perhaps the RISC-V maintainers consider it a
fix.

> Add `rust-bindgen-option` conditions for the availability of libclang to
> the RISC-V extension Kconfig symbols that depend on the `cc-option`
> function.

This is now in a different commit, right?

> Update the documentation, GCC + Rust builds for RISC-V are now
> supported.

"are now maintained" may be better to avoid confusing it with the
"Level of Support" in the table.

> Documentation/rust/arch-support.rst |  2 +-
> rust/Makefile                       |  3 ++-
> scripts/Makefile.rust               |  1 +

In any case, for the Rust bits, this seems OK (I didn't test it, though), s=
o:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

(By the way, I wouldn't mind if we started adding `MAINTAINERS`
entries on who is maintaining particular architectures for Rust,
especially if there is someone in particular involved with it etc.).

Thanks!

Cheers,
Miguel

