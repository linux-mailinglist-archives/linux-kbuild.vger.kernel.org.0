Return-Path: <linux-kbuild+bounces-4342-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B4E9B1F3F
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Oct 2024 17:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA41E281740
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Oct 2024 16:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284E71E535;
	Sun, 27 Oct 2024 16:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amt0RwSd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C4879C2;
	Sun, 27 Oct 2024 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730047418; cv=none; b=dq3TUPLNNVlvn8zp9liOviJPJdnUW5gaagdeN9ihib2FSec3A7EhPYu6dYehvNGTuKH3L19snR/7KJn4+qeOJDza8qeJPLpo2X4M3lAGjBvz21vrAihmbJ8ioeT9fv1VBpoQmUvH/k00J0kMQGIm5KUykX0TCJAWh+TJco2xwZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730047418; c=relaxed/simple;
	bh=FToPc9S3BvAs+olZK1wmHntHHxz0Ujj6LAuHXsJCEH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AORzbpCNyn7BeNXDQl4iwrPac+Lbcsk10E69MiKJ3ulQLhVqz5G5ZBJL3ioFHYnYJnEzQQK7mPQJ11jy4wUbDgPnTWuHrctNHG23TFerMzt5uzF5IA7M6hXzcqmZ6Xac+SNTF1fKXIpPZ5qeE3KiTKYb4rdVYw84jX5Xm32IDAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=amt0RwSd; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e2d1b7bd57so593856a91.1;
        Sun, 27 Oct 2024 09:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730047415; x=1730652215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FToPc9S3BvAs+olZK1wmHntHHxz0Ujj6LAuHXsJCEH0=;
        b=amt0RwSdlpS/jCqglXoO9yO0kFjthVYOjcC2aktl/TWfLKuS2M3YkXjpSsSjQFheiW
         exoaIAr5cQbcdgN5Fys2mmxG49XTWgtCMYFVUDOa9+C+EttDqPHlQKsQ3Zs+aAaQ8JCb
         oLXy8Rv7CMlIMLym1R+aaou1e8b9wZvzS2rOle414O+bsIrpr1Kn5EcvZkyKaBhV3V5l
         w4bJIqRBTjXH/y5cnupkCNZ+nJvK8/8EloVl7YLOSwwj0cbNGr9S7hIcPX0lHHol0fHK
         sFzpM6Nvek4eXbAgkDr3Sb4F+A0rGiaRJXeRF5vHYg2fXltEydkxhL8w88gjrW9QOfV3
         nCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730047415; x=1730652215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FToPc9S3BvAs+olZK1wmHntHHxz0Ujj6LAuHXsJCEH0=;
        b=h/axr0a8ErTnjAc+VOe1UK1Cyu9j/Ac/+xgSycU08L5XEgz3QZe3ujJURPpWkiv5Qe
         Ty4SVqiAx41RXAbuZGqa7eBY7/BoXiIGw0hESnI0Snada6VeqWFEcwVwXXZPcvC9BQA2
         qclBcmzaOoZe8qk338Ivcck7B2PgXSgNOvoPR38qeEl4+RZSFWi+y7WMMPHSDTUE/bD3
         ca/nbPIwbCa8ePhfuZ8QMmvrXLW82rWPEwRY8wOiXmaTgddQOoTtllb5VIhUKCYdChfh
         MdG8kN74qhW4lVcsmbE5XuI9IFRvUyx8b+ohlKdcoRMa4NBverVuNjBmisClMksYM1Hf
         G4Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVMHCtI8iYWd/CS6JbCAxC2L50lXajnhPq2umbV8y3e58RA+k7vhPeJaNV19Upagsc+J8s1oXM+6LxwYbQ=@vger.kernel.org, AJvYcCVcgm2Sz/ZYjUQv1PzFiaUB16Z77tn/yHWmzLEpN4aUaz+sdN2cWOLbGn5vlrEXq0nN3RnFqFO9eKSgAMV8WSE=@vger.kernel.org, AJvYcCWawLNm0lDFWwT6OTqRbpDDr8/pbxVWHWUz7zc3/OFlynDqXnqOz1WiU/3JQyTuw/rzVjWgPhXD+CVO2NqO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4y1k8o+SEoiTok3g4HkaCUwlVagPoX12HsEa2dtyScZHdgZ39
	p5iAA5mWwT3bhNTGbDh5fU7lPRsWq4b0Vkcw1BneezgUCkFhJOExsL+P5hrWFObTX8/pxkadsxy
	o8jgvIxLIvDQIBsekt9sEYHEheOo=
X-Google-Smtp-Source: AGHT+IEt4zTtT+YS5nnZcPgirbh4CGz37SQraslG7OZG6knyttjYn/k8eYR3+m7M84T6Sg7AaLSrP4lE7JfHC6MZuUM=
X-Received: by 2002:a17:90b:3594:b0:2e2:9026:8bee with SMTP id
 98e67ed59e1d1-2e8f12e2bcamr2981552a91.9.1730047414685; Sun, 27 Oct 2024
 09:43:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241027145636.416030-1-ojeda@kernel.org>
In-Reply-To: <20241027145636.416030-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 27 Oct 2024 17:43:22 +0100
Message-ID: <CANiq72mAnkzDC+obtFt+i-x2_jkMpKgObJFURu-9ksT6tVHneQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: avoid errors with old `rustc`s without LLVM
 patch version
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Thorsten Leemhuis <regressions@leemhuis.info>, 
	Cameron MacPherson <cameron.macpherson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 27, 2024 at 3:56=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Thus, instead, just make the match stricter.

The fix was very quickly confirmed by Cameron in bugzilla -- thanks!

Tested-by: Cameron MacPherson <cameron.macpherson@gmail.com>

Cheers,
Miguel

