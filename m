Return-Path: <linux-kbuild+bounces-837-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F3E84AAFB
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Feb 2024 01:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3AA91C23BF2
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Feb 2024 00:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883A63C38;
	Tue,  6 Feb 2024 00:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="PElaE5FL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF642595
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Feb 2024 00:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707178435; cv=none; b=n3D+qm93K8webr14mdXYEvaKvy41tIVwat4+o4hGZZEl7cw7ZBoyJTRrX3+tSwZFG5a2xx+4Qc2qfH2IEpGOS+x1pZr/S9/Nb1QmYksW5Q8yOznnRZdQ7ap6uddZGHv2RqPcr8dDFEX9D48Uic62kJvWDmQn4STqoStxuU0WTu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707178435; c=relaxed/simple;
	bh=PZg3QWq+/GKgfZZA2qyqx39P/kRDLKfoOfmCw8uE3uc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KUkDIHci8eX1u8LNOp732UlvLCovbMSe93uPHa29eEhCx7hNYXNBX7LA4FESXyAu5qakZJKZPg9qDVVvaKcju/H491Qeb/Vq9jjrQpnUQqIOBp4SGu3Y660MPRJ/Nm0iDIbWvTEnX3mmLNaeCTuMQf3uR76zC/fG0KWqwA2ymXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=PElaE5FL; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33b29b5eab5so1730447f8f.2
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Feb 2024 16:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707178431; x=1707783231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGAprqtgwfmvAPo8XwmHq4MOLLyHp0qoLOC+fnp28mc=;
        b=PElaE5FLEeILIlVeSxLGe4wVM5aEf37u5b3k2Qcauh07I6v6rK2PfXkoxmdkooKxcN
         AZFOqSANlvjAbO5Wl4FMgfKUHAqErEbdLs0CY2M20hvIZmc/+n97TGqQ/LYvw2Pay62Z
         5AHjAM64kvfbJ5x/96v0FNbqoBPtpQv+VYijhob1gEWUYFiBg4A4qMHckPET7u2ADGXO
         uZdIyj9Q+ZClFGOvg3KBuqej2KVXvk5zd3B822rEBOhz00mcHT7tCOzKDI1zTqcT9fJa
         aR1GgriaiZOxe5iifa9EKAx5k3lfnoxAVqegvVB7EUZtnJoaVfj4Jfv/be6eRjD+h4cO
         9JiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707178431; x=1707783231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGAprqtgwfmvAPo8XwmHq4MOLLyHp0qoLOC+fnp28mc=;
        b=iQqaU+Q03GTTEl5OXCqYT9xhZTNwMPvIrGjlyj1Vhdtv569mG9YxaU+gU9AE3GTlui
         TuICFihNDAoS4/LUtmjnz5ltJXnDstSWr+TKzLEP8LC13knhGgtSuXklBsTw1LC/fK5R
         6r7gp0UJE4rEcie0NecwlzNNwSWKHw1GiwZEFJ3ZF4gRWJto5V/4XKEhHeED/DCxqouB
         w8JdDLgv3po6zbfHeDdjaW7Ib1C98H+WwxJRFYxcAQ7A8RjDgM0S3R7zhpgJX1KpiNcN
         AsDsbuXXk6nv9eGLnez75JOiazNwsMowL6JvRl9yUgXm+MCmd2ra3FzUveG/9lmrvQTv
         tBuw==
X-Gm-Message-State: AOJu0YxaM2LmxceBPJp6OXh0aIRdDjt2dItQR3h2RmiofSVhIFNFY2zQ
	/9rLiHUB6fdY/2eZJG+HvWZBn4DFYfvr1YKcqqZRR/crCEE7ZYCifjrKS3I9LRQ=
