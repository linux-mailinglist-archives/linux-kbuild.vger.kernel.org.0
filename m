Return-Path: <linux-kbuild+bounces-9374-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 556DBC2D137
	for <lists+linux-kbuild@lfdr.de>; Mon, 03 Nov 2025 17:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9916D188F4B9
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Nov 2025 16:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6579E3195E7;
	Mon,  3 Nov 2025 16:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rj09nGBa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011F931771F
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Nov 2025 16:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762186808; cv=none; b=r8yhGHehP6EK+z0DSVz6XIN7PiG1Yq1DovHKLoGez8VdnN1i2cbaDub8MfihPW1mlFWlTcXmFZtt6UUBPTc9P117gY7zD94Y/zlqlQh+5NkUh08aNXown6ZQMexz5cbT2OZxM86MFemXH9hW0DtGHkxhQh/bZ6IsZcWY11q5vzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762186808; c=relaxed/simple;
	bh=h7R/k1MMSVPQfBxt0pvy0030CquRgbNXX1VOTDMoaIQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=kGLhwa1to5aKmjgQqPbg3pXZ+b3uWK1p3CfVzVbUBD2ICigJX0DwUIaQ34DEO0xA64mXOMnpg85LhvzP5lmGyPMnMSArNk1rxbuu4Iut4qPwLISiQoNFr8Vf6cEMw8HQOQsnbeNf6QGWX2dsXEgUGRWj+cHiSXg16BpJVWse2Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rj09nGBa; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3f384f10762so3851077f8f.3
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Nov 2025 08:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762186802; x=1762791602; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W8tTM2uCb0zl0k898LdIZTakN1ZygKd+3CMbo77PL78=;
        b=rj09nGBaFeX9xJxGNhVti1JlVGg35iSsZj581DpbIM5CayFWU0a8FRWSK4VebK7qHu
         Ux+y7H3SBxbIMMw9l7HyhN7Ptva2mSJhoC1VSqLuECr8c9NxHO9OT24T4rssf+DC3l4s
         wG/3HPFQP1bi+Nm1IMlehvS1erGMmZ1i8AlRbxXVxR0SuoaVwJ9avqqZTTYVgNf4z8+c
         X0kE/cWi2A52pNCxV6BG9vfj49Ss8qMjosifq2Sa8P6+wD4YW0jhh7Os4pN8CLUXbfjq
         4Z10drFG4KKLrxMdHOK+CXi44cRaLGDIecz3PkEHdqJnO616SPjAVuVmtTFqYEOqhzOm
         1axQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762186802; x=1762791602;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W8tTM2uCb0zl0k898LdIZTakN1ZygKd+3CMbo77PL78=;
        b=RDTrplmtHeJXFjxSYP0RjI0QTSvDvMshHLmN4bjJnCZVXokFolxqrffdwLXuVnxBWu
         wObsQVTqdPhYhyJKEjxDOoCWv3vAKzvZ/+1w/BPagrwawm2dGs2Kk0DJy/4byXY1kRdi
         9okvVSIGzH2ApiMKwu6MxlbJz8gemWCqhnGn/sqZ96k6I8RWL83J95X+L3DH9wT62Z6X
         +UoNYsYc4ZFonLK7jb9XmYKNcw1UArlC1/zvX3b9xxkVkM3YXMeDa3AE+s35eWdxrFyv
         z+skAZQ6A0MGgKNR/N1wFXuph7o1LZB6STMkbNPp4Xl72TaEU0mOjzld9LCl1px+3pX6
         dGnw==
X-Forwarded-Encrypted: i=1; AJvYcCXTBmLQ6wQ+/LYJ4OtUFxOWrVZ92Q0y5jk8AElLfel+3cJKE8A8g9FsvSC+I2LM0pZaeDXg2GWhfCHq6n8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwlHc/PPa+dPRI7ECOJiseSSxa+XxTixMg6nzSj304tcNaWFOe
	MDR4HrqvRbTmeweWD5PR2EnBop4zkHs4fY2B1pP4U+us1hfW7ofGMmMTWaIuNEN4SrHumobMkvT
	o2hmUg6tjboTO/0Kl5Q==
