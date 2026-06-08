Return-Path: <linux-kbuild+bounces-13618-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TaEwKC+3JmrjbgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13618-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 14:35:59 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA7465638F
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 14:35:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BTLQIxpO;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13618-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13618-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4F1313014379
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 12:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D08937C91A;
	Mon,  8 Jun 2026 12:35:27 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D751637BE84
	for <linux-kbuild@vger.kernel.org>; Mon,  8 Jun 2026 12:35:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780922127; cv=none; b=tN9T5HbbhCFXG2Bocqw6lDvgy7+RfVgq2BKDN2wUdwcZl4UHnZUbqJvF1v+t8/Kjq1sh3J+yxxuCYMPWbK32C+PXwV+jEsukBO6Pa/ZcyFkXmUrTMkIcnYkNWEarCghgM2BZmhrwllLDdBRpH4WiS7ifc4WYWKFi0+yVodvZTVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780922127; c=relaxed/simple;
	bh=CYYDWqyVN6rQRyrhyeSFNbNRecXMfXc9yaACOsDkXqE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=onz55sZmKGI34EXI5twqTAQj6AhxJp5syzXI32xEeHoi86PSTDq44M8oeD7EyuV6QkLVanOXzXgp4gpJM7yr6Y/C9WdWLs0/6dEIhCQRJAxyhDqs3CWKCWAAza8OO61H4WP6HNio5eh4hvo5EJy9uEtSwB4CAnwJQcwJw3VYHUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTLQIxpO; arc=none smtp.client-ip=209.85.218.51
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bec85f03e14so63098866b.0
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Jun 2026 05:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780922124; x=1781526924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z+NDiLOfcXQ8JmuQqrk6+Ji+NDT4+3lQ7MCKUmz9FTk=;
        b=BTLQIxpOdMFfv+Pdqw+8LaWLszo4ixaRviwDSiFdY/StYWJD+FZI5QeMvjJkRIeoX+
         qpp+uWHRJ3eihuvJnkp4o29fMRhWfCKVeuruZ/bkvfmw8TtiZvnLoiD1FMPetgBeoMYn
         aMKvSclolACR47NR+uX+F7UYFopf3Fiw1nb7mh7kwZ4VHw0J2HfrmwbpCHRWJwr+LMLQ
         Ygfy12luNRy75hV+4qwH1PjKiFxDYzVs9hQOIRlbE62GGkeDiG4NcmFDyLNGo0W/SnBQ
         q6yYPdfqjFGwDdsZ+wyNwoFz2IsmIJllCUKLZu7iQIcX6OQ68AA4JdvdcnuG/Z9NgoLE
         XFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780922124; x=1781526924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+NDiLOfcXQ8JmuQqrk6+Ji+NDT4+3lQ7MCKUmz9FTk=;
        b=Z0Yp1BY1z5Vc99cejpFT94gdZXe6Op0xmaRYj/xuJBRdJOzYajIKfNcCpoPBI6Yf1W
         Yjs0Zm2RNY1czTOu3fjH/1iQ0rEk0VlfAuEE2UPlTuxGcZH1/SGQrfRKbKdqnVv+3owv
         xSZgTRMrc3NpYfN/qfYi7Mi8UZUuXvajoQifpgqsvc4wCVMvLvKgjKtqyiYj8x0fAXFA
         qDi4rVKXgdnIn1FRF5Gf6DF7cBqLAUzWgtXP7BgPP8sb2yqJLB3KT/gW1QlMh0SNEREF
         ZFBhuTmLBpvi8Qk7AbxC24Z+Ry5LxqQOxOsOjXZW14AHZmREkQzkkTPzGX1BNxrc0k1V
         P4Vg==
