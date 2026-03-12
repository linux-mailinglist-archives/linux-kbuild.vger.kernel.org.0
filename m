Return-Path: <linux-kbuild+bounces-11894-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBLCNAb3smmLRAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11894-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 18:25:26 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDC02768AC
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 18:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BE6C302D966
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 17:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923583F7A89;
	Thu, 12 Mar 2026 17:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y0t1e8bK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E963D9DC3
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Mar 2026 17:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336302; cv=pass; b=piJHkuKcG7QQjg/2EwDIkEnjOvm5JnUabsVP/VhEIvA4m6FgA7cV0YYm7me8zsnOlmgppsiSgsV103A+4tzKIID2V6Hk6P3YMe/Pm/w7cZj1ogx3Ip+yHxKMoYHf5E33+EnvV5nIS/KaILzkg5ULr5W+5OvVJ8Jd3zbDpzKPalo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336302; c=relaxed/simple;
	bh=EUnbf8s9gG6GzSdAsBxHv68nHvfQl+MlAZdHKrNHid0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uhf5xjusaDcrUJnZ1Y/Lu8hHUZDiHDg0fm1QI5wTEajTBRYLj3AJfiChR4x2/N63XJQ7nEPwDjAi4N/b0zPTWbJqJg9/LWXGD5c5Bm0O2QFdYKHUPvBB9LNmRWWaj6F9Sb7Q9vb2PmZr2pVieze/YNjQ90fR/QTj5nFvN63nmio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y0t1e8bK; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ae49120e97so7065ad.0
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Mar 2026 10:25:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773336300; cv=none;
        d=google.com; s=arc-20240605;
        b=GHeE8mag8E0EF/sNvR+jcNfOkhcELRcX6muNkTOG6B87/jmTuRNNwlkNTiNhRNaxiS
         wIyQGTQqdS6A4UAVJzD2tfXDwET6/Q4nTeRq7wOzgAiWdbbkZp1rUxYbcf6+q+322mhS
         MVXmmBmSETQK4Orgz7kfYRYr/TicJLOdSSEQc7hi5WAZmI2fg4PIJd2Qv+Dm7oAOAVCD
         XywlmRvPS4ctOd0I2NFujp+nupsB2ZhcaKMhfNqL37OXU3dVE8HFuqGvrWyGJwhQMGUh
         LlNesq19jEwX6BiCeyPTccz4HJ/MA67pmKttZTP8r3bn5M/o99OJfJ4OLuGsUx+86E27
         ESCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wt8HMORomTHlz2fasa3fWuq19mlRWO2w6YTeCuKKCWs=;
        fh=n1LVoWmwUvL/2RYuy350KezlLh40op21UJN6ELpkr30=;
        b=iu01Y5ghm9ayb27aEFLpc+RO/l3qxBobXC0NWHqtOA/9KYsixg6CIzTG8LVbvyf0rE
         2tPH1+TFv+vVHOX4K2eqYKe0zwEGPXlZvWbqjaP0KqzTy9WvS8ZcU9fqZUJyw19ZvRG/
         v2Hrwwv4LVcPG8zjKLZU1kml6xLCcoYtuaUDdaSf/SvHtsKNDO+MlrmBmY4MDe/oPRNh
         zl8Pjbo8NLGIjX6BiENq+SGs3y7C8M9ztvzQi/v6sqpD66/G1SNoCZE3B/zoCcOmIOyF
         26BijPNDl4vaI0ymuDCmThmbrn0hGlZjlHJCWqQdMv0XmLhkd6RrJ+w1uf/j1PQRSk5i
         wrzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773336300; x=1773941100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wt8HMORomTHlz2fasa3fWuq19mlRWO2w6YTeCuKKCWs=;
        b=y0t1e8bKg+C32XSsB0LPpxxI2XQPaVXkNMGT9vmZ8cCTsFjsZdfKdKO4bixYDf2rj8
         qBv12tvIG0/Ym3+euTqjBwgZWIpC19okpg+fFv47jy8EAEX1FR8rH/n8G0uERBnYXIi+
         5S0YjwqIWpoKrifv1HSqYpa1PMjW14YLb6ujJWc/F6aFbtxl/mgDeZB0qs1ndhkRoXPO
         06dJrzgDPaNlxeE5p6U5Ti349ZNmTvBTtA09tk07LsFGXzIu69+TUkZadlf1Dd2SzTr5
         2QCxN+nPF6GtvWwApMY/t7XX4/WSFJXMM6tYLIeI+eOND3vc/d7NEO9fT+zPPu5Ygfob
         JgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773336300; x=1773941100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wt8HMORomTHlz2fasa3fWuq19mlRWO2w6YTeCuKKCWs=;
        b=vEQUOqQksYficD5CiDr/QkJiB10c9J/TuE3op7f2VjLqk3k9TtmGhh5vzv5zcgbk8a
         o3ufWqaVm+Kz4EaVH6FhyAO6WyKh6jNciq2EYcjd72XSA4jHEjpj071tcKg+rwmAQs0g
         kaQIbwvlC6iSttwFcn8psY9F8rFYBSdUmsC3LJK36vadpFoogXMidmxqxcDT1d5IL4mW
         6+8IT94STf8hEHrz5TaDDp+kP92meLDawQwu0mlw0BetD5lzEPctr7Y7wr7QyQv2rYhf
         dKxWjtTdwQ1+mA/u96YYcxEcv0Ose2wH30lAqm3BLCtpw/xIH8kJlTZv4jmbDLCmg/MQ
         +3Og==
