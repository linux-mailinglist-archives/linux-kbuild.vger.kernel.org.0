Return-Path: <linux-kbuild+bounces-10509-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 807E9D13E4E
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 17:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BFC73027CC4
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 16:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D87E3644A1;
	Mon, 12 Jan 2026 16:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwKH/gTl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89526364036
	for <linux-kbuild@vger.kernel.org>; Mon, 12 Jan 2026 16:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768234105; cv=none; b=AW4tRmCwAatPNQgaBSZHrvMmqCkGTbLy3SMHZY14g9TqT/+MrzFvrxpXvn3579F3jzUo0znodtGojVPT+YJQ0MslyoxZzFfU3Io8wxkyLU7go9QsnuJl0tTjiV5UUT3chxbWSLJynbkhmoMqwbNDxJ0YUpHajPm+5EXAkId9MC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768234105; c=relaxed/simple;
	bh=0XtRZk5NkOQKKYgmfKhfMF8RiEokBH47z05TiDmKqEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qxT9kM6no+J3uc0gnR6FYxt+Ww+8GVzoPHPyYRm8oTMwZ8c5Ja40BC0OLfOXVE5GyU7Q4bXqh4qFlfkRTXS9nz86Xc/TgfLThDOdIgaT5MB4T3PA3Ck7m/FRlRA8GUsQKc2hdD6KT3iM1ZfevF/qb2IiocZOxqDUYaygzVsy4HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwKH/gTl; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-64baaa754c6so9332969a12.3
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jan 2026 08:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768234102; x=1768838902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rhL4JNvGH/Ad37oTzLQ5PqwjNlackbvAhbcxlZaqeQI=;
        b=IwKH/gTl43L2JhEXOm3E3D0uM9AtX5qcoyMjdMfmorF2gJB0/Bw7bAoPYEaFYmMYap
         ++dEgHgT6jrvolHEnVrVChb1W4c8t/bf3108VxJMCzO6FeOTVymaX+5PSft+YAlaD+iX
         VtwTU9tlBLYBkjHakbvyAE6Gf/sD3ixzsCbtZoOkZ17nDQWu6tWqzp4WudOmWdGGUUB/
         oJVUX9uvnOUchWvv4cHnCEG+v5z8GoprFzeKWKATDaPfSZgqZA0yD57ePezm/VK25P92
         qWPEhlmmPkmLYherCLetDYVFqtx7ooGylmzxxiXO1ykjWbABhKUMgdfiU4YVCEDUcA84
         XRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768234102; x=1768838902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhL4JNvGH/Ad37oTzLQ5PqwjNlackbvAhbcxlZaqeQI=;
        b=R7y1ioLeU5ADgehC8UxpE8PgwzIqjUyiAE+vBKm8PeMnSx/XLNvxiQGfC1/aejF9S7
         /8M5ZW6a4YY2rNMpTfdt0RmovEDAdV8vFiYBaJM3a78UABxOiSEq+Sb3oFMbmzCi8hH9
         Br2qsBi5oQ+Z7obR+3R1CDsYr4yV34l7Jw8ATh3QR5Nqjpk8T0LC+e9G3w0bha4iM7qe
         n9cWzcM9UI4xQNL9pC4HnngIgiT/WlvQ7CU6H+7ZPNiix64r23XRLQUgaA00tDkTup4c
         ccMYOfxn2+nfnrP8EcS1Rmv+KyXfINKchu894yhp20NhKmoyYnKxsZ+MIf4K0ePoz3eN
         WgNA==
X-Forwarded-Encrypted: i=1; AJvYcCWgYsXYv6A9IBpdSzeqDf34CsECJgzMiya4IHlizaJkOWXhVco8+0/qMoYIFBTNX2+bq12iPQ0VWTxZYmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR9GNdGEjcfhdPPTNmeQ5XgYqB4/FSVD/cRVMQWYktl3d3sRM2
	IpMq6A76V+GwKLoA4evS3iwpSGc3VQGMX3lZvX7dXaMv7SMBcni5k7mBIVf+ZVzu
