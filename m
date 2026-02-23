Return-Path: <linux-kbuild+bounces-11365-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMoPCpeQnGnRJQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11365-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Feb 2026 18:38:31 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F91E17AEC2
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Feb 2026 18:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0E3B303298D
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Feb 2026 17:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0910F46B5;
	Mon, 23 Feb 2026 17:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDD602pt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD42C331213
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Feb 2026 17:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771868090; cv=none; b=R7cqvIJBM2629ZlvfAoASRk92GiwLlct+T+6zlaf85hCKpqNZqZ0esZUfgqypqCFui/mzVUD7HCcdXVbfqC56nFkhL5v2HC3+fcBkr0fjWlVmBw14l6p6I8gmUX5sDjbn3vudExhIpxV/+yKbxIMxYnsgYG8NdtXWFyD9CXvleY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771868090; c=relaxed/simple;
	bh=pPVYjjX+g8lwuvjjX9cEbFdLG+Rgns4g94OuadbV+lI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kost/b5tnWNvb15T1hed2/HwNhjB5oLrqZG/EP5eNxpgMoIQhIROch6DDf/DonR2z1KooPkqH0Jo4jV1gVXo+Wfpk2GaYQnJpQ7oTc/cFBWCLKjlDNO6v+e4K6omwLNsGEWp2xNFNB17ie0194foPbtJVatVCktp0BPUM+XQ1+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDD602pt; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-483487335c2so42574915e9.2
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Feb 2026 09:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771868088; x=1772472888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUEz6YAu4nuheVqgpSXCLvSWu/dJuHAVRYNHbZZUc14=;
        b=KDD602ptgLwZUkiYwqEY3ctJ6bnFLeGw4F3dDv3tqqouq2gA/YOh5kHWEBI4H7U6ku
         IZ/OJCPlsgJTTg6israrsbj/MEeFAkUZkN+bjK4INGcsQIu12S60FJsdLpBJ43RtVta4
         tRAEzYzILAO5PJ3FR6FLeVVICwl9syZ4Yt3N3paOpMpy9Ny69alxVadj04I+v6hhI42k
         f3Oic7cnXRPwX1WBFS0rBNWJv27MFth5hlvp++bRCvSbZpmH9O1dO4g1B2STuKHOyYJp
         HyHSxLCth9UFUddaUU3E0JquTttLRtI3BsKHC91WaOGT2GsQHCV+6VTPOpo5sgdheR/i
         2Dhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771868088; x=1772472888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HUEz6YAu4nuheVqgpSXCLvSWu/dJuHAVRYNHbZZUc14=;
        b=ekWljNnB98O8irz4Tp5nyw8M7YG6ubayJFB8cclHHotPp+ii/neG5rfsp8lvv4l0EK
         dVFsG50bhouVcw8Q1+lRILdeBfZ6S5pcDpvPJeFzeNjN/VpXMmOechFEjXvqHI/gFPnI
         eO8O4p4Jnl81pIk9R24cgB58kv357HZnlVsKRSYs1JNIFdbbAt7ED9FPd34UaII+w3su
         IgAoh8ZRpq2hp+3s423u7OD1xGxz2TchyRQc1Ev+CKguQXrEkWYbcIr2Cdb7pXd43HK7
         K32HwLrzAIhisw2EEUbvBaKHG52JbQtWCMM+USeTuENr6wGUbaABp2+rjeNphZn4Q9EX
         sPIw==
X-Forwarded-Encrypted: i=1; AJvYcCVnu5AxQg5PpBLrb+/OQRl0CA2fgEscjuORPh1HuAm42gJ2NT/5KD8r+eU1VT1M6NIxsYSx15g4Ru4poKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQkzkNwY2NdVRvt4TftCpoPHKWFXgMQ+0DNMmwS2w/wugAYWrO
	uPJkeWxEoNI29m5DwYpOYSppFjfL+TmK750Wbj8I+3WOVNpzgsCdPuql
X-Gm-Gg: AZuq6aKDyJ/l1QC6GxJi8PEFG9kzKnfyJneKxxZseTUXS3o4WoP9ImI1jKlH97mW7gc
	KcswKprhVIS08K+5ApTMRO3U7cm2x4fXV0OyZFE36lFuDHHnZbFWPRf1dG4lSkMa1GfZTwf5pfe
	xKktRhaFEwE/HK1icIqFZIm1nSJcgkfj9pldcCzbeSPQt/LLfHbZOBSqk0RAljYpynp9letA+EP
	m/V4BSPYwgPpp9o41nCMKF+6yshFPsoJ1HGx7zMhusJLgUHTkO7n9O/bG2xYcvbYmz7Ep9tF7v4
	ROohkBPfMaV6HnONtHN9iIafJUZnVrFWUg0GJqLv9MvDZMPkRsE9463hOEDU9iA9rd+WJpiaCc/
	TLehy2PDbHz+z7qNU2H2CuyhBYN9xPggHltiESA8Kt/szoWka31SHpGcVklr3M7OCTRVhbrqlTn
	n1vXC3C1AhK17sI59pmjg=
X-Received: by 2002:a05:600c:45ce:b0:483:a895:9d85 with SMTP id 5b1f17b1804b1-483a95b3e18mr165817715e9.2.1771868087959;
        Mon, 23 Feb 2026 09:34:47 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-483a9b668f3sm213824665e9.3.2026.02.23.09.34.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 09:34:47 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: rob@landley.net
Cc: brauner@kernel.org,
	ddiss@suse.de,
	initramfs@vger.kernel.org,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	nsc@kernel.org,
	patches@lists.linux.dev,
	rdunlap@infradead.org,
	safinaskar@gmail.com,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH 1/2] init: ensure that /dev/console is (nearly) always available in initramfs
Date: Mon, 23 Feb 2026 20:34:42 +0300
Message-ID: <20260223173443.327797-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <7e309fc3-7d55-4e95-8dea-f164a7a96b6c@landley.net>
References: <7e309fc3-7d55-4e95-8dea-f164a7a96b6c@landley.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,suse.de,vger.kernel.org,suse.cz,lists.linux.dev,infradead.org,gmail.com,zeniv.linux.org.uk];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11365-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[safinaskar@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,landley.net:email]
X-Rspamd-Queue-Id: 7F91E17AEC2
X-Rspamd-Action: no action

Rob Landley <rob@landley.net>:
> The real problem isn't cpio, it's that the kernel interface

So there is some bug here?

Then, please, describe properly this bug.

I. e. using usual formula "steps to reproduce - what I got - what I expected to see".

Also, does the kernel broke *documented* feature? If indeed some
*documented* feature doesn't work, then this is indeed very real bug.

I kindly ask you, please, please, describe this bug. I really want
to help you.

-- 
Askar Safin

