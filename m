Return-Path: <linux-kbuild+bounces-13083-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAseCajQ/Wl2jgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13083-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 08 May 2026 14:01:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 418F94F60AB
	for <lists+linux-kbuild@lfdr.de>; Fri, 08 May 2026 14:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F109D300CBE2
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 May 2026 12:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F230A2C21D0;
	Fri,  8 May 2026 12:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UpIlZRtE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0EC2F8EBD;
	Fri,  8 May 2026 12:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778241694; cv=none; b=e7OvpTLu85X4e3Qy0jExN4XuPQDm/ZbIPje5cFSaajuE3pfg4DrhQCPmkJM1IVPqbcbBvt8Uh1hOx9uHRlSlDGzrdOIJhwHDIEqgte8fkBF9/H9olKEyty4rBYKsIDWnty2iA4cqkbtQvxZEOPhSHEWZoTCMr/dGXyq9TIhOTsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778241694; c=relaxed/simple;
	bh=9NM31fO9FQd5RvWwX3TjoTL03VPMKiocGJpXCMGBsIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uR5GY3e2RJzUVtleEJgrjFIxOKlmLLklWK+gCB8CZjP9EPMh0GHBjzqrLMG9S4bOsEaABquG6JIY5cXbmWRyeQWRPXmYCJfHgTl+9hA7nmri0BHuXC6I3fcq05WCEitYSPS2skjPco2VHLmP5pXGwFUMQqEJtPriijL0+AggiTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UpIlZRtE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915B5C2BCB0;
	Fri,  8 May 2026 12:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778241694;
	bh=9NM31fO9FQd5RvWwX3TjoTL03VPMKiocGJpXCMGBsIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UpIlZRtEy83sF5zf875hz1cRT5zIi79LuYwN9mwADz1IrQ3pcn8fcVTBBz+r7o/zX
	 dwAO942NRqSYE1diAbeoWcyESoEdzr5NzjgfcGD9DNcCXpc47QaDdJaNZbwuN/XvEW
	 rE6HB0GH2qc6Pwlv5+mxN1PvyQ7BR8dhchA2ddH+SxG7XXO0RYVgQk+yPxXYD/qttC
	 Pkeyq33j21YPwmh1CcXBXRdLB+XXXjoVCu73D9wy9z2dpzM+L6o0mAAo4IwV28MxXC
	 KF63VgtwAPS7qqw4HyCOkaz46m8azcp/1r24r6LigJbAs9JrQrjVGfV/RqzmxIQKtx
	 +ia3xZjyB0T9Q==
Date: Fri, 8 May 2026 20:01:30 +0800
From: Nathan Chancellor <nathan@kernel.org>
To: Jill Ravaliya <jillravaliya@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: propagate hook script failures in
 builddeb
Message-ID: <20260508120130.GA1145220@ax162>
References: <20260508102713.27678-1-jillravaliya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508102713.27678-1-jillravaliya@gmail.com>
X-Rspamd-Queue-Id: 418F94F60AB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13083-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Jill,

On Fri, May 08, 2026 at 03:57:08PM +0530, Jill Ravaliya wrote:
> Just following up on the v3 patch I sent on May 1st.
> Wanted to make sure it did not get lost.
> 
> Happy to make any further changes if needed.

Nope, it did not get lost, it is still in my review queue. I am just on
vacation for another week or so, so I am not picking up any patches
until I am back to properly test, review, and respond to -next
regression reports. If I haven't responded by May 22, feel free to ping
me again.

-- 
Cheers,
Nathan

