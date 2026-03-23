Return-Path: <linux-kbuild+bounces-12211-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IF5IGC4wWm/UwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12211-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 23:02:08 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6562FE03B
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 23:02:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0A5030C818C
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 21:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80148381AFE;
	Mon, 23 Mar 2026 21:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DjlHRmO4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B073815C7
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 21:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774303031; cv=pass; b=jo2tGUR+iYIiPnxCC0xWgWlha5lmkuzuOvUkz+RyE+ZnMC5HtC/maalP/s1GkAJAy4AGikRG765QbO6NatxJ3S/5Gk9nfVNGFJeN33cTUnNkWU5iSCdK0vcLlofkf6ZD+qUphJh0S8I7TssiKiYaXN+1opkjfeVj41KzWZVYePs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774303031; c=relaxed/simple;
	bh=3HDKDC0lIjXTJkZf5wCHM5TLTGOaJOrpuDL9QRVrxN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dWm8IHuKSpLRRpc5i+pVVphD/RH9WNFdDk6DM2feT8X/R58MzdIH5/kamxokBcPo64YYjnBlsy9Wimk71XewDyT16wkduVK6aXJmV7ruw5Xx0DQwCjNMkMD6XchOVgRT3rpDqHbd5R8sXg06LdnS8hiXoqpjCIjy8ybWalnuyiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DjlHRmO4; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b052ec7176so13315ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 14:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774303029; cv=none;
        d=google.com; s=arc-20240605;
        b=aeVmikS6FUuszdpDfdRn6hQ/zOGsNDBLKjPPc+1qAYSjiAt0c3Ljoe8DrYrCgPh2hZ
         BQ+BL6J2Cpfm1bIxKDmuws80gbAH1pSKneaCNG+BBk1ywV1G/jD0VhqD7l9rLI8cG+w1
         MkL0FBywspGEGqKlWMJJBrt+3QjToWgt/MUC1VZFRvlOuCuZ98SFcWG98bTJOYAOB1uC
         FQrd4zSTdlLZfFZoSXDGc8QwH6e6zquhfyM9TmrplxixM98cE1Uy99heT6KQ3h1NeIAu
         vMWFrQNKINIyahgF8iZSxmp9ek8Ps7bknOYmPkC5cFzpVfr7Y6I81ta3LinSPcxXY7s5
         IFAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GPXQMzfpmnH00CqVoNsc4m4ItRTdzOmQSngWvXhXTrU=;
        fh=S7KMRJqllm17jGq5Y5wicKnIU16Dl3E5z/jovVKUkYk=;
        b=IJ5/nsydO40PknInncw6EvwBRiuNmjmnCcYoXPbi3Mi33alXLhQpIxTAE3CTP9Oy3K
         ZzIFcw3B+9NNH3SjreRwxIbyNq4G7qPZ6gxAIWvlcHUkQpJzkyT/311uOIhPCDxu3c0N
         ZV5KzGDpiM49oOcR4JwIob5M+FjsDz89XDaFGM83eSouBufGItO70CUfj6i4qKlCdmEj
         PHCp8gCjri1L+yRx9KQznWPESFM6QUKuOB03hwvdlZ0zMhXuBaDlqjVGvApqkxaWG7oJ
         0qyVdVBPkV4F+KsX9PQmKyCzHF45eocT/Rqao/qfnTCcnJ9rbrxLwx/DQK+cIOYr4W6w
         ngIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774303029; x=1774907829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPXQMzfpmnH00CqVoNsc4m4ItRTdzOmQSngWvXhXTrU=;
        b=DjlHRmO4Ok1xXyLmfTZMSJvZxrLD3ZblANZgK3fl0rav6lzSpSWK8Hlqa6kVK0cAvR
         wvahYRsPIk617zjVP267eQ4XTiwM75eV4UdEs0xvjb4m84dcTV0Pp88NW32m3JRN3c0B
         aj8k0Ecs+mNQxPUok5y/2+fRUsqIUZi7vC+MU3k2SdxkM/z0VXH6Cc6cpf82PxYxK5AE
         gjfTi3Eaush+F1EUmCMBpRWxaL9thgHdWzvtIo5B1I/BxxdmyUzoJ3iLx5D9B2uw6rDN
         1hfbI54sntlJl/JAI6arm2aYRDnEzz8WE2/pBWScek9jch52l/i/neir2rK0smFqYps3
         m1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774303029; x=1774907829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GPXQMzfpmnH00CqVoNsc4m4ItRTdzOmQSngWvXhXTrU=;
        b=HetEEEvJsoubG2/xjZOkFjd68WVDV3maOePeuca7ScYz15PtpCY/LLE5R7KnK5JvKW
         xKfLeKDvbT/oFWCK66e31wYGBGB9k+MJB1xYSSBpRzNWRTsfiVpVYNDnMBTDms/0MHTB
         o/r+fscjMujyfn2dsJ7e8qiF1GgUCZAn5sNfI7tymAjkCsA8BCpd5eifSEqo4ygGhgVu
         dNhQBNZz0CbNPUO0kBV9W/OMqnYMVXVf3WeW4lxm/YX4H7T6fir3qjsw386UwDY8Nl9z
         ffG5EkoquABTLzeBT9chVNeW+q+9jAbPnC5rafoLfPwzuz+wsvUpG6/AJsTXzyg9z2M/
         cWZg==