X-Forwarded-Encrypted: i=1; AFNElJ+F6VHqS5V2kGeYdBZNGMqFfrGHVzwysDsqdR/8c/QD32kJVy72sp/OTJzkkk3FkQDwuOPNEn1OKSgNps0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZLb0+sf/PDIhNWJUT5xmuCWIbTT8viY6yP4gcZAWtjEyXqIco
	4WD5Myip2kLns1cynoqUPWzbdjGQYLrnyr9E9qXOW0UYwIjDu7rs8dIJ
X-Gm-Gg: Acq92OFcSexTYWz6vkiDlmbQ/Pz2+hSt5Isz1P4qi/ZuD/F9bHuL9u8UpQz1koueLRJ
	0DVYxRkB0bxu+JeDy2vJOsnfX96Kef+D8lOVzERt3Oof1xJ+A7zlZCsN2BSrzVsgycnf+/uykVl
	VddrcqRZ/N3uruf3sdakMomxL2C4QmJ4DdV29Emsv97Dyhi9U65QW2nsPOPhQmDW5HMnj7uJBYS
	hezzRN2+hNZMmBSzXWmKStUPbUoXZdBn5MyOnfQLd3M1PNjRNhNIseHQwiPdFbkYVnJ3SLb85u8
	WHzWSCidQrM+Qr7Wm+/7Hi5+5Bu5szEPlxpMIjRi4NIiAowlix0FJvHDcjr8AnMOSjH4vgqSsEc
	cFDqDJ2z5ijFBFXBKrAEoKnrTBQqSnHVtj57TPsZ4KXJbELp76nI14R5jUA22ABfVQvptDcW3cR
	An1oginKygRDfsa6dPAQVoxZFAG9PaaHoIQpdsyjzIjHYry7VG+jhof/ztjPQD9E38h9Cy
X-Received: by 2002:a17:907:971b:b0:beb:cc42:eaa8 with SMTP id a640c23a62f3a-bf37076c08bmr353336766b.1.1780922123939;
        Mon, 08 Jun 2026 05:35:23 -0700 (PDT)
Received: from Kayra-MacBook-Pro ([2a00:1d34:85f:fd00:89b:7f3a:f691:1b4b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf3e39647c4sm485107366b.63.2026.06.08.05.35.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 08 Jun 2026 05:35:23 -0700 (PDT)
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
	Kayra Cizmeci <kayracizmeci@gmail.com>
Subject: [PATCH] KVM: x86: Add IDT limit check in __emulate_int_real()
Date: Mon,  8 Jun 2026 15:35:02 +0300
Message-ID: <20260608123503.23298-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.54.0
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-13618-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:seanjc@google.com,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:kayracizmeci@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kayracizmeci@gmail.com,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kayracizmeci@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1BA7465638F

During real mode interrupt emulation, KVM currently pushes data to the
stack before checking IDT limits.

This patch fetches the IDT early and injects a #GP if the limit
is exceeded. This prevents potential corruption.

Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
---
 arch/x86/kvm/emulate.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
index 8013dccb3110..04e6c80bdb14 100644
--- a/arch/x86/kvm/emulate.c
+++ b/arch/x86/kvm/emulate.c
@@ -2022,7 +2022,11 @@ static int __emulate_int_real(struct x86_emulate_ctxt *ctxt, int irq)
 	gva_t eip_addr;
 	u16 cs, eip;
 
-	/* TODO: Add limit checks */
+	ops->get_idt(ctxt, &dt);
+
+	if (dt.size < (irq << 2) + 3)
+		return emulate_gp(ctxt, 0);
+
 	ctxt->src.val = ctxt->eflags;
 	rc = em_push(ctxt);
 	if (rc != X86EMUL_CONTINUE)
@@ -2040,8 +2044,6 @@ static int __emulate_int_real(struct x86_emulate_ctxt *ctxt, int irq)
 	if (rc != X86EMUL_CONTINUE)
 		return rc;
 
-	ops->get_idt(ctxt, &dt);
-
 	eip_addr = dt.address + (irq << 2);
 	cs_addr = dt.address + (irq << 2) + 2;
 
-- 
2.54.0


