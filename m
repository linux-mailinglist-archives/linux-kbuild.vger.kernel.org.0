Return-Path: <linux-kbuild+bounces-13619-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o2I2Ggq5JmpDbwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13619-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 14:43:54 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D2B6564A4
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 14:43:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YF9YNrxP;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13619-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13619-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06D623050685
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 12:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11C437FF66;
	Mon,  8 Jun 2026 12:35:30 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A9937DEB5
	for <linux-kbuild@vger.kernel.org>; Mon,  8 Jun 2026 12:35:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780922130; cv=none; b=d9PMqsjgbxCh46JhUIKYpC1rj+yVoc9gLc95UVVVzIoHltoT3p8Lv1712SboWgO58vPoM4HQIPklce0W5hE+oIARQursysUbRqdIhmqCbI3NaDEEkyAi6GJdtHQoF6uonFMM62dZtOp8qweW6JiTWUWg+PHhQQGo5uBo13AeXJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780922130; c=relaxed/simple;
	bh=wDDjiPFpMO+4+MFXsZoHiv0/XrEQ5EIffCpyBDzPI60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sc7hUZaA03Sx6RjffFkj3nEg6U1vYkmxSYv0KIlMdxs5RgxNeUolU//KXDK11XkNpW0Lahx9Fpi+/mF/IRqO6/zgWQNM5bBuS6hpAKTLPgxQLOQGzzHiW8F7RcUBxWnPVkryNQo0117commzp5F6DLpfgxlZoyNPF0YTRXINO4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YF9YNrxP; arc=none smtp.client-ip=209.85.218.44
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-beb2063b149so64217366b.2
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Jun 2026 05:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780922126; x=1781526926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Od8acjQH46yIHcWew7v4maQr825FRBX6sALt6TBXWRQ=;
        b=YF9YNrxPn+s/CV4tbr4MepKsKQ8z35U6Y9R8DrPxo8CSDtZmxtWhVtu/LKrdrRNGRA
         iSKPtsr7lE9PUC4Wf4Z7IUY0VVS/QEPp2m2q4poYxZok9y0ON0o/O5S59vaAEMczHWTV
         bo07L4qZ/LEgFsM34kPUgoeoD0/k6jIx8omjwYekeaUB1YleyLOyFDeBMLri0kBJCIWv
         Z8KJhivg1UtxZvJbxwwiw6CywLLi5DSFDMentye4R8IoYIUoBmo4zIzFwI66jL9ogEVL
         MmSRbRZMX5LpjcPyOiy1XQS7+Q3BxYsKIJ+o0EJENOMnkutYzdwC8x6Ja/zHIuCVrv3i
         6o0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780922126; x=1781526926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Od8acjQH46yIHcWew7v4maQr825FRBX6sALt6TBXWRQ=;
        b=WEuN5jt9sP2X5OfdoyJ3BzyiM93GKYwTNWdYhIq56aRAOonngOMoQs1T2DaImY8jy3
         9EYn88gsoPRH97jcqXsgCSaG7oWnhbNe4SCZNNknRTjwTJ5fJvz2gjsMGkT9FEWoAdKv
         kPqJ6HuL7RfTJSJWHDKzXjqRtC86SXgaXFNugfz8ZcWDTjNeTffeUCs3qZrxhxjIQXbW
         5kV4+JuZmvjhzHR6r6bZgCOVkOppV6JNNiHOKhuG8t4pyPDSpU9QLBuXuTGEi8pQuqsx
         Ey+Y2ZSYH2wOZPGZGP7zki6DOn+FQ7RRrjpcvxD7f2ypIFMo5EpVWzmW61B9/jubWEt0
         9Abw==
X-Forwarded-Encrypted: i=1; AFNElJ9F217/nlUikNHgJukXOi7Fs6LJ1+oZURRm0xQi//+d7i3WtOR7O2+VSOZtvLkOrL+3r4lgQalCjWdWfOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuyJvQSG4KsMme3kQZdy6jrIxO4XXcD9y3wovq4iCWded1vWtt
	6WDDE/rv/I/VYS3VcMYlCb6WQZwS+4YFuUGSAxh0RhwfTuuyMTD6UNEZ
X-Gm-Gg: Acq92OG7ScHZEICcgtHV0OJ4MYwiNJg/08zPaZxcTV10foxHliucV9joA+RjF6ZZNYn
	PXIZ1+sirIg60MP/J7gqzwnNrz4Nh2Nuww4Ba/OhD+Cnl9DRBNc8t2gK4IidcbSB/nUU4nliyTW
	waakhrHitELECRK9B89P+ya0lPiTBwIwJQ7y+pWORlR9KHecnsO3y3yIi8pggq+tZwKRLYahlrS
	766VMcooL71cii7j/xdfxsU5E2faWf2cNs2bZL+tFat4zSJLalPRKYtFwXqEgTL+XnJ9M3muXvK
	z4MlfOnyw/lS/t4PkMfxucSYCNVSR/jD1WR9dC0aRRvwaxtAiXz4s2nXTspF1fsO34y+9EiUOsi
	u5yHfi8i67t1WGWY9uttWSr/LxcDSs/cmjnOBozTblTolO/1gyVn17EHHe0uSEf9sX7l9lfWKTX
	Bjp/Ijj6YkbUbQUoKnSHxka0j/QnNwsVfoIsusW97QlNpUArLRYiJPvCXHtIWk/TKnmWQ0
X-Received: by 2002:a17:907:9621:b0:beb:c327:8e7b with SMTP id a640c23a62f3a-bf372932950mr381648166b.3.1780922126440;
        Mon, 08 Jun 2026 05:35:26 -0700 (PDT)
Received: from Kayra-MacBook-Pro ([2a00:1d34:85f:fd00:89b:7f3a:f691:1b4b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf3e39647c4sm485107366b.63.2026.06.08.05.35.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 08 Jun 2026 05:35:25 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com
Cc: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH] Linux 7.1-rc7
Date: Mon,  8 Jun 2026 15:35:03 +0300
Message-ID: <20260608123503.23298-2-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608123503.23298-1-kayracizmeci@gmail.com>
References: <20260608123503.23298-1-kayracizmeci@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-13619-lists,linux-kbuild=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:seanjc@google.com,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:torvalds@linux-foundation.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kayracizmeci@gmail.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kayracizmeci@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-foundation.org:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3D2B6564A4

From: Linus Torvalds <torvalds@linux-foundation.org>

---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index e3aabcda1ff7..e156e2696efe 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 7
 PATCHLEVEL = 1
 SUBLEVEL = 0
-EXTRAVERSION = -rc6
+EXTRAVERSION = -rc7
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
-- 
2.54.0


