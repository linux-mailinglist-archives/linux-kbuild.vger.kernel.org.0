Return-Path: <linux-kbuild+bounces-10953-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPWkAeuVfWnQSgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10953-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 06:40:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F46DC0E39
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 06:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 21BEA300363A
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 05:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5773358B7;
	Sat, 31 Jan 2026 05:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stennet-com.20230601.gappssmtp.com header.i=@stennet-com.20230601.gappssmtp.com header.b="tufskf4s"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636E032BF3A
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Jan 2026 05:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769838055; cv=none; b=WT4Vq6zFW1g4wiE0f1+ioQZbXpBowzE7XSDBH9yvP//aw+prN1v415SFhF6+VtkutGwBDXgGHO191zqDmPyzFI76CKiepgQoB2wFWJJKTN62YLRM/UdFHyHUopXUvCQbPobHTrCPYIoYTf46T7MBw7THVc2STovOUtczG/4nHBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769838055; c=relaxed/simple;
	bh=Xb/h/Vac2G/tqTulade8NVwFrL8Hd47vuG5+InSj1ak=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BHmBddSTcnv9R48o5CWa04R8kxhe2PiIMNI1sr5VYFxIl9VzEEDzjzJ5hBoU/Co1c3YkSYp/9ZhpvbNWM+oBsBV11QyFSjJ/8MVnduAwEQKEwQBCY4xzDM8/TWDjd71dUd82G63Jrfe/psByL8VHkDe/u4YZV8l6BYYktc+vG24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stennet.com; spf=none smtp.mailfrom=stennet.com; dkim=pass (2048-bit key) header.d=stennet-com.20230601.gappssmtp.com header.i=@stennet-com.20230601.gappssmtp.com header.b=tufskf4s; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stennet.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stennet.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1244bce2c17so98225c88.1
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jan 2026 21:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stennet-com.20230601.gappssmtp.com; s=20230601; t=1769838053; x=1770442853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EHXC0+5WwGjzxO6nhB0I9+Yv+MYJk1jowBhHlsrX7Y=;
        b=tufskf4siKyfNrFCzGGOqz9gnmAhZueoP7SrN0T7uwk9LqcI7FlIqWR6RbmgDdtV1Q
         JbhM448P3FV3l4m2phZxkAaqRD2CijwprMK8+XtVMiQBH+ECzB0GW68luoVWWIP7fwgI
         PqP/iz+diCAqFpYvkN6J49AdfelNxQNDQeK7Q81v4uoicimx78BKuB+PJKUW7cCOLGfG
         Js+TmBvtsODVH+deSzPdlAqhHu7Jt8PYoWhKOTtnxke7GpbAgjIwF2KhvsW43/EN2xCW
         lzE9JatcmwcpkuTX0PTU3XkmOSkGm6Va0YEOAT7l3Q1w2yqa3zrZ+PeLbuVsvNo7cTrP
         o4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769838053; x=1770442853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6EHXC0+5WwGjzxO6nhB0I9+Yv+MYJk1jowBhHlsrX7Y=;
        b=IQThAL3A6B9d0ZPbvSnEEJicc5iBLVGzRbWXbs/V01+1uM1pDkx69TkNJ7bH2bqO/N
         mNfCvl3+sVveSe1sLsmQyM5P1k1DzVu2m0iYu62X/yimhy9BJUPZnQ6u/x4q+SJ+WRuo
         shEIuTPfn9KaVuy4T71ufaDq8B1/RAdSuY8qDOqZIBktt+i6RViswbt8j/sBqC6tKGKY
         2+ljObFL7BKeyEEc80cLBLrAiQdOdL+KFbxqAMvvua4H2DCzkvBGFUce2/2q/8M5G1x3
         MkUeDhgkHfvzVpc07inLD24VvVkywLNl24Pb86ml52k9dtwLj3ubv7BkngmcL1Y+gSBj
         0zWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwyDBMrNv3BHVX6Mwwj1mYbdpxQ8LV68IG6QLO8VKcizZl/MvSsCRf6/UVyC9FB8+qZx9vypCpbFvPFLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHgG/jzUNc6LiC/5yDA9WdQgisQf9JaUNMuRd7oaBDdFns8jQY
	ituVfAFT7paQ3GoGHYBvepaei2Z05sXYgswdcYy0D2Cshq78TqUUFGDOJIbrp9ovwZs=
