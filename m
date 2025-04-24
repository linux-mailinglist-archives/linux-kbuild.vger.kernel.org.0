Return-Path: <linux-kbuild+bounces-6732-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C206AA99CAE
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Apr 2025 02:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9D175A51B9
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Apr 2025 00:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471998BE8;
	Thu, 24 Apr 2025 00:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ox1L8Ojm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3A050276;
	Thu, 24 Apr 2025 00:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745453843; cv=none; b=KVk0ORp0jZrnsC6iD1HT/EP5tqrhq2l1OMQgwvX2YNgV4e8CXRgalBjY63ElzybS9nEHdh5nIz1brN6t3fdEyf7GOMn00SFCv2/Ya0XUUMT1yRJKkikz1Pd8ynl6NEUbCPQdWZXs1EHZB5doSgEYzpZFZyMVxRawtPvizLIZb34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745453843; c=relaxed/simple;
	bh=GKemA9+yIN791fDKjS2xhXmmMfgA17FoAz9ccfBch3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uoymVjwGot4DowlCWkahOmyNavcwJ4SnWMgj6fX6diGGiLKuhXyVeUGgZz+hd/9T/La9spAaf48K9J7sw6sVNwQjmiCgNmOS2a5/W4OVJFredwi4VojOoFEu3v1sf3EKKELoJP/sRjMGBVXCjxreDnVjaz/by18nsE8MfIl/LDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ox1L8Ojm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E65AFC4CEE2;
	Thu, 24 Apr 2025 00:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745453843;
	bh=GKemA9+yIN791fDKjS2xhXmmMfgA17FoAz9ccfBch3w=;
	h=From:To:Cc:Subject:Date:From;
	b=Ox1L8OjmZGe7yqpVdVdB46si/+gfTqdR4jeyVWs8zwCleOMo1DQoZM1S7jf+3ctor
	 /jaUdHBhJtdn/S+SGJ5wfJ2yZY+nPeCoi/3/y+Eyit8YHabgiiM8IGRK+ClXz6QZDo
	 F2ekWgVgQGxXZHc5QDZkNTjLeLRD3SQf6q5BS1hqe5bmUdkbzmmzDKqESkUGKzbGmJ
	 lSh+3jLgnZ6Hwbg8bBc94kPBPkQqX0s3ziXuOa1tOByLRm+X64mpnEUVTE4MHzr2rW
	 OAihIp5lA/XGyMt+solxdGASZkIgQ5oqtiDVlUAxk/AlmziSV8DXvV4ai14F+IOL52
	 LtDSgHrldB3hg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u7kH5-0000000049Q-1q83;
	Thu, 24 Apr 2025 08:17:07 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
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
Subject: [PATCH v4 0/4] Don't create Python bytecode when building the kernel
Date: Thu, 24 Apr 2025 08:16:20 +0800
Message-ID: <cover.1745453655.git.mchehab+huawei@kernel.org>
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

v4:
- placed *.pyc at the alphabetical order at the final patch

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



