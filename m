Return-Path: <linux-kbuild+bounces-11710-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AUfKcfxrmnZKgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11710-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 17:13:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A188E23C88F
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 17:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 09A7D30299EB
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 15:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7973E0C6B;
	Mon,  9 Mar 2026 15:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zyr4schr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A103D5226;
	Mon,  9 Mar 2026 15:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071946; cv=none; b=NtnqTuF8t56YbmuwM4PbjdTWLvXx4kuGhYmKnurloGzTH+RGVSa/SzuifJJDYYClTZ9JO0MoqhFNnM54LFnPIIa/ochemhBtCLuGiV+0+m8LeXKzBJzN6VAaEWuZGhj5JZD3x9jowIB5DdqgOZ7ioHuCHqYA3nXAErndLYgZfHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071946; c=relaxed/simple;
	bh=XjCiNsAC40h7dMKWtLaCdeJCA8OyX9rhMEPwBg7AirQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Sl9wZpzzYz8nnZ6XAj35ch67ND0TF8A+KsgjEhx/qIRQmfr1eoXgykr9/UhqnWXw6ReDLKEA0ZSGpI5qupnw+iDnW9Hm5QAeZjeyxLEpmBe+TONrR5xFDPeehy61zFps3mVJNIpQSVxXymwPlcRF+hSE1eEVi3W6TG6MFmHhzCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zyr4schr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773071945; x=1804607945;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=XjCiNsAC40h7dMKWtLaCdeJCA8OyX9rhMEPwBg7AirQ=;
  b=Zyr4schrZdj0/GasNAlO0vjqNlo9rRzHpUnsVf5IUV61j/egbGuGLE7k
   46D4r8iKdjCTMv5W1KLiLaXTMdhsbdO+7gFiR4YvwK98XHlwt3pbf6U8T
   XkZHI+12lIPPwl9j6oVif0f6icUjszaK90sUGNsKSQ7PbDzozvNJDqA6r
   FDaTyCXcPmYFE1uu4OUsCrjuREbLveMmsGFxJGu9Oy0SNsHvwl4l4rHo4
   uxJrkqwBNdO7wGfLbgE5JHQ53qWnt2STOWoK5moObGFUkhC9wIFMnMbJU
   b2YHpij/hmgm7jswWwfxEJiMDnOlZSQnhn0/ZYoFu3QReGpYjOEiX+z0F
   A==;
X-CSE-ConnectionGUID: 243AAq6aTEeTLr+aeUVW7g==
X-CSE-MsgGUID: jZgscOLtTAWhMXecgEoZxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74001649"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="74001649"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 08:59:05 -0700
X-CSE-ConnectionGUID: 94ByP5coQ0qgnYf3omjoYw==
X-CSE-MsgGUID: 1pvQjpCEQB60R/AQ1hj1Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="224735153"
Received: from spandruv-desk2.jf.intel.com ([10.88.27.176])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 08:59:05 -0700
Message-ID: <31d0568a9a1f2dd55ab040a95ce1c2165d95ba4f.camel@linux.intel.com>
Subject: Re: [PATCH v3 21/30] tools: power: x86/intel-speed-select: Append
 extra cflags
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>, James
 Clark <james.clark@linaro.org>,  Kees Cook <kees@kernel.org>, Quentin
 Monnet <qmo@kernel.org>, Nathan Chancellor <nathan@kernel.org>,  Nicolas
 Schier	 <nsc@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, Alexei Starovoitov	 <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko	
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman	 <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh	 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo	
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, "Rafael J. Wysocki"	
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui	
 <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Peter Zijlstra	
 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Mark Rutland	
 <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>,  Adrian Hunter
 <adrian.hunter@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>, William
 Breathitt Gray	 <wbg@kernel.org>, Barry Song <baohua@kernel.org>, Qinxin
 Xia	 <xiaqinxin@huawei.com>, Bartosz Golaszewski <brgl@kernel.org>, Kent
 Gibson	 <warthog618@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang	 <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui	 <decui@microsoft.com>, Long Li <longli@microsoft.com>, Jonathan
 Cameron	 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?=	 <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Andrew Morton	 <akpm@linux-foundation.org>, Willy
 Tarreau <w@1wt.eu>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=	
 <linux@weissschuh.net>, Josh Poimboeuf <jpoimboe@kernel.org>, Robert Moore	
 <robert.moore@intel.com>, Len Brown <lenb@kernel.org>, Tejun Heo
 <tj@kernel.org>,  David Vernet <void@manifault.com>, Andrea Righi
 <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>,  Mark Brown
 <broonie@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Gabriele Monaco
	 <gmonaco@redhat.com>, Shuah Khan <shuah@kernel.org>, Jiri Kosina	
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-perf-users@vger.kernel.org
Date: Mon, 09 Mar 2026 08:59:04 -0700
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-21-6477808123b7@arm.com>
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com>
	 <20260308-tools_build_fix_zero_init-v3-21-6477808123b7@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: A188E23C88F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11710-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.pandruvada@linux.intel.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[69];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:dkim,intel.com:email,linux.intel.com:mid,arm.com:email]
X-Rspamd-Action: no action

On Sun, 2026-03-08 at 16:46 +0000, Leo Yan wrote:
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied
> to
> the compiler.
>=20
> Signed-off-by: Leo Yan <leo.yan@arm.com>
    Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
> =C2=A0tools/power/x86/intel-speed-select/Makefile | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/tools/power/x86/intel-speed-select/Makefile
> b/tools/power/x86/intel-speed-select/Makefile
> index
> 6b299aae2ded89c3a70a3649996e258b98001ee7..61d6e81f3cf1d6427addb4f31c1
> 369ac663ba3d6 100644
> --- a/tools/power/x86/intel-speed-select/Makefile
> +++ b/tools/power/x86/intel-speed-select/Makefile
> @@ -19,6 +19,7 @@ ifeq ($(NL3_CFLAGS),)
> =C2=A0NL3_CFLAGS =3D -I/usr/include/libnl3
> =C2=A0endif
> =C2=A0
> +override CFLAGS +=3D $(EXTRA_CFLAGS)
> =C2=A0override CFLAGS +=3D -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
> $(NL3_CFLAGS)
> =C2=A0override LDFLAGS +=3D -lnl-genl-3 -lnl-3
> =C2=A0

