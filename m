Return-Path: <linux-kbuild+bounces-2299-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6039291EA8E
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jul 2024 23:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 031BDB21A0A
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jul 2024 21:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2FCE171E52;
	Mon,  1 Jul 2024 21:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTCpeFe4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67505171E4F;
	Mon,  1 Jul 2024 21:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719871096; cv=none; b=rzVH+bj/BjkSNcEih5NgJHMw43TxTTQths96JaXdAfRWlbOqFyrFDffo1pgMo6OyJmZPHLZIwp+QRYjnpBf/a2/gcjGycKsVDnIAHQ5X5NRAfSwItWFA7re6dH32jlz+qWG9FEExeRCkf1R8wG1ICvfukdBnUmBUaUAm96NJa5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719871096; c=relaxed/simple;
	bh=PYgsuVyYvkn+AqFLpRd88UBBXKZnKbAdz2lU4GdaAz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gcIU6yqW4FCLyRuYCJrbHU+hZq8gytoj6FUEU1N4lFmrBxnJQDEH6E+fpqNbheXI/ZamGNK09Ze9nwyixKCJSh7S1ObHormLoi4pBLjbz6hy9E+WCljRhzzHGTHSfu5hhd0rp5kQG26MZGo0P7q3xSP+XTQCc/RmR/VVEzziwIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTCpeFe4; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2c70c372755so2310330a91.1;
        Mon, 01 Jul 2024 14:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719871095; x=1720475895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYgsuVyYvkn+AqFLpRd88UBBXKZnKbAdz2lU4GdaAz4=;
        b=GTCpeFe42H3gyvincxUnGaLl240uwbj1dMR1tkoOz/cbgkI2hIaiCsEwftefo0nGJ/
         kal8bqKiM4c/zHHMr41Wb1Sacd/UJ7t/D8eiQtUmfX2aeeMf061ac4v9wJVzrzPgAGeX
         HF34ANtccz9ptYpNRwdAnBoAWqVnwXupRj6VcHA/8oVVLiIBk6WX+QMB/Ijeh53ltW9k
         qkeSkmjKUS2rWGdJ/Te2YFiKH4Q8odDbAU8i7Ju/HAENaPVWTf/lU5acAysQIR8il7U1
         ie/4QW+bF0BuofU2tS4levWsQd81wJuEbpRrl5AR5cBpYTTsmVbyn2N0CdLGEBdFSvwG
         oLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719871095; x=1720475895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYgsuVyYvkn+AqFLpRd88UBBXKZnKbAdz2lU4GdaAz4=;
        b=E7crxG0oeOOFj/RbCbl8SzvPTfb5tyHPdcxn126dqD63ac9NY8/GXXsIb2APxntfoR
         sOIzw0KOe+52oTad3z27oqGpPsoG/LFg+D3SZhpZBL0kJvONwKGSrlGoOn1h0cMOtv6i
         UD0ZFrtsKlZ4RGZx7fGhZUXjanNtsaRbNzD/CCWbUeoyBVkQbLIBuqA/FLFdoZM0zo4L
         gKUHSW2vPt9c7/XjjQ9GV2GyV94gt3v6wMS0bwxbQUxtn2Jy8492YqAcQ+evTek48YlP
         tglGqUvv1Z0cbyTed/bXafTRSprdeWGm4G5Q8URGZVqEaSVuvoDsSNaN/Ce1Et9wDRBa
         AsOg==
X-Forwarded-Encrypted: i=1; AJvYcCUVSurtic/jiRNFGqmgJsLkv12ffZhBJuz2BRHWMGV5jJEaz4hbVOjPX4jdUbHjzz8jwriD9pL9nwASfDJN/RjiL7+6Hhyv30nqT52HDqZXmZfftkJFKpESLAVtiv7CZ+ajhBX9TcSYEsuXJDrTc/Jb9uyDnCdmPjFhFKLqBhdqn/72UhRx6apP4Uk=
X-Gm-Message-State: AOJu0YypDP8Ruoj/ibN2vOKdgwc4kVKBHOKce7Te3U2ZYNx16xBbM9Pc
	Mpo85tXpmJr0GZSlQZOAFFH8vh0S9RY/jb9sZ5zgih2dF1gBP9XY7bedN++irOe22awN+vpbVkH
	p3yUZ8nXkCiVNjge5+wy2EI9sz78=
X-Google-Smtp-Source: AGHT+IGKpBsvB7xlkrEGXyjToca9aZ2muSAK+blJa2KJ4Fw+Akc1Xvvtwh2hiQRXNfmE84QKngmHExcKXXuRbb0D4HA=
X-Received: by 2002:a17:90b:3143:b0:2c8:dc6e:ec4c with SMTP id
 98e67ed59e1d1-2c93d72a15dmr3766653a91.2.1719871094631; Mon, 01 Jul 2024
 14:58:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240701183625.665574-1-ojeda@kernel.org> <20240701183625.665574-5-ojeda@kernel.org>
 <WGFMwMlEU5xZ0Gz_9eqp_ATSk4UiloYSjxQi3JpxZsPQK_HU5S0RYxvLO9KXJEkADsKWKmtDfRYdpAkLrUpprgS2tbo-vIKfAW6Inc-Lhxc=@protonmail.com>
In-Reply-To: <WGFMwMlEU5xZ0Gz_9eqp_ATSk4UiloYSjxQi3JpxZsPQK_HU5S0RYxvLO9KXJEkADsKWKmtDfRYdpAkLrUpprgS2tbo-vIKfAW6Inc-Lhxc=@protonmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Jul 2024 23:58:02 +0200
Message-ID: <CANiq72kQSmbnb7h=Brq3Kr=ffnbxNG-Rwmh=Zr37BHAFB+2mGQ@mail.gmail.com>
Subject: Re: [PATCH 04/13] rust: relax most deny-level lints to warnings
To: =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 9:49=E2=80=AFPM Bj=C3=B6rn Roy Baron <bjorn3_gh@prot=
onmail.com> wrote:
>
> Maybe also keep non_ascii_idents as error? It shouldn't have any false po=
sitives.

I was on the fence for that one too. It is also unlikely that having
it as `-W` helps "productivity", i.e. I don't expect anybody to be
helped by being able to type non-ASCII identifiers during development.
:)

Happy either way.

Thanks for the quick review, too!

Cheers,
Miguel

