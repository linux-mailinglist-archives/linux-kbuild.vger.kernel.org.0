Return-Path: <linux-kbuild+bounces-12146-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LZpEoftwGm3OgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12146-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 08:36:39 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C662EDA92
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 08:36:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 473F9300492C
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 07:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507F033C53F;
	Mon, 23 Mar 2026 07:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UTJq59o9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224033090C4;
	Mon, 23 Mar 2026 07:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774251396; cv=none; b=jAL4M9djOXgiXkMwUdDdiX7zRuZ4M2wR1RFBOu5zBkUQnqPlZ/y8iFUM5qAMq+dnCJOM4O+aVYsvwBcvFXM0tqqq1Er0Scr5LzWXrmV5X6LiIUfpJX3BktlcywuOSUi3zSlfm4sqfI/XsOShf5m3toXsLKcXdWCsalRX1erORqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774251396; c=relaxed/simple;
	bh=7VOKv6z3oEU5a+l36BGZyEJAjG0QWyDh946cJOuuQi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFVq89HsGsTGdn5XsL5JUQ+Gmw8iXVgzIGQYiUHGQsf8+shAo2akjRnktwO5wW2fZMoIQW4eFbdyfxae0VXyTmulfTQ4EoxYVjrLhvnzARFTAZeBdSUy37XxSeSJ6tQt3VZljMwXzzORq1J6vcxRRNci0lZRdzQAfDJKKaCkSMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UTJq59o9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B8DC2BCB0;
	Mon, 23 Mar 2026 07:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774251395;
	bh=7VOKv6z3oEU5a+l36BGZyEJAjG0QWyDh946cJOuuQi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UTJq59o9fveiEr6Uv0yM/nTrbUVTiD8929ACrYlzPtuYCENBduvek9Kj9jLd1r/nD
	 HFzlDX4Sli+o+fbRAhXnohAuRKda8ia545XFm4bn10RmzR7KeqB6StQjhfX2HUPknF
	 dILUah3wOYM7tpQiDm7A8xJbInLeNWCzoFqX3OTc=
Date: Mon, 23 Mar 2026 08:36:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	nathan@kernel.org, nsc@kernel.org, ojeda@kernel.org,
	masahiroy@kernel.org, linux@weissschuh.net, tamird@kernel.org,
	rostedt@goodmis.org, ihor.solodrai@linux.dev, ritesh.list@gmail.com,
	maddy@linux.ibm.com, peterz@infradead.org
Subject: Re: [PATCH] char: nvram: Remove unused nvram_mutex to fix
 -Wunused-variable warning
Message-ID: <2026032350-stardust-unselfish-ad61@gregkh>
References: <20260323072422.25730-1-venkat88@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323072422.25730-1-venkat88@linux.ibm.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12146-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[arndb.de,vger.kernel.org,lists.ozlabs.org,kernel.org,weissschuh.net,goodmis.org,linux.dev,gmail.com,linux.ibm.com,infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: D5C662EDA92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 12:54:22PM +0530, Venkat Rao Bagalkote wrote:
> drivers/char/nvram.c defines a static mutex 'nvram_mutex' which is never
> used. This results in a compiler warning on linux-next builds:
> 
>   warning: 'nvram_mutex' defined but not used [-Wunused-variable]
> 
> Remove the unused definition to avoid the warning.
> 
> Signed-off-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> ---
>  drivers/char/nvram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/nvram.c b/drivers/char/nvram.c
> index 9eff426a9286..2ce3307663ed 100644
> --- a/drivers/char/nvram.c
> +++ b/drivers/char/nvram.c
> @@ -53,7 +53,7 @@
>  #include <asm/nvram.h>
>  #endif
>  
> -static DEFINE_MUTEX(nvram_mutex);
> +static __maybe_unused DEFINE_MUTEX(nvram_mutex);

If it is never used, why not actually delete it?  This just papers over
the real issue :(

thanks,

greg k-h

