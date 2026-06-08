Return-Path: <linux-kbuild+bounces-13614-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tuWvAQMpJmqsSwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13614-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 04:29:23 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA8B6523D3
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 04:29:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YryrMEOK;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13614-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13614-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33C2B3006F35
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 02:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E2C1317164;
	Mon,  8 Jun 2026 02:29:19 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594EF30FC03;
	Mon,  8 Jun 2026 02:29:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780885759; cv=none; b=BNY5/nOafboctXi162LbLROAGqhLxa2j0dH7cZExMTWlwcfwdWNpXpRbzTT8+ojYxCmr9KGjBDTvxT8qULtHEiR7KF9yKwrwPeSgHTGeTN/dfKfiC4dfom9HHisUEEbs0pGH3j0pXdvSUQwoObEU+cZL4pEnrkSFnAFoQ9kFBpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780885759; c=relaxed/simple;
	bh=1yW3nGF+k1cyd6TOnr3aI6fuKTkcHeoCFzAPA0owvD4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=DAHfWbAiJuXk4GufugxYWmGH9WR8ZmQ1rdGUWDM02FIhpBr6kXS3fuRdLRauSILod1mN3nvJ7f5cPuHi52PhSzLdotDOuySxaoG/5JbNJaqdNF+Ti+aq33t9YvIvwxtIk/DLJetdxFDBNkMD/pRnE+WerCs3yvfJWw70bYuMpS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YryrMEOK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AADE1F00893;
	Mon,  8 Jun 2026 02:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780885758;
	bh=aBSarULtiAIbNgz7EOEuuFuqzWO+yqoqqHghdSCdJ5U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YryrMEOKa/URJl9Ed4LYJYVdYFN79dFfhRsvvv/Z2A1pqVOsyC+1yNXergIxdOPcj
	 nb/sKI5iK0Bp6WZ1ZQ12IUDbIhbFAUkhWBeZXZRe9MFmyuESIXFgQS/K2Js3xzaB4W
	 EKNs5xdDxxgzs8r3dlyHGfmcJI2VpUUrMPhRA2DGA+TbFbWlHUhLjnYURUDgy0xqMx
	 FMq5r7u6B5QLeBGREwD6tuajwJ7pRsuhRTtzmKrPdAl/aMbPPIGjDv3QXFMo3CPU6D
	 QpVVgtwoFki47KPVdduvlwH2a1Jky7Lt5byDMZ4ly2wCl8Ah5rk1xiJjDi08WxdnD2
	 6qhyn9rpUdaxg==
Date: Mon, 8 Jun 2026 11:29:11 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor
 <nathan@kernel.org>, paulmck@kernel.org, Nicolas Schier <nsc@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 3/6] bootconfig: render embedded bootconfig as a
 kernel cmdline at build time
Message-Id: <20260608112911.ec62dfd24adf235b6db5506b@kernel.org>
In-Reply-To: <20260605-bootconfig_using_tools-v2-3-d309f544b5f7@debian.org>
References: <20260605-bootconfig_using_tools-v2-0-d309f544b5f7@debian.org>
	<20260605-bootconfig_using_tools-v2-3-d309f544b5f7@debian.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:leitao@debian.org,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:paulmck@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,m:kernel-team@meta.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mhiramat@kernel.org,linux-kbuild@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-13614-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhiramat@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CA8B6523D3

Hi Breno,

On Fri, 05 Jun 2026 05:03:34 -0700
Breno Leitao <leitao@debian.org> wrote:

> diff --git a/tools/bootconfig/Makefile b/tools/bootconfig/Makefile
> index 90eb47c9d8de..aa75a7828685 100644
> --- a/tools/bootconfig/Makefile
> +++ b/tools/bootconfig/Makefile
> @@ -15,10 +15,14 @@ override CFLAGS += -Wall -g -I$(CURDIR)/include
>  ALL_TARGETS := bootconfig
>  ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
>  
> -all: $(ALL_PROGRAMS) test
> +all: $(ALL_PROGRAMS)
>  
> +# bootconfig is a build host tool: Kbuild's prepare hook runs it on the
> +# build machine to render the embedded cmdline, so always compile it with
> +# $(HOSTCC). Using $(CC) would cross-compile it under ARCH=... builds and
> +# fail to exec on the host ("Exec format error").
>  $(OUTPUT)bootconfig: main.c include/linux/bootconfig.h $(LIBSRC)
> -	$(CC) $(filter %.c,$^) $(CFLAGS) $(LDFLAGS) -o $@
> +	$(HOSTCC) $(filter %.c,$^) $(CFLAGS) $(LDFLAGS) -o $@


> Is it safe to pass $(CFLAGS) and $(LDFLAGS) to $(HOSTCC) here?
> When cross-compiling, $(CFLAGS) and $(LDFLAGS) often contain target-specific
> flags. Passing these target flags to the host compiler might cause it to fail,
> or incorrectly generate binaries for the target architecture that fail to
> execute on the build host.

Sashiko found a problem here. Hmm, I would like to build the bootconfig
tool just as a tool. (like `cd tools/bootconfig; make`)
Can we identify the build (make) is called from kernel build process or not
and switching CC/CFLAGS/LDFLAGS?

> 
> Additionally, since bootconfig is an administrative utility meant to be
> deployed on the target system, will permanently hardcoding $(HOSTCC) prevent
> users from cross-compiling it for their target devices?

This is also a good point. We need cros build binary and host binary.

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

