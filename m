Return-Path: <linux-kbuild+bounces-13264-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO0YAjt/C2r8IQUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13264-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 23:06:03 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 719A1573A4B
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 23:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49E0B302350B
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 21:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C0E396591;
	Mon, 18 May 2026 21:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ndd8fkzm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3178A396573;
	Mon, 18 May 2026 21:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779138358; cv=none; b=d3ApOZBGb2GsGX0EIKLaL9ZE5ZguhHT3BRf62n4fzT48/QAsL3C1RMQylWrKhPzi42qSTAc+DNt/EUIGtSqSRAgFUsLBxs4poJqN8+TEXc4KAnbQYav4HK0jk6Rd6gxh4B4CfwnsJTYC1npJA6DSAOeDEXp+ynznB9yrIMP1w5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779138358; c=relaxed/simple;
	bh=KJU4Pz1uSq6DIJ3eWFe2ij4+hMv7Y2WX88sIUB6HKZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNSPgk0aLzjsMYpDLvKgcIAAdbeN3cDiY/4wHAxfWVTLD+z7NPKvdCD+0L4+YWjWDFLWjGRT1//nSSTwQJ4UkDCjILGphlCH9kED/es7R/dXG7qeRBpjm3XlXs8s8kbyeuOZZ9eSTbLYTjI6THNvWJKUvr+oMcz0iwo8OIuw+p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ndd8fkzm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8BDC2BCB7;
	Mon, 18 May 2026 21:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779138357;
	bh=KJU4Pz1uSq6DIJ3eWFe2ij4+hMv7Y2WX88sIUB6HKZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ndd8fkzmyskIs2Qdl3J7CkSceCEQ2VqBLBMLvxj5nl8ByZ0x3kwuVHnI4SMC9Euwp
	 TwbZVOof4lbBs9lxo9cFGheU5C/eLT0Y0GhsuyXz5JCXZO6eDMa7g9cw0Xl7Aqp9gN
	 d4XSn+UXio6Aq8TL/URGlRuHd2WICZg5SqrCpv+a1aEUNn58ISdt9OnvTQ+ZrwZU3K
	 r6qEQDN9RoEYUT1+bvWCgMXx+4RHR/aawtBAeSkvXVKpOhrTrAnBY+QQyys+ukGLP9
	 9cD3N1Ue9XeCrZlBbwRr74SWZwD/FYF9Usj9vTdIv9jNBnihlp5Y+duL79oD3/eiJf
	 9tq1HB7zI1ggw==
Date: Mon, 18 May 2026 14:05:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2 02/16] security/Kconfig.hardening: Remove tautological
 condition from CC_HAS_ZERO_CALL_USED_REGS
Message-ID: <20260518210552.GA3979157@ax162>
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
 <20260517-bump-minimum-supported-llvm-version-to-17-v2-2-b3b8cda46bdd@kernel.org>
 <55186588-0cff-4908-923a-d5611707a3b0@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55186588-0cff-4908-923a-d5611707a3b0@app.fastmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13264-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 719A1573A4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 09:48:47AM +0200, Arnd Bergmann wrote:
> On Mon, May 18, 2026, at 01:05, Nathan Chancellor wrote:
> > Now that the minimum supported version of LLVM for building the kernel
> > has been raised to 17.0.1, the '!Clang || Clang > 15.0.6' dependency for
> > CONFIG_CC_HAS_ZERO_CALL_USED_REGS is always true, so it can be removed.
> >
> > Reviewed-by: Nicolas Schier <nsc@kernel.org>
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks for taking a look!

> >  config CC_HAS_ZERO_CALL_USED_REGS
> >  	def_bool $(cc-option,-fzero-call-used-regs=used-gpr)
> > -	# https://github.com/ClangBuiltLinux/linux/issues/1766
> > -	# https://github.com/llvm/llvm-project/issues/59242
> > -	depends on !CC_IS_CLANG || CLANG_VERSION > 150006
> > 
> 
> Maybe add a comment to mention that this now requires gcc-11,
> that way we have it easier to remove the check when that becomes
> the minimum version.

Sure, I can add

  # supported by gcc-11 or newer and all supported versions of clang

when I apply it.

-- 
Cheers,
Nathan

