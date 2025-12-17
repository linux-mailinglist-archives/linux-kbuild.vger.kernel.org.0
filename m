Return-Path: <linux-kbuild+bounces-10124-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD495CC5BA3
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 02:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D68030248BB
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 01:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B13D2264AB;
	Wed, 17 Dec 2025 01:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pa0z6DOs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD9526290
	for <linux-kbuild@vger.kernel.org>; Wed, 17 Dec 2025 01:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765936457; cv=none; b=Lm65O3xEIOXMT1TbLsUa3RLYSmkCIxhAPUO6YQKuIevLYMOcagF3zc1pDk/Y3RQqtTZ0ltcSUyZXidKLLKNZPYdngObYYXCiPk1JQ9nlxiZ74Jf0o3j9ZzqJ8fSL7CUrvaVJ6chRtjKmpa7kbTldAxL3TU7woCVim4eowPlxg9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765936457; c=relaxed/simple;
	bh=vdea33klUvYD5XS6I62K4JeeV5eBNlo2U4S3drCrUL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dWDo1RIPF2Q2k9108+nRbN53QSQIiSDmT7EwbYnRgyfeAp249g0eiUZhm9IQ4YaSrHK2qM57cLIORFAYoq4VO8ak4h8v1aLEa3FTiC2BhmsJ+aSF4z0ITn8lXpkrXufTTV+j6K7h+oTH2/5LWWLXvvWTjvt0msta8aK6fLo3Izo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pa0z6DOs; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso56086765e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Dec 2025 17:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765936454; x=1766541254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G45CmGn26wDlTRNSpVj05TXo6Z35jmjYCzCXs9Q+2cA=;
        b=Pa0z6DOsn0DLOIo8a04fMpSgEtQkluzZnpIK6z/iRYu75ps4yjBQMqPrQLS7d/ALbc
         RFhVG1RF1tuXuIOorFarY/M/d8Ve2f/s/7hg4osW4ikVOi4ki3Gjqh0r/w1RyWwa99ed
         gLSbfF5yS8nmik9sdpH4h/piBhXTA4kMxRBMZe1D2HnJ23QCtFFW5o+rJQwqBWZT1Acx
         AE/VO56TL1ZeMr6OB2/me1WFgfxewAnNqaVBB/blItUyMviGt2jDdfssX2JTz7MaKxk1
         WF90jOPmigV8SHIXdKo00S3GfbT3AjnBmzdm5wtxciYrrEczp4LMGeaPxeaLwsES7RoY
         EtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765936454; x=1766541254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G45CmGn26wDlTRNSpVj05TXo6Z35jmjYCzCXs9Q+2cA=;
        b=COL2+5YnuUhPETcEq6eWmSnOH50jSorSNvklWqamBFal44dqG7BUuRWGZnYimaGA1G
         dNRa5Ugg5j5Kcl/3Uzvp14sDCUfQvUL2q+vh9O1QtWEP7f9AMMUXZcdgYhle+TZoTg7j
         f2GqFdhR7RmrSM6/ZiVxQ2KYloXMVzTYxnl7Z+UB1GuJqcyDltWdwjFoHcehSPjwLui8
         EBNZ5+uwaVk/hSEyiX1XCiUIIHZL8JCqz2PKdjXi6t+YONDHu8bIjKpUh2gwZc1za506
         hrxmbh+1TyOlyQD2ZyTv/uIqe81ux5DtBR6JKJNiTuOA+jsFBC+H/rM4YLsNpP6s+xBw
         Yumg==
X-Forwarded-Encrypted: i=1; AJvYcCUQYglzawd9uHgVELBGYbnA5aXf3cmYReMH18QIPu7uXYqB+X4h7n8AVYJuCnPwmT/oFz+f6jdpjX2lGdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNiGZe2wKNU4XZrBgvnU7OAU3eCoh8mVh/aGv3p6L9a08iXO8+
	89CLCclbntnt4TTr8MfUVkZSKrklbTW7wIdh/cNO2NtSb0X5n7TcXPUS
X-Gm-Gg: AY/fxX5jVCjA11DLzfNDUAjf+sRB+vaXMvbCTuPkQhNchCw2DfhgI5QGMpsxBWYqyCK
	kgItzeziYXGKFQiMFUEr6Mak2r9PsTL3nAEQoVoJP6HpzW2FEF8YZZ4FazBWCSoBF1mmFJTdeK8
	JRFss5WxRSM6G2kNy0902S0zXSnxzzN7Ba/328iSBdx6oLjE1zZPcA/T5KXOgLZvjovGsUv2oA/
	qEG9THOtw6Un8C66zRHL+9r2YBFTZgskf376OwmKPI2KYO6xusQ8n/0ry434MiawLUdZ3EQyKHS
	HEa0LEfuoMXq2gf0f97xMjfl6RjHcmeN7VVO3HYTtL8nQABMqG3JBR5PAXyF1yqxixAkCAL+d1L
	aUDKYdjZuUQgyCaGT2rwXO2+NLmw+yzByPhDmgN7Z/BSp7L1rGkY9XrW/f8uq2JKFLVvNtOQmpI
	Iyfg+yPa1v5vM=
