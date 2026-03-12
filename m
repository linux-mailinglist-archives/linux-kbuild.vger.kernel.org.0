Return-Path: <linux-kbuild+bounces-11893-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8P2gNKT1smmLRAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11893-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 18:19:32 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6867A276811
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 18:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81DBA3059F11
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 17:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19FB93EDAC5;
	Thu, 12 Mar 2026 17:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TeEOCKhG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8794D34F481
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Mar 2026 17:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773335956; cv=pass; b=TDVlPySuAbc4x7EkDgmsTTCFUmGtHNnnmClD4XAbB7PzSdtcfHxCdUntpb1GfkfIgV1fEQgpkd896lr06aPH+bcWtxB129fWO5WAK5JO2b9HmqpeFm6lUhqtZtzZxQK5q979KRy2TXYPBuSy0nInm1kpFDtKN13TpIhvQpWTHMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773335956; c=relaxed/simple;
	bh=FcuzOrt8CzOV4rxc+ZCEf+asw9BvAvJuhmnBpc7COdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrAfB9t5xOl5xLP17j6tjY2OLj09DsiFiS3X8Oicn9XDHKluH4RLCHIPqLZ2YH0rRM79O8vSbWhDr4RJ1wYPlcyRbXqtKkdhaW10Z60p2eB7SNhKJaZCuRmRs54Z4M5lRy8bBbGOyKQmm5zFfMnAoBlgPeuwTySctmaWa6kEvpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TeEOCKhG; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ae49120e97so6165ad.0
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Mar 2026 10:19:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773335953; cv=none;
        d=google.com; s=arc-20240605;
        b=aP7ecYfCRBlltd+HVpgL2V+nGln6DWuoPrfXDVXJix+wAj59NpXygOm0T3SE1dNVE/
         Gakem1gb+qNvJ2yLec+ZO045cosJU6wsKD33TsCpMsVM7WMfIN4GuqsADQyIe81V9Hum
         evMPJpsdu73dlXGF5vToT+vL0q0wJFt7n/K2Wu2lEzLHvBQXJ6rIygc9+ZiKxhSD7r6F
         H+AcFksjXodR51Oy4GVnVp5Xy2bpvAknp6314Fa2UNoiR7oeh6eTkPNEhNvOSLUPanJ8
         NVGbkGw4swOEXS7ywcHoioDY+8ph0fDKmoffW6CI3ZEeN0oGpmJBNvplt1icFbenNUqx
         xrqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tyrqMT1RraqOR3ZZK0z9ezdihjR5JsMGsGUwXou17EU=;
        fh=b8NKgf+taDJ6GSihU+Fe3iz0ti2rS4EYE4/OGa97nT0=;
        b=Pk/p06xLE//yHAIJ8IDk8h/GGRFvkEyO/vSe2BKcxS3gOHpbnLdIPYWcqq9SOEJ6rp
         X+jwUn9thpPtz1bl3d/swGwj4D9NmfVENCXOfAtfsU/Y+ovFgEJI7pKH347mfa5gogKC
         aB8j4Zq9fn3vz/HhM2A74Szn2YM4lyhiIJ16OdZB6V7tg2B+oibWiGeC5UiXEZeISbU1
         I6xn5jkm2ck9jR76TKygTp7dlDJfYRiWYA8Ph06iNY4gaHANVG0leweurMAeiAQTrTE5
         6zSxQehofVxmDH8Fm1CYRUfzVB+uzceGOuibku4JtGiQCmRGK6m0Hdu00zIdypUPUQNY
         8LTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773335953; x=1773940753; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyrqMT1RraqOR3ZZK0z9ezdihjR5JsMGsGUwXou17EU=;
        b=TeEOCKhGt63Ay+IiScS+u0phzkgda5ovVrP5FPsTXJtCtUv02MtQY0WKcZTAS3yaWP
         vnn784VqT7e6O4cuZAtsRxMNks48CxpFBrD5YmTlRTdY9F4VaId6HiZZuoovqb0ASixZ
         AGs0G53XEHY5lhDxzpripJ8U0STdlPExPhSiOz4zKmpJwArT1WLb5zdgg1TVerTif1T+
         FyMV5IJ6qKfA5VF6iHcGVWE3Xwccamnjr9klbZvpeQ4pm+n/siVDQxPREgvId9rU+/W+
         mLHzb/D9yZJAjFz0x/huGxGQtGJkRc4dfMIqNA1/WGWXCF8+jd/rX2owEGaAXJiEEGIj
         6vQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773335953; x=1773940753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tyrqMT1RraqOR3ZZK0z9ezdihjR5JsMGsGUwXou17EU=;
        b=PUCEyrau1jyjjlOX+OlCuc9eCDEzPhgK6vwUYiRbDFLgRMMc1WWDKfDYpS0eCeVhbP
         80VIof4utC1vbiO9wy/fQgoj/aizJSX8UchAf0e9sOLBUw+7UwyH0YY/2Zw+dywhSeQa
         WWFMIGwCWy7waTUXOTvmk1X01LYqAfHTdoaQHOHi6czkfNjtRhLKg0aLXGbBvp6EOQr8
         EZQzYRpGwJJ8kK3WI0U7jYPP6eAmscm/dbfYDgXcqmtXYuYMYA6skb4iY9cErLERxncD
         EAlIWIZAyvurAeHYem+Ia+5+4jJfqVXgOQehKlHTpPzHO46o5jLpa8IIyYZQn2Fp9fMI
         wK2w==
