Return-Path: <linux-kbuild+bounces-12306-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKmhAsCkxWlUAQUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12306-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:27:28 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 056EE33BE05
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF9D33041BBA
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 21:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496743A8734;
	Thu, 26 Mar 2026 21:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Md/wQu5l"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72933AB290
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 21:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560339; cv=none; b=Pxn2JRzE4pW3h3HFFyJCEHYXSGO+R0v856Hc/6rr506cLNLAY/xoqwKJtHHLhx3PqN0OjfXO40y00X21M/8aMQqOng3+GeJPn4KtZp3xU6tqnUWS1caM6Mb+QqMNMgZDuinuPkRwXG1jHdHyT4od1OOIM2ZL/Cxq6znIKPM9XUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560339; c=relaxed/simple;
	bh=lUQ7U8VJ/rlQHorgZU+GXUXjuVr+UBXICgrCGqgyAoo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SOWX69WISSAk8VzlZeRQGiwDZ8tBEFKQVq9OBHO+kByYgM4DT2bat0VmWkaAMJ5e+IYMAonsdbCznCQ/oSzOzx9Fg2QbNs/C0Fdya8DNd6+2r9rDYJh+ZmT84jfB3I65Rfasy2jd6X0IUB+lCj+ErUfDBRdRzQgyX+uGBB8yDoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Md/wQu5l; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48531e6012bso17517455e9.1
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 14:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774560332; x=1775165132; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ug/Aikg8oXAqlbbl6AzYUeKxZkIdPz7Q+TVSZpI0rDA=;
        b=Md/wQu5lBGLdZR4ug5+jWwene+rcsKJ5H0kAQuUNr64d5qGj2BYd08QH/4wYRbQZjh
         C5EuOjzrCA7SzeY3Ec3fCq0118NbHSBeeQCB5Ojq700gXOlYJaUb3jud09W3tS+NMa/t
         qp2CgKfGVm76ii3CWTSkNTOvEulWUbXTNuTQSPJ/u0Nwp6EjHhomLqlKTuHjz7NJLlng
         2GkM4xK5twfnNCsWyEP12q7gYRSMJAigPaJ5zoLbKfZeOnRjWOx/RwPflOfplMGX9HRH
         9W729f3dEW0LPIgefyN42KntPMUq/rqJMNOqHmBQcSz0/AB/jSMJvrt9PbwiWA5ocxxs
         2h6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560332; x=1775165132;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ug/Aikg8oXAqlbbl6AzYUeKxZkIdPz7Q+TVSZpI0rDA=;
        b=FvW3T284U7tIB3ZnwK809IrY3MNh0I2cBGUjeOnGM041tQDuucW0Iq6y2DjeUDnrmA
         XAxfPmytJ+mU612mt7FQS2kpbqTppmga4XLTL6por6cVj03b861LcmRdYv9XJ60H3Cx3
         u+Sv4m/chagh4dwhA5Ei5X2W2sVONPTSIbhw6lppTnqzG2je7jW8K8QT8L1ikNrTCafb
         4J/qf2IrygBPkfdCslitzxsoLURzZ2YUx28ORcmMoyr9dvvmDGfkFBtZO/wtn4YV7+DD
         2/eGSY8l/R3pRJBlZdZLEwlHgz+36iKe120Y3i8vWjGbjs2I6rjlGqiaJcPoUMREELF9
         W68A==
X-Forwarded-Encrypted: i=1; AJvYcCXapk4xgjRE59t10usii7/ossWfUkKXQSwOqk7jH2iurOt/syXdPaLy1JvgtWUp+Wsi62AFLEQjC0ZdnUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAb7vgWWmalwDuIEJ5Td6d08rHJH8oC9w0lsUztcAn6EJbfzPg
	J3i/mhzz3wPysCCU1Kr2DIG8K70PEGaaBgOeWUWnEf7G7JNjKLPW95bvzunaVRBp7DJ7etrZ68z
	Sd4dWylREGt0Oec7BHw==
X-Received: from wmsk8-n2.prod.google.com ([2002:a05:600d:8488:20b0:483:6cc0:9daf])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d1e:b0:486:fc95:1a91 with SMTP id 5b1f17b1804b1-48727f2373dmr3081075e9.12.1774560332192;
 Thu, 26 Mar 2026 14:25:32 -0700 (PDT)
Date: Thu, 26 Mar 2026 21:25:08 +0000
In-Reply-To: <20260326-kflagstab-v5-0-fa0796fe88d9@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326-kflagstab-v5-0-fa0796fe88d9@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260326-kflagstab-v5-7-fa0796fe88d9@google.com>
Subject: [PATCH v5 7/7] documentation: remove references to *_gpl sections
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12306-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sidnayyar@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 056EE33BE05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

*_gpl sections are no longer present in the kernel binary.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
---
 Documentation/kbuild/modules.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index d0703605bfa4..b3a26a36ee17 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -426,11 +426,12 @@ Symbols From the Kernel (vmlinux + modules)
 Version Information Formats
 ---------------------------
 
-	Exported symbols have information stored in __ksymtab or __ksymtab_gpl
-	sections. Symbol names and namespaces are stored in __ksymtab_strings,
-	using a format similar to the string table used for ELF. If
-	CONFIG_MODVERSIONS is enabled, the CRCs corresponding to exported
-	symbols will be added to the __kcrctab or __kcrctab_gpl.
+	Exported symbols have information stored in the __ksymtab and
+	__kflagstab sections. Symbol names and namespaces are stored in
+	__ksymtab_strings section, using a format similar to the string
+	table used for ELF. If CONFIG_MODVERSIONS is enabled, the CRCs
+	corresponding to exported symbols will be added to the
+	__kcrctab section.
 
 	If CONFIG_BASIC_MODVERSIONS is enabled (default with
 	CONFIG_MODVERSIONS), imported symbols will have their symbol name and

-- 
2.53.0.1018.g2bb0e51243-goog


