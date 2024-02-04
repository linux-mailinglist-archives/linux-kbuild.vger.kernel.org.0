Return-Path: <linux-kbuild+bounces-817-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D11A8491A9
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Feb 2024 00:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A29C82817AF
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Feb 2024 23:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BF5C2FD;
	Sun,  4 Feb 2024 23:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="FxjbEnh4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFA6C2C6
	for <linux-kbuild@vger.kernel.org>; Sun,  4 Feb 2024 23:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707089423; cv=none; b=bzfA+EiHza2eFOHPvMbrsOaKuBTGgJO95bNccgTZk74ZfX0+OXXYaD9oIxDY2bLX4qhM8TKoZJsgRrvEjKauC8CB/pEloqI9vLphHbsDMIyrafZHNUQc/mmMe3GsXxqlOEyhrPE6VIGJtRE+3uuoVuAccbGbur89gnGTcy6jPa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707089423; c=relaxed/simple;
	bh=K3bUn+GZczaYqZp1k8uytl2FDj/+fQ0WkGUZ6BZIAH8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Dg9Y25O+4lP90KzGPJZQoMetP1vvj3JX3EUbwDcIIa+9cL/7rV7fjJdKJQAcEictywRrppI12eA1HoEw0fCDoTD146tdi2KxLIvb03EhZqz+wjLKWh4VTxUAmu0Gtsfdh/KkzhdYlAx0ul4ObFunQN6nWmXyPZO6DRhBSquRw34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=FxjbEnh4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40f02b8d176so33700935e9.1
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Feb 2024 15:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707089419; x=1707694219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yEPb87LSwbm9jYroFks9JSGpfASa83NBo9G3kNUG/KE=;
        b=FxjbEnh4IIM7TeX/gehuQoHnfFWHxG5daQOU5H5tBGZee65PIvPQKLiZpUd43/wUcU
         V1fydOI5z2SUvgfTKiRt6hjFVE70wqG1BHMQzLUfVG9dBXI3J4CNyqw7HS0cG9/PXUpG
         6dhLf7ylgcIwS6jS6giIM/8mzXYfBZN03xjag9zw76A7jbiT4aFkd68SzTHiXmpRC208
         SV2oOOj05O2o9El/GRYpZ26ynUACMrZTMHFUpvQJdFxMy91ahDAGHJ8DBg7YaHXqYRop
         2b31Xky2QLuEQ1gpVQoWsrz6JXt4teL3UZSkGPvEz2I3vhpJVZA88Mv/3NEws/vswWZl
         0Rtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707089419; x=1707694219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEPb87LSwbm9jYroFks9JSGpfASa83NBo9G3kNUG/KE=;
        b=ZUjpg/AjWcDjnABYJJvTMJHsnMYl7K17vmxgco1srOXEDsxzkBARML15f3MJNfUQM7
         n2F7NJXIAa3L+pvraHpeuPj77SbPoP17EJ1+rrmZ/HscePM56u9xm476ZUaK1nfeBgjx
         lD0ZorIFaOVff5wYpYxObM4gjEOnKyPQrA+ZoYViR0C0alV6V1ltX68rP84ynyC36BGq
         F9Hfh/mMaR2ZULosKq0RAZb/ltLY4st3tzCCQ5y048HZ4d7yS72ebssuHRnZQHm/Cr5q
         50njKdIqMzxR8O8esWNA4EToE+LsvHjhTMYiAthw8O9uExiAA/WPPg65tMS3KfVv+S7P
         ETbw==
X-Gm-Message-State: AOJu0YxGH5j4xtKtt08PFU2VJcfAFhf95W9RmuQyOVLKJcXnj3tmWdPp
	LuwWZ8YTSwuTU6ct994sw5Kaf5O60580WF3Rd857zi4rVZu6c23n8WEnbHtG8kU=
