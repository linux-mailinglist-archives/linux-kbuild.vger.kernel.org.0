Return-Path: <linux-kbuild+bounces-12717-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPsnJJRg1WkF5gcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12717-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 21:52:52 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFEB3B4136
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 21:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB61730A0B10
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Apr 2026 19:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFE73783C4;
	Tue,  7 Apr 2026 19:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJ6kV4NV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E805733E;
	Tue,  7 Apr 2026 19:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775591277; cv=none; b=eQ44X2h57Ng5ZOsNDAOAzZw8p6VE7UhUDCICPJAToS/NpGjcOM4Oif5QtBkyF9IDZMTuOTtsWboljNmIATxy2nuspPQ9jvku743jaEbzrz6nR3JDAoD+uuIOhxp2bOrwbXnIxzf09Ff8bZOa/9XST8M2iG7UqYUG4EZzPjj5a9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775591277; c=relaxed/simple;
	bh=yGtQ4GMdLxWx2e9jXljuDr6oW/dQWO/LMZ6EkN0C33U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYSCevw+t2Slffds7jjLeUh+L8aIoxRZY1Hn3q/fFknc3Z7rj7hE/9q+d5mT0aibBSkGdy4Y4UIay2WFKpW7lhpvqHmXhTDQt6cwfVZJYS0dvvMrlmN/vCbC2Gg+5r048cdBORtZSswDbgTJVmbdW64gVTBW5y9LVyqckJClCPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJ6kV4NV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F70C116C6;
	Tue,  7 Apr 2026 19:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775591277;
	bh=yGtQ4GMdLxWx2e9jXljuDr6oW/dQWO/LMZ6EkN0C33U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pJ6kV4NVwFHZDNMFcgFYg8widafgVOtmNJmb3Nlwbuf3NNovvUbXi6zMXl4Bc6Oxa
	 9Mc9d/nciLlvBmJQxqsDkIih8rdsa8CVAUtOtOgVVvNeTxD2ag1L3zgAPuPfevIyV4
	 sqPnRAvSt27EL0zNTkAVQOfgtMECBN9gNY8nER7VrUYYCKZQQRSo2hyDlO61tmQ4EC
	 X8sBBd53aVNK9qhB4Cbe9S4I0H5bpNNKA55yPpmb09bjL1wIdHiA0wI8KpI8OSSec1
	 flYlJIPsPahu64a7+8z+TVJwREFJJVEbt5GJz5ZISOu4rnsMvyaHdTQDfNJtSI+XXP
	 lyxzENC1p7x0w==
Date: Tue, 7 Apr 2026 21:47:03 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Marco Elver <elver@google.com>, Petr Mladek <pmladek@suse.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] init.h: discard exitcall symbols early
Message-ID: <adVfN_evr1aO6Pl5@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
	Marco Elver <elver@google.com>, Petr Mladek <pmladek@suse.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
References: <20260331142846.3187706-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331142846.3187706-1-arnd@kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12717-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,vger.kernel.org,linux.intel.com,gmail.com,arndb.de,google.com,suse.com,infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:email]
X-Rspamd-Queue-Id: EDFEB3B4136
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 04:28:38PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Any __exitcall() and built-in module_exit() handler is marked as __used,
> which leads to the code being included in the object file and later
> discarded at link time.
> 
> As far as I can tell, this was originally added at the same time
> as initcalls were marked the same way, to prevent them from getting
> dropped with gcc-3.4, but it was never actaully necessary to keep exit
> functions around.
> 
> Mark them as __maybe_unused instead, which lets the compiler treat
> the exitcalls as entirely unused, and make better decisions about
> dropping specializing static functions called from these.
> 
> Link: https://lore.kernel.org/all/acruxMNdnUlyRHiy@google.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  include/linux/init.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/init.h b/include/linux/init.h
> index 5db55c660124..ad5c19763034 100644
> --- a/include/linux/init.h
> +++ b/include/linux/init.h
> @@ -47,7 +47,7 @@
>  #define __initdata	__section(".init.data")
>  #define __initconst	__section(".init.rodata")
>  #define __exitdata	__section(".exit.data")
> -#define __exit_call	__used __section(".exitcall.exit")
> +#define __exit_call	__maybe_unused __section(".exitcall.exit")
>  
>  /*
>   * modpost check for section mismatches during the kernel build.
> -- 
> 2.39.5
> 

Acked-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

