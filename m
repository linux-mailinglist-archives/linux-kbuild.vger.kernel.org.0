Return-Path: <linux-kbuild+bounces-2-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7047E7EE1
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Nov 2023 18:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5F781C20E12
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Nov 2023 17:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8B73B78E;
	Fri, 10 Nov 2023 17:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gz1b7hYg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rTSBa9Wa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC173B285
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Nov 2023 17:46:43 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DF1F3304A;
	Fri, 10 Nov 2023 04:14:15 -0800 (PST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 90AEA1F8BA;
	Fri, 10 Nov 2023 12:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1699618453; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QX78m2JYGrcXwvspyj484zbVEclz63Eiy31NhDT1SqE=;
	b=gz1b7hYgVM8aTGLAO9EXAnuAVrRCsOXzuoaxKeBcYbA+BGx1eIboZbd/4IXe9JXqnaa/9D
	44ZoRU58k+QpTCi4eYEZOT49G8gv7WiQHsL3AQwrs4ftfAdgLZovDEmunM0rR+BCCvpf7R
	9cWTcDyo6dMgO1AiSQtm9um+GSvHe0k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1699618453;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QX78m2JYGrcXwvspyj484zbVEclz63Eiy31NhDT1SqE=;
	b=rTSBa9WaqhbHY9bRIESTtwbSEBeyelSuzacqbhDKRwodTmmZIdlcfZqCTq6dTRcg0LkrQj
	ai3HigrTzvAP4vBg==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	by relay2.suse.de (Postfix) with ESMTP id E0CB42C29B;
	Fri, 10 Nov 2023 12:14:12 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linux-modules@vger.kernel.org,
	Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Michal Suchanek <msuchanek@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	Lucas De Marchi <lucas.de.marchi@gmail.com>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jiri Slaby <jslaby@suse.com>,
	Jan Engelhardt <jengelh@inai.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] kmod /usr support
Date: Fri, 10 Nov 2023 13:13:53 +0100
Message-ID: <cover.1699618135.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <e3yow7ih6af2hxzkmjay2oan3jypmo4hda64vxvpfco66ajcew@i3zewn4nbklf>
References: <e3yow7ih6af2hxzkmjay2oan3jypmo4hda64vxvpfco66ajcew@i3zewn4nbklf>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This is resend of the last patch in the series that adds prefix support
to kernel module location together with additional patch for validating
the user supplied input to options that are interpreted as directories.

Thanks

Michal

Michal Suchanek (2):
  libkmod, depmod, modprobe: Make directory for kernel modules
    configurable
  configure: Check that provided paths are absolute

 Makefile.am                          |   3 +-
 configure.ac                         |  24 ++++++
 libkmod/libkmod.c                    |   4 +-
 man/Makefile.am                      |   1 +
 man/depmod.d.xml                     |   6 +-
 man/depmod.xml                       |   4 +-
 man/modinfo.xml                      |   2 +-
 man/modprobe.xml                     |   2 +-
 man/modules.dep.xml                  |   6 +-
 testsuite/module-playground/Makefile |   2 +-
 testsuite/setup-rootfs.sh            | 109 +++++++++++++++------------
 testsuite/test-depmod.c              |  16 ++--
 testsuite/test-testsuite.c           |   8 +-
 tools/depmod.c                       |   6 +-
 tools/kmod.pc.in                     |   1 +
 tools/modinfo.c                      |   4 +-
 tools/modprobe.c                     |   4 +-
 tools/static-nodes.c                 |   6 +-
 18 files changed, 124 insertions(+), 84 deletions(-)

-- 
2.42.0


