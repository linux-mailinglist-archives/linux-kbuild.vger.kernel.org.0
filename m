Return-Path: <linux-kbuild+bounces-12862-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULCNK3Mn62muJAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12862-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Apr 2026 10:18:59 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B18FA45B50B
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Apr 2026 10:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA2733003600
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Apr 2026 08:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF30B3112D0;
	Fri, 24 Apr 2026 08:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FJQiucfB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D5B347C7
	for <linux-kbuild@vger.kernel.org>; Fri, 24 Apr 2026 08:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777018736; cv=none; b=gckIUDOdRN5v/c+0tAYvsnMCRjJ1nS3OWmoHlqOhSf8uOS4xzp0xu08d1aV9rTyWfn/kzDELhsebUq/d8ngtybYgjZtTR9qfsEFn7qWsHnbDyQZiJzxWdxDu5dJRi77QxejM+ZE2hwZ1f/mOjBl31zKMBhMkmtUwpcM/5B9Upak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777018736; c=relaxed/simple;
	bh=UsRk4rGyEaHh2bp/xwdp1GFgam2mbMJ1+Dggg3ofEbo=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=oTF9lX19fRFytaBh1RpgpVt+PpIL5PTkC7F6x84IXl5NNeVEF1rU68y0VEj/InRKQ1NbISjR+6DdFOeac8e+5QNjo36kAD7Kg4ohp0mBioYSifrnWPNf+ATfZIZtKsmO4YwRQdsiIdBAPns00DUcwENY4ZLTQAQuBeezDnogN7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FJQiucfB; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g25T13J7Xz9srX;
	Fri, 24 Apr 2026 10:18:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777018725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=B+tcJK3oBh7Suw7pjFj/RWw6h7dePuECMBKTZz3y9KU=;
	b=FJQiucfB+dGSqJj5Ij8wDQjNfDfYyMbDaHZnOHpCMR2mL5oyjT/VGjz/WwCt15Ffc0FLsF
	G0qVtPp1gLkxTvb9UQ1ytb9FUzVXrzeMzrvwppne5j2vrFdWQKmNahQ8Qj+0CLpsbRHpQG
	sPnzWH4IPpw70WbHQhgsy5ekwYhOOT9Bi3OTH+GrA3SFAhe03qwHVjb81Aala+pRLlvOt1
	Fz/LX2o35mwbPG7Gf+bdeD5U3IS11gAr+MuPr0PGu+O4EsflHqkiPC80IZvdHxcXDJdQU/
	GXkznL+nivVTN7geXcn7uBqZ8K41THNOSK2vI5Ji0zdV1sZNtZi5cnhyUoWR+Q==
Date: Fri, 24 Apr 2026 10:18:44 +0200 (CEST)
From: torvic9@mailbox.org
To: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	"nathan@kernel.org" <nathan@kernel.org>,
	"nsc@kernel.org" <nsc@kernel.org>
Message-ID: <1896318894.249754.1777018724256@app.mailbox.org>
Subject: [QUESTION] kernel/Kconfig.hz: outdated help texts?
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-MBO-RS-ID: a2893233d680f9370d2
X-MBO-RS-META: ghn9j5ke9b3dztwjt3wseicn4wgieqig
X-Rspamd-Queue-Id: B18FA45B50B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-12862-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvic9@mailbox.org,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,app.mailbox.org:mid]

Hello,

I noticed that the help text in kernel/Kconfig.hz has barely changed since
configurable frequency of the timer was introduced in 2005.

Are these help texts still accurate 21 years later?

We have e.g.:

  "250 Hz is a good compromise choice allowing server performance
   while also showing good interactive responsiveness even
   on SMP and NUMA systems. If you are going to be using NTSC video
   or multimedia, select 300 Hz instead."

Is that NTSC/PAL thing still relevant today, in times of high resolution timers,
modern graphics cards, Freesync and high-refresh 4K monitors with 144 Hz?

Cheers,

Tor Vic

