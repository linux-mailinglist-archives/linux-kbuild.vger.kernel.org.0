Return-Path: <linux-kbuild+bounces-11957-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LRLLIgSuGk7YwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11957-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 15:24:08 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B46B029B460
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 15:24:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 186A0301DD2A
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 14:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1CB26ED3E;
	Mon, 16 Mar 2026 14:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUc/i+b4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DA91E0DE8
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 14:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773670643; cv=pass; b=sW/llxvgzXEuX2gYd1BmzVGlMvjXgXJrEStChEdYwFuStIYf+9jx0Kh1m6BDDBJFL0p4dbJmcWX9RFr1hvTEd7ILsne4Bu3jZEo3DKKAQbrUj4X2aQOxakfRMQsRUP2FBDYPcN0qs8u7aXJKOgAhDHcEfT2qU+KK/F0QkJekPps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773670643; c=relaxed/simple;
	bh=5ExJGKQqqkgOKiYAl01vajNqrVmhutAhhk5RAfQPwdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NKH/x/qimF3Qo/lLg4WSGi6R+YrvkfopI1r60aCUvhyGBoCbDLqERRcCA5XNWnf8e+23D9wpfSyPjui1y8UGjFqQloivTWBaDE3cL6X8IZPti3vetT/W9c8+9s5kd7ykWCspF3Y8aaE89nNvd/uASruB+dJZ8/tPJnZ+qaEukeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUc/i+b4; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so4061888f8f.1
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 07:17:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773670640; cv=none;
        d=google.com; s=arc-20240605;
        b=lTS1uQPeU0HiHCi4lGnYgeVz0lu4UTsTt7LErLbWYJ5mfRnAS+G+JlxJkUXEqp9zOR
         r1SugLdGtxYXHf8mAVBCjxiukK3PUT+vw31C0CcDVg1zjd/JDQq4nXb3zDX/ZMmK3KMv
         3qcs/OLjnwxtAG0hn7YQDp4/jIK0zBao/YRz/uuEhH2j+Eg9j5GCbJDWlrmZx2lE4frC
         in+PudomfhPHAacC3tDBTRxathayx+NpoYlWWqdhiNgA0HnX5NrjhjsBU27vmmKPo0iv
         gwtVGEXVYXPDM1aKlWdCp4YCC1gyFCaI2TuK5ZWriMzuAJw9Zh3fh4HPxCE+hcEoV51r
         mWZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lmBn1aXsKzUNTVIGoWkY2AXVOYef5Jy5uJj2KWu6G54=;
        fh=8aAEnf1tCEhdXowqPeppqSglALfKWTYZJ8ov1W8+e8Y=;
        b=HerBs+SwhWa++YZXWYacEotIPxV8MLhGtE0sVNL/+gsf4Oaz4+aoKVBDYXtCKivC1R
         KUJ3G+pIWtrUuFt70kyC7FOlDLNs23qHT1hqL2gWu7R8zvLejDKK+fLSfSNLnOgVFIzb
         E6pBSXZS4SCa4Y+rNUsv6AChvG62MaOpoK4AfZJnNxDPUScW9sfJe4lHvkzb0BbI57NC
         WnL2Lm9J4ZYxilj5b4LROOydca5hUyU1Dv4AZD2P/MVGXfNlekB9prXxrnM8JWLnaO24
         kr97brUnsxg2UxI7B1AlOQgoN9KiXnva47W5MP1NpHLgGG2vw9KAIYMDljI391ZlL9kI
         bZAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773670640; x=1774275440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmBn1aXsKzUNTVIGoWkY2AXVOYef5Jy5uJj2KWu6G54=;
        b=MUc/i+b4a82D4pWwB1wRLJI9NT/+CBuN+DxuLbm8D2Nob5nPTApzb3pf61dWc29JAW
         clnvek8WcoUN7z2tvHsy6Wwb/dlApRwjGbn8b+FsXL+PUqpJ176ibsodV+7pDysEShQF
         WBLTfNfZ93H3Lhzexb2Q58oC7eBKJ4JvYAvtgRbifdqwDPzcXddYBZ/0yQJELwGMVCTS
         ZVBnmOER8xL3lMlqkWBypwyFbeaZXqjX27qoOxIWs8YluIc9f1yByJ+izVCIcItO9tCD
         FBuKeqv83UWA5Qd9Bl1bpodbdZh2MSuQ38vqIqFJR0H0Mvuj0OgA+tV/wcuFUhQvn8+Q
         2Jng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773670640; x=1774275440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lmBn1aXsKzUNTVIGoWkY2AXVOYef5Jy5uJj2KWu6G54=;
        b=tEsdoCLYb+lnJIWRPHhtqa/Lpdot5r2E7x3mjL36XCod2Wyji1DLEH0B7MX/vABMsf
         q38D+o/FmLZba0lDmV/oSQivFENXr7oV6IWvxD+09fL7ScYJLxLIqJXZCusUCU+FugPy
         lLeRkfz8Tt5jAox7xI4R+DKwoNBFHEQcjpW3p6h3ER6ZDcB/PTEE7Aq3NnMLjkhhI9AC
         AXYvvyaIPP3bhJaTlKi+tEzPPa90Ou6HmdWolvJnP8h+UOhgF+JF5oHSK3HTcsmS36rd
         AVmxzFI9dMpSBoew48fqeMPcswkUX6BKpQhmKGuAdXNiv5pN3Rdv1zMuu10GDliN9Lv+
         8pkw==
