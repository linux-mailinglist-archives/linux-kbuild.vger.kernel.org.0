Return-Path: <linux-kbuild+bounces-818-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A198491AD
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Feb 2024 00:31:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD0501C21BF5
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Feb 2024 23:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF5610A3B;
	Sun,  4 Feb 2024 23:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="uPfwFAqj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B12C8E0
	for <linux-kbuild@vger.kernel.org>; Sun,  4 Feb 2024 23:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707089426; cv=none; b=WIrUSLmuG0te8H6sN4U/4hfC6p25iE458PS6B2y2Ot91rO06KnIPVeGRQj54OTqYd/l/VVsMuWqZ6DCRvBkJYEtL/r4HFQpmC7VHTDHMipO1AUZaFKslb8ikowv1eNi6ICWokwY+RF+0hqFVAYW5uXoTaoamjGKEd9auV1kRZeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707089426; c=relaxed/simple;
	bh=wbFIUY1/ZnkZ/DTm8DYHOzPmMvhx+/DzwbZmttnRxbA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jx4q6cIspZGgjsQxUSEIBxgyhzT6HYl949/hJCDw9Z3cZ0FG8/eH3oU/KlI3H+ZNAP7YSrqLFwMq/fxIfBm/2QovGGD2aTjXrHbr5Wcqrol/HJLegj5RtNMgihtQ+huWdbliyeZLR2O4niM49HZEw6QBVcJy650F+gZ+7doub1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=uPfwFAqj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40fd55c7f93so8150835e9.1
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Feb 2024 15:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707089421; x=1707694221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxGWGp+6jPj4xTLQgzHWqH1VGj7PXUyGIryFKMHnKQg=;
        b=uPfwFAqjGVRtBSYdtN+Qbq9Do4aQgkVInB7hRC57v5hSxmfVxr2hcEHja+l+lRlZg4
         jC/CKqDalqlA6ySpXhQg5/kVOot9ojBBijUcn1l9+GpEp8Wa9x8j1ReYyN9cFAwnSbyo
         VLg3QZ9Dsaij2PL8QohnUWzbJBO/+wT5M7QzlqJTZo3lR1suammEjQZ7GWj9kTz1ttZh
         ieKihTZ7pXEd9R4Xk4pUce4mfQ+irCVKPNHX7opVhmfwILQHOHLNS5e9mXPR8MH5XFrh
         cDa/SvgIc8BOgZEl3aOIbt7m5SB7sVqGNusf4IKaQFW1CHPAae8xkdLmSm4o6hL3Zp+U
         M1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707089421; x=1707694221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xxGWGp+6jPj4xTLQgzHWqH1VGj7PXUyGIryFKMHnKQg=;
        b=vZVOH9pTTESQ0GNHj0mndLuJ0Ti/HMzmY22mpDfcJUnUjYe9ADItcCR2xYZ8NbrGEC
         th3fkGo//Jg56k4JeDaoylqnxmPR/Hq8dV0bM3jrluT94JpIc+vFm/B8kmv3yPF830Zo
         0nC8GTrhrB3gpkiZ+V7QjCDtr2NFgsSn5vYmq1RHhHSbzblq9OXjuxPlSVAb9o7xBwRe
         JQt0vSqWGAqRsa+H4uQ4n5wnrZMhi9iRQBgGN98twbT9RLPdFAiiWfo9dC3q5HsjHnxk
         NWNyvkvOoKLlKtmgltatODBSCZBgAdV5AjeZfHw9F1XzqNRZW6DTq2+WpDG08PoKXfIm
         Ee/Q==
X-Gm-Message-State: AOJu0YzjfGpMYISOm7skX443V0ddcNnG4xfIkkw3H16xhPNv6NNqZuds
	pgx44F5KYPRDzT2vqLrRJVFsPTqcsXBJfcOFZJoLdabT8KejkV9Z96QYVoWc35w=
