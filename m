Return-Path: <linux-kbuild+bounces-10851-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kD13EN8HdGmE1gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10851-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Jan 2026 00:44:31 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9870C7B86B
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Jan 2026 00:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A2913012C5A
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 23:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766572D8375;
	Fri, 23 Jan 2026 23:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhudsJex"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539992D0C9D
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 23:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769211862; cv=none; b=c2bgBaxtKzKcFAN65N8MHPlev0fZ7VgxIW/CZb11GI6YfT8/JNOQX5yAJttEmuGxNDnUNhCJ3Cc077Q8MJQReixmo7InL5WIoMbEiqRo0+fdwQuy+R+7H6UR8TMvettLt024HKJCDybbcE0KINfvkzMHpOzDosCnhFGz+B3bxNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769211862; c=relaxed/simple;
	bh=toInX229Ipp2Ilrm47nhxbMmjaJsSkOiZXx+m3QTsXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDDiGxGh/DEjeR6JgN+kRLPqi5W+iJNBTSUHqu2PxdReQo5XCBa8q99xY3FW7J03+yuuSvMdsLVZqL1tcgZlMWNIyew/WPd7mcEskAzeKjPvR0K0aw5lhLc3At7UsWHck/546wCLGxL7xtIOIes1nuBw3TdDAzLEpdY9EpW2c5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhudsJex; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3200CC4CEF1;
	Fri, 23 Jan 2026 23:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769211862;
	bh=toInX229Ipp2Ilrm47nhxbMmjaJsSkOiZXx+m3QTsXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NhudsJex703W5ciuFMBSYyW73l78LLSKyBePYObRqt+Rt5cf6U+I+Qpb5TyFkgIWq
	 LXwo9G9bzFdcN8efgf+H9GMMT2djRlDsYqkaZzuS8ParLXQiSrpmKKXXqWx1BtQpOn
	 RMUJozxjRom4N1uO1LoXKpYnU+4+fkAHwbdQ3VexabFEl/24MaFfPYlDfAX02eIxGY
	 lQ2/ry/cSkMpgNcHi6DCHLmmWcgtXzaXTvQyUMlFMLqlWbL3ozbJfQJVBmcQ4wu6/l
	 Vv6zpz3IhtvsoTGJ2Zf2uooIMrFpyJgohlOMiRtiSQL8Q/B+MYGJ6ca/bXDXsAVaQu
	 Dj/YkHh61kDow==
Date: Fri, 23 Jan 2026 16:44:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Song Liu <song@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Subject: Re: make olddefconfig surprises
Message-ID: <20260123234418.GA206716@ax162>
References: <CAPhsuW48m9pPbKsiiNDnagrtF2vLYwHSZWUASirhFKgUSVrzQQ@mail.gmail.com>
 <20260123205359.GA95167@ax162>
 <CAPhsuW5XfLkAkEWVosGQFhgKj4f_Fez0G0fsT_6D1dbZuudr4w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPhsuW5XfLkAkEWVosGQFhgKj4f_Fez0G0fsT_6D1dbZuudr4w@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10851-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9870C7B86B
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 02:54:27PM -0800, Song Liu wrote:
> I think in many cases, we use selftests/xx/config as the base .config
> and run olddefconfig on it. This is how I got confused in the first
> place.

Okay, that makes much more sense in light of everything! I would expect
that to work but only if the dependencies of all the required
configurations are also included in the files.

> I guess the right way to achieve the this goal is:
>     make defconfig
>     ./scripts/kconfig/merge_config.sh .config selftests/xxx/config
> 
> Actually, from my simple tests, this is the same as
>     make defconfig
>     cat  selftests/xxx/config >> .config
>     make olddefconfig

Right, I believe those two are generally equivalent. merge_config.sh
becomes more useful as you have more fragments to merge (one recent use
case for performance improvements to merge_config.sh has over 100
fragments to merge) and helps avoid some "redefined" warnings, IIRC.

> It appears merge_config.sh and olddefconfig cannot figure out
> dependencies, so we need to do it manually. For example, if I
> want CONFIG_LIVEPATCH=y, I also need to include all the
> dependencies in selftests/xxx/config:
> 
>     CONFIG_FUNCTION_TRACER=y
>     CONFIG_DYNAMIC_FTRACE=y
>     CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
>     CONFIG_LIVEPATCH=y

Right, that is exactly the issue here: if certain configurations are
expected to be enabled after these files are used as standalone bases or
merged into other files, these files need to have all of their
dependencies included as well.

> I haven't figured out a way to include all the dependencies
> automatically. Did I miss something?

I do not think something like this exists (maybe a SAT solver? :P), at
least not as part of the kernel tree. This is basically the same thing
as not being able to turn on a configuration in menuconfig until you
have gone through and enabled all of its dependencies. I personally use
menuconfig when trying to create a configuration fragment for minimized
reproducers on top of defconfigs because it is easy to see the final
diff when everything is switched:

  $ make defconfig
  $ make menuconfig
  $ git diff --no-index .config.old .config

You could start with defconfig or a more minimal configuration like
allnoconfig depending on how the selftests config is expected to be
used (as a base or merged into other configs).

Cheers,
Nathan

