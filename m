Return-Path: <linux-kbuild+bounces-12102-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AOuCMWSvWnY+wIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12102-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 19:32:37 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 246AA2DF762
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 19:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 10160301D548
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 18:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DCFD3EAC9C;
	Fri, 20 Mar 2026 18:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KaJFJzPa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52633EAC7A
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Mar 2026 18:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774031384; cv=none; b=Iv4jCx16NcujJjqM3KVSWLk1HhTGTwmJdNxQeO1+FxJ0mbEgp2Jj41cofOsETwm6lMNDqYwD3g5Ry1yEyBM/pvRyrVQihIaR1MQkJDEriOt77CTGC1Z/Z+TVB/ilon8xUuP5ta4OqONlQF4faCHHvDzLTMYJ3cq1C0+FUVYsnEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774031384; c=relaxed/simple;
	bh=cpG8FMOz2DdVE7NDetULkNb5Rgu46fSihd8mpdjDxpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iZ3MUcbIiZ/cOnoubrGDOeFI/bpMSifnSePAUaFXYIzWYWBOEMYwSQ20QlrKqP5oJ9J9M65gf1AHKC88Y8xBC+rockzsbq2sb+s9Nw6yzGj47oqkNkrWeLZ8WF672+YEivJOSpfM9C6+AsQxCXX/aCCQLFVgAgLaDZP3095+AIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KaJFJzPa; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso18579885e9.3
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Mar 2026 11:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774031381; x=1774636181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rA24wnZPGTtYWW5mEcxJWsdXnmz/t11mmo2UtnUImAQ=;
        b=KaJFJzPaLAJf2Wiree5mJFAjBqvzziaRSFucfJvuh77uDAPsvHtGqicBcLKDpIs9N4
         1eKNU48cpHjsrlM2JXCZwV7pAzgnnwF9Z8dFRhmnDc6fokZYtNfYVlgTtBqzqwlLhADI
         g45m3gj9zHcpUrJaX8GuBrcaNPCBpTJ8P5u3MkWbo+Ts9VRrD2QM5VLtHS51GYvn9cQ+
         r3rtWRzfHpUpViGs1wQDfrLK9yXEFolPL1tCejw6lgF0uzXS0ENSMv3WS9+ZZNXVDoe/
         1mY1KQuMfZJnVQzVuMBMViLfxNgeVhTdoHCE0yNjovL+YiTxZ0iD0uRdZOVZaoEKZqTD
         KKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774031381; x=1774636181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rA24wnZPGTtYWW5mEcxJWsdXnmz/t11mmo2UtnUImAQ=;
        b=ZbrC3OtMkH8PZHAZ8kl9o+tTZoDiqk7zG92tPtrrwAEPDFHxFfj9Cf4m/hecjBFoQd
         cHoQvAXPenAGhwbl64CHjNQXXri8ysFqOu+CCWSyrQlDQLqsfVbxz+iCGt11rOo9M2by
         7hfCQTcm72agc+Q7FqglC5kY7JGmuNR7OpXDsWZlXmv+w72+QINmWkgrzetlaw3oqavI
         /x/zJVhR5pR5jC08cCBzw0ALOEY2WFqxoyJl/+LNzRLMPeaETjx/aGx7uHOOm19ljqwB
         LyziT14bimGrAUhOvBRGTeEFf+AEPZfSZu80uhPxQ23UPN6cEkhQdJRfQwahIW2KFxTg
         iA2g==
X-Forwarded-Encrypted: i=1; AJvYcCU6JwRzrvOFZ51MhKeqecvnuny0fOFYZtT6TNfQOcD/8scUbrJdgywjRxPW5yyH9QDfKgZRLja72/2mIQU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6HG1rh05HNIoCCbbA5wANvwb1YXxnTSYTLlfSs8QeG64cX+wR
	8QhzS+AQLCVSjxhNaBYcGBsDT6UtKaFtcuVqYOJWnYUwvAE9X7AyGhwBEJToYAB7jDlb2ZCMGAj
	0//fT