X-Google-Smtp-Source: AGHT+IFirEdPLOyzQXr9p+E787UeScAe7YYb3aVfkwQbDucbsTcOK0WFaldLHcsCnoJBJ9C34V7NpA==
X-Received: by 2002:a05:600c:4fc7:b0:40e:f656:39f with SMTP id o7-20020a05600c4fc700b0040ef656039fmr3577612wmq.6.1707089420627;
        Sun, 04 Feb 2024 15:30:20 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX/iKPsTLU6Hi82jp6bWBEzSAl/HiRvzAsG3U3m/tDs0QY8pyvyH6sMvXqECuguMeq2yUIMDK5e4Moqkkk7H8COHkS/CxIT/BUm9qt1zVjBRY0XYwmJKifT3jJvJJLnDPjLvZxb+yCmBQTb/ppIZyiLBVJzWAl+umeVfZvPpvW5uVrAcch0We5hetX/CSo9hcGtehY/IckhhBWBAfFLQb2q43lgYimgFZ/jtLR6onScdb5AT+HFoVTb4XzSWeCTChLkuO7f5XGuijB8vlUrd096viUEW3gfOeyr0Ah/bRmBokCkW5EWtbJOXCUMiQIYRcaVg4i/YF61nGWwTmEyDhot358jC0DpwMOwGRQz3wEbNvSAHyw62y9/Fx0UAStNxlsnNpsKjE1sMsJrtHVkb8KOsMQlAQBroyNXSAwpupBCebOZKV+ME0shzNK3E8+p0BvyD/LV0HsjEUQkN3w948K2LBVhxtIDbbv8PO+9Grpns8qMXU+gfUellJ0GzW15V7OTL3gdCAR6X9uhzrtc98FuDrpm3iNZoT42VJ5cRtMhzvS0htQuQH+viXAF0tf0a91O0yFiEaRIs8nMg+9oR2iTVXeL7MhmwIhaVjxmXo262y0YEelNBNZfHNsatK+fxEwlkC1KIZSSUFlEx6FI/A2tJtyR+nR+S0q50EdSLOnhZUOVA5uhJFpc8+4MW+twFqMuOSWyGacVWQa5gFsc6X/5LmAXtlhtdbbtkyHZtE03hyihx2pCBzqK5w4GClqrdE7kuo9WteMoHQe+0ktIfn7iP7iLAi+E2Zx5W/KWXNNbMoTxRWwzCaS0CS/SOGslAA==
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id n13-20020a5d588d000000b0033ae9e7f6b6sm6822576wrf.111.2024.02.04.15.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 15:30:20 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: linux-fsdevel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	x86@kernel.org
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Borislav Petkov <bp@alien8.de>,
	Darren Hart <dvhart@infradead.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	Josh Triplett <josh@joshtriplett.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH v3 1/2] printk: Fix LOG_CPU_MAX_BUF_SHIFT when BASE_SMALL is enabled
Date: Mon,  5 Feb 2024 00:29:44 +0100
Message-Id: <20240204232945.1576403-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240204232945.1576403-1-yoann.congal@smile.fr>
References: <20240204232945.1576403-1-yoann.congal@smile.fr>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LOG_CPU_MAX_BUF_SHIFT default value depends on BASE_SMALL:
  config LOG_CPU_MAX_BUF_SHIFT
  	default 12 if !BASE_SMALL
  	default 0 if BASE_SMALL
But, BASE_SMALL is a config of type int and "!BASE_SMALL" is always
evaluated to true whatever is the value of BASE_SMALL.

This patch fixes this by using BASE_FULL (type bool) which is equivalent
to BASE_SMALL==0.

Note: This changes CONFIG_LOG_CPU_MAX_BUF_SHIFT=12 to
CONFIG_LOG_CPU_MAX_BUF_SHIFT=0 for BASE_SMALL defconfigs, but that will
not be a big impact due to this code in kernel/printk/printk.c:
  /* by default this will only continue through for large > 64 CPUs */
  if (cpu_extra <= __LOG_BUF_LEN / 2)
          return;
Systems using CONFIG_BASE_SMALL and having 64+ CPUs should be quite
rare.

John Ogness <john.ogness@linutronix.de> (printk reviewer) wrote:
> For printk this will mean that BASE_SMALL systems were probably
> previously allocating/using the dynamic ringbuffer and now they will
> just continue to use the static ringbuffer. Which is fine and saves
> memory (as it should).

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/all/CAMuHMdWm6u1wX7efZQf=2XUAHascps76YQac6rdnQGhc8nop_Q@mail.gmail.com/
Reported-by: Vegard Nossum <vegard.nossum@oracle.com>
Closes: https://lore.kernel.org/all/f6856be8-54b7-0fa0-1d17-39632bf29ada@oracle.com/
Fixes: 4e244c10eab3 ("kconfig: remove unneeded symbol_empty variable")
---
 init/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index deda3d14135bb..73efb76f38734 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -734,8 +734,8 @@ config LOG_CPU_MAX_BUF_SHIFT
 	int "CPU kernel log buffer size contribution (13 => 8 KB, 17 => 128KB)"
 	depends on SMP
 	range 0 21
-	default 12 if !BASE_SMALL
-	default 0 if BASE_SMALL
+	default 12 if BASE_FULL
+	default 0
 	depends on PRINTK
 	help
 	  This option allows to increase the default ring buffer size
-- 
2.39.2