X-Google-Smtp-Source: AGHT+IFVdveHEmqxwMT4/lrRvnliU1C6woy6CYFET1Y1uqw/pAcuN254xpaVv8itNDA24IGtf/7z3g==
X-Received: by 2002:adf:f342:0:b0:33a:ec79:f923 with SMTP id e2-20020adff342000000b0033aec79f923mr42991wrp.54.1707178431092;
        Mon, 05 Feb 2024 16:13:51 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXSkm+KM6a//GM/zt8jAHlWsL+R+s9l4YXJWg1ms9wE3bjkViT7qTUvsy7b5e5PiupkD2cg693R32UTsr918zPuNWNygjG+uFSovIBuPxd5Xm7lK2IijJ2BZaSurM3ygYbTl+DotuZr2x6cWpTPXZNLyJb8/OI1MHQRo2Ghheug212Tbf6xxTZBkpMoAylnuIwCCECEsubpc09Jntn/OM89NdVfKWA3+p/ywO1gWdanNHX05R3kPNp9tFvc0P7HnuwEixWBjJX+iR3KSUD7XUrbFN6oMuhAC3uzEUTnkocCLQNsopJ3RiUcgeCAjC+Kqf8r5ORhxmxKs6nvX94tkKsvoJZBvL/rRS2V/9fmv+rg9u0A+xpyGFNPxEGRXvm1k2Y/xAcXZMlP44j9FZESuS0up5toeSJNMu1cZJ6/ggWx7n3p/ucG/mFjYeXCAM8AJDCsccm1phCeQTjjcPlgKo4jfk6EVJN0pZK2KKJpZmK0e5EvIYQ7FjcStkmYMqz00z8dmX5YR1pth/yFfrHAIch64lGYkAIMifoFVLcviHFaJ9KHw6E8/7fATdGDugocyjUvuykyXJF8ENryYOBMe7c6lkiKGYUMDp3miQX8Mgbwqp5oTYXKV9uNa6z/ANe1VjvGnwT0u1LV02nZzE11Hl84MmT5Aqgijx05nV0MLtnPuQgUHIqcXWUnqB7AwLeIIQAhAiyDEHlmhXZRxWTsboWbiDgBZksbBHmBtpJ6eEfzTHBP6/GFSaD/6Vfh1kdSf7gQdL48+HB8FBzM2VqRr0Jj6rNqZhvXiRPeQx8rcq5C/lg/qgOf9ldIZP6Tk3z8tQ==
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id b17-20020a5d40d1000000b0033ae7d768b2sm686959wrq.117.2024.02.05.16.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 16:13:50 -0800 (PST)
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
Subject: [PATCH v4 1/3] printk: Fix LOG_CPU_MAX_BUF_SHIFT when BASE_SMALL is enabled
Date: Tue,  6 Feb 2024 01:13:31 +0100
Message-Id: <20240206001333.1710070-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240206001333.1710070-1-yoann.congal@smile.fr>
References: <20240206001333.1710070-1-yoann.congal@smile.fr>
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

This patch fixes this by using the correct conditional operator for int
type : BASE_SMALL != 0.

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

Petr Mladek <pmladek@suse.com> (printk maintainer) wrote:
> More precisely, it allocated the buffer dynamically when the sum
> of per-CPU-extra space exceeded half of the default static ring
> buffer. This happened for systems with more than 64 CPUs with
> the default config values.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/all/CAMuHMdWm6u1wX7efZQf=2XUAHascps76YQac6rdnQGhc8nop_Q@mail.gmail.com/
Reported-by: Vegard Nossum <vegard.nossum@oracle.com>
Closes: https://lore.kernel.org/all/f6856be8-54b7-0fa0-1d17-39632bf29ada@oracle.com/
Fixes: 4e244c10eab3 ("kconfig: remove unneeded symbol_empty variable")

---
v3->v4:
* Fix BASE_SMALL usage instead of switching to BASE_FULL because
  BASE_FULL will be removed in the next patches of this series.
---
 init/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index deda3d14135bb..d50ebd2a2ce42 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -734,8 +734,8 @@ config LOG_CPU_MAX_BUF_SHIFT
 	int "CPU kernel log buffer size contribution (13 => 8 KB, 17 => 128KB)"
 	depends on SMP
 	range 0 21
-	default 12 if !BASE_SMALL
-	default 0 if BASE_SMALL
+	default 0 if BASE_SMALL != 0
+	default 12
 	depends on PRINTK
 	help
 	  This option allows to increase the default ring buffer size
-- 
2.39.2