X-Forwarded-Encrypted: i=1; AJvYcCUHunCeuaprKhKapj71a/PpFyDgbTz5Gy5eDPevzi8ON/Ul8zzCWgeijqlHh/dSIteWn5czo5//gbZY3xs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6evtf+N26K7tvvyYYCJJLgZo9IlAi5d10KFsMsUDxgH33rgqb
	vXRcD9AIVX3g/oknBRUKn25m1s7kZgt+ZEqQT2bwPxSSFKwN/8ycO54v0kaiwqDS1vJRxJFjqHh
	V+Gks45KfrC7YY0cChGcQTlsDZJYONyzyTqa7Ubca
X-Gm-Gg: ATEYQzx/+tmJBsIs8mH5lIMZb2TJsZOSt0gsQxZGa68mdZAJo1I7TED6XiV/zS12g/b
	XrJU6MZM/nBgGBTOp7kZOhr6wtvQGyg85L/rcXo2yCEk7jjkM+eFIQmSHZQOdoDsVQfGXFk6Gpn
	sipUS/bumTdzAgzQ09H36eoSRG2PTfX6p2mIlmQJpo1VkKlAgNfF5ZNnpYuJ6/OWqKnxsk2KJoq
	Ns1c50ZXdM+XNxzLPr36bVtR7AVIyq0/GntbLJOyKkxth3hlf7Wx9cgXuuyy6QASbH5NHlSJ3FH
	7RDvlgfOyGI3vyTDFsznDCbgWaoPFVziXUl6Eg==
X-Received: by 2002:a17:903:120a:b0:2ad:6f9b:3b2e with SMTP id
 d9443c01a7336-2b0a68b2e39mr495165ad.23.1774303027835; Mon, 23 Mar 2026
 14:57:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-tools_build_fix_zero_init-v6-0-235858c51af9@arm.com>
