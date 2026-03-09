Return-Path: <linux-kbuild+bounces-11708-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAO9FqfrrmkWKQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11708-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 16:47:51 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE2C23C024
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 16:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5522730340A8
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 15:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2683DA7D4;
	Mon,  9 Mar 2026 15:44:33 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222EC3DA7D0;
	Mon,  9 Mar 2026 15:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071073; cv=none; b=WODci/g61V+8mkl6wrc0+Q99z9ggBaD6PsAT/WQ/N/AJvu71qaNYahfcguBuv4aYSiJ2+NSE3iaRUbWRqzOSkOCk8YCq89kVJ1oSOcrjBkE2iJ2nN0CVN6mgSfJT7G8/vajpjpc2tEP1kJP63F67lbG3KAkTB7HLzncwVy26hqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071073; c=relaxed/simple;
	bh=6kD1xtE1WWvb8q5Sgj38ZAiQ3VqGPX0njcNklX6dX5U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z+fzkkJ4w7JIIjWq9Kub9+OKumAPtU61kTctx0LvSHlaH2s56tcfve5jeTAhBC+0odM2eRlbJqqjT3nGg9HXfs9qgNhxF0w29YYHry220SJPCpOGsU7Co63g5f/hLxC4Ji8FFWW01vC4qeTmLZptfNVOnPd82VmE4J4CsBuvJk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 9473EB734D;
	Mon,  9 Mar 2026 15:44:29 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id 5F1FF20033;
	Mon,  9 Mar 2026 15:44:05 +0000 (UTC)
Date: Mon, 9 Mar 2026 11:44:13 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers
 <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>, James Clark
 <james.clark@linaro.org>, Kees Cook <kees@kernel.org>, Quentin Monnet
 <qmo@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
 <nsc@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
 <lukasz.luba@arm.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
 <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Adrian Hunter
 <adrian.hunter@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>, William
 Breathitt Gray <wbg@kernel.org>, Barry Song <baohua@kernel.org>, Qinxin Xia
 <xiaqinxin@huawei.com>, Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson
 <warthog618@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang
 Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui
 <decui@microsoft.com>, Long Li <longli@microsoft.com>, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, Thomas
 =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Robert Moore <robert.moore@intel.com>, Len Brown
 <lenb@kernel.org>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Tejun Heo <tj@kernel.org>, David
 Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, Changwoo Min
 <changwoo@igalia.com>, Mark Brown <broonie@kernel.org>, Gabriele Monaco
 <gmonaco@redhat.com>, Shuah Khan <shuah@kernel.org>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, bpf@vger.kernel.org, linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v3 24/30] tools: tracing: Append extra cflags
Message-ID: <20260309114413.09e05127@gandalf.local.home>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-24-6477808123b7@arm.com>
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com>
	<20260308-tools_build_fix_zero_init-v3-24-6477808123b7@arm.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: eafrht6xkmsqqmd9cnu6ar9xapr1638s
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19rLbmrZoPaL0P3RR5YEAAcY/f/FTBjLlw=
X-HE-Tag: 1773071045-495839
X-HE-Meta: U2FsdGVkX18hYXf7K7ag/ax7Ts7l3Hno4V18G/TB3MoiJMt9J0UTBoWMbzCp847Is7JqEhDwYsa6RkhNVAj4HOjhz5B/q6HVutoXc50QRvze1HSHvgRmarYDaR89e13hcutkSur3qPJpb3WQFSh1kdMUPCjB2b9DrVsIeUUknDfC/QNDPoZ7dvLdsgAow4a1fKz845hKI16eOggjPm7NDBP6AlYzhvNte5IIqplnI5az3vz5xKL2rkARtnKqaf6MXyrlcHqNY6XkzrFZIQd+O8sxRIgW8+eDV6GtbJbCez+kywyEICXzGrVsrMmhLwpiud6RJloP8vMv+rRkU2DqAfIR8yWgoyU+kF5+JrXiNgyBGYPMzAUyWhyEeZZHpvBu+fhbJbFXvHWuECsbvAzeB/VloY8v8OcBTStcXIOjMjwqxrXqBaVCdaist9Q8JiqOCKevNg2BnurmQ+kFgTqqWQ==
X-Rspamd-Queue-Id: DDE2C23C024
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11708-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.484];
	RCPT_COUNT_GT_50(0.00)[69];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,arm.com:email,goodmis.org:email]
X-Rspamd-Action: no action

On Sun, 08 Mar 2026 16:46:29 +0000
Leo Yan <leo.yan@arm.com> wrote:

> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