X-Gm-Gg: AZuq6aIiXeZtTzV6oCFfElgocxQ8DP46YwDzaGGtuQ3MBpVjh5Y54eo6IWwHtHE6WGm
	U/Q9/6wOJx5QCCtJft4yXLIxv4ur06STbnBzQHOHr3wAaOtaiIoN46GehKjN4Ld9+68lnNiKhTv
	tbnFaKgF3vwY9fP0mE1GKIu2LnvpLqjgAcND3oty8Mvk8HkQwrPhpsliNeCB1VpXqRLA0X6grOd
	AVg9nCvpeFOTKPAsfYlW6CCyV/Aq0S84Io5ZhETK4Kv9Prgl3yqDxSCnlg7rqREkt9tejti6uA8
	AQs6a3MyGV3hK6CXKUZ29aJIBEH6vh3cGx3TBIKMaw7Zn7E1NLAA1+hE891jhGUNP3D7ld9QLT5
	0wO73OxfAVOD6CWH4UjqDbmLYQguAGjVZfRsl1DfYLFG96zIiAdS4MyRSISYP6h0UcqaiNZ77XI
	dBlXkCIL2jbti33ucqiAnb7IPtioE=
X-Received: by 2002:a05:7022:220a:b0:124:9e46:830e with SMTP id a92af1059eb24-125c0f95649mr1384888c88.1.1769838053230;
        Fri, 30 Jan 2026 21:40:53 -0800 (PST)
Received: from david-XPS-15-9500.ucsd.edu ([128.54.167.73])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7bb9ca10csm8764306eec.30.2026.01.30.21.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 21:40:52 -0800 (PST)
From: david@stennet.com
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Kees Cook <keescook@chromium.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] Makefile: Globally enable fall-through warning
Date: Fri, 30 Jan 2026 21:40:50 -0800
Message-Id: <20260131054051.6938-2-david@stennet.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260131054051.6938-1-david@stennet.com>
References: <20260131054051.6938-1-david@stennet.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[stennet-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10953-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[stennet.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@stennet.com,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[stennet-com.20230601.gappssmtp.com:+];
	FROM_NO_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mitre.org:url,linux-foundation.org:email,chromium.org:email,socionext.com:email,embeddedor.com:email]
X-Rspamd-Queue-Id: 8F46DC0E39
X-Rspamd-Action: no action

From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>

Now that all the fall-through warnings have been addressed in the
kernel, enable the fall-through warning globally.

Also, update the deprecated.rst file to include implicit fall-through
as 'deprecated' so people can be pointed to a single location for
justification.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Kees Cook <keescook@chromium.org>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 Documentation/process/deprecated.rst | 14 ++++++++++++++
 Makefile                             |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
index 49e0f64a3427..053b24a6dd38 100644
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@ -119,3 +119,17 @@ array may exceed the remaining memory in the stack segment. This could
 lead to a crash, possible overwriting sensitive contents at the end of the
 stack (when built without `CONFIG_THREAD_INFO_IN_TASK=y`), or overwriting
 memory adjacent to the stack (when built without `CONFIG_VMAP_STACK=y`)
+
+Implicit switch case fall-through
+---------------------------------
+The C language allows switch cases to "fall through" when
+a "break" statement is missing at the end of a case. This,
+however, introduces ambiguity in the code, as it's not always
+clear if the missing break is intentional or a bug. As there
+have been a long list of flaws `due to missing "break" statements
+<https://cwe.mitre.org/data/definitions/484.html>`_, we no longer allow
+"implicit fall-through". In order to identify an intentional fall-through
+case, we have adopted the marking used by static analyzers: a comment
+saying `/* Fall through */`. Once the C++17 `__attribute__((fallthrough))`
+is more widely handled by C compilers, static analyzers, and IDEs, we can
+switch to using that instead.
diff --git a/Makefile b/Makefile
index 9be5834073f8..bdf8eac51b07 100644
--- a/Makefile
+++ b/Makefile
@@ -843,6 +843,9 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 # warn about C99 declaration after statement
 KBUILD_CFLAGS += -Wdeclaration-after-statement
 
+# Warn about unmarked fall-throughs in switch statement.
+KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough=3,)
+
 # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
 KBUILD_CFLAGS += -Wvla
 
-- 
2.34.1


