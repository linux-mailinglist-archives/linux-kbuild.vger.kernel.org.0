Return-Path: <linux-kbuild+bounces-12057-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHuxMcWSumnSXgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12057-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Mar 2026 12:55:49 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3455F2BB257
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Mar 2026 12:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C9B83049964
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Mar 2026 11:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D043C3D3317;
	Wed, 18 Mar 2026 11:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uDWpoOs5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B33378D93;
	Wed, 18 Mar 2026 11:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773834813; cv=none; b=eM8KPSyBho0gZv4ND8fCZQTzqSTbqBImK2s93VDIDngzBKJB1r2hTQSMuDULWNgiH5TEOw/7e1SoJppaWB5ngUuYqRHTEjNWAVVpIv6pZ4UYd5hbCXlSAvMV6aYrGzkiD+ETBTSoH+SJOozoP3nLyGR+Y9aklJTfWprMWIGMggk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773834813; c=relaxed/simple;
	bh=LgC1lm6hsOkZxUbM1GobRu3j7ie7NTm1bfCs+thsDHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLOc99VtExSoEDFv6Gr0NrujbiFCeZ41IPB0TA2hGL50ERTHgplDz6NJ42vFfRxz13PIoMbo+pCrCPFWG+nl556JfrlYPM2MuAcVux8Pw18K4tyLGn3N+c2h+8oOJAoz7Bm/ip9Q1Vj+PH1ggyW1t6UTJz9+l8x/W5L+qewPeFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=uDWpoOs5; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=l4U6xtTGON0fwyeUHCFIqavhiLt6G9bjL//jtiBQXJc=; b=uDWpoOs5vmgqPk34kKfBRvHpZP
	WpmPEPAdcdMIkCB16i8NaoU0ijQIvJjpa/SadRlfdWry68QAO4R0MQbS7aese3JcC+B/6adqK9e/5
	eBMym68AULUlUH0HbeMpAryVrYR7HhwWgruR/2uKCV/XZMN02Qvnv5yEQKEQtGvlUkrDhuZfLEyQ6
	KEMwDZwgtFbesfb5o6z9TyjvfEihPIl53NY1YrOcymEQrNW5vwhcWZrMYIC0D9rxM7JM1wL5Q13RY
	yIOhJkR9V+Xt8NsC1fIeZknUVaAgc/SoRJk67+b/p7Ncl9O/nMpiykrK1ucljhD9NvsnXiXM+SG9q
	0mC846OQ==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2pSo-00000004L4y-1JMI;
	Wed, 18 Mar 2026 11:53:26 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 22CD5301BDE; Wed, 18 Mar 2026 12:53:25 +0100 (CET)
Date: Wed, 18 Mar 2026 12:53:25 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>,
	Quentin Monnet <qmo@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	William Breathitt Gray <wbg@kernel.org>,
	Barry Song <baohua@kernel.org>, Qinxin Xia <xiaqinxin@huawei.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kent Gibson <warthog618@gmail.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>, Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>, Mark Brown <broonie@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, bpf@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 00/26] tools build: Append
 -fzero-init-padding-bits=all option
Message-ID: <20260318115325.GB3738786@noisy.programming.kicks-ass.net>
References: <20260318-tools_build_fix_zero_init-v5-0-bbeffd8da199@arm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-tools_build_fix_zero_init-v5-0-bbeffd8da199@arm.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12057-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[70];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,noisy.programming.kicks-ass.net:mid,infradead.org:dkim]
X-Rspamd-Queue-Id: 3455F2BB257
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 09:16:44AM +0000, Leo Yan wrote:
> Thank you for reviewing and commenting on v4.
> 
> For anyone new to the series, the reason for appending this compiler
> option is described in v3 (see "Link to v3" below).

So why can't you just copy-paste that yourself, and save me from having
to go find a browser and copy/paste the stupid link, just to find
something that should have been here to begin with?!

