Return-Path: <linux-kbuild+bounces-9103-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 056A0BD4A61
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Oct 2025 17:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 516D718A643F
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Oct 2025 15:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C4C30DD3F;
	Mon, 13 Oct 2025 15:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="it2pL4kr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B48B3112DC
	for <linux-kbuild@vger.kernel.org>; Mon, 13 Oct 2025 15:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760369986; cv=none; b=Pr2jIaSOkGBwUFhCejmbfd3tywIID+unwC8PBQwaEISCPvktKwzK0IQGhZQPT6ZsYEKngg/XPfZRJWXf9DuMTwkBEexhwBGq6kBZj5tEXujkQQqZ4D6UljHM2Jxnr91Z6+Jxcu/N4vz+CBFCHpRSFTWmh4+/MGCMPRivjXru6qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760369986; c=relaxed/simple;
	bh=zQmTVOaQ2conlnD0XZSZ6oY7jQQ4SJUuOz94+kxZw5Y=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=mxkQHitvLK/VcQwBDwYaZLPAtI2HWg17gsiLApUm1iMqJQlp8eCckROXWSF7UWm6vSyqdF8DO72jYsSu6umGgrjxUsxxqH/+uXTEABcZJ6YquM1eAKAkNzbt3HKPmoPZQWE13FxzZ+J8o5cMGNk/t7TxqpP3SaDDh1r7EYuzGAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=it2pL4kr; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-426d314d0deso1660011f8f.1
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Oct 2025 08:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760369983; x=1760974783; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DezCksN63P76aa8HtfW+Fd8qwQxc2N6lFBI0VjqaVgQ=;
        b=it2pL4krxHIWQJiQ6bR2s8LijadLgzoLpCZ93iZK0nvkyQtYRC+3iJd5acMpEpO+2B
         bZOxlIsim/vhY+lUWnOoFkp74q4YFDp06xTN35GZwrlBg1/41H7x5S5jQ0aMraelEoZo
         692mUDSxDGITv5T74Ivjf915j56ZEEZWgp9iM2td2vaN/2QRPZJnDMgTe2aN1utTwsXz
         /VyxjtEuJWYliSWZkLdnn624ZecimmU1xYF9LkJKyYPM2doI9McfWF0xJhLtwit4DX7Z
         XjLvdRgUE26LoME7bxyvwjMAHZvYbc40+nLddyNcL1mpw7o/7Twv/j0ZSyZd5xjylOMw
         iCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369983; x=1760974783;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DezCksN63P76aa8HtfW+Fd8qwQxc2N6lFBI0VjqaVgQ=;
        b=L8Cj5ruEheJ6cjIGZ8tkRgQsiWX3dE+vKO0Dg1PTNL8zJR4/fMOQngwX35PIriaAQ+
         ZU1GjJ0ubRDDSlt2+uZnouZ8phDcWEWWPGohFpiXqASx88HHxjKB8aTg4CieM8Xo+FKI
         p6hjjh3P/zx6WKJQ6grd47XFLHXSHtylzChyzY5tCS513u4o1lLQXYMFI8FYldABGD/A
         6BmFSmEqUalnhZU0nApA0Pz08zhw8HYar0C8bTXAW/VZUTf+ObwHp0ioxyiEQYWnDs0h
         ITZZ9MsGoyZ7lsOLPkxvkI/tIRuXp8Qw+qFAEGpQQAyBN8g9LHxVmfFVB8IUr30vINi+
         A16w==
X-Forwarded-Encrypted: i=1; AJvYcCUHgVHLW4zZwJD7Suw+wIdNv2LwTaFP9GuGiCKAWHQE8H9V9Rddd/ao5gXMOf3g/sXf9eOaEzKFSGRfFnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwYD3Hu8zAEcgoiWPFpDVmMhhGiUOCZhs7ex3kz7409JQFwCFL
	TQnzBHJYUzAUHUkvGiqKVecQzS7KEMS8a3i9tGAKvTyPlrnIMRB0lHSzf6Km3wcaH+EsO3c3lNu
	MLq8vf+OuqrdI/TPc7Q==
X-Google-Smtp-Source: AGHT+IHT9D8nobwVH6g+HgY0QG4zVcAjf8Z0CihPbisBYc1GTcqFHPtDQkugsLoIe+WAtFs/dhifTn8tMXvfHZY=
X-Received: from wror14.prod.google.com ([2002:adf:f10e:0:b0:425:f04a:4d95])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:6f04:0:b0:426:da92:d3a9 with SMTP id ffacd0b85a97d-426da92d584mr5857129f8f.46.1760369983567;
 Mon, 13 Oct 2025 08:39:43 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:39:08 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.740.g6adb054d12-goog
Message-ID: <20251013153918.2206045-1-sidnayyar@google.com>
Subject: [PATCH v2 00/10] scalable symbol flags with __kflagstab
From: Siddharth Nayyar <sidnayyar@google.com>
To: petr.pavlu@suse.com
Cc: arnd@arndb.de, linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	mcgrof@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	samitolvanen@google.com, sidnayyar@google.com, maennich@google.com, 
	gprocida@google.com
Content-Type: text/plain; charset="UTF-8"

This patch series implements a mechanism for scalable exported symbol
flags using a separate section called __kflagstab. The series introduces
__kflagstab support, removes *_gpl sections in favor of a GPL flag,
simplifies symbol resolution during module loading, and adds symbol
import protection.

Thank you Petr Pavlu for their valuable feedback.

---
Changes from v1:
- added a check to ensure __kflagstab is present
- added warnings for the obsolete *_gpl sections
- moved protected symbol check before ref_module() call
- moved protected symbol check failure warning to issue detection point

v1:
https://lore.kernel.org/all/20250829105418.3053274-1-sidnayyar@google.com/

Siddharth Nayyar (10):
  define kernel symbol flags
  linker: add kflagstab section to vmlinux and modules
  modpost: create entries for kflagstab
  module loader: use kflagstab instead of *_gpl sections
  modpost: put all exported symbols in ksymtab section
  module loader: remove references of *_gpl sections
  linker: remove *_gpl sections from vmlinux and modules
  remove references to *_gpl sections in documentation
  modpost: add symbol import protection flag to kflagstab
  module loader: enforce symbol import protection

 Documentation/kbuild/modules.rst  |  11 +--
 include/asm-generic/vmlinux.lds.h |  21 ++----
 include/linux/export-internal.h   |  28 +++++---
 include/linux/module.h            |   4 +-
 include/linux/module_symbol.h     |   6 ++
 kernel/module/internal.h          |   5 +-
 kernel/module/main.c              | 112 +++++++++++++++---------------
 scripts/mod/modpost.c             |  27 +++++--
 scripts/module.lds.S              |   3 +-
 9 files changed, 120 insertions(+), 97 deletions(-)

-- 
2.51.0.740.g6adb054d12-goog


