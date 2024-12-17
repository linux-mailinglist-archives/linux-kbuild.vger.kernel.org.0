Return-Path: <linux-kbuild+bounces-5163-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A63439F41D9
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2024 05:57:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B07E1886C9E
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2024 04:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2826714D71A;
	Tue, 17 Dec 2024 04:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LIiIl06d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670A314A095
	for <linux-kbuild@vger.kernel.org>; Tue, 17 Dec 2024 04:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734411455; cv=none; b=tUXfTRi9qBG/wqk1speYrpQahhjW9/NEFcwk6RWYvbATO8LkEy/CZQVsnFE7pJZ7kTn97nH/hxRW49UuIdhcDA4OP7XbCORvXQol/Eaa7ck7bQt5kM9euadJE73I6sTSBh2ybWjL1kRu6JeMmgRdb3UcPmyg2Ks9Bzua/tx1pH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734411455; c=relaxed/simple;
	bh=fAZh6YN7BDxWYSlX0Fp1Tgj9S+0JUp7/sHCKRiQuiUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rkWIQ2VJyFGWcVlr96Iz5OotsPqYLCyIhxQSjGM8BWOmjY1IhUBrekx4ishH810sev+IJ87TmCLPbuxRsHwMM8qNXQqcmMfJJU1l6X/dm+aohniplfGewNBSaGTPV7ibsHxmKj6jtjgA9jkD9q376JW5nqXwr8hji5E+T0C4c00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LIiIl06d; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3a7dfcd40fcso61335ab.1
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Dec 2024 20:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734411452; x=1735016252; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=362/6wPaNoggwJpGGOdG6RgZlj612Z1MukeYbnnzsUo=;
        b=LIiIl06dWR6lg0bJDxXMf0QxMv6IEm6+lKoJUB6Xs4TcTmqzDGu89+bgKhz5CBR3zy
         TGu1U7Y5LzgRGTnguXltIq9dILKNum/+/p5FhlYdE2Z36bnr5fj2WPjuDR2FQRVxIwAd
         tSBquImO50nGkfkXwXGdxE7NGvq6ZJlEuwZxd8xmvgkkp1fHhELH13tyTFhNmc0ckB8P
         Hso9ZVxNryXJcnlppwRxGXWh8h5/r2N8DshePIUxLiZyUw0ybfjc2B8ehBf9/0xHvODI
         p8++Q2QcgMBik3XHirRr3jdJL5lR8iYKO0oz9G2LbTJj/1EIY/HAlfCWiBqu3S2Zxc/5
         YZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734411452; x=1735016252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=362/6wPaNoggwJpGGOdG6RgZlj612Z1MukeYbnnzsUo=;
        b=DwtQu3bAhMr+9QC/BsLP9Wu2qvT70zwilWa9QNN8WosYi12YG7pmdCfd7nksMSWqL9
         z+xdjmnEOIv6topntWbipP9/EnSzb8EjTTkzkZZUN8ezvaGu218Hk1rocdnpNy6GI0OU
         novknbSfnSmoykzUH+oUmcK8pLOFgpWi1dl0iW91xU3Plh188EA7VJ0RvWAjmfqwFMCO
         7E40SWiPF3R3+1WsNPxWbfv0RSy8MxPv1Kc4MUo8qqupCTxKTcBi1t3E9dkewaWdCL1L
         zO+5tSXfVuR5xX6PTEME6wUDbd0MkanPKNqOEfE5MAqToHqG8gjV5d2d/7PGS4V/oH11
         5v3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0w5NX82n4Cc+RoCdNntdD6POxnWdUBxVAFZE5wsVcC1La//2WFU7vDzrbXWX/AyRYTBPjmgiuHrS3wJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8i/OskQNFo1a1XVFxBL0NH6XYFGRh9CsUbWcFbu/aSQsEbZTb
	cH3vKzj7B3JUoxlUeTKnHrTw5KQUsURKRQSe3bW14JjAS8IgOmumBfN1AukzSNPkH0DjesSS2jo
	V8Ggard0idUXuRTnTDS8YFkn+11MX6Ttt972h
X-Gm-Gg: ASbGncv58VdJkqfNEnv/YBwe/wompwAotffyVvTkocmHwLBlRgQ6KLmqDEelErLYD1K
	qaaUrZ7F2v5yfA7T856JdV7ACIR/+EVp6PBScZuQ=
