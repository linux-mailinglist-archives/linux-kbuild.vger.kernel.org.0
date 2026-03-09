Return-Path: <linux-kbuild+bounces-11729-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHOKLK8Lr2lzMQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11729-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:04:31 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 790BD23E295
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:04:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 197F9305ABE7
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 18:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90D43ED5A9;
	Mon,  9 Mar 2026 17:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gx2DEeRl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F237541C309
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 17:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079071; cv=pass; b=TYfFLFpS9VBoqJ16uOE84aWptLt5ayf9ZCn85mqF5fCvVFLCDlXDAHq44Fa/2ziH77+udAzgxuhZDJ3MASBi67wKyGI5ygzFdjWsNSAY4dMkw0rC7USXgc5QT0jCTMnf2xLoSMQmSw/ZmRc1MR329rJGzsYlDwDL53+UUtRcMC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079071; c=relaxed/simple;
	bh=bi/0kzUFQaV8p3doZRD93rVlwd2uelaWqK+VBjCrW5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tI9dH8DNSMlhCFFRxJbx+qFLuExZ1YL5lX7yAru60l5IYUA3XvgC0/KUZhNeJUD9zLHHJB6UafU/5UVNNw/tk+tN/7yHuec5Eey8jtcCI68Bs+WRsssMryAPAz2Vxv7HauLEdd0gtcO9miPBr2QXRDAzitbcVPBM22LVRQoCYdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gx2DEeRl; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ae3f822163so12545ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 10:57:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079067; cv=none;
        d=google.com; s=arc-20240605;
        b=DTquW4swK+r69g1eu9ukJCGpxo8Y4vmUpBUNgQfqBnXrFwI3ynlajOP4Wh1U/yXrEU
         WXcGPYgruiSodmb+77xV7baLXz/BwxtPeSnBgyD6vRUK8udsAX+eZX3CQ1YYnhf77OJv
         hLlEVlzLiR/4kAdQWX7Bwu1XqJZeemzeTrwOP1B7UijvYkvSBgugfByxDAU4Mf8gF3Ri
         kY/JxiiRUcFIMNZ71Qzc49yM0b7LAcEAt5hy9tn6ZFu4Ug6B8xDoAJb8TVVH/GFWSZsl
         QTIbYKvtqPqrIeenZwuiKCc0WRsLpGIdy9h7ZZCz8aiuMNTG3BQBmjBQKcxSEcJoTHOV
         DIrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vDlEc+C10LHwn7mMynGp+oAsPyPidhsvHXmfLuBSVbU=;
        fh=6+baO3NwCDeR7uY9QAdQSjINGJsm/JBO9VLp+Mu3SoE=;
        b=VdNaXvfcrF3RHAec9ocPunEZyxEtKRYS9JbNjnO/Lk0jOqKqGgwia1vQ9/knJu9Q1F
         Q8/j9pkbI8DauCGKz/A4MYfsYkDT/kVRsDJFIG+LNuz4RC892yd3nkUCRrh+sOOnYVYX
         dtrEbtk41Ls6EoyPWFicR31R9aBjOoOiwn2MB5Q9KKivHxTa2OFB36NmRxJWDOEyACJ1
         P2urfPgXOi1dHwUxwp8VaH7qvUkXO4J1OI5xHcXgYoXhVPSmEBn3Ye90IOOfU5fH4D71
         N9w4x2sO3f38IFSLeDj7ufpV3Ww81wyrQPzQW4q2hpJmPk+SeYDTwjvZs0WpQvRdy1It
         qSLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079067; x=1773683867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDlEc+C10LHwn7mMynGp+oAsPyPidhsvHXmfLuBSVbU=;
        b=gx2DEeRlRHQNr8/WHpJTel+e0k/DZydgp19ppwvZdahC4wi7nMalsSX9NRv26DZs5u
         e4rNlHY5efFHD6Q3/7C+UBxrtazLRVe+8nWQWVBDZ9+3geBOn38APAv/IZDH+tbi6oTN
         oiBdSB54yjHWjQxza7yPzV3I5esuNxaNZ2k3LfrjdGwOZ3qlfNjvIuuZw0cw+suUJtR8
         kWntTqkfE8SGDRgPwsbh+SaAHCaUNkqAN3mcCECtkjQ4LGeE2Os9cI0vLy6uJpYgiKX5
         wjdF4C9mpIwX7sH1w3otZbDnlQGKO9NOUKDuhkiZropZJwCY32M3cd5uFmP6HnQwAPRv
         RmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079067; x=1773683867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vDlEc+C10LHwn7mMynGp+oAsPyPidhsvHXmfLuBSVbU=;
        b=NJ03MTstDuB0z75dhUxMwnao/jDm2WIQJ71bEFuamPLUWoJwHqes7cVrHFm4Uge80F
         4ker9udHFYJ19hlsOhIqvWImztfUnM9NMbkwGJHT6WGPw0W+c0tNtotLbUrCsv6PWhHU
         Jz9r3ItVGeN2XadRaqiAsUtIzC2U18ciFALOpG+26b2qRyxS48U+xEcKwtjRbtiHVTSV
         gA98a7xZJKua7AIEe3Pypr/glFglEOCCfvsK+ji69cUXpqTMQQ0bF6uqsclYaOhgb0Gi
         VykZBIhMqI1aFdzNejb75kGXZYRvMXD1rm17VgXOtAo/hqMiMsGNXPb9RfpOpd0WBap/
         r48w==
