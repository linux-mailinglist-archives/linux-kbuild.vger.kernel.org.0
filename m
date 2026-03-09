Return-Path: <linux-kbuild+bounces-11728-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNkFNh4Mr2lzMQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11728-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:06:22 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D5423E30D
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64483301841D
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 18:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AFC3E9F88;
	Mon,  9 Mar 2026 17:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qReq42Y5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84E83ECBE4
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 17:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079033; cv=pass; b=bS/T+Uvd4bVe2Mw0EmsH3TjWcDqzO7NJFiIkJH+I/bznd/8PWIec7xY98GmRD02bqmTg2sN/DACwm6ADzr1Zz07TLmQJWu9Lqq9QZS3hTIODzARD2xOmhxJecbAU89zPcaDn9Gc0ZnlxZXqWsVixg9/e176jQVenPD90NdQlFys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079033; c=relaxed/simple;
	bh=e7l4SmZBUR6r5igqEW+38ztoAKGAhS0X/5S8zKQD+s4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zmi4B7WhBI24su0aEV+TaqKaoSdoKZVndcK+xKRFQEnf3YtOCPK14quR0zLL7iVnon3loRzvDImup8CM9t8nr0UGhefF7MiIC6bR/kln6y0rG2havmwI/27+zywP1z6W6zSEillO+Da0eo7UtphFL5P2L24DVZeIjRIEtLY9JA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qReq42Y5; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ae3f822163so12415ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 10:57:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079030; cv=none;
        d=google.com; s=arc-20240605;
        b=CMxgsvV4AgTAIl5XM7toFNghgevedsZjORqhZmFjn4qbckQ/B5ZuRnyfBJPL+05mK5
         z2of92iy/nO4wTER6qUVVB2PcpQ1UQem+yx9R+Tq8P23ADIG1mnXJt2qel7Tqajk/eoW
         HojzYUILalEWrGa+2EhghTE5o1em9QJ4ED5u9Qpd4UBZdzanwm8koBKhk1kDd5HQAa54
         p+6a+NdlXpz2Q8QtXKGqkickHDmf6o29j7adq+Wf3xgQGTFuLMPv0Bw+z5oBh+WHKzWp
         CfykapjE73Lxn5VxOJTsaIcOofnvSQtLcCuGDwOcoWJTZ9TBcBIqybiqBl9G4QqBnikr
         nTdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YgaFfLtD6LpB7+GDppuc9zjZm5c30kugkl39n1WKFb8=;
        fh=DtnCiitZMx5+c5lPQlLIgyzhM7lnC45YVPltMedUs5w=;
        b=GtY+xJiY6sOocYM+5SpwbmdGwFxjkgyPEEaPUFWq147I1f2e2X374VMyZl8rjIzmBu
         qNBX3MrKT5qWiJBzofPP3/k9vwUjS8u6ZPvTeSFRrBh1KMxZIklo0mS1PIDYGxNkrkW5
         9c0VHF9pPvj8jZnP6mlgE3ruCMuI7rpaAk2f3FonoBbfNJMh/PB5zDzGKhjDIj/VtJm2
         YSfLyd1MCm8sfy0NH8RaNruwUsRB/L8gjllWfb6PRaYtINhrdR59LulYpv9uRrxW3fId
         DUj2G10R8nAyFlk33M1dBP1Moqy9oOWZa0AKzh15yFFXG2Tq+54O6z+13lSTD7hHrESm
         v8jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079030; x=1773683830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgaFfLtD6LpB7+GDppuc9zjZm5c30kugkl39n1WKFb8=;
        b=qReq42Y5h850n1T4pu9JaSPZOvumGTlG9M+snrUQMy4qvceeMvQt1XR/1duYQkLd67
         PS+6sAeIb5AALtG/g5vK4RcJMpt3DJJfVd+VGNs8VEyXTP1mNLHu9oRQn4pMslTtkKch
         710FP7KjTkPBe/69R8f+r7yi2wHxnZsl8RcXLM+jnS64TksdIJtI8eNDtAGOmPCHZub0
         BOuQuRHTmJxL6c5iiH9Ep+QMbmLPp3YFovkgzxe4AeqcDguZvY7B+YfhP4L4P5MtCcjN
         nkMGjQLal8DaiAI8mkC2PdB5ZDfVZmPGP7YN/gexLTwLAZecN6wMr85kb+Z5W+hqocY6
         gQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079030; x=1773683830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YgaFfLtD6LpB7+GDppuc9zjZm5c30kugkl39n1WKFb8=;
        b=YzSPxHTkai6m34jHlxQKepx6184zHoAhjFhIlKYvd6xUROJY9mbQQMCh5kiZ/1CkgM
         PGROHskNbDpj8VH6+doYeOMZZL+pr3wjCa4TecAPq+wpJijyjND3PaSyV0Up9bXmpMC0
         kzO+dm8khwoB0yXzvvyi2XmJtC/I7lA+MZQXKyX01Tr+B7kci0HLjEWZ0yRb09jtjPf7
         yeg+99NUQAG8DZb1mw9Ih50GU086x5//tKsMUO2D0g7f4BjYQcFjhEork5zQmgjLQ07J
         Lbqfsma6gkGpffgbtRQ/m0/2iaONgjEiYXrrNXllpUiVXqrGgLchr9T7H9+ZuF+bEJqE
         GAwA==
