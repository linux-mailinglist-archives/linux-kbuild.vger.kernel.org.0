Return-Path: <linux-kbuild+bounces-13931-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jt4ZAQNpSGrZpwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13931-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 04 Jul 2026 03:59:31 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C52706647
	for <lists+linux-kbuild@lfdr.de>; Sat, 04 Jul 2026 03:59:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.alibaba.com header.s=default header.b=jOLkkEqz;
	dmarc=pass (policy=none) header.from=linux.alibaba.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13931-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13931-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3F803027960
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Jul 2026 01:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF759372B27;
	Sat,  4 Jul 2026 01:59:15 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38926150997;
	Sat,  4 Jul 2026 01:59:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783130355; cv=none; b=qny7DuvXiwdTGTj36bbaXRdduWKWBqtq7TcVDLr7qQwjaA6IMzwkTg8zHfxR19a52F/ILhJJ7EJ/TtXdZgzotADp4kAEUQ3NROBUqqiXUTGrIDsIJIpdwOeBCYgM3IsedXFTcgjxTnsX1iUSQ8zEg2Xvo/+W6YJ7vXI7q5RT1rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783130355; c=relaxed/simple;
	bh=/2mJWVfJjfkfle0EVwSRjRz/Tdc1zDZfT9UWeRyszhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/iS0jOBrRE4TWinQeY9H2dYvYwPI7lDbWIS4Phn/tKUjAfX8B3W0b2YfvGi4lZ2ddYfYTYYeNUmao5DUlJreB0HIqffLsWSp7MTbAVdXhK5ZwyYHKRspz++w0oowsxvJxoi1Rg0nhpaEEIabPfFIqjIT8F9Wqcuz2Dxo7e36IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=jOLkkEqz; arc=none smtp.client-ip=115.124.30.119
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1783130343; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=ODlSjJH8+4SRzCaSNrFMVGFA6u+Rs1hlD97twS6n6t8=;
	b=jOLkkEqzlo+SeD/rRsm9PQ/VOFIqLVL3MIFC1jYLXukbBr5m+wXlsKZv1THh+CcgHDAxyxE+slkyS5szod7j98oWg5Nsor20ia881DM/ty7dC+dRSWgf0yk1v6Kno5aiB4dblD6O79mNU+M+RFIVLAqANzRrTAknpIuAUGkFeeo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=zelin.deng@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X6KR50J_1783130342;
Received: from localhost(mailfrom:zelin.deng@linux.alibaba.com fp:SMTPD_---0X6KR50J_1783130342 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 04 Jul 2026 09:59:03 +0800
Date: Sat, 4 Jul 2026 09:59:02 +0800
From: Zelin Deng <zelin.deng@linux.alibaba.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>,
	live-patching@vger.kernel.org, shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] kbuild: unset sub_make_done before calling kselftest
 build system
Message-ID: <akho5uXVYWGOI5Y2@tdx.gnr>
References: <20260703-makefile-unset-submake-done-v1-1-6899248f3d6a@linutronix.de>
 <akdx6xWTuv5Ga0YY@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <akdx6xWTuv5Ga0YY@pathway.suse.cz>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-12.16 / 15.00];
	WHITELIST_DMARC(-7.00)[alibaba.com:D:+];
	WHITELIST_SPF_DKIM(-3.00)[alibaba.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.alibaba.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.alibaba.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:pmladek@suse.com,m:thomas.weissschuh@linutronix.de,m:nathan@kernel.org,m:nsc@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mbenes@suse.cz,m:live-patching@vger.kernel.org,m:shuah@kernel.org,m:linux-kselftest@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[zelin.deng@linux.alibaba.com,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13931-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zelin.deng@linux.alibaba.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.alibaba.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,suse.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,alibaba.com:email,tdx.gnr:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 63C52706647

On Fri, Jul 03, 2026 at 10:25:15AM +0200, Petr Mladek wrote:
> On Fri 2026-07-03 08:04:08, Thomas Weißschuh wrote:
> > The kselftest build system may recourse back into kbuild when building
> > test modules. In that case kbuild needs to parse the new flags passed
> > from the command line, instead of using the ones inherited from the
> > kbuild invocation.
> > 
> > Force that command line reevaluation.
> > 
> > The same was done for scripts/install.sh in commit 14ccc638b02f9ec
> > ("kbuild: cancel sub_make_done for the install target to fix DKMS")
> >
> > Reported-by: Zelin Deng <zelin.deng@linux.alibaba.com>
> > Closes: https://lore.kernel.org/all/20260525083721.27857-1-zelin.deng@linux.alibaba.com/
> 
> It is great that you added references to the related commit and
> the original thread.
> 
> > Fixes: c9bb03ac2c66 ("kbuild: reduce output spam when building out of tree")
> > Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> 
> I believe that this is reasonable solution:
> 
> Acked-by: Petr Mladek <pmladek@suse.com>
> 
> Zelin, could you please provide your Tested-by, please?

Sorry for late response, I just started a vacation.
Sure I had verified, and
Tested-by: Zelin Deng <zelin.deng@linux.alibaba.com>

> 
> Best Regards,
> Petr
> 
> PS: I could take this via livepatching tree. But feel free to take it
>     via kbuild tree. I am going to wait few days until the discussion
>     settles down.