X-Google-Smtp-Source: AGHT+IEbhSxEl23KciUSXJmUxlryd+9/wkj5PORgK0VgJEd3vZvStNFYMjkCuoAO6A/1vErUZgMsibakSlGcVNc=
X-Received: from wmwn6.prod.google.com ([2002:a05:600d:4346:b0:477:3fdf:4c28])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b30:b0:46d:a04:50c6 with SMTP id 5b1f17b1804b1-477429d8ee4mr73769555e9.30.1762186802499;
 Mon, 03 Nov 2025 08:20:02 -0800 (PST)
Date: Mon,  3 Nov 2025 16:19:46 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251103161954.1351784-1-sidnayyar@google.com>
Subject: [PATCH v3 0/8] scalable symbol flags with __kflagstab
From: Siddharth Nayyar <sidnayyar@google.com>
To: petr.pavlu@suse.com, corbet@lwn.net
Cc: arnd@arndb.de, linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	mcgrof@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	samitolvanen@google.com, sidnayyar@google.com, maennich@google.com, 
	gprocida@google.com
Content-Type: text/plain; charset="UTF-8"

This patch series implements a mechanism for scalable exported symbol
flags using a separate section called __kflagstab. The series introduces
__kflagstab support, removes *_gpl sections in favor of a GPL flag,
simplifies symbol resolution during module loading.

This series previously added symbol import protection which aims to
restrict the use of "protected symbol" exported by vmlinux, as a use
case for which __kflagstab is being introduced. Such symbols are only
allowed to be imported by signed modules when symbol protection is
enabled. This functionality requires more thought and discussion [1],
and therefore I will create a separate patch series for it. In the
meantime, this series now only focuses on introduction of __kflagstab
which right is an improvement to the module loader's code health [2].

Thank you Petr Pavlu and Jonathan Corbet for their valuable feedback.

---
Changes from v2:
- removed symbol import protection to spin off into its own series

v2:
https://lore.kernel.org/20251013153918.2206045-1-sidnayyar@google.com/

Changes from v1:
- added a check to ensure __kflagstab is present
- added warnings for the obsolete *_gpl sections
- moved protected symbol check before ref_module() call
- moved protected symbol check failure warning to issue detection point

v1:
https://lore.kernel.org/20250829105418.3053274-1-sidnayyar@google.com/

[1] https://lore.kernel.org/cac5ed5e-3320-4db0-99d8-ea5e97e56bfb@suse.com/
[2] https://lore.kernel.org/2bf54830-ea9c-4962-a7ef-653fbed8f8c0@suse.com/

Siddharth Nayyar (8):
  define kernel symbol flags
  linker: add kflagstab section to vmlinux and modules
  modpost: create entries for kflagstab
  module loader: use kflagstab instead of *_gpl sections
  modpost: put all exported symbols in ksymtab section
  module loader: remove references of *_gpl sections
  linker: remove *_gpl sections from vmlinux and modules
  remove references to *_gpl sections in documentation

 Documentation/kbuild/modules.rst  |  11 ++--
 include/asm-generic/vmlinux.lds.h |  21 ++----
 include/linux/export-internal.h   |  28 +++++---
 include/linux/module.h            |   4 +-
 include/linux/module_symbol.h     |   5 ++
 kernel/module/internal.h          |   4 +-
 kernel/module/main.c              | 102 ++++++++++++++----------------
 scripts/mod/modpost.c             |  16 +++--
 scripts/module.lds.S              |   3 +-
 9 files changed, 99 insertions(+), 95 deletions(-)

-- 
2.51.1.930.gacf6e81ea2-goog


