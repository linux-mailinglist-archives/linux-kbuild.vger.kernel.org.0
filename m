Return-Path: <linux-kbuild+bounces-11716-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePU6KkX3rmnZKgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11716-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 17:37:25 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F96223CD3C
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 17:37:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 45460300ACBE
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 16:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60D0392809;
	Mon,  9 Mar 2026 16:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yr1LTfWL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5366A3A7F4E
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 16:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074241; cv=pass; b=WOk2FGCszkpATSnF6MHe6ELE4eYfyYhjsv5i2F3OR/bjtGkAMwcm1zbHeORalW3+v7RJrFNlquoJl9iruRNEBndtAvcrMj5XGHR8KAWRpZH2k/x6UPPM4odu/7400Ohc4t7+ynbVvpDFMcEUN7NFGjZEILnbDIm87Q/jL/fm7q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074241; c=relaxed/simple;
	bh=/xVvyD0Lqn/lAfbvI9yNkpJEV7R1uzy3kwW07nfLaKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bS4Iqz9KV7kToS9RaD3rDRhG93U676uJYitW+ITHUXgPZeRjpf8R7Oy/iCAqhWwJbcMZdvBe0UpLfJ1b6Uia3yIXwwx991+llNP+kyF4ezyEGFZjlXvprscPQpOzfnpa8NztDkkscSm2STcXmmUPmQeuOaiAnoMjX521sqjvG3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yr1LTfWL; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ae523d54d2so155175ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 09:37:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773074240; cv=none;
        d=google.com; s=arc-20240605;
        b=DAUMUdZ7Mnxp1QPj3AcNEIgGhVEkhmTYs14CfnQUcJOQnCz/r9lldAnUqoKfHVY0RY
         jbJ7YHOM5ugl+CHTyhqy5+D6LP7IhIu9vHbaNVTZBsT15jpdYFM4h10N3d+Zsy0CUukd
         lj62tte2fjr5pbssrVs/nJpgpqVzTlrQGhGU0PbmOI5C7QCXyWsAJvzisR1p7G0hYuOD
         8LzFr7AI5JY6NzipYX3L6/VVuv5PR+nY9s+7qLoUsHyoRR6tz8XCrT+pwAILMssEMiQB
         IxGGHuSeyE8eWYSxxJhzR02fE+iNlrp2XMFw+neCvLdquEGH362GB4r2VSM+QDZ/Bw8/
         LzXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c8Tx6Ml8LCMcseT9tf2wyQ8mZ0fxne/KMVLw9eyT1gw=;
        fh=1OuIyJMlG5o9yi//UlGUcZ6D0Fxb9dPK+ywaoaUkZP8=;
        b=Q/w3NFWBzjahas/QeN5XOimHbsduwi9cDfLMEJZA5YPgEU6Rb+uZ1qimfQjeMBYfkp
         3SGwJGcu+E7f1n6unjunxUaCdZlEX1Q+J5mHz5R0Y4WP9MJcfoQAie/J+jQ3Ey86bNvj
         edmOurplfGULnhgxEgIq1LNXGCtAPF3wXHC52FwVLMhCkFBnedAEEVNjJ+pD9y2jdjKO
         5KQMczoijkO7iGZ4gshU/n1HMBWB7hE3/Y7YmRCF0bXYsJovRe6ZfOGX3rsfPfsT052K
         Lq1pOPjzDIgMcF64VEScyOCFP0/x55gnvaTaShdb6a2WBdhoJWG5ebjHD4rL98MtNiwd
         aHuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773074240; x=1773679040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8Tx6Ml8LCMcseT9tf2wyQ8mZ0fxne/KMVLw9eyT1gw=;
        b=Yr1LTfWLk6ccaQbsjiQW0i0d0CCRFWodupiTvfLJrDQM5BKKyC1JcPik9YZ3XNKs4x
         w1dLJohfjorzxddlDE8D2IZ9PyYW+MQvvWgwq5CEusXSOSgBm7NPt6CcrmhxANc9qRP0
         UMrToZX/bZWJwLyk237DVjkMX5MH5mvRiMb7IagBvFrsdyT7vpx9iBAQjFWYFRhuM1Ps
         OtcnJS+643oP8xu0MHir/DO5fAoADSw8Gdbhx/Xo57CQmn3DQF4g8FmuQEruZcHPOEfB
         xhrQfjeQAWAU3FbHiKi7VT06GdutY1T3BJFRgBWSOFR0MzUtqOupPCWekcGS/MbfS3zS
         OXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773074240; x=1773679040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c8Tx6Ml8LCMcseT9tf2wyQ8mZ0fxne/KMVLw9eyT1gw=;
        b=VTbJ0er2+DQMAE3y7O9ZUVcex/VvcEukO+yT1jMPcR5b0hbsd28T+EY48MZsThO3Oh
         5qgqB16USWvVbL7ibozxeEa7yPY2RgRpovFSFaqRU4LqIlTWPeYvYZYVccoZgHewMpAB
         4wo4OApxbBdyUA1DaHGjGpv2kWL94lXgacmiAbTXLDLqrbDGgJ65fKHVWiCHke/lH9Bx
         uT3pequg7Oy2aeY8RYwOmxNMK6ckeBtkrxK7cKRVxAUTjIL9/4s+l759VkTGXstQldbx
         vw2i3jAFznbaFzhzTK6lEygWRf4BPQl+VuddDoOqnbC07oIsD9rw5/AVQru2/tbFfhGo
         /n6g==
