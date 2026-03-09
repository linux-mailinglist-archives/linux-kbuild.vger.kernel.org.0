Return-Path: <linux-kbuild+bounces-11707-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cK7dEjTkrmmsJwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11707-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 16:16:04 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DFE23B7B1
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 16:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36BC231225E5
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 15:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24ADB3D4111;
	Mon,  9 Mar 2026 15:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v4xaBXqp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCC83D902A
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 15:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069029; cv=pass; b=bLEWeQ68b48EK/DkcgAieC6DLC+3oAd2egNIEy+v+tMq+2f1XdNgF2RhgAH+4H8syxCv4aFrtGNii1KOsZNA4xPruiY12hVYU0ahzaCNkom+jvp75hJlcc64OPoN9B9XQP05265/eeaUwKpctt91L8WuMsLus2gPh7KupSdn6kA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069029; c=relaxed/simple;
	bh=5i8qPmQzszVgv/IzZW6/JLkFuKhxnzZQEpxh8nw5jy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WHir7+51Icor7V1p6ftTYIYX+q7uFbLpQTUuD3MFHoKJCmDlJSUai2Apaz02QvkKNYCELngf4MEELhiQeQUqYJMPPfV0M8Xy4fXVMJwH+Hr2d987DI57OFbGvY2J+93PNJrSfpk30pQO2EzmarAf2aMqb0mnXhEIXWrECHCsFnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v4xaBXqp; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ae4b40999bso157455ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 08:10:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773069025; cv=none;
        d=google.com; s=arc-20240605;
        b=HgsPnVpcBiHj5lERbl0VhROxB0AUgVhH6Q0g1t7ftgJa17tg2Ry4/Yo3NaGVONkX4F
         LVJtk4AVbBK+J0pfBM4pQPcWrXn/8iRViz+NUOPFrT2TJyH4AFGqH/f89AAIM8Hg5Pew
         /4ULNjrFLTgW+GL6M9FKNgLeaS4/K2wf+UPZOMsuZzuA9jxh2D0GfZJU+cS925NZkyd7
         8OSyJBSbw5/fmFiCvqSr1KinKGPKswIBWfSfxT2k0NAreVOYy8JJarDbf309hSQrhg/E
         z2mtcdeBNMcxRugDSu4XfLQV9OscHQwW9tNecb5CfkkyopZwVclkKyFFyMnVifH8fbuf
         YVHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6FbR4+wo96W1dWPj028FNCvwM/SPgWjQY/Nh61K7Dcw=;
        fh=FNL4DbrbPK+XyG4EgH5SWorq7acG0ZhHDnjjz7LxIvQ=;
        b=KRfFawUVCXZoBF1Akwbv4sWNMBHyt5xLPGpMI4MxkQd7WBwdS4x6bQGx+3a6CrbJlh
         LQ7Jx6Kv8ggKWz5kLR0GEcCM+Jk/sg+N6Ktnu3B5QNUZSgn6VjhKspLi++jul2AV2+aA
         dN4maw9mrRN0uCvYaaXWZKNmnBQp7ASQi2ZsrevUykmLqbkjcKr0Fo4AEExvcQzMhVYJ
         jYOrfyZWGQIEYSBa46jjVenRpcU9aYJkzu7yfAQq75aW8eiVZZ/o3JVqZttYvgrogiBs
         073YebalZElC+UqVpoBhuMHubT91eH+1aMbbz43j8a20zWY87zpOibLMlqcldc9Xrucx
         BdSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773069025; x=1773673825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FbR4+wo96W1dWPj028FNCvwM/SPgWjQY/Nh61K7Dcw=;
        b=v4xaBXqpIuT0bcg9isx0DX3xggBhIWuO0XIcHogy6/uqvk8alDDzE93ExeqxdD3Sfw
         LCsZzFCDhtusjba0bkIhwHbSNGnhQUO6vu3DNZh87taQZRfn9+D+Elpv+Ynf2hYyADuz
         VDxp+QEGAuKbb1r5F172LIHP5d2NAt2N3iblcYpHCIlv1eElakEj/77cV9F2s1FaMMzG
         Xz6mCsiAU8By3/xu9Aslk2tRWeI2Su3wnNde9NrXGaY5wBmyNF+gq6vH5G2+UBxbbxAh
         kuhAtfvIecAhpClqOUsl6E+B7CyePTnCR/uGfYsdWerlfkA7OygbIp5yFuPn9eLdjs+j
         wRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069025; x=1773673825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6FbR4+wo96W1dWPj028FNCvwM/SPgWjQY/Nh61K7Dcw=;
        b=GVjgGRuSD8gPm3PQdOiiJ7EX0NanZCOoxGAYZDney5l/55OOIjLLe8mTygMVvMMfwP
         UgwJdDdotZsoJH4vnUwAaokp+4fb+aCJuDP8tFvUbUGYfsM2o/qY4vjmWjrJ+3D0978j
         4f5cdRhD+bzJ3v4Ge+twUYM+aOck5aXTU+j5BhrIHc+MX39jygh0k66H4JpKFGEmoGyX
         HMQv40ECfgEJ2VDx3vvM2g0+2GnrLFDmy8rCFSqJVp9JLNh/V4aqUXmSh4NTxl8s/TDn
         WqICFUL3QQWQj314e/xkrHTAJeWhkyRPr/rVNxpIJG5SGPD4lqndKZ2NviqpiKWGZKwK
         iANg==
