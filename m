Return-Path: <linux-kbuild+bounces-13082-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIHbEI+6/Wm4hwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13082-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 08 May 2026 12:27:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE2D4F5027
	for <lists+linux-kbuild@lfdr.de>; Fri, 08 May 2026 12:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E5F7F30071E9
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 May 2026 10:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77AC38236A;
	Fri,  8 May 2026 10:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rr22rpyj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F0D37C110
	for <linux-kbuild@vger.kernel.org>; Fri,  8 May 2026 10:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236044; cv=none; b=IC6ZCHxNEw+VgIGz7x6TIzuJ5YFpHqboiEhHnnJJg5Etn53+v5sMbRH+dEHcXbjf7/QXmvAy0VKK8rCkSPod+xixrsLCfnBq++OYTq4A6MIWX92v/vuvP65FuqqfO4Ylp6YQK6qF/9xVK4aJclvq9GeP5LnVRy3peqtvtJoGIAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236044; c=relaxed/simple;
	bh=r2KoCmoztaSvCNNFvMsvg10ZUzlTUEv67WMZk3NMvU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uCUZTH73gVkmioL7gF34qr7Q5BsYha2nOFVoIs4/K0FslkEyG4BgRNfWozblpIuE5jyQH5DH2jq4vVCsdduIWBkrDr8Hy/l0ZNXXhDIqTJfJHc8dFbU7iF53aE/r2upRtPHdCuoiEjEd/iAXStZ2L17rIDFX2opzlEZ7Y6xqROQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rr22rpyj; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-83538fbd0b2so761558b3a.0
        for <linux-kbuild@vger.kernel.org>; Fri, 08 May 2026 03:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778236043; x=1778840843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r2KoCmoztaSvCNNFvMsvg10ZUzlTUEv67WMZk3NMvU4=;
        b=Rr22rpyjNKfec6xo2i/NuImYF2Ju9Wns9fEWUXurfM4HAG0rsc1smKx7j5waUnBNVA
         LtvZ+4spuhEllHNQEpoFkgMCMz9fUcKJXpQa8G41R+JSKFK6+KCrpFpTRW3vlfZfdHS9
         BfsCpP/o1cJEagw1a2ySQcjYAQqBJfiSfR/HdA4YI9fMJcSEGTv36yjGgrUsgpymVP2t
         pAACLhjxdSWaaZwEqfqGGB7zpBdrh4k1aJwFQUaOi6KP9dhnrtgdQJRnMjUxh5ubac3v
         bZh0VlOOFXyHK/7HZU3L2/bv9vxz3u5JTfTh3MCx8Fu7p5bi2/o2r4O+xr0oW55tLXdH
         rM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236043; x=1778840843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2KoCmoztaSvCNNFvMsvg10ZUzlTUEv67WMZk3NMvU4=;
        b=qSbnIzu/FASI5eCs7qk1zeuZi+cMpidzuinEoV4JCiH0ANKu+Pqx6lqoXoqRgdq6FS
         Zu1AaZDops0aUe5uS2RQ7hp8NSqKGV6ky4wtMFy9oQMZ5qEpYjslE3zAanmxx2l9MYMK
         793wxzndmSnMFFt72sH2XkRos5dorEh3A0pFA4l1Dcd+nt1EH3/N6zyR1vTRSlgN1e67
         WvUWGE6offYMGkonQaL6KsM0zysxMQW7Xj8eju0ScdRJg61yArqlayLdmKLUPup9pbq7
         abC1jBx8/WfdMAkiWJiFJBR8IbQPl5O2j96SVvNkHs6JXibdYqIoHaAG0EwFnOsLcv9P
         stuQ==
X-Forwarded-Encrypted: i=1; AFNElJ+fky6SeTKT+tlyrb/r3UUwDBKN8HimH877qxbXbOdnNsbx3051HfaUJI1wEC8Gq3iMbN5YFSsH4VMkWOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYaHR7W2PXoTSz96nXtzWnbOCTYg05Z6ITvRWD3ZYhmOaE7nYw
	sita5dL64RwOzEjJ+82bZ97ezQu36pH7gQNtI+maJTUtj7wdTucx4ybh
X-Gm-Gg: AeBDievKaaiyKR0m7Abg21aK69069icNorjJlDXu17dETbTEL0HpeJp8AvTqaFI/DZ0
	RfVJXLyk4tHX5sDf5BB1OZx+UyLwaGnbC7jMrwgColRxwGkNyfNPkY9ocewfX/pTjgXdksPQrtv
	3ThaNNGyvDAz1ejmmsgR1LKsmclSFJruwhrEWluZ9VwPemKy7l6Bti147i1swP9R4k1GJfy7h+/
	DKDrpz6k1t622p2mb8IEYGode8tTQk1VMd5u1L1NOaS/zHLTX9G+8Aau85+3ww4fFP8XIug4XoA
	AgF4djQJ80/IUIPb6wJaY83YCQmKB97qZiLifwG9kmX3ilChwEeMPCLIfncP8XiYi+o29hns+XE
	9KxhHzQJjDySUzsiHK31sxdR90bnbnSCmqhUQidin/KOkfGmXabJ0dFmsp9Y0KAYAcb9fKxDkPv
	Nk6mEoqGERxAQamsxhsokKoSRAI0MgDy9K2bYcbTrLXhyXe3Edi9FTfIAHvCWTqQyM39zsxKoHD
	JtY
X-Received: by 2002:a05:6a00:4508:b0:835:38fc:ba1 with SMTP id d2e1a72fcca58-83a5e84346dmr11501598b3a.46.1778236042647;
        Fri, 08 May 2026 03:27:22 -0700 (PDT)
Received: from localhost.localdomain ([2409:40c1:214c:f197:a90b:ecd5:8020:ab05])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf67fsm12132659b3a.47.2026.05.08.03.27.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 08 May 2026 03:27:22 -0700 (PDT)
From: Jill Ravaliya <jillravaliya@gmail.com>
To: nathan@kernel.org
Cc: Jill Ravaliya <jillravaliya@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: propagate hook script failures in builddeb
Date: Fri,  8 May 2026 15:57:08 +0530
Message-ID: <20260508102713.27678-1-jillravaliya@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EDE2D4F5027
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	FAKE_REPLY(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-13082-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jillravaliya@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi Nathan,

Just following up on the v3 patch I sent on May 1st.
Wanted to make sure it did not get lost.

Happy to make any further changes if needed.

Thanks,
Jill Ravaliya

