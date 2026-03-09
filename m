Return-Path: <linux-kbuild+bounces-11722-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEYQIp4Gr2knLwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11722-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 18:42:54 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6B123DC80
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 18:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A5833019BAA
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 17:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951B32EF64F;
	Mon,  9 Mar 2026 17:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WEACXYe+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDC82F0C6A
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 17:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773078046; cv=pass; b=SkjzIuN66VfqfJkzEiy75FbWQF4cJeu4xl+ckHiRN65zXhS3KQB/xUemHySGuRj/uNdOnuNJdMprBgU3JBqOjEG0KEWSAZ5ipAiPKeAq/PC4gfO0314fUTmxfaeNOZFlDR1zcq7RqQ89cUEXNrXK4hJeckJpbp64xj8HLNmKORQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773078046; c=relaxed/simple;
	bh=n75q7FQkEfbF8c0uFYyEvlysohLp/IeXvVTwRBBtQUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zo37DraMaQdCAqP1i5tXXvRdhuBP/R9UmxAlnLsl5Xva6zsmfLG89HkWveyrMQTedkRvpyLbGrtmvNzVQw9UIRlFsYfz17Pm21KItO5ja98omKq+TD3M90i/U3q3n0R4rwMMRLCb5p/NRKgklaUhe93oa1I1dx5CAxxkpYRBHRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WEACXYe+; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ae523d54d2so10935ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 10:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773078045; cv=none;
        d=google.com; s=arc-20240605;
        b=HvX9SYtS6/+r4vIzp1Vv8Idr4+CpVnG0e1UcUcnsDd9oM5QXBrj3Qw4QIIKsDScZuk
         pxaiJJwLg/3Pdtw7GY2eF37K5yriPQky/7+i1EQH15C6J1IBbyXDhi5++s4XfMdisFh6
         yLZ2JXLrUHKdkQFRrKiTh0Gp5irLPxI1qB2vKrj4xqN1ShInonO8fvubQ/zmqIRXwV6L
         Svx62K5LrNT7F54veWOQEdHaqmBWMSJqOXngGTtu0nczqOkwXW/MbpEb/iQwsHXOicUe
         B9aEBR2+jGZqPelVScyD2duG8NoMp5DS/zM4or8Acse4wZtl0vu80NZZKs9HP5Q1LEPP
         8ZNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=43itZXu9qIpHkrE/yaiQXvWJBibTFZU4J0qcAKp3nP4=;
        fh=rdf+Vvt7CD5GyVUxWUGlEeyJKuvMDTi4WiHcDu5XVYc=;
        b=LonUBeAHMnZJojqGtwljh7Xv8QVPGp7HYQ5cIx0hlOLoCgYP65JUeyUN02MoCqWEM8
         3zYHk0NMZsZNEC+nagYaiiDCQ/2jqkq7bgJqqi4US7IkOSQD+mIuoI8Ok2zlDew32tN1
         GhP8SRkuMUFaO6+K7BDDq2ZtFRZSDhgFKosyrjyKqwA41VcyQN0hoPvwuwJr3QQCRf0O
         sndlPOR66V0Dtwpyv4WMLRCqfoHsRMXTGgrWvw830JjtbkA1O8wR747kvCTlyIAU0eTd
         9irR/kQie5KOrLuh5cbQDKYJjR0VS7YWpi3MBwBnIo6dwKbcvW9PfY76uaG+8bWd4F3o
         6Tqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773078045; x=1773682845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43itZXu9qIpHkrE/yaiQXvWJBibTFZU4J0qcAKp3nP4=;
        b=WEACXYe+eMpVtuFwRLhSOaPUXruLfrYT+MLPY6DbfOUhoBpt//781IKfJPlmnYRaSZ
         3GbOzqzuFCsKlea16k8R47DpwV+dvIo1vZVbAJ6NYT+O+vtS/ujQ7t/qNSdXgr0iEoJI
         PLU/2NsC1pV0WOKgXlK/wa3qkUj7SFdea5+y6eExFW/6ZdY5VcZM+7KJvV6JNlRl1UJg
         xi78y9fRjOhsbqCNnHnqcIKTKW2IXjFgT+D8d43J095FA5v35zG2AEjn2vAFGGxHPjNB
         bDHr7levlCEUEwSejp79x+FxPYwU9Bkd7sKw0QE+F7h/K6ZLuaEYWzmA9ywQxqn44E2g
         jeig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773078045; x=1773682845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=43itZXu9qIpHkrE/yaiQXvWJBibTFZU4J0qcAKp3nP4=;
        b=f9TCUnZSVzxDJyT0rEJoZbPULnJrHD0cG15+yVZu3WNomLGzo91gtwwvCFTMCXvIaI
         XRroKTXBp0l+VHwFCJa68/3dhV9ie4XiKK0r2Pd4PSlPs3O0YKBsg9UAQwd1vgpSAWDm
         WAliHquWQmPNlZTnGUixfrCWtAX4CJPthvMJMFKI5tsvkxLuy01E75rz2smr3TTQ7C5u
         ewZ6HEs9zKFLf/WfStxXxqTaAqvb7JY8pWRybRRq6rZypRTpH+b6b/S+WzXkkuduDrbT
         Muv0vDPK9VfW6dd0YZ5uY5uB2rbOFvIhLSchlkqlyQupbb5Z+qx/GXDmWi/KxRs31jyy
         r1zA==