In-Reply-To: <20260323-tools_build_fix_zero_init-v6-0-235858c51af9@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 23 Mar 2026 14:56:56 -0700
X-Gm-Features: AaiRm53Mbi7zqSsMY0cu3Z1F6OSpsSyLgKtXFt41Q7y5VHPGKQjwCjs0jV7idMM
Message-ID: <CAP-5=fWzqV6fSr1XX9azDKkvu=a3C4k3qDYFFcKh0MpPYK8tUA@mail.gmail.com>
Subject: Re: [PATCH v6 00/24] tools build: Append -fzero-init-padding-bits=all option
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
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,google.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-12211-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,mail.gmail.com:mid,sashiko.dev:url,gnu.org:url]
X-Rspamd-Queue-Id: DD6562FE03B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 8:13=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> GCC-15 doesn't guarantee that a {0} initializer clears the whole union [1=
].
> This may cause bugs if data is not intialized properly.
>
> The kernel enabld the -fzero-init-padding-bits=3Dall option to tackle the
> issue, which was merged in commit dce4aab8441d ("kbuild: Use
> -fzero-init-padding-bits=3Dall").
>
> This series propagates the same flag to the tools build.  It uses
> tools/scripts/Makefile.include as the central place to add the
> option to EXTRA_CFLAGS and HOST_EXTRACFLAGS for the CC and HOSTCC
> compilers.  Each project under tools/ appends the variables as needed.
>
> BPF/bpftool related patches will be sent separately, as maintainers
> prefer them to go via the BPF tree.
>
> The changes are organized into three parts:
>
>   Patches 01 =E2=80=93 04: Fixes for thermal build.
>   Patch 05:        Propagate -fzero-init-padding-bits=3Dall to
>                    EXTRA_CFLAGS and HOST_EXTRACFLAGS for the
>                    CC and HOSTCC compilers, respectively.
>   Patches 06 =E2=80=93 24: Apply EXTRA_CFLAGS and HOST_EXTRACFLAGS in
>                    project Makefiles.
>
> The change has been verified:
>
> Test 1: Cross compiling perf
>         host: gcc 15.2.0 (x86_64), target: aarch64-linux-gnu-gcc
>
>   make ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu- LDFLAGS=3D"-static=
" \
>             -C tools/perf VF=3D1 CORESIGHT=3D1 NO_JEVENTS=3D1 DEBUG=3D1
>
> Test 2: Cross compiling selftest bpf and sched_ext
>         host: gcc 15.2.0 (x86_64), target: aarch64-linux-gnu-gcc
>
>   export ARCH=3Darm64
>   export CROSS_COMPILE=3Daarch64-linux-gnu-
>   make -C tools/testing/selftests/ TARGETS=3D"bpf sched_ext" SKIP_TARGETS=
=3D""
>
> Test 3: Native compiling selftest bpf and sched_ext
>         host: gcc 15.2.0 (x86_64)
>
>   make -C tools/testing/selftests/ TARGETS=3D"bpf sched_ext" SKIP_TARGETS=
=3D""
>
> Test 4: BPF CI test (with BPF patches sent separately)
>
>   https://github.com/kernel-patches/bpf/actions/runs/23439834394
>
> [1] https://gcc.gnu.org/gcc-15/changes.html
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Acked-by: Ian Rogers <irogers@google.com>

At some point the AI reviews appear to be increasingly off in the
weeds. I believe the nolibc stuff, read-only file system things, etc.
in:
https://sashiko.dev/#/patchset/20260323-tools_build_fix_zero_init-v6-0-2358=
58c51af9%40arm.com
are not a major concern. Thanks for humoring them, they were able to
consider a far wider impact than I could from a snippet of Makefile.

Thanks,
Ian

> ---
> Changes in v6:
> - Gathered Acked tags (thanks Jonathan!)
> - Left out bpftool patches and will send together with other BPF patches =
(Quentin)
> - Added back complete info in cover (Peter.Z)
> - Link to v5: https://lore.kernel.org/r/20260318-tools_build_fix_zero_ini=
t-v5-0-bbeffd8da199@arm.com
>
> Changes in v5:
> - Gathered Acked tags (thanks Daniel, Namhyung, Benjamin!)
> - Appended HOST_EXTRACFLAGS after KBUILD_HOSTCFLAGS (Ian)
> - Appended CFLAGS for libc-test (Thomas)
> - Left out BPF patches and will send out separately (Alexei)
> - Rebase on v7.0.0-rc4
> - Link to v4: https://lore.kernel.org/r/20260311-tools_build_fix_zero_ini=
t-v4-0-9e35bdb99cb3@arm.com
>
> ---
> Leo Yan (24):
>       tools: lib: thermal: Fix typo
>       tools/thermal: Fix typo
>       tools: lib: thermal: Initialize CFLAGS before including Makefile.in=
clude
>       tools/thermal: Initialize CFLAGS before including Makefile.include
>       tools build: Append -fzero-init-padding-bits=3Dall to extra cflags
>       perf build: Append extra host flags
>       tools build: Append extra host cflags
>       tools: bootconfig: Append extra cflags
>       tools: counter: Append extra cflags
>       tools: dma: Append extra cflags
>       tools: gpio: Append extra cflags
>       tools: hv: Append extra cflags
>       tools: iio: Append extra cflags
>       tools: mm: Append extra cflags
>       tools: objtool: Append extra host cflags
>       tools: power: acpi: Append extra cflags
>       tools: power: x86/intel-speed-select: Append extra cflags
>       tools: sched_ext: Append extra cflags
>       tools: spi: Append extra cflags
>       tools: tracing: Append extra cflags
>       tools: usb: Append extra cflags
>       selftests/hid: Append extra cflags
>       selftests/nolibc: Append extra cflags
>       selftests/sched_ext: Append extra cflags
>
>  tools/bootconfig/Makefile                   |  1 +
>  tools/build/Makefile                        |  6 ++++--
>  tools/counter/Makefile                      |  1 +
>  tools/dma/Makefile                          |  1 +
>  tools/gpio/Makefile                         |  1 +
>  tools/hv/Makefile                           |  1 +
>  tools/iio/Makefile                          |  1 +
>  tools/lib/thermal/Makefile                  | 20 ++++++++++---------
>  tools/mm/Makefile                           |  1 +
>  tools/objtool/Makefile                      |  2 ++
>  tools/perf/Makefile.config                  |  2 +-
>  tools/power/acpi/Makefile.config            |  1 +
>  tools/power/x86/intel-speed-select/Makefile |  1 +
>  tools/sched_ext/Makefile                    |  1 +
>  tools/scripts/Makefile.include              | 30 +++++++++++++++++++++++=
++++++
>  tools/spi/Makefile                          |  1 +
>  tools/testing/selftests/hid/Makefile        |  1 +
>  tools/testing/selftests/nolibc/Makefile     |  7 +++----
>  tools/testing/selftests/sched_ext/Makefile  |  1 +
>  tools/thermal/lib/Makefile                  | 20 ++++++++++---------
>  tools/tracing/latency/Makefile              |  1 +
>  tools/usb/Makefile                          |  1 +
>  22 files changed, 77 insertions(+), 25 deletions(-)
> ---
> base-commit: bfec8e88ff6022b056615ec71506703e7e54de82
> change-id: 20260224-tools_build_fix_zero_init-dc5261bd8b8b
>
> Best regards,
> --
> Leo Yan <leo.yan@arm.com>
>