X-Google-Smtp-Source: AGHT+IERCgUD6S8tICPLfqwYk0IObRcmvsVwXEjz9tYMS5SaR/gEB0Px5yk2IcRDaMmJGFFJaR2N9A==
X-Received: by 2002:a05:600c:1d91:b0:40e:d425:85a with SMTP id p17-20020a05600c1d9100b0040ed425085amr3551319wms.17.1707089419436;
        Sun, 04 Feb 2024 15:30:19 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX8lAa40j9Rf5TGlJvkrHev7zFKoJgkpWjLouHpg6XufKbRLABz6HodyDHWHPXxtx9i6kpvPoV5WEh4WJGYeXNGqlgDVWEA2hd8YrBppBhJPuRTomCMhKW+OJvn36PW8QR/hkN3Vnu12RNmdVXRqdlJ4Kxhr46cVDl7DSW9qnIFK74oo7dbj7WmS6o8Y/Z2ODb6uyp8QNOLbU1VufhZg4oiVUBsKktgx8fxxVxan3cSDJZ0rU9ksWHwL2LNsgGgcPOxOf5TzdjniFaqVt3No+uNBlIC1VCSi2Bq1/L9x+eMCQbiW113tIlCQ/UjkC4CW+rvClpktYvaPIpxAdTst4Ono323fkgXgpw4Ri+HsBp27bHShXGrIvfQSKWR0c4BsVw8xTaOUUYFmV3+tF8US9IVZ7cnlO2abGT3EHOwLxMwVqPAAix4DKbBSZD+NjTaXxPmnbFA4SD7rnAV4A/GiCtGJ4Pqws4B5eMbLdqllg16azQxxIaLuCe43I6fpIheG6JJwhmtavBE1chUcrJUnRp2cxcFBki0o4OiskaEm1SHwHKxKmPG4Od7LyUpCzxYJDh5+rOoGpD8sce8rPc2TFJ+QfJDESSksYOfLAJHlhemOPghYYVWpp9xRA1i7QtPHFm+0kIJj8FVJY4g1vewqfoLxgI4WsWAyQFWRJJ2bFuVpoWocqej1AV0v239PpKdTq30Ekt7NNtU4AodG7+Z8TUVbt1TIGUK1vV8VAHKlt+mH5g/42hwwMBgHphSB4egeAbvMlKLRaR56V9eCpSA3sLlT5ithvs=
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id n13-20020a5d588d000000b0033ae9e7f6b6sm6822576wrf.111.2024.02.04.15.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 15:30:19 -0800 (PST)
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
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v3 0/2] printk: CONFIG_BASE_SMALL fix for LOG_CPU_MAX_BUF_SHIFT and removal
Date: Mon,  5 Feb 2024 00:29:43 +0100
Message-Id: <20240204232945.1576403-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series focuses on CONFIG_BASE_SMALL.
The first patch fixes LOG_CPU_MAX_BUF_SHIFT when CONFIG_BASE_SMALL is
used.
The second patch globally replace CONFIG_BASE_SMALL usages by the
equivalent !CONFIG_BASE_FULL.

Patch history:
v2 -> v3: Applied Luis Chamberlain's comments (Thanks!):
* Split the single commit in two : one functional fix, one global
  removal.

v2 patch was named "printk: Remove redundant CONFIG_BASE_SMALL"
https://lore.kernel.org/all/20240127220026.1722399-1-yoann.congal@smile.fr/
* Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>
* Reviewed-by: John Ogness <john.ogness@linutronix.de>

v1 -> v2: Applied Masahiro Yamada's comments (Thanks!):
* Changed from "Change CONFIG_BASE_SMALL to type bool" to
  "Remove it and switch usage to !CONFIG_BASE_FULL"
* Fixed "Fixes:" tag and reference to the mailing list thread.
* Added a note about CONFIG_LOG_CPU_MAX_BUF_SHIFT changing.

v1 patch was named "treewide: Change CONFIG_BASE_SMALL to bool type"
https://lore.kernel.org/all/20240126163032.1613731-1-yoann.congal@smile.fr/

Yoann Congal (2):
  printk: Fix LOG_CPU_MAX_BUF_SHIFT when BASE_SMALL is enabled
  printk: Remove redundant CONFIG_BASE_SMALL

 arch/x86/include/asm/mpspec.h | 2 +-
 drivers/tty/vt/vc_screen.c    | 2 +-
 include/linux/threads.h       | 6 +++---
 include/linux/udp.h           | 2 +-
 include/linux/xarray.h        | 2 +-
 init/Kconfig                  | 9 ++-------
 kernel/futex/core.c           | 6 +++---
 kernel/user.c                 | 2 +-
 8 files changed, 13 insertions(+), 18 deletions(-)

-- 
2.39.2


