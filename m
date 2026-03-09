Return-Path: <linux-kbuild+bounces-11733-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MLXBCQNr2nHMwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11733-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:10:44 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA08423E519
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D94773035F41
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 18:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5864D3491CD;
	Mon,  9 Mar 2026 18:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R0sXvS3e"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18964347BDC
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 18:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079290; cv=pass; b=cpMi+JE2jmO+iRePm9W+7e5aQtAz4hHSQ8EnorBoaGX2Hq2zr5KJrmDwJ5Z0yVv5KdZonSumDsV9QuChSY+Q6DpUO40vPeRo8AizTQ+uS4+xc2Ga7oar16PQBiVfVd9Ww3Goel29tQmHCOit0l9uKfXbOpmMQeRAiwBRA97oCIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079290; c=relaxed/simple;
	bh=PoafOCA89v7UXLaSorz9ixnmscwPr1Rj7wAcGvs6co8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jRii2KdT1csysGv7uEIyA1kkJc4jv2ROh3u6xDOK6jX1I1zVCMTZdYv8S9ONXXSV6ius+v4lqs7eTvWLGoIthG3Aytr30HNYw+zIxFK3t8iqVT5zUWn08POI+mjePg7rsTC3JGcPOf1PrFG2f1pgiFssu82TfNQ0R0cqOym1WCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R0sXvS3e; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ae523d54d2so14595ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 11:01:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079288; cv=none;
        d=google.com; s=arc-20240605;
        b=Uquu6QpAdyl6LxY0huXbSdNuLmXf8IuMNgVIRu2sDrGai3TPJgtAyTrGv4ZmbR1l3I
         JWM+6YtR7/UZIxqgaDpyi4n260zUJQV4ScUOPfd8yttz+9P3tTU1txvAgIGxNwlJMZUw
         D2abqwctCsXNEI1o1X6g4/5U9UdpHfIroZefIc99uPUjs1oSkLxazCUDweReIfFA2A4N
         SoVPReqZWPZfwTOVSlDm9tGY0YDm8Wen/MDhCJTaWrJa1VzEW/2hD7yry91FsYV1EWNd
         7SS6CV2mVC7obq3WiyC2VZxpCCkgLiAaH3IgjK5i/EO5DS1hqTY0ToPfrR/GCqA1bPP4
         FdBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r26udjS1htgyNVho4B7xDT7S+9gsz+aLoULdjRjLynY=;
        fh=uYbnVmtXAnYfX7Q7lqepptXcy5NP+EvcLoS74XNCkks=;
        b=hxTAtaE7XCth46D83/6pHxSI6TfdTsUMdtEEV51Y5WSYtoroWBIzn/U0DuS/fjOKJM
         ixcXjCQAfWqI5yrtgHg9MUa6yrGbkPOphHhr8xgoBnXYzLuqzO+HV4mnRKs37ObEsH8f
         3YHCHRzQCuSyJ/4HtJ09KzMN/av/+BIyJLrSorKouLcl/8FtHT4H46qUi/dIKsHpLYBv
         c+tMhOY9r0X4OxU+f5VyGzrYz97qtCbSIR3Fe+YhMiDR5VDeKdyarpKJWBD+AP3aQpJo
         zRLtnZ7USXzXfT2+z+HKpioev/2+SZZJox6sL67GH3MtG+X65rYYyHwrKK2zOFB58Abt
         f1wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079288; x=1773684088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r26udjS1htgyNVho4B7xDT7S+9gsz+aLoULdjRjLynY=;
        b=R0sXvS3e/I5akTTuTeCu4/jJIptiWFofAK4uX7F8xV9Q0aix4obyy0OxIWao6C82Dp
         TVw5Vnv7o/aS/xY+tHuyyOtYK3vxD/wn0dV0UHAyKkuRBBll/mPH7objExp5OOyV+dtr
         S2aLBFUha5vpP7DLrIxrHwRQiudeH5DHy4qrQSqSocIVfqeahA+v1tjfUv2gy2DbGwoY
         s/l/1G7RFVPLpQ9cGuKurU830XU5NpNBgS8eaQ3nmN/vl6v2SmNk/zx4CiJse4MYO2a4
         ko0uk2ZmcdrPehXMhEboiNJ1IiaV7n+LsaEb+lRFSfoJ4zi5PjL1SOgRUXqveZnBZxw2
         J6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079288; x=1773684088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r26udjS1htgyNVho4B7xDT7S+9gsz+aLoULdjRjLynY=;
        b=UKjPLb596youdnuzLi5VBNcJvYjni8B7qLHnSZj6QF+tMpwoD5Lc/jxgfGVLxkfW4i
         rd8iDR+a7JIziJsOg59xK4KMX2hGz12sXckq+5CQu2/Owqjn/AsPukAIDXDKkjhUCb+n
         uTDZYsIvyfSWNI5VAA8f/aNcZKD7ruwMRHu/zGHgL7agYcf5e76zwUiDqNeKmbCiaDPw
         Ar3D696Sr0f6we6Ccui3RaN/a9mmEqTTABIqMI4NxqZx2q0HpSwZebsspzuxrpHsVAsb
         C5Vm0BAkJ6zDeEqDW4fws2v+lPfSVwEH7A/WgCXkjiAhArC/lrUi5/jRY9Vx/lZoBz5x
         5XqA==
