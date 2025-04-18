Return-Path: <linux-kbuild+bounces-6699-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEC4A94070
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Apr 2025 01:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A54F3B7D9A
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Apr 2025 23:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AD62550C2;
	Fri, 18 Apr 2025 23:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GV65kiKF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB253253F35;
	Fri, 18 Apr 2025 23:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745020238; cv=none; b=ngV88W4DzrLCLXfcKpT5cymZ7z1dsAkgZ5RTcQBr03gSbt8BG2YqcJuqdBP1RtBX6AIPZ6yVF6YGiciIuaU5HPwEIgRkbsLDd9JR6P647kZhY5oxZrsgngiacWDtQ5GuROdlvonnSRCvhnGSowucUI+hrpIyDNXel3ZcNolwfCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745020238; c=relaxed/simple;
	bh=c5ICYBvBMQAPVgTj8nFGD8PU7cVGL/PCYMCLPDiK5Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P9H+iItHRt9HEXXXKNlRlcb+YHQTGaqIut59Djd+O3y8B1v2umUJHjQ2JjwNMif45zKH9pPX42tAj1b/83AEaWI+q1mJlWhY90qHGRlebo8qtUEsCYUUdyjMsLwwW6RUBwOgaD8f5uVOEYk8Es5mVyiOe/+HItERH9AuRzay9iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GV65kiKF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B280C4CEE2;
	Fri, 18 Apr 2025 23:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745020238;
	bh=c5ICYBvBMQAPVgTj8nFGD8PU7cVGL/PCYMCLPDiK5Gc=;
	h=From:To:Cc:Subject:Date:From;
	b=GV65kiKFF+X9GzT4JIT/UUSoxT3SpDas8hBEq8A4jTKyqArNe7tVul4mT4qqajI8y
	 yxdKRIosYX8ZBTP85HhUG5gLGKXtM6o/d47jM2eykngbIDxmTO7gTbMWGpNDD5d7Hm
	 rmfXGWRhP9u3xj7GLRQsoICOKRRHe1XZbDtqtHwOnyN/045lHQCqPonn2j4K7GRRne
	 1yTjqGNpWgJGuZ++Dmbnjky05UP+nkGF7Ki01h5D+LYlmuaTiNn8ETcR5vmMMfxaJO
	 vBrmzVCVnfSSnYfbtTxg/ifnifCNTlELVhjtIIFy8C3kPli7Ono4m/edreGrXjXbcN
	 7+nKBaVrmUd/Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u5vTL-00000003KF5-36VJ;
	Sat, 19 Apr 2025 07:50:15 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	David Airlie <airlied@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v3 0/4] Don't create Python bytecode when building the kernel
Date: Sat, 19 Apr 2025 07:50:01 +0800
Message-ID: <cover.1745019660.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

As reported by Andy, the Kernel build system runs kernel-doc script for DRM,
when W=1. Due to Python's normal behavior, its JIT compiler will create
a bytecode and store it under scripts/lib/*/__pycache__.  As one may be using
O= and even having the sources on a read-only mount point, disable its
creation during build time.

This is done by adding PYTHONDONTWRITEBYTECODE=1 on every place
where the script is called within Kbuild and when called via another script.
 
This only solves half of the issue though, as one may be manually running
the script by hand, without asking Python to not store any bytecode.
This should be OK, but afterwards, git status will list the __pycache__ as
not committed. To prevent that, add *.pyc to .gitignore.

This series contain 4 patches:

- patch 1 adjusts a variable that pass extra data to scripts/kerneldoc.py;
- patch 2moves scripts/kernel-doc location to the main makefile
  and exports it, as scripts/Makefile.build will need it;
- patch 3 disables __pycache__ generation and ensure that the entire Kbuild
  will use KERNELDOC var for the location of kernel-doc;
- patch 4 adds *.pyc at the list of object files to be ignored.

---

v3:
- move KERNELDOC to the main Makefile;
- get rid of the badly-named KERNELDOC_CONF var.

v2:
- added a .gitignore file;
- add PYTHONDONTWRITEBYTECODE=1 to the places where kernel-doc
  is called.

Mauro Carvalho Chehab (4):
  docs: Makefile: get rid of KERNELDOC_CONF env variable
  Makefile: move KERNELDOC macro to the main Makefile
  scripts/kernel-doc.py: don't create *.pyc files
  .gitignore: ignore Python compiled bytecode

 .gitignore                    | 1 +
 Documentation/Makefile        | 5 ++---
 Makefile                      | 5 +++++
 drivers/gpu/drm/Makefile      | 2 +-
 drivers/gpu/drm/i915/Makefile | 2 +-
 include/drm/Makefile          | 2 +-
 scripts/Makefile.build        | 2 +-
 scripts/find-unused-docs.sh   | 2 +-
 8 files changed, 13 insertions(+), 8 deletions(-)

-- 
2.49.0



