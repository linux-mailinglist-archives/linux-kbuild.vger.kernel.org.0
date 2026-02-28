Return-Path: <linux-kbuild+bounces-11491-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NZINC/wlo2ka+AQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11491-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Feb 2026 18:29:32 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7091C4E54
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Feb 2026 18:29:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45E343030D33
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Feb 2026 17:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E444233D9E;
	Sat, 28 Feb 2026 17:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VW5MidZW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE664315A;
	Sat, 28 Feb 2026 17:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772299769; cv=none; b=ml3YXZM+tCJe1Za43yLjSkMdkZWMUxOH23eDSp3y/CFxCf1npEkTDCnc4KFAoNz/6CGfkMVQ+xYeaKm2hM84ZBxsC3zdMeZhkJpnXvaXZMJ5YSBf4b2AIgT9iagqKgVGHC389FS4hmRfrlOqhEm1OY5OPwfgif9/zltkK7tGk/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772299769; c=relaxed/simple;
	bh=1l6KHwXEgtfxHia5hrfOcyDd++3EG0XjsSCjfOpNf8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3Nt0K0GFPGGCCDqVny93UW9ryQaqcE0bJuNfnvRfSorFdVQZhRs8MWxkRetFGew+YeBiZjlMMflvPrnAxayk73xtXeR+MDt7IRFDF3NBb+Owy1uDBQE0iykIu1eYQ8APVCe6bxdmI1cE+Ur632C/VbdYWi3gFTTDsOJtOUo1/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VW5MidZW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A76FC116D0;
	Sat, 28 Feb 2026 17:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772299768;
	bh=1l6KHwXEgtfxHia5hrfOcyDd++3EG0XjsSCjfOpNf8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VW5MidZWWs7yds9V1yUrycanrkpyg4QivdOk3m4xy61lh2F+52V0Ghwf8AVoIyI15
	 jUh3nMAqDn24u+6TggyKykqHTXa+17ZIU7iNBasSjVStDDAGorRomCslAe//8ymnso
	 pfSO/xZqoEdjes4ES1HXM6W+Vl6TQqjM1Bp9kVBKHtVrX5cIAbaz+/csVU1gzvC6UC
	 FlVTQw6Yk+GYoD5vwFmVIR/8AdPG0E6OtVIyQ2Hx/NWOd41JIpKKpB4XD1vkczMQik
	 o+o9WBs5FnmySsB7kXrshk/Cs2JjB+sjn+xg0FBv/dAMLoW8OyHvjiO0wHQMNvnHtI
	 51XP5z2JVKqeg==
Date: Sat, 28 Feb 2026 09:29:26 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Michal Suchanek <msuchanek@suse.de>, Rainer Fiebig <jrf@mailbox.org>
Subject: Re: [PATCH] kbuild: Leave objtool binary around with 'make clean'
Message-ID: <cwqd33ivhb55oyuzeajsqdosoa3oolq5edyyc3xg756wa3tu5m@p5m5mhzb7fue>
References: <20260227-avoid-objtool-binary-removal-clean-v1-1-122f3e55eae9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260227-avoid-objtool-binary-removal-clean-v1-1-122f3e55eae9@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11491-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jpoimboe@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8F7091C4E54
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 10:40:48PM -0700, Nathan Chancellor wrote:
> The difference between 'make clean' and 'make mrproper' is documented in
> 'make help' as:
> 
>   clean     - Remove most generated files but keep the config and
>               enough build support to build external modules
>   mrproper  - Remove all generated files + config + various backup files
> 
> After commit 68b4fe32d737 ("kbuild: Add objtool to top-level clean
> target"), running 'make clean' then attempting to build an external
> module with the resulting build directory fails with
> 
>   $ make ARCH=x86_64 O=build clean
> 
>   $ make -C build M=... MO=...
>   ...
>   /bin/sh: line 1: .../build/tools/objtool/objtool: No such file or directory
> 
> as 'make clean' removes the objtool binary.
> 
> Split the objtool clean target into mrproper and clean like Kbuild does
> and remove all generated artifacts with 'make clean' except for the
> objtool binary, which is removed with 'make mrproper'.
> 
> Cc: stable@vger.kernel.org
> Fixes: 68b4fe32d737 ("kbuild: Add objtool to top-level clean target")
> Reported-by: Michal Suchanek <msuchanek@suse.de>
> Closes: https://lore.kernel.org/20260225112633.6123-1-msuchanek@suse.de/
> Reported-by: Rainer Fiebig <jrf@mailbox.org>
> Closes: https://lore.kernel.org/62d12399-76e5-3d40-126a-7490b4795b17@mailbox.org/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> I realize that this will technically decend into tools/objtool twice
> during cleaning when running mrproper but I don't think it is the end of
> the world for a much simpler implementation.
> 
> I can take this via kbuild-fixes with a proper Ack or it can go through
> -tip, does not matter to me.

Thanks for fixing it!

Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
Josh