X-Google-Smtp-Source: AGHT+IEon0H5P/SgKkxsKeFtvxthHZIZFm7pK/6IZOgc7rOanq4HBnSG1t4asn1594qBhXnfuxhIF4Hwq5/vBKcKGhQ=
X-Received: by 2002:a92:ccc4:0:b0:3a7:ddbb:1b19 with SMTP id
 e9e14a558f8ab-3bb8430e0d7mr995405ab.27.1734411452091; Mon, 16 Dec 2024
 20:57:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216-perf_fix_riscv_obj_reading-v1-0-b75962660a9b@rivosinc.com>
 <20241216-perf_fix_riscv_obj_reading-v1-2-b75962660a9b@rivosinc.com>
In-Reply-To: <20241216-perf_fix_riscv_obj_reading-v1-2-b75962660a9b@rivosinc.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 16 Dec 2024 20:57:20 -0800
Message-ID: <CAP-5=fVvLv-OtkK57ri1EpM_v=PQZDZijYBpGv_9Smyz8EOm2g@mail.gmail.com>
Subject: Re: [PATCH 2/2] tools: perf: tests: Fix code reading for riscv
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Nelson Chu <nelson@rivosinc.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 3:13=E2=80=AFPM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> After binutils commit e43d876 which was first included in binutils 2.41,
> riscv no longer supports dumping in the middle of instructions. Increase
> the objdump window by 2-bytes to ensure that any instruction that sits
> on the boundary of the specified stop-address is not cut in half.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/Kconfig              |  5 +++++
>  tools/perf/tests/code-reading.c | 17 ++++++++++++++++-

Files under tools use a different Build system than the kernel. The
Kconfig value won't have an effect. Check out Makefile.config:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/Makefile.config?h=3Dperf-tools-next
which is included into the build here:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/Makefile.perf?h=3Dperf-tools-next#n313

>  2 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d4a7ca0388c071b536df59c0eb11d55f9080c7cd..f164047471267936bc62389b7=
d7d9a7cbdca8f97 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -229,6 +229,11 @@ config GCC_SUPPORTS_DYNAMIC_FTRACE
>         def_bool CC_IS_GCC
>         depends on $(cc-option,-fpatchable-function-entry=3D8)
>
> +config RISCV_OBJDUMP_SUPPORTS_SPLIT_INSTRUCTION
> +       # Some versions of objdump do not support dumping partial instruc=
tions
> +       def_bool y
> +       depends on !(OBJDUMP_IS_GNU && OBJDUMP_VERSION > 24100)
> +
>  config HAVE_SHADOW_CALL_STACK
>         def_bool $(cc-option,-fsanitize=3Dshadow-call-stack)
>         # https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a48=
4e843e6eeb51f0cb7b8819e50da6d2444d769
> diff --git a/tools/perf/tests/code-reading.c b/tools/perf/tests/code-read=
ing.c
> index 27c82cfb7e7de42284bf5af9cf7594a3a963052e..605f4a8e1dbc00d8a572503f4=
5053c2f30ad19e3 100644
> --- a/tools/perf/tests/code-reading.c
> +++ b/tools/perf/tests/code-reading.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #include <errno.h>
> +#include <linux/kconfig.h>
>  #include <linux/kernel.h>
>  #include <linux/types.h>
>  #include <inttypes.h>
> @@ -183,9 +184,23 @@ static int read_via_objdump(const char *filename, u6=
4 addr, void *buf,
>         const char *fmt;
>         FILE *f;
>         int ret;
> +       u64 stop_address =3D addr + len;
> +
> +       if (IS_ENABLED(__riscv) && !IS_ENABLED(CONFIG_RISCV_OBJDUMP_SUPPO=
RTS_SPLIT_INSTRUCTION)) {

It would be nice if this could be a runtime rather than build time detected=
.

Thanks,
Ian

> +               /*
> +                * On some versions of riscv objdump, dumping in the midd=
le of
> +                * instructions is not supported. riscv instructions are =
aligned along
> +                * 2-byte intervals and can be either 2-bytes or 4-bytes.=
 This makes it
> +                * possible that the stop-address lands in the middle of =
a 4-byte
> +                * instruction. Increase the stop_address by two to ensur=
e an
> +                * instruction is not cut in half, but leave the len as-i=
s so only the
> +                * expected number of bytes are collected.
> +                */
> +               stop_address +=3D 2;
> +       }
>
>         fmt =3D "%s -z -d --start-address=3D0x%"PRIx64" --stop-address=3D=
0x%"PRIx64" %s";
> -       ret =3D snprintf(cmd, sizeof(cmd), fmt, test_objdump_path, addr, =
addr + len,
> +       ret =3D snprintf(cmd, sizeof(cmd), fmt, test_objdump_path, addr, =
stop_address,
>                        filename);
>         if (ret <=3D 0 || (size_t)ret >=3D sizeof(cmd))
>                 return -1;
>
> --
> 2.34.1
>

