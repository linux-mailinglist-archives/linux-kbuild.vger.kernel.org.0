Return-Path: <linux-kbuild+bounces-11007-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EdsWHr5fgmkzTQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11007-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 21:51:10 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A2EDEA60
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 21:51:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63CC9300D333
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Feb 2026 20:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E852F1FC9;
	Tue,  3 Feb 2026 20:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXVmlvQL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ED92ED87F;
	Tue,  3 Feb 2026 20:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770151867; cv=none; b=lDtfMf1fqQgiY7O7pzZpucniwYQ/dtmmWvKmoy3V1PmPP1UjBqHiB6FsJvA+enUTMxhoGfsS/LcClGWQ1zeVFsr2e+PdiQsW9UX2eiYgbRweJtzIr4oKKDczwbLvDyx4MU34zsrbp5CME5pFQwxXL4hSP0sWxK2YkwDJYkoOWGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770151867; c=relaxed/simple;
	bh=uQqjLMLMwRK+yHP8ey8Nb5TzLFTT0OOf34uVi2KCuIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEb+3b9vAp3ze7F2TfjUdxPy6r11YWClBx+DrItaUlBbw+QbKCq6mm+h9ew+z+yfxmTrmg73mq4wKVCDsdUGcwAgmz72RhQPIz4ru8ibIYobdJxzZgKxkBVhV6N1bmMWSM9I22lGWtfe7DQ62b7EhQgaVQhFt/6ALc/vs3Cp/Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXVmlvQL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8651FC116D0;
	Tue,  3 Feb 2026 20:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770151867;
	bh=uQqjLMLMwRK+yHP8ey8Nb5TzLFTT0OOf34uVi2KCuIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IXVmlvQLmnj6g5P57zJ8wH+nlvqli9OrSsDIMt/PelYpraZYk5vSFoSxLFZ1YygvF
	 /8ZyB9CvIWkkZXXlqK+a7Be6Sr4ydoA97fUHi+eOIWijnhIm0VjoFrhlHH0y2RTJnc
	 KhR3yyNb/Xg677gesNiDuNM8sITHQ+vcbOJ79zl5CmWyufAfve2kIC3eIzJGseq93C
	 jGf54/O89+M/0tCQKPgUUkFQ+1XTykl7e2FwdT0FUteI8tRWfpagh55hXAxf4xTv23
	 rTnSMeT57DOyys0bk2u7CWzyt+kmnuiOc6yeWNgt5AzZqIG5LklczI6XFi9binRh2t
	 7TYOP2cyonjVg==
Date: Tue, 3 Feb 2026 13:51:02 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Luis Augenstein <luis.augenstein@tngtech.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Greg KH <gregkh@linuxfoundation.org>, nsc@kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, maximilian.huber@tngtech.com
Subject: Re: [PATCH v2 00/14] Add SPDX SBOM generation tool
Message-ID: <20260203205102.GB3573384@ax162>
References: <CANiq72mtWhjVNNYc6nvxuQ3XAnMWBDiZyOvJ1BNN=M+097Wvpw@mail.gmail.com>
 <2026012214-magician-mashed-c84c@gregkh>
 <CANiq72mcDqAS-FUfkAnxa7OEO4Kq6r6=uvhEb_UW4sGattCOuQ@mail.gmail.com>
 <2026012533-preflight-surviving-43e5@gregkh>
 <CANiq72=_tPP4cPaUMPiM14h1kk97EXSf5vg-yHHYo-Px+31ZSg@mail.gmail.com>
 <a01233b9-23a2-4666-91ed-f1cf030dcb9f@tngtech.com>
 <20260127231037.GA3378797@ax162>
 <6ed0fe99-3724-40c2-8d98-3309a3cf0104@tngtech.com>
 <20260203004032.GA52989@ax162>
 <a6f5f9e9-3652-4aff-8422-05e1c88850de@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6f5f9e9-3652-4aff-8422-05e1c88850de@tngtech.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11007-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,linux-foundation.org,tngtech.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C8A2EDEA60
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 03:41:42PM +0100, Luis Augenstein wrote:
> Hi Nathan,
> 
> > 2. This depends on having a clean initial build tree (either empty
> >    directory or 'clean' as a make target) due to needing to parse the
> >    .cmd files, which could be stale if someone builds a kernel, changes
> >    their config, and rebuilds, right? This should be documented since I
> >    do not think it is possible to do something like what Masahiro did in
> >    commit 3d32285fa995 ("kbuild: wire up the build rule of
> >    compile_commands.json to Makefile") because of the drawback that it
> >    misses too many things.
> 
> There might be edge cases, but in general stale .cmd files should not be
> an issue.
> 
> The script does not scan the build tree for .cmd files. It starts from a
> set of root build artifacts (kernel image and .ko modules listed in
> modules.order). From these roots, it parses the corresponding .cmd files
> to discover the immediate dependencies, and then recursively processes
> the .cmd files of those dependencies, effectively walking the entire
> dependency graph up to the individual source files.
> 
> Stale .cmd files should not be referenced as dependencies by the root
> artifacts and therefore not be part of the resulting dependency graph.

Ah okay, thanks for the explanation! I have not had a chance to review
the actual Python implementation yet. It sounds very similar to the
approach taken by Masahiro for compile_commands.json but by looking at
the .cmd files recursively from the root artifacts.

Cheers,
Nathan

