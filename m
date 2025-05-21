Return-Path: <linux-kbuild+bounces-7189-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EE0ABEC8D
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 08:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C29021B62939
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 07:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27A9231853;
	Wed, 21 May 2025 06:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DiDq7k09"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C690BBA27;
	Wed, 21 May 2025 06:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747810785; cv=none; b=kh0z6bMmKniBzKJK8FoBtjNHoeSDzMd1LGVMWbOY8ZS0rNZgNZxLxqGHogErCLQojJ4XhQIAH19mHCGNEAY1ssUc5wHWDucsP/F8rSq8ozXgD9+FaZbgdDQcYmQ9b5G2k2Fn1PqCY7x+3PBXoRXHOqnilsIodQJnDcv+3T83kD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747810785; c=relaxed/simple;
	bh=RwWdxwaSlSV5EsU5bsdskKeHVwJHrekEM/wt3trKGAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xq8rZAnrGZpIK1rdzs0suK7CV+iLYpJO4jvnTtX0DiUoyMmDhlK18c3jAPnGaHvv0Qbi3XYo0eZTVdWx/0r8+e3TR+i0qyJQVAevwR+9WktilvckN+rpsWPmbDmIccvIxSC3s/5nHQmahRFNpNNHLrFW/Lrjeswi7UCEPjcjV/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DiDq7k09; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F7AC4CEE4;
	Wed, 21 May 2025 06:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747810785;
	bh=RwWdxwaSlSV5EsU5bsdskKeHVwJHrekEM/wt3trKGAo=;
	h=From:To:Cc:Subject:Date:From;
	b=DiDq7k09Y8Mv5u4/8ibafb8+cRmUMQsTyI5Vzt3a34rz67fprNEguOUrcYyvErUvh
	 jK8bcxvg6r7EdTaKL4W+eQdcXphnwZm2WyZNmATrxt++/GNog8HayQuLoxdCWQ6x71
	 CvMlZGXWOhXf5+W8E5gaoIw2PislcvUhSFT1qPWg8SHYJeQxGlkr29ZM13vj3lyM/I
	 tIEe0fMDIrkt4hMN8RmmPABP3S6XnLHcpGdCUjn2zCPkqUgcVk73/JybclUTQztgeY
	 LmX918wQ+VrsHCa8P/w/BahCqcyMlZpjlr63NFQF4kKqykAk7+D2yiAPRhFbV+CdPa
	 pvYxf0RhG+BMg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHdQV-00000006IFv-2rKb;
	Wed, 21 May 2025 08:59:43 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	linux-doc@vger.kernel.org,
	Masahiro Yamada <mchehab+huawei@kernel.org>,
	Nathan Chancellor <mchehab+huawei@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Some kernel-doc fixes
Date: Wed, 21 May 2025 08:59:30 +0200
Message-ID: <cover.1747810691.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

That's the second version of the kernel-doc fixup patch series.

I discovered the root cause why Sphinx logger was not working: there
was a call there for logger.verbose(). According with:

	https://www.sphinx-doc.org/en/master/extdev/logging.html

This is a valid call, but it doesn't verbose messages. Instead, it is
crashing with modern Sphinx versions, causing the log to not work.

I got rid of it, replacing by logger.info().  I took the time to also
address an issue pointed by Andy: not having the same log message
placed everywhere. With such change, we can keep using Sphinx
logger (which produces colored messages) inside kernel-doc
classes.

With that, we have:

Patch 1:	makes Lore and kernel-doc ML receive patches related
	to kernel-doc.py and get_abi.py.
Patch 2:	cleanup try/except logic and get rid of logger.verbose();
Patch 3:	fix a KeyError when trying to acess data from non-existing files;

If you test just patch 1 on the top of next-20250516, you'll see the
keyerror message (in red):

	ERROR: Cannot find file ./drivers/gpio/gpiolib-acpi.c
	ERROR: Cannot find file ./drivers/gpio/gpiolib-acpi.c
	WARNING: kernel-doc './scripts/kernel-doc.py -rst -enable-lineno -export ./drivers/gpio/gpiolib-acpi.c' processing failed with: KeyError('./drivers/gpio/gpiolib-acpi.c')

And the script doesn't crash anymore. After patch 2, the try/except
warning gets replaced by a proper message:

	ERROR: Cannot find file ./drivers/gpio/gpiolib-acpi.c
	ERROR: Cannot find file ./drivers/gpio/gpiolib-acpi.c
	WARNING: No kernel-doc for file ./drivers/gpio/gpiolib-acpi.c

Please apply it to solve the issues that are reported by Stephen and Akira.

Regards,
Mauro
Mauro Carvalho Chehab (3):
  MAINTAINERS: update linux-doc entry to cover new Python scripts
  docs: kerneldoc.py: simplify exception handling logic
  scripts: kernel-doc: prevent a KeyError when checking output

 Documentation/sphinx/kerneldoc.py | 108 +++++++++++++-----------------
 MAINTAINERS                       |   5 +-
 scripts/lib/kdoc/kdoc_files.py    |   4 ++
 3 files changed, 53 insertions(+), 64 deletions(-)

-- 
2.49.0



