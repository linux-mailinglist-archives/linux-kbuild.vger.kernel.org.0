Return-Path: <linux-kbuild+bounces-11703-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NkvM9i9rmlEIgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11703-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 13:32:24 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5C3238E15
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 13:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 446A03068173
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 12:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA203A4F20;
	Mon,  9 Mar 2026 12:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tiJ/PFNI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8935392C41;
	Mon,  9 Mar 2026 12:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773058945; cv=none; b=AfEWHnzuJT+iy3ATCvdaBPpRAeI/UAbDc8IVYsRbgmqWYlRdOHUJl+wbA8Vvu+gCWBOHpddqhIMv6irrW93pxkZqv/+ampy1vl9gnYmOK61ERf6QEfqnAM9oeM5s8uMRmoiMijwf64Piy3xjU7TkSxGt2qlfWN+C6SGThHh2e/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773058945; c=relaxed/simple;
	bh=vUaGo1RgUjNF4T9u8tnNrMdmKsRzkeuWTIiEhc6SWCE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Skiegr6TeVYpTTbScq2199eqkcdkU3PRHxQcVbCEvxpSFiBtk+katrdZs8kbSCYxgmpR9ayXgchU2XmDoQDvAumn4Xz/lyN5cWt4f8L+tvfxYf9RYEACXj9UxOJC7BezRkEMCd6bl14PcRfbeoOu7wzlS6lbRY6KwU3q7Hj0tyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tiJ/PFNI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB5FC4CEF7;
	Mon,  9 Mar 2026 12:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773058945;
	bh=vUaGo1RgUjNF4T9u8tnNrMdmKsRzkeuWTIiEhc6SWCE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tiJ/PFNI9ux9EUxWfJJtcFjWYEPmkN5PHxxDWm3sw/wF6jnp4OT+v555FZgdtA+Yj
	 jdxP4xGVp6IcDPSzzx6yZbnyHBAjqi8+Ay5OP9fYCt1vEXO7e1buONq/EUwBrDd8zE
	 ErqiD/OhK6WXffDIGES98SgNwr4gQ2Gbsn7g6qKULkk0R3fmudUeC3sltWEcuorX62
	 v+Ts9i//L0S+RwfXDVylym7NK/UEnRckRIcJ1nhHzkEyPzhkT0odDj2bbDdLRySz7D
	 XKvv8ImuNeCWKfLy09X6PzrCtXa+JHDVNvUcsZeL+NMjEeXb5MlRm9cibu5H6KUK9z
	 4ipUSB6Z6K9DQ==
Date: Mon, 9 Mar 2026 21:22:15 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
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
 <adrian.hunter@intel.com>, William Breathitt Gray <wbg@kernel.org>, Barry
 Song <baohua@kernel.org>, Qinxin Xia <xiaqinxin@huawei.com>, Bartosz
 Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui
 <decui@microsoft.com>, Long Li <longli@microsoft.com>, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, Thomas
 =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Robert Moore <robert.moore@intel.com>, Len Brown
 <lenb@kernel.org>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Tejun Heo <tj@kernel.org>, David
 Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, Changwoo Min
 <changwoo@igalia.com>, Mark Brown <broonie@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan
 <shuah@kernel.org>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <bentiss@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, bpf@vger.kernel.org,
 linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v3 11/30] tools: bootconfig: Append extra cflags
Message-Id: <20260309212215.b3bb7a65778c6aef6304efb2@kernel.org>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-11-6477808123b7@arm.com>
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com>
	<20260308-tools_build_fix_zero_init-v3-11-6477808123b7@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6A5C3238E15
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	URIBL_MULTI_FAIL(0.00)[arm.com:server fail,sea.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-11703-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[69];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhiramat@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	NEURAL_HAM(-0.00)[-0.982];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sun, 08 Mar 2026 16:46:16 +0000
Leo Yan <leo.yan@arm.com> wrote:

> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

This looks good to me.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thanks,

> ---
>  tools/bootconfig/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/bootconfig/Makefile b/tools/bootconfig/Makefile
> index 90eb47c9d8de67b0ccc74a8de0af3a7e0b97feeb..6bbf4dfdb5b56fcb2a43ccda18b59a270778267b 100644
> --- a/tools/bootconfig/Makefile
> +++ b/tools/bootconfig/Makefile
> @@ -10,6 +10,7 @@ srctree := $(patsubst %/,%,$(dir $(srctree)))
>  endif
>  
>  LIBSRC = $(srctree)/lib/bootconfig.c $(srctree)/include/linux/bootconfig.h
> +override CFLAGS += $(EXTRA_CFLAGS)
>  override CFLAGS += -Wall -g -I$(CURDIR)/include
>  
>  ALL_TARGETS := bootconfig
> 
> -- 
> 2.34.1
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

