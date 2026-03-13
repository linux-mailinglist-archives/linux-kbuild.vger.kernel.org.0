Return-Path: <linux-kbuild+bounces-11918-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OO00GfE6tGk4jQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11918-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Mar 2026 17:27:29 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4709286FBE
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Mar 2026 17:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0518B3023319
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Mar 2026 16:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 191FA3C6A3E;
	Fri, 13 Mar 2026 16:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NfmsN5PQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAD038CFFF;
	Fri, 13 Mar 2026 16:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773419196; cv=none; b=JvUraB4mxfDNxIz+dk8lO/LfrewVwb+rtANRZFr2aBLyAUuLx4ZhxXvmf1h7YcpkzOHzaGt5GaagUxludBGiFVeUPMV2g/drfoI284c3oS44UtdVZSVWVcQegJnyMEhaihD/61LgE9kGbrk8LelnQgZgw7KitoIcts70OUPG9Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773419196; c=relaxed/simple;
	bh=AfxxKs2KdlZH6f4DtzjOy6zLTdABVf9Ufjw9UhlQVKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mb5sqdRxiFNCpsXvvKKfc9yNzc079Xbicc6C8t5/bE4CAO+zTOT2bBUPo3mpNTeZg3vMal5YaJo78csyG5HuvTsy+Uhbz9qscMVsrwkyoIsQNboA/E3F5UuqG9hDc5NmxKFgq+mnM5dqtra9Gx0dfvQsOANUE8yb4QqR6JUF5GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NfmsN5PQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAABFC19421;
	Fri, 13 Mar 2026 16:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773419196;
	bh=AfxxKs2KdlZH6f4DtzjOy6zLTdABVf9Ufjw9UhlQVKk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NfmsN5PQ0SU0nWpk7AibNnDc3kc7s/4QP2FYjwVVlFozUV6/eyLJXCmw0zrEml684
	 pTXEeKVCXi777niHBawr1hlOeiX6TPn7nxYeL9+WwMmz9Ux8RIZ9kjngPzuNr0SLrN
	 ngsdEYVCFkZbJbZAkUwhUwALTriR97EdKEd9oXzcW2uo94FlzQx0IDZ+jkFEgZDmZV
	 pwItaAfHuE4tOHVhD+jQuGjP8IZAvRDCIln9feFUpbKCbGDjaLi9TpCGYDZXeHqq3C
	 taop9WqXxxd9NCm4LkbZNPrxoyhuAoasJeEcD5DLIsB1xoJgxOs0YtqA3bYvvG2NtA
	 DSyGhAN4CJBPw==
Message-ID: <9f59fabc-8668-4e2e-bf4e-c7726890cf07@kernel.org>
Date: Fri, 13 Mar 2026 16:26:24 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/30] bpftool: Avoid adding EXTRA_CFLAGS to
 HOST_CFLAGS
To: Leo Yan <leo.yan@arm.com>
Cc: Ian Rogers <irogers@google.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, James Clark <james.clark@linaro.org>,
 Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
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
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, bpf@vger.kernel.org, linux-perf-users@vger.kernel.org
References: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com>
 <20260311-tools_build_fix_zero_init-v4-5-9e35bdb99cb3@arm.com>
 <CAP-5=fUOYsnbB4B0khUetRWOFMtHuO6_ESG30b1ZW01n_-gt6g@mail.gmail.com>
 <20260313155600.GP4153946@e132581.arm.com>
 <cdc75030-e750-42ad-a068-55abe3a10d82@kernel.org>
 <20260313162430.GR4153946@e132581.arm.com>
From: Quentin Monnet <qmo@kernel.org>
Content-Language: en-GB
In-Reply-To: <20260313162430.GR4153946@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-11918-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D4709286FBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

2026-03-13 16:24 UTC+0000 ~ Leo Yan <leo.yan@arm.com>
> On Fri, Mar 13, 2026 at 04:07:27PM +0000, Quentin Monnet wrote:
> 
> [...]
> 
>>>>> +
>>>>> +# This must be done before appending EXTRA_CFLAGS to CFLAGS to avoid
>>>>> +# including flags that are not applicable to the host compiler.
>>>>> +HOST_CFLAGS := $(subst -I$(LIBBPF_INCLUDE),-I$(LIBBPF_BOOTSTRAP_INCLUDE),\
>>>>> +               $(subst $(CLANG_CROSS_FLAGS),,$(CFLAGS)))
>>>>> +
>>>>>  ifneq ($(EXTRA_CFLAGS),)
>>>>>  CFLAGS += $(EXTRA_CFLAGS)
>>>>>  endif
>>>>> @@ -88,8 +94,6 @@ ifneq ($(EXTRA_LDFLAGS),)
>>>>>  LDFLAGS += $(EXTRA_LDFLAGS)
>>>>>  endif
>>>>>
>>>>> -HOST_CFLAGS := $(subst -I$(LIBBPF_INCLUDE),-I$(LIBBPF_BOOTSTRAP_INCLUDE),\
>>>>> -               $(subst $(CLANG_CROSS_FLAGS),,$(CFLAGS)))
>>>>>  HOST_LDFLAGS := $(LDFLAGS)
>>>>
>>>> Should HOST_LDFLAGS be similarly moved? Otherwise, it seems target
>>>> flags in EXTRA_LDFLAGS will be added for the host.
>>>
>>> Though this series is irrelevant to LDFLAGS, I am fine to move
>>> HOST_LDFLAGS together.
>>
>>
>> If we move the HOST_LDFLAGS earlier so that they no longer receive the
>> EXTRA_LDFLAGS, then we lose the possibility to use any EXTRA variable to
>> pass additional flags to HOST_LDFLAGS. So OK to move, but maybe add a
>> "HOST_LDFLAGS += $(HOST_EXTRALDFLAGS)" to it for consistency with the
>> processing of HOST_CFLAGS?
> 
> Adding HOST_EXTRALDFLAGS seems a bit over designed to me, as there is
> no use case for it currently.  To avoid complexity, let's keep this
> patch as it is, we can add HOST_EXTRALDFLAGS if later have requirement.
> 
> P.s. I saw that you already replied the same comment in the previous
> version.  I should have confirmed at that time, sorry for the duplicate
> discussion.


That's fine :) - And agreed, it's probably best to leave it as-is for
now. Thanks!

Quentin

