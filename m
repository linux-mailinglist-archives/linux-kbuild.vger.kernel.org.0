Return-Path: <linux-kbuild+bounces-8414-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06950B2394E
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 21:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2113A189D77C
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 19:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCB22FFDE5;
	Tue, 12 Aug 2025 19:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvICun9w"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C5B2FD1D1;
	Tue, 12 Aug 2025 19:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755028421; cv=none; b=UtwN2mfNsgNRHhBSjKpIOEg6I51jSkwE2UetTQ/Y9xpuRKV/UPWCFgqKoOOw+3vNnc7vPWSkZNb8BJi6AJYxfxLB9s8bEMtpuWVX/2r+EScAVO6rFMFtGjhKVkfeBPYdWW7J4DTX4I6PPQsIb/Q2/0htPhrqwOx/QA2g+kCTLzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755028421; c=relaxed/simple;
	bh=jfUO6qCBqlSZXuckE9FhCMnfK7Vk1fhQB4xTAnQFad0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=da6u3iNMZieSPUkUVMqP+2cVzqzpVjb0dKHiAqJ9ZzilCzz1xQGprq/AcxnSgEecmjochx3olA79HrdvnwCr8B6SkiRPZANTAhto51to1tBcr9ORsC/qvbunXa8aq7RX+BxJj4rzDan7vDuum2ybE8eQ3jE357vW3f9DdVRnyb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvICun9w; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-24286ed452fso6220095ad.1;
        Tue, 12 Aug 2025 12:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755028419; x=1755633219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUSrkYVX911mMRYKobG/gB2geQHq7LE3EhoaramfDxQ=;
        b=DvICun9w6SxUacGuKlN/waWGIMNcXYuR8mUJiCZ31RS2C2DFH3uwR6RUUI617Xa/Hl
         IV+SB8yCIsk7n1VG7XI76XeyOqWBN5Ga3UciW94kRXbzgT02X1b8J6FfCDwCdNbVsM5F
         ZqFgWk9xgO1Rk3S5hYpNjaja9MCasCkceFvDBIFfN9+obuF1aIfSLzg0PteXuhbvBDl+
         3rdYuD9cwt7vf57mktMC5TYTWCL6i91wuGZsZpPPpnCo35QhSwUHRx3LRHC71Jxg1CyP
         VALKzW2xu8bU5eHKP0JJrI4jbvU5kmhaKcxh7vTbgvur58eo/ZqV4RMAk5jvOrA2Q5cH
         UAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755028419; x=1755633219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUSrkYVX911mMRYKobG/gB2geQHq7LE3EhoaramfDxQ=;
        b=kLWjORcE6PWM628YTwPLoZSpAF27Fe6qbNo63kwExZXZXGdY+YeOBFgIEwxAJGFTCM
         Vn0RI0PbTMWej55oYLr9Vw9Pr0siZ3OI0IC8cTqKrMMUPfXnKOWiDuIbM3RmA4C5CUTJ
         VJ3vhMhrQ9E6A5tylZYf1cMb/Nd9bc2FrJTCcu7AXukfdmm0QqBg122kZFn8fezzNFar
         vx60Jn30dppss+ydSE3R7iX3o79OegLiRs5UBndWrbCdiRFPudeibpT2XhhEtdWFyK/X
         LVJmPG7UD2yiwfuOyPmpZhjTIp/TFzmB8/0xKOsZ4bZVjLn6y7NjShea9/PzIu0hX9mP
         lnxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4u3Iq9629V/vIcZ6Y0NV5oehyJOKYymDahuEAiHXxkGqCajczKoETRPrhofOKjnBaUOHErV4i8E2Sfq4=@vger.kernel.org, AJvYcCW2R8d5ofGPRLjJQpqUvLhPuf4U11vYUCydCmb62tikm4Eo/Xx+L4gDkF4lckS0BSz2wtVOVi0/l7DsqBc5n34=@vger.kernel.org, AJvYcCWY0jVMCEWqIxW9eqkrEQwwNHSaCLT6NbPoGkkP0ENwJbBlDC5srk8PK5pVESS+J3gmbLmTzlEAU/tD+3uW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+/kibjopY+l0z8QbnVRAY5vV3ve9VPHsn29fEuQml4sRsRIP/
	zaOILeq8HD+fW6Kt9UuKj1ACuSQvs7rbFGEYj/WyAvymyIfugHI1GX8KFKLNhSAYJEobdFuEdN1
	FQ+Kng6bhF5i6pRN3wQ/9Ulwmkfizgt8=
