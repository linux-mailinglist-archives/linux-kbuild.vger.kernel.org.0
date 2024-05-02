Return-Path: <linux-kbuild+bounces-1725-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AA48B99DF
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 May 2024 13:16:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 762FC1C22A9A
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 May 2024 11:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD025F874;
	Thu,  2 May 2024 11:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="eJYsVg4B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62B363099
	for <linux-kbuild@vger.kernel.org>; Thu,  2 May 2024 11:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714648587; cv=none; b=AeOxj15NVkiHsTAdxsYkpXYES3V3tVeGya+vICHyPzjtWTMSXWYFBFe60s3RPUjUvtIbX+TT+8rvvTy4r33755NiPLrdvMzruwfX1VUTLXbYUUH38+RO47ym6Dh0FzNaTj+YQ5Nb+ijTaxxiS/0dBLaHJSKZhYdZiR169cmkQAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714648587; c=relaxed/simple;
	bh=Uopnuae4XTj+lMXhKoWJrhT/gsv0jkB2SUJrolbIB3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sUzmyigAsC7VCFmmyDYrxyWED5arPfGnL2u4RdpkbaHA1yHPMns34lfmPShGOFQe9tkZUnYfHYoesmRy2GtdaQzfVg+jc7eptTfwCCrhFdQLCjEY/Egu4XeHGRPe7rx/XMT/niQWVMI6drkkLk8WDUc/ptuwWI+zQEWDzM8tS5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=eJYsVg4B; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5C51E3FE5B
	for <linux-kbuild@vger.kernel.org>; Thu,  2 May 2024 11:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714648576;
	bh=or9J1KNamr3SyadMwGskzlQdXHkztewT20MwCVZSRlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=eJYsVg4BpPQre/K7gIhvu0BPzQjKjz5GUf6KCmcMDm3Z/CT8tY8KBEa9Jkpj+YLEL
	 3BcX2a0OykN+uhPX9LqeaCaWre6HeyoRMiPr3WUyTTTkVyU+4g2EaEBqeMUtXfyZZF
	 TXnvr7a28RC4Hh57zqkV5SiO4hQ2MMzzFoOAQnUmyYUwRxz34eK9OjvDvcIIWjYxG8
	 nbuSBGVdCQypcjPPm5Iq1+7hkXBHkeu5SCrpJ16t3oAwuxghEkH3Euh+OpD6q/1f1d
	 jdHxiQPEk6uVQNA1cowBBnS8zUimnS/4tfXWR+yg2enFmjBC2oRA4Fe/7l8CEH06V0
	 izVRHIZj1Ih3Q==
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-51f0d924685so660285e87.0
        for <linux-kbuild@vger.kernel.org>; Thu, 02 May 2024 04:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714648575; x=1715253375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=or9J1KNamr3SyadMwGskzlQdXHkztewT20MwCVZSRlo=;
        b=YCC247D78TvYc3+U53ES7cjRz6BYjM0RdCCyjQRrU3uD6ovUmcSpPLEpjWdhCjP7qq
         Vu7bSib6T6jI0km9V0xEzLoYRRAeDdusYS1aWd9FZPFVaVCF+cJjYYesqgTBkN7Kmhtv
         Lck6PLCL61GighEQTGdboTfYXFolwXzPu8A6UYGTu48OQkrhEGRqhcgRl3pxyVE/zrh0
         0s5V/Q75pEYj72UsvVTAH/p0zbv6UYu97QlrvdkSp1FD/YbiAoBN77UJCi4RJFcalYLX
         LHR8TaxZykVaEPvUPg8KnbUACVuluDWISiY3LBK1ubm9xMassVlAaLU4gahfsx7Z0o26
         sC9g==
X-Forwarded-Encrypted: i=1; AJvYcCVGog087/U0IPdGDvpZzBrN4sNMcgZ2jpfv31wvvPBPe0QdkhI39GAhvBikr2yXn6c2zAYYw0ESNoYJvjg3Q5iC879bysK4FpNfRn2L
X-Gm-Message-State: AOJu0YymK5wr7VaCf2Kux+MZW4Mtu7/WgVc6lDlglIBb7l7GXohS/zKP
	/HfTdlKS9YYThfK5OhSNuiY5V4CvZetIIJlq7m3TxLDbu8nTCtvzkTHWpK6DW45nWUnB3gAxyet
	lisXSvHe87ZAr40fnNU4gbNw5jAskkYapy0Jr68UmviMzRIng8Mf/4z+3m98bLqj4ggyjffuYFm
	h+B1KzqZ21qA==
X-Received: by 2002:a19:6450:0:b0:51b:bb22:f21 with SMTP id b16-20020a196450000000b0051bbb220f21mr4131194lfj.38.1714648575611;
        Thu, 02 May 2024 04:16:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbuAj3aP4RY2E8LiKmkKVQKaw+wSBaSVpfSeA/6/airVEvEgvLgc91RZ0Nt20kQ1CC2w5sWw==
X-Received: by 2002:a19:6450:0:b0:51b:bb22:f21 with SMTP id b16-20020a196450000000b0051bbb220f21mr4131176lfj.38.1714648575240;
        Thu, 02 May 2024 04:16:15 -0700 (PDT)
Received: from stitch.. ([80.71.142.166])
        by smtp.gmail.com with ESMTPSA id gs23-20020a170906f19700b00a4739efd7cesm437278ejb.60.2024.05.02.04.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 04:16:14 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Terrell <terrelln@fb.com>
Subject: [PATCH v1 0/3] riscv: make image compression configurable
Date: Thu,  2 May 2024 13:16:05 +0200
Message-ID: <20240502111613.1380453-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Masahiro's patch[1] made me wonder why we're not just using KBUILD_IMAGE
to determine which (possibly compressed) kernel image to use in 'make
tar-pkg' like other architectures do. It turns out we're always setting
KBUILD_IMAGE to the uncompressed Image file and then compressing it into
the Image.gz file afterwards.

This series fixes that so the compression method is configurable and
KBUILD_IMAGE is set to the chosen (possibly uncompressed) kernel image
which is then used by targets like 'make install' and 'make bindeb-pkg' and
'make tar-pkg'.

Patch 3/3 depends on the previously mentioned patch below.

[1]: https://lore.kernel.org/r/20240414174139.3001175-1-masahiroy@kernel.org

Emil Renner Berthing (3):
  riscv: make image compression configurable
  riscv: show help string for riscv-specific targets
  kbuild: buildtar: install riscv compressed images as vmlinuz

 arch/riscv/Kconfig         |  7 +++++
 arch/riscv/Makefile        | 60 +++++++++++++++++++++++++-------------
 arch/riscv/boot/install.sh |  9 ++++--
 scripts/package/buildtar   | 18 +++++-------
 4 files changed, 61 insertions(+), 33 deletions(-)

-- 
2.43.0


