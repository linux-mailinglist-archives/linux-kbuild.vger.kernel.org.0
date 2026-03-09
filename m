Return-Path: <linux-kbuild+bounces-11735-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBgPKJ8Mr2lzMQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11735-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:08:31 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACA923E450
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92A6930ABD6F
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 18:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738672FE560;
	Mon,  9 Mar 2026 18:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xuFlBHVB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4654628CF6F
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 18:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079376; cv=pass; b=iyoBB7+8sMNyNYjrre6zUS/d1zhNKSnu14rCkMQoJf/u2+fIBaovU8gPIfZANTMUFOmE1hKy1CB8DiDv2XxCPr6xJT/BOJKIdcJT1cd4mOTHu+Omr9SG82hOvzy2tkOcFMlit0z2l07LzFJzH7XlLFTL1kqi3tQI7iE+gz71UXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079376; c=relaxed/simple;
	bh=enJJBtiy6q9G9zGlhNtJO7VBcncRme179U9y2TQsR+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jGlhJPY8ZOyRGWkjyyk+2Ts7wOVZ8gB/bsE3Eb/WUrRytu0/WXD7rpRPB4BBjApfP6gGsg8pj4BeOMHZf8mJrG7Q6/VUbrTSoba5Ae/oHpYA1FSKECc2bK2IXSDcuYQNwBZwPV1ddB36toNwOS75aiy8J2YDMIuwoAXoBUw1j8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xuFlBHVB; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ae4b40999bso16255ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 11:02:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079374; cv=none;
        d=google.com; s=arc-20240605;
        b=Ssevoo8JvbHnH4jZ5Q2nnLiytirAqDDt+GnfoKQCL3TPQZbsAKQTdE5uUY2JCQF54t
         eTifrWYUXkDADUx3ZRSr9009KAthBvtR5yHBXtVOaCjLAqJG5PU2miFGWoelpToad4tC
         D8USP7YwISR8YpsTkCYvMyVWCwyBRiHSOtcG6vJM0qu2S+0o89G98FUQiM0pM8+oYeqF
         1X2VsAPM3YQbdQC5glzW8r0YLv1XoaDKjnETGP51dbmYmUgQNQ2+XFOS2Daph1bkwHZp
         8ZsXckN5wkbWtYgiUlJUuWs1CBq5TBSRa6JYmiJZmWI/E912pz90dsZUOO1tfx6oIUe7
         xIpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0DTQx0tSE71UMF6lY+qr4IIE8EQg8d4wRW0tM3/p9E4=;
        fh=ssK0X6GN68sndjJLN3ARiy58GpQAf9A93XYTppbqMzs=;
        b=hpPB3NiciBTeeMPur0m6tbdSdQ82KZWmNzukVE0UbASDUkRQzniwmrutEcEUl12DcQ
         VKrZVa53T7LhmyAtfwtzaLCCyK3z2GK1pZgxkh9Fe9AuL+H3BZEtu9OpCb2wFF1yRjl8
         nCb+1vqv79O3fhk4uE4Uk8rSX4V+pt+UKrfTgvwBOEmGKx6HkcaAiAwpLV5Tl5XSn9z/
         f1AGjQEyGVGLxmlhPBMBZ4rhDcpAWXf2OJJy1nvN2M4k2eN+2kwsNj9DugeA3EGzEWzr
         s5G7i54BeBuK03SpooV5A9QtHD0m6yyzpzV72NK22fY59GLvM4dzk7jNz9N17NKLTn15
         pS/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079374; x=1773684174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DTQx0tSE71UMF6lY+qr4IIE8EQg8d4wRW0tM3/p9E4=;
        b=xuFlBHVBhwnf2PB/LiW8ezsJnKscU4kL4gTml4DaRPuOcXiwuUrMFxlxiT+LMY8Jez
         +jLXIuHnLfmeeyG1JHvwO+TOWWpg7wMuSGK3qVeMSAl7xSk5bM7WCK42I1To/Q/VFFhz
         DdPFLhD6As4cRpRkVp5hKWJ81G7HKZqRBNdszKkC3VgYO1XLeCtN7FfeQkAKUE9bdaa3
         9j+nkj3nOC5J6srcscioMFmVpvCMo0wcq3A1RsgjVMsArf95wvON1uiGnZWxC+shMU+R
         ig8O5OFN74oaIIt2x9E7YJKaPp27yzSFlJy9gqSpIVCzXouIbfE+YKWuKBvQMf+ZBikt
         +1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079374; x=1773684174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0DTQx0tSE71UMF6lY+qr4IIE8EQg8d4wRW0tM3/p9E4=;
        b=oE5Rkktn9XUBNsfvwez64OGAZf5zTPagCZlqPJtD8WMTtdXw/Agh3eNkqI87yic8+C
         KdXg7NDCnRBjeOrZOQTcnJ3Yk60d5KCSep1bKV4yhKHk0LX1H2Dkf2DbAxwm/U2SghUL
         sz6Ye5cAAWWV0geiFdQjME5Pnc52bTmLW8GU3bo74rR5Kp5Lj1bAwd2k+YK7aQ7tuApb
         0v/MuwrhER//v+gOVxue+UInOzSDb6oXEjs7HwnP0YCoYbDpEXx5cuKOQMZcNcpfkBO2
         Q3qf6mIfz/hLCvVpyw6tqx86ZXUCXvsjHkpbLWWB9/5CIjbsBWZAI+fd58jmjNa/3C41
         Y2rA==