X-Forwarded-Encrypted: i=1; AJvYcCWbgXq5FcmyLjszz1IZvVJdpiYjrLcCbUgvHjfywm5JGT/kvebb8wLGMbd63VERtbyL/FHXf+BBeZUWjnw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw02/YIBkBJU9Yf4jZL5kKeJN8wKoqBu9iPDjrTfRzH6hC8tIif
	3XtQTvUpOLpNexNcFwHxCbq6G1vkTbXOCjfilLxwQdyJWdiJiDgZdDtjFqDQ3QnoAwOj6ir7WzT
	XnUkmzJNzpOtOvqSVY37E8OhDDacE1Ststx6DmGYw
X-Gm-Gg: ATEYQzxYDHEI7dksPlXDlb1+n10kX+qI8VAbOdPuXJCcVJcPU0B1kUbBcXlpqNdNv2n
	C9HvdijgZsXG90hYNVZzPSq1T205W3CDdAQqKI3Tsd9d3ag7FAyInuFQSYlvEeIpDX8KJVuYte/
	FJpx13LCY+GRGUJbWSq3NukuKpC9UAV4BJGja5A3j2QnOzcyjyDOLZfLdt2YqnP6cVGiIyRM+JL
	HeVtaMCQvqVZDsKL2KoOwW4zVu03j/w5uNEha+TA064omegVv++l3ymhq26EaothxMkWbyz7Orz
	PxaDF/fkcRa1mRoQikkaFAVLnPR9Ut4TaEw=
X-Received: by 2002:a17:902:f546:b0:2ae:575f:3755 with SMTP id
 d9443c01a7336-2aea30d24bamr257805ad.20.1773079287603; Mon, 09 Mar 2026
 11:01:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-20-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-20-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 11:01:15 -0700
X-Gm-Features: AaiRm53zbBx4vwMw2frKtxn1Vd5dHWsmKAdma7wTK-CrU2Ft3XFe72ThDfNa_1s
Message-ID: <CAP-5=fWX54+J0Sbf4XYfcNeEgiKXE8t7T6FRKp1mOb2gm1Dg+w@mail.gmail.com>
Subject: Re: [PATCH v3 20/30] tools: power: acpi: Append extra cflags
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
X-Rspamd-Queue-Id: AA08423E519
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
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,google.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-11733-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,arm.com:email]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 9:49=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/power/acpi/Makefile.config | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/power/acpi/Makefile.config b/tools/power/acpi/Makefile=
.config
> index cd7106876a5f39dfda38e286c54c3a7c268b34a2..4978c06828af7b0f47e533735=
ad82c962b7e0765 100644
> --- a/tools/power/acpi/Makefile.config
> +++ b/tools/power/acpi/Makefile.config
> @@ -67,6 +67,7 @@ WARNINGS +=3D $(call cc-supports,-Wdeclaration-after-st=
atement)
>
>  KERNEL_INCLUDE :=3D $(OUTPUT)include
>  ACPICA_INCLUDE :=3D $(srctree)/../../../drivers/acpi/acpica
> +CFLAGS +=3D $(EXTRA_CFLAGS)
>  CFLAGS +=3D -D_LINUX -I$(KERNEL_INCLUDE) -I$(ACPICA_INCLUDE)
>  CFLAGS +=3D $(WARNINGS)

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

>  MKDIR =3D mkdir
>
> --
> 2.34.1
>

