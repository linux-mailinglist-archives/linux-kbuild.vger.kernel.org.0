Return-Path: <linux-kbuild+bounces-11727-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JnFANMKr2lzMQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11727-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:00:51 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B08D823E1F1
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:00:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C59C0302EFBA
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 17:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCC4411610;
	Mon,  9 Mar 2026 17:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U11uiaOy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23D640F8F8
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 17:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773078972; cv=pass; b=PSCbxMmxXCyNwVGiBVCESvJSlJquskhvnFAGpofN1zHhXRBZ0oMh9StOSpIE5ZhJtR/nU5PCq/LaN16RMTwi8IAYFusGTOceTE6+PHz8zzop7U5fOhzM/xev562Bhgy26WDdmR7wd1RF5rA7+BcAV+SLK9tMpD8b8vIME350UPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773078972; c=relaxed/simple;
	bh=h+/4DZvdFjdZvTikaC3AlhbGhNWEZcA48r6UYxyTE/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kRr4ct04ReZRoTzDvIIM+cW0tOWYjhlfoCevFa97Q/C78St+pNBLn8VK+C+qfH51QHzKVgA9D/KCFMCD/FTUcWm4THdGCNSm8IqcYE1bf6b23eLU+4VyY1KKCUcVlZYY/P78+SafrUuwnU9KZVRoCBIt+7ZZ3Zi6JlhZmb2Tnfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U11uiaOy; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ae523d54d2so13465ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 10:56:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773078968; cv=none;
        d=google.com; s=arc-20240605;
        b=gNlpNybd/EcAOKkgEx2J17NC/MDxaisfJRK47CLqRboxjMBJl7j346Z2ffhR05Q0ZW
         gCXr5imTiADnXqy7oU50ZMEA2Hdi9T7hQq7fOYLvvtAAkX1XmXCpGIMhjR67pDAVjVsE
         UQO7j6szEqmsmVQCfxKblND/SkIyu3jvIMJ1q6SPxhINC06z+rGVJkFY4H/7YxkdSfWp
         4LtW6/Cf9mwPdvAlcrK6XzrB+GtQNM/l7oF9xIppXbGtAQprjFmjAX3bJavIkFvdu8BB
         QTWmdZvcPnoTxUDjFFWlxlW9a0VjhP+kqUtKYWvciUye3R3LG2P6SSywXs49Kabr3Lk2
         3bLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sEzDXhUVFO4MvSKwYYet5FlMfGg8jYj3MEwBCZj/ctI=;
        fh=ixp81FjDNU+/+2TeNXHKQTGx9EPlZ30Wmvvo2fhIrCc=;
        b=YCEnCsHm6hvVMtxQC5gsjKJeAL/RjgeTWSSb+6b1/+YvVhZ9Vy0v3ESQq0DhuDT7Xr
         KTfWMVfKzvDyIFILmRAKFcwWfRCPpS5HRkUWEo3P2DBhBmYkUN9rRKDsBhbsD5Y71NRC
         1x+XdiExl5lT/cGhNcNJXUsW1moTrFex7Pt2Vsewrk1ii4fQD/MrG1gHKwuXg13IYRe2
         XNArhCDjm15/IJYDmzZXhF/gVKZsVhzFVKQYjdbbo1HFr/hngyV8/d7XMXP5p+GuGl6d
         PN+Dch3OKjb1OySMNNOw4yIktLKhTkx6ka9Ud8uLumva6x36DEV3Qn2RAd3/dG0MLmqj
         UxzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773078968; x=1773683768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEzDXhUVFO4MvSKwYYet5FlMfGg8jYj3MEwBCZj/ctI=;
        b=U11uiaOy/jBHE//aNF4E6kzY4MDJjBnaRpkoB7CCpgQ/0iyDEpsr5a1GWNDeVO+d/b
         jwU2txSbFsSlUnpe4P9zQfSMnjyyRA0jqucMrG/wq/N+9u9PKpH15QuFhRjE0FkYy5LQ
         4kCk5XZy7yKebPFSSXyLwsxh2KCFNxi4tqj6yYRWPzv2h8qoM7GKNunt05pHMVIDzoOR
         Ej4SwuTGIecayImrmWIAWqZWpA42WOCw006hMKOrONeZaRGKuHrHM1HnxEB4KDUAQfM8
         lgfXqi5CNtLOlMo6sdzq8gYqcOSORZyBCkEAOUM8z/vV3tK61VdtNhsXIaZCYn2pBR+d
         WptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773078968; x=1773683768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sEzDXhUVFO4MvSKwYYet5FlMfGg8jYj3MEwBCZj/ctI=;
        b=Sy36mUHD+sGaViMNL7Q7S7gznOCrraM+go7CZ5IMzkiO1LBza+asSnDEMFfLsi9YtI
         Vu3fNeQqvQYcRcvgD/ndXBl9nCDCB+7fO8YBhbNheULEfaLO+juzw+7o6uYcMJG5rZrb
         zpD40F/quAXPMAT16klvW1vRGBiCwPynwlJ6z8ZYVNOw/u3NZSnII1p8MuEv1cVHi4gI
         JBUZiSvdq9M7P5L3lMdjhdHeiOFvm1I7RBjhRKKDGdYzi6c0e0hbP6XIuKLIFd4KhvPE
         DZXNj0Mv54loqteTooIl/LQhnzJgLwgicP/Ax9S8K32N+AVHZVT0n85hQpHz1yHoQapr
         Z/CA==
