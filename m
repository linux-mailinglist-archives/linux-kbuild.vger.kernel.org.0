Return-Path: <linux-kbuild+bounces-12301-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LnGBlWkxWlUAQUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12301-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:25:41 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E9A33BD70
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A93C73015A46
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 21:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C4BF3A7F46;
	Thu, 26 Mar 2026 21:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hxNI5G8M"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CBB39F182
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 21:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560328; cv=none; b=MgGOS8ogXG8mKhqucXnAJxkCPqvOiDiy7XIoZq4xD7uROtafCzF3cejxk0VOKLVaoBuCK9Cjtu6WDa4MArqOmLaXdnD+6GK6GDtdLVUFxJ2TViLA1tE4acmq3mSuDH0z3Ib48o3kGlvSWi2vv6w/wivp0dxKAc28t8KSGbbCclQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560328; c=relaxed/simple;
	bh=o/kOrCCo+fMsG/zyKbK9sMlBZ4cdbWSoTsj4GMMdO14=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HFDN5eunBp6Ru9YEdlWOOao4a08c7y0AldqCn6KfE/+d1qYOBbySjZLsBfloW0Nm/6AoCGBqSSRnRX7E6jM3G/2zcZkgIUwCvFa2G2VAqztNOpLZFtfMWwhDNSLsOxef1uCZRT13T0J3TYvamoep1MRaLSWiPJCO9+wtp8PuWLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hxNI5G8M; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48531e6012bso17517065e9.1
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 14:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774560325; x=1775165125; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q64ZpAFewOF3l9iLTHkbHOl134UR/SzN3vMtwvmgNnI=;
        b=hxNI5G8MKD8Y5ARvIozlhz0L6kprlBZ5GsMeUGFbUOZE2ppGchpgjat0MZyUOV+SJg
         69P33oU5Obe4GHsK12/6B/C5ckOmdA51CktXZKE9wsOW3eD6x6tw1bTLZONUHKUCJe6u
         z4/kXwABbTJQrr+CyCo9QacA45H/xyBB00xuwTrW36KVx96umKAhQ2S2uQ8w2rlUM1qL
         bdGNyuXMvs0AwDAacYWOq9dzOK7sQmr4laAHgsr7uKZYwCsmicu6CQEt0u+tNMpklp5s
         7fTtfAlfWTMVbvUdyD49vRx77XOu7p8QYzOq3P6t6xwsHk1E5P6OWAKeJTzQeXCvJnBx
         G4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560325; x=1775165125;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q64ZpAFewOF3l9iLTHkbHOl134UR/SzN3vMtwvmgNnI=;
        b=jE5rwEHIgDB3w2fFsd0ZoA471LEDEzHxXpn3GBDA4aB16Bh/J1cHxlBtSYJZfpq1sz
         DEWLwf5HowWQZsmoC/MxvN+F8+H+tcim+RHHLwQ6WQjdxNUNke307iH5IAe5wEkNaCkv
         C2W3WMzWM6j1Nfu0t8n/NaxsnA/vv6Xi5hpAIn649IWZG1rASA4l/B1aRulEraVkmY5q
         MKci1eV8egK6Gw5TNBhAeP5l4nsUeueSjsBFgyBP4lksvLL+oNV7kPW+NSf40zotMbEy
         kBXsR+2P0iDQdYacEKK/sjMXge9s7/aLCfIWTvXxzvgElCsELvZb3dsmu6xyQuKUA9Eh
         ycLA==
X-Forwarded-Encrypted: i=1; AJvYcCU4i0C+Lplnp5pyKzCFAbEmZ2uIk3hX+K008ChILTblK8fp0ibBWkQXvF2et2BvKkHmKgJFX7/0yn2oIfg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0iccSsx8elnzdn1Nl4C/lRI+kao3iATpZBDmXB+oUP51YhgUa
	crlVcxpr7MKuueQEII6xx0wN65/O1rsVgnOCq4Amls8OnTlK5FsQR4lwc8FLnEbEKCuEyS0iYRk
	JxzQr5yncLLyQIoFEkQ==
X-Received: from wmcu15.prod.google.com ([2002:a7b:c04f:0:b0:485:2e9a:31b4])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:e:b0:485:5812:bb9e with SMTP id 5b1f17b1804b1-48727d31801mr2881495e9.0.1774560325336;
 Thu, 26 Mar 2026 14:25:25 -0700 (PDT)
Date: Thu, 26 Mar 2026 21:25:03 +0000
In-Reply-To: <20260326-kflagstab-v5-0-fa0796fe88d9@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326-kflagstab-v5-0-fa0796fe88d9@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260326-kflagstab-v5-2-fa0796fe88d9@google.com>
Subject: [PATCH v5 2/7] module: add kflagstab section to vmlinux and modules
From: Siddharth Nayyar <sidnayyar@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, Siddharth Nayyar <sidnayyar@google.com>, maennich@google.com, 
	gprocida@google.com
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12301-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sidnayyar@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 86E9A33BD70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This section will contain read-only data for values of kernel symbol
flags in the form of an 8-bit bitsets for each kernel symbol. Each bit
in the bitset represents a flag value defined by ksym_flags enumeration.

The kflagstab section introduces a 1-byte overhead for each symbol
exported in the ksymtab. Given that typical kernel builds contain
roughly a few thousand exported symbols, the resulting memory increase
is negligible.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/asm-generic/vmlinux.lds.h | 7 +++++++
 scripts/module.lds.S              | 1 +
 2 files changed, 8 insertions(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 1e1580febe4b..d64a475c468a 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -536,6 +536,13 @@
 		__stop___kcrctab_gpl = .;				\
 	}								\
 									\
+	/* Kernel symbol flags table */					\
+	__kflagstab       : AT(ADDR(__kflagstab) - LOAD_OFFSET) {	\
+		__start___kflagstab = .;				\
+		KEEP(*(SORT(___kflagstab+*)))				\
+		__stop___kflagstab = .;					\
+	}								\
+									\
 	/* Kernel symbol table: strings */				\
         __ksymtab_strings : AT(ADDR(__ksymtab_strings) - LOAD_OFFSET) {	\
 		*(__ksymtab_strings)					\
diff --git a/scripts/module.lds.S b/scripts/module.lds.S
index 054ef99e8288..d7a8ba278dfc 100644
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@ -23,6 +23,7 @@ SECTIONS {
 	__ksymtab_gpl		0 : ALIGN(8) { *(SORT(___ksymtab_gpl+*)) }
 	__kcrctab		0 : ALIGN(4) { *(SORT(___kcrctab+*)) }
 	__kcrctab_gpl		0 : ALIGN(4) { *(SORT(___kcrctab_gpl+*)) }
+	__kflagstab		0 : ALIGN(1) { *(SORT(___kflagstab+*)) }
 
 	.ctors			0 : ALIGN(8) { *(SORT(.ctors.*)) *(.ctors) }
 	.init_array		0 : ALIGN(8) { *(SORT(.init_array.*)) *(.init_array) }

-- 
2.53.0.1018.g2bb0e51243-goog


