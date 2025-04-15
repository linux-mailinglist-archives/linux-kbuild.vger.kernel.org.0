Return-Path: <linux-kbuild+bounces-6611-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F6AA8949D
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Apr 2025 09:14:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22605189425E
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Apr 2025 07:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC882798F0;
	Tue, 15 Apr 2025 07:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="iIgkH8cW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCE11AF0D0;
	Tue, 15 Apr 2025 07:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701248; cv=none; b=pvgqp2osSMfnGnEwKfNhsjVczfas7l1WtrLEs5VpH5at7NFCw3ZRspKstBNRPQKay8mysMmvyMdcDNtnDD1twva7e0y5PNXaRQKKjzIIR2TImgLQ6Fnz3XoFAOBgRPQx8vGaH7uHDjc01lqH2y4OaFmgdpFAwjGJh9VUG5zWjKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701248; c=relaxed/simple;
	bh=hcLPhfxenRnvO2U6OAAPVSctWKDdhcd6fkpJdxhI3xY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qwqOZOa/rGxjBn9oSDinfgRq/B6frEawXQqBAPJdKpFcRuT8kDJIMHqiE/FMgKy/Jb0kjmN+E8+hEGBxWOZUWg9+zVqImCy7INVmRYUNngDYBP7sfPTtirdEaQTAfQIvnEhMnpvhbUeDOQWmUAq/HH/1NlXjCArbozbd+Otv+O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=iIgkH8cW; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744701232;
	bh=HmPsfRmAPmNXzJi9Xx7CUeeH3IbUJeikFdzI0teQOag=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=iIgkH8cWNYpqokau186oasELOai1Ts+BD7RuD4KyIAVhYtjkpCKK1AlnKnIXxiUdk
	 hpC8uVoIPCntsiGcXAE8PhMNy2oRbzRVIT58kxXoqw3jMIH9T54Zer4BpcU+NgWHle
	 mTFpQp64D5eZDZ2B2treG1tOjvqRHSXzLrvHHovY=
X-QQ-mid: izesmtp77t1744701229t5e986da6
X-QQ-Originating-IP: DvQef4tpabvAEBUKh00i+R3jcs2o+mDUrDTfaP4WggA=
Received: from mail-yb1-f178.google.com ( [209.85.219.178])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Apr 2025 15:13:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15285789460902176528
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e6582542952so4101915276.3;
        Tue, 15 Apr 2025 00:13:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUm1Fm/f21cU0imnEkqb4sC3SXQTviNaHddLgkd7gcW4+XdwrVRaqAUpboYqqeZF47M5ryVUI/Ap1orKwkr@vger.kernel.org, AJvYcCXHoD8BUTgN4AvBjFwIw2tWeT9G8ua2Q28Z4GDTl271j9bjQzR39m9M0WnbSEDkjmjXPZQdR5BRAroqy5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNX1tCY0nsJaLcJ4kWStq0kUHyOVb5yvsvNWMcZy+gFjDNQoVx
	KzdRnF1NbJyp/bmRHdIZn+Uh3aQOAdOv2qhARLx94O8kwhOh5xF4F+xF+4CQwmnCzl9RsLtJxv8
	HrSrYy5WhU48mynZLKlZK4GWPsr4=
X-Google-Smtp-Source: AGHT+IEHwgvmHQkHmDgMlzvWPPgWIS0QJhl8XByWGSmXFpzp63NMw9b1uL3nCEc2EUX40kluM5VlaWS/voVwS2L2B38=
X-Received: by 2002:a05:6902:228b:b0:e6d:e70f:dbed with SMTP id
 3f1490d57ef6-e704de8d4admr24101805276.16.1744701227015; Tue, 15 Apr 2025
 00:13:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <31F42D8141CDD2D0+20250411105142.89296-1-chenlinxuan@uniontech.com>
 <20250411105459.90782-1-chenlinxuan@uniontech.com> <69F64A6F8DE504F5+20250411105459.90782-7-chenlinxuan@uniontech.com>
In-Reply-To: <69F64A6F8DE504F5+20250411105459.90782-7-chenlinxuan@uniontech.com>
From: Chen Linxuan <chenlinxuan@uniontech.com>
Date: Tue, 15 Apr 2025 15:13:35 +0800
X-Gmail-Original-Message-ID: <31560F16E64472CA+CAC1kPDNtOAj8qi2mu7ehMLW4KWf+2cSqKt9ahL-fW7J-Fs4f8g@mail.gmail.com>
X-Gm-Features: ATxdqUGyoXiKBtkF46dLOBtNFE2b1W790LkV75qLDVk-33ax-fPFaX8poZnDK4o
Message-ID: <CAC1kPDNtOAj8qi2mu7ehMLW4KWf+2cSqKt9ahL-fW7J-Fs4f8g@mail.gmail.com>
Subject: Re: [RFC PATCH 7/7] lib/Kconfig.debug: introduce CONFIG_NO_AUTO_INLINE
To: Chen Linxuan <chenlinxuan@uniontech.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Winston Wen <wentao@uniontech.com>, 
	Changbin Du <changbin.du@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-QQ-SENDSIZE: 520
