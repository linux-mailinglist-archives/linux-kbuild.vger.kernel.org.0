Return-Path: <linux-kbuild+bounces-13262-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCOIBcBvC2pXHwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13262-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 22:00:00 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D9D5732D3
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 21:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 070173010537
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 19:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45DBA3845D9;
	Mon, 18 May 2026 19:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="noAnUnlJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221CE382296;
	Mon, 18 May 2026 19:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779134122; cv=none; b=dF5L9T6bMYeAXcbSv6M9+d62eqM+ohUn7OGBdPa6F0HTbuP+QwqoQEgg/N1R8uQkJUVq84WMv9p3YQtHvANgkOHL19r/8E4ltjTLS570SA3dVrNFrctuH5OWxYBGlTtYqEBfCJCvwwSruLTJatP9XF2VD1MdB2NtJGGOFU9/1vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779134122; c=relaxed/simple;
	bh=+aWPUKcjSC8AMAwae4jIR05PzMIops+d3yj+IRkcHVg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=T8ur0FoINHA1fZZso8dZ3Y7mJi1qfieMCjIn1fJHqVpBBvt/fWhIfyOoJV+8iPO+4DWVvLvUcvAP/IOD5U0LLQltK40zx/Kikhg+w8239xdk2ifR3myzzczohKklAv3ETj7KnmrF7zIuGZUFHuK7RPNn7WpV9acbcz8WmtBt9IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=noAnUnlJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 864B9C2BCB7;
	Mon, 18 May 2026 19:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1779134121;
	bh=+aWPUKcjSC8AMAwae4jIR05PzMIops+d3yj+IRkcHVg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=noAnUnlJF1Tm95DxtEnvjV7eQopY+bpcHnb7NFtG1jhOZqB45ejGAgSzg8ax1VX5r
	 1wArHtCnSRv87p2kKPFa1XFi/PdKDRRzrfqWoKwbe9kT3H0YRZqcjcuxlcSHyWnC9k
	 76qS+LyzJNhMmixsxGcTTmYwEWyhce/Uh0UDb2CE=
Date: Mon, 18 May 2026 12:55:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Nicolas Schier <nsc@kernel.org>, KBuild
 Mailing List <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Sasha Levin
 <sashal@kernel.org>
Subject: Re: linux-next: manual merge of the kbuild tree with the origin
 tree
Message-Id: <20260518125520.04a0f320f91588ee0af9e940@linux-foundation.org>
In-Reply-To: <20260518192808.GA2884150@ax162>
References: <ags6FtowWAeGPoEN@sirena.org.uk>
	<20260518191337.GB2318678@ax162>
	<20260518192808.GA2884150@ax162>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-13262-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[linux-foundation.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux-foundation.org:mid,linux-foundation.org:dkim]
X-Rspamd-Queue-Id: 87D9D5732D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 18 May 2026 12:28:08 -0700 Nathan Chancellor <nathan@kernel.org> wrote:

> > Thanks for the heads up! The resolution looks correct to me but
> > dc1f85a9637cc does not appear to be in Linus's tree? I would have
> > expected the Kbuild tree to have it if so since it is based on 7.1-rc1.
> > 
> >   $ git describe --contains dc1f85a9637ccd3d171fb5262fd38919dfe632bb
> >   Could not get object for dc1f85a9637ccd3d171fb5262fd38919dfe632bb. Skipping.
> > 
> > It looks like it is in one of Andrew's trees? I just want to make sure
> > for my notes to Linus.
> 
> Hmmm, it looks like Andrew actually dropped this series a few weeks ago,
> as Sasha sent a new version:
> 
>   https://lore.kernel.org/20260427171749.9068CC2BCB4@smtp.kernel.org/
>   https://lore.kernel.org/20260504153401.2416391-3-sashal@kernel.org/
> 
> Is this because you used an old version of the mm tree?
> 
>   https://lore.kernel.org/fabba1ab-ceff-429c-af55-92844b179890@sirena.org.uk/
> 
> Not that the conflict won't come back with the new version, I just want
> to make sure I have my ducks in a row.

Sasha's kallsyms work is a thing-in-progress.  I don't expect to be
re-adding it for 7.1.

