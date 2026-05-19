Return-Path: <linux-kbuild+bounces-13282-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8g96Bdn1DGolqgUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13282-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 01:44:25 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6124B586173
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 01:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBBB730107C8
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 23:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF38371D01;
	Tue, 19 May 2026 23:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="skYMC8zQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3220678F2F
	for <linux-kbuild@vger.kernel.org>; Tue, 19 May 2026 23:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779234261; cv=none; b=tifThVLziaLSr6sTgHKYSa+zZ2a4E4hfd5qX424sAlILpEZwbERPq50MP0sUdajjlNCt4GZ0etKl5yEPV/2a4O+zFZEJB7j6qZh1QfL1cRixh9wTDdlOP8nWjOMUfPdELG2oKD+GHJ4ot+q66sbBBeLPhGvICW3Rha30hC3vUpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779234261; c=relaxed/simple;
	bh=gYEAPIIMng+sjt7ZpLKClJ1pkgbCUA85k7YvIA2dUqg=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=bCqLObYa5kmrd4RBhRCHKmtj/v0JpROl32L/n3kT5wOL/jNGikeuob55Dw6po1UixZzSc9EY2sASgbaz8r9XtMzyhFU6sTUajmElYNsZWuI9w6HL8ubPfza5BikPtbsNsQAKsaxavxKnnc9MYKnUQ1/gG0IV9r2iMwEN+RQ12DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=skYMC8zQ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=0NUhGViaRMa6aa9KZGUR1bI8iiYuZTi0n+tAj76Kjfo=; b=skYMC8zQwF0BCmMgxyHx5FuR52
	RfCmwLdSKM0H0ARhJjA/Hv7YSS281YE5e4lJ7c/4nyM5HTROk1b/rzMeQe/PpNZJ/aAB8ykQXOIp6
	f2nj3kqH5G6YloI7S7pR1e/RySvFhGm5V8ycMISx4JOvgEzIq6Bv24K80AdgGR5s8PLwZDR6FlnoY
	aSFvlIx8gVerM5Bni6exEQnnu9Zy282D/K4xWUyvLHKjthTiuffmfDPI52nuV2AVGcpKDTW4HIcvF
	B+T49uXpuwYr4LVZqklBlM3P8fxES2AueEbXt26SK91JUKhsBF3E7HOzfuSbq+GH3s/fLfzh24m7j
	Ic1MCaMA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPU6k-000000035Nk-0XAu;
	Tue, 19 May 2026 23:44:18 +0000
Message-ID: <fabfda76-612f-4572-8871-931619a56ea1@infradead.org>
Date: Tue, 19 May 2026 16:44:17 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [report] xconfig/qconf issue in one submenu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13282-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,infradead.org:mid,infradead.org:dkim]
X-Rspamd-Queue-Id: 6124B586173
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


[This is a note for posterity, in case we have someone who can fix
Qt apps, specifically "make xconfig" (scripts/kconfig/qconf*).
Of course, this may just be something that is specific to the
version of Qt library that I have installed, but let's hope not.]

I have only seen this issue in the menu tree for
  Device drivers -> Input device support -> Joysticks/Gamepads

(If you are not familiar with xconfig, you need to double-click on
Joysticks/Gamepads to see its submenu.)

It may have something to do with the length of the submenu and how it
fits into the available window (size), but that's just a guess.

When I change an entry (using a mouse click) on something in the
Joysticks/Gamepads menu, the entire menu is rewritten 2 times, with the
second "writing" following after the first one. The option that I just
changed (clicked on) is correct in the first submenu list but it has
its old (previous) value in the second submenu list.
Wow, it's even wierder that I thought. Each time that I click on the
submenu entry, the list grows another complete submenu list at its end,
so after 4 clicks on the (first) submenu entry, the submenu list is
presented 4 times, but the value [y/m/n] of the menu symbol is not
correct in all repetitions of the list -- after 4 changes to the
menu item, the 4th listing of that item shows its original value
(N or off for a module), the 3rd listing of it show M for the module,
the second listing shows Y or builtin for the driver, and the first/top
submenu listing shows the driver config symbol as off/n.
If I click on some other menu outside of the Joysticks/Gamepads submenu
and then return to the Joysticks/Gamepads menu, the problem is gone.
Rewriting the submenu in the menu window is done correctly.


I am using the first submenu entry (Classic PC analog joysticks and
gamepads) for testing but it appears to happen on any submenu entry
in my testing.

The repeated submenu entries at first don't appear to be active: if I
try to enable one of them (as M/modular e.g.), the submenu box is not
updated **in the repeated list**. However, it is updated in the primary
list entry, so it's just misleading and confusing and not nice.

I'm testing on Linux version 7.0.9 FWIW. I will make a bugzilla entry
for this is wanted.
I'm using Qt6 (6.11.0).

-- 
~Randy


