Return-Path: <linux-kbuild+bounces-11698-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNItIj+ermmqGwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11698-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 11:17:35 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A75236DC5
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 11:17:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0788A303C014
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 10:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7841838E10D;
	Mon,  9 Mar 2026 10:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DrBXXft7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527E3387580;
	Mon,  9 Mar 2026 10:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773051449; cv=none; b=UlDei+RTWZAtvw+wszzEUvFS5uGd29x0oeHCI81uSWrYeogZVvnFWYj8nZP/Jd6daS1NjjMML2bJ3R1fHlDWz52Swu/IDLwG2hu9lPn8Q6GOgSFVlIl8Gqr7970pxu40smBZXEMc8Vu3J+Ffe2EFLd1Xn0Z1psSGPdn8yMXPKUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773051449; c=relaxed/simple;
	bh=Bcx7TMfii2sXtRgAxRCZyWWDUd4eFgIPZZRRHM17fkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQmPT++FGx0Wt2vN1FCQ7n8uNj9eXEkkezh8HWC4v7Ki6tjY1NWVqqjHU2Yf6bdCeVoHCvMiSNWKPcdKFjpl6pjtG2H52zXJywiPnbiMfC7qEJRc/DP8yqh5jBolMBmoFsedYX0nFZA7p9LSOya07Sn0zmBq2t8yE0XQKGhhhzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DrBXXft7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010E0C2BC87;
	Mon,  9 Mar 2026 10:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773051448;
	bh=Bcx7TMfii2sXtRgAxRCZyWWDUd4eFgIPZZRRHM17fkQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DrBXXft7Rg+K+gOrNKE7pbM+WV+una3B6AuVU2F/XyG5Q7Ilgvp4+wHz3LbGu7EGs
	 xLg4TWbBsUlbF2rZIEPYEcnGGmpdt6A0U8BAqnIds6YHhKvUexSDtvh0qbwguma/e4
	 X87MfhY9rr408KGJ5NbNWhsJfzasPledWKlroYqrcWXZhtPoz2/6ksEQodVDuRnObu
	 vipvrtGdstw7KQRz1J9/hyWvgEiawRfr/WPGPv2q4WzNpS7dsHNmm1qwe6935fAIfs
	 ZoY7GKjchkxg4Qf+HP+DBpqRLZiVWOyq0Iyy3RMGG4Otp5y70PrP7ljQXOAhPv4A1V
	 aFO4ogHsnqEig==
Message-ID: <8fa4b2b0-d528-41f3-863a-9eb360b4e17f@kernel.org>
Date: Mon, 9 Mar 2026 10:17:17 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/30] bpftool: Avoid adding EXTRA_CFLAGS to
 HOST_CFLAGS
To: Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
 James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 William Breathitt Gray <wbg@kernel.org>, Barry Song <baohua@kernel.org>,
 Qinxin Xia <xiaqinxin@huawei.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Kent Gibson <warthog618@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Robert Moore <robert.moore@intel.com>,
 Len Brown <lenb@kernel.org>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
 Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>,
 Mark Brown <broonie@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, bpf@vger.kernel.org, linux-perf-users@vger.kernel.org
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com>
 <20260308-tools_build_fix_zero_init-v3-1-6477808123b7@arm.com>
From: Quentin Monnet <qmo@kernel.org>
Content-Language: en-GB
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-1-6477808123b7@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C9A75236DC5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11698-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[69];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qmo@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.964];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

2026-03-08 16:46 UTC+0000 ~ Leo Yan <leo.yan@arm.com>
> Prepare for future changes where EXTRA_CFLAGS may include flags not
> applicable to the host compiler.
> 
> Move the HOST_CFLAGS assignment before appending EXTRA_CFLAGS to
> CFLAGS so that HOST_CFLAGS does not inherit flags from EXTRA_CFLAGS.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>


Acked-by: Quentin Monnet <qmo@kernel.org>

