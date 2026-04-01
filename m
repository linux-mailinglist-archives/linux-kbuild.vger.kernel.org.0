Return-Path: <linux-kbuild+bounces-12587-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6L8cBAyozWmvfgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12587-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 01:19:40 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AAED03819F1
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 01:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5FD93113A04
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 23:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385153EFD21;
	Wed,  1 Apr 2026 23:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9N3rMoT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78733F0742;
	Wed,  1 Apr 2026 23:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775084612; cv=none; b=XLPYrq2Py4GYUm3tEjtHxZy1UbM8Weer9mahvMN0SYB+NeSQY9+Zd/PKx/4Hvr14eJkRYsdSBDCarI+NXWqcV/4+OS+oXCgkNcKd2twoudWEQsxF7RsvL9CRlvR/IlKOO2mSJwluogjvi42bDKUj9Uj1EloIS2NnWOywMhNAqPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775084612; c=relaxed/simple;
	bh=bMMivyWks1RUpM5OMtjkhP0IRWxx0+GxfgfoBpHShLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XdoW/3Wa5kZuqEItTyd23lQ+jJpAeHp1Cowo94vNjUCo6NRE7C3o1UwLdqD2wolxye9yaihgBcD3j8rGnxRu2MDliQqGThGk3RNU3JQ6latEMTQTgzY/eEYcpZTVjwaWfeg/vqdbH8DRuyJO951UmnJ+9CSQce74KGc3g+3hqXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9N3rMoT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4658C116C6;
	Wed,  1 Apr 2026 23:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084611;
	bh=bMMivyWks1RUpM5OMtjkhP0IRWxx0+GxfgfoBpHShLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e9N3rMoTD+1qG8dh2/u8CvVe6Nt4/oKPipHOcx2jiOi/N2VexvxPv+LF6uEs7jBUN
	 Ud93k5YIHySI0uy1izpwNYQtG2EcfmYOXNThRmZmolc63EPTGOOwo7TgwvHutjNGxL
	 N59xfJohuLSbdLuBnSv4lmy4ic5zEpngxgJebAVr+3b05Q9Zx0m1kw3flLIoG1t+y3
	 /JxuIAvr27TapcF2vJ+tSKIXSDGcrti61fNYXlmHl+JA5rQG0iOIhEh76mjNxc2MV7
	 /lIMRcV3KZ/jD2f2ap1zY/Gd+RJOkKyOWz/zxnk+0RoHZD0iAKsU0eJ8kOzTmVvBcw
	 9XvFkA7kt1aAw==
Date: Thu, 2 Apr 2026 00:03:25 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] modpost: Declare extra_warn with unused attribute
Message-ID: <20260401230325.GA1076298@ax162>
References: <20260325-modpost-extra_warn-unused-but-set-global-v1-1-2e84003b7e81@kernel.org>
 <acwisFwJ3eMMQLIp@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acwisFwJ3eMMQLIp@levanger>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12587-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,google.com,oss.qualcomm.com,kernel.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AAED03819F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 09:38:24PM +0200, Nicolas Schier wrote:
> On Wed, Mar 25, 2026 at 06:20:30PM -0700, Nathan Chancellor wrote:
> > A recent strengthening of -Wunused-but-set-variable (enabled with -Wall)
> > in clang under a new subwarning, -Wunused-but-set-global, points out an
> > unused static global variable in scripts/mod/modpost.c:
> > 
> >   scripts/mod/modpost.c:59:13: error: variable 'extra_warn' set but not used [-Werror,-Wunused-but-set-global]
> >      59 | static bool extra_warn;
> >         |             ^
> > 
> > This variable has been unused since commit 6c6c1fc09de3 ("modpost:
> > require a MODULE_DESCRIPTION()") but that is expected, as there are
> > currently no extra warnings at W=1 right now. Declare the variable with
> > the unused attribute to make it clear to the compiler that this variable
> > may be unused.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 6c6c1fc09de3 ("modpost: require a MODULE_DESCRIPTION()")
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > I will apply this to kbuild-fixes for 7.0.
> > ---
> >  scripts/mod/modpost.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> 
> modpost is just used in-tree, right?  Can't we just remove the '-W' flag
> and the extra_warn variable completely?

We could but I figured it was worth keeping it around in case we grow
any other checks that we would want under W=1. Not sure what those would
be but the dead code here is minimal so it did not seem worth it to
clean it up just for this warning.

> Nevertheless,
> 
> Reviewed-by: Nicolas Schier <nsc@kernel.org>

Thanks!

Nathan

