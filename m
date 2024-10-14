Return-Path: <linux-kbuild+bounces-4117-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EAA99D990
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 00:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3844A1C21023
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 22:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DEBF1D0E3E;
	Mon, 14 Oct 2024 22:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fX9BobGQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243FA1C8FD3;
	Mon, 14 Oct 2024 22:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728943311; cv=none; b=JylPH9RkBjyADxHsvZfSnaTx/TvITtgHJQDlBnoIcFWGBc0mVh/UV1ZipKIBf+DjS6hucWTnjjYC37Hb0ufrFtTbzPlxtHZ3UYiKjuuYRYBpqLoHrFdX0xpnoiWVQA4uP+BeabV4Ds+O9O1ARQd9kbnsD56Oc2cf9njhBJDBjE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728943311; c=relaxed/simple;
	bh=w0eH7wHm5QrllrptMfPJ9Ae95nzstT4bo2M9ylaeA54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKu+03eCBJbOukQWgvUxw2uKhPXfmmggCBQrw+pHuQ6xsZ/de6aMgfBwlsRLWvXAL/mRRycde+9yHajMmZ4iLcWjWeqFj+TvtA4+VHwXERecRt1S4qaJtGSdXSoCda06c7YZPkl8MpCvKeMQ5AlpQtngpvt8UYsyaLQz1ExEwpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fX9BobGQ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2b93d2da6so413468a91.0;
        Mon, 14 Oct 2024 15:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728943309; x=1729548109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0eH7wHm5QrllrptMfPJ9Ae95nzstT4bo2M9ylaeA54=;
        b=fX9BobGQKkwnk6xj54HjKcw+AB85kJKtQLymLgx8/seZ1EO9s7L8LH1tqMRHpIWH6r
         6DeQ2lXe8NBOxGb2hhOcmpm0X1NNV2oEkSolVt3laPUukUD3PaicM7j7l3DgreoSWlpm
         TJuqrKJ9NcmBv/iuyW/0uFyuY9GFeb+XTsGfzuuPV4Br0X9Hvruvqd7Aj8MtSfFyNmYl
         SBSQeAFQevTTLVhBy4Z3oFzy7BA+1gAGRxMicxuDER8/dOVZYxx0wWHcLkTwhvCtOhgw
         ZiyAXiuXI90hve+xfFPI3nmqj6fBFvqKJjnBjiJN1P/EfmPdrTG0mkSTgyohQ998Q4oO
         zd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728943309; x=1729548109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w0eH7wHm5QrllrptMfPJ9Ae95nzstT4bo2M9ylaeA54=;
        b=sRitN6wcPeZ9r5n1i8MkaBONYbw9ogx4up1VHfrSx/fWcQc6P2pQJTlx6IHiwSBmSo
         wCf0zsGNUgr/aJYGuJjHTyzGmW2ieBloTDbNiOqwMn0+29ovFWzCjpLVlT3WDKNWLS+J
         r9ufP6R4QK8ZwqIiXR9vcxKZU9VqQp0XGLTqi6f5n+2I9bpNWcxuPrdPYcINtwtd/fjr
         CDj3G6FKNTF7INpf5Hg8qo95V53ZSsT9z7DVneEPRJLCh2yd7a7o61l9fc8cJy7K4wJA
         OZgnfZzUQ84elRVIsxEyBbt1ojtitCS7PJ+jM5P79q8les8g3yLHOtCT+hRHURLkTVoB
         Wu6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHf7nONCsopF+sZJKRFQeq/7dojKpG611xvbMO3I/x3pzxym8dnr66YXhJGMDIXg+zhve0R+hViGI1j171@vger.kernel.org, AJvYcCVl7rA28xal3MHtra5wXSOlG4hvvBAVN1PBy5FaxiYLxIPPr6jAbQGJkDemwvRyAYGanQOYf0lB4SdVFVs=@vger.kernel.org, AJvYcCWIbAyRZUXozy6qBbniKf4r7vX3Kw45ezAPwYLBgXyYe/JS4b7vNV6YRlI6GllNOfu4/0WtT/FSvEqXwYlpzpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT71nDvh7sLuR9+WFsGbr4jYrFTVtFawNyyATjJkYgB0glS8VJ
	npHV8UJSVjrykDbXQCGBB7Jek4ydiOxuKq7I0VBEo1s9X11enpjGLUuoqlJvZb78v7qJqCdqFyx
	F5MMbRVKl554hZZa0yY8fBPi8kvc=
X-Google-Smtp-Source: AGHT+IHnhxAVDkgOT+mi3KUK6Cy+WclA3bv9+kx3a7Mh94ckcLybBH6zumPddcBSCiixnkz1eRryDdvVpcVyG6Fobs8=
X-Received: by 2002:a17:90b:1d01:b0:2e3:1af7:6ead with SMTP id
 98e67ed59e1d1-2e31af76f40mr4797130a91.5.1728943309364; Mon, 14 Oct 2024
 15:01:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com>
In-Reply-To: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Oct 2024 00:01:36 +0200
Message-ID: <CANiq72k9h2iOgmfG82RPtq2EzwhRhh=GUDm+WF0PJPxPFu6B1w@mail.gmail.com>
Subject: Re: [PATCH 0/2] Normalized CFI integer tags Kconfig fixes
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 11:38=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> This series adds a config option for the LLVM version in rustc and uses
> it to fix the detection for the CFI integer tags constructors bugfix.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-fixes` (using Gary's alternative patch) -- thanks everyone=
!

Cheers,
Miguel