X-Forwarded-Encrypted: i=1; AJvYcCXyipZ18jV4Y2swKAjq/98KiRZ+LTsmddDdWt0voatvCP7yIGUdYQvylh/EFvjuw3MBWyDG3fOtLdTewVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYTM2QjcdUklg9tUJxWoBJsMBhEJRPZJwCbFMpRSVYfvi/QwCY
	UUtn6TkHsswZc6SOZ3Pn3lO59CFGysOYPU/rEpCBf5OjcPV79qDYl2E5C8Q/OjfTP2wzAOaInxQ
	AuuY19xymP2FJ+ns8j6M8aIxRG47pRoiX4mrzgJML
X-Gm-Gg: ATEYQzzXpUPkvsbXshLgjFIjcnfBFWz9FSnPZEPQolq7Da+wjrvRmSogpUveotSOXY7
	RkMoGMf1v0uyU4aoozDQXcdi/AyQT1cBtPETbGnsgvggvm+lcgYDmWm6ONnaxURjVCNFPsM/t7w
	IrpL93WCOV6ozYPJtELoKSoudPQoOi6RUEbSiTW+JUZUmmCoyWOIYSawz+nZaMUJTvb1FXFV8gh
	//a3bPAeCDRAL8k3BXfoQoeJX3zSRTzm8T+9yVLmHymhiy38EqtSgqnAKYoLCjChzy+odv0sGNT
	uJ+M690mFBx1xKj2/m4NPL4YI+PTmkREw80=
X-Received: by 2002:a17:902:f68c:b0:2a7:6fd3:c11e with SMTP id
 d9443c01a7336-2aea30c63dbmr244475ad.18.1773079029518; Mon, 09 Mar 2026
 10:57:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-13-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-13-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:56:57 -0700
X-Gm-Features: AaiRm513FrreYhP9xkA-LN0GZhrOTdf4osjECxyH4jBzskTrYRD5OF8a_TvuwzA
Message-ID: <CAP-5=fWkVHaa417c=1kzq7s=qrsHHDyKn9K1G+BbX7TrzaXZLw@mail.gmail.com>
Subject: Re: [PATCH v3 13/30] tools: dma: Append extra cflags
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
X-Rspamd-Queue-Id: 56D5423E30D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,google.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-11728-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,arm.com:email]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 9:48=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/dma/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/dma/Makefile b/tools/dma/Makefile
> index e4abf37bf020ca613b6dca340299198cb887126a..bdca05c69a8a12a4f9419eed8=
c1df71adac4f26d 100644
> --- a/tools/dma/Makefile
> +++ b/tools/dma/Makefile
> @@ -16,6 +16,7 @@ endif
>  # (this improves performance and avoids hard-to-debug behaviour);
>  MAKEFLAGS +=3D -r
>
> +override CFLAGS +=3D $(EXTRA_CFLAGS)
>  override CFLAGS +=3D -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

>  ALL_TARGETS :=3D dma_map_benchmark
>
> --
> 2.34.1
>