X-Forwarded-Encrypted: i=1; AJvYcCU9F62hGxih6LZru2am7tgk5V79bJsdpqYkXHzUb+KijIQ1u5NmC3qCDmWuj5Sw0D0NOkNJiwSYkawVkyM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx46HCbgRuasIPA8ZwTKLzGW/A9veVSWjOWqitj0jnJGr0xgRqO
	jQ9wv3lP78g+ZXncvxTXk03Snl/7zJGE/SI1IXVgWZxWQGzVyLcm9ifg7/ZK03Jrj9Pg1Si6t95
	GKxkkpqzhHcgkL3AREAj2TCyeO4jRkBM=
X-Gm-Gg: ATEYQzw9z6WQsZlhW3dD82XVsUp7kbztz7gOcVzc+QaxHe4ELqv0Uowm6bYcAPbbDqZ
	wMhROQ0vm3QszVytwcAW3Y9nn6Rn6xOoqLEGVSyZVTVX/b9pGP/HrCms34BqKjeLmAhaThhDevx
	TDNrOncMeP7mlxzHyorZt4KYBDVro5tbllnLvAYX+zNPG/ZMyzETee/lKB21m3GSgz/3X517C72
	rg7rxtp0zcEKfeH6RJI07H3p3EIC6F+BBGraLf2t4y2H+WbDQVzfYK8iFr0oM7a3K+KbiohPxl2
	y6qxFTK8X3GRkjn8KvSx8xhQbUZHLryxvv65CU/WxgT8MSrwzkeLKyyM/07t8bMphMDivovpB+S
	bCw==
X-Received: by 2002:a05:6000:3109:b0:439:c560:bb78 with SMTP id
 ffacd0b85a97d-439fe1a069dmr30731666f8f.22.1773670639789; Mon, 16 Mar 2026
 07:17:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com>
 <20260311-tools_build_fix_zero_init-v4-7-9e35bdb99cb3@arm.com> <20260316101800.GB8048@e132581.arm.com>
In-Reply-To: <20260316101800.GB8048@e132581.arm.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 16 Mar 2026 07:17:08 -0700
X-Gm-Features: AaiRm52U4nGYmhrhg5_rJVsmWgv2fI-zySEYrY3v3DyOI4rw9kmBbiG37OT5JGw
Message-ID: <CAADnVQLN6bYHnusnC5QnDoGGUO-A=qnM6fP9bhEVXEHD6_y9EQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/30] libbpf: Initialize CFLAGS before including Makefile.include
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	Namhyung Kim <namhyung@kernel.org>, James Clark <james.clark@linaro.org>, 
	Kees Cook <kees@kernel.org>, Quentin Monnet <qmo@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
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
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, bpf <bpf@vger.kernel.org>, 
	"linux-perf-use." <linux-perf-users@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11957-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[70];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexeistarovoitov@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,arm.com:email]
X-Rspamd-Queue-Id: B46B029B460
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 3:18=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Hi BPF maintainers,
>
> On Wed, Mar 11, 2026 at 08:29:32AM +0000, Leo Yan wrote:
> > tools/scripts/Makefile.include may expand EXTRA_CFLAGS in a future
> > change.  This could alter the initialization of CFLAGS, as the default
> > options "-g -O2" would never be set once EXTRA_CFLAGS is expanded.
> >
> > Prepare for this by moving the CFLAGS initialization before including
> > tools/scripts/Makefile.include, so it is not affected by the extended
> > EXTRA_CFLAGS.
> >
> > Append EXTRA_CFLAGS to CFLAGS only after including Makefile.include and
> > place it last so that the extra flags propagate properly and can
> > override the default options.
> >
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
>
> Before sending a new version, I'd check if you have a chance to review
> the libbpf patches.  The libbpf change is crucial for this series.
>
> Another reason for pinging because I received a bpf-ci report about test
> failures for this series [1].  The failures looks to be unrelated, as
> the tests fail starting from the first patch, which is irrelevant to BPF
> code [2].  I tried reaching kernel-ci@meta.com last week but haven't
> received a response yet.
>
> If bpf-ci testing is mandatory for libbpf patches, could you advise me
> on the correct workflow (e.g., whether the patches should be based on a
> specific branch)?

yes. It is mandatory and libbpf patches must go through bpf-next tree,
so pls send them separately.

