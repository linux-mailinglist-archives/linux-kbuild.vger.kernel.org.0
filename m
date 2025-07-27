Return-Path: <linux-kbuild+bounces-8210-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD90B12ED4
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Jul 2025 11:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D467417964C
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Jul 2025 09:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5B01F55F8;
	Sun, 27 Jul 2025 09:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIEeyAZM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C2B9460;
	Sun, 27 Jul 2025 09:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753608708; cv=none; b=MrjZUk6+EvWgEfV594h2T47w8p7om0n9COn4LjgdUtcY59D2XgFdxMEBkZyreagOS13Gvrgt1FOHiFPC/+9pjo5UfaR23RUKPZaM2mi/Kop1/7CJbo0RpYZDFPIOcduG17JTTx/I3ddctvT8WYuib4UG/k+fmPLili3j8j3497Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753608708; c=relaxed/simple;
	bh=gDbSYc8pmLjUYSA7KcBarXcm5lMdG+b1p6ndEBx0i3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DvLAxFWKcZn6RS9TQX5iR6f/Q/bOJuWeHKxrHWoiurG8Ky5UED2qA6WUsv5gS1rywTGLv3XJsEVdfrvBD662A9Qe815TBly0mRjL4TA6zqr3gt0434yT1r+UDGs0oyOvnig7qnTLtA8BZAj3tCrwW/HZUEfr9VP8X3lo51iAXec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIEeyAZM; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-312a806f002so421750a91.3;
        Sun, 27 Jul 2025 02:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753608705; x=1754213505; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDbSYc8pmLjUYSA7KcBarXcm5lMdG+b1p6ndEBx0i3w=;
        b=hIEeyAZM7QmDwMRCPiKrz0m1kzV1h0tW+6T6blLr6pAksAKtpo9cfUUGmbeyuUZe3C
         PTMB8LsnKC1eJ321lF7n2xkon2zC3MdXHbPrIOAM8512+C+o+mBeXEfbPOX6ylO2HciI
         rhyds3kYt6S2I+2nZPQxUoUEfOeoPEzKVLPojf3jnMURLrQoHMrJLsJsMKWPvZ8NjbJA
         cP74eGDuT4mwhcOl5cIq/j+zP63N7Fhw3m2XYijizVXfvPd71/n4DfaoIJpSNS9DHK9Q
         IB8M+n8QgG0LKWDJfxo5l8Uli5q3WQaD9rtGYfvcwYrjnIyRBRiFAOW9yO6G0p8dzkRl
         8B0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753608705; x=1754213505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDbSYc8pmLjUYSA7KcBarXcm5lMdG+b1p6ndEBx0i3w=;
        b=IfZZExyRGtDnlLTVcIjYr8TjGoOXwuRGIExtUp6d9mDHc20ppnADkoXZBvGBjxhfKZ
         Qo8y+owS2MV++EfEqCd51W26bNQjyIdG6UpEF5wqHZXxktTVDk4BJZoUN4ZQtm+TO+sm
         p9jKfmzjiz8UK98I7zpREV85a9UvXP1iTDMWdDrVCk6uJkiKdj2ZzHbBd7KwMQl71xV6
         FqjgU4TlPhqNfNWM8E1A0sAFtedDLzadvh7fIu6GagtErlBpFG4I6p2YP7iAED0L6hvV
         LecWpHoIzwP214P+zuNrwRmjUiC/wgysVE2irnxhCM13TfXtmz51qnYk17JwR2gGTfT3
         fqCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYqpyx7rTvAG8+n3WcUdtIAvb01GTDkcDN6+tU5f1YiaNGDCVm8mJ7VD3RO6MkbQZ/dP8uk2cHgs5oSUQZ@vger.kernel.org, AJvYcCXahPtc0HuSOyEwt23t2awyuIzAArx3ToyYOH/P+eYjXFZlrN7SETnOI1mKhAoM2OsMAzFG5YuFo55sAUM=@vger.kernel.org, AJvYcCXrEd7yLVOps3qvsIKERv2gkeHuU3aPsdVy947sMyu7J6KKK3umjqThKkMs64u39j5bVc2/u4yBAZUDN9sAEnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRxb+dKO/+180jW1VNaMWsHvPrZa7VLbFtiegcft8YnRuHvE66
	mX98jhnQZnpY87aSR+4oaJt1IEzyhJ4BosD7u5fcWofChGEIih9BQBymdFZKlquiprYg66EiGDv
	sUbdvzOzqmlZEa7h2MXgCaoWQeuvD/PI=
X-Gm-Gg: ASbGncty/1WsE8iOL87QlDeMB0E/Neb6rSEEd3wnJ7/zAWvafOfBM6X76GpRQAkrpoQ
	Hqdpv3Ah1splFEzVY7Nk88/YseX0fFbNu5vgYiJ095K4gq3KBlUmI8+MZd3m3Kj4fWPr3Xs5Nd0
	hXwfCgTLGow1RlB5qgErKyCVvtR3z9FBepEXVnc57mnpDkDo6bBffVydU8qU+YvpeM06PDXXf8Y
	PDV3nfp
X-Google-Smtp-Source: AGHT+IHwyqPcMJ6XaVtzcngEGA52+QC98OcB+ztkimhreGhuBj2aWm4Lacehn7M3roIqN3sGDv+fQ22VOSX40WhoM/g=
X-Received: by 2002:a17:90b:4a81:b0:31e:cdc1:999e with SMTP id
 98e67ed59e1d1-31ecdc19b15mr687988a91.1.1753608704960; Sun, 27 Jul 2025
 02:31:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250727092317.2930617-1-ojeda@kernel.org>
In-Reply-To: <20250727092317.2930617-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 27 Jul 2025 11:31:32 +0200
X-Gm-Features: Ac12FXzSNfd8ysAf4soSdl5HrXnwH9bMPWruUS5fZU1uCrkYeE6TPwm812nNyZg
Message-ID: <CANiq72=Y3i-WeygLix6j-sPZwE2QTOkaZDQOrED1aCiMoH3Cqw@mail.gmail.com>
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 27, 2025 at 11:23=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Closes: https://lore.kernel.org/rust-for-linux/36cdc798-524f-4910-8b77-d7=
b9fac08d77@oss.qualcomm.com/
> Link: https://github.com/rust-lang/rust/issues/144521 [1]
> Link: https://github.com/rust-lang/rust/pull/144523 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

And most likely:

Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is
pinned in older LTSs).

Cheers,
Miguel

