Return-Path: <linux-kbuild+bounces-11742-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NUBH1grr2mzOgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11742-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 21:19:36 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D241C240C87
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 21:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54DB0302BE24
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 20:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1B826AA91;
	Mon,  9 Mar 2026 20:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gcYz0Ocv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE181DED42;
	Mon,  9 Mar 2026 20:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773087572; cv=none; b=ZvguJLKx9jhTPcjiDIeqStWAHdMyZP79hfLzFVF+WVAnLU4r+X7AOf8q/lzEKO71qhW8MTd4TnbYjiPFUidgEZKGkEu928KeJ7dz07HSsPgZTU2fSIppgrwFltfSPWikqe6DMj8xoJ2YfFbYbVOCtEbwco5cBoKaKQinaItvuRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773087572; c=relaxed/simple;
	bh=ofM93fWFg9wOYbbqABGamk2Cktt1rzuB3peBI04jSGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVNlPHxKuLXEcZzOBwBORz9bTuNLMtyKBX9pXh54bsUjRdjzmevmzOaQYpVkR2vNuUU+SCWRQW3XDRZvcKoDuCRy++ym/25IWqbY+DiVgp4ABdyZjDjtFlSZezBAlTBNIG+FLCEuT7GWqkyHN3zbaJFB7OWbP6AFYsHbfHDakoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gcYz0Ocv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F22CC4CEF7;
	Mon,  9 Mar 2026 20:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773087571;
	bh=ofM93fWFg9wOYbbqABGamk2Cktt1rzuB3peBI04jSGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gcYz0OcvvZtaGV5WQIiDGmqIa3liLRrsdSKGaRASR9HRDXNlSZRubqbUwfRo18MuW
	 yQoLhUo0WAWPN0i6rbsXcx17ovSxuzsmqhGJqpVmcm4LKLt4VyH6HaBcFVxot1JTsz
	 aH1ez9k1c2MCqTuZJJthNOBr++QxBhVI9Rk7ravSZ9LiJmXXFxHHdOPd+V6Uem/noj
	 QJ1ktHAyRFXKm34k+Zxf615dv373m4Cy1wcDFweNxe4E6EvrTMlX0Y6ftYI4oW+6YP
	 twNYF6oqYKXESxDxSGs8FZpCs3fOXHQZO/qkdvcG6qmFP5bFzK9TUQC1bAYKeXIcdH
	 CuKWQBlGyr9jg==
Date: Mon, 9 Mar 2026 13:19:27 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>, Quentin Monnet <qmo@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	William Breathitt Gray <wbg@kernel.org>, Barry Song <baohua@kernel.org>, 
	Qinxin Xia <xiaqinxin@huawei.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Kent Gibson <warthog618@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Long Li <longli@microsoft.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Willy Tarreau <w@1wt.eu>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, 
	Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>, 
	Mark Brown <broonie@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan <shuah@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v3 19/30] tools: objtool: Append extra host cflags
Message-ID: <uub7xebutunq7cl4szwepu3lqenat3c4mle5rdxjtumq4t5lzv@arbi62zsbic3>
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com>
 <20260308-tools_build_fix_zero_init-v3-19-6477808123b7@arm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-19-6477808123b7@arm.com>
X-Rspamd-Queue-Id: D241C240C87
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11742-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[69];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jpoimboe@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:email]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 04:46:24PM +0000, Leo Yan wrote:
> Append HOST_EXTRACFLAGS to HOSTCFLAGS so that additional flags can be
> applied to the host compiler.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Thanks!

Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
Josh

