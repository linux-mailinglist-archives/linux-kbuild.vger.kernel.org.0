Return-Path: <linux-kbuild+bounces-12401-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCobH7vuy2m5MgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12401-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:56:43 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2923736C33D
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 82194308BAAA
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 15:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87AC142316F;
	Tue, 31 Mar 2026 15:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I2IUGM9z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFE44219EC
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 15:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774972119; cv=none; b=GBZ2qswJp0VBLodGp/jDQblU13jHp5YYfjFmg+n6luUKI8xUcNanD/ODwiz6gUD1K8eHAxp5b43jY0Fa3MMOj86b++v1XxhFffzmN4YsCFSYSyh76xqyJI6EhQ6SLbCDAaoN09AA/x6i7qlDDlvRqiAAjamJZ/+zFmEpnQudyqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774972119; c=relaxed/simple;
	bh=1dn6wx0kE3uz2URoABPgvTVUTzuMBnxMjei6SlfoEfk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KG5aoIOIU9laJleVst8DQZvk2RBky3qVublFZ5l7HTZTn6F8T6ZhBg5ESw+B9Ys/XAP5GwbDS6XILfM2nJV9ljRWeWEhbWSOLGlog45oParZ7IyjEbD28inCefzDcRpZ095hpod4pojyR2yb90d4kUzgXjre7ZaDwlT1boCd+/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I2IUGM9z; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-1275c6fc58aso7829191c88.0
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 08:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774972114; x=1775576914; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LVbuFhtmsLe2EwKEnKkn8YIdx3PwrexQLmQHP24bifI=;
        b=I2IUGM9zNwd48RzptOc0p3+UMo6699e7KyHVtt+p34WNNDtR++QpvLtLPsCxk33EuK
         55oWj+60d8vJHiA9Gcb0ExEGMuPn28NsHaRP8XV8SDhPe5E2PGiByMkw8PjFRnFevKIu
         aC0IFfWpTbfD/urwPZp6xLZut+2auVywnJGl0gtWjzhnblHco7nF0dvoRicj8kHV45mB
         YwAWJAfDsv06n4/j1vEaM4IS23LIzt9h+jlWjTORf3eCfbRWvQoqTXdHxyqQQLnK/jlu
         i03ikG8F3uvLIBEH49PSnGlYjH3qeYZmzXPs2QgMACU1E+EvMn689QwAHjgRiALOLQL9
         dNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774972114; x=1775576914;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LVbuFhtmsLe2EwKEnKkn8YIdx3PwrexQLmQHP24bifI=;
        b=rYCtBd2DlJb4jE8pCykzxYvcbBYscupXlAlRUNTiYxCBWcs2Q16e/42WQxWEijp1tL
         fcptoTbcS1K5XcYH1N+lj+J+vd5X3/OZsmcER9czNfHeRjkq/Nux7bIzZGCUPR48WUNN
         Ka8eM7Bw2ISqAoAxmE/l6Zf9leOZJ3bG6C5hldgFZTxBYmTtxT1i6iw19+j/R3WOVubh
         ey+g7ZYQBgDk5aQhUYrawySx3ymqvyvCyamqOvGeQNvOANvo7r+swNl7qJa/NE+Z473p
         YCWiNxcGy4mWCJyUM6jA8flA6UABUoSapdK6rqFH7la6UcEgKXP7DjFok64uEa6Dpf+g
         F7+g==
X-Forwarded-Encrypted: i=1; AJvYcCVHv8PhDhc8j0fS6rKCslDu9tF6VOkReJxlrVFZqngxrNc9NojGGB7aqD5FEDeFgjmBZHwmT8HwhzwRx4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxEfiQZBo6uvkF47wVBmRFkONcZoP+nSyzMqSBzgtiOPkwW+Po
	YmgroRMsiIgm91DQNhX3urUAQGsFXWsoChvVYVH0ByrCMYUCbRVuG8Z2OZgkjK7K3GUmng==
X-Received: from dlbdz8.prod.google.com ([2002:a05:7022:ec8:b0:128:bbbe:13df])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:e01:b0:12a:6a64:81f1
 with SMTP id a92af1059eb24-12be63db71cmr11894c88.5.1774972114169; Tue, 31 Mar
 2026 08:48:34 -0700 (PDT)
Date: Tue, 31 Mar 2026 15:48:26 +0000
In-Reply-To: <20260331154827.2793269-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260331154827.2793269-1-xur@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260331154827.2793269-3-xur@google.com>
Subject: [PATCH v9 2/3] kbuild: change --thin back to 'T' in $(AR)
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,linux.dev,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12401-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2923736C33D
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
2.53.0.1018.g2bb0e51243-goog