X-Forwarded-Encrypted: i=1; AJvYcCWLPEbkMYkIrHmUiMWvpXBO3NiOkCfSn7tWH4Ffm1vkz/+KJyPLFFhYGZVQbGhuPZmT3KQt+oqsu+jy9Fg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqjNyQb6wUv4CAgSBdqLzK4NekZdAHCIqgRg5ZcAwiftbBR98N
	V8b4ikWp/m9B1MdsyXWZVhpBDYl32io4lm6vPLTSBFhyx8BeuHvCoF3cK696y1/LGB0YBR/ybAI
	dETAnxmqpIhTjr87uTMznWwWudnt9LLyKCutbUp7b
X-Gm-Gg: ATEYQzz6/29NkK7AnFa5eLZjmeKftALnggdBI7rJbSWfJC8vi/aoaHElPWKKKFlajAo
	h3Lt/s10Vwm/zN3erT0Bx+lbDqil+zYWvRUPwuepi10VF0BL8XTygt+Fi+M432CjvL/q0/p/UgB
	EkY8kqXpzJZcXzuKaqr8Vk9AJQAhu/haAgjRxivOC2/tAtUfgwMo5glEi/XGugclMmzbFeYZBoB
	Q+m5DwEbCuhiW51p2ZNcPNQ9s7C8Dtet7KXCnOOx0FeLmKZLFUhIOKkeUYn11Wz6EeU8JQCBAqX
	6+vgcAlmh9vF4GjSgI4ZvNiuMeWqVMM8ODM=
X-Received: by 2002:a17:902:cf4a:b0:2ae:4e8e:954e with SMTP id
 d9443c01a7336-2ae8b99a09fmr3540605ad.5.1773074239351; Mon, 09 Mar 2026
 09:37:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com>
 <20260308-tools_build_fix_zero_init-v3-24-6477808123b7@arm.com> <20260309114413.09e05127@gandalf.local.home>
In-Reply-To: <20260309114413.09e05127@gandalf.local.home>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 09:37:07 -0700
X-Gm-Features: AaiRm51Y_hOVZDhnwqzBMfs_foRdCHZgFLdwNP1ZXf1eU_ewkridlTQIwkfdNsE
Message-ID: <CAP-5=fU4JF6=aocKhgyZqyqm0NOKpAKEmruFj2mgBHfkqbN2yw@mail.gmail.com>
Subject: Re: [PATCH v3 24/30] tools: tracing: Append extra cflags
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
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
	Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan <shuah@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2F96223CD3C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,linaro.org,gmail.com,google.com,iogearbox.net,linux.dev,fomichev.me,intel.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-11716-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[69];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[irogers@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.990];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,goodmis.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 9, 2026 at 8:44=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
> On Sun, 08 Mar 2026 16:46:29 +0000
> Leo Yan <leo.yan@arm.com> wrote:
>
> > Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied t=
o
> > the compiler.
> >
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
>
> Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>

Not a problem with the change but running this patch through an AI
agent brought up:

  Should CFLAGS be initialized with default optimization and warning flags
  (e.g., -g -O2 -Wall)?

  Currently, latency-collector is built without these standard compilation
  flags because they are missing from the Makefile. In other commits in thi=
s
  series (like for libbpf and thermal), CFLAGS was explicitly initialized t=
o
 -g -O2 or -g -Wall when EXTRA_CFLAGS is not set.

  Additionally, should EXTRA_WARNINGS (provided by
  tools/scripts/Makefile.include) be appended to CFLAGS here, similar to
  how it is done for other tools?

Thanks,
Ian

