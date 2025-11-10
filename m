Return-Path: <linux-kbuild+bounces-9518-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9DDC4721A
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 15:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A27BC4ED13B
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 14:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A29531283E;
	Mon, 10 Nov 2025 14:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKC+C/RN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0781313269
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 14:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762784438; cv=none; b=Ha3EGO1lmyLRve8oAgE4LvrL25AGA+HmORIaOVXiX2htzTSD1OeqGFIympuNmfvmAZlqheq/7/LVgaDkNksxijGaBiL8i+I2MBzWZaDqChq2lEDqZVA3Tk5K3OSV+2IrBIuRb2LXV2+53l11dNogC2PlqZxLD1vD2sie9liAge4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762784438; c=relaxed/simple;
	bh=5RJhHiiCQwpWrTvgzqpoOfkmMP+cjTCBSE/GzQfeUmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ikp1pQVF3rkrhwSHRb5K43cp6LtSWrt296MssQat2b8eioKJK2IYPkJmJFHi+cGJQup44mZsz5FivJasuHCW4iGjOS16eYdp56Olu9ZLdlxNExVM2EJ5IPPVhq5xrO0zgUVRcPVIQFyOE8+USaxWAsetIVHuKUBYIrRBLuilQCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKC+C/RN; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-297f6ccc890so1116175ad.2
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 06:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762784436; x=1763389236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RJhHiiCQwpWrTvgzqpoOfkmMP+cjTCBSE/GzQfeUmA=;
        b=eKC+C/RNcmvF9/7kIronPyxyv0c4XMQUhOnLeLqCjVccI6SdWmDRHSFqwlx4uH9VX/
         uOIW3UyFt5hgeKdgB2PLgMSqF81ew2KlYDa8VegWS5nLBdK+kujRMsCOAj1YIOQSPfvM
         LmUjrTI8dFCTlnFKfg0+z2hDEGQwLY/U2TpVtFtCOIcjWtCH/qL6KeTcpXGbVxpkLr2K
         928OiyoRKMwm3mVXkcyrN6myhaGNLdbZ5RnUkpGFbhAY1Ri8TihqTojt2FhkpGD3vHhO
         nRNJa6+oovjzXglYDxo2KObrVHXJU8icuoleIYRKQCtubnxgLuKTQ2ejGpYSCDV4SqdT
         6r7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762784436; x=1763389236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5RJhHiiCQwpWrTvgzqpoOfkmMP+cjTCBSE/GzQfeUmA=;
        b=TBB8+2KPxf1gRF5+ixssxHp0UjwgiMuLU1KnKVWyLOPhPFMLXFhSt/subc/gf08hkA
         WTIU5xA/hWqTJeXFnuT7w2jy3yRdrOhiJBQlcxtLaQ3Cm4iC2ar+7dyhtHWflkHEE4H6
         YZAKRp692FTR+/Pl+uF8lNoB0+ZlnNWMp//uxoHJVJsi3hc27Oha5DSC4g4z9tn8dohq
         b+a1GwtrtDCATokQzTZrzDoD4aBmmvSo/rM1gK8LvrGvMuPHPPZ+ZbFe2JsjYd0dwIE9
         zGQefO31p1n8lPICUy0dLQeXQdn6ZfogeMsS/Jnvc/jLHMiEDjgsHPPvH/nMQ9Q/OZFX
         bjag==
X-Forwarded-Encrypted: i=1; AJvYcCVT/Uw0MIc7iBFNK0R44JQo0HZkBIHt1aibGHViTWwdFXM6zEgEIENW5AZozzq0hKNiiPBgWgs4+lbBVws=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN0SoaTuk5hTkigIUEhli9A6CrLWr+JpUdhkXx9kO7Cdd2Xuks
	AhC4QguCxNzzxd81WlqcWD/Yyji/eaXMz2pVt+spriHNsbDbdoUnPGQPwRiNiRbOT7R71N8JtAX
	zC5oKacvDbCBcmb62G+jx+UYkLbOIip8=
X-Gm-Gg: ASbGncsZrYayPWExP0UJ3NjPyzR1Dy84CUwIeh3hGAVQddfCAgegmg2Ka8VeWMJq1at
	d1eEvXriBcppy1o0KDIaSIbyeOGP4uoKuwy2W/RhJwS1dx7KChmM8AVUI/6RjjF+Pff+9pz8edq
	X1qEqXykxRpogxssflQhr2ybQp3U7FwBcHnUI8b8M5ipweFjzFJSLwvsVSg8fL3cWLSd0bPl2jv
	0fkbWelzz+5EPb7B2p8fYoi8Ck4kMJtZSB1+nnZrBb/t1a8Rai0bqRP3xwWTOkdQRgqVkkGJGr0
	70lXpOiug/Mjb7Nb7uIwQ8NGYyOixSO5cBfBWOYrYQBvTyVOzV3+bqVuRM2J8FghoWX6cMOkZqC
	OLtQ=
X-Google-Smtp-Source: AGHT+IGZkiX1aUs0nv10YP1XlBKx2b0IQf5b14V0qJA2D3DBZY4ttkzgbksRaQa0wfRvU24Ndk4q5iwI6HlbKZJm+ow=
X-Received: by 2002:a17:902:e353:b0:297:e604:598 with SMTP id
 d9443c01a7336-297e60407famr37566705ad.4.1762784436127; Mon, 10 Nov 2025
 06:20:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110135927.05d83da2@eugeo>
In-Reply-To: <20251110135927.05d83da2@eugeo>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Nov 2025 15:20:23 +0100
X-Gm-Features: AWmQ_bm2tVFpKh5HhJeEvZYuh2tSSNBK7puyKDd5qGaAhmDUcRORxxihnStSDk0
Message-ID: <CANiq72km0fyL+ueULZZCcg+2Uc5HTtdE_C++WfigLFnqE4sZ=g@mail.gmail.com>
Subject: Re: [PATCH 00/18] `syn` support
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 2:59=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Thank you for creating this. I have been wanting to use `syn` even
> before RfL was merged into mainline :)

Indeed, you were definitely one of the biggest proponents of `syn`
since the beginning! I could have mentioned a bit more of the older
history in the cover letter, sorry.

In a sense, this cover letter could have had a
Supported-by/Wanted-by/...: Gary & Benno et al. Actually, I may just
add that :) And/or perhaps something about the history in the actual
commit messages or use the cover letter in a merge.

Thanks a lot for the very quick reviews and tests!

Cheers,
Miguel

