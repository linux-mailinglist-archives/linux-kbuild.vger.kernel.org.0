Return-Path: <linux-kbuild+bounces-5418-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B52A08E6B
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 11:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47D98188BAB5
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 10:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0DC0205509;
	Fri, 10 Jan 2025 10:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lv7L4w33"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAD1205516;
	Fri, 10 Jan 2025 10:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736506088; cv=none; b=f31N9SuoB0u0STPslFMsK+fifA96+KyQTTYlHYbLSHjGMP0qOMkntgZ1FuPweo0K+T61b13hkBoOPwv7Q4N9OT+TNQ4fq8f0j6DANkdY60gcR/bc0DRugfmvXl19g6XAUoTdNSJgnybgTWt7mditlc41/CVIqIV1NbFsY0bHKOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736506088; c=relaxed/simple;
	bh=lFsbb417oUics3zVCdYv/wYNs/27UThiR2O6185IXmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DCLI2sR/o+084+JLAt0CSgawBuJm/7SqKHs5MtFyy1MXelh90W/2ocx8Q23591A8VmWKQ1NT78rurJWQnnrwm34PzcZclXB3QS9b0SdpOh+4TEqCQi+fp9tWkKWxvAIinfaoPq0sdR5NqxclyV309M/U0hdYqXlXvUjpVDsan1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lv7L4w33; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2166db59927so3263425ad.0;
        Fri, 10 Jan 2025 02:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736506087; x=1737110887; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zx2ZsFmqjuaHpA0ezy+PudV4xa2ISEK5U5ZpNdaLwCI=;
        b=Lv7L4w33hvEfDrF3aWEZZXTs1aJuS4a8pLe+tm2+SUtgYVwbiWj2Np77jgWg/muChP
         VyURDqoj5+4UYhkg39f/eyq+MO+p4zaYxO84GulyEcMMDywoueurpADalg9ZTXtHuogu
         lC1wW3GFe3plRYMtOUGfseFFwcpkgENYIzA1XZz3hKUFA5I4/27qp9ep+EOPa47q9S14
         8qOFa4xY6LDHqg+mUD3ERjg/1qR0ncVjMLUEIEifMAfcT/d4M3UauYYhWU7oNlgI56HZ
         aXSERTd7oLtbT9g2/Asp/3n184Dhe3xLh7xPqdEBVjwpc1wrLhd2hRHCHXBoePaXUA+f
         gE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736506087; x=1737110887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zx2ZsFmqjuaHpA0ezy+PudV4xa2ISEK5U5ZpNdaLwCI=;
        b=LvS/UwC89XIIDTG3kpzXfTTNd+wtG+elJMoQZhu2ExpLQt+djQsqCUVwkylmLWUdBp
         u0brHaoxM8KPtED7K2S9j0ip7+zUZjbtkljo4Ssz5daVWY2lp750ee6HOPM/toq/u7ro
         UzoRM8c+F/ypEe2mNJKesFHzvnxLr+ITSVzeksUDANOL9fkaRygp/9hDy43uW9KCve0r
         i6YGdbZ2+uoMGtR9U+z4bDB7aishcGy7CkhYvt85vNIueQl2ZiZPgbr3k74/CB6Lx1uK
         WVmxX7MoQewBAuO4zefizkGnlGnK+S/XZydW2ey6VVciODfd2OR0CntVbVT391lKFlNn
         6ZWg==
X-Forwarded-Encrypted: i=1; AJvYcCUxSLYhRsnHMRCSEh4LEm8ZwwojRO6R5261MFcJANn0uBBftcqLl9XeNF97R58m88yhGAOZPGeesODyzyw=@vger.kernel.org, AJvYcCVOuVj1fZu0smTW0L4rIW2pLRCs80y8mSJIdIdRMgweTnfC5H1UqIDTXISJJyp8Qb98/hYIJqXY7g4KI2Gb@vger.kernel.org, AJvYcCXfTM1KqCpn86hp1xU1AeRSkF1ozuBx3RkFD6l6rroqtv58s2oGNx0pusi/rwe++R+5q875ir8xji0lxAIW8Yk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYqzgOq7wCiyemi+s6kUqTbM+BiEyCTx8g4hspFcx3Ftp+nHMH
	Z7kA6WnU8xePVhS+8iOyo3fFW8rDrKI5ZgL9/swlA+wN+oSaHsixh0BqW4JVnhyr2PTlG7bhqaK
	8R44rbOLgII+PNTbR5FbAw9lZW5I=
X-Gm-Gg: ASbGnctbv3OuR4ZOImtUA8QoQG7/KxNTrh7NkR7W1tVlQr+q19RpJfFhMxCHG0RQKCN
	7zL+juQ3e6n9Ouyw+rxPUGCQd8UG+wrEzqbETYQ==
X-Google-Smtp-Source: AGHT+IGyf59oV/p6cf82Eqcgec3+B7VHzkc2+S771jI7beU0/V8LGFATlaU1f8mNdYIncIjTD5U9TITdOOKWL+pwr3A=
X-Received: by 2002:a17:903:32ce:b0:216:30f9:93c5 with SMTP id
 d9443c01a7336-21a83f4c434mr58642955ad.6.1736506086757; Fri, 10 Jan 2025
 02:48:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216-b4-dylib-host-macos-v7-1-cfc507681447@gmail.com>
In-Reply-To: <20241216-b4-dylib-host-macos-v7-1-cfc507681447@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 10 Jan 2025 11:47:54 +0100
X-Gm-Features: AbW1kvYFtM9gpvVIEJO__6thh4bP2NWe8_9mFJDHvx9YXvcc5OZRwWyYQtXA5ik
Message-ID: <CANiq72kk_HX-vcCrj0rvaajPv2v-7w8hmQb8Rw4Lo04gB5eUDQ@mail.gmail.com>
Subject: Re: [PATCH v7] rust: use host dylib naming convention
To: Tamir Duberstein <tamird@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Daniel Gomez <da.gomez@samsung.com>, Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 4:54=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> the appropriate name for the artifact. This allows the kernel to build
> with CONFIG_RUST=3Dy on macOS.

Applied to `rust-next` -- thanks everyone!

    [ Added `MAKEFLAGS=3D`s to avoid jobserver warnings. Removed space.
      Reworded title. - Miguel ]

Cheers,
Miguel

