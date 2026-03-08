Return-Path: <linux-kbuild+bounces-11690-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPrfIkJprmmEDwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11690-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 07:31:30 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DDF23433C
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 07:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B7BE300D330
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 06:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801A634F472;
	Mon,  9 Mar 2026 06:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S14DCksv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B83B1F5842;
	Mon,  9 Mar 2026 06:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773037886; cv=none; b=tzTB2S18HA7AFKJ0zNpR10RKjoM5yx7vLEbJI4KTZzar7a/pfLsQbyMHfW6QPRNFI7/aYMh1fn0f1/hOGD2eGN8O4PgM5ySv9V+lt5IPZF6QJCqBK7rdzdD52hyYd/HuGmRtLODkqAafDS94EYfv/D3a11GwS78ulFBIjP+79SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773037886; c=relaxed/simple;
	bh=Md7FYDF0w0VZP0pjjopzG1vimebwfHL4OaTwloH16PA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0Vem8FmtFh9vuC/46tNibFiA3McHXHzSbbziNnYfzGVlQ7QuvVvfR0qVzcH6Y7mh4hozpXtP6oyhaa94WIzfwbuqYoz+kOKfais+C9KhfCWQcPlE3GqLpnY4U3dCm8fxysispX+ZZaINepL20z2WInE0CunMD33nlxUwJRp9E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S14DCksv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770C6C4CEF7;
	Mon,  9 Mar 2026 06:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773037886;
	bh=Md7FYDF0w0VZP0pjjopzG1vimebwfHL4OaTwloH16PA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S14DCksvGQOfBloqfu/+fNf4C6+KbIzSgfYDS6B5nwtaQFIBZ20KjmcW+a9cVxf8t
	 YlmJV1RnCzzUIvfcJq5ywVFriJ52lgLmSSOdRuUeNyd+UP18fRlWa0yuNHcnN1cKgH
	 TNCrhDZztboMqgCX5RBQ4aVUy0EqIHDT+EUfCUoV2mbDHsfbGhrTr3URW/hkGxIpLI
	 5SALGigzx+laS7a8uSOkxaR/AF6U6YgXzmcbo0ipKxv7Qjno9/ajoNzMIYzqzLaLl3
	 sAQpNrwEId6T8yPjPKsfMgZR9HgDD74ccA3I5yJOJhWG1aEdTlvrsKv0M9GuLQf0+t
	 v1OjB7vNCHhiw==
Date: Sun, 8 Mar 2026 07:34:23 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Charles Mirabile <cmirabil@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	masahiroy@kernel.org, nathan@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] Delete .builtin-dtbs.S when running make clean
Message-ID: <aa0Yb18ifgNCmdgl@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Charles Mirabile <cmirabil@redhat.com>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	masahiroy@kernel.org, nathan@kernel.org, stable@vger.kernel.org
References: <20260308044338.181403-1-cmirabil@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308044338.181403-1-cmirabil@redhat.com>
X-Rspamd-Queue-Id: D6DDF23433C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11690-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.933];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sat, Mar 07, 2026 at 11:43:30PM -0500, Charles Mirabile wrote:
> The makefile tries to delete a file named ".builtin-dtb.S" but the file
> created by scripts/Makefile.vmlinux is actually called ".builtin-dtbs.S".
> 
> Fixes: 654102df2ac2a ("kbuild: add generic support for built-in boot DTBs")
> Cc: stable@vger.kernel.org
> 
> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Nice catch, thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