X-Forwarded-Encrypted: i=1; AJvYcCWmP6W4gCwYsDza2zpgUTB2YoCIeWAxdJeeno9YdNxtTNJpERhXj5swoHJH70ifmbSEBpjcSK/bnZxEsfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYDofRuWiy72ww83DAg8iALpf3olpszq26Lsvshj7TlFP/AiA4
	9DDHXpIXd4iLlcjVj1tGcm1y6TMBfe+GRXzIfoX/t3SFF/S6xMxukecC94mrDD4dysncT8lyRDc
	7MfagDB8wv0Z4IlCeT8spIY0zbcOCBxWTPZKdhC3U
X-Gm-Gg: ATEYQzxoFbFr19asYDa8aYEgI/RlhLrEiEIYdGXxNgnvvujS7wVV3bqyOa28NuG/uOx
	NIsH69v6M6gVw2p0RxCgSFha4QaqcMPOrkruvZ9Civ+OxMuZWyuTxNIdnHhrhgj3xkDw7DzAF47
	Jkr71U6ooSJ2jhs1ilCR2llv8qL9bxKiEdXqbyOtTnxm0OOC2TkKsw/YBg9po00LVFQSB/ZkiYP
	OjfGjyJ9rI0gokLCj7XUhscaZ7LbUbGsOlXbZ/FGOiPKOKwz6hhmyRNqQ88W1rZAJtwpMCd4ltm
	skgrYQT40NuKFswLg7k+UocqnhqrPSEi4vyKvCyZDAp8Vg==
X-Received: by 2002:a17:902:ecc4:b0:2a7:d266:d84a with SMTP id
 d9443c01a7336-2aea325870fmr266715ad.17.1773079373978; Mon, 09 Mar 2026
 11:02:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-30-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-30-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 11:02:40 -0700
X-Gm-Features: AaiRm53fepCChw8O6Lh_i9zc0Lx_aXs0tJ85eByc_82LQ2DVnvOinKgsctHPHWQ
Message-ID: <CAP-5=fW+8BXLMXKyZ6GLUq2it1VTVpCg61qCqpfSMDjHeOJfXw@mail.gmail.com>
Subject: Re: [PATCH v3 30/30] selftests/sched_ext: Append extra cflags
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
X-Rspamd-Queue-Id: 4ACA923E450
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,google.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-11735-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:email]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 9:50=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/testing/selftests/sched_ext/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/sched_ext/Makefile b/tools/testing/s=
elftests/sched_ext/Makefile
> index 006300ac6dff88a48104977398d8517753e7e385..81d8f4a184245d8c330cf45b7=
5bd868b2a7aa7dc 100644
> --- a/tools/testing/selftests/sched_ext/Makefile
> +++ b/tools/testing/selftests/sched_ext/Makefile
> @@ -53,6 +53,7 @@ ifneq ($(wildcard $(GENHDR)),)
>    GENFLAGS :=3D -DHAVE_GENHDR
>  endif
>
> +CFLAGS +=3D $(EXTRA_CFLAGS)
>  CFLAGS +=3D -g -O2 -rdynamic -pthread -Wall -Werror $(GENFLAGS)         =
         \
>           -I$(INCLUDE_DIR) -I$(GENDIR) -I$(LIBDIR)                       =
       \
>           -I$(TOOLSINCDIR) -I$(APIDIR) -I$(CURDIR)/include -I$(SCXTOOLSIN=
CDIR)

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

> --
> 2.34.1
>

