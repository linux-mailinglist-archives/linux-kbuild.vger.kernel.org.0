Return-Path: <linux-kbuild+bounces-11854-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE3nK6UtsWkVrwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11854-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 09:53:57 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A4B25FC90
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 09:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00FFE305D289
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 08:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB3273B0AED;
	Wed, 11 Mar 2026 08:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cam0qJym"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614CA3C277F;
	Wed, 11 Mar 2026 08:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773219197; cv=none; b=lKLmeE1lgfRJ1s/GDEW5rXTTuAg1xlkFda3ZH3wi8rQTX58KGP5Xy0xO7lou/reazhwcXvBIGPG4CZMcCfJ16oRIXKvaUMJ8ea1yLM8So7efIL9cFhDY4j695hPsaidY0iskTXO7NfcI82yKwykmaOsy7Z7nDW2tnUCatmM11sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773219197; c=relaxed/simple;
	bh=DqlVkOlYn8pfZAn0cq0AqD0Q9qaXXyY9rowCXOVIz48=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JIs+bLpDZOneZwZruuADjGvDXX2MGVZosws1B5DhkzRjDL2mhYgMyH41lPzUnOUfiVxogEi4HYnzLhO9/9gdyLZJnwLPzB4XsQxvCXjkgMWzBtQWijPY/IbJMhAejNNZceFGozutLBVCq1Z19XEWxuBgPUXjgpGL+kbKsAF65lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cam0qJym; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC540C4CEF7;
	Wed, 11 Mar 2026 08:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773219196;
	bh=DqlVkOlYn8pfZAn0cq0AqD0Q9qaXXyY9rowCXOVIz48=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cam0qJym1i7ypx+isv/OUqdZ3RvtvUmpc7Ksk5QM33ngpfDdCjZz8Z0JJcH/kyl+d
	 TZyvr/bBaJXayndwR0fwL5mikXUZVNQCZyUmZhZO//kql9UUIC6R5NUcZIYzLKICL1
	 +6qkvuYXl94wg1uY1MhipBJB/MTOHz8kCKswAOP/Hpim5CKnQIzjc5SkISkhddpQW+
	 Re48FEbBwFV+/YhkKIo+QAAlIErZX0DFsf1MDqahOwSoob33BJAhbwki+QE/c9xm/m
	 J11ktCNnKUajUycREwh8hPiTmomBbYfQfIZR8osXDOsXH+o8woZv4nylBOZCi+n4wr
	 aEPtOsdywW5yg==
Date: Wed, 11 Mar 2026 08:52:52 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>, James
 Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>, Quentin Monnet
 <qmo@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
 <nsc@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
 <lukasz.luba@arm.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
 <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Adrian Hunter
 <adrian.hunter@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>, William
 Breathitt Gray <wbg@kernel.org>, Barry Song <baohua@kernel.org>, Qinxin Xia
 <xiaqinxin@huawei.com>, Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson
 <warthog618@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang
 Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui
 <decui@microsoft.com>, Long Li <longli@microsoft.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Willy Tarreau <w@1wt.eu>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>, Josh Poimboeuf <jpoimboe@kernel.org>, Robert Moore
 <robert.moore@intel.com>, Len Brown <lenb@kernel.org>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Tejun Heo <tj@kernel.org>, David
 Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, Changwoo Min
 <changwoo@igalia.com>, Mark Brown <broonie@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan
 <shuah@kernel.org>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <bentiss@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, bpf@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4 00/30] tools build: Append
 -fzero-init-padding-bits=all option
Message-ID: <20260311085252.04cd3da0@jic23-huawei>
In-Reply-To: <6707888c-a31a-4d38-a99a-86ae42351561@oss.qualcomm.com>
References: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com>
	<6707888c-a31a-4d38-a99a-86ae42351561@oss.qualcomm.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 37A4B25FC90
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11854-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev,oss.qualcomm.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[71];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Wed, 11 Mar 2026 09:44:16 +0100
Daniel Lezcano <daniel.lezcano@oss.qualcomm.com> wrote:

> Hi Leo,
>=20
> On 3/11/26 09:29, Leo Yan wrote:
> > Thank you for reviewing v3 and I appreciate much Ian's suggestions, most
> > of which have been adopted into this series.
> >=20
> > For anyone new to the series, the reason for appending this compiler
> > option is described in v3 (see "Link to v3" below).
> >=20
> > In this version, the changes are organized into three parts:
> >=20
> >    Patches 01 =E2=80=93 07: Preparation before adding the new compiler =
option.
> >                     Fix typos, adjust Makefiles to ensure the newly
> >                     introduced option does not cause regressions.
> >    Patch 08:        Propagate -fzero-init-padding-bits=3Dall to
> >                     EXTRA_CFLAGS and HOST_EXTRACFLAGS for the
> >                     CC and HOSTCC compilers, respectively.
> >    Patches 09 =E2=80=93 30: Apply EXTRA_CFLAGS and HOST_EXTRACFLAGS in
> >                     project Makefiles.
> >  =20
> Through which tree do you expect these patch to be picked up ? Each=20
> maintainer picks the patches related to their subsystem ?

If that's the case it would be helpful to +CC the relevant
subsystem lists on the patches that you expect to go that path.

Jonathan

