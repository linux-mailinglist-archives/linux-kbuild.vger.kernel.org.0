Return-Path: <linux-kbuild+bounces-11867-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGcKNJO2sWl0EwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11867-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 19:38:11 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 484F8268B4E
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 19:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5016B305308C
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 18:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224333E9283;
	Wed, 11 Mar 2026 18:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GhnCZXJ9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3C83E8697;
	Wed, 11 Mar 2026 18:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254141; cv=none; b=iaS/6Teklzj54Mq4rzgtW5n9E2moV39qGjhu42f9rmO7ACvBu4WENe9g0fWkoVtnfX41sbIdpGKJOZEDeKMLPaUUvZqFtE7l/e2lMJE5i3GpXOvo+aVGDfmeBJMzfPimp1NFj3Dp8taXAA4yeYQVV+t2pS+UlmyIV8gV3FAeo+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254141; c=relaxed/simple;
	bh=DgzCWHJKxqtjF96eYkgGcMy0Ioxq9OYcTcaD7WIFAVU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=qlk6Kj3UIJBda2qaFuLMLeCsREbr5m42pFJ/zpMQ3H/mZEif2LF/QdWC8lJOyx5aoYXoG1eCDphbwnW7nzWUCuwxV8vcJkL7MPz6bejJ9WnKwNoddpDZnlMWhK5nioPsnJUL+P17ND215eItRBtv9OK1O4+r32DqN3kdgX9/6sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GhnCZXJ9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E94BC4CEF7;
	Wed, 11 Mar 2026 18:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1773254140;
	bh=DgzCWHJKxqtjF96eYkgGcMy0Ioxq9OYcTcaD7WIFAVU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GhnCZXJ90lHTrDYcy37+IsvoSyuq/6riqhkWb1dGj/Lz8K9onjcc+8I+ci6TuElp1
	 JNgV09du8fMfR3Iz1Jdygn1+xko9CzWgdyTxWOXuqyiNKYkwa6H8nDaz/ybArqhU1R
	 nptmd6Ho3s2oj6A/a7T7QoqXW9G27hNsMfKCcvSs=
Date: Wed, 11 Mar 2026 11:35:37 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Daniel Lezcano
 <daniel.lezcano@oss.qualcomm.com>, Arnaldo Carvalho de Melo
 <acme@kernel.org>, Ian Rogers <irogers@google.com>, Namhyung Kim
 <namhyung@kernel.org>, James Clark <james.clark@linaro.org>, Kees Cook
 <kees@kernel.org>, Quentin Monnet <qmo@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui
 <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Mark Rutland
 <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Adrian Hunter
 <adrian.hunter@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>, William
 Breathitt Gray <wbg@kernel.org>, Barry Song <baohua@kernel.org>, Qinxin Xia
 <xiaqinxin@huawei.com>, Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson
 <warthog618@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang
 Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui
 <decui@microsoft.com>, Long Li <longli@microsoft.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Willy Tarreau <w@1wt.eu>, Thomas
 =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Robert Moore <robert.moore@intel.com>, Len Brown
 <lenb@kernel.org>, Srinivas Pandruvada
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
Message-Id: <20260311113537.70c4bacd2021c8d29c7dcf68@linux-foundation.org>
In-Reply-To: <20260311092331.GG4153946@e132581.arm.com>
References: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com>
	<6707888c-a31a-4d38-a99a-86ae42351561@oss.qualcomm.com>
	<20260311085252.04cd3da0@jic23-huawei>
	<20260311092331.GG4153946@e132581.arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-11867-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[71];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 484F8268B4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 11 Mar 2026 09:23:31 +0000 Leo Yan <leo.yan@arm.com> wrote:

> On Wed, Mar 11, 2026 at 08:52:52AM +0000, Jonathan Cameron wrote:
> > On Wed, 11 Mar 2026 09:44:16 +0100
> > Daniel Lezcano <daniel.lezcano@oss.qualcomm.com> wrote:
> > 
> > > Hi Leo,
> > > 
> > > On 3/11/26 09:29, Leo Yan wrote:
> > > > Thank you for reviewing v3 and I appreciate much Ian's suggestions, most
> > > > of which have been adopted into this series.
> > > > 
> > > > For anyone new to the series, the reason for appending this compiler
> > > > option is described in v3 (see "Link to v3" below).
> > > > 
> > > > In this version, the changes are organized into three parts:
> > > > 
> > > >    Patches 01 – 07: Preparation before adding the new compiler option.
> > > >                     Fix typos, adjust Makefiles to ensure the newly
> > > >                     introduced option does not cause regressions.
> > > >    Patch 08:        Propagate -fzero-init-padding-bits=all to
> > > >                     EXTRA_CFLAGS and HOST_EXTRACFLAGS for the
> > > >                     CC and HOSTCC compilers, respectively.
> > > >    Patches 09 – 30: Apply EXTRA_CFLAGS and HOST_EXTRACFLAGS in
> > > >                     project Makefiles.
> > > >   
> > > Through which tree do you expect these patch to be picked up ? Each 
> > > maintainer picks the patches related to their subsystem ?

My common approach to this sort of thing (which works) is to put
everything into mm.git, try to cc the whole world.

If Mark alerts us to the appearance of particular patches in linux-next
via another tree, I drop the mm.git copy, so maintainers can simply
cherrypick things and it's all automatic.

If maintainers send an ack (easiest!) then great.

Whatever is left over I upstream in the next merge window.

> > If that's the case it would be helpful to +CC the relevant
> > subsystem lists on the patches that you expect to go that path.
> 
> I deliberately looped mainatiners but not CC'ed each subsystem lists,
> as it is a long list so I don't want to spam them.
> 
> If we conclude to go via subsystem trees, I will CC subsystem lists.
> Thanks for reminding.

Sure.

I can ensure that the appropriate maintainers are cc'ed on the relevant
mm.git commits.    I generally don't auto-cc mailing lists - I already spray
out too many emails!


