Return-Path: <linux-kbuild+bounces-2622-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C50F938BB5
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jul 2024 11:07:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35C7128153A
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jul 2024 09:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A65168488;
	Mon, 22 Jul 2024 09:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dPDLY4QL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED1F1607B4
	for <linux-kbuild@vger.kernel.org>; Mon, 22 Jul 2024 09:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721639227; cv=none; b=F3hbbTFxHyNv0I9X/OnuhxuWfUi5eKfqgFgfSk4j2GVl7T2leb20bV33RfdtP5ZH/vNeSuE5kFDXQEdFoRa/fABicitn4dxVQlWGocM8PZd28FnhiOmAyQiHRCiA/qIO4Xp1iKMzK2xoLR+64ncXXyzscwrVBvWqxXDR9GebxAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721639227; c=relaxed/simple;
	bh=MlDwDQRKF9twVEG79iWcfbddm9tGGXPNnP1U28eThpY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HJx0a3jNEWqmlg54p3oWgg9rZYv9/kyEPJrq94i9wMsn+iSj5xZeO4rM4gTAaU3z2Jf5SdzJf5atEaWkSfu3TWDF6l28XIbps9QCmkjTHyZGjWI+j88H3Y5kg0QS8Kmv8/ifryzI8YzP9FoLt6SAWRxyGgJG4KW7AUwKXmPjdSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dPDLY4QL; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2eede876fbfso54987191fa.1
        for <linux-kbuild@vger.kernel.org>; Mon, 22 Jul 2024 02:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721639223; x=1722244023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q6KDeZL1mIopzYRyhCPAZSAzBi25x25dsv53MOad9y0=;
        b=dPDLY4QLD5+hC+fvnpHrdsKwQuZs+SaQMBzaHV/fHFbxAQb7vOp/WfkOsVg+/fHoMb
         yD/X5C4coTC/Dh+zAFHAUkV04JgGjAzKYhL0mrLA320LcKdPdbAoWlOSmnxxJ2Vfubps
         BsZOHHwbqcbfW3/aQkL/jT/CsO4xhCw6C8sXUu09gH+sU4ZcEhq3uv+pcZ1nFtGf+BV8
         Qi/gvoEd5uv3qDuIbWT5cFFCGLjy5CYpGjkROwhLt2Thcw3ErQOT19s2mftxJAPsuR+c
         LteVK+z3MguTzwR8Mqi0zQlMhR5mKZy8NbNptoTo8/QX+M9zGChWAd7ooGD5gIm7tSx9
         4Onw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721639223; x=1722244023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q6KDeZL1mIopzYRyhCPAZSAzBi25x25dsv53MOad9y0=;
        b=rv2gWaNlSnVJdqX5LvFLGnK3zwppcQBR1ZXwIQEbUJ9tJtiYq2A6CCou2gzfzaLBLk
         pGu4Sei/ZrrVTOGD+QroL6nkvQy7XMX44ARkvQzWARHuiR7+jpTcU8BLUPRcq2OR1oyt
         431Qmg9/1ARNAXddcnVrQytlLUPkSww8fmBZC01AxC2JUFNvcXPjAv9C7pTYJ/rG3hJL
         VoHW98o66mAyJwBgEi5uMsPKZrkKg+PzaS9HUqUWrmF+VC8Bd3+Ub21K8LBepK2L19pO
         T3a8U1LnaWiDBcgx31Up9k6mn9GbxfaWHE6sDdR/lWuonG7Kv0dg9NvBtoq+I2/qlIUG
         w5vA==
X-Forwarded-Encrypted: i=1; AJvYcCWMURUcqOZDEI3zr0rDYj4rnQLyAvEqw6d9gKbbxQc1H9NC4kBQx3N2tV3yALFJPa3AL917MnR+FTY7oq18oKL6hBIPiiJZ9wxYuuCM
X-Gm-Message-State: AOJu0YzTdA1c600xKI3yml0ps9VwRH8erfzUlpfK8Fzo99Q2G9Ry48kI
	z1pKRTNmhiBibGTC7cH4jCzTf9YAD+n919xHac4Ml/PoLG9ExXegaQ++6P3kEA2ZlzyvJ20zyr5
	B8eY=
X-Google-Smtp-Source: AGHT+IHFXv/AlJ5AFRio6/mnRlwfA1+SuMUPkn58Vp4I8PzI9zyHIY0SW3KIC6yxvKFubCQIIg2inQ==
X-Received: by 2002:a05:651c:503:b0:2ef:2dfe:f058 with SMTP id 38308e7fff4ca-2ef2dfef4ccmr23347061fa.42.1721639223527;
        Mon, 22 Jul 2024 02:07:03 -0700 (PDT)
Received: from dhcp161.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb7753abeasm7534290a91.48.2024.07.22.02.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 02:07:03 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: [PATCH 0/2] module: Split modules_install compression and in-kernel decompression
Date: Mon, 22 Jul 2024 11:06:20 +0200
Message-Id: <20240722090622.16524-1-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow enabling the in-kernel module decompression support separately,
without requiring to enable also the automatic compression during
'make modules_install'.

Petr Pavlu (2):
  module: Split modules_install compression and in-kernel decompression
  module: Clean up the description of MODULE_SIG_<type>

 kernel/module/Kconfig    | 77 ++++++++++++++++++++--------------------
 scripts/Makefile.modinst |  2 ++
 2 files changed, 41 insertions(+), 38 deletions(-)


base-commit: 933069701c1b507825b514317d4edd5d3fd9d417
-- 
2.35.3


