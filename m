Return-Path: <linux-kbuild+bounces-11737-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIADOpYMr2lzMQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11737-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:08:22 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2A523E428
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 730273015EDB
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 18:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F2433BBCB;
	Mon,  9 Mar 2026 18:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CCQexuhY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB2C33B974
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 18:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079487; cv=pass; b=Nktkr1rJhrN4+AIm7PzUqRfeXJT9cufvbhleUhD6pB3Q8eteU/9bhrGbxNozDeVmIBuGnVpw5+09W7j6eBLL9FSQAPf3eatFWIjBujxyjjceusE/lnK1wRe3Yqlgcw4CMV57HhoIiDBzKMaeSHGdo6ZmX5+RodsFUAdBQSShpXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079487; c=relaxed/simple;
	bh=npXWJ1Ogp4AocCs7RB8Gmks+wTJjIc4kyHvjbnfQFFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJNlT2CULDxwxNjRGbk5DMQtObJsUN+kfsFOCP5QCITxnqWnWq80nayEXDQgYM8aoFGHhwQ9dV3ojry/5tKvqwxRHcmudz5kAggbxYsoEOYTQhtKSnW/j//+jlPMZEPaAIK9J5/ljjZxVh7K+Ww+br+1r0UPPdFqDkKCBsu94pA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CCQexuhY; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ae4b40999bso17075ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 11:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079486; cv=none;
        d=google.com; s=arc-20240605;
        b=e0d6WBqdOFtPps400n3aL2FsKRXRfntSKSpH7VK+7VZ2TnALud0U0GQE+IZDcjvpjy
         A5xEBRHIrgqtnXxYtXFW2uOwdClvyutkdKOB/cnL+LE/xf9wfimoY+WW4xFpm14JnSNZ
         Lk7naPp0fvS7QvHgd5dD0Gr3pJGQ9k6Az98VB8ZtE0WGHc0RUvTRcI7VRUaGU6RN9zem
         kaNg1XaEe8QyZoFmnUnJYZJHGe1S8cQWprZUzxWDbYUQtPJjjOLPZt8Aou1lii82JK8u
         gS/Dzz3AHWaCdpZNJJS9HBohCI4a0rxzXIGo9HaPBGkdw1Nmb4ha0fKQofGtHq1G1pZ0
         1HeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DBqxxD+S7Du6uUzPbzqvi9ezyRX+g2oywK0VLlpuaLI=;
        fh=NMybpmwUTdmMVFyoGq6XpDAm3YHVitYGXWbuwi6KtJo=;
        b=T8BZCL3GyO/BLQdi5A51qLcfxgw28CM+lHEcW4AENx7kqnk2pj37IdsgMuCYf9iSlS
         wNd9RtOHdwcsRcYDCiretMz3tRNvBAh9rYA6ijcC4Xn8+gz3xoUILSlXEP3yziTjK6dF
         2rRFaKx8E94FDouR0Bhphm8p4KiFzbCbLztJ+KPG2ry+CSznrRH24qmGzyDEa0e7jHAG
         OCd1FAM52lTkjiSwEsbAsVOho2J8xDxSBQAegXBabMVWkPfujt9pAZ4AH7FIpJOEO73u
         DqjmYIbZkvURkGYdYHgdRx3S+7UKrTaVN5k6ZRjDxjcHhlOti3qfN+o9NtsTlFzYtDUe
         pM/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079486; x=1773684286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBqxxD+S7Du6uUzPbzqvi9ezyRX+g2oywK0VLlpuaLI=;
        b=CCQexuhY4mc0JNj/a+moQm6hEV4Wx3OgS2MBtGCSp414fB7iumYRo3723/Ern8tROb
         N3XwEYgq4zCaoQOm+9JkoZQATuuWNrVXeU2a+i1rdoBCeD4rdav13LVyRmm7fal1kjQ3
         pLw422X7Th5P81JlLXQL3LI7yFatTG7RX4YIGJICZ3J5gJAhvqGb2lO3ht+fYIz2tTS/
         DQIUVmOKoNQNZYHGFxJb1HgwG12jjx2jiCjjRfkHgULgtExj0b4IpClbgAHEM1+lYbrq
         7hYdgVOvDZKCJTqRUlupKGLdIHwJrv5XslxWDtY87pzhFyFDMUFUk2JyS2x39flw9z7T
         actQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079486; x=1773684286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DBqxxD+S7Du6uUzPbzqvi9ezyRX+g2oywK0VLlpuaLI=;
        b=mvk1DZr/9WU0pi5OGAlumolZQGEadC9yq5MeRN3Tb12mAMFI4UZvllwkioZ4/2oYoc
         hDggr3CWx57jEsZ+9Y+DYijrakD53C/A2biWNtXt/9l6DrDhZK4o1iQueuFJ5YtREBQN
         oW6WFQx/xexBht0A3ZeP3A1XF2LwSZsphNW3ejbsRx//shRjrayeabQHHKd5gCBdm7u7
         vtVKS1akaGow3xQlo39a6AJXXBSSZtVjpzQoMk52E6PmGGcx+QL9QvwWyF32Ma3tMLbd
         AG5gBpKf142m0gkuAZ8PQG5GrrmlZOpIXn5xkUWLEINtCP1cnoGnWfyJgUu590H8XMEw
         Vlug==
