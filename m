Return-Path: <linux-kbuild+bounces-5521-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E65F2A1832D
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2025 18:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDF343A1EC8
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2025 17:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29581F55F3;
	Tue, 21 Jan 2025 17:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yO547tQD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE761F428E
	for <linux-kbuild@vger.kernel.org>; Tue, 21 Jan 2025 17:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737481570; cv=none; b=ip3xiIKPP6AYRpzl2x+em73Juk9gmxfxCu+0Er255+JiHF8SI4P/4gmY7BciOohSZMh+cL6taelcb+WVYVkLpV5XJ4RflDUNaZ7mkR4WicU1vPt79XJTW/c3y0qFJgqR1aa5bcan7KKHY9E/o4T1khaUzendDY4UmJvqHOQNKJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737481570; c=relaxed/simple;
	bh=uolMWjkRwog15wLHtUnNAgJ2+dDra/fTMVYKCdY/71I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h7wdBvvPepZnzrttoHROrC/LFMR592MMEfUY1CRE2a43G6zfLD/FVpSI+S8FkgR/+keJoeusQg9W2dS9OrrbzmWw/x9PGzdUATd4m49dRo/FK8a/beMMv6vjyy5LBLf1iuC3Te6+sLKAwKD982ofhnQhWebzh/xNoOJpE+/Qz8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yO547tQD; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-467896541e1so4881cf.0
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Jan 2025 09:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737481567; x=1738086367; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bx8WAbX+Bf/ENrO43oH1TTXYHStkZFkZKs48Y9wFiVw=;
        b=yO547tQDkFjDi6wU9Gd4mkG/R6uKyNjazbeUjkhALQKD964lXSET7dc3sbyn/Ckki7
         VSvyipUl4XJAbfFCZi+qRoS7ZZkIQhyTT327a973j7Tp9jbpxyr9R5VdSWBkTlVujVc8
         TI8dDt1jELt37TXzGPtKlV7gAxdtt5VSe2B46974cedarQhKSfnynBXDYNk+OKVbNDnm
         x12Py4jzVulOluOV2sBtxM8sLucic2PUZaY3iTOHp2AV52EA1weJWzxO8YaajmlaG9GW
         OvfSmTN4HnKvnC7QHECiB/osEN6EP+SpHDIJhl/BcK0PPLnShVuGDgQZo82InANtn71e
         3VQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737481567; x=1738086367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bx8WAbX+Bf/ENrO43oH1TTXYHStkZFkZKs48Y9wFiVw=;
        b=GFAgTt5DgJ2vookaHNpNGKyecp7czCmINL7t/6Hb5fjSc1S+BUwJHyHG7RYPGp9BxN
         RZZPfLbwg2bhy5UYoE5LpWkKIjrjrTbm26ZnZ3EE0+TzmOOSHKf3jMGTWaQfAHPIuTmh
         vgUtcv18ZvSh4U+9FTvNU2bRXGNRT31hET0v6LeKVZqijWvfjopflUjT2BkaZmTRLEgr
         Gs302fkCHAV6WDrgCLlBnxOr6qJA+UWQZGYY6TJXTV0KilGSke19WxpxKjyfzDy43iy5
         UzDY8l+oQkCu5pyGuW/vFSCEpXBz/kYSf+pGBhTxHYrcdUZatAfyKnphxTtSAsByTUm7
         jjuw==
X-Gm-Message-State: AOJu0Yyun6dgh4MbI8RVVrZzf1PMylCMban57YSDs3H7Rizy1npumcwG
	Mmv3eJ4PMe0IdOx0cEfONrmFcd1BDQ20aHdmxlHwoevqVLUUBa7SH//dp2wLkUyGiSmIigICHEx
	SVraOTk31G11cD1p5g8sU7OnQUdJf8MlOd1ZL
X-Gm-Gg: ASbGncucMiyNz4ijQE8uTrirIuidEGalasXvScJFK9W01CK99jLPFaKkB0CjVGI9LAy
	M66nl+r9vmthABpcXgF15UZlyGkt4q7SJixqHhcsScCDe27qeT9oYqwAgw30ugMjSeDrUePCZGQ
	K4W3SXxQ==
