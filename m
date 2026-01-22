Return-Path: <linux-kbuild+bounces-10817-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPqXHHNucmlpkwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10817-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 19:37:39 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 112366C885
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 19:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9B40300908C
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 18:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB38D3542F8;
	Thu, 22 Jan 2026 18:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sI4D3YPt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644F01D5151
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 18:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769106022; cv=none; b=QyeIPEjNmus3bqdC+T3LPnKdIT8bItZ4U4qryHxbU0L++QF8BKjKezYKgjotAUtZkOo/nDFK6URAn8GPiVi+sJMCWOtQSngu81CEdDW+lNDx7WmmzgxMRLw08+y05qvu2+QFJmMPxOYOpvr0dRTIgGro7cIUt2bY1bCTZnmdg0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769106022; c=relaxed/simple;
	bh=jOWdifrfg94wJ6wLqEc3qFdXQBas0Y4zQ+SbGXDEg0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H0OBKY7swZrhA4Qp62p6zdKJizP42av3YlwpG7KYeh0mkA4DFX8DlhEsAx+gDPY1PBUnN2CzCfAw3/ThYhLXEBAx4W7QT51M8qz2ZpNMZcCUyRyx0YbP0fHWK0x2SbO/3h8xcwXTAn/kEtSrQhgQRGSiOeAgpTNe4JHRZDrOrCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=sI4D3YPt; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=/jobhFbLfIrbtnDsuJK+M8x4zMYBqylR+gmORHAUtFc=; b=sI4D3YPtPGT9ELLvr0lpyYrOTV
	1d2C22T1jb+JOo/wczmPZRwXXS4fkhqArUbu+yvdmcio2n0m4Rke80Jahh4rvUo5CWKqEjJNI20yc
	CTme540WV31YHIJBgTp6GC7OXcMEvKz4wxxv4nvNW7tG6dPsCwMmMylhUD42gU6Vf4H8Sj0MBCorb
	LP2NTwQfWtiuhUzlLf/KJJXTkPupIMSYc7QnlxpTIlx79H9ScZ+OCauofDcNe2fYXrykHPcTPilCv
	j3zb+c4yUXNijrTxnL2bum4e7b1RhXNurrq1LAA9Q0vzaHJrS9yYDki9akYhhEe9OV+JEeal315xW
	tg44XatQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizHh-00000007crM-3cXA;
	Thu, 22 Jan 2026 18:19:57 +0000
Message-ID: <ad197140-3781-4098-9a73-4d9f49356409@infradead.org>
Date: Thu, 22 Jan 2026 10:19:56 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Makefile: Globally enable fall-through warning
To: Simone Rea <hheh47660@gmail.com>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>,
 linux-kbuild@vger.kernel.org
References: <20260122155401.335643-1-hheh47660@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260122155401.335643-1-hheh47660@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10817-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[infradead.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[markovi.net:email,linux-foundation.org:email,chromium.org:email,infradead.org:mid,infradead.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,socionext.com:email]
X-Rspamd-Queue-Id: 112366C885
X-Rspamd-Action: no action

Hi,

On 1/22/26 7:53 AM, Simone Rea wrote:
> From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
> 
> Now that all the fall-through warnings have been addressed in the
> kernel, enable the fall-through warning globally.
> 
> Also, update the deprecated.rst file to include implicit fall-through
> as 'deprecated' so people can be pointed to a single location for
> justification.
> 
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

This is missing your Signed-off-by: line. See
Documentation/process/submitting-patches.rst for info.

Also you should copy the current KBUILD maintainers.
See the MAINTAINERS file.

> ---
>  Documentation/process/deprecated.rst | 14 ++++++++++++++
>  Makefile                             |  3 +++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> index 49e0f64a3427..053b24a6dd38 100644
> --- a/Documentation/process/deprecated.rst
> +++ b/Documentation/process/deprecated.rst
> @@ -119,3 +119,17 @@ array may exceed the remaining memory in the stack segment. This could
>  lead to a crash, possible overwriting sensitive contents at the end of the
>  stack (when built without `CONFIG_THREAD_INFO_IN_TASK=y`), or overwriting
>  memory adjacent to the stack (when built without `CONFIG_VMAP_STACK=y`)
> +
> +Implicit switch case fall-through
> +---------------------------------
> +The C language allows switch cases to "fall through" when
> +a "break" statement is missing at the end of a case. This,
> +however, introduces ambiguity in the code, as it's not always
> +clear if the missing break is intentional or a bug. As there
> +have been a long list of flaws `due to missing "break" statements
> +<https://cwe.mitre.org/data/definitions/484.html>`_, we no longer allow
> +"implicit fall-through". In order to identify an intentional fall-through
> +case, we have adopted the marking used by static analyzers: a comment
> +saying `/* Fall through */`. Once the C++17 `__attribute__((fallthrough))`
> +is more widely handled by C compilers, static analyzers, and IDEs, we can
> +switch to using that instead.

Given that we have 80 cases of
	/* Fall through */
or	/* fall through */
in the kernel tree and we have over 5000 cases of
	fallthrough;

ITSM that you could go ahead and call for using the latter.


> diff --git a/Makefile b/Makefile
> index 9be5834073f8..bdf8eac51b07 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -843,6 +843,9 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
>  # warn about C99 declaration after statement
>  KBUILD_CFLAGS += -Wdeclaration-after-statement
>  
> +# Warn about unmarked fall-throughs in switch statement.
> +KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough=3,)
> +
>  # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
>  KBUILD_CFLAGS += -Wvla
>  

-- 
~Randy


