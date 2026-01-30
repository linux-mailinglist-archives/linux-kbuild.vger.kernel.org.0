Return-Path: <linux-kbuild+bounces-10940-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Q9rlMTQFfGmtKAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10940-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 02:11:16 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 220ACB6140
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 02:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDEED300D156
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 01:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5AF329392;
	Fri, 30 Jan 2026 01:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MsH7ZjEU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F95C13B;
	Fri, 30 Jan 2026 01:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769735471; cv=none; b=YlYGD4HL0/5zgLyp0p1hZi/RoZqunpye5o5pLKbhDMbvWS0pBcmuR8d/eRP60o+dT6E8uBtF3u4ejXu95hAga1SFXj0lge4hnEDDzjdMMnhuh/gOEj/dzh2MuTCDCkXUh+KRHIgE4MCZThwYwIcYBNvdxrJhnY19RJ9wGq8ijm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769735471; c=relaxed/simple;
	bh=MCGRoXEe19uTdWcjXulM9d+Q3G3IJ60xDz5jSwLQnJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOSSENA3G1KTfmsmeOQcHrWYwMIKOXiNFNbUI9wqLKQ2oWjerArkMN1RaqyEMqIffP40cNbS5sf1lZincuGTqWayYPe96K5LfbT8D0zOu9s4V86ejhEOBckMD3apCwo5QdVrq+39TnozF7r8odUCkE26VYG7fEogg6EYgs5RjXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MsH7ZjEU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325ADC4CEF7;
	Fri, 30 Jan 2026 01:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769735470;
	bh=MCGRoXEe19uTdWcjXulM9d+Q3G3IJ60xDz5jSwLQnJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MsH7ZjEUw/GWuHR7Ue9Iqi2QKkypn6BADiDrJgrzrXnxWFGLOStxMxBtFvrDzhMGz
	 ZS8WuJR35RhoI0K07Ff0p4gDNM24dO5whTZInRYwJmabCCGpiOPx2TEkiD7PgTYwhh
	 CJfaBA5afYNgQf/Hq4jd2oGscDRYHBgr9J94iwbRa86Xzt6UwFwQXr2XjH048OaMpj
	 wjNXE63G/cHj+ozZ8fk0MPddEUF1RVZKyoc3pjy6eI+r/ULvn1MEVt7N1l7OzSHD7L
	 CsIv2FRkjm+ZtCbKwUPOy5cbWvoSMVuZhKEy4O0GqPkZ60xp3twkB5AlC9nYuRCdHM
	 L/E/gxALs5nWA==
Date: Thu, 29 Jan 2026 18:11:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rong Zhang <i@rong.moe>, Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] kbuild: install-extmod-build: Add missing python
 libraries
Message-ID: <20260130011106.GA359714@ax162>
References: <20260129175321.415295-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129175321.415295-1-i@rong.moe>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10940-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rong.moe:email]
X-Rspamd-Queue-Id: 220ACB6140
X-Rspamd-Action: no action

+ Jon, Mauro, and linux-doc

FWIW, this ended up in my spam folder but I saw it on linux-kbuild.

On Fri, Jan 30, 2026 at 01:49:55AM +0800, Rong Zhang wrote:
> scripts/lib has been moved to tools/lib/python recently. Since then, I
> got a regression while building out-of-tree modules with W=<anything>
> (1/2/3/c/e):

Hmmm, the W=<anything> bit seems wrong (or at the very least, c/e)... we
should probably change that to just being enabled at W=1 (but that is
tangential to this patch).

>   $ make -C /lib/modules/6.19.0-rc6/build/ M="$(pwd)" modules V=1 W=1
>   [...]
>   make -f /usr/src/linux-headers-6.19.0-rc6/scripts/Makefile.build obj=. need-builtin=1 need-modorder=1
>   # CC [M]  mod.o
>   [...]
>   # cmd_checkdoc mod.o
>   PYTHONDONTWRITEBYTECODE=1 python3 /usr/src/linux-headers-6.19.0-rc6/scripts/kernel-doc.py -none mod.c
>   Traceback (most recent call last):
>     File "/usr/src/linux-headers-6.19.0-rc6/scripts/kernel-doc.py", line 339, in <module>
>       main()
>       ~~~~^^
>     File "/usr/src/linux-headers-6.19.0-rc6/scripts/kernel-doc.py", line 295, in main
>       from kdoc.kdoc_files import KernelFiles             # pylint: disable=C0415
>       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   ModuleNotFoundError: No module named 'kdoc'
>   make[3]: *** [/usr/src/linux-headers-6.19.0-rc6/scripts/Makefile.build:287: mod.o] Error 1
> 
> Fix it by installing python libraries from tools/lib/python.
> 
> Fixes: 778b8ebe5192 ("docs: Move the python libraries to tools/lib/python")
> Signed-off-by: Rong Zhang <i@rong.moe>

Thanks, this seems to be correct to me.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Nicolas, do you want to take this via kbuild-fixes? This should probably
have a 'Cc: stable@vger.kernel.org' on it?

Hmmm, now that I am looking at -next, Jon's move of scripts/kernel-doc
to tools/docs/ in commit eba6ffd126cd ("docs: kdoc: move kernel-doc to
tools/docs") in that tree without adding tools/docs to this list breaks
this exact same scenario, right?

> ---
>  scripts/package/install-extmod-build | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
> index 2576cf7902dbb..a15de610afed3 100755
> --- a/scripts/package/install-extmod-build
> +++ b/scripts/package/install-extmod-build
> @@ -20,6 +20,7 @@ mkdir -p "${destdir}"
>  (
>  	cd "${srctree}"
>  	echo Makefile
> +	echo tools/lib/python # required by scripts
>  	find "arch/${SRCARCH}" -maxdepth 1 -name 'Makefile*'
>  	find "arch/${SRCARCH}" -name generated -prune -o -name include -type d -print
>  	find "arch/${SRCARCH}" -name Kbuild.platforms -o -name Platform
> 
> base-commit: 8dfce8991b95d8625d0a1d2896e42f93b9d7f68d
> -- 
> 2.51.0
> 