X-Forwarded-Encrypted: i=1; AJvYcCVEl5090OJck8fQj34WNMq8KPrJiesErtp8Xb80Q15ZQrtmUpreXkgmxvuZzT1XK4/GlMsvVsauZ3llT1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSG4w8QDv1MqB6qE6b6g0Vxn1MxiWIpWLeVlB3DEvDyhAJT/BN
	BgM0zXZurJ7MW6nbZyo/gXpcDnu3dpMPJHuf7L5tLI/bKJwjUpy8do2TtMvZRDZJd+o3XByncJd
	NaZNFHkFbqlLlmzIyUYsqpsFAboHpCzljYNlbo5CD
X-Gm-Gg: ATEYQzyCa6uc7aY5e1u0Lr02SygXeCH83gwMeJDD4I7AYX37A/YIttc17CdUpfwu4+E
	klX8v8mJfozheC+tfO0BDtwZmQCouP457vGaiZzWg32Qo80598FjnhDMMWhR4wqfc624TKlB9nm
	Qf2/qVTddmuy8PQ4M6scZLus9w3GFlk5rnSpLHMrZxNHPTtvVNK0AJdeCVwiUhNJjPMJyehT7VE
	Tif/yX3t+n/xihcCC+5E7jA887YB6FPEeM+A+u+IDyysaaDnGB/EtaopjKxJEA/K7haaBS42Bzx
	lMjA3mugHvBdKtFCRVoLqGbSw3NkrBzvOIc=
X-Received: by 2002:a17:902:ebd2:b0:2ae:45bb:bc4e with SMTP id
 d9443c01a7336-2aea30ebe48mr266065ad.24.1773079485553; Mon, 09 Mar 2026
 11:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-25-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-25-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 11:04:34 -0700
X-Gm-Features: AaiRm50lc2gBLiSfkJ4Z4DE1wl9NNkgaEba7Sk-TcENnQ4sOXRAHypkvAN4AJdA
Message-ID: <CAP-5=fVxSoN0EoWMG3BXAxrBxyaRaSOcgONcz-TCjn4=CTh0zg@mail.gmail.com>
Subject: Re: [PATCH v3 25/30] tools: usb: Append extra cflags
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
X-Rspamd-Queue-Id: 1C2A523E428
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,google.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-11737-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,arm.com:email]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 9:50=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/usb/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/usb/Makefile b/tools/usb/Makefile
> index c6235667dd46223b646bbab5c82c810221750182..db2ff5b8e5ab7b76e424df32e=
d5a9458daa5d516 100644
> --- a/tools/usb/Makefile
> +++ b/tools/usb/Makefile
> @@ -13,6 +13,7 @@ endif
>  # (this improves performance and avoids hard-to-debug behaviour);
>  MAKEFLAGS +=3D -r
>
> +override CFLAGS +=3D $(EXTRA_CFLAGS)
>  override CFLAGS +=3D -O2 -Wall -Wextra -g -D_GNU_SOURCE -I$(OUTPUT)inclu=
de -I$(srctree)/tools/include

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

>  override LDFLAGS +=3D -lpthread
>
>
> --
> 2.34.1
>

