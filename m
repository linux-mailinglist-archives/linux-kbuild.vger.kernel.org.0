Return-Path: <linux-kbuild+bounces-11696-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LElA/WKrmmzFwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11696-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 09:55:17 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D965235B6C
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 09:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E522E303A5E2
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 08:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086D133A70F;
	Mon,  9 Mar 2026 08:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sCIWThDb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7446536AB5F
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 08:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773046465; cv=none; b=sJTfOz7vN8xzxAeS2qlGvRGZyQKUhq4ROfnhlr6sNZhaFUz47PCYvVfvHTFexGO6mVdLnxW/AfZqP99Fr5VRQuttD14zLB6I+A+fDkHz1+iUuUHmT9BdHRZTJxKrtVU3l5hY2alXTaLlmv1SXHVYMTXnHlSiES65T4zk1X3NPnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773046465; c=relaxed/simple;
	bh=wG5+/hVL6HjKUoRhP7gA3WSoKo1PhFh9knJZ5mzHy6Y=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PLlmp7RbZKpgmmsH8IhOQZJfo0Ah/5n+5XhUjmoJAwJQ2PwVQuDnWz/hCazKy5VO/nkUGnGHERJEzzcuRHHPujQ8rOh5IJt8bSrgPs15FnSA7k9pVBv03vKxSBo+20lCgDZp2Q/O2oSnJN0G/AAuW9pJsl6VcpmWqX7kAJLFODg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sCIWThDb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10D1C2BCB4
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 08:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773046464;
	bh=wG5+/hVL6HjKUoRhP7gA3WSoKo1PhFh9knJZ5mzHy6Y=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=sCIWThDb1pmD+lNgEh46tr1vNedfh7KDb/87oVDfsXY1s3m/gsVhqQ2nwHXly/rwv
	 nX5+JMWc45p87a2svSkXrI9ciK1Bjt5muz4MF0D9hcgClxj/TbBFew/Y+s3QPXzY5J
	 66GLmPG4XePGRrTcLf/vtY58jPNDILLKl5U5YnKEB7rr4H39QBlPLTVPgsvySPFdMQ
	 xj6xqsa97AagA1+NhpCThgz+I4MmomXwcR4LBFvUDXsAXL4pdX5F1nJBsB6Q3WaVDe
	 aXsSosImQpvl9rbkIdEZ570JaBJsZmDWPMUcoqZ9kSCTj+OeVPcaJZiYoSpgY5F0HF
	 43k/sMXnLD6qw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38a3990e87fso18653431fa.3
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 01:54:24 -0700 (PDT)
X-Gm-Message-State: AOJu0YyTiOr8BZtMqgGC7e6ETsQKWLuvT8FpEnoqUPmxn9lGZ44vt4Xz
	DTqxClSaSoKb/lCkiFu3s2NGZBm+U2hrTJpVE688d4wb/Wg3HE2fqXG7u1q4lP3b062hMdew+sz
	w3f5Kg+ZdL/7KxtrT1X1z2ixA8y8nMeGBn3w3RB+k2g==
X-Received: by 2002:a2e:b8d1:0:b0:383:1f06:559e with SMTP id
 38308e7fff4ca-38a40910e52mr31075631fa.0.1773046462934; Mon, 09 Mar 2026
 01:54:22 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Mar 2026 01:54:21 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Mar 2026 01:54:21 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-14-6477808123b7@arm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-14-6477808123b7@arm.com>
Date: Mon, 9 Mar 2026 01:54:21 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mcts8eWGJG2RfTrJ4=ZtcGbraSfN7pnPUkuVs7LN3MJGQ@mail.gmail.com>
X-Gm-Features: AaiRm53otyAIdQ8tJkI0Szk9_yhE2ni_y74h6y-9Tp-K59x5n9G2XJBB-whf1jY
Message-ID: <CAMRc=Mcts8eWGJG2RfTrJ4=ZtcGbraSfN7pnPUkuVs7LN3MJGQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/30] tools: gpio: Append extra cflags
To: Leo Yan <leo.yan@arm.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>, 
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
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 6D965235B6C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,arm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11696-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[70];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, 8 Mar 2026 17:46:19 +0100, Leo Yan <leo.yan@arm.com> said:
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/gpio/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
> index 342e056c8c665ac075041ff7c7ca7ba94c691187..206fb6c91a569d64b1e4b906ada5ec866323053c 100644
> --- a/tools/gpio/Makefile
> +++ b/tools/gpio/Makefile
> @@ -16,6 +16,7 @@ endif
>  # (this improves performance and avoids hard-to-debug behaviour);
>  MAKEFLAGS += -r
>
> +override CFLAGS += $(EXTRA_CFLAGS)
>  override CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
>
>  ALL_TARGETS := lsgpio gpio-hammer gpio-event-mon gpio-watch
>
> --
> 2.34.1
>
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

