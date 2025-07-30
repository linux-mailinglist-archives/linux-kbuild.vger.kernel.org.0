Return-Path: <linux-kbuild+bounces-8255-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BDBB167CA
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Jul 2025 22:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37BDA1AA32D6
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Jul 2025 20:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953002222A3;
	Wed, 30 Jul 2025 20:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZXah3LQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9D5221F09
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Jul 2025 20:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753908696; cv=none; b=jt/qbHkN1E0RusssNuTvZyb7SJZS4hzEKduifHBUBGpn9El7WHT3tPo43EdslLdjmfi8Hr5GQVSRMgIMqrrxQKT80s9MHAvh567+y4FndwBCJAnAe6wQ/ZOpmbvtfZK7qr4fALTxjmBJzBQU2VmNgJdEQTa0sUhfY7Ii1eHbFFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753908696; c=relaxed/simple;
	bh=wK8T++Ju3Scbupy6EOaAOyMIS1JFl/etdc4qKtpjSk8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=S7BKjo79IDwvTaTzuh37G6qL8J3mLkbeM5CNF1j7OmdAidrErzui54IXZwkvBiUmuKr2eD93RiVS4Fz3kIlsdjxOW/1+UzL8fwk21bH9Dr+EpnhsEpimvG/sliqXA86Msq0/eBezRoirvjAuMkJnsMHLp553iIBVjdEeN0xsfbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZXah3LQ; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-401c43671ecso112527b6e.0
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Jul 2025 13:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753908694; x=1754513494; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wK8T++Ju3Scbupy6EOaAOyMIS1JFl/etdc4qKtpjSk8=;
        b=VZXah3LQXTGlLiQw+aq0EylPMybBGyg39cAE3f6mHZvwHUwrCrG7jhume5v/f08GO2
         WuBHXl23LORtAac/ckHJ94AfVxr4Y3E9i83jP+J8ihkvHcYSfQBKgNyBGGVqGpXOjij+
         v0aMbS9pwswwWHC5XSwa03efGnOm+VWLtHV7lCs9SGUjdNEawqR5ertRRhdn1e9HEVG0
         eN+WWydUZd08SoO7lUnLuMQP6PDzKuuowiPRe6GCTC21Y4ducp71EMLk1uJaSD9KTWqk
         OGxHKNwbIFOyhaiVopk10blSVgej+7iOUMmIpjIWuKVMp4Vtgk5QOp+LwqxUhffNpFkU
         /t2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753908694; x=1754513494;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wK8T++Ju3Scbupy6EOaAOyMIS1JFl/etdc4qKtpjSk8=;
        b=mC+mkNBQz/j3ax/zMdg32lz3DwUlVPKLjwlvc7UaNuI0TgfIAKmqo+CWolqjzFKXiP
         r+RWGdHv0fpJ+mrTW3UwIgif2pUkzmCSMvvlDheNS3wLcArF/5vZ52ewBG0/ogZpardR
         pQbyT1nAtSnflkV2P6VjCcGfTzNsQZO0mXhB14IoCrVvlbz1FMxW8X3H0O9jnb/fD7jy
         nGSW3vQ3GAYs/CkfFIo3zDU8kt5VzYyX/2KH89LqVwi5wwbO+IMPEJFjv+R6wap7dxJj
         ufdNpoGUlmw9gYMS3Vp9elJG8KFbxnfEs9ed7HD0DoiMq0XqceW7Rkoa7QFO0mFRyZwf
         0LwQ==
X-Gm-Message-State: AOJu0YyEmG+d10fuVNoEyd2dTQi1l5VZBUZQf660jPSUlKS+ftVU7N5h
	6PVeatLRIVZS8xqYZHNkpSfeQWiSmTmhH+n23g29ZVRHG+4CykefMy8chLrpwdIz/SwNN0FrYRX
	F9biMVLlxNklAZ+fUzp9oeWloH9KbCPJ89uRE
X-Gm-Gg: ASbGncs8jazIHaY6Gyx+B+xXVL0+txhu777TREv17WzbKj20hxH8Lnnupm7cqAfVvu8
	VpBoeZtlhElVQwtF4sy90S4znePXJVHQO5iHGltlUOFGjId9Q99ItCGYcgK/I1+YhGqcWDLh5jI
	6+bFSWzG/RtXYdve8BgHF+B/u1Fq1agaPnYIW3BeVX2tIOw6PknGOXJbVVCgkTP0nx5mXJUnFTn
	KWO2q4=
X-Google-Smtp-Source: AGHT+IEMdb6T2aSmcTuq4rZE3slhXA0AUH5CLpplqUwLapx/u4+k1GjAC9Pmot7LnyfMXqaKV7fW4lja5Dz+9rAzP8M=
X-Received: by 2002:a05:6808:2112:b0:414:31e6:f6f1 with SMTP id
 5614622812f47-431a5c4461cmr2714339b6e.17.1753908693795; Wed, 30 Jul 2025
 13:51:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "David F." <df7729@gmail.com>
Date: Wed, 30 Jul 2025 13:51:21 -0700
X-Gm-Features: Ac12FXwYD4GxhDyNjMv22oJMmQr-ZmAAJ_e-Z-wF15XRQ_gMQwFH0_sx-H3876I
Message-ID: <CAGRSmLtTCUoV66PAJ2VCBz70VNVKxhJHGbBFt9GXQdOP6z5KLg@mail.gmail.com>
Subject: 6.12 and 6.15 building fixdep / modpost for amd64 instead of 686.
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

I build the amd64 kernel on a debian based linux 686 version.
Building the 6.6.x kernel, everything was fine (fixdep/modpost were
ELF32), however I jumped to 6.12.x / 6.15.x versions and now the
system is building them as ELF64 which means I can't build my custom
kernel module.

To make the kernel(s) I use: make bindeb-pkg

The build for the 686 kernel worked fine, creating the ELF32 binaries,
and allowed me to build my kernel module for it.

What do I need to change for the build to properly create the ELF32
version of the various scripts created with the headers for the amd64
kernel?

TIA!!

