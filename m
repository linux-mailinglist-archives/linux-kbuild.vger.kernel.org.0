Return-Path: <linux-kbuild+bounces-1893-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AB78C9A58
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2024 11:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 022C72820CD
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2024 09:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B6F20B04;
	Mon, 20 May 2024 09:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RqulF4ol"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F70200A0;
	Mon, 20 May 2024 09:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716197382; cv=none; b=oNwKvLqBavjU96KxldNy3FjpB1ovTrW3RxTfmfq293tp9cwOiKPjQBrDsW1pQctve8Z7G8dPUKPuCDpTxOGCik0jybew0b0tDmps6rdkHfGevMSP7EelEEF94qNktp4SrvViVRYJqq9ZTqDYXivcHdk0a6lJprN0mhTdS1s6JFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716197382; c=relaxed/simple;
	bh=wkIQ0EfC9ZXbexE0omEhycHvMS8UHOTjdewsZ1jd6F0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C3TcnVYnLt2OF76xIoNhuaWXpNj7Bdu0cHD/Z3IeHgPtqnBAeIGU4XkQaz4zFNqWnMFmHui1F9oBnz45cjer9doRtnJnGpcv9/6rgDufy2QriQoMR9o8zHEQvSZ59tnGmykXLJZ+hj1aZrT7Qn2R0FIaV/LAZuNCdF7odAUzIvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RqulF4ol; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D2CC4AF07;
	Mon, 20 May 2024 09:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716197382;
	bh=wkIQ0EfC9ZXbexE0omEhycHvMS8UHOTjdewsZ1jd6F0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RqulF4olbfNpIrNEey48enGnwQj2usi66rGuzVHEz/MOxkw4AxlmVsSOJGnd3WwgR
	 e/CFtA50rbSsEbAIHxKIn8Su9IIoym6FAPESoYyxNwbDQJaSCCWIGNY2adTR1lgdMi
	 y8BrMSB9CpzQNnrDF/+EC69TZg28xL156UYxOKiAZbFr0YqwPXzZ6WQUOAy/vrnJx/
	 cXvdePAetd8/PZ8wmBRT/S3PAy+Np5w/hYHZeDku4ZncQsmHfnDCe0Fr6ZEPl2kbdm
	 TCIo0DNjzLhvB/0tWhv394WzXKMHZO51Hht38tUNkqD5gv6bNQiXdNF0lDJr8W2s8T
	 8AdDgU+NUC/jA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52327368e59so4560741e87.1;
        Mon, 20 May 2024 02:29:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfTW5RFSW3Ye7ozusRSCfd6/oLHwHq3VTAdRUDBVXNVgZ1hrYyQDm4Ge+xDa6kUTmxNUXt2y4+kPDAFvgS2nex3n5ONXl1Y44N5WsNHkLKXMNt9oGJ4w08qbcYRO96OUWhiYi1h/4c5Myfa+VjbtikU5FPuVMcET3xokrfRA0l/Ayz2D5HNBEIrQfbfx8Z0w==
X-Gm-Message-State: AOJu0Yy2V0ZbE3jqb7uTXR15iOVk73GRrXXwBkkrE/VcyNsGbgYgJEKN
	OMrRJcUQ9YBg7RIV+J5CT3fdhlWvDBlwdJ6QIc/cRvnARu76skStCBz/p1vaqRpWDOdJBdIfaoY
	fUZD0jT4J0coshEv0D94aqcg0jQs=
X-Google-Smtp-Source: AGHT+IG54mJDXF0fFaV3TW54jIR7MyX+7xAvdaOhqvKFhOkcSnI8a2h5otSCeeeNqIiWsDxiscl5AffELnPKBQ8FWAM=
X-Received: by 2002:a05:6512:290:b0:522:32c0:bb6e with SMTP id
 2adb3069b0e04-52232c0bbf6mr16059976e87.23.1716197380961; Mon, 20 May 2024
 02:29:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240517042839.544650-1-kris.van.hees@oracle.com> <20240517042839.544650-3-kris.van.hees@oracle.com>
In-Reply-To: <20240517042839.544650-3-kris.van.hees@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 20 May 2024 18:29:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS6r4RUhm46g2Oop=VFPX08ibtadhiceH32Uo0CU4JL7A@mail.gmail.com>
Message-ID: <CAK7LNAS6r4RUhm46g2Oop=VFPX08ibtadhiceH32Uo0CU4JL7A@mail.gmail.com>
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


This 'depends on' is redundant because this config is
already located between 'if FTRACE' and 'endif'.



I believe 2/6 thru 5/6 should be squashed into one commit.
Adding only the config option does not make much sense.




> +       select VMLINUX_MAP
> +       help
> +         When modules are built into the kernel, there will be no module=
 name
> +         associated with its symbols in /proc/kallsyms.  Tracers may wan=
t to
> +         identify symbols by module name and symbol name regardless of w=
hether
> +         the module is configured as loadable or not.
> +
> +         This option generates modules.builtin.ranges in the build tree =
with
> +         offset ranges (per ELF section) for the module(s) they belong t=
o.
> +         It also records an anchor symbol to determine the load address =
of the
> +         section.
> +
> +         It is fully compatible with CONFIG_RANDOMIZE_BASE and similar l=
ate-
> +         address-modification options.
> +
>  config BOOTTIME_TRACING
>         bool "Boot-time Tracing support"
>         depends on TRACING
> --
> 2.43.0
>


--=20
Best Regards
Masahiro Yamada