X-Forwarded-Encrypted: i=1; AJvYcCWv5TfPe5niH2/cYU41EmKS7g5wp2vBEeEHIIkdjUilMAUAnVg9AZ2+N7RU4MZ96c3x45P3weVHZFNfM64=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBZS9rqs4qPaJn5raZsq0YzzZTubhyNG5k40ObkDT0evnv4HmA
	gNlQUd/NDuWf8P/VBska6FTd1jgnvWa0S66/J6JSatRvsxvf+oU/CmatV7PpfdXfbV+lTtGud3u
	lW4QEEQhFbnogvJJiSUn4EK5JYkYiD0apGOFCuyyl
X-Gm-Gg: ATEYQzyd6GSsDteGBkcyN2vtu+8ljbosZLCC5r2uJWddTpo9QOcV3kV7eDMPud7S8oD
	/uUDGUUuQ7cz5vHqPXfI0jWMoTbTy6zcRVTJJd5YO0nVPbXWOORjhWRS0DfjTphYLD1dxk9hwMm
	WJ37KjF9kMmUB8Ag5BvKIMb/jVPJu2MZj0CYlMnq5LcfXAm3nlF5dCP7ThlGASuFrSs2dqLLCSF
	F61VVofFtzX09D4iCKdAkIBUYdCt8PmGoQBhjeuJ+vjswG1mjoXpzuAdYAOFvMNGn9qXEC50h65
	7xi/oDxfhXALGu/CIAkMW5pY9hRDa+ipt4fh
X-Received: by 2002:a17:903:94d:b0:2ae:ca87:b1c2 with SMTP id
 d9443c01a7336-2aecb4968d3mr115665ad.8.1773336299917; Thu, 12 Mar 2026
 10:24:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com> <20260311-tools_build_fix_zero_init-v4-27-9e35bdb99cb3@arm.com>
In-Reply-To: <20260311-tools_build_fix_zero_init-v4-27-9e35bdb99cb3@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 12 Mar 2026 10:24:48 -0700
X-Gm-Features: AaiRm52hQTw51elOXRvyPkEpjj1HAq438fXBgq5QDvtll0HOsb4gHaSDYi-74S0
Message-ID: <CAP-5=fXjd15e5YpCM9KMjEhpjLxvxc6qUk0g7BprCfkzcRZ5_g@mail.gmail.com>
Subject: Re: [PATCH v4 27/30] selftests/bpf: Append extra cflags
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,google.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-11894-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:email,mail.gmail.com:mid,liburandom_read.map:url]
X-Rspamd-Queue-Id: 4DDC02768AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 1:33=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> urandom_read is built with clang.  Introduce URANDOM_READ_CFLAGS to copy
> the compiler flags without appending EXTRA_CFLAGS, which may contain
> incompatible options with clang.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/testing/selftests/bpf/Makefile | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftes=
ts/bpf/Makefile
> index 72a9ba41f95ebb825d25799c07ba3f0311243e45..27112f08c9a5b6cabc4190220=
7d00897070b41b4 100644
> --- a/tools/testing/selftests/bpf/Makefile
> +++ b/tools/testing/selftests/bpf/Makefile
> @@ -71,6 +71,12 @@ ifneq ($(LLVM),)
>  CFLAGS +=3D -Wno-unused-command-line-argument
>  endif
>
> +# urandom_read is built with clang. Copy $(CFLAGS) before EXTRA_CFLAGS a=
re
> +# appended so that it does not inherit potentially incompatible options.
> +URANDOM_READ_CFLAGS :=3D $(CFLAGS)

Later in the Makefile, include ../lib.mk is executed and it appends
CFLAGS like -D_GNU_SOURCE=3D which will be missing from
URANDOM_READ_CFLAGS here. Perhaps move these assignments below the
include?

Thanks,
Ian

> +
> +CFLAGS +=3D $(EXTRA_CFLAGS)
> +
>  # Check whether bpf cpu=3Dv4 is supported or not by clang
>  ifneq ($(shell $(CLANG) --target=3Dbpf -mcpu=3Dhelp 2>&1 | grep 'v4'),)
>  CLANG_CPUV4 :=3D 1
> @@ -255,7 +261,7 @@ endif
>  $(OUTPUT)/liburandom_read.so: urandom_read_lib1.c urandom_read_lib2.c li=
burandom_read.map
>         $(call msg,LIB,,$@)
>         $(Q)$(CLANG) $(CLANG_TARGET_ARCH) \
> -                    $(filter-out -static,$(CFLAGS) $(LDFLAGS)) \
> +                    $(filter-out -static,$(URANDOM_READ_CFLAGS) $(LDFLAG=
S)) \
>                      $(filter %.c,$^) $(filter-out -static,$(LDLIBS)) \
>                      -Wno-unused-command-line-argument \
>                      -fuse-ld=3D$(LLD) -Wl,-znoseparate-code -Wl,--build-=
id=3Dsha1 \
> @@ -265,7 +271,7 @@ $(OUTPUT)/liburandom_read.so: urandom_read_lib1.c ura=
ndom_read_lib2.c liburandom
>  $(OUTPUT)/urandom_read: urandom_read.c urandom_read_aux.c $(OUTPUT)/libu=
random_read.so
>         $(call msg,BINARY,,$@)
>         $(Q)$(CLANG) $(CLANG_TARGET_ARCH) \
> -                    $(filter-out -static,$(CFLAGS) $(LDFLAGS)) $(filter =
%.c,$^) \
> +                    $(filter-out -static,$(URANDOM_READ_CFLAGS) $(LDFLAG=
S)) $(filter %.c,$^) \
>                      -Wno-unused-command-line-argument \
>                      -lurandom_read $(filter-out -static,$(LDLIBS)) -L$(O=
UTPUT) \
>                      -fuse-ld=3D$(LLD) -Wl,-znoseparate-code -Wl,--build-=
id=3Dsha1 \
>
> --
> 2.34.1
>

