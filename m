Return-Path: <linux-kbuild+bounces-11611-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIgvFwFmqmk1QwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11611-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 06:28:33 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C68F121BB3C
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 06:28:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98F9A302EABB
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Mar 2026 05:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A25436D508;
	Fri,  6 Mar 2026 05:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nQUCEu9O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855BA4A0C;
	Fri,  6 Mar 2026 05:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772774909; cv=none; b=T3m7F4e19a3Xzm94iMffzUxayPDdAECX/GoRqfk25kkocwTPyJLO8bX5LY8GJQeoO0nviou9W9i/jKGG8vzouA/lAoLAh3Xth/NF+cl6mneo6R7tnqjGu45jajVstbGVBPWQCFNFDFzfv+Cz2LEo8yYM9n5rxierQ+tcnKy0DcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772774909; c=relaxed/simple;
	bh=Mymp5YMe/lwJlGb/YeUoaONjTRY+VLjELsuskVN91j0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YY+w3i4c0kYMVZmYeZEUanv+8nI7WF5vVdAUEkEnmHIK2zkkhwYkDOj8Vo1ZoUj0zFKA7+t44AklDMcBB0xK0sYXS4J596hISVshAyu3mcv7dq0PYjlCIkx1Hc3eua0/BXCErHsARLxXxCqWw7zJezqpvsjafw5jjD5a7xN/2vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nQUCEu9O; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Vkfetqs+xpuG5oD7JT2fp2BAiX2HJc/0mpwWIS+EuZA=; b=nQUCEu9OEPJLY3czN25dwPTfJ5
	rmbiVdnd5/maK1qpOsCtJkMYiUi1zsvvIBPdtlF0ZwdS9EIl8GlYuTr/rLGlf0wURU6wKgC4AeYdU
	eWxmCjDAtxlZckaAmtqQiOjdyMfLRX+K0FLp70cjbE/y0j2stYSok5UTNKypGPypkXQfBXdrsfvi+
	T0+L2RrWZzNvrAtdth/A303CX6+vgv3yQwo8Br7C+X31BAz5zWMnx+GeULLXg4jucp7GgjT3O8P5d
	U7caQXDvfe3n0iZ75Z4t106YTdvtQ1ZjHzKlQRWORCtJ3de0KrQyZEDPRtH1A07d4gSNXlQ10BASW
	YNdhM80g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyNjN-000000032qp-3jvw;
	Fri, 06 Mar 2026 05:28:09 +0000
Message-ID: <d7b0ec9a-85b6-469f-9058-322866ce2cdd@infradead.org>
Date: Thu, 5 Mar 2026 21:28:09 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] kallsyms: embed source file:line info in kernel stack
 traces
To: Sasha Levin <sashal@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Richard Weinberger <richard@nod.at>, Juergen Gross <jgross@suse.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thorsten Leemhuis <linux@leemhuis.info>, Vlastimil Babka
 <vbabka@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260303182103.3523438-1-sashal@kernel.org>
 <20260303182103.3523438-2-sashal@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260303182103.3523438-2-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C68F121BB3C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11611-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[davemloft.net:email,infradead.org:dkim,infradead.org:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action



On 3/3/26 10:21 AM, Sasha Levin wrote:
> diff --git a/Documentation/admin-guide/kallsyms-lineinfo.rst b/Documentation/admin-guide/kallsyms-lineinfo.rst
> new file mode 100644
> index 0000000000000..4dffc18dbcf5a
> --- /dev/null
> +++ b/Documentation/admin-guide/kallsyms-lineinfo.rst
> @@ -0,0 +1,72 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +==================================
> +Kallsyms Source Line Info (LINEINFO)
> +==================================

Heading over/under lines must be at least as long as the heading.

> +
> +Overview
> +========
> +
> +``CONFIG_KALLSYMS_LINEINFO`` embeds DWARF-derived source file and line number
> +mappings into the kernel image so that stack traces include
> +``(file.c:123)`` annotations next to each symbol.  This makes it significantly
> +easier to pinpoint the exact source location during debugging, without needing
> +to manually cross-reference addresses with ``addr2line``.


> diff --git a/MAINTAINERS b/MAINTAINERS
> index 61bf550fd37c2..ab987e74bb0f5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14278,6 +14278,12 @@ F:	lib/Kconfig.kmsan
>  F:	mm/kmsan/
>  F:	scripts/Makefile.kmsan
>  
> +KALLSYMS LINEINFO
> +M:	Sasha Levin <sashal@kernel.org>
> +S:	Maintained
> +F:	Documentation/admin-guide/kallsyms-lineinfo.rst
> +F:	scripts/gen_lineinfo.c

This entry should be in alphabetical order, just before KASAN.

> +
>  KPROBES
>  M:	Naveen N Rao <naveen@kernel.org>
>  M:	"David S. Miller" <davem@davemloft.net>

-- 
~Randy


