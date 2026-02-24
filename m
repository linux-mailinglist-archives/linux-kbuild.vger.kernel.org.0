Return-Path: <linux-kbuild+bounces-11409-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UN0qG4bcnWmuSQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11409-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 18:14:46 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5BB18A639
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 18:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C5223048099
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 16:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D670D3A7F6B;
	Tue, 24 Feb 2026 16:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0R+JxOSh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A033A7F55
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Feb 2026 16:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771951332; cv=pass; b=pzRc9l1+BoW220et/Qw6MhfZjhhRbi/nltEFGkPpNAmVS624DkgvfRY3LTi+OnYzwoQa+If56PO+XxOQtuGYaF07BDpMS1xPhwzcaDs5G9ow7lEhQCRNFkFJJtPcBfql4PDsrsJ7g/BktzasuvbyPWLtw21bB3bUMr7SC3So8ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771951332; c=relaxed/simple;
	bh=NcSXw2HJsJraWVfV0B2TsfnQhljzimFsSoywmgza1gI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tHi4VdxmlyxPxKSleWhppStDjSF2BlJJH6vO3I98F5hHSRI1tBAVw1WhwOwWb0u18TpE5TDfdvfs2nN6aGU6ud2UV30foydvyNQMvaE38AOirQ+GvcwS6Hsv891StAx5ya5aqiPBNgX1h2lxQqxfoKEJ+GNkvZCYTabNdsJK2fw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0R+JxOSh; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-126ea4e9697so1116c88.1
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Feb 2026 08:42:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771951331; cv=none;
        d=google.com; s=arc-20240605;
        b=Q6egc5t/i0wyPax9eyXVoXuLoKi4vI4cXxM3cMWEsUske6MwOxERKdJiJKoOz2sNcg
         hUcMik8xLj1V4fYYRMrN6NUuozIw7qXeIcr/mC9ydHXsb6AMj01qSQCSFhjadWUmAQzl
         oDPznqUvF2eFD7ig/f1JEkRTSMwmqwuUEhsK+E+Vs9acu2MQaW+QZ/bnd4NPO7tX+1lj
         ONv4miW6Zfi+XCtOkL75zAbgk1DLkJp+U86ukct26Xw5sL07lEo+FcxLanu4TuX/8wvq
         Vd4NhUHtp5SlgADsTWsx8QT1L9AVlN+687BOWdhYn+TKAM7nx05C92KPJM9EoLZLHTdH
         gxRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kgwg6ZY+UwlSzzQ1IYs4ifU8gB4nY+Z3oaeaPRk66as=;
        fh=YacEMDQmgI8blU7Grc0uj93dUWplxjFVzgee+Mku4nE=;
        b=dEFZqFkHoCC8DBwQHoLeCREJI3XrZHdJbouQ5VQKGUtTDYoc4AFCzIJ1aROi6WqY07
         WMAButz+gaG7guuvngGtUxREI+XgHkS7cTW8JGe70IW7QqNW7qnpWP2i44BzUeSG7XJh
         opFf1UHk9pREbKqhvIBcSsxAMX81+dYyNmgI3ZLZlQZaO0auNqjRT4EzunHBYcdPEoke
         1kbtd2CPRZPQ5lRWjdYF80XA0ggGuHQYyzflsSaix0J0G9q12uPDUoTjWX0mkBbZkjhh
         lHLtt/TpeGXwR5ufjQK6o8cEFObWOszYPcb4hI3HQoJYTrCsKtw+XjBOlSR2fWzUFCEW
         IYpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771951331; x=1772556131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kgwg6ZY+UwlSzzQ1IYs4ifU8gB4nY+Z3oaeaPRk66as=;
        b=0R+JxOShw4GlFbZkmUvJX5R0JviYF+CIDxWTK3iU95wXV5uxBOdTxCbdPoGYjBwIZF
         EgvEoGZZyfMLU0c3ntChn2dEwpjYGgdn4MRITHU1i8TA/AUg5ImzOVAhSUTxwy3dNYBF
         rwwjKNpcuYzoKLkxmQaoPQqEzisAh2+XwQJs39RMabB0MFnxJVct/RtKoYTOL1dXfc2K
         /4xNX1ufQnIGKX4SWezhgpQuCRyZgZo/GDGiT+FP4tSsMGgtjpycENturKlRlcV4ohru
         1fhhzkA0ZxghJ1GyG4H0kndWwA0c7z4oeoEqiS5tAhe9DXPrqtkiEs6RdIaT4rGEDPQG
         OZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771951331; x=1772556131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kgwg6ZY+UwlSzzQ1IYs4ifU8gB4nY+Z3oaeaPRk66as=;
        b=i2WOzRUX8Ppf/axHm21ESUAUz8WdIa1w9sqmBbAluYMttzYhR5qdJyoFkUrtu05rC4
         9knMSuNcNxThVI/OIjwbGKq0p0zpCavhaWT/xBeHKz95Flxivsu61wh43S2j3OFpsXet
         h3RuHF1+EIpeoAHVNjWuk3X3n+jOeDTLw2T/159NGeBbwQPtQth7m2XNEADirdWA7umg
         /Z4vjaIS78hFfaVfPUEeamXpTGZTEIwGXdnFsB+VyQbh56sccNZ/73Gmf2MCQp4CfRhb
         IWEEJ98Ts+jx4vE5NEqJo2Lelr3IVZ9aEx/ZFZEDftkM8baFrD50J02mGSBp6hhQaFiv
         Jdyg==