X-Gm-Gg: ATEYQzzrhHjIV82wg8SlXF7x8mlndvIXNDOsYBpTCSWURCB6VhMuxCKOqP4w/z70fnA
	0vU5UORiej1Y+pbmwa0zMoJYZEbEwwJAHCBXVl6DxB2a5xEQHADDIPWkE3tyCp6rzsmLTlblrtF
	zJvTwDDOVL3y8HrUOxyJEAc5Z/7OCjyFAUBZAhAHaBqMe6EVoKa0L519q+iuRdW1jPdE+CalhV8
	R6sqRBMrT82yxmjvf5j7zzblWKHBvU9UKpu6pELwOuJRYKNgTt81J174tszOEFcvBNvO5zraWgL
	DHgZRz5VaGerCf25MWtFT9vt5bD29d3YTaUNalnrqYxCS4GBn994qjk/peOvzWMHqC745BvHIto
	36uKAO71yqqKojsUlG8iY7cZm9wbFzdVuug8zj0AUYX/asYL1zjhMj5W0nO5+8iZee6OHDUyMYJ
	OyvqtL3WUfDQ==
X-Received: by 2002:a05:600c:8710:b0:485:49c5:8eb7 with SMTP id 5b1f17b1804b1-486fee049b8mr57609475e9.22.1774031381174;
        Fri, 20 Mar 2026 11:29:41 -0700 (PDT)
Received: from localhost ([189.99.238.44])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a9054bee1sm19590707b3.32.2026.03.20.11.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:29:40 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 20 Mar 2026 15:29:20 -0300
Subject: [PATCH 5/6] selftests: Preserve subtarget failures in all/install
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
In-Reply-To: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
To: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774031363; l=1910;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=cpG8FMOz2DdVE7NDetULkNb5Rgu46fSihd8mpdjDxpY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDMVmx6RaJvh6ZDL3DpDxYeaGitgTI1K4JwSL8awdClLmxe0/DS5gSxplARYMTz0tTK8EUb7pLb
 TUpDgbMGFWAc=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TAGGED_FROM(0.00)[bounces-12102-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rbm@suse.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid,run_kselftest.sh:url]
X-Rspamd-Queue-Id: 246AA2DF762
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Track failures explicitly in the top-level selftests all/install loops.

The current code multiplies `ret` by each sub-make exit status. For
example, with `TARGETS=net`, the implicit `net/lib` dependency runs after
`net`, so a failed `net` build can be followed by a successful `net/lib`
build and reset the final result to success.

Set `ret` to 1 on any non-zero sub-make exit code and keep it sticky, so
the top-level make returns failure when any selected selftest target
fails.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 450f13ba4cca..0949f370ad78 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -209,14 +209,14 @@ export KHDR_INCLUDES
 .DEFAULT_GOAL := all
 
 all:
-	@ret=1;							\
+	@ret=0;							\
 	for TARGET in $(TARGETS) $(INSTALL_DEP_TARGETS); do	\
 		BUILD_TARGET=$$BUILD/$$TARGET;			\
 		mkdir $$BUILD_TARGET  -p;			\
 		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET	\
 				O=$(abs_objtree)		\
 				$(if $(FORCE_TARGETS),|| exit);	\
-		ret=$$((ret * $$?));				\
+		[ $$? -eq 0 ] || ret=1;			\
 	done; exit $$ret;
 
 run_tests: all
@@ -274,7 +274,7 @@ ifdef INSTALL_PATH
 	install -m 744 kselftest/ksft.py $(INSTALL_PATH)/kselftest/
 	install -m 744 run_kselftest.sh $(INSTALL_PATH)/
 	rm -f $(TEST_LIST)
-	@ret=1;	\
+	@ret=0;	\
 	for TARGET in $(TARGETS) $(INSTALL_DEP_TARGETS); do \
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
 		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$TARGET install \
@@ -283,7 +283,7 @@ ifdef INSTALL_PATH
 				OBJ_PATH=$(INSTALL_PATH) \
 				O=$(abs_objtree)		\
 				$(if $(FORCE_TARGETS),|| exit);	\
-		ret=$$((ret * $$?));		\
+		[ $$? -eq 0 ] || ret=1;		\
 	done; exit $$ret;
 
 

-- 
2.53.0


