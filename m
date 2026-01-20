Return-Path: <linux-kbuild+bounces-10759-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJPNIrsRcGlyUwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10759-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 00:37:31 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D9F4DECA
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 00:37:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 98E4050B167
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 23:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCE62D7DF6;
	Tue, 20 Jan 2026 23:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dwd.de header.i=@dwd.de header.b="sc+5iBCi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from ofcsgdbm.dwd.de (ofcsgdbm.dwd.de [141.38.3.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F377C3E95B5
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 23:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.38.3.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768951741; cv=none; b=FoHQiNyhCS0Eha62bDd4AwbglyU0Ug2Bp6hb/AkVBo7K7oW93JDY2SwJ50YLO7WejotGRXNxXmMd/rS4mIYtpuePAZeOJ2SHiNqXcz0H+n5Cc9/mR1CIgeLeVmB+nR4F6YSmvrlwcgaCxsTGg0qAjliEwuIP48Ny9U0NLN2ld2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768951741; c=relaxed/simple;
	bh=DlnIrOSvbgAaKVkLhTYWHOlbqKMs+O5zhj/ryI8BzDQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iyOaqWXHIOylW0W1QsTSlwjm4J1TlvawNe/oH9ewJtNAzw0fC+Yg3MD61Hdt9LewLaM038nIU0mG+G2ToM0SNkvPeI8dvIPz/FhRWZNoCe2o1JcJDSTFf+Lh960Qmfc4K2z1Oa74512K2/4XWAZ3NNeKircDJtbM8uogfJcHMow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dwd.de; spf=pass smtp.mailfrom=dwd.de; dkim=pass (2048-bit key) header.d=dwd.de header.i=@dwd.de header.b=sc+5iBCi; arc=none smtp.client-ip=141.38.3.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dwd.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dwd.de
Received: from localhost (localhost [127.0.0.1])
	by ofcsg2dn2.dwd.de (Postfix) with ESMTP id 4dwjxX5KSNz3vjZ
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 23:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dwd.de; h=
	content-type:content-type:mime-version:references:message-id
	:in-reply-to:subject:subject:from:from:date:date:received
	:received:received:received:received:received:received:received;
	 s=dwd-csg20210107; t=1768951264; x=1770160865; bh=DlnIrOSvbgAaK
	VkLhTYWHOlbqKMs+O5zhj/ryI8BzDQ=; b=sc+5iBCiRF0ApIsAT5w+MR2HqXK4n
	/evxSvGZOkKIffFtQdTbE1vvl2lFE0/R3/eJRnkSOi7WuZLqTyCW/5u48YRnbcpj
	zY2mhdhxJ6a3Jp4dNt0EioX+eKWNipLasht2Wu63VaJdRSE7fRUGkekXpdZeeAZt
	RH1AAWuo2kA2WFiQxY4Whpb9ygz29r1tTW8/XGld4YB9K9lXBlgrQzK48LHHg7/M
	VUalTm995x76RU24oTczqg0FCu2yLHAP80emk4FRajNA8fobPc2o+9CZpu8RqTVc
	1RaJ900pJD592d0W7KWSfEsqkjffDHvvjJKkDTFbuEPx69v0qZF0qtDFA==
X-Virus-Scanned: by amavisd-new at csg.dwd.de
Received: from ofcsg2cteh1.dwd.de ([172.30.232.65])
 by localhost (ofcsg2dn2.dwd.de [172.30.232.25]) (amavis, port 10024)
 with ESMTP id sQTIFgLMdhna for <linux-kbuild@vger.kernel.org>;
 Tue, 20 Jan 2026 23:21:04 +0000 (UTC)
Received: from ofcsg2cteh1.dwd.de (unknown [127.0.0.1])
	by DDEI (Postfix) with ESMTP id 78F07C902EE4
	for <root@ofcsg2dn2.dwd.de>; Tue, 20 Jan 2026 23:21:04 +0000 (UTC)
Received: from ofcsg2cteh1.dwd.de (unknown [127.0.0.1])
	by DDEI (Postfix) with ESMTP id 6D987C902EE2
	for <root@ofcsg2dn2.dwd.de>; Tue, 20 Jan 2026 23:21:04 +0000 (UTC)
X-DDEI-TLS-USAGE: Unused
Received: from ofcsgdbm.dwd.de (unknown [172.30.232.25])
	by ofcsg2cteh1.dwd.de (Postfix) with ESMTP
	for <root@ofcsg2dn2.dwd.de>; Tue, 20 Jan 2026 23:21:04 +0000 (UTC)
Received: from ofcsgdbm.dwd.de by localhost (Postfix XFORWARD proxy);
 Tue, 20 Jan 2026 23:21:04 -0000
Received: from ofcsg2dvf1.dwd.de (unknown [172.30.232.10])
	by ofcsg2dn2.dwd.de (Postfix) with ESMTPS id 4dwjxX2nWYz3vjZ;
	Tue, 20 Jan 2026 23:21:04 +0000 (UTC)