X-Forwarded-Encrypted: i=1; AJvYcCX6zjekJzItggkroeySsSixD3HLZP90SovMblu+cReYko8I+WcHvw6cdN+CZT7vHXC6nDLCwkX1Inu58Uc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkhizWurmMoFP0if4QOcUc6LOvtPPL4F9CnNGHScJwXUn08jLI
	BxxIHU9fxufY7/0EDxQhJikj263NSrh9Qa6jDOFmmaQmTwC5QE4aC1x3nhUtVo6nRCDcJ2E045z
	aTFHsEDw4sQDEksd0LTTik1gzmQxs5kAS8RYCYeDg
X-Gm-Gg: ATEYQzyfIu5OzEijvYgL546BQ/G1jk0Psce22J8nefeXmYg0K+SzsgALRsgQKFT0L/w
	Sb13kqlDIRw+bhkhzz7VTKx2PlDzMxGAjlRGYox0xZn/gx6B1L9wiQ6gvLEN5KW5wfMXb4mKUrr
	pEtuRgs01vnfKvDId9MHHXLDP1mCEfSdot0RKGwmwi/fO0h3rT/8jeQSeeeAUQh/4BFvbP/r9IU
	SkyZ2NcTsSzlH1ZjxeuO+Unwm3g+0Qw3HMhKzr6Yc8PP9TphYdkqasBdJvYKJTJEl6bHvuAbOQw
	4GjpFGleOVNqba0RzCxXUV8qEGQ8gdJpf1U=
X-Received: by 2002:a17:902:aa85:b0:2ae:8039:fcb0 with SMTP id
 d9443c01a7336-2aea3122a7cmr131785ad.5.1773079066411; Mon, 09 Mar 2026
 10:57:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-14-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-14-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:57:35 -0700
X-Gm-Features: AaiRm52StTlx-ugeD48VkaRFXPHj3olO-UKSkeOjK7TIFhirgpNgc7cDU1gN2Ws
Message-ID: <CAP-5=fVTKXfV0qqt_Fj6r6wZ-O2X-gqjM2mkPfbawnDJQj7U-Q@mail.gmail.com>
Subject: Re: [PATCH v3 14/30] tools: gpio: Append extra cflags
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
X-Rspamd-Queue-Id: 790BD23E295
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,google.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-11729-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,arm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 9:48=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/gpio/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
> index 342e056c8c665ac075041ff7c7ca7ba94c691187..206fb6c91a569d64b1e4b906a=
da5ec866323053c 100644
> --- a/tools/gpio/Makefile
> +++ b/tools/gpio/Makefile
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

>  ALL_TARGETS :=3D lsgpio gpio-hammer gpio-event-mon gpio-watch
>
> --
> 2.34.1
>

