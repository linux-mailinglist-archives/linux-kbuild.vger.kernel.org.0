Return-Path: <linux-kbuild+bounces-11542-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zbJ8JMCGp2nOiAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11542-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Mar 2026 02:11:28 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2D81F9184
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Mar 2026 02:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 997AF303DDE1
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Mar 2026 01:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD121305046;
	Wed,  4 Mar 2026 01:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIn0cF9O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98978BA21;
	Wed,  4 Mar 2026 01:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772586683; cv=none; b=lLuhanPYxnbh0/naNguARU5O9vYIGAUDY1+s5d/FsxOcsnr/8M+UNn2dCsZ9clSYhZI9bRo14pFBXzG/DDPF9Uxh1dheBcQyUSy1KaRFHiXBZeBJrYd0HBzkjf9jmfEBaoRh4VqbPoX4sbTHWsMwabvzdFuPEqvmlmOGNkCXQ+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772586683; c=relaxed/simple;
	bh=a+u6CII2XySrJVxB9Aj8MSv/aAU56seCgKwjrsCHpzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JIJbSMhuZSwx7B1LspoGq2+1+qNG6gbBjeG/iRb31iej1ouHKM/VS30pji0DvrxMALQoAontg8CErLebo53DF/6QlN22Dvs/pDO6+Hcx0LQu67PJ6+5dzun/68VsjmvBMhCjevDhMDsycJTxVwKJtWKtmF8DA5C0IELX3Oi9Wxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIn0cF9O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF36EC116C6;
	Wed,  4 Mar 2026 01:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772586683;
	bh=a+u6CII2XySrJVxB9Aj8MSv/aAU56seCgKwjrsCHpzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PIn0cF9OWhpc8b6IfyE3oCV+cnhezEg4uEWxFUEDt73Dipi/R6lOs+WIUWToa5u/c
	 7Y/jkAuDU0ZNukmCm/o2xvpliz1uR4uSWvYM+9REqMEMrMDVqY7O8BecByrizuv9aM
	 5hnn7ahvVU6oqng5kJ6JfX6w1fFhqMQZNzXEZ2US+qKQla9+APfBjlCHFyDQTCFFz7
	 642NSRORvc13ysGBd4x7QODz7V1EujGOCuil46KTNBNtFmSATJXcOEG5PlYtgku9BV
	 5IvpcX3upiAJvrlPqT5muYM/Br0tS3llHuT4KQjmkbHvCsQf5b7RoFpD92z/JYCwHD
	 dxpWILJ2gFNiA==
Date: Tue, 3 Mar 2026 20:11:21 -0500
From: Sasha Levin <sashal@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Richard Weinberger <richard@nod.at>,
	Juergen Gross <jgross@suse.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Vlastimil Babka <vbabka@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] kallsyms: delta-compress lineinfo tables for ~2.7x
 size reduction
Message-ID: <aaeGuQY_rZQFdaYx@laps>
References: <20260303182103.3523438-1-sashal@kernel.org>
 <20260303182103.3523438-4-sashal@kernel.org>
 <CAMuHMdUv61E0wnQOaZ+M+pXrzZNYzsQLQV_05uTpz7YXyu25VQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAMuHMdUv61E0wnQOaZ+M+pXrzZNYzsQLQV_05uTpz7YXyu25VQ@mail.gmail.com>
X-Rspamd-Queue-Id: 4B2D81F9184
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11542-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 10:25:19PM +0100, Geert Uytterhoeven wrote:
>FTR, arch/arc/kernel/unwind.c, arch/sh/kernel/dwarf.c, and
>tools/perf/util/genelf_debug.calready have (different) LEB128 accessors,
>so there is an opportunity for consolidation.

Looks like this happens in few other places too...

I've created the following (build-tested-only) series on top of the LINEINFO
patches to try and consolidate this:
https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git/log/?h=dedup-lsb128

I can send it out after we figure out what to do with the LINEINFO patches :)

-- 
Thanks,
Sasha

