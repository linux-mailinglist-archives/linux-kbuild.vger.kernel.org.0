Return-Path: <linux-kbuild+bounces-11979-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBXeNQ13uGn5dgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11979-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 22:33:01 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE732A1006
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 22:33:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5771A302BBA8
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 21:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1DC5364E87;
	Mon, 16 Mar 2026 21:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UCQEMI2q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F79F311C15
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 21:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773696581; cv=none; b=SxqFE0zfXYKIdOl+fESouoDOr3VUSmDpYDAPA9Iju+PeVHB4cv6GvLD0LVlgRpuGbgHvtK4s/AcndFStsBPH7WBqyinwc/EGqY4sdza5XBg7oojDriRZYn/XO46aCyWBoU/5cfWRF9XVXafR1Egb7SD48naOiaTaKJJJNa5uLt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773696581; c=relaxed/simple;
	bh=dxsfmb/YEupislZPlbSsLwHXV0CS/9g8rvxxHXQbzB8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=pb4cet/xgfAT8sMVyCV8TpSNXdZc2Uocv28t9R2nTn1+kIDIhdlnOA+IbgHVvGo3/Zx8+HijL3o+vEO3zub8p/GyjLp4c0etgCnAiwB/BHFcGoCcPDxxN/r/xZE+HNsasp4W8fk4f6LvGcz+0AcRllz5e2GLY3Kyu8rZNbl4TJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UCQEMI2q; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-127337c8e52so96097043c88.1
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 14:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773696579; x=1774301379; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vCM8J7LTT/uLe/8rwcEE54UGB7wLbVI5pGYabTGypJg=;
        b=UCQEMI2qmlGncrr3BTdG+n24OTbl6o14iWlVwCxa7lVAGlR3mmr79uNbr3HYYfr6zY
         H6Z0r09O73q9mb4OA0Lf7JwYKFKwVAtGnpaxigg7esiTUPUCRRz26F7EK16IKk37PeCA
         9f/dyCDuBju24gPaKYS3x0n92kDq6w+/rwSfch6XvIHpXFjADx6TuZom3imGeMGHvbkp
         +5ZWfTpTtupisH0MNNb71531WD+KyEWy6eIdu+AGptuthkoWb9KbqkjY5fmtHckuP25N
         hzCNFzL3eaYFTQflBSH1AU2j6hSxN6N+HaMOYo7b9B+awdjbPqxOWVv3MWvjZFZGQvfv
         VXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773696579; x=1774301379;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vCM8J7LTT/uLe/8rwcEE54UGB7wLbVI5pGYabTGypJg=;
        b=CdRawiyRdKMUSxV0ltu3YfcQS0j2UtfNywmdJ5UG/fvcfvUyT8T3l0oUvwydCtTISJ
         gFhR4xOTbG8O4+gq6TT7jxPQgZ326l14lrfUUFuNk9Owyq4Wh4crDd2xIO6lhoUwCTVd
         vqMjcc+qYgkNs6aW5YJtvfcARoE3feMUcfkz/QiJ7OpN5BdFdr0reb5Cb+4JAOfcVqJQ
         WO7FeHe24osdQTObdxwuR1I+IOL/SdHoyXESkwXMMwTIWQPJUymDv6JuAuA0h2GI+BK4
         IQAahOCocQdDHLbs0CDMbhio7LkkIrrvrLikpFqSYdTxLETG3BqixXghBCNZkENMoMcN
         sSaA==
X-Forwarded-Encrypted: i=1; AJvYcCWDKRGUP8VEF3eVw4o2how4ZPHltyxjY/PQghG/wDaIKo28D3zF8hrp0jiaW1Mywg7g09pH2aKDN8nQRCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhOJT0y96yzARmJLcpC8zACcmIDzIpuGYxkge7ruxhGVAif1Kd
	orH6GVbthWoQUuh4PASwwPlJ9JNo6WfDvHPgDEnVdv9j8S0i3GI3AKuReaG112aCT5Rltw==
X-Received: from dled18-n2.prod.google.com ([2002:a05:701b:42d2:20b0:128:d42d:544e])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:618f:b0:11b:f056:a1b3
 with SMTP id a92af1059eb24-128f3d3f175mr8012281c88.11.1773696578552; Mon, 16
 Mar 2026 14:29:38 -0700 (PDT)
Date: Mon, 16 Mar 2026 21:29:28 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
Message-ID: <20260316212930.120438-1-xur@google.com>
Subject: [PATCH v6 0/2] kbuild: distributed build support for Clang ThinLTO
From: xur@google.com
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Rong Xu <xur@google.com>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Teresa Johnson <tejohnson@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11979-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.dev,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2CE732A1006
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rong Xu <xur@google.com>

ChangeLog:

V6: Change '--thin' back to 'T' in Makefile.vmlinux_a to fix
    reported the build error from old ar.
V5: Handle single quote escaping in echo _c_flags to fix
    Piotr Gorski's reported error.

V4: This is based on the reimplementation provided by Masahiro Yamada
on May 26. The difference is that this version now saves the compiler
flags (_c_flags) from the Front-End (FE) compilation and re-uses them
for the subsequent Back-End (BE) compilation.

Rong Xu (2):
  kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
  kbuild: distributed build support for Clang ThinLTO

 .gitignore                 |  2 +
 Makefile                   | 25 +++++-------
 arch/Kconfig               | 19 +++++++++
 scripts/Makefile.lib       |  7 ++++
 scripts/Makefile.thinlto   | 40 ++++++++++++++++++
 scripts/Makefile.vmlinux_a | 83 ++++++++++++++++++++++++++++++++++++++
 scripts/mod/modpost.c      | 15 +++++--
 7 files changed, 174 insertions(+), 17 deletions(-)
 create mode 100644 scripts/Makefile.thinlto
 create mode 100644 scripts/Makefile.vmlinux_a


base-commit: 2d1373e4246da3b58e1df058374ed6b101804e07
-- 
2.53.0.851.ga537e3e6e9-goog