Feedback-ID: izesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: N10XyoOyIIl0vosdHlAwIkQVTLzIPv1yru2cnvJy6rxGaEI9g4VYvbeY
	Qp32ZjO7T+CO6TV8TlR/VrPTw8rCO1XEAg0PmU5d/gKK29dWnU/ySZ9CglMYTP0OZzQL1B7
	dWjDKgCNbeM3jvnCl3UwYnLyT7aJQSBiNiRwDFjlorwi301uddYz+ffNV6iW/NjMdwNWC1M
	rAfL1MljNjc2gR8b2YPozbGI6cJ3WX7VmnqDboxdAsiYLGF3n8Dv5BCgVI7NLKMUsjmlJVq
	/IEezkl54m3N25UJ61qBZPPUUSnO9r5z2Jgo2HOI2GhOBdGvXOtXc+6HH98q+V1IhsFLruH
	r+OctPDCpmdu0bshZvoz2vPTJIMlo3TnJUmJiYDW55sgNLwd29L47xHVTw2ZMgXEhR29Z9C
	VPt+DAb2b+iSLDzHmPJ3p+/DsZlyP6cKb11q33H/gxhQzsgj2cq9eu9yEJzHr2LmDS4Gv5t
	e4hEaFn4uLa7vihsnDS283m07Wdb1tefHyrZyE4ordqBbDTq36a8RlWvk5tLZfOCzyoOzR9
	QKUR+veP1wRaXGf+Sc1cavhbzia5BbLKWkCv9qpWOqrb4UOhvJosCznznfVtK8cOsnO6Rpp
	qKlvEhe4JmQXIRzI5jY/dxVFhAIA8g4iUktMlZKDmRma4rUAUxB0SYRrMD1D0W/lghN6IlE
	clSKu+Uc45zLFLzIX0POHj5HtZa7oKzUudib2bfmFBAKCYsRWreIzYmGxPDZ7ZCCWU6W24t
	R8DtkhJGLn6VvCBJ5lSWlupoUyiNtMuB31/Uwop+r5h7yKzDZMPhHq9XL/do5GpuP99xBo1
	NdJW/V3qMTsA3GOloCG63hldJQsRBpi+Gukj9untsFuJUsC+6nGpMxdsK5Nb1P2UyJ+A8gM
	bl0qgra9crw+j7k2tRn8gH+2sxcBxLLzjRWjP6dP5ovInS3qIfmqHTkfV9ybZaqBzXEJX/w
	HyW899HF/V6b9lI9o26m9e2UoqhycZ26amqUK3DK/dbkJhDsvdJ8bH2RqTpYudU++QlArBk
	nFnOH3c5RBOqG9hWa8xoc6q1d/zOLfw39rS0+SXWQ5F2uUpg1slYIH7kHhc/Owk1wCQXDvx
	WYKxpL6EGFI
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

Chen Linxuan <chenlinxuan@uniontech.com> =E4=BA=8E2025=E5=B9=B44=E6=9C=8811=
=E6=97=A5=E5=91=A8=E4=BA=94 18:56=E5=86=99=E9=81=93=EF=BC=9A
>
> From: Winston Wen <wentao@uniontech.com>
>
> Add a new kernel hacking option CONFIG_NO_AUTO_INLINE that prevents the
> compiler from auto-inlining functions not explicitly marked with the
> 'inline' keyword.
>
> This enhancement improves function tracer capabilities as it can only
> trace functions that haven't been inlined by the compiler.
>
> Previous discussions:
> Link: https://lore.kernel.org/all/20181028130945.23581-3-changbin.du@gmai=
l.com/
>
> This patch is modified from 917fad29febd ("kernel hacking: add a config
> option to disable compiler auto-inlining") which can be founded in
> linux-next-history:
> Link: https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
-history.git/commit/?id=3D917fad29febd
>
> Unlike the original implementation, this patch:
>
> 1. Make it depends on CC_IS_GCC,
>    as Clang 18.1.3 break test_bitmap_const_eval() in lib/test_bitmap.c
>
> 2. Make it depends on X86_64,
>    as I haven't test other architectures

LOONGARCH has been tested, too.

>
> 3. Removes unnecessary cc-option checks per 7d73c3e9c514 ("Makefile:
>    remove stale cc-option checks").
>
> 4. Update help information.
>
> Cc: Changbin Du <changbin.du@gmail.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Winston Wen <wentao@uniontech.com>
> Co-Developed-by: Chen Linxuan <chenlinxuan@uniontech.com>
> Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
> ---
>  Makefile          |  6 ++++++
>  lib/Kconfig.debug | 15 +++++++++++++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index f42418556507..0a9bf33ce75f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1071,6 +1071,12 @@ endif
>  # Ensure compilers do not transform certain loops into calls to wcslen()
>  KBUILD_CFLAGS +=3D -fno-builtin-wcslen
>
> +ifdef CONFIG_NO_AUTO_INLINE
> +KBUILD_CFLAGS   +=3D -fno-inline-functions \
> +                  -fno-inline-small-functions \
> +                  -fno-inline-functions-called-once
> +endif
> +
>  # change __FILE__ to the relative path to the source directory
>  ifdef building_out_of_srctree
>  KBUILD_CPPFLAGS +=3D $(call cc-option,-ffile-prefix-map=3D$(srcroot)/=3D=
)
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 9fe4d8dfe578..2ebb4802886a 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -436,8 +436,23 @@ config GDB_SCRIPTS
>           instance. See Documentation/process/debugging/gdb-kernel-debugg=
ing.rst
>           for further details.
>
> +
>  endif # DEBUG_INFO
>
> +config NO_AUTO_INLINE
> +       bool "Disable compiler auto-inline optimizations (EXPERIMENTAL)"
> +       default n
> +       depends on CC_IS_GCC && (X86 || LOONGARCH)
> +       help
> +         This will prevent the compiler from optimizing the kernel by
> +         auto-inlining functions not marked with the inline keyword.
> +         With this option, only functions explicitly marked with
> +         "inline" will be inlined. This will allow the function tracer
> +         to trace more functions because it only traces functions that
> +         the compiler has not inlined.
> +
> +         If unsure, select N.
> +
>  config FRAME_WARN
>         int "Warn for stack frames larger than"
>         range 0 8192
> --
> 2.48.1
>
>

