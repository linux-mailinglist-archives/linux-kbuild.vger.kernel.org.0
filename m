Return-Path: <linux-kbuild+bounces-4643-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA6F9C436D
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 18:18:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FF0F283708
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2024 17:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61431A7271;
	Mon, 11 Nov 2024 17:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjQmrTqn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFD61A726D;
	Mon, 11 Nov 2024 17:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731345489; cv=none; b=AJqrXQZq8zydw3/4daxJ/5iQug1E+kp7q6vcklUE3jY5PCsyMCGWv1TepYP/OGFMnAthSU9/u7ySh4yx+fHRDxlf3nx1Wq35P7ti8x4rK71T/K6Dvexmtu82zI7bxNAWceVqg55BMIYg4N7jP86Zendyfoi7EhQ0uYcw+7BRKGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731345489; c=relaxed/simple;
	bh=QvEKpn4D5kkpAc5FK+bojkwY93E2JjSLKn8yokXzZ8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=podHpBQVXDV1L6GliwKLbYFSuDAgp5HPxqcvfjrlC+I+yRoasi6SgpyIRZRQBi27TsWm1ZXCuIhdxZba3L8VXdI3XqUQeD3EPRTvzRaljSXEkC6DEs2kbzE9toY/LoGJ1YBwYWAKkofUJX8kd4yGllCfxRoyVijkNulD9F6SYic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjQmrTqn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE2FC4CECF;
	Mon, 11 Nov 2024 17:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731345489;
	bh=QvEKpn4D5kkpAc5FK+bojkwY93E2JjSLKn8yokXzZ8A=;
	h=From:To:Cc:Subject:Date:From;
	b=OjQmrTqnTF1zw4m/qgeQlzlvmPBuDzbagFoUXmZAS28Db8jQwTSyocywExm3atPQW
	 UwmWp4n4bQETvTb40JGdlOHE8z3pu1yb80s9MspuyI4sXk7sk9h7IVd/ThdbqUHdmZ
	 1PbQoEZQVYTyDJkl2UYVYCflgDIBl8C0Sjan789CVT26dEpN6aLMFQ/GC/s/s5Xg01
	 EZ/jbYdw/mpPi+P0BWoeFEs5NMXJdw+GxmFFR5l3SkOs6shHDfuxIehpik0vm070tS
	 86xRAB1/X2vfp2y0ujB6ypB8E4Zo0K7NhkMm2CVW71+iTggWBqXDWg+G8jWK8ugUno
	 OUGvRS2Da4ooA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kbuild: do not pass -r to genksyms when *.symref does not exist
Date: Tue, 12 Nov 2024 02:17:40 +0900
Message-ID: <20241111171753.2917697-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is no need to pass '-r /dev/null', which is no-op.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 8f423a1faf50..36eae845a3e3 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -110,7 +110,7 @@ $(obj)/%.i: $(obj)/%.c FORCE
 genksyms = scripts/genksyms/genksyms		\
 	$(if $(1), -T $(2))			\
 	$(if $(KBUILD_PRESERVE), -p)		\
-	-r $(or $(wildcard $(2:.symtypes=.symref)), /dev/null)
+	$(addprefix -r , $(wildcard $(2:.symtypes=.symref)))
 
 # These mirror gensymtypes_S and co below, keep them in synch.
 cmd_gensymtypes_c = $(CPP) -D__GENKSYMS__ $(c_flags) $< | $(genksyms)
-- 
2.43.0


