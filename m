Return-Path: <linux-kbuild+bounces-11635-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ARzITWaq2nYegEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11635-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Mar 2026 04:23:33 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE887229D8C
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Mar 2026 04:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D64DC304300A
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Mar 2026 03:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0821309DC4;
	Sat,  7 Mar 2026 03:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJT1t/r7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC7330AD1C
	for <linux-kbuild@vger.kernel.org>; Sat,  7 Mar 2026 03:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772853789; cv=none; b=A2Qt4jFoHJLEB1guR3FU1sV6mesaiviMmyGDw0rWhgLreh8DvQCRKR/lnHCpsQLLZ+UBYceCa09kadT7xzzq2ri9yvwx7v0BOSymdlhXF6Tx7wHQ9zKv6jJdKtGTC/xhIIDsErY5Go7HwXTUsFtkAKc0CaZMBMSwIkfDUXpwvPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772853789; c=relaxed/simple;
	bh=yl/5Y/nXTvOWLCUjZ9vsmgVgWr8lK//l1u24qGNKCsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mJFcpH+rP1qt1C6OFtv1Lgj2hMsV2kxO0I6Z+j1GJMTMoHjoKSVEpghIGho079SD5zYIfdPMJCnNBxS0/gSXsndXAN1F84tN21LPaa8bjCcuy/dzsiKv3IMC7No0pJtzN20Yc+D5fQqRTBbkgTZ/KKkQm2vg7PdwkFxgQYcTTHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJT1t/r7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso90668125e9.3
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Mar 2026 19:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772853787; x=1773458587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JIeptY94fGiMe9NnDArQDFW08JE5xRTT4JTPEDHqCQ=;
        b=FJT1t/r7ZGEZWYv9QimsR4un2BxAIZ84HvnR0KpLYNvlicYTsB6VHmeTGMrBwGEW4c
         uz5VOwYsKoT26N1XvPzaN27LIC542UoF06G+By5jqhpiD5hhnZCoh4sr3PFblePYXsbN
         INkXbyVzjbsaK30pKz2ErK2MkbIGSgOQQUo9LElYZNmYiPfqdbwUuN8wmdVED3asyh+Q
         M0rHDBToGRaz/uMcibguC0agiQEJw6FCNktfWtXH2r1q2uPFy4wdX/GU2vcPEjGb0VA7
         VfR7F8tewWWRVdCjZELBRqpLqYOG9KX8V2PJ0ZbNVR9mS6YEjsMobBoiKq5shxt3U4yz
         A/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772853787; x=1773458587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/JIeptY94fGiMe9NnDArQDFW08JE5xRTT4JTPEDHqCQ=;
        b=YpODfr9LFOBokHAcNcSm/Un2MpeIU5y4/MeYy2SFip4/37WaG056N+1GwL1FTt9KUn
         v7Onx7MFm56TuXHnFmHfycEsNFF7HTJFtB4q6NKah5bR38L9U3FtDy7ifRdqUUP04MYl
         711rfvjE1JBOG62iliqQ1i4g2uBY4Itd8tF7FwpnNkr4iIvYkL85opFoGm9DO5p7+dsn
         2b7X17mfzzyDf4/r6b3DwACxMlpA/EmVi2ngr6Vuv7MHYofYfuAJSsBAha6nZ6jni9Dx
         9z8ex8EyeiqExnN0FdkrkfWnZMt20moTm/Bzt/DU1OTUhFTQ9itrZrmok1RnY0gmJr4f
         hKkA==
X-Forwarded-Encrypted: i=1; AJvYcCXM1iEdLy/2brW/kaulz7RHRHjg4EYsixhnpxWTDVJkEvFlWNEgQTG5zHQiZPeoDpP7fSPKFT9xWrD4Kzk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8izTMu+rzXLjxF/czP6IHl4GMkFzPf6nJtJDBRK1tssIqLw6c
	2OwAHqKc+XyAZACAUGgt0m18axs911Jk4yYSsllYOlY+r3ojrSFhT43F
X-Gm-Gg: ATEYQzxkDtM825cA7uhwBTgXPT1woJaq2pp68QHga0sU2+YL5bCkPRDgnHrgt9ik+vZ
	1qB4tgu6/3UwtADS7Ibt4MQdpL20zmWfdgZ4WyeuuijrS9ihg6AlivHDL8DaSsobW6mPnDmeSeQ
	HRNB+hrGFXIYYImfQkzS8pAgHv1BLLphfhX59gnLjpZ9ncEcm5KNqB+AYmlaN42WxiHAEyJY+Js
	/Oho2c7dE2wCCP2No1nUKem+tUdj6luga5o5eK64F02K5lcAiVhyHT0nGDmdMa/56lLdNe2eV6H
	xQ9EUocgFaxNnxKgLmgPQuRD1k0jY6+z8QjWkbkngkno3Jib3acbBeSnP8P5A83a/BvW3iKwM8O
	uh5yQiZ8POJiSUe05Xb41QlDiI0zIHztZeq9ryie3n0URkTu7NqY97Ks43uoxlJC4+PoO1y6X4H
	Mj6dpd0bHmqQlTg/1jkzYuNiGMF0X5Jw==
X-Received: by 2002:a05:600c:5250:b0:485:3025:162 with SMTP id 5b1f17b1804b1-48530250228mr2832345e9.35.1772853786749;
        Fri, 06 Mar 2026 19:23:06 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4851fae538bsm202029975e9.7.2026.03.06.19.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 19:23:05 -0800 (PST)
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
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH 0/2] init: ensure that /dev/console and /dev/null are (nearly) always available in initramfs
Date: Sat,  7 Mar 2026 06:22:58 +0300
Message-ID: <20260307032258.2857157-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <bd45c86c-e1ea-4995-bb00-df83cc873105@landley.net>
References: <bd45c86c-e1ea-4995-bb00-df83cc873105@landley.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DE887229D8C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11635-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[safinaskar@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.996];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Rob, I kindly ask you to test this solution to your problems:

https://lore.kernel.org/all/CAPnZJGDDonspVK1WxDac2omkLJVX=_1Tybn4ne+sf3KyaAuofA@mail.gmail.com/

-- 
Askar Safin