X-Gm-Gg: AY/fxX7IEHOHRpJpWnsSUEaVmkM85143VrKeK/EroEg82o911DgSC5sol1Gx6UF/LiP
	pYNpQNmjkZF1CtrmEgo6aMhBPYkv4IGJk5M1YGUcrA6kqZQ7pfQbADl6aHDumfYA5NHP+W+e9Kd
	QL1tJzsNPp5+zLknyKQxWut8e4XZ5B8aYPGWoSmw4u0sltWXlKwDz5+/cdkmrpM3NU00rPZmDE2
	xQI6SQ7IXoXUPbxG2cM9jqVH7oOE+jvBPx5hPGbD4JiS7etpKYspJ0P/HHSSJ8X6VELwQhl18Ja
	WhkghjfS7EQlDYq7pBuLFjYl/HC4uS6oBqpy0wayqNscnB6+xPP/sj7R00vIF004Ve1trSRmfAI
	LffmpPQXrTfsXDO0iatIgA+h6gEeKeSXh4q9soiU6L/YqK6sMZXFyQ7NBjRlYLnv3iEYSGTEYJi
	RTcfAmHIcUY3N15EzTaDkwqzutRoc5UasqbdwbJ/ao2Ww=
X-Google-Smtp-Source: AGHT+IFazFrD0ua/D+OyOxZV/TILTiOYzJ/3DUB89wm9e5Xuy/h95OK98M827+C0BmLeSL4ZrMLPsQ==
X-Received: by 2002:a17:907:1b1d:b0:b73:6c97:af4b with SMTP id a640c23a62f3a-b84453eb56amr1811673766b.45.1768234101567;
        Mon, 12 Jan 2026 08:08:21 -0800 (PST)