X-Gm-Gg: ASbGnct6KojtrQR7NWqVXhj3dJpM3pSJ/t4eXjk7lRUwFQso3iURdfPFieTEZoIaV58
	ztiLEUkt1yacLQ9GUfXE1WBnBG3hNvqkEDnSwLCalI91FkF1RABnxMZoOh79tq7w6Gfah62jKyp
	uQhZyab1K0r0kw875RZewx+eZ+s5O9VlQcnBNXH84bcXO/u5klRGcuFDXvyeIRi9zD54pIl0wzQ
	IaZtvUO1vvUsr+YQus=
X-Google-Smtp-Source: AGHT+IEp8ZHS0gi6OP2eLRYeC79aMI4AVXuuqLVTdRChktGJBcowaIzzYNgkr6q7V4I87a++yIMfwzKOeEh83L8KTQc=
X-Received: by 2002:a17:902:c40b:b0:242:d186:5bce with SMTP id
 d9443c01a7336-2430d10c634mr3551675ad.3.1755028418798; Tue, 12 Aug 2025
 12:53:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250727092317.2930617-1-ojeda@kernel.org>
In-Reply-To: <20250727092317.2930617-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 12 Aug 2025 21:53:27 +0200
X-Gm-Features: Ac12FXynfRUtTtDBXz4z5dQZylg5ZZY4k8nbGOlwYd92YMdN3RiA45CrmjTdvgc
Message-ID: <CANiq72nOtuBNuuQQuW2piWynhizZg29Q7VgzUPAmB17w6XtQ+g@mail.gmail.com>
Subject: Re: [PATCH] rust: workaround `rustdoc` target modifiers bug
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Guillaume Gomez <guillaume1.gomez@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 27, 2025 at 11:23=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Starting with Rust 1.88.0 (released 2025-06-26), `rustdoc` complains
> about a target modifier mismatch in configurations where `-Zfixed-x18`
> is passed:
>
>     error: mixing `-Zfixed-x18` will cause an ABI mismatch in crate `rust=
_out`
>       |
>       =3D help: the `-Zfixed-x18` flag modifies the ABI so Rust crates co=
mpiled with different values of this flag cannot be used together safely
>       =3D note: unset `-Zfixed-x18` in this crate is incompatible with `-=
Zfixed-x18=3D` in dependency `core`
>       =3D help: set `-Zfixed-x18=3D` in this crate or unset `-Zfixed-x18`=
 in `core`
>       =3D help: if you are sure this will not cause problems, you may use=
 `-Cunsafe-allow-abi-mismatch=3Dfixed-x18` to silence this error
>
> The reason is that `rustdoc` was not passing the target modifiers when
> configuring the session options, and thus it would report a mismatch
> that did not exist as soon as a target modifier is used in a dependency.
>
> We did not notice it in the kernel until now because `-Zfixed-x18` has
> been a target modifier only since 1.88.0 (and it is the only one we use
> so far).
>
> The issue has been reported upstream [1] and a fix has been submitted
> [2], including a test similar to the kernel case.
>
> Meanwhile, conditionally pass `-Cunsafe-allow-abi-mismatch=3Dfixed-x18`
> to workaround the issue on our side.
>
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Closes: https://lore.kernel.org/rust-for-linux/36cdc798-524f-4910-8b77-d7=
b9fac08d77@oss.qualcomm.com/
> Link: https://github.com/rust-lang/rust/issues/144521 [1]
> Link: https://github.com/rust-lang/rust/pull/144523 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

  [ This is now fixed upstream (thanks Guillaume for the quick review),
    so it will be fixed in Rust 1.90.0 (expected 2025-09-18).

      - Miguel ]

Cheers,
Miguel

