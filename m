Return-Path: <linux-kbuild+bounces-4481-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6E69BA27C
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2024 22:09:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB8B01F2255F
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2024 21:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF8D14AD3F;
	Sat,  2 Nov 2024 21:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="NOJI9szD";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="DopdRto0";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="U1/gfyC9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i702.smtp2go.com (e2i702.smtp2go.com [103.2.142.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE4D15539A
	for <linux-kbuild@vger.kernel.org>; Sat,  2 Nov 2024 21:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.142.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730581735; cv=none; b=taoRnuFSFct3cxAmUrrBeYRolquuSh7oJzjFMp6Pez+Hq/wIHR76BRz2nTQIw4r47CU2u9dsnD0PsfUYPqRPm/2Ye3u7va3Am9INsJBK7sTsJoi9WJlPHByEXRrTDytf37U1k2czv32fSnsxxJ404umhWj0joL9dqeDB5wJbdF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730581735; c=relaxed/simple;
	bh=HMMX2lwn+yWZONXGGimkqS5HF8zoQ+40TkCJJptfbKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2eGpPSBO18UHFrh+HdqXYlYbx/ERm3o6kpTK27obvB8zrD4VAfiOKf59w1lywyN3nGV5JKBSvHsVjEgZeLjIpZt03iKxgX7VJ6mbF2hqo0PHIaLcpxH1IpMboHXuGcLqQCdzstaH9msWBJ1ys7CCOo85v30ICPcIJTg7Y3wfOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=NOJI9szD reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=DopdRto0; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=U1/gfyC9; arc=none smtp.client-ip=103.2.142.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1730582629; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=Nj67AeiaPQEBqiINOFKnae9vYS4HDribcl5S/Fxqsqc=; b=NOJI9szDaWwG0D/Rn5Tp5iGW4I
	NgvuXmj1sNOwcEJ2E5SFg8t74/rCw9fRa4LjLlgS+IFC1Mi2/67PRY/G09eOJt8SPlHbltmHfAXq2
	mj/VOIgCOjEygyHK0+iaEywjJ/w2uYthz5rJQEjW8eR4dNoSf0JD9Am0bMT+R+KNTg5l39Rvki6su
	aMhsMFPG/wOkPpJmANms7LnOeN6wnwltEjna2LPoOi+2CKLd0r+8rOWTaa3+fBn4IW6mrTiD2hMeC
	oviYiZnd2yQ8OKoI9e/VqnzYFJzZCziWzEJDsrqnP3BNnSMjbSEmdfEA9zVOLv6fm8+wN9mJ9P8cm
	XCXfbUfg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1730581729; h=from : subject :
 to : message-id : date;
 bh=Nj67AeiaPQEBqiINOFKnae9vYS4HDribcl5S/Fxqsqc=;
 b=DopdRto0pUKibcvLDeRlRGfxWN8RiV5K/XXJGM5+cfeSB/0QfbQ/qFSsxJsVb+AwPyWus
 fR3DD4kQZQMCWoKNv3UgU+a/GIlJ5rB+3l/nBqOOSdlMWJjrMdIXP7NLljLK2J7i46lX4q3
 4i95dhwnajdR6MHyEPwBPy08mPZOo2UdtETcQMZyLbFqpFzEQBfltq49eQKNwfjIjRE+rLs
 2RU4bvwGg7kxRLcMWouKfFQ9UJZORzoihlJ30gr84DQlxxNOeydUsRjHJp0BdbRI7wOwFvn
 HE6Y4cP/80q4vUkBt/vwemqW+68PSSHKgtWZFl9Z0deF/3BQpDm4X0tjIoqg==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1t7LLi-qt4Dxk-5t; Sat, 02 Nov 2024 21:07:58 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1t7LLh-4o5NDgrgQ6c-mrPt; Sat, 02 Nov 2024 21:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1730581677; bh=HMMX2lwn+yWZONXGGimkqS5HF8zoQ+40TkCJJptfbKg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U1/gfyC9by+/nynTWwEi4kx+/FUmZVdzL0mM9vPznDEFHG9btvCjh6ZL+yrs2Tqks
 0l6d3Dt2szx2MQIpiKFDqgAcvP6wgWvFiRXYa+1peOb3LH+lD9nLqozP7OOcNyhLXX
 lHtoZw+RWntJDZWwiN0qqYSFeoOvYHMVuvOqCiX8=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 095B73D7A0; Sat,  2 Nov 2024 22:07:57 +0100 (CET)
Date: Sat, 2 Nov 2024 22:07:56 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Morten Linderud <morten@linderud.pw>,
 Haelwenn Monnier <contact@lanodan.eu>, Jann Horn <jannh@google.com>,
 Kees Cook <kees@kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-hardening@vger.kernel.org
Subject: Re: [RFC PATCH 03/11] kbuild: pass KERNELVERSION and LOCALVERSION
 explicitly to setlocalversion
Message-ID: <ZyaUrD6XC7PcPTSz@fjasle.eu>
References: <20240819160309.2218114-1-vegard.nossum@oracle.com>
 <20240819160309.2218114-4-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819160309.2218114-4-vegard.nossum@oracle.com>
X-IMAPbase: 1553198760 0000000191 Old
X-UID: 187
X-Smtpcorp-Track: 5VaGyLey9ui-.WxnWJTxQx2UQ.Qk0jZA54OUK
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286s-mEjfdzIe
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Mon, Aug 19, 2024 at 06:03:00PM +0200 Vegard Nossum wrote:
> These environment variables are passed when invoking 'make', but if
> running 'make -n' we need to pass them explicitly so they become part
> of the printed command.
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Makefile | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

