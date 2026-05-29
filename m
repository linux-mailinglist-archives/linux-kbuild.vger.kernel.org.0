Return-Path: <linux-kbuild+bounces-13411-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFvfLwzkGWrrzggAu9opvQ
	(envelope-from <linux-kbuild+bounces-13411-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 21:07:56 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4048E607B57
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 21:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 844AB306CF6E
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 18:54:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00FD53D330A;
	Fri, 29 May 2026 18:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fuGSjKYj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEC23F39DE
	for <linux-kbuild@vger.kernel.org>; Fri, 29 May 2026 18:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780080835; cv=none; b=ezYfnQ3Kjtn5ZtZg9T7KSxd0j7hKuexhAb0HywRSsoNfg/c5AAWEdH7PpNqJks/RT9iCmRxOCFtUwo+EyqncHHHxF+oAZ5j/oXlZl6yDSiVJoobdD3QfjlZvhWWfqASyUqV54fs9okNCixURGrDy2384ArnNICg13iSqt5/LJAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780080835; c=relaxed/simple;
	bh=s7bt/YWGN9UF4BwynJHskbfVkLN9m3OOGrUY7+PeC50=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AOTo/beavmpO+Oz3qRPb9awGwFPFXPvkFex9Iclp6XQ1GKlruHiQOk72rqA8t+HfSIIE2ajxnSqtyGvW3p4eQKlWMELFLEQkGRP5djOIoduGiPHUSd/sAlyg8o/SgkhfZ8fQgq3Wl0OvdPFKymTPBX34QeZ26vuWLWYVdHbfA74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fuGSjKYj; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-304ec73b015so558309eec.1
        for <linux-kbuild@vger.kernel.org>; Fri, 29 May 2026 11:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780080832; x=1780685632; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0JV5t//kdKJl6/uVoDLYHDKpOZGmoUYcNXdk8MLbmZA=;
        b=fuGSjKYjpStzD/MiX39EYg4T+iPs+EDWiaMck/A4AMDEEAB5ob+ZRgRMi43ian8Lgk
         VcKt8a3lmzDvAgh4C8Q5v+gcOVtWsugqerU3KVJctcWMU8yHvibb0FurLaagv+OIOTRg
         BLZvIUTtPVHT2hgeWcZnTBDVUX6LT7d1hSb9wdUhXLldqnUkmq6NncydeGVJpkcDPw9f
         nQYn4LkEuWAKerc9iVlH07L3OThU2bhqpUK2xDkhUd7V6AYqAHjtpyeEeNUdETOzVR2g
         vvRi61kS3Ei9kIKxqLBX52AZOP54a3kXcQiFri/TPTdGvWBbi7b7R6iv5Sg9H8Gh8dDX
         tNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780080832; x=1780685632;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0JV5t//kdKJl6/uVoDLYHDKpOZGmoUYcNXdk8MLbmZA=;
        b=aKbmfIe1dTsTslHbrQiJplKTJxjd41+9N1jPCdoZU1hi+GqtIUVVKXFKVMI/z69WJh
         IsCAwQ+mAKDBHSWT32bmS6mIt3QLwkWMFoAiKETCNQmEx2LOfh47EEMJRyZuQdxMK7MV
         CPQMQUcP88Jnk4sZJc1/1HTXiW8eUgVXv8UNgdUZbQB8zvW1ZQAJI00ijIlmqkSsYIop
         Xi1kkzjyQCPglevNN4Z/07PXQYsaK1y3J6rD3OGytRDXOaOMEce1OV71d4K1Nk4ena9f
         6A4hMDupjEbbfxihSSf1jrWqQV/41jvY+p0kICR5AOuYrTscLzqE0Jv+slSHgSNEnYrT
         GTow==
X-Forwarded-Encrypted: i=1; AFNElJ9t+eIzlJU0hw6gYAVv0ATpHVZIYeWBnyX3vpcJy9p79Dl9jEKccfUBdydWuJbeKg/EqPOWImT0oVxvieY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCLvLeiexyDA7LejwDorPfTURl6lMzFfC0LQyqMomc2Gg3mYVd
	4HhbUYfbdvF789NeIuVUPqhRSYZ6zchTJKRBnqBRaZU7hEWrfbcB3VVZwlGxcK8mYwALKQ==
X-Received: from dycme17.prod.google.com ([2002:a05:693c:2411:b0:303:9118:b1ef])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:214c:b0:2c5:ed1b:ca9
 with SMTP id 5a478bee46e88-304fa4a9576mr574362eec.1.1780080831505; Fri, 29
 May 2026 11:53:51 -0700 (PDT)
Date: Fri, 29 May 2026 11:53:45 -0700
In-Reply-To: <20260529185347.2418373-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260529185347.2418373-1-xur@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529185347.2418373-3-xur@google.com>
Subject: [PATCH v12 2/3] kbuild: change --thin back to 'T' in $(AR)
From: xur@google.com
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Rong Xu <xur@google.com>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Teresa Johnson <tejohnson@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_HAS_CURRENCY(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13411-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,linux.dev,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4048E607B57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rong Xu <xur@google.com>

The '-T' flag in $(AR) is no longer problematic since the minimum
requirement for LLVM has been updated to version 15. As of LLVM 14
and onward, the '-T' flag functions identically to the '--thin' flag.

Fixed the issue seen on IBM Power11 System:
  ar: unrecognized option '--thin'

Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Closes: https://lore.kernel.org/linux-next/476507c9-a371-4864-9e87-572c1ecae82d@linux.ibm.com/
Signed-off-by: Rong Xu <xur@google.com>
---
 scripts/Makefile.vmlinux_a | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.vmlinux_a b/scripts/Makefile.vmlinux_a
index 9774f02b43b2..650d44330d1f 100644
--- a/scripts/Makefile.vmlinux_a
+++ b/scripts/Makefile.vmlinux_a
@@ -10,12 +10,12 @@ include $(srctree)/scripts/Makefile.lib
 # Link of built-in-fixup.a
 # ---------------------------------------------------------------------------
 
-# '$(AR) mPi' needs --thin to workaround the bug of llvm-ar <= 14
+# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <= 14
 quiet_cmd_ar_builtin_fixup = AR      $@
       cmd_ar_builtin_fixup = \
 	rm -f $@; \
-	$(AR) cDPrS --thin $@ $(KBUILD_VMLINUX_OBJS); \
-	$(AR) mPi --thin $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
+	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
+	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
 
 targets += built-in-fixup.a
 built-in-fixup.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
-- 
2.54.0.823.g6e5bcc1fc9-goog


