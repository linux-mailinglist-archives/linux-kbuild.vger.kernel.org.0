Return-Path: <linux-kbuild+bounces-13446-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFKNMMzJHWrHeQkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13446-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Jun 2026 20:05:00 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A1E623B26
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Jun 2026 20:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC7833055DDB
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2026 17:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C1D3E16A9;
	Mon,  1 Jun 2026 17:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="muayq1Rl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229523DDDD9;
	Mon,  1 Jun 2026 17:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780336613; cv=none; b=n309jYhno93enFRfs0NAJfyU6OJSqwF/0JITJ2ZPi4VUBeXRvgXudmEFth5JgfXCM+6jSQDPVt2chZkRq5Da9ota3CHa79N/m+Uw0ZPdLPREwCrCBYldd8StGUUuLQrD0rJ6cQqbUseGq4Wx2+ZAntqvSlZs2/4uQPDqIhUneno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780336613; c=relaxed/simple;
	bh=dXUMwECd653jiVMHf62gmGnh8nUmSSIKY+ZwCI5X/FU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGxXEsLn4wmqijhhklG+AK3e5DYU4Rs0U78O52yFD48hS0RbAWz0LN/KfBqakx4XYGsp46+j/7iJ2WRNpDnKVNxfsmfvlGkF4mRx1sZlKgpNpNTIC2c6qEBB0nKRDftxbGglRm1uORASUlb8RmnsHznHdpy7p0Zxh+NxLQqGNmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=muayq1Rl; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FfMgnlM4fajjU1ph9RU2eBbdh6szgPxyVq4SIiHfhwc=; b=muayq1RlpsfyPUrSXEoa35ELwo
	ye/Yj01CIbZTVC8BEZrl/eV0YAw66W0rkld2wRYsrxWctT7iNhcFfVHzCohAsuSD08ly/76FQoDNH
	QpuKjAEEM3WGdgDE59FmAjvkdWD6CAOBXcnfWd4urxkfZqf3ycyS0VP8rGH8vEyLoHFvQ4Z/fzZ2M
	w1CJ6rX2YUIvpe1umYS2mg9r1jO3zYI1GxXMIbjCc2uG8YS930T3+FvMsPEMwu0EHhmWqlduVGaz3
	yXabjtP3tmJ5WI1ag5IH0nQCRTCp6zl3xncqOLcMXgqWzMQTofzmcAZRIRwNowpzwZuPLx4c4jSJr
	a2q+56gA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wU6sL-002LsI-1J;
	Mon, 01 Jun 2026 17:56:33 +0000
Date: Mon, 1 Jun 2026 10:56:27 -0700
From: Breno Leitao <leitao@debian.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, paulmck@kernel.org, Nicolas Schier <nsc@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	bpf@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 0/4] bootconfig: embed kernel.* cmdline at build time
Message-ID: <ah3HwIwXpxTVTtFz@gmail.com>
References: <20260527-bootconfig_using_tools-v1-0-b6906a86e7d5@debian.org>
 <20260529001519.14ca9dbe92fb2622249137c6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529001519.14ca9dbe92fb2622249137c6@kernel.org>
X-Debian-User: leitao
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13446-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[debian.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 66A1E623B26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 12:15:19AM +0900, Masami Hiramatsu wrote:
> On Wed, 27 May 2026 09:41:33 -0700
> Breno Leitao <leitao@debian.org> wrote:
> 
> > The userspace pieces (xbc_snprint_cmdline() in lib/, tools/bootconfig -C)
> > already landed; this series wires the rendered cmdline into the kernel.
> > 
> > Motivation: today the embedded bootconfig is parsed at runtime, after
> > parse_early_param() has already run, so early_param() handlers can't
> > see embedded values. Folding the kernel.* subtree into the cmdline at
> > build time gives a CONFIG_CMDLINE-equivalent for embedded-bootconfig
> > users without forcing them to maintain two cmdline sources.
> > 
> > Behaviorally, the "kernel" subtree is rendered to a flat string at
> > build time and stashed in .init.rodata. setup_arch() prepends it to
> > boot_command_line before parse_early_param() runs. Overflow is a soft
> > error: the helper logs and leaves boot_command_line untouched rather
> > than panicking, so an oversized embedded bconf cannot brick a boot.
> > 
> 
> Thanks Breno, yes, that is what I think about.
> Let me check it. And could you also check Sashiko's comments?

yes, I've spent some time on them, and it reported some good points, in
fact. I will fix those and resend.

Thanks!
--breno

