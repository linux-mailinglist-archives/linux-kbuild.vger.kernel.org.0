Return-Path: <linux-kbuild+bounces-8582-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1894B3482A
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 19:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34D457B04AA
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 16:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CE92620FC;
	Mon, 25 Aug 2025 17:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rgv0WLyi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53991C84DE;
	Mon, 25 Aug 2025 17:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756141242; cv=none; b=KCSNq8BP71Uoc81psFthXAPGXHfLBYa2u7QKM5qEksuHEUhKNG0xngMVfkdlpF+RYAvDus+z6lqrrSU+3pH22buESE0fJ/fmfnDTyBvJBh2wfnsS4AC0J6sqr5zaNef9BLpBWd1gGrmo7QyMzSH6d9bh8WPa9u4E66ORxH5lbfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756141242; c=relaxed/simple;
	bh=rzQMACObvWiM9uVvHkabX7dVPQNESJ2VQB0+KavI+nA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9YPRiaobAYhWfmMhVkSgKTcMjIOkdtUyOBAH22UfQL9sJmblnSz9jhe+RE8YYhUIWo1+U7YTC87ENlo5H76IzjgUpa8VhzkaWsfMLD37uJ6V2cP0+aCYo9hJR14hr0kxt6LiC7XkH6Qa142A6VYu7srchO/1r+9kJvAkQE6eQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rgv0WLyi; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-24602f6d8b6so8435915ad.1;
        Mon, 25 Aug 2025 10:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756141240; x=1756746040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0oEN90SLYgvRgTxYwIkfotkQK1LJND5IDEHVs53sDg=;
        b=Rgv0WLyiaRIrRMsdST9g0LOHUTiba9Jj/D+j8Hme7dqfxS6oE4NWCOrsDQT6+vHUib
         bw4gRYkw2l9QPfS1XVTXMa7E7kBBiZOLkSYkhWm83Z75zgybBbHW1No2jScyYouWBFzr
         7eTmK3bSLPdH6juWVPUXHJ0Ban0amB4hP3q4wTZMWFhALTiI/nXkvd/r0/rKih849Vw9
         wPtTqVMnLzGMOluNsp74GBItRp5EafrCtXcKIBTP6a1TYm8zE1SBK6/pG8uG1p7RqktH
         BtWcunSa34r4uB0ik4+HGviosTAx8TJQB+gmM3Bm6NjOHI48A+J9YlokOA5YZ/5K5ZoZ
         8Xeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756141240; x=1756746040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0oEN90SLYgvRgTxYwIkfotkQK1LJND5IDEHVs53sDg=;
        b=OGf0metRSwecahlmdtjtFBOxAy9fzphPvVoBiWgWeYCeRIvM736ouMmjK+ZadvCZoa
         wnsHHrAe6S+VeSCqZHrPTYbcxxCJ4+NizkDGQG4bnyiWMnw0fs4Q6Frj/xICejwEdECW
         ex2vHFM+ua6IOui7tRNMPUDlrkpPyGJx8FnzvOHUaQerkBDzOzNR2pVvwD1nctwTZoIi
         Q0D0+T/+AAhwMpzOQTp1wYO82D6j+3vtOBzouVNks0e1LVP8uSCozidNqTdoe5muEncO
         IthB1z0aoMeTLrJgVgwIdr3RQkgM5NiFJoMVmWM5uBteXGbSVsCfvFDa3K++yhAY4nYR
         4h8w==
X-Forwarded-Encrypted: i=1; AJvYcCVN1BoMoUX4HiQtLZK1ETvUHWZdD759Ci4hfWpIFsq3budIQ3L+qyEzDR2jbkA9ys827iQOHjjlQ5HEWjbApMrY@vger.kernel.org, AJvYcCXL+3OgLzYLNqo+nmHbNhG2OzS+sWeF4mXtE0C14bgoz+zkX9SZdcsZZFkYbizOPAG43fqmV0F7PWEVqN7Z@vger.kernel.org, AJvYcCXU2fLue14t+n7Z62eQXgrNuEl2j/lt/Z59Ewcj04cjJf2+PmhA2qeXFiCphf4ugprc88XJAxNP1o0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwywNn9vzncob4jgw/XsHlJL+bq+GrUiARtBk96zjPixQq3fWa6
	yS2arKbUgxibkNHy16K0cpK4+EUb5hI3yx1tFFKHTCarZK1p1TVlovePrilQ/9TzcQoq/GPR2dU
	aB2w5gjDIkLLT227gOsTzmtQBUjwuSBc=
X-Gm-Gg: ASbGnctx3JuLP0Mc/xMjmcV+nqtt5QO1H8n36aDHx8sKyCjBo8AQe4p0nx/tK2IWWHt
	NMachSIgPwAF6PgfT9epYrteaV00SbzsC0uVlYBLmqWP2NJ6+/v/Q/9Z56ERw615CXJNpvI4TZV
	vybdfYD+LCfmt8T8HFwkWiVBvLIlz+k7auDIpZ1XjJDT6wXzYkEjWSqgb4B9TjFtJMNIryWtFYu
	zGdTfjj/nu4dJwqWsxbacPknpIAjI3WJSOHnsaVOq3wID2DhoS9f7JEU+Z8B46IEpoTf6zD5YJ9
	wXxbb9AKPhveOoJpyQ5S5BMxjw==
X-Google-Smtp-Source: AGHT+IHKT4JJBJ9rgR6CsJmxUiw1K8DlbFWihB3KfiTBy1l9WKV/JStW65ETOGMdOn/RgdA5Ko6AVAJXlO2Hf7k2FPY=
X-Received: by 2002:a17:902:cf09:b0:240:729c:a022 with SMTP id
 d9443c01a7336-24630427edbmr91627825ad.11.1756141239755; Mon, 25 Aug 2025
 10:00:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com> <202508250834.E2456B9@keescook>
In-Reply-To: <202508250834.E2456B9@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 Aug 2025 19:00:22 +0200
X-Gm-Features: Ac12FXyYN3VEhnMM3td2GuBBEWm8dOLy6K6qZL3tvq3QOv-O5HJfG5pSFZcSTv8
Message-ID: <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@outflux.net>, 
	Sami Tolvanen <samitolvanen@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Rutland <mark.rutland@arm.com>, Puranjay Mohan <puranjay@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 5:35=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> Yeah, that's a good idea. What the right way to do that?
>
> config CFI_CLANG
>         bool "Use Clang's Control Flow Integrity (CFI)"
>         depends on ARCH_SUPPORTS_CFI
>         select CFI
>
> ?

I don't recall what is the idiomatic solution for renames, but I
remember Linus talking about this topic and about avoiding losing old
values if possible (perhaps getting a new question in `oldconfig` is
OK as long as the `olddefconfig` respects the old value).

I think your suggestion above will still make it appear twice in
`menuconfig` -- there may be a way to play with visibility to make it
better.

A simple possibility I can think of (assuming it works) is having the
CFI symbol for the time being introduced just as a `def_bool
CFI_CLANG` for a few releases so that people get the new one in their
configs.

Cheers,
Miguel

