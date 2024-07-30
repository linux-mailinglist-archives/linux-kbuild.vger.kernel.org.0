Return-Path: <linux-kbuild+bounces-2747-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB728941128
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 13:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60DD71F23EBD
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 11:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39967198856;
	Tue, 30 Jul 2024 11:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAHOglBF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D43166316;
	Tue, 30 Jul 2024 11:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722340261; cv=none; b=ZkF3sunLbABKaVrYp14c85J0GycbjY2mUSPhSFXme0hAewZue7fD/ie9a/w+mBngLiXkVzPit95Ei0ErLIq3R6Yhk/QsIgI+IdKhh9m71aDSvWPC6Tkw8jer2XMLaAjgtvWvEImCQ1c08qzv6t4++UVnVtlQ4ZpgCQyjxOBcxYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722340261; c=relaxed/simple;
	bh=eE2oW6livb9nXMNEPrn34gplnKzITeuZUZeclXaFmdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BlEdj0KGGSRAE6o8MXbhFcAgt0eJGkTrw4dTbtQWaNwm6aR0VO0zumDbGOefW1gU+VN87R2jS1fhay73JSjfW/g7/V0WR4gzGqk0eyZi5d5MaT6MBrADyUUK/PsABHp90cucpJQshlXK30DBaSuM7FSTYGMBEwHUff9FvKH+TaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAHOglBF; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7515437ff16so3400762a12.2;
        Tue, 30 Jul 2024 04:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722340259; x=1722945059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDWvXRl7W+y++kTMY5mGMMgDtm0Z1tL8PpSxD7HMetg=;
        b=nAHOglBF+WHU2PX+C7/U30wMPLD4eOvX3GRv/Bs2VzVBAnKh5pcrR2dmnLNy/LKsVd
         DjaX0ASyTtvFEHhXmVzF4UtlqFmAE2HvLIGQ2mG0GkTYWFumqv2DLB2tRsHweZgmDB9c
         xjtbXCtO9bt/agYDsdlzICx+SR1jVSOh/YylaWL3l+w8+1K717r4Peth4l/OM9juCZ0n
         8Nxv0oG+mepx7A3889c6LOPseqr8hpWyt1QFHHKYarIn975h7R2FVls/HVjATLDKpzaK
         sYqKIf6zDcHYSzSfQVsMm3zvDf0+aqEr6gn7aE5vRybGceiT945y3Peta0IzYbS+ccZZ
         vIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722340259; x=1722945059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDWvXRl7W+y++kTMY5mGMMgDtm0Z1tL8PpSxD7HMetg=;
        b=KxVzJ4SYk4OTwgEypJHX3yrQFBahIO0AS5SV/Rh0qVSyVVuhtQFEHRnpfgfkpAzav5
         TSlpjws83YmzLmAy79SWRRnpQVk8TDx/CGNCPf6KtLuOD/XyQeSz++fEY+n7bpiBgeCX
         3zRlin7zUHJXFbwiGWD+AA1cGttDSyktiG4LYxT+qPEzsXoM93XL2veSlQxab+v0+oZQ
         0oz9C1QyrGt0FAnz+QasxTN5w9v4Tzlwx9MGP5g6B2KL/96IJQ3ONwiIYckOTSKNddk2
         r1wUZbuMjXPQev3Cub7T1cyIrrXzUZMCzDeFTsu7B7bgdEBLMHn4y4XqGfL6oDMNxoJT
         i/Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWUuCohd2MFj+CEwyBxOVZGk+o0QctlrADngHkL9WwU3zYfsV+MEOT98upwm4NdirQ7pPXA/A/bNMFMsttYC5BLcmx58yNZeUr0f4cLMtOElln976/tKI5l0oXveQOkxI11YZxaUc5B+uk3jP0qdhW1Kn+yQyWEfImQArgbpNPvsqW5APKS2OetwtM=
X-Gm-Message-State: AOJu0Yy3o7U4aPkAZLThxysRr20ncRvbdqR4cGM5MkfXfv+q14GBGVYt
	5Ryb24sfTBBlYEujj5buGpc9hKlNuL1ka6iaVXjpxB6LsfELxpKqcygYwAHVUhV7F79iaJWoVWc
	DuzBzM9KPuda18ZMAXX19sKAEZdA=
X-Google-Smtp-Source: AGHT+IHyBAvrz5piafL+fjC21VKH7j72SmnKC582QDIYm5TpHtK7qfMI7hI+BOACpwHlqxBRr6tXBjtQy+O1Ch0yPMY=
X-Received: by 2002:a17:90b:388b:b0:2ca:ffa0:6cee with SMTP id
 98e67ed59e1d1-2cf7e60bf70mr12725280a91.31.1722340258994; Tue, 30 Jul 2024
 04:50:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730-kcfi-v1-0-bbb948752a30@google.com> <20240730-kcfi-v1-2-bbb948752a30@google.com>
In-Reply-To: <20240730-kcfi-v1-2-bbb948752a30@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Jul 2024 13:50:45 +0200
Message-ID: <CANiq72mshrgXJLw+AZ+ovfhZXjYYfgQLdyYdW_v0FmdWdEjvbg@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: cfi: add support for CFI_CLANG with Rust
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Sami Tolvanen <samitolvanen@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 11:40=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> +       RS_FLAGS_CFI   :=3D -Zsanitizer=3Dkcfi -Zsanitizer-cfi-normalize-=
integers

Before I forget: this should probably be `RUSTC_...` for consistency
with the rest (and, in this case, these are flags, so it makes sense
they target the particular compiler).

Cheers,
Miguel

