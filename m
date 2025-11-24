Return-Path: <linux-kbuild+bounces-9799-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BDBC7EDFB
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 04:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 08EDF4E0518
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 03:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFDF2853F7;
	Mon, 24 Nov 2025 03:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/dUzJ7w"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C631F1537
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Nov 2025 03:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763953730; cv=none; b=dKWq8uGIsc5Np8RQMI2lcPZw02EbRiT97xwcCDKnmnYVR2zofRuo2ovEo4B44WPs8fSA1qEQuQtkjY7SGvMWBqGa7sbLzZBRMF4O6jjqjBJIFeXRBqhV9JFlV6Gs3xpaSTKTaIlVg7VJq1dst3ZBErNjI8PXgh57YJWwG4G64fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763953730; c=relaxed/simple;
	bh=5UfLdLz36N6jy+cgiPZv0EbkiK293E7zjZZj2yGuukA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jyet+aqwRft/j1ffdYP9lXAWAM/7gyVydu15a5fH9IjVc5VDsJHzxi0Mboqkls8rFBWGOVlOrVlRTx6Fx7WEEwgKRTCteA+T23Ezq/4lOZS5G2d22Rt1OhXksQ/dsVt+4dCBafz8r8p1cz/bkPaGEEm7uf4DJT8c2MRqv+DNr1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/dUzJ7w; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29806bd4776so5462405ad.0
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Nov 2025 19:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763953728; x=1764558528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UfLdLz36N6jy+cgiPZv0EbkiK293E7zjZZj2yGuukA=;
        b=l/dUzJ7whk16BrsKC63vFgN7UijHG/ASwANGpyCQLYjcqRfPerP/OA654U0EyVYiam
         pGCMVUqPUGCkNdCFdpPd6SHSsoBqJZp9PWjRGBYBLHofY4mVs7nZRD4d1BQ0ezC6ZWmg
         ZrXBQVN9VWYQO+XdIoFt03VlovUOPkDOaOVlJhC7AoeflGI4K0SOWL80v3+nIKNDMVKt
         RDOlUqUGIdekrls3EwVHs/bcaRxmMBVHpA7/yAgYaHmdfWRgejL7Y/AxRpvSxbovpGNI
         vtw2uKZwxIONWUY+1ld0TbUEC7R/NxEwTXUcWkxGe4SvOTxBDwm+QoJN99DdVASxcuKD
         iT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763953728; x=1764558528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5UfLdLz36N6jy+cgiPZv0EbkiK293E7zjZZj2yGuukA=;
        b=UNke4YvdpG/9p9IU7AuI/GmF6Dl/zgFTaSVGOBKkQdmxHRSTkXiCNXEo5IU8GuKgGo
         2YIMR6aG4RwrMekjuLnIJ0tImbxgt3jsea4LoinG16EKd55nDK+/uXchYY+4UvjlMJiO
         a0E7r14CgCSHBGuy28TvM5Fek9+9hmAnocHl/nrHcAnLpU9ZPsG906VTU5g1LSybFeRS
         RwigOLdDFhbutMcpd8IChBg7nnlSEpyMY3uM6T82reigr2c+xBV3qSSXwnuz0KdgraiC
         b6SiiPX44+yOQNTKRVk64fyqH9DncNI0XKu0FhTey4spRfF+9JBiQyyGoU36ktvHKY20
         d6sg==
X-Forwarded-Encrypted: i=1; AJvYcCWZGHB970BzfpDwrAqpXY2BND0G5qGtNYv3CmRw933W49QAK7FlaHllNA1A0hgQhlqm6W68OyEHh2u2zqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHUXgyiX0uD4CiMwfE2QpOaSfix7yFYKZz3NNX4h8TSwY1mUz2
	hx1+kRocbpasK2ic2zz5eVPdqw0w+fOax2+MpnYM9XFpElWKm3sPNTtVY8cvNi0d4zXcQSiG8tO
	o4u9dxdx1S4r7JC0c/G1ks2FhdSoUmZE=
X-Gm-Gg: ASbGncsOqMZR0cSEbu5audaCbIrVVLETd3QYgxFbkM845cvmtqS4zLjNmhht70kS1OR
	2KhaPc2yiqsJMrpQDn8ZyxAXLPOkL+KHlJKlivtgz9KrSitR6p8Xj+y7SSORhh+qfPOlbb4InVZ
	IitlxelFPcOaGAdXNJ/IG0xQ7Ja57ov6aPOxd1f4RRyGnA9F1cbRkKi8Ydrrx0P14XYYcRChG3M
	W+eGi3NPWRQkgs4c/FZjOUVR3oFGP3mm2lA3BnfvlMK1G3SuBZA8TkS7Iy9l4C4Ctjghfy13ZJ+
	WfuemxPyNAKuTOXLuzy3iAkYYBYMkl9MKB472juWAVo+qEpPQDIYW/L1UV0nbmzrjGq7rVd0INk
	L+oDrVNS8zHUuPw==
X-Google-Smtp-Source: AGHT+IHODcnccPs9iRgVIOwlcuA2DDRG3ls89WHmZSy8djjz85e63ugOsI0kgj+n0Sr7cHyi8QYJvH0K9Tj0s1pUI8E=
X-Received: by 2002:a05:7300:dc93:b0:2a6:9dbf:bbe1 with SMTP id
 5a478bee46e88-2a719324a83mr5922485eec.3.1763953728292; Sun, 23 Nov 2025
 19:08:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
 <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com> <CANiq72k=XXRR6pw0Uhk89dmRHFYan6WzJhnDTC0T5oMYAaNnZw@mail.gmail.com>
 <ef617970-5539-400a-8717-dd96e82bf271@gmail.com>
In-Reply-To: <ef617970-5539-400a-8717-dd96e82bf271@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 04:08:36 +0100
X-Gm-Features: AWmQ_blIu7x6QT0VZIH89GBJq9q0tlaW_UfH33KPy6C0uRHf1k8ZydlwBKRhGvI
Message-ID: <CANiq72nDpBodFh5Zqy2p9jwWyfAiY6KcEEyugHeMDEmOR6Rogw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] rust: add a Kconfig function to test for support
 of bindgen options
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

On Mon, Nov 24, 2025 at 3:42=E2=80=AFAM Asuna Yang <spriteovo@gmail.com> wr=
ote:
>
> I will separate them into two functions in the next revision,
> `bindgen-option` and `bindgen-backend-option` (or `bindgen-cc-option`?
> Which one do you prefer?).

If we don't need `bindgen-option` (the normal one I mean) so far,
perhaps we should skip it. On the other hand, `rustc-option-yn` is
there and is not used either (it was added for consistency). Up to the
Kbuild team, I guess.

As for the name, no strong preference. `bindgen-backend-option` sounds
good, but `bindgen-cc-option` is more consistent with `cc-option` and
probably easier to understand for people new to `bindgen`, and anyway
the flags we pass there wouldn't make sense if the backend is not a C
compiler.

Thanks!

Cheers,
Miguel

