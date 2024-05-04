Return-Path: <linux-kbuild+bounces-1768-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A68D38BBDD6
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 21:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 463A81F219C4
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 19:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE297FBCF;
	Sat,  4 May 2024 19:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="GzPEcII2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AEC1EF01
	for <linux-kbuild@vger.kernel.org>; Sat,  4 May 2024 19:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714851294; cv=none; b=Hwg3mQhUc7eABjxp+F5oyF3LmVnB2yLc6RPohytv3XYg29if6X+OfX7FhkBQ0EYrY7tPH9qaHzuNDHQOb/ZCAMSrmiHgmPHJbrpSRferOcgBqLt1J3dEkX8yuVhN58FMBg/bhBCaHZroEaLBntL/DWAbWG6eV595XEZaUouIU5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714851294; c=relaxed/simple;
	bh=sa73LuQSyDkzgvdnKeZPnMHSAv9AkXFQb4jtSwXZ/Rs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W84tN47Qm0GNm1jfZOumTZsyElgDpxKUeGvGfZvZISZenBMItfObpT5KRV9dEehaIYircLubImmffJYxF1Ce3KrtnDunhkKJIoxbR/EFQHyWL/x2OHXRBpTtUPWW01o4s+Op26pim5/u7RbkzEiwcYeBWw/Wxz53D8wQtCrwS8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=GzPEcII2; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8385C3F1EE
	for <linux-kbuild@vger.kernel.org>; Sat,  4 May 2024 19:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714851289;
	bh=fCdw8igKrdSP0dtv5mprL77xFjRhGIFmRTlH+eUmhU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GzPEcII2Q3U03nHYpqi8bmvjr45151lY5BWQWGKfOnrBcuUwwgHR8cMgTQZtjUOBw
	 wcaBASXy42b2MF76H+hpW8ruq3M1uba9WeC3DoyH2N/4sYo+t0h9i1PEEGFG4EeIA2
	 hZZv2S1sqES3MaXCv6vwVtxxkc6HbO9yZ2JTDTLpUgtgxXuY6mKdLZBy1fDGxRbDxL
	 WvGKxlRSch4vgi6EZBFegFwCKEMhYphxDH5ksB/bltrsuAiDqV7vbgGi+XQn5RxsMe
	 bkvQBQBRy+iSpwR/tAsuXgEt7n8qm4Weo06MGqlPvR2wOXRfDYGxbKMx8mqCSl4jdj
	 fXNoGNeK/eLQA==
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5729ec37366so395101a12.0
        for <linux-kbuild@vger.kernel.org>; Sat, 04 May 2024 12:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714851289; x=1715456089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCdw8igKrdSP0dtv5mprL77xFjRhGIFmRTlH+eUmhU4=;
        b=FRIwyXTCf90HJkfirObGFwZnYn8ZHe9bJFLnZo4NpRYc1kVCPmhNbCn4BcGA4dFy2v
         xvrz8vzAHGDfya3JpVNrLKw0EQUUr1a31ASQ6kz0d+s9XglgFic8eh0m4m91J2OOjAwi
         0xc7+8OvXDCkrVxbdhIXBlAv9ILLs5SJS3vvAtnkAmR4/kwDCshfiMObbIhpDZMH7teY
         kFeWYUMu+HSxAANsRtB4gRleh0X7HidQi0e6eIZn73CPTmHhK7fOSng2ZJWuERund0r+
         u+Iwmo/DAYKKpKlKt+9UHxYlx3oPZfuoMaaz7G9dS6iWzBnNRiNQnOCGOH5GPOomQ0It
         4VDw==
X-Forwarded-Encrypted: i=1; AJvYcCUKET5h54L/LRSFZeYC/+bNZRzEhWN+UGxwruZV8NEn6rSQSVBII+UgiTVV66LhbRVx58n2q/UcCgFQ5TFo3LyG1zCvV3avj9cfzdqf
X-Gm-Message-State: AOJu0YwsPaCfKvR3sOGGHlVDH4wXt46B5nFcBH+NTbPfocFyxoEsQu4l
	6YtCypB0AiCZ3RdObb5E7F17iHgje4O9dYXmdA4Idk/QlbeZj0bfXZ6Nz64KYlXZtgZOMH5CVNR
	rbCZhIFRn1vaF6u2SBTskYutfQXyHVHDHrq4e90LVBn0SYOMvsTFujq21V+r3hT+wUBiZm/rULy
	GZEA==
X-Received: by 2002:a50:9f27:0:b0:570:1ea8:c50a with SMTP id b36-20020a509f27000000b005701ea8c50amr3930441edf.6.1714851289231;
        Sat, 04 May 2024 12:34:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfrOVNzJsIs3kHfWe2V+kJZE0Bxb3FyGDeAx2q21GBg8JQx9QrNbPMwAvnDHQI0wDmkJ7nZg==
X-Received: by 2002:a50:9f27:0:b0:570:1ea8:c50a with SMTP id b36-20020a509f27000000b005701ea8c50amr3930425edf.6.1714851288778;
        Sat, 04 May 2024 12:34:48 -0700 (PDT)
Received: from stitch.. ([80.71.142.166])
        by smtp.gmail.com with ESMTPSA id et4-20020a056402378400b00572d255e342sm2227021edb.10.2024.05.04.12.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 12:34:47 -0700 (PDT)
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
Subject: [PATCH v2 0/2] riscv: make image compression configurable
Date: Sat,  4 May 2024 21:34:37 +0200
Message-ID: <20240504193446.196886-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Changes in v2:
- Rebase on riscv/for-next
- Use boot-image-$(CONFIG_..) := assignments rather than ifeq train in
  patch 1
- Drop patch 3 already applied to kbuild/for-next

Emil Renner Berthing (2):
  riscv: make image compression configurable
  riscv: show help string for riscv-specific targets

 arch/riscv/Kconfig         |  7 +++++
 arch/riscv/Makefile        | 55 ++++++++++++++++++++++++--------------
 arch/riscv/boot/install.sh |  9 ++++---
 3 files changed, 48 insertions(+), 23 deletions(-)

-- 
2.43.0


