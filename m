Return-Path: <linux-kbuild+bounces-2342-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4617E9276F5
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 15:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76F841C21ED6
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 13:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 969A51AC22E;
	Thu,  4 Jul 2024 13:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUE5VZkZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECE6846F;
	Thu,  4 Jul 2024 13:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720098865; cv=none; b=PQQC53CJqk016Wd0aXcVBz417H3M5YnuoC7PvlvAX8TWHR2Ihro3Ov5ygYQmA8k3KB26OyG4wmSjXV6TX6Gv7jUltNUBTekmDZ81qzcXXEsn7YlJnoaSkvbFCZs3SliyRs8AiVKGXykp3AIuNx98ExYJIM9ijLkgqgDdnrC/FMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720098865; c=relaxed/simple;
	bh=gww8mc4143BBYA7PxrdUysHhBlH0eL2LYz/Lge5Qf9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L330+277K4ivj32KRmF9CUyPe4fUREsh3yk9ZrrzLGHKaK6Mh0gUV8dzKxt44FahbqYx0XkcOZa9VxrpUBOGe+u6j4X01rw0A2QYfO+sGE2bBcsBVIPaRdmhGxtUWLPZuDTaBfzLEMJZSNn7A4YVSf4rxH7sWLsuoSDl4uxLWA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUE5VZkZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82CD5C3277B;
	Thu,  4 Jul 2024 13:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720098863;
	bh=gww8mc4143BBYA7PxrdUysHhBlH0eL2LYz/Lge5Qf9Y=;
	h=From:To:Cc:Subject:Date:From;
	b=cUE5VZkZiISb/eCFNvUjHvzbm9FTD7VMQli6jBnr8rWAc0gNSLbKhmq/P1O+s6vxW
	 OHVAHNFUMqspvWmQ7JWHNTfTuJ8D1MMyzPBHMn/fmgX3N5/Nc3utIy/f/R7fgEXw8m
	 eXyjrpCi2H+M/dpKlTAS+LKF8Yzyl7qnDgj2h8a+as5GQULr69oIFBOdvN3Ku+JNYM
	 nguCzdElIgUemLEl2BD2cTOG5gT699/Yky5jlVd9lAFo0DcZuTgxqNT74tYodSHc2I
	 YkAV8fkAzwFvBGeDosKWWeywtQp8bb6Pqiy7pckbNWlZH+91sCpE6VVskAA11ORf3k
	 W621JwhkGfIgQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Rob Herring <robh@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH] kbuild: avoid build error when single DTB is turned into composite DTB
Date: Thu,  4 Jul 2024 22:13:58 +0900
Message-ID: <20240704131400.1501638-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As commit afa974b77128 ("kbuild: add real-prereqs shorthand for
$(filter-out FORCE,$^)") explained, $(real-prereqs) is not just a list
of objects when linking a multi-object module. If a single-object module
is turned into a multi-object module, $^ (and therefore $(real-prereqs)
as well) contains header files recorded in the *.cmd file. Such headers
must be filtered out.

Now that a DTB can be built either from a single source or multiple
source files, the same issue can occur.

Consider the following scenario:

First, foo.dtb is implemented as a single-blob device tree.

The code looks something like this:

[Sample Code 1]

  Makefile:

      dtb-y += foo.dtb

  foo.dts:

    #include <dt-bindings/gpio/gpio.h>
    /dts-v1/;
    / { };

When it is compiled, .foo.dtb.cmd records that foo.dtb depends on
scripts/dtc/include-prefixes/dt-bindings/gpio/gpio.h.

Later, foo.dtb is split into a base and an overlay. The code looks
something like this:

[Sample Code 2]

  Makefile:

      dtb-y += foo.dtb
      foo-dtbs := foo-base.dtb foo-addon.dtbo

  foo-base.dts:

    #include <dt-bindings/gpio/gpio.h>
    /dts-v1/;
    / { };

  foo-addon.dtso:

    /dts-v1/;
    /plugin/;
    / { };

If you rebuild foo.dtb without 'make clean', you will get this error:

  Overlay 'scripts/dtc/include-prefixes/dt-bindings/gpio/gpio.h' is incomplete

The reason for the error is because $(real-prereqs) contains not only
foo-base.dtb and foo-addon.dtbo but also
scripts/dtc/include-prefixes/dt-bindings/gpio/gpio.h, which is passed to
the fdtoverlay tool.

Fixes: 15d16d6dadf6 ("kbuild: Add generic rule to apply fdtoverlay")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index d78b5d38beaa..636119dc4403 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -407,8 +407,12 @@ cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ;
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
 	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
 
+# NOTE:
+# Do not replace $(filter %.dtb %.dtbo, $^) with $(real-prereqs). When a single
+# DTB is turned into a multi-blob DTB, $^ will contain header file dependencies
+# recorded in the .*.cmd file.
 quiet_cmd_fdtoverlay = DTOVL   $@
-      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(real-prereqs)
+      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(filter %.dtb %.dtbo, $^)
 
 $(multi-dtb-y): FORCE
 	$(call if_changed,fdtoverlay)
-- 
2.43.0