X-Forwarded-Encrypted: i=1; AJvYcCWqpQhJxEjY3rZQM3MfrUHcfFG1Xbv5/Pc1c+7xjF1hP3kDIjh2K76sDcg9Ql234fnrGR7t0PFYV2u/MBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG0TK0eNuB4M60N4ZH4suz2qcc8twW6NzmtVTz2t6pk2pV1gCt
	aDUc44+QJoVimtN6szFG/3RfN3HmyXSTn1749iE6KRn2+UHSV8MSRsa1uXIPNMjIByUZDIW8jRy
	vgV1x3RZCQZjtUN41WamwxTCxZwdbk82plFEDmEBN
X-Gm-Gg: ATEYQzwgdoknhUNq0RPk/DzRvyQP3CmGOeWfhvBCZJyedzoUE3dpuiHMFwjGu1viDK6
	5gThWwSuuB2YpfzrhholWz6psmeNSGLdOzsN4URg7hrSCOgsKaeRMevHJ3Q/ZsF/VeV5+L2G7gl
	/NqxdWk93M6IZLdtnA7iHTXMFOs9iepNJDijZdylCmGbfsYCIBDKVbgnAp0fKdx9gq7Ai3gmPXh
	fU/MZzuvlR8Vwp6OY6mfi4bTCr9n2THz1VOmJTS88Dut0Egvo0CvDf7SKINOIApsZc1xOqWGe77
	A+qouQuV5xrG+0bQ5JtH69Eb58LVnjLPN/R9
X-Received: by 2002:a17:903:124e:b0:2ae:6432:8f77 with SMTP id
 d9443c01a7336-2aecb880cc3mr9165ad.17.1773335952229; Thu, 12 Mar 2026 10:19:12
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com> <20260311-tools_build_fix_zero_init-v4-5-9e35bdb99cb3@arm.com>
In-Reply-To: <20260311-tools_build_fix_zero_init-v4-5-9e35bdb99cb3@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 12 Mar 2026 10:19:01 -0700
X-Gm-Features: AaiRm50U3ZuNTb9znfrdFL1Z7R9QSzl9qCksbNeUFXxnNuOwB-32dLFYQSGvW9M
Message-ID: <CAP-5=fUOYsnbB4B0khUetRWOFMtHuO6_ESG30b1ZW01n_-gt6g@mail.gmail.com>
Subject: Re: [PATCH v4 05/30] bpftool: Avoid adding EXTRA_CFLAGS to HOST_CFLAGS
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,google.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-11893-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[69];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[irogers@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: 6867A276811
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 1:30=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Prepare for future changes where EXTRA_CFLAGS may include flags not
> applicable to the host compiler.
>
> Move the HOST_CFLAGS assignment before appending EXTRA_CFLAGS to
> CFLAGS so that HOST_CFLAGS does not inherit flags from EXTRA_CFLAGS.
>
> Acked-by: Quentin Monnet <qmo@kernel.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/bpf/bpftool/Makefile | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/tools/bpf/bpftool/Makefile b/tools/bpf/bpftool/Makefile
> index 519ea5cb8ab1c0ee31acc67fc5f96b40e21005c2..3e7d8359e1b2a81a29a47544b=
e8539e3b191a0e8 100644
> --- a/tools/bpf/bpftool/Makefile
> +++ b/tools/bpf/bpftool/Makefile
> @@ -81,6 +81,12 @@ CFLAGS +=3D -DPACKAGE=3D'"bpftool"' -D__EXPORTED_HEADE=
RS__ \
>  ifneq ($(BPFTOOL_VERSION),)
>  CFLAGS +=3D -DBPFTOOL_VERSION=3D'"$(BPFTOOL_VERSION)"'
>  endif
> +
> +# This must be done before appending EXTRA_CFLAGS to CFLAGS to avoid
> +# including flags that are not applicable to the host compiler.
> +HOST_CFLAGS :=3D $(subst -I$(LIBBPF_INCLUDE),-I$(LIBBPF_BOOTSTRAP_INCLUD=
E),\
> +               $(subst $(CLANG_CROSS_FLAGS),,$(CFLAGS)))
> +
>  ifneq ($(EXTRA_CFLAGS),)
>  CFLAGS +=3D $(EXTRA_CFLAGS)
>  endif
> @@ -88,8 +94,6 @@ ifneq ($(EXTRA_LDFLAGS),)
>  LDFLAGS +=3D $(EXTRA_LDFLAGS)
>  endif
>
> -HOST_CFLAGS :=3D $(subst -I$(LIBBPF_INCLUDE),-I$(LIBBPF_BOOTSTRAP_INCLUD=
E),\
> -               $(subst $(CLANG_CROSS_FLAGS),,$(CFLAGS)))
>  HOST_LDFLAGS :=3D $(LDFLAGS)

Should HOST_LDFLAGS be similarly moved? Otherwise, it seems target
flags in EXTRA_LDFLAGS will be added for the host.

Thanks,
Ian

>  INSTALL ?=3D install
>
> --
> 2.34.1
>