Received: from ofmailhub.dwd.de (ofmailhub.dwd.de [141.38.39.208])
	by ofcsg2dvf1.dwd.de  with ESMTP id 60KNL4KN024916-60KNL4KO024916;
	Tue, 20 Jan 2026 23:21:04 GMT
Received: from diagnostix.dwd.de (diagnostix.dwd.de [141.38.44.45])
	by ofmailhub.dwd.de (Postfix) with ESMTP id 362724531D;
	Tue, 20 Jan 2026 23:21:04 +0000 (UTC)
Date: Wed, 21 Jan 2026 00:21:04 +0100 (CET)
From: Holger Kiehl <Holger.Kiehl@dwd.de>
To: Nathan Chancellor <nathan@kernel.org>
cc: Nicolas Schier <nsc@kernel.org>, 
    linux-kernel <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, 
    Uday Shankar <ushankar@purestorage.com>
Subject: Re: Since 6.18.x make binrpm-pkg does not sign modules
In-Reply-To: <20260120000454.GA2366369@ax162>
Message-ID: <cd25c77c-94c9-7095-441c-b15939a0b4af@diagnostix.dwd.de>
References: <68c375f6-e07e-fec-434d-6a45a4f1390@praktifix.dwd.de> <aWFt34dkIvlu1EYI@derry.ads.avm.de> <71bc53a4-9b54-c15a-96e-23fb338ac71@praktifix.dwd.de> <aWLF4BwQemwIZMMp@levanger> <71934f81-c412-cdaa-421b-b3b599be756d@praktifix.dwd.de>
 <20260120000454.GA2366369@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-FEAS-Client-IP: 141.38.39.208
X-FE-Last-Public-Client-IP: 141.38.39.208
X-FE-Policy-ID: 2:2:1:SYSTEM
X-TMASE-Version: DDEI-5.1-9.1.1004-29710.003
X-TMASE-Result: 10--23.975600-10.000000
X-TMASE-MatchedRID: scwq2vQP8OHYORoYzU5thq5i3jK3KDOot3aeg7g/usCe9toQ6h6LE921
	17Mk9wKf2JeyH0P2ggEn8vlTiWGtMWA2IAXETeuKPPXTDKQFcUx+S5m2/8VLmmO0yVK/5LmcVXF
	z93jC3xfK0ztPApR5BhJ+INVehs+98Aj+/7+3oKUdZEkR8Y/meafV6VlwBmU0GUs9b7xvtJpLc3
	gy+5ZVuODyrhjfvMpNlUkw4BW0fduXBXaJoB9JZ/7E6GNqs6ce3QfwsVk0Ubv+efAnnZBiL6nKA
	IYoU8L4F5iXm5LZACA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-TMASE-INERTIA: 0-0;;;;
X-DDEI-PROCESSED-RESULT: Safe
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[dwd.de:s=dwd-csg20210107];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10759-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[dwd.de,none];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[dwd.de:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Holger.Kiehl@dwd.de,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,dwd.de:dkim,find-debuginfo.sh:url,diagnostix.dwd.de:mid]
X-Rspamd-Queue-Id: 15D9F4DECA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 19 Jan 2026, Nathan Chancellor wrote:

> On Sun, Jan 11, 2026 at 06:41:39PM +0100, Holger Kiehl wrote:
> > On Sat, 10 Jan 2026, Nicolas Schier wrote:
> > 
> > > A simple solution might be to call modules_sign target after the
> > > find-debuginfo.sh run; but commit 16c36f8864e3 spunds to me as if we
> > > should rather do something similiar as for the Debian packages:
> > > modules_install with INSTALL_MOD_STRIP=1 and then install only the debug
> > > infos manually.
> > > 
> > > Does that make sense?
> > > 
> > I am not a kernel developer and my knowledge in this area is very
> > limited. Did try your suggestion to call modules_install with
> > INSTALL_MOD_STRIP=1, but still the signature was removed in the
> > RPM. Removing the 'chmod u+x', so find-debuginfo.sh does not strip
> > them, did not help either. But, most properly, I am still missing
> > something.
> 
> I think one of the items added to __spec_install_post by commit
> a7c699d090a1 ("kbuild: rpm-pkg: build a debuginfo RPM") ends up
> stripping the modules unconditionally, not just when the debuginfo
> package is built, as this reproduces for me with your configuration
> snippet from upthread and x86_64_defconfig, which does not have debug
> information enabled.
> 
> I emulated commit 16c36f8864e3 ("kbuild: deb-pkg: use build ID instead
> of debug link for dbg package") for rpm-pkg, which appears to result in
> a functionally equivalent standalone debuginfo package (but I did not
> actually test) while fixing module signing for me. Could you give it a
> test?
>
Thanks for the patch! Can confirm with the patch applied, the modules
are now signed in the rpm package. But I also did not test the debuginfo
part.

Regards,
Holger