X-Google-Smtp-Source: AGHT+IFNlMy6cu7vAL/9HXUBVkfZDW1HwpprD6dCnkJRrCxjrRAS4KsnstiAa5tR39CPD3y/CHESJQ==
X-Received: by 2002:a05:600c:810c:b0:46e:1abc:1811 with SMTP id 5b1f17b1804b1-47a8f90cf60mr140360785e9.27.1765936453629;
        Tue, 16 Dec 2025 17:54:13 -0800 (PST)
Received: from fedora.lan ([2a0d:6fc1:2:c000:ab04:bb83:9fe4:38a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc1c2243sm15561875e9.1.2025.12.16.17.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 17:54:13 -0800 (PST)
From: Rostislav Krasny <rostiprodev@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rostislav Krasny <rostiprodev@gmail.com>
Subject: [PATCH v3 0/1] kconfig: move XPM icons to separate files
Date: Wed, 17 Dec 2025 03:54:08 +0200
Message-ID: <20251217015409.30102-1-rostiprodev@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <46a5f2d9-b118-4675-8372-40f9b2fc7bbe@infradead.org>
References: <46a5f2d9-b118-4675-8372-40f9b2fc7bbe@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 17 Dec 2025 at 00:39, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Yes, "make xconfig" worked properly before applying this patch.
>
> .qconf.cmd (generated by build) tells me I am using Qt6.
> I don't see any build errors/warnings.
>
> qt-core-devel & qt-base-common-devel are v6.10.1-1.2 from
> openSUSE Tumbleweed.

Finally I figured out why "make xconfig" was failing with Qt6 on my machine.
Because I didn't clean properly between trying it with Qt5 and Qt6. After I
ran "make distclean", "make xconfig" runs properly with qt6-qtbase-devel
too.

Then I've noticed that I inconsistently used two different versions of the
"srctree" environment variable - lowercased (right) from lkc.h in GTK code
and uppercased (wrong) literal in Qt code. There is a fallback to
QDir::currentPath() in the Qt code code and it seems like it works
differently in my Fedora 43 and in your openSUSE Tumbleweed.

In this version of my patch I've fixed that inconsistenly. Hope now it works
properly in all systems with Qt.

Rostislav Krasny (1):
  kconfig: move XPM icons to separate files

 scripts/kconfig/Makefile              |   4 +-
 scripts/kconfig/gconf.c               |  35 ++-
 scripts/kconfig/icons/back.xpm        |  29 +++
 scripts/kconfig/icons/choice_no.xpm   |  18 ++
 scripts/kconfig/icons/choice_yes.xpm  |  18 ++
 scripts/kconfig/icons/load.xpm        |  31 +++
 scripts/kconfig/icons/menu.xpm        |  18 ++
 scripts/kconfig/icons/menuback.xpm    |  18 ++
 scripts/kconfig/icons/save.xpm        |  31 +++
 scripts/kconfig/icons/single_view.xpm |  28 +++
 scripts/kconfig/icons/split_view.xpm  |  28 +++
 scripts/kconfig/icons/symbol_mod.xpm  |  18 ++
 scripts/kconfig/icons/symbol_no.xpm   |  18 ++
 scripts/kconfig/icons/symbol_yes.xpm  |  18 ++
 scripts/kconfig/icons/tree_view.xpm   |  28 +++
 scripts/kconfig/images.c              | 328 --------------------------
 scripts/kconfig/images.h              |  33 ---
 scripts/kconfig/qconf.cc              |  29 ++-
 18 files changed, 345 insertions(+), 385 deletions(-)
 create mode 100644 scripts/kconfig/icons/back.xpm
 create mode 100644 scripts/kconfig/icons/choice_no.xpm
 create mode 100644 scripts/kconfig/icons/choice_yes.xpm
 create mode 100644 scripts/kconfig/icons/load.xpm
 create mode 100644 scripts/kconfig/icons/menu.xpm
 create mode 100644 scripts/kconfig/icons/menuback.xpm
 create mode 100644 scripts/kconfig/icons/save.xpm
 create mode 100644 scripts/kconfig/icons/single_view.xpm
 create mode 100644 scripts/kconfig/icons/split_view.xpm
 create mode 100644 scripts/kconfig/icons/symbol_mod.xpm
 create mode 100644 scripts/kconfig/icons/symbol_no.xpm
 create mode 100644 scripts/kconfig/icons/symbol_yes.xpm
 create mode 100644 scripts/kconfig/icons/tree_view.xpm
 delete mode 100644 scripts/kconfig/images.c
 delete mode 100644 scripts/kconfig/images.h

-- 
2.52.0


