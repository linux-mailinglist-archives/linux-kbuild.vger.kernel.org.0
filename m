Return-Path: <linux-kbuild+bounces-11700-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B8NKV2ermmqGwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11700-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 11:18:05 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B72F236DF2
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 11:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFA17302B22B
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 10:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307DF38F246;
	Mon,  9 Mar 2026 10:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMlHZ2gs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB4D38E5D4;
	Mon,  9 Mar 2026 10:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773051481; cv=none; b=Gbeb43UxkMe+lH+y7CA5HwKtfekBf6SiOYll974w6Zw9VMCtp7mCi0TJacynk19WUdeJPxGGXySCLZf3fEi5mIJlNfj3RRDxqbf2j6kSKg6PXiErxmzsdKWW7HVFZoS0J2j5GYBijGwk7D2C6MTriO3MgTIkKU50yh/Om4YwIvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773051481; c=relaxed/simple;
	bh=2EC+wTYFQkxUTDCtHiHCoOwNgIgiRnx9FT0UQMAHILc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nucLicAECL9GKzsd739R2TTRN96g2tBgDbOcBWdhWFbC01mOgeeWGUNG829erCe5WwsiqzM8xWHN5OCx6AIbmtqUsl2BYdMLlebXtX5nfTzbo5N61iuCRbfTi741hWODrLiDFqVvbPy3N9qX0oQPiCL0OQZzPJJVvdUZiOlkkuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FMlHZ2gs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B123C2BCAF;
	Mon,  9 Mar 2026 10:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773051480;
	bh=2EC+wTYFQkxUTDCtHiHCoOwNgIgiRnx9FT0UQMAHILc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FMlHZ2gsXqYoMc0B50ulHkU+VdI0fwSM5vDNkmq/f/qa7R+ym3zrku8rvnOtBfdI6
	 dPxWyld6YnAtmcY3mEnhum3nQh6i4XWacWw9TEptM90xzKbBOjnTUjdYr4N2qP+ppo
	 VTot2VEEurdk7y7tUuhOIzc1O5UWLf8Obsu3bb7hRulDQn3UXWynn6snRqBwydsefv
	 Miva8ljrX780FoGNfNnhVIncoJ1aQqwv8Ihc5RqTm4nnSUzb84jHgnY73Wcz4NloqQ
	 rduQPbZhjMuWbaxDavP9Dyd/NaSXhan6lR82SSCtLVk8gfL9qlpeNN0dxKR9SR/PLG
	 /cBq3vYl7etrw==
Message-ID: <8b5b0e81-436f-49f7-8d3c-9271d4d05ffc@kernel.org>
Date: Mon, 9 Mar 2026 10:17:49 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/30] tools build: Append -fzero-init-padding-bits=all
 to extra cflags
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
 <20260308-tools_build_fix_zero_init-v3-5-6477808123b7@arm.com>
From: Quentin Monnet <qmo@kernel.org>
Content-Language: en-GB
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-5-6477808123b7@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1B72F236DF2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11700-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[69];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qmo@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.966];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,gnu.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

2026-03-08 16:46 UTC+0000 ~ Leo Yan <leo.yan@arm.com>
> GCC-15 release claims [1]:
> 
>   {0} initializer in C or C++ for unions no longer guarantees clearing
>   of the whole union (except for static storage duration initialization),
>   it just initializes the first union member to zero. If initialization
>   of the whole union including padding bits is desirable, use {} (valid
>   in C23 or C++) or use -fzero-init-padding-bits=unions option to
>   restore old GCC behavior.
> 
> As a result, this new behaviour might cause unexpected data when we
> initialize a union with using the '{ 0 }' initializer.
> 
> Since commit dce4aab8441d ("kbuild: Use -fzero-init-padding-bits=all"),
> the kernel has enabled -fzero-init-padding-bits=all to zero padding bits
> in unions and structures.  This commit applies the same option for tools
> building.
> 
> The option is not supported by any version older than GCC 15, nor is it
> supported by LLVM.  This patch adds the cc-option and host-cc-option
> functions to dynamically detect compiler option and append it to the
> EXTRA_CFLAGS and HOST_EXTRACFLAGS respectively.
> 
> [1] https://gcc.gnu.org/gcc-15/changes.html
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>


I can't speak for the maintainers of the other tools of course, but as
far as bpftool is concerned, this looks OK to me. Thanks for this work!

Acked-by: Quentin Monnet <qmo@kernel.org>