X-Forwarded-Encrypted: i=1; AJvYcCUzc6DYiwEwvnhEDr4obi4YmxO4n+qRmTlgp66/F+clZUqPsMOkAqwqsKzmjtTXipDwsBXRFkvoe/mmfJs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt6ewj0Wjlsl2+U1g2En9jUg8YgTLXAF62zQzVSNilGkk7A180
	9s6EDgUc7ZDjTKSruX76inJgMi0BxLYisRG3VbZZ1bkpZgMDHBxqafsuG9Vb9pZYJh4s3htgKb4
	hLuhwsUDNfRuBMR+DLTgZojvsIakiBPO8vwg63RuJ
X-Gm-Gg: ATEYQzxYrlIo18ldwryPOD8B1RfVxhxdRUTEwkleZZ7eOlM16dQVZBJFsFPR9ZIjjWE
	2mJnUJAjDtj5aCHhV9LoPSKYXwV4ajrvBOSEdtPohmc57vTI7uaqlfRxgo9kWHkHICls7iigV2J
	Q6RokaX9PFxqywdPwP6d46Y/TxSp41IAOQIV/yY2le7mLfgL40seAxmgDbuLBXqAUpKahC0s4nT
	eausDKGTOXSRWXbg++1VdX1C7T7gJhARQYrXlXXEk+3nx6okiH0Sk5U92U09cEHig78CWb9MWhH
	LYUPlP/1Q3tFWkVmpYdVGPvlEiJZLEUI2nY=
X-Received: by 2002:a17:903:22ca:b0:2ad:6f9b:3b2e with SMTP id
 d9443c01a7336-2aea32bfe3fmr148395ad.23.1773078967464; Mon, 09 Mar 2026
 10:56:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-12-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-12-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:55:56 -0700
X-Gm-Features: AaiRm51Xb31ugKo9S_MPmrA2EHDpcWCZuqysgwYrJ9m0CLzFNaO2kRL95jSSXGo
Message-ID: <CAP-5=fXyH=AZO9XEhXG_X0D+ikAyBmHBUXvDB8ivoJVF2ccjBA@mail.gmail.com>
Subject: Re: [PATCH v3 12/30] tools: counter: Append extra cflags
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
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
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B08D823E1F1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,google.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-11727-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[69];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[irogers@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,arm.com:email]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 9:48=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/counter/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/counter/Makefile b/tools/counter/Makefile
> index d82d35a520f610260abb43f6ae28e56d73268231..c0628677af3807bdc331ce2db=
a92b4e5f1a25b68 100644
> --- a/tools/counter/Makefile
> +++ b/tools/counter/Makefile
> @@ -12,6 +12,7 @@ endif
>  # (this improves performance and avoids hard-to-debug behaviour);
>  MAKEFLAGS +=3D -r
>
> +override CFLAGS +=3D $(EXTRA_CFLAGS)
>  override CFLAGS +=3D -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include \
>          -I$(srctree)/tools/include

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

>
> --
> 2.34.1
>

