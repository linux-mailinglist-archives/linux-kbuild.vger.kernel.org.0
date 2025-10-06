Return-Path: <linux-kbuild+bounces-9015-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8284BBBF1C6
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Oct 2025 21:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3652434AB79
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Oct 2025 19:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0C62153D3;
	Mon,  6 Oct 2025 19:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t/GMkCz+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21EE2343BE
	for <linux-kbuild@vger.kernel.org>; Mon,  6 Oct 2025 19:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759779524; cv=none; b=o4YAcTePgd4uZ4eSD5BXmfUIpfEUQOBNEyH58WxbcdOjiGKvVXfmQGyVghLw59KRZs+IcoTU4PFSG2eQFH0VgN/6PhkNceEeW6RFVEIEwmbXzYKG5MLbejp8lW7V7w4QfI1a7dki+6PkPO6LgqwQjcdsFfNQemwqW3dw4B3AVLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759779524; c=relaxed/simple;
	bh=VQF2LXSGlQP3W/MDkTV4j7unbQPMUiohfQTSIaJZDC8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QcGFOCY+ypBdKkIaKPGl81HVyFjUfVM/92WU5CWpqGRM//e42KeWDeHuRvseIEZZUl48Ww7ugtOCawyvHDPMwldXnpLzw3rH2awJzcPSNVGghLUdYKpK5zCV+ti61FKIoVJavrghtk3vY5hs+dzydydMEOuJQlDawta79P4xMSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elsk.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t/GMkCz+; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elsk.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-783c3400b5dso3309455b3a.1
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Oct 2025 12:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759779522; x=1760384322; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+nCEBwh89g3XUZzPVJL+dQ9JxVGkwCZ7AP91nyqMUU8=;
        b=t/GMkCz+IRW9FVZHWpLNVd9ZwlZw0EvNN5CpMcqEyFcOVleK94zrDFIM5nb04ytr9i
         Q/WDsM9nkzn7iy8D3d9FYSdyZjLhf3Hx8mp/UzaGyVfsq3JzZ9eqgnsbajrkfN2b08E5
         9q3K0MJqaDnAQhrRJLvQrtGAlXzqxvf8Hvzn90tgdvlreiwI1+/BLlNWW9/eGsqA3qe5
         vUF+eRsjt9D8mRuCqlfJr9+u0kPpxpp+AIzjQvd90yfrjvnzzfRCDRTmozF2yUOLjfqM
         DT7UJNm4KysvzDhRWCCm0/a8CE4yB8uT3BtWp7Cvri4tw8bk+bom9XkLOlaH3PlxVkqb
         LRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759779522; x=1760384322;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+nCEBwh89g3XUZzPVJL+dQ9JxVGkwCZ7AP91nyqMUU8=;
        b=mUFBqxKv1I1EDAwvg2U7EZD7C1AThcipY3PqPHkZDDC9Pesicom0lowkfI8wilCtjn
         rnNRypQ0gYotaIZkPpsN1RojzTzFZ2O44aA7ispHcSi1Da4h8+pgPwXlCn5I/+AkMX7L
         RWvt93Ibc4gGjDSFCLXJn5ogkVNHudsrl1keHAMKV2ewbYNOXAGcgYSLvi8DwyDnLQDh
         +IJN5XVFdtsmNnIUyGo+YTyrmiGBfJycWZqrtBG+pItWVd9zK8u5rhkUSmusJj11oIXq
         sYw3puoH1LMtRhBQsHzu9dKSpoHMH4rpJ0lCFvZCRN9m2N/WPIDuRQx/Npa6G2uNS82d
         tWrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuYi5Buc98HMgmHHdfkm0Js4Cg/ex1AfP1LZiHRn6kk4RCl5+YtULkxzLPBVY/Z3u+WeYbtDNVvtv+NHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxupYT5zr0blgXGqIWfyCRfUkPecQn4IJ7oNYY33EqghDHLfuxU
	8uglDyPdN4YPitdUAxd+/mY9E+G4FRPnweq7+D+pgicVVsvsDjMc/1RwNxdlok/v0Q73fHHSpw=
	=
X-Google-Smtp-Source: AGHT+IFvvc9B5mdYrx6Sy0MQqzK00Y4aauSaAKkLd4Gonm/uFIMEusOdielln1wHO55KnekZT4mF05v/
X-Received: from pfod6.prod.google.com ([2002:aa7:8686:0:b0:77f:64ef:a4a9])
 (user=elsk job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2305:b0:77f:324a:6037
 with SMTP id d2e1a72fcca58-78c98a4914amr16210344b3a.7.1759779521965; Mon, 06
 Oct 2025 12:38:41 -0700 (PDT)
Date: Mon,  6 Oct 2025 19:38:38 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251006193839.1350626-1-elsk@google.com>
Subject: [PATCH] kbuild: use $(obj)/ instead of $(src)/ for COPY
From: HONG Yifan <elsk@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>
Cc: Masahiro Yamada <masahiroy@kernel.org>, HONG Yifan <elsk@google.com>, kernel-team@android.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Similar to
commit 9a0ebe5011f4 ("kbuild: use $(obj)/ instead of $(src)/ for common pattern rules")

This change updates the COPY rule to use $(obj) instead of $(src). This
makes Kbuild rules like

    always-y += libfoo/.foo.o.cmd

work when the user provides libfoo/.foo.o.cmd_shipped, even when obj and
src is different and src is an absolute path. This is useful when foo.o
and .foo.o.cmd are checked-in as prebuilts.

(Admittedly, `always-y += libfoo/.foo.o.cmd` is not recommended in
kbuild/modules.rst, "Several Subdirectories".)

For example, if

    obj=.
    src=/some/path

then the original rule

    $(obj)/%: $(src)/%_shipped

expands to

    ./%: /some/path/%_shipped

And when matching against the above example, the stem is just `bar.o`
[^1] so the following is looked up:

    libfoo/.foo.o.cmd: libfoo//some/path/.foo.o.cmd_shipped

... and it cannot be matched.

With this change, the rule expands to

    ./%: ./%_shipped

... and it should work, at least for files that does not have a more
specific pattern rule.

NOTE: that after this change, code like

    bar-y += libfoo/foo.o

... with libfoo/foo.o_shipped provided still DOES NOT work, because
the pattern rule $(obj)/%.o takes priority. For .o_shipped files,
the user still needs an explicit `$(obj)/%.o: $(obj)/%.o_shipped` rule
in its own Kbuild file.

[^1]: https://www.gnu.org/software/make/manual/html_node/Pattern-Match.html

Signed-off-by: HONG Yifan <elsk@google.com>
---
 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1d581ba5df66..e066b7b00bcc 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -272,7 +272,7 @@ endef
 quiet_cmd_copy = COPY    $@
       cmd_copy = cat $< > $@
 
-$(obj)/%: $(src)/%_shipped
+$(obj)/%: $(obj)/%_shipped
 	$(call cmd,copy)
 
 # Touch a file
-- 
2.51.0.618.g983fd99d29-goog


