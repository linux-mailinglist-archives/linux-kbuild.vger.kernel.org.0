Return-Path: <linux-kbuild+bounces-3559-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10060979859
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Sep 2024 21:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B72361F21C9C
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Sep 2024 19:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEA051CB302;
	Sun, 15 Sep 2024 19:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYlazAxR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8338D1C9DE4;
	Sun, 15 Sep 2024 19:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726427404; cv=none; b=O2aIy5Oc+NemkNZqnkB2bdb7z6fEHbJUOBEYKgIVVHZ1HvIlEvMFViyerAjFoIXA8vEVDikZaP4IL2hH4ZXcCVaSvAwKm2JUgkFHBXe0om0WkyNgLggvCLByh8374TvO7bVd2bTlQxXK1WCeT07aaFXSU3eJNGk4MutApUTzJvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726427404; c=relaxed/simple;
	bh=KthhJUxErMTV8mK/R6Ep15RHlCqcJET5OtZbnktoRvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EhY9Mu8wSO/5skvSePE9T8FUc8e1zT1tgsJfn4iKb1Gf5aYRUskQLy8AyX4oGp1JXL773oQNZZJj/spFv33OLqwRdSvkeANwArbd+Ss4C9oLA0HjkEvs5klvwdXp8QtxKlnwmzD81bYrnIhVsoy9uvTaPyQQxlTUFFSCoUykedM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYlazAxR; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2d871bd95ffso733538a91.2;
        Sun, 15 Sep 2024 12:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726427402; x=1727032202; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KthhJUxErMTV8mK/R6Ep15RHlCqcJET5OtZbnktoRvw=;
        b=LYlazAxRalp+HdVyZ4KRoylYlcZ7/3KDIPqFwYEZaQAh8oICiYHwdAtKz6UwkTfwHh
         ztWl1IXtuYZFFnq8ClArdntYojTw317ERo5Vs9K5rAVl/GenCBzDSNnXj2Xpvr0xtAog
         14abhCO8jpZ3dhKS7eQgcW/4H8oTq6/jDFu0WoPaZgOiWxpzgKX0zsR/CdQD534pnjXN
         HnU4yvAkgyrlC457Z40e4Nqn5zGr4lJ1rWVKw7Ncj0WuS/1qq68jcFleRsEDxC+1U0gm
         RmLfPKTHeZqLLX1RQZTX0Ndee56pm31baNm+o5bbqG5Np+7mgEj/V8JvUlm5nV08mjDf
         I6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726427402; x=1727032202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KthhJUxErMTV8mK/R6Ep15RHlCqcJET5OtZbnktoRvw=;
        b=S+9CDFgJLk7AScvowmtxSUu0+i5I4fQ+XBN1TZAN6XoK++2XdtPfu8yRTTxN79pt2g
         S9uqC9Y26FRDvpxDNWXuc6alfTGAawToURBDnUDWcty+b4xdON6VQpRnmz/JXpEq0pX5
         8j0EXKorSoebdi4AOwZoTmzh2IHGnnSSbK0b5hZkXGIS8RzVzrUSVbjkgHrOX9dsLW75
         JRwqa5Ig92NXk1W0/PxSkHj3A+wOUR/u3Mj8xxpXVQrDwHOQR3srFc8CDwArMh07gy8A
         yhre/B/AKaxCwyCzoWYxG4K71d3k1NMmsM+4p1x8UddjnfH87vi05B5bBY1n9CRLr1n3
         3kIA==
X-Forwarded-Encrypted: i=1; AJvYcCUycAHHcTCgDgfntSEywO2oe2hZQDdeara98zSrcT+3wY/dAmseYG5eQw7zFKAzWU/5xvO84v3PP2E7cwM=@vger.kernel.org, AJvYcCVFHkqByUQpaNn8jpVf7zODWCxwvJtLenZyDZQdW0w2RD7ELKAPwH6i16qYXVrrpph077a+iugojDoe1QM0@vger.kernel.org, AJvYcCWd3KAKrS0AgW0DCTa/kiJr67tIPfCtc6u+Z/4JH8wKW9VZ14YcO2mOBZKZYkrFR++HAnYtJS2bJNu5CcehIpk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvhe577ZpdXCxk1R1qScpbf/WNsC28B8EN27lZS62Qo7a0RA3A
	qerXPEVu309IG7N/I3CSXBHh6qtAwmedQ7lUtZvRvbdv38ZBw5c0Svp4sKV4lbICKD0s/Hr9jhK
	KhcuBMVkINk3rd9WZ0LDUjV67iL4=
X-Google-Smtp-Source: AGHT+IHJCyHVLo6CxdR1pY3jsGZ6+Z2DBq8+QW2XlLHwcoCLr9oAbVS6Jx2z/mIg9ezWRteIQrG5dwC3NKciZGVohw4=
X-Received: by 2002:a17:90a:578e:b0:2db:87f0:2173 with SMTP id
 98e67ed59e1d1-2dba008c8b7mr6165324a91.9.1726427401849; Sun, 15 Sep 2024
 12:10:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801-kcfi-v2-0-c93caed3d121@google.com>
In-Reply-To: <20240801-kcfi-v2-0-c93caed3d121@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Sep 2024 21:09:50 +0200
Message-ID: <CANiq72=CC6S-HxAftniYcFeFVVZB4oO2dvMc+P9u0LuNgDRDEg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Rust KCFI support
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

On Thu, Aug 1, 2024 at 3:35=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> The control flow integrity (kCFI) sanitizer is an important sanitizer
> that is often used in production. This patch series makes it possible to
> use kCFI and Rust together.
>
> The second patch in this series depends on the next version of [1],
> which Miguel will send soon. It also depends on [2].
>
> Link: https://lore.kernel.org/r/20240709160615.998336-12-ojeda@kernel.org=
 [1]
> Link: https://lore.kernel.org/r/20240730-target-json-arrays-v1-1-2b376fd0=
ecf4@google.com [2]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel

