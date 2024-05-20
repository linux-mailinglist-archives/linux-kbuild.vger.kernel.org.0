Return-Path: <linux-kbuild+bounces-1894-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B13A8C9A7C
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2024 11:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1639B218C1
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2024 09:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0193D1CD37;
	Mon, 20 May 2024 09:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAGIgH48"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C268417C67;
	Mon, 20 May 2024 09:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716197931; cv=none; b=iop5wq8NX4WBcPJQMzCGJvyY3PmsVA/tl6v1cTzOS0jz3Cz6ETa1JSwutiHiKRtEaDRk/AMjOtGR+GRNbtzTSj00UWHOYRmmAdFp9lmRKTODsIIHQZwNsFiJYfqbYyOtnqmmEBm+S2kTs6Pj+63OrCo/EPNtoqODpPrbQbd2M18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716197931; c=relaxed/simple;
	bh=f2ltlTJfrPXs5K86QOoQ6YuDR8HIGkk3pJMklKg3P6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZItjFs54f32rjSMRXa/7w/G6CnJzd3QxMuCO+uh1T5NuaML5GshdDF3EfXm4UmwmuFFOGbWHF0gUYRvzjpukoLyxzLWg1XNrx9J8AiA13srHsELExJYcUZt0L2QuUCGul4qRUpHdWBgtiDMqCRqjoKpacYWAhb7JTOVgCWdCIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAGIgH48; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B15FC4AF08;
	Mon, 20 May 2024 09:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716197931;
	bh=f2ltlTJfrPXs5K86QOoQ6YuDR8HIGkk3pJMklKg3P6s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LAGIgH48/HWLi4pMVeP+Y54RqB4nRlmrFadY+SSIZN1ms2/Z+Xq9ylVZZ6rabqH2H
	 b8tqnMQtyZtQ2fh6A9Cpu6nfFBllRAFRUAgyHD1+DG7T3wS7/1/QaWau3k+6SMF1EI
	 QN1PkIF/jln3DDg0aLxM/hrUAQGF9xIM5HPhX4PA8oC63RMuFWBnkSHxIcZ+VUGCxO
	 fNdZyVKvb9SenaZSgiPncY6esb6ifpn9m9JoDhirxrJf/ByK8R7grQE/zHis4gAWhP
	 EqEjr6bR3S4vQAjWLJQ7TX+QMxb0GpeXYtVTqXFgHBUG1SGKXrrUbSObjpC28Kvdvh
	 QoK9rL9fNOz8A==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51f99f9e0faso4685543e87.2;
        Mon, 20 May 2024 02:38:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/9vaFE6NOAsa94TAYSgboLg0Tz/XHCdx0IDlBUgyVbHGWGHqvKwz0D/jlvKT1K57UTX0CvVus+IwiKIqke2SnA2zccFEKLFYhzsTOAPW5sTP99HkWJr5G1tcZGppC2xsxb2e1USdMBqjot3gmfBqpEETM0hCnSnNJIqwA9gEvFH7wDebwRIeZSwatnqLZMA==
X-Gm-Message-State: AOJu0Yx7FjM0Re0Wv3ANXDqSS+2G2BK47bBKh3NDdWPiRtidAV7ZVuv+
	Gi0hXsCselPuUxBlEg3eck1o/725X6r2pd2Xl1PMlw6gOWB1H+jTb8SwUed9yfmxqLYJy6nd+tH
	Wfs+4cAAFoiCcW882hMhegAs1VrI=
X-Google-Smtp-Source: AGHT+IHJ50N0b6yVjcPEnuluIR3E+9C3M5NQS8+OA8xjBOBrvD4f0Q/6GXm3dzXglHKaJPbJ3/n8p7uD8nPWdAXamx8=
X-Received: by 2002:a05:6512:3448:b0:520:76d0:b054 with SMTP id
 2adb3069b0e04-524590e5807mr610226e87.57.1716197930086; Mon, 20 May 2024
 02:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240517042839.544650-1-kris.van.hees@oracle.com> <20240517042839.544650-3-kris.van.hees@oracle.com>
In-Reply-To: <20240517042839.544650-3-kris.van.hees@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 20 May 2024 18:38:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAST_SbaN9WQRM_k0xE1MUReJvn9AMSg4A1-9b9xotf67w@mail.gmail.com>
Message-ID: <CAK7LNAST_SbaN9WQRM_k0xE1MUReJvn9AMSg4A1-9b9xotf67w@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] trace: add CONFIG_BUILTIN_MODULE_RANGES option
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Nick Alcock <nick.alcock@oracle.com>, Alan Maguire <alan.maguire@oracle.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Jiri Olsa <olsajiri@gmail.com>, Elena Zannoni <elena.zannoni@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 1:30=E2=80=AFPM Kris Van Hees <kris.van.hees@oracle=
.com> wrote:
>
> The CONFIG_BUILTIN_MODULE_RANGES option controls whether offset range dat=
a
> is generated for kernel modules that are built into the kernel image.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> ---
> Changes since v2:
>  - Add explicit dependency on FTRACE for CONFIG_BUILTIN_MODULE_RANGES
> ---
>  kernel/trace/Kconfig | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> index 47345bf1d4a9f..d0c82b4b3a61e 100644
> --- a/kernel/trace/Kconfig
> +++ b/kernel/trace/Kconfig
> @@ -188,6 +188,24 @@ menuconfig FTRACE
>
>  if FTRACE
>
> +config BUILTIN_MODULE_RANGES
> +       bool "Generate address range information for builtin modules"
> +       depends on FTRACE
> +       select VMLINUX_MAP



I still got this warning.


WARNING: unmet direct dependencies detected for VMLINUX_MAP
  Depends on [n]: EXPERT [=3Dn]
  Selected by [y]:
  - BUILTIN_MODULE_RANGES [=3Dy] && FTRACE [=3Dy]





I recommend changing 'select VMLINUX_MAP'
to 'depends on VMLINUX_MAP'.



BTW, do you need to put this inside 'if FTRACE'?

FTRACE is not required to generate the ranges file.




--=20
Best Regards
Masahiro Yamada

