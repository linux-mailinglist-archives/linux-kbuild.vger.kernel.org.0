Return-Path: <linux-kbuild+bounces-12212-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDQyCHy6wWnRVAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12212-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 23:11:08 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7073B2FE18C
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 23:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 474503034B11
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 22:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737B8381AE9;
	Mon, 23 Mar 2026 22:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="A0mn6jrD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491EA37FF64;
	Mon, 23 Mar 2026 22:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774303863; cv=none; b=d82ixtXpwmwdGqEdQ98fiXL/T2IgoTrea4WUi0IguM2Q70rVU+B3wTCLHDfh9aMKPmpQxiGmaxl0UOXaobGsJn0XBLblM3RBd40+z1vYxsdXCohNl3B+DlTdrd5isWxyyUX5VEW2FZebQAD9swmxOagaZXJzp7nNTP7K8h7l4y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774303863; c=relaxed/simple;
	bh=QmWFET9bvrs9i8OF0DvDcoUHyYG1evZeedhQK2jkq7g=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=mFE8kmjSTC+yOwJGrPCATaxCN8f8TfdIP1naQz6abXEeA5Lc6oaG7S1Ovyo9ir+ZEYpkgW4KZ7JHyHgqfy2Tox4e8s8LkMjIflBmdqNZkAKgLoFHTuNxq4n1soBHUl+Z4v+ka96vfWvSjPx33MSpBRFGuL/RjOENZfRpgR2eTWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=A0mn6jrD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3F0C2BC9E;
	Mon, 23 Mar 2026 22:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774303863;
	bh=QmWFET9bvrs9i8OF0DvDcoUHyYG1evZeedhQK2jkq7g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A0mn6jrDRkkotL0ADM4z8hjc55Rp81tZDxRdlLJjStnOUzMWqWAuqiPb6IXBeD+C0
	 x6es1PD41J5l84ogH7DiycTlmrDI8IxicV/pTWzq2lj9Nt5GyBJnq06C7qoPkLHQUr
	 II58ooGZtJLKAU+C+zCon+Co9NCgVIeslsmyvJKE=
Date: Mon, 23 Mar 2026 15:11:00 -0700
From: Andrew Morton <akpm@linux-foundation.org>
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
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Willy Tarreau <w@1wt.eu>, Thomas =?ISO-8859-1?Q?Wei=DF?=
 =?ISO-8859-1?Q?schuh?= <linux@weissschuh.net>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Robert Moore <robert.moore@intel.com>, Len Brown
 <lenb@kernel.org>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Tejun Heo <tj@kernel.org>, David
 Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, Changwoo Min
 <changwoo@igalia.com>, Mark Brown <broonie@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan
 <shuah@kernel.org>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <bentiss@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Bartosz
 Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Jonathan Cameron
 <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v6 00/24] tools build: Append
 -fzero-init-padding-bits=all option
Message-Id: <20260323151100.a89f36efc411c9c96e1e24bd@linux-foundation.org>
In-Reply-To: <20260323-tools_build_fix_zero_init-v6-0-235858c51af9@arm.com>
References: <20260323-tools_build_fix_zero_init-v6-0-235858c51af9@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-12212-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,oss.qualcomm.com];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[69];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-foundation.org:dkim,linux-foundation.org:mid]
X-Rspamd-Queue-Id: 7073B2FE18C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 23 Mar 2026 15:13:21 +0000 Leo Yan <leo.yan@arm.com> wrote:

> GCC-15 doesn't guarantee that a {0} initializer clears the whole union [1].
> This may cause bugs if data is not intialized properly.
> 
> The kernel enabld the -fzero-init-padding-bits=all option to tackle the
> issue, which was merged in commit dce4aab8441d ("kbuild: Use
> -fzero-init-padding-bits=all").
> 
> This series propagates the same flag to the tools build.  It uses
> tools/scripts/Makefile.include as the central place to add the
> option to EXTRA_CFLAGS and HOST_EXTRACFLAGS for the CC and HOSTCC
> compilers.  Each project under tools/ appends the variables as needed.
> 
> BPF/bpftool related patches will be sent separately, as maintainers
> prefer them to go via the BPF tree.

Some questions from AI review.  Some probably legit, some probably not:

https://sashiko.dev/#/patchset/20260323-tools_build_fix_zero_init-v6-0-235858c51af9@arm.com

