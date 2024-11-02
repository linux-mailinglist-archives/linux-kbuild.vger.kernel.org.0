Return-Path: <linux-kbuild+bounces-4478-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F4F9BA27A
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2024 22:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49A6CB21D89
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2024 21:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1898A1AB513;
	Sat,  2 Nov 2024 21:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="OnVfdRUs";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="mJY5rxDp";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="mPxG+ZlL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i702.smtp2go.com (e2i702.smtp2go.com [103.2.142.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A19314AD3F
	for <linux-kbuild@vger.kernel.org>; Sat,  2 Nov 2024 21:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.142.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730581723; cv=none; b=XU9fIvYSICV0/+GnTtPjn7fLomFrmz7xzOxg6XwD0hIsvuNGeuaWWpOhtN8Sp56ZQVDW6pNwPq8nCMMmy+r6BnzmcUfOLr8TeohIpb0pybeIVt7E5XUi3atWyNfUY9g0mrd9v2yO9wVJJn7Qc8f0jlDQYL+xd0fLPatWt1vS9dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730581723; c=relaxed/simple;
	bh=cO3hWwEfMbIltEmTMaVHnNGUQNtuqAECidpRtsXGisY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KoWHqB2LXjaRpCB3N6T8hdBFJvErP8xBDGLZ8PrJVApo3B46PibtAouXGheyT4Ya4XRA3HGxBUh0K0RbsciqOBmlxoYdqp03QIzKwUio8Z0D8YiHgEVm/ukffOi1WQyxwRfJknepNxQEfXNY1ku5Pl1cUpwZjEPDqxTmm3J3NU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=OnVfdRUs reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=mJY5rxDp; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=mPxG+ZlL; arc=none smtp.client-ip=103.2.142.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1730582617; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=9ZmCQYZczcI9y3SOgBFfGiOqtjWhS7FouhMbjAYAatI=; b=OnVfdRUsyqJtPIhUqDiSP8yMCe
	Z0NS7k0Ju5t4ZIN7Orehm3KbJHG5e0HjfOpKRAuMzUh0YgAgNiPxhIGobxgnygThjQh0G3i2GIO5S
	rd7oC9Ao6RloWSEngWhX53jq5gyaz6CT5T+ida+7n4aFNZc70CB5DIjPtOUbQX2A2gRVRbdp6aV64
	XqEw9IcCIpyqjZ2MObqGdrroQXCuwAG7wtHDwUXkYST7xwWFq8wOiWSRzWbtPcZ0CThe96OypIu+5
	HnQeH5jwOJGsgKLAxYpc9PqgVp/fnuS5FbaAEIHCt75XtRnwgmOo8Z/Kla9dbIoxK4GLxTAq27YOl
	isNKBLRA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1730581717; h=from : subject :
 to : message-id : date;
 bh=9ZmCQYZczcI9y3SOgBFfGiOqtjWhS7FouhMbjAYAatI=;
 b=mJY5rxDp0vQaCYRVNz4e+NgsgMWtn+u4QychY3BPY73gmQl4zA7We3qGaNQ4X+TAtXL39
 LBEkWekdsrM2rl5r6APK42bDde5d8S07tZM0O6q+ehlmAu4mKtWQKt9IBuFz2EDMsjZ2sNu
 eBdRrKunl8GQQzr6Owna59uNgEms9bavLwPgGRt295VFE4VKvQvtSE4c36to2qIvv68MlJh
 gOKe9CbyDtgn8pDfb4KwO3cdQ4DbCWvIloZ4akqXxC+gfST+ovJmzhDIqSPNHEXY8N2+/n4
 SN2MUA0ApPJ8z0hs5jvUomFDuGlCyM198mVoVeeM5D+f+cyFvbvKTKqpsctQ==
Received: from [10.172.233.45] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1t7LLK-qt4Cyy-OZ; Sat, 02 Nov 2024 21:07:34 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1t7LLJ-AIkwcC8v3at-K04Z; Sat, 02 Nov 2024 21:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1730581648; bh=cO3hWwEfMbIltEmTMaVHnNGUQNtuqAECidpRtsXGisY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mPxG+ZlL8bqGVknfqLdujlUASDBOQOdY8DG/4aZk22nnZVSafWjWDXp6ynN6fA6CN
 a/A5iyF5W6+2iwPEOxmcX9hgZ1z1sXPxKFG7pjOqRSyOGv4fvnyRAg7RhXEmFkdLHZ
 DQmWUllQlzwjQNNE602/pGND8odpJiRjI22kx7sA=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 4186E3D7A2; Sat,  2 Nov 2024 22:07:28 +0100 (CET)
Date: Sat, 2 Nov 2024 22:07:28 +0100
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
Subject: Re: [RFC PATCH 01/11] kbuild: ignore .config rule for make
 --always-make
Message-ID: <ZyaUkK57P4sL2uqm@fjasle.eu>
References: <20240819160309.2218114-1-vegard.nossum@oracle.com>
 <20240819160309.2218114-2-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819160309.2218114-2-vegard.nossum@oracle.com>
X-IMAPbase: 1553198760 0000000191 Old
X-UID: 185
X-Smtpcorp-Track: i_mSRHzwR7AB.TKPenFMvXE7g.uC8b4Q91GQ8
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sJea5VhC7H
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Mon, Aug 19, 2024 at 06:02:58PM +0200 Vegard Nossum wrote:
> Before this patch, using 'make --always-make' would always result in the
> error message about the missing .config being displayed.
> 
> Detect the -B/--always-make flag and leave this rule out, which allows the
> rest of the build to proceed. See [1] for an explanation of this particular
> construction.

Nice catch, thanks.

> 
> [1]: https://www.gnu.org/software/make/manual/make.html#Testing-Flags
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 44c02a6f60a14..f09c036daf2f5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -757,6 +757,10 @@ ifdef may-sync-config
>  # because some architectures define CROSS_COMPILE there.
>  include include/config/auto.conf.cmd
>  
> +ifeq (,$(findstring B,$(firstword -$(MAKEFLAGS))))

As we still also support make v3.80 to v4.0, please use $(short-opts)
defined around line 27.

> +# This is a dummy target, only meant as a help for the user invoking make.
> +# We don't want it to take effect when running 'make --always-make', since
> +# that renders the --always-make option effectively useless.
>  $(KCONFIG_CONFIG):
>  	@echo >&2 '***'
>  	@echo >&2 '*** Configuration file "$@" not found!'
> @@ -765,6 +769,7 @@ $(KCONFIG_CONFIG):
>  	@echo >&2 '*** "make menuconfig" or "make xconfig").'
>  	@echo >&2 '***'
>  	@/bin/false
> +endif
>  
>  # The actual configuration files used during the build are stored in
>  # include/generated/ and include/config/. Update them if .config is newer than
> -- 
> 2.34.1
> 