X-Google-Smtp-Source: AGHT+IGd0/Z0rV2uyahLRAJzwEWM90n2xUjYQM8Nd/X2t9nhAEmY/ceslLrJI2CjEt53OBeRuRBjrcmowYTHlHU3kK4=
X-Received: by 2002:ac8:5f4b:0:b0:46c:70b1:c5e4 with SMTP id
 d75a77b69052e-46e21081d40mr11291001cf.3.1737481566464; Tue, 21 Jan 2025
 09:46:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120212839.1675696-1-arnd@kernel.org>
In-Reply-To: <20250120212839.1675696-1-arnd@kernel.org>
From: Rong Xu <xur@google.com>
Date: Tue, 21 Jan 2025 09:45:54 -0800
X-Gm-Features: AWEUYZmEwIAZYDGYiWvXqx4GdOYlgecHA034aBbe62gbYaNi1kci1k83ZczQ4hI
Message-ID: <CAF1bQ=QFxE8AvnpOeSjSeL1buxDDACKVNufLjw99cQir0pyS_Q@mail.gmail.com>
Subject: Re: [PATCH] [RFC, DO NOT APPLY] vmlinux.lds: revert link speed regression
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, regressions@lists.linux.dev, 
	Han Shen <shenhan@google.com>, Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Jann Horn <jannh@google.com>, Ard Biesheuvel <ardb@kernel.org>, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 1:29=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> I noticed a regression in the time it takes to fully link some randconfig
> kernels and bisected this to commit 0043ecea2399 ("vmlinux.lds.h: Adjust
> symbol ordering in text output section"), which (among other changes) mov=
es
> .text.unlikely ahead of .text.
>
> Partially reverting this makes the final link over six times faster again=
,
> back to what it was in linux-6.12:
>
>                 linux-6.12      linux-6.13
> ld.lld v20      1.2s            1.2s
> ld.bfd v2.36    3.2s            5.2s
> ld.bfd v2.39    59s             388s
>
> According to the commit description, that revert is not allowed here
> because with CONFIG_LD_DEAD_CODE_DATA_ELIMINATION, the .text.unlikely
> section name conflicts with the function-section names. On the other
> hand, the excessive link time happens both with and without that
> option, so the order could be conditional.

Yes. The order could be conditional. As a matter of fact, the first
version was conditional.
I changed it based on the reviewer comments to reduce conditions for
more maintainable code.
I would like to work from the ld.bfd side to see if we can fix the problem.

-Rong

>
> I did not try to bisect the linker beyond trying multiple versions
> I had installed already, and it does feel like the behavior of recent
> versions (tested 2.39 and 2.42 with identical results) is broken in
> some form that earlier versions were not. According to 'perf', most
> of the time is spent in elf_link_adjust_relocs() and ext64l_r_offset().
>
> I also did not try to narrow the problem down to specific kernel
> configuration options, but from my first impression it does appear
> to be rare, and unrelated to the Propeller options added in 6.13.
>
> Cc: regressions@lists.linux.dev
> Cc: Han Shen <shenhan@google.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Kees Cook <kees@kernel.org>
> Fixes: 0043ecea2399 ("vmlinux.lds.h: Adjust symbol ordering in text outpu=
t section")
> Link: https://pastebin.com/raw/sWpbkapL (config)
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  include/asm-generic/vmlinux.lds.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmli=
nux.lds.h
> index 54504013c749..61fa047023b5 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -588,10 +588,10 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PRO=
PELLER_CLANG)
>                 *(.text.asan.* .text.tsan.*)                            \
>                 *(.text.unknown .text.unknown.*)                        \
>                 TEXT_SPLIT                                              \
> -               TEXT_UNLIKELY                                           \
>                 . =3D ALIGN(PAGE_SIZE);                                  =
 \
>                 TEXT_HOT                                                \
>                 *(TEXT_MAIN .text.fixup)                                \
> +               TEXT_UNLIKELY                                           \
>                 NOINSTR_TEXT                                            \
>                 *(.ref.text)
>
> --
> 2.39.5
>

