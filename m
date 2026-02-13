Return-Path: <linux-kbuild+bounces-11304-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOQfJWBTj2lUQQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11304-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 17:37:52 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 321C413838F
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 17:37:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CF2C23019A00
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Feb 2026 16:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D88367F36;
	Fri, 13 Feb 2026 16:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HInFHK2i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E25F367F34;
	Fri, 13 Feb 2026 16:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771000252; cv=none; b=FHzPiFNXTYIOMyMunAnJRybZa9kk1CMpDxz+4RB6M39Wc74Tt2D2TA9s4FLkXmrimlHWQ6in8gzIUgXzRFb+xIRq71EaCAnbSc/XgfYhPUvVLx0Rwh/A7YvPLzNSlpjcbtjlNuu/LtFBmlsgebY6bIQa+VlzIKWzBwwX8uVKtes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771000252; c=relaxed/simple;
	bh=Gtme98yYBXDzgA1k3jxuG0sCM/Kywo6qD70kXxCyBp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkBBD7xvshkNAgkLR5Le9/Qyn1FHCfYBsxKGlysB6w/Sht+fwE6soIFY7ZleXKWRRxgltF8TZmsVX3GrZMTGOCJlvRQGF8ni28ZfvnnuMrwY7M0vEapl7tNwMeUmxH3/aBha2izbjwU9lM1Mp8OhfadXmA1z+rAAnwPIkkBu2sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HInFHK2i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB62C116C6;
	Fri, 13 Feb 2026 16:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771000252;
	bh=Gtme98yYBXDzgA1k3jxuG0sCM/Kywo6qD70kXxCyBp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HInFHK2iAwlS2FB6SQOWljb7QJ2JSh3koeGNVc2zOmaqGs6P2Zg05zttSWbneF30y
	 jLf8Up5P1z/ULI0ejLTVd9cchZFmY5UNXPDVwcjFjxY5xB1/NSpMEBp1Yzdd7sFxyJ
	 v+UuE8iW71BvHSH7R8OaE5Fa1XFQ0WC8A/eYE3DE8dHjBJbZTmNEiBdHHboWq7w5z0
	 hkHefeulkcLXm+fjSpGUMlRS2u+eju2Ub0lFN7OT8O0VDnHSXfwZ2Czd/1Nh0iNzPF
	 QFm7+ZIIzJmnVYDE+a8TcE64qH3S6gdo8GRH26QEtfo7mgH0T7+s3TVyKD3Y/iicVq
	 8Oq++zwOLQUnQ==
Date: Fri, 13 Feb 2026 17:29:26 +0100
From: Nicolas Schier <nsc@kernel.org>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@cloudflare.com, Nathan Chancellor <nathan@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] kbuild: Fix CC_CAN_LINK detection
Message-ID: <aY9RZkRY0CqkZBdQ@derry.ads.avm.de>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@cloudflare.com, Nathan Chancellor <nathan@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	stable@vger.kernel.org
References: <20260212133544.1331437-1-mic@digikod.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260212133544.1331437-1-mic@digikod.net>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-11304-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,derry.ads.avm.de:mid,cc-can-link.sh:url,digikod.net:email]
X-Rspamd-Queue-Id: 321C413838F
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 02:35:43PM +0100, Mickaël Salaün wrote:
> Most samples cannot be build on some environments because they depend
> on CC_CAN_LINK, which is set according to the result of
> scripts/cc-can-link.sh called by cc_can_link_user.
> 
> Because cc-can-link.sh must now build without warning, it may fail
> because it is calling printf() with an empty string:
> 
>   + cat
>   + gcc -m32 -Werror -Wl,--fatal-warnings -x c - -o /dev/null
>   <stdin>: In function ‘main’:
>   <stdin>:4:9: error: zero-length gnu_printf format string [-Werror=format-zero-length]
>   cc1: all warnings being treated as errors
> 
> Fix this warning and the samples build by actually printing something.
> 
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nsc@kernel.org>
> Cc: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Cc: stable@vger.kernel.org
> Fixes: d81d9d389b9b ("kbuild: don't enable CC_CAN_LINK if the dummy program generates warnings")
> Signed-off-by: Mickaël Salaün <mic@digikod.net>
> ---
>  scripts/cc-can-link.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