Received: from MacBookPro ([2a02:8071:2186:3703:6de9:eb98:99c8:7af2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b8c4c15sm17955883a12.4.2026.01.12.08.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 08:08:21 -0800 (PST)
From: Nauman Sabir <officialnaumansabir@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-kbuild@vger.kernel.org,
	Nauman Sabir <officialnaumansabir@gmail.com>
Subject: [PATCH v3 3/3] Documentation: Fix typos and grammatical errors
Date: Mon, 12 Jan 2026 17:08:20 +0100
Message-ID: <20260112160820.19075-1-officialnaumansabir@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix various typos and grammatical errors across documentation files:

- Fix missing preposition 'in' in process/changes.rst
- Correct 'result by' to 'result from' in admin-guide/README.rst
- Fix 'before hand' to 'beforehand' in cgroup-v1/hugetlb.rst
- Correct 'allows to limit' to 'allows limiting' in hugetlb.rst,
  cgroup-v2.rst, and kconfig-language.rst
- Fix 'needs precisely know' to 'needs to precisely know'
- Correct 'overcommited' to 'overcommitted' in hugetlb.rst
- Fix subject-verb agreement: 'never causes' to 'never cause'
- Fix 'there is enough' to 'there are enough' in hugetlb.rst
- Fix 'metadatas' to 'metadata' in filesystems/erofs.rst
- Fix 'hardwares' to 'hardware' in scsi/ChangeLog.sym53c8xx

Signed-off-by: Nauman Sabir <officialnaumansabir@gmail.com>
---
 Documentation/admin-guide/README.rst           |  2 +-
 .../admin-guide/cgroup-v1/hugetlb.rst          | 18 +++++++++---------
 Documentation/admin-guide/cgroup-v2.rst        |  2 +-
 Documentation/filesystems/erofs.rst            |  2 +-
 Documentation/kbuild/kconfig-language.rst      |  2 +-
 Documentation/process/changes.rst              |  2 +-
 Documentation/scsi/ChangeLog.sym53c8xx         |  2 +-
 7 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index 05301f03b717..77fec1de6dc8 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -53,7 +53,7 @@ Documentation
    these typically contain kernel-specific installation notes for some
    drivers for example. Please read the
    :ref:`Documentation/process/changes.rst <changes>` file, as it
-   contains information about the problems, which may result by upgrading
+   contains information about the problems which may result from upgrading
    your kernel.
 
 Installing the kernel source
diff --git a/Documentation/admin-guide/cgroup-v1/hugetlb.rst b/Documentation/admin-guide/cgroup-v1/hugetlb.rst
index 493a8e386700..b5f3873b7d3a 100644
--- a/Documentation/admin-guide/cgroup-v1/hugetlb.rst
+++ b/Documentation/admin-guide/cgroup-v1/hugetlb.rst
@@ -77,7 +77,7 @@ control group and enforces the limit during page fault. Since HugeTLB
 doesn't support page reclaim, enforcing the limit at page fault time implies
 that, the application will get SIGBUS signal if it tries to fault in HugeTLB
 pages beyond its limit. Therefore the application needs to know exactly how many
-HugeTLB pages it uses before hand, and the sysadmin needs to make sure that
+HugeTLB pages it uses beforehand, and the sysadmin needs to make sure that
 there are enough available on the machine for all the users to avoid processes
 getting SIGBUS.
 
@@ -91,23 +91,23 @@ getting SIGBUS.
   hugetlb.<hugepagesize>.rsvd.usage_in_bytes
   hugetlb.<hugepagesize>.rsvd.failcnt
 
-The HugeTLB controller allows to limit the HugeTLB reservations per control
+The HugeTLB controller allows limiting the HugeTLB reservations per control
 group and enforces the controller limit at reservation time and at the fault of
 HugeTLB memory for which no reservation exists. Since reservation limits are
-enforced at reservation time (on mmap or shget), reservation limits never causes
-the application to get SIGBUS signal if the memory was reserved before hand. For
+enforced at reservation time (on mmap or shget), reservation limits never cause
+the application to get SIGBUS signal if the memory was reserved beforehand. For
 MAP_NORESERVE allocations, the reservation limit behaves the same as the fault
 limit, enforcing memory usage at fault time and causing the application to
 receive a SIGBUS if it's crossing its limit.
 
 Reservation limits are superior to page fault limits described above, since
 reservation limits are enforced at reservation time (on mmap or shget), and
-never causes the application to get SIGBUS signal if the memory was reserved
-before hand. This allows for easier fallback to alternatives such as
+never cause the application to get SIGBUS signal if the memory was reserved
+beforehand. This allows for easier fallback to alternatives such as
 non-HugeTLB memory for example. In the case of page fault accounting, it's very
-hard to avoid processes getting SIGBUS since the sysadmin needs precisely know
-the HugeTLB usage of all the tasks in the system and make sure there is enough
-pages to satisfy all requests. Avoiding tasks getting SIGBUS on overcommited
+hard to avoid processes getting SIGBUS since the sysadmin needs to precisely know
+the HugeTLB usage of all the tasks in the system and make sure there are enough
+pages to satisfy all requests. Avoiding tasks getting SIGBUS on overcommitted
 systems is practically impossible with page fault accounting.
 
 
diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 7f5b59d95fce..098d6831b3c0 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2816,7 +2816,7 @@ DMEM Interface Files
 HugeTLB
 -------
 
-The HugeTLB controller allows to limit the HugeTLB usage per control group and
+The HugeTLB controller allows limiting the HugeTLB usage per control group and
 enforces the controller limit during page fault.
 
 HugeTLB Interface Files
diff --git a/Documentation/filesystems/erofs.rst b/Documentation/filesystems/erofs.rst
index 08194f194b94..e61db115e762 100644
--- a/Documentation/filesystems/erofs.rst
+++ b/Documentation/filesystems/erofs.rst
@@ -154,7 +154,7 @@ to be as simple as possible::
   0 +1K
 
 All data areas should be aligned with the block size, but metadata areas
-may not. All metadatas can be now observed in two different spaces (views):
+may not. All metadata can be now observed in two different spaces (views):
 
  1. Inode metadata space
 
diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index abce88f15d7c..7067ec3f0011 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -216,7 +216,7 @@ applicable everywhere (see syntax).
 
 - numerical ranges: "range" <symbol> <symbol> ["if" <expr>]
 
-  This allows to limit the range of possible input values for int
+  This allows limiting the range of possible input values for int
   and hex symbols. The user can only input a value which is larger than
   or equal to the first symbol and smaller than or equal to the second
   symbol.
diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 62951cdb13ad..0cf97dbab29d 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -218,7 +218,7 @@ DevFS has been obsoleted in favour of udev
 Linux documentation for functions is transitioning to inline
 documentation via specially-formatted comments near their
 definitions in the source.  These comments can be combined with ReST
-files the Documentation/ directory to make enriched documentation, which can
+files in the Documentation/ directory to make enriched documentation, which can
 then be converted to PostScript, HTML, LaTex, ePUB and PDF files.
 In order to convert from ReST format to a format of your choice, you'll need
 Sphinx.
diff --git a/Documentation/scsi/ChangeLog.sym53c8xx b/Documentation/scsi/ChangeLog.sym53c8xx
index 3435227a2bed..6bca91e03945 100644
--- a/Documentation/scsi/ChangeLog.sym53c8xx
+++ b/Documentation/scsi/ChangeLog.sym53c8xx
@@ -3,7 +3,7 @@ Sat May 12 12:00 2001 Gerard Roudier (groudier@club-internet.fr)
 	- Ensure LEDC bit in GPCNTL is cleared when reading the NVRAM.
 	  Fix sent by Stig Telfer <stig@api-networks.com>.
 	- Backport from SYM-2 the work-around that allows to support 
-	  hardwares that fail PCI parity checking.
+	  hardware that fails PCI parity checking.
 	- Check that we received at least 8 bytes of INQUIRY response 
 	  for byte 7, that contains device capabilities, to be valid.
 	- Define scsi_set_pci_device() as nil for kernel < 2.4.4.
-- 
2.52.0