X-Forwarded-Encrypted: i=1; AJvYcCUkv7sfLkOVlIKq2OsYGVVIk22+bw0hOqvzkIzENkzTbLghS8/d4cOT1vc86kxzZDnvmC0lcaRaeWo63Cc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ2Mu4I2ZEv5nXOSuzHEJa8wjM7neZyi0oitB4ovHw0fUmBrii
	nz7xX7RK+/Hj5D6QqvFllvobw6/uyuPZIrIOp4Flquh1ntqvyaosXVuRRavfyikmmwOa4i6DdqY
	7O/89196s/qrcFgOmpg1B6vY+3phOICHSX3WuRpcW
X-Gm-Gg: ATEYQzyeqa+BHpbrD6Pt4VRdPkcFi9tlHeKxIYkwQVcunPqb10WW3f02df0gS4Yxn32
	HnuGd15UYs1GSdILCbfkQocQrZpEIDxV5+sEHo9zL6FHcGpvjbmCjRddGfagjDTFFBrMpd1ASGE
	6t5wziYdNeR1C69ADOoOn3TjityKBEe4Umv8oGWd3Z93OOxjtWyZeALEwZaoHGrCSbnGu2mmrbI
	adrxRDGYJ0+ZIWXEXw425r/lBPJX4fyNvTLg/IxZVNqyzsC55T4o/F2hDFlbiljgnzQarcj6TYl
	QnivfI3zCFWYHdwVO/Gg8HKymigSEKXcW9s=
X-Received: by 2002:a17:902:e5c8:b0:2ae:5a44:ea91 with SMTP id
 d9443c01a7336-2aea30d03bfmr173965ad.22.1773078044165; Mon, 09 Mar 2026
 10:40:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-1-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-1-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:40:33 -0700
X-Gm-Features: AaiRm50xMh2x6blfn_3hS50syuGxpKu5Drg312ff5ApM7P2oqhep_6Y9V5rZ_XU
Message-ID: <CAP-5=fUaowg5c5GRVrTATCbkFrRa8WUyp3_h3O_6t2Vy4rBsmQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/30] bpftool: Avoid adding EXTRA_CFLAGS to HOST_CFLAGS
To: Leo Yan <leo.yan@arm.com>, Quentin Monnet <qmo@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
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
X-Rspamd-Queue-Id: EA6B123DC80
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
	TAGGED_FROM(0.00)[bounces-11722-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,arm.com:email]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 9:46=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Prepare for future changes where EXTRA_CFLAGS may include flags not
> applicable to the host compiler.
>
> Move the HOST_CFLAGS assignment before appending EXTRA_CFLAGS to
> CFLAGS so that HOST_CFLAGS does not inherit flags from EXTRA_CFLAGS.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/bpf/bpftool/Makefile | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/tools/bpf/bpftool/Makefile b/tools/bpf/bpftool/Makefile
> index 519ea5cb8ab1c0ee31acc67fc5f96b40e21005c2..3e7d8359e1b2a81a29a47544b=
e8539e3b191a0e8 100644
> --- a/tools/bpf/bpftool/Makefile
> +++ b/tools/bpf/bpftool/Makefile
> @@ -81,6 +81,12 @@ CFLAGS +=3D -DPACKAGE=3D'"bpftool"' -D__EXPORTED_HEADE=
RS__ \
>  ifneq ($(BPFTOOL_VERSION),)
>  CFLAGS +=3D -DBPFTOOL_VERSION=3D'"$(BPFTOOL_VERSION)"'
>  endif
> +
> +# This must be done before appending EXTRA_CFLAGS to CFLAGS to avoid
> +# including flags that are not applicable to the host compiler.
> +HOST_CFLAGS :=3D $(subst -I$(LIBBPF_INCLUDE),-I$(LIBBPF_BOOTSTRAP_INCLUD=
E),\
> +               $(subst $(CLANG_CROSS_FLAGS),,$(CFLAGS)))
> +
>  ifneq ($(EXTRA_CFLAGS),)
>  CFLAGS +=3D $(EXTRA_CFLAGS)
>  endif
> @@ -88,8 +94,6 @@ ifneq ($(EXTRA_LDFLAGS),)
>  LDFLAGS +=3D $(EXTRA_LDFLAGS)
>  endif
>
> -HOST_CFLAGS :=3D $(subst -I$(LIBBPF_INCLUDE),-I$(LIBBPF_BOOTSTRAP_INCLUD=
E),\
> -               $(subst $(CLANG_CROSS_FLAGS),,$(CFLAGS)))
>  HOST_LDFLAGS :=3D $(LDFLAGS)

This isn't an issue with the patch but AI code review is noting that
"LDFLAGS +=3D $(EXTRA_LDFLAGS)" happens above, and then here,
"HOST_LDFLAGS :=3D $(LDFLAGS)". This means something like
EXTRA_LDFLAGS=3D"--sysroot=3D/my/target" in the build would cause the host
ld to pick up the --sysroot flag and probably break host builds which
likely use the host `bpftool` when cross-compiling (perf's build
should use the host `bpftool`). If the HOST_LDFLAGS were set to
LDFLAGS before EXTRA_LDFLAGS are appended, this would not be an issue.

Thanks,
Ian

>  INSTALL ?=3D install
>
> --
> 2.34.1
>

