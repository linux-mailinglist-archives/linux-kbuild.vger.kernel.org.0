Return-Path: <linux-kbuild+bounces-11701-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEFLCgO6rmmcIQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11701-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 13:16:03 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4C22389F9
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 13:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55F0D30C76C1
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 12:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16943A7F6C;
	Mon,  9 Mar 2026 12:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="DNfHcxoq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818953859CC;
	Mon,  9 Mar 2026 12:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773058105; cv=none; b=klhHQI/lLrUVJUaHNJWFZdBs1vXP+wNqa1B9A36kePSNefbpIzrtsd2qHNIpsD7bmxGNe6t8FdqTAHDCU2QBQdtbyXusT6GywHhREammpl3mu3i012989U91zVWxtt2hUdkRoq77iNlO095NrvfYUsGUKBBsVxI6cny6uYXaSs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773058105; c=relaxed/simple;
	bh=g2sWoetMr2WaqFvwxERZ4WobytiHdKKwlE59fTrauKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qajskao4beJGCaKKwSHg/rUcnnric7NXqw1UHu/cAmAt97e8gHWZt+BrwnrXK33Q++iZ/DT2XMFKI7ck6hs7fKtLrx82tAzso9RPBmxpM5LJnaFDlu2MINLo9FKlZsCY46R7fp/8ad/G4SlNvftiIifDfxXlY0XEH+vzRRCZS4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=DNfHcxoq; arc=none smtp.client-ip=113.46.200.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=up4v/et4lJKRUJbSgjVJpe+Szh9u4uk8/4CweOLUjio=;
	b=DNfHcxoqPIirpAZD1xO9rwIP9rvfNWtbFiOrBAvkuDPNGvPzt4mIPc3QleXeuzEza89i5ijQV
	Fo1zeL0G9ox9mKCl379V5fNjHSFkQ1gfIR7njBcaFWYzTm7ICZxhBv6uwFfMmb99WwKBiWyoJ0r
	KqjIZhODjz/PoZpKdjHMODM=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fTwcf4S6gznTVX;
	Mon,  9 Mar 2026 20:02:42 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 716954048B;
	Mon,  9 Mar 2026 20:08:19 +0800 (CST)
Received: from [10.67.120.170] (10.67.120.170) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Mar 2026 20:08:16 +0800
Message-ID: <8a2a8771-0bcf-4ed2-981b-6ad09943b691@huawei.com>
Date: Mon, 9 Mar 2026 20:08:15 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/30] tools: dma: Append extra cflags
To: Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ian
 Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>, James Clark
	<james.clark@linaro.org>, Kees Cook <kees@kernel.org>, Quentin Monnet
	<qmo@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
	<nsc@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii
 Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
	<yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui
	<rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Peter Zijlstra
	<peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Mark Rutland
	<mark.rutland@arm.com>, Alexander Shishkin
	<alexander.shishkin@linux.intel.com>, Adrian Hunter
	<adrian.hunter@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>, William
 Breathitt Gray <wbg@kernel.org>, Barry Song <baohua@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei
 Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Long Li
	<longli@microsoft.com>, Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	Willy Tarreau <w@1wt.eu>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
	<linux@weissschuh.net>, Josh Poimboeuf <jpoimboe@kernel.org>, Robert Moore
	<robert.moore@intel.com>, Len Brown <lenb@kernel.org>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, Tejun Heo <tj@kernel.org>, David
 Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, Changwoo Min
	<changwoo@igalia.com>, Mark Brown <broonie@kernel.org>, Steven Rostedt
	<rostedt@goodmis.org>, Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan
	<shuah@kernel.org>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
	<bentiss@kernel.org>
CC: <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, <bpf@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com>
 <20260308-tools_build_fix_zero_init-v3-13-6477808123b7@arm.com>
From: Qinxin Xia <xiaqinxin@huawei.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-13-6477808123b7@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemj200003.china.huawei.com (7.202.194.15)
X-Rspamd-Queue-Id: 7A4C22389F9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,infradead.org,redhat.com,linux.intel.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11701-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[huawei.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaqinxin@huawei.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[69];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.968];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:dkim,huawei.com:email,huawei.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action



On 2026/3/9 00:46:18, Leo Yan <leo.yan@arm.com> wrote:
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/dma/Makefile | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/dma/Makefile b/tools/dma/Makefile
> index e4abf37bf020ca613b6dca340299198cb887126a..bdca05c69a8a12a4f9419eed8c1df71adac4f26d 100644
> --- a/tools/dma/Makefile
> +++ b/tools/dma/Makefile
> @@ -16,6 +16,7 @@ endif
>   # (this improves performance and avoids hard-to-debug behaviour);
>   MAKEFLAGS += -r
>   
> +override CFLAGS += $(EXTRA_CFLAGS)
>   override CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
>   
>   ALL_TARGETS := dma_map_benchmark
> 
Acked-by: Qinxin Xia <xiaqinxin@huawei.com>
-- 
Thanks,
Qinxin