X-Forwarded-Encrypted: i=1; AJvYcCVyhm41HdfDJ+ASl3PEK7+qomtY4KZsDlHF4fQH4ns6QE8zAn4EVnt2k0tmW6KP1fjbEMC7hXE25yKmQ6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxduooX7NJrs7wWH0QLfFs3QnhHKzKzvrubm+lspJXRnupbPCtM
	eQ6pBPbwCF6uvAEdb5tp9xSUPcuneoyOC4X8CK+QNKKFDcdZVsVrYfn2wgLvUYEzJX+ISXFhv+C
	v0HHIgeFwJ/7BdGzyEV3uesxXzXQhvo6c5xRKVVJQ
X-Gm-Gg: ATEYQzwqglHpyr4hhXOweb8nOUMtUlHJwaQyzbimyyoonNdzVJ1ZYlYqtIr5Dy/fcgs
	H20XQzjuGRd/ggyUePg+bTy7Y5l89HMzWIxQaiy1zi/JTkisjSxrUdBg6xahBCsCrV5TONvw1Df
	w4t00wDZD7t1D6LNi3j7SioGuzooGpYDcLBIzQ+GIeh85YVycJ6pZTbIx/afit1wbzuhraYpJKK
	69zhiPjdiqBC+9AiRmM7r/3YEvAylTko0FVZQjJ9eD4zYLld+fstbqJSKm8KrAIoy9NbzVt2ZL6
	LhcH7beL7h5qUu1873M97vFy90rBpIzn2H9u1Q==
X-Received: by 2002:a17:903:1a23:b0:2a7:6c4e:5914 with SMTP id
 d9443c01a7336-2ae8ad1c62emr4122395ad.6.1773069024342; Mon, 09 Mar 2026
 08:10:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-3-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-3-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 08:10:13 -0700
X-Gm-Features: AaiRm53Q6tq8LuPIrmfsSi3or0ZsIgIF5Wzq_daN-fddH5XU6fwZ-9Q1_o7c91A
Message-ID: <CAP-5=fUjJ1QONNLNyJL7Ugc3=44sJ2i10wpQNoGtM7Fnd5wJ0g@mail.gmail.com>
Subject: Re: [PATCH v3 03/30] tools: lib: thermal: Initialize CFLAGS before
 including Makefile.include
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	William Breathitt Gray <wbg@kernel.org>, Barry Song <baohua@kernel.org>, Qinxin Xia <xiaqinxin@huawei.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Robert Moore <robert.moore@intel.com>, 
	Len Brown <lenb@kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 97DFE23B7B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,google.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-11707-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[69];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[irogers@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.990];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:email]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 9:46=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Initialize CFLAGS to the default value before including
> tools/scripts/Makefile.include.
>
> Defer appending EXTRA_CFLAGS to CFLAGS until after including
> Makefile.include, as it may extend EXTRA_CFLAGS in the future.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/lib/thermal/Makefile | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/tools/lib/thermal/Makefile b/tools/lib/thermal/Makefile
> index 41aa7a324ff4d76351b89d7d7cf382df3fc14052..50efa97163fc089455161d6b8=
1db13aa0ae41af6 100644
> --- a/tools/lib/thermal/Makefile
> +++ b/tools/lib/thermal/Makefile
> @@ -23,6 +23,14 @@ INSTALL =3D install
>  DESTDIR ?=3D
>  DESTDIR_SQ =3D '$(subst ','\'',$(DESTDIR))'
>
> +# Defer assigning EXTRA_CFLAGS to CFLAGS until after including
> +# tools/scripts/Makefile.include, as it may add flags to EXTRA_CFLAGS.
> +ifdef EXTRA_CFLAGS
> +  CFLAGS :=3D
> +else
> +  CFLAGS :=3D -g -Wall
> +endif
> +
>  include $(srctree)/tools/scripts/Makefile.include
>  include $(srctree)/tools/scripts/Makefile.arch
>
> @@ -39,13 +47,6 @@ libdir =3D $(prefix)/$(libdir_relative)
>  libdir_SQ =3D $(subst ','\'',$(libdir))
>  libdir_relative_SQ =3D $(subst ','\'',$(libdir_relative))
>
> -# Set compile option CFLAGS
> -ifdef EXTRA_CFLAGS
> -  CFLAGS :=3D $(EXTRA_CFLAGS)
> -else
> -  CFLAGS :=3D -g -Wall
> -endif
> -
>  NL3_CFLAGS =3D $(shell pkg-config --cflags libnl-3.0 2>/dev/null)
>  ifeq ($(NL3_CFLAGS),)
>  NL3_CFLAGS =3D -I/usr/include/libnl3
> @@ -60,6 +61,7 @@ INCLUDES =3D \
>  -I$(srctree)/tools/include/uapi
>
>  # Append required CFLAGS
> +override CFLAGS +=3D $(EXTRA_CFLAGS)
>  override CFLAGS +=3D $(EXTRA_WARNINGS)
>  override CFLAGS +=3D -Werror -Wall
>  override CFLAGS +=3D -fPIC

The change lgtm. Running this patch through an AI review showed that
what looks like a typo, CFLAGS becoming CFGLAS, is located below:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/tools/lib/thermal/Makefile#n62
```
# Append required CFLAGS
override CFLAGS +=3D $(EXTRA_WARNINGS)
override CFLAGS +=3D -Werror -Wall
override CFLAGS +=3D -fPIC
override CFLAGS +=3D $(NL3_CFLAGS)
override CFLAGS +=3D $(INCLUDES)
override CFLAGS +=3D -fvisibility=3Dhidden
override CFGLAS +=3D -Wl,-L.
override CFGLAS +=3D -Wl,-lthermal
```

Thanks,
Ian

> --
> 2.34.1
>

