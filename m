Return-Path: <linux-kbuild+bounces-275-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E65E8078DE
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Dec 2023 20:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FB051C20AF8
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Dec 2023 19:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665B447F7D;
	Wed,  6 Dec 2023 19:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vxde8W9L";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N/kQZ0uf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F17DC122;
	Wed,  6 Dec 2023 11:48:04 -0800 (PST)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	by smtp-out2.suse.de (Postfix) with ESMTP id 5D17F1FD37;
	Wed,  6 Dec 2023 19:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1701892082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ov8zefNWK8DeiwA8wNVUU354vvSd05uhQtoU+uecmDY=;
	b=Vxde8W9L32OvzV66naFp5LegxWVnktfLOQxSU4r2/FXOT34vlgbTXtHpxOWhAmLK+B/73L
	XR7cyCG/NfI/yekcCSh6V7DvfjtfTOZFjGmrc8rJNA3nTr1Mhz5atOsuYiqOU5VArTjIZ2
	puZSYGGMG1lLHqUnVgttqtciGYmgU9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1701892082;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ov8zefNWK8DeiwA8wNVUU354vvSd05uhQtoU+uecmDY=;
	b=N/kQZ0ufcHLHHyNCe4PUoNU9JEE5asxwqf4vJAwKHJ8E6geEd+ueA8Yt5ZuVaK/+qC5uLv
	e8D7K+euUDf37vCA==
From: Michal Suchanek <msuchanek@suse.de>
To: linux-modules@vger.kernel.org
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
Subject: [PATCH v6 1/2] depmod: Handle installing modules under a different directory
Date: Wed,  6 Dec 2023 20:47:51 +0100
Message-ID: <32b332af189bfca8acdb231cee294355aa4af290.1701892062.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <CAK7LNAT3N82cJD3GsF+yUBEfPNOBkhzYPk37q3k0HdU7ukz9vQ@mail.gmail.com>
References: <CAK7LNAT3N82cJD3GsF+yUBEfPNOBkhzYPk37q3k0HdU7ukz9vQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Score: 5.20
X-Spamd-Result: default: False [5.20 / 50.00];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 R_MISSING_CHARSET(2.50)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.998];
	 RCPT_COUNT_TWELVE(0.00)[13];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_COUNT_ZERO(0.00)[0];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[suse.de,suse.com,gmail.com,inai.de,kernel.org,google.com,fjasle.eu,vger.kernel.org];
	 SUSPICIOUS_RECIPS(1.50)[]

Some distributions aim at shipping all files in /usr.

The path under which kernel modules are installed is hardcoded to /lib
which conflicts with this goal.

When kmod provides kmod.pc, use it to determine the correct module
installation path.

With kmod that does not provide the config /lib/modules is used as
before.

While pkg-config does not return an error when a variable does not exist
the kmod configure script puts some effort into ensuring that
module_directory is non-empty. With that empty module_directory from
pkg-config can be used to detect absence of the variable.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
v6:
 - use ?= instead of := to make it easier to override the value
 - use shorter expression for determining the module directory assuming
   it's non-empty
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 511b5616aa41..84f32bd563d4 100644
--- a/Makefile
+++ b/Makefile
@@ -1081,7 +1081,9 @@ export INSTALL_DTBS_PATH ?= $(INSTALL_PATH)/dtbs/$(KERNELRELEASE)
 # makefile but the argument can be passed to make if needed.
 #
 
-MODLIB	= $(INSTALL_MOD_PATH)/lib/modules/$(KERNELRELEASE)
+export KERNEL_MODULE_DIRECTORY ?= $(or $(shell pkg-config --variable=module_directory kmod 2>/dev/null),/lib/modules)
+
+MODLIB	= $(INSTALL_MOD_PATH)$(KERNEL_MODULE_DIRECTORY)/$(KERNELRELEASE)
 export MODLIB
 
 PHONY += prepare0
-- 
2.42.0