X-Forwarded-Encrypted: i=1; AJvYcCVP92zvF6clIkfkfXs2HdVMf0rLtkMX0FvbAoGp42dt05WWdxUEjhmwtgXVnlUnkVV5/i0eOm/hH3OWFWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHNEJROd9Aidwdjia5QYi+9MMLzNQjny9arRfVHoJEXhjJBn39
	QfsDvK70oluPUdUGZPZ5z3R/b/XDOGMzYYjQdjo6Ok4fb+oDa62kIkRNOmlZUWrlsP52TJxxWhf
	T2C8mL1Br+zv+xG/n9c9MXEPKnrAReG6eAm8iXWux
X-Gm-Gg: AZuq6aIyPtSkprk2eHJXmjPpveCYXta5wSBjoj0AphMhzIODrq489gGEYFh4RQACINr
	L4NYush3vWaeAaM7D1fAVEDr3dIjKaxeOmHRGRYveSTZto5hVzrgBD4OMbZmAjmbAMflag8/4nP
	++QUMsYdBlcKyQCrXcciVNjvFm3FJa31mchi4+ItkoFBNYg59T7NMXtswDOr5jg4ixxXjD3/H+5
	+wuaRrB+bp+wjlQW5kyhJ8g5ZIz71qfTepokWb2JzGBedJHymmr+0/3srbk/al/pBBgKcXKSkqC
	K9y9d3+KKWsiEZJ5LyvVYMw4/ztyOM5D/qYY
X-Received: by 2002:a05:7022:1e10:b0:119:e55a:8087 with SMTP id
 a92af1059eb24-12779ca1e66mr162200c88.4.1771951329849; Tue, 24 Feb 2026
 08:42:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218154800.367720-1-9erthalion6@gmail.com>
In-Reply-To: <20260218154800.367720-1-9erthalion6@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 24 Feb 2026 08:41:57 -0800
X-Gm-Features: AaiRm51usgiRE1d1KtF1udatehmVlkbDM9zzDjPMxJJwgnnXlY4zfmGsIkXNl18
Message-ID: <CAP-5=fXLNybYv08dDfAqAsDBzbOPzQY4EZQvdY0WZsfrMu9Yyg@mail.gmail.com>
Subject: Re: [PATCH v4] tools build: Fix rust cross compilation
To: Dmitrii Dolgov <9erthalion6@gmail.com>
Cc: linux-perf-users@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Levi Zim <i@kxxt.dev>, 
	Namhyung Kim <namhyung@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.34 / 15.00];
	URIBL_BLACK(7.50)[perfwiki.github.io:url];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[google.com:s=20230601];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-11409-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[google.com,reject];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-kbuild];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[irogers@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	NEURAL_SPAM(0.00)[0.872];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,perfwiki.github.io:url]
