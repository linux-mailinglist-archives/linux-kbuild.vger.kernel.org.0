Return-Path: <linux-kbuild+bounces-2815-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D759477FA
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Aug 2024 11:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E967B24832
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Aug 2024 09:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CED1DFE8;
	Mon,  5 Aug 2024 09:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hufp3lUd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF728145327
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Aug 2024 09:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722848950; cv=none; b=J7R5d6ZR/JQJOKtTnzFIO6BzdLDJ+1rLcbKNRXTVFdO1qgZKUhLyVizDhgkh9lvbAFQXG1KNrB0JgJKV9sEy5i8hD1jfZnfSYv5dm0Wv2oMASWVQ8n3pJ+n7Tb+sLRqo3QtfqWM0cx+rXog8y3eBSnTMSFEnam9MzvS0ZEhC71o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722848950; c=relaxed/simple;
	bh=PebdPvGqrmzS5oe05OjC+jip+HwRntEzpx7DBbsHDXk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=mWeHvBcBkuFJ8dhDT1dxNZW3Nb+vRNOtGx7BWIMrHfKLoD73ZQIvxeXh0YHrMgIaAEjU4caHRAeN5p346fi3Gfmuuk/ef7qbSvPxVtHV2qitMSbLdomq9new03NpMJ6Dp21uRRTqMlrjfUW/NpGThQM1p4A+39C/rUetMm5kTq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hufp3lUd; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gprocida.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-65b985bb059so213837847b3.2
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Aug 2024 02:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722848948; x=1723453748; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y5FVNLoC/hnhitK4NzfaIQHLLqsNbJYgmmmWn9laeoQ=;
        b=hufp3lUdTY2ooKIIDckmPjbuRM1SvY/1tfR1WvB+0c3DKpQWQ/peYe44RjLm3v7LMO
         fvzZm1QUsGDwWzIbTS1uyUXhiTOEuBc2HM6VVkF9hy3W1p1vWJ2BO9I5HQkIjXKLxGj4
         NbIlzh4Bmlr4QZDxTo7+Rw/laeTlN1JlNzsHjgQCo47K4gBGa2MDg/6Ec0TlmyqzNKdh
         cQMSTvOwr/1z/bmDyn8ZSeHTL529LAZ+64EcCY5lc/jsfon09h4GJtaov1EHIRTzeecd
         RIX7pGkBaHqv4TXPVVqu4sXs4L7etOL+kLPgsvxJc2dZhO3gr1S7jCBUQAaj8CJR56zA
         tUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722848948; x=1723453748;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5FVNLoC/hnhitK4NzfaIQHLLqsNbJYgmmmWn9laeoQ=;
        b=ngSOHKUp4EbW6szAgYOKU4ROWiTh8Ozmx2mBi9oI6SmXJdCjQDA+UqeFMnmK3586RB
         8uuwkrR04iYgqaLO6oavQL9HKVdbYiLL+MLc3DZpY+zxXmhewi5qOK8pOEdNVWVoVmhe
         LMCHY0C6uQpWM18Q5fDzG5JYv5FXZ96bst3lDQW9TlTX9hF1bTw+cPwldbsw3Sd2Zhg0
         AaEJW9yxqbVecMo+HiC7rG0Guwi6PjaUuTfOoH2JFzYWu8F0cT061qgIEudOH3I9bbcl
         TNel5jzkWZdGgkSSthp7iHbQJIcDwmG43piquXTdKh5xTl+jlY8fhBGCTUMYu1uG7fb/
         K7vA==
X-Gm-Message-State: AOJu0Yz8OBUmVP84wWbG0vI7qqjt+SZ2oV981PgetDr66pTwvXt0gQTV
	CfwQO4dDKBB4Ond8EBPrcP0zv+QD9Dh7A2rZlQqS6JUfC/qFdRvgFayrtgwoqiMY4ohgauQfnRm
	7oSmF96TaJw==
X-Google-Smtp-Source: AGHT+IEwAhgF2udfnLqsvv93LRdzFVrtiNG9qx2cXCE6kbHr9BUUPYhcAbFcgzd61y3Vrca/HAJCV1rvuRiSZw==
X-Received: from tef.lon.corp.google.com ([2a00:79e0:d:209:1e03:18ea:47b:ae79])
 (user=gprocida job=sendgmr) by 2002:a05:690c:d8b:b0:691:3acc:eb2d with SMTP
 id 00721157ae682-6913accf3a3mr401937b3.4.1722848947744; Mon, 05 Aug 2024
 02:09:07 -0700 (PDT)
Date: Mon,  5 Aug 2024 10:09:00 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805090901.53986-1-gprocida@google.com>
Subject: [PATCH REPOST] lib/build_OID_registry: do not embed full $0
From: Giuliano Procida <gprocida@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, kernel-team@android.com, elsk@google.com, 
	Giuliano Procida <gprocida@google.com>
Content-Type: text/plain; charset="UTF-8"

Using $0 makes the output of this file sensitive to the Linux build
directory path. This is problematic for reproducible builds as it can
affect vmlinux's .debug_lines' section and vmlinux's build ID.

Signed-off-by: Giuliano Procida <gprocida@google.com>
---
 lib/build_OID_registry | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/build_OID_registry b/lib/build_OID_registry
index d7fc32ea8ac2..06f242202036 100755
--- a/lib/build_OID_registry
+++ b/lib/build_OID_registry
@@ -35,7 +35,7 @@ close IN_FILE || die;
 #
 open C_FILE, ">$ARGV[1]" or die;
 print C_FILE "/*\n";
-print C_FILE " * Automatically generated by ", $0, ".  Do not edit\n";
+print C_FILE " * Automatically generated by build_OID_registry.  Do not edit\n";
 print C_FILE " */\n";
 
 #
-- 
2.45.2.741.gdbec12cfda-goog


