Return-Path: <linux-kbuild+bounces-1836-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BB98C3AEC
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2024 07:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F42028135A
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2024 05:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54EC014600F;
	Mon, 13 May 2024 05:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wri4Q8LY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215261EB2A;
	Mon, 13 May 2024 05:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715577633; cv=none; b=E6sGtSc+iLsUmIWD215MTqUcRnRqZ9FxXY0iCyYJUoFAF8JyiRSruTqLu4KowcZjJA4iGeXr3EvCvmV6JRUFepNBaRHc0rrGET9hMgglAsHMKnU0PyNqbWCaQFsQ5MwxhOrS4alu4tAcZY9nALLWsj5Mkec/OYwPzksQ2a8/23Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715577633; c=relaxed/simple;
	bh=Q5kyetLTe3bu2/jqdgn9X0/NDbixKX0uq3tQKmhPsQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=StSS8bC2DsRb5Ww5BQI+PxrEr+TIp4yHSATM8IUxuQ3T23DXpJJ96Nlo55eQaq5BfTXpBwHM7jaS1rNdEJhK8ikB/Ew4YSSs9dXxUwG8DNJmKEfBokwuH3spOnAKMI46+9PTTA+rmQ8J4RhifL2kAYQzNMBUi2/Szmkn7BKqM3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wri4Q8LY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3564C4AF07;
	Mon, 13 May 2024 05:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715577632;
	bh=Q5kyetLTe3bu2/jqdgn9X0/NDbixKX0uq3tQKmhPsQs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Wri4Q8LY4pnkZQgJ1F68c83i+pYkjW1u84SL0dCD0ElcivyjSuquix1eH2lGRcE58
	 C3uhwc2TlJWeJbohoexVEtuM8xCy8QAgPROWPSOKnJ1ccOjVJyMrEK+lU6II+GZQSg
	 m+l34DNJGFxS43kFM45TZU/l61bTcae5daGW4k19iqjzS9N9y7HEP6LtNScP6scHfl
	 Mb7U7nLQHAilqwiGc3W6uP7wl5E6P8j/2a8bz33TaGXSYCdOdvYt1Yk/VgQV8mPmCj
	 7qZ/p/GpRFxB5RPPqZSWRgb5vvRwEMSU3VA6DdNHnFD8t/vjfZpXMx5TROpEP4u8e9
	 6oirbUlTW4UlQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51f0b6b682fso4090492e87.1;
        Sun, 12 May 2024 22:20:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdPRBwKAdf54erEmJJvZfrYLEZh4EzNsDz6FRQEPkbzHzg4enayXO+1hg2tM8X+kmWfr2Xp6msXK1kBd7mxn9rBqUP3XsR/IX/ffbcy+X1wLjmzHJD7l/KeI2EuzwYqyaj0Ju+bKkOpRLsDTILT187ns6u9vyzIl6rhGTDvdQXEUnDm+YKZIvHCV7diSVwRA==
X-Gm-Message-State: AOJu0YxtNia1qSKg7qlsPuJqavbLjzATEDQqsZwZRgFZKsIKzav5HgY1
	QIzhZICJJg96N7cDKqq9cinSQdYvj62IYihdVE733aBXczwqQmRkejlqIpzTKCtqX83ET1ZLpDm
	2kKmZRATAPymW1TMNacrRidk8Luk=
X-Google-Smtp-Source: AGHT+IG2Uog2Sy10v5Bojkc32ARphC3K3tnZ+JQFcEeM/YyC8oDNlWAyYPNoOtpiMMFlQfVY5uOSwFgqcewHrCIpp/s=
X-Received: by 2002:ac2:4a9a:0:b0:51c:d05b:6b8d with SMTP id
 2adb3069b0e04-5220fc7bd7amr7172332e87.23.1715577631235; Sun, 12 May 2024
 22:20:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240511224035.27775-1-kris.van.hees@oracle.com> <20240511224035.27775-6-kris.van.hees@oracle.com>
In-Reply-To: <20240511224035.27775-6-kris.van.hees@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 13 May 2024 14:19:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQOP3E9CbbaxuXdpQ_N4CoKr57no1U3TWynp6BHM9eFKA@mail.gmail.com>
Message-ID: <CAK7LNAQOP3E9CbbaxuXdpQ_N4CoKr57no1U3TWynp6BHM9eFKA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] kbuild: generate modules.builtin.ranges when
 linking the kernel
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Nick Alcock <nick.alcock@oracle.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Jiri Olsa <olsajiri@gmail.com>, 
	Elena Zannoni <elena.zannoni@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 12, 2024 at 7:44=E2=80=AFAM Kris Van Hees <kris.van.hees@oracle=
.com> wrote:
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> ---
> Changes since v1:
>  - Renamed CONFIG_BUILTIN_RANGES to CONFIG_BUILTIN_MODULE_RANGES
> ---
>  scripts/Makefile.vmlinux | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index c9f3e03124d7f..54095d72f7fd7 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -36,6 +36,23 @@ targets +=3D vmlinux
>  vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
>         +$(call if_changed_dep,link_vmlinux)
>
> +# module.builtin.ranges
> +# ----------------------------------------------------------------------=
-----
> +ifdef CONFIG_BUILTIN_MODULE_RANGES
> +__default: modules.builtin.ranges
> +
> +quiet_cmd_modules_builtin_ranges =3D GEN     $@
> +      cmd_modules_builtin_ranges =3D \
> +       $(srctree)/scripts/generate_builtin_ranges.awk \
> +         $(filter-out FORCE,$+) > $@


$(filter-out FORCE,$+)

  ->

$(real-prereqs)



> +
> +vmlinux.map: vmlinux
> +
> +targets +=3D modules.builtin.ranges
> +modules.builtin.ranges: modules.builtin.objs vmlinux.map vmlinux.o.map F=
ORCE
> +       $(call if_changed,modules_builtin_ranges)
> +endif
> +
>  # Add FORCE to the prequisites of a target to force it to be always rebu=
ilt.
>  # ----------------------------------------------------------------------=
-----
>
> --
> 2.43.0
>
>


--=20
Best Regards
Masahiro Yamada