X-Rspamd-Queue-Id: BD5BB18A639
X-Rspamd-Action: add header
X-Spam: Yes

On Wed, Feb 18, 2026 at 7:48=E2=80=AFAM Dmitrii Dolgov <9erthalion6@gmail.c=
om> wrote:
>
> Currently no target is specified to compile rust code when needed, which
> breaks cross compilation. E.g. for arm64:
>
>       LD      /tmp/build/tests/workloads/perf-test-in.o
>     aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a(cod=
e_with_type.code_with_type.d12f4324cb53c560-cgu.0.rcgu.o): Relocations in g=
eneric ELF (EM: 62)
>     aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a(cod=
e_with_type.code_with_type.d12f4324cb53c560-cgu.0.rcgu.o): Relocations in g=
eneric ELF (EM: 62)
>     [...repeated...]
>     aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a(cod=
e_with_type.code_with_type.d12f4324cb53c560-cgu.0.rcgu.o): Relocations in g=
eneric ELF (EM: 62)
>     aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a(cod=
e_with_type.code_with_type.d12f4324cb53c560-cgu.0.rcgu.o): Relocations in g=
eneric ELF (EM: 62)
>     aarch64-linux-gnu-ld: /tmp/build/tests/workloads/code_with_type.a: er=
ror adding symbols: file in wrong format
>     make[5]: *** [/perf/tools/build/Makefile.build:162: /tmp/build/tests/=
workloads/perf-test-in.o] Error 1
>     make[4]: *** [/perf/tools/build/Makefile.build:156: workloads] Error =
2
>     make[3]: *** [/perf/tools/build/Makefile.build:156: tests] Error 2
>     make[2]: *** [Makefile.perf:785: /tmp/build/perf-test-in.o] Error 2
>     make[2]: *** Waiting for unfinished jobs....
>     make[1]: *** [Makefile.perf:289: sub-make] Error 2
>     make: *** [Makefile:76: all] Error 2
>
> Detect required target and pass it via rust_flags to the compiler.
>
> Note that CROSS_COMPILE might be different from what rust compiler
> expects, since it may omit the target vendor value, e.g.
> "aarch64-linux-gnu" instead of "aarch64-unknown-linux-gnu". Thus
> explicitly map supported CROSS_COMPILE values to corresponding Rust
> versions, as suggested by Miguel Ojeda.
>
> Tested using arm64 cross-compilation example from [1].
>
> Fixes: 2e05bb52a12 ("perf test workload: Add code_with_type test workload=
")
> Link: https://perfwiki.github.io/main/arm64-cross-compilation-dockerfile/=
 [1]
> Signed-off-by: Dmitrii Dolgov <9erthalion6@gmail.com>
> ---
> Changes in v4
> - Fixed incorrect target name for riscv
>
> Changes in v3
> - Improved commit message, add an example of the compilation failure
>
> Changes in v2:
> - Map supported CROSS_COMPILE values to corresponding Rust targets
>
>
>  tools/build/Build.include  |  9 +++++++++
>  tools/perf/Makefile.config | 14 ++++++++++++++
>  tools/perf/Makefile.perf   |  2 +-
>  3 files changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/tools/build/Build.include b/tools/build/Build.include
> index e45b2eb0d24..cd0baa7a168 100644
> --- a/tools/build/Build.include
> +++ b/tools/build/Build.include
> @@ -98,6 +98,15 @@ c_flags_2 =3D $(filter-out $(CFLAGS_REMOVE_$(basetarge=
t).o), $(c_flags_1))
>  c_flags   =3D $(filter-out $(CFLAGS_REMOVE_$(obj)), $(c_flags_2))
>  cxx_flags =3D -Wp,-MD,$(depfile) -Wp,-MT,$@ $(CXXFLAGS) -D"BUILD_STR(s)=
=3D\#s" $(CXXFLAGS_$(basetarget).o) $(CXXFLAGS_$(obj))
>
> +###
> +# Rust flags to be used on rule definition, includes:
> +# - global $(RUST_FLAGS)
> +# - per target Rust flags
> +# - per object Rust flags
> +rust_flags_1 =3D $(RUST_FLAGS) $(RUST_FLAGS_$(basetarget).o) $(RUST_FLAG=
S_$(obj))
> +rust_flags_2 =3D $(filter-out $(RUST_FLAGS_REMOVE_$(basetarget).o), $(ru=
st_flags_1))
> +rust_flags   =3D $(filter-out $(RUST_FLAGS_REMOVE_$(obj)), $(rust_flags_=
2))
> +
>  ###
>  ## HOSTCC C flags
>
> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> index a8dc72cfe48..214d8f6d9b8 100644
> --- a/tools/perf/Makefile.config
> +++ b/tools/perf/Makefile.config
> @@ -1163,6 +1163,20 @@ ifndef NO_RUST
>      CFLAGS +=3D -DHAVE_RUST_SUPPORT
>      $(call detected,CONFIG_RUST_SUPPORT)
>    endif
> +
> +  ifneq ($(CROSS_COMPILE),)
> +    RUST_TARGET_FLAGS_arm      :=3D arm-unknown-linux-gnueabi
> +    RUST_TARGET_FLAGS_arm64    :=3D aarch64-unknown-linux-gnu
> +    RUST_TARGET_FLAGS_m68k     :=3D m68k-unknown-linux-gnu
> +    RUST_TARGET_FLAGS_mips     :=3D mipsel-unknown-linux-gnu
> +    RUST_TARGET_FLAGS_powerpc  :=3D powerpc64le-unknown-linux-gnu
> +    RUST_TARGET_FLAGS_riscv    :=3D riscv64gc-unknown-linux-gnu
> +    RUST_TARGET_FLAGS_s390     :=3D s390x-unknown-linux-gnu
> +    RUST_TARGET_FLAGS_x86      :=3D x86_64-unknown-linux-gnu
> +    RUST_TARGET_FLAGS_x86_64   :=3D x86_64-unknown-linux-gnu
> +
> +    RUST_FLAGS +=3D --target=3D$(RUST_TARGET_FLAGS_$(ARCH))

I'm wondering about lesser tested platforms like loongarch, csky,
xtensa but I don't know how to concoct a triple for these. I wonder if
there should be a test for a missing string like:

  ifeq($(RUST_TARGET_FLAGS_$(ARCH)),)
    $(error Unknown rust cross compilation architecture $(ARCH))
  endif

other than this:

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> +  endif
>  endif
>
>  # Among the variables below, these:
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index 11b63bafdb2..f7b936deeaa 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -274,7 +274,7 @@ ifeq ($(PYLINT),1)
>    PYLINT :=3D $(shell which pylint 2> /dev/null)
>  endif
>
> -export srctree OUTPUT RM CC CXX RUSTC LD AR CFLAGS CXXFLAGS V BISON FLEX=
 AWK
> +export srctree OUTPUT RM CC CXX RUSTC LD AR CFLAGS CXXFLAGS RUST_FLAGS V=
 BISON FLEX AWK
>  export HOSTCC HOSTLD HOSTAR HOSTCFLAGS SHELLCHECK MYPY PYLINT
>
>  include $(srctree)/tools/build/Makefile.include
>
> base-commit: dbf0108347bdb5d4ccef8910555b16c1f1a505f8
> --
> 2.52.0
>

