Return-Path: <linux-kbuild+bounces-7197-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6288DABEEEF
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 11:02:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D074170EF2
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 09:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71544239573;
	Wed, 21 May 2025 09:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bpkbYjiU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4EF23816F;
	Wed, 21 May 2025 09:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818143; cv=none; b=UVEJAyQb0BhmSRonannGwedTfxp2ovDdOC1XPUZNb7RMWTttUTGpAqmTGmo1TfdmV3rcY8pSLQReXXULIQUx+lUHplFulILfqzdeqdOJNn9mzzmuKvzwMj8ZHrJr+/omkOHA7/clMsVCL1SBPFpM6uNN2FHuFLdb6lw9JzK6jsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818143; c=relaxed/simple;
	bh=+wrkDo4Gk+lDMy/pllmwzZMnziHHQ+ar5Bz4l24kwfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E75fWYQcNkZ+WcbJzIr473wTIWdCMB6hrAZ8M6nEP4f7e8UxtSbFDRQqYlHx/0VOLtUmDi+sFRlk5Q9Uj1wulJBRpzRPxCt0RZxmndjOceBkzYCmZgA8mzAZDkcjzwWVrPGEBVinZOYm/Yp34wpx2Fb3s0TCtDilQMGsAxOv5/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bpkbYjiU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4F4C4AF09;
	Wed, 21 May 2025 09:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747818142;
	bh=+wrkDo4Gk+lDMy/pllmwzZMnziHHQ+ar5Bz4l24kwfk=;
	h=From:To:Cc:Subject:Date:From;
	b=bpkbYjiUBe4e6G2zUfBLfOCFhNWCLtcPxJuK0juPv7AoxMRZyvHcKt4tvzP4F2EUE
	 wBIJnRCweik9TMFGP3Vye48RM+autfXSuPKypO76o5KNKxeSMNugcGo0UeMo5Klu4a
	 0SV32Sd5qPF+dN3b+h8pbnMyaNOgjPvK/D7Rdf/gWRWkT9aljZkeGhWSMynOp5af3B
	 +jzbyNvJEtZdgNW7k8n/9LTVRyuEURk73utteE6nDOhvYRFVS+p4N+HVCZRhlnED4T
	 yn+Akb24OwZ1gSoKlk2v0UD7WrL1alsaaNkF6B5HyDmXEPpbqqqTgGCi91DZh9Y+40
	 bn2P5RZ3txW5w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHfLA-00000006L9X-3PT4;
	Wed, 21 May 2025 11:02:20 +0200
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
Subject: [PATCH v3 0/3] Some kernel-doc fixes
Date: Wed, 21 May 2025 11:02:12 +0200
Message-ID: <cover.1747817887.git.mchehab+huawei@kernel.org>
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

That's the third version of the kernel-doc fixup patch series.

It address the root cause why Sphinx logger was not working: there
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

---

v3:
  - Fix a trivial typo on patch 1;
  - Added Akira's ack;

v2:
  - Solved the root cause of not having Sphinx logs on kerneldoc.py.

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



