Return-Path: <linux-kbuild+bounces-1181-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 148A28729FE
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 23:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3EC5287218
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 22:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C44012D1FB;
	Tue,  5 Mar 2024 22:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uiU0PuA9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B4B12D1F5;
	Tue,  5 Mar 2024 22:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709676776; cv=none; b=tUK1duD0K3OSrbnYLmp0QYl0lE3e5Hic9tOyyKaPbcSbO30tVKp93gY+5KF8u5IHOhlY8cBQlajWH/vvDBuk1yjjKvYb8HoiLhxINkO8lFtajSE4Vp9egv974GzgHaRJz7soOGAs7SzyCjdORhZAiYny6U0ad3PK9uXB9ccsFHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709676776; c=relaxed/simple;
	bh=N5O70PGnzmD3xUniJzo2PH4go3liMuaPdzZZCuwIteU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BfAYzUvi4K6+P2lQqvf6OfTcoWWFmM1qa1L+uUqzCR5jk47G+nVDqx22HCTShJnkRXUnU7XICyHnng7cnSY5uh7WKJ9UUEI5LERWRJcDj/EvJT1vCkSKguwKAKJUCRnrUR5gRSsnUDZ7EP3J0tmBR26KcNgPEWtZUewXECVcR3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uiU0PuA9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17448C433F1;
	Tue,  5 Mar 2024 22:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709676775;
	bh=N5O70PGnzmD3xUniJzo2PH4go3liMuaPdzZZCuwIteU=;
	h=From:Date:Subject:To:Cc:From;
	b=uiU0PuA9PIkjqJ3Wbi6HOzmkK84kyFa73PYdxKqEwrT9vHZ1wRSZ+pwHxDifZkfIW
	 4p64nq4ewgCabq8KDE08C+qovvqmfXP5wx4fwmB4eDk+LBMPOyzd4F65EfGvdhTMGl
	 9Uk5QDz4nLWYyft574LxVbN8cMefhBbbA1pMvmjgY/TKZejhh1gg07uyJeAYn9Sz8t
	 cva21jYWbDFnBRh9dJJw+eFyWvFrEmIYhrRusoIBhKURfHHK0IZyiOTlcuvdxBW1Z9
	 gnH2aX5IAhArJh9g8I/Mxit6NKKuy40PoW7KlJrDFkoeMGVxmXO2IRq/KrgWr9U1Fh
	 JOyroAj5rMw0Q==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 05 Mar 2024 15:12:47 -0700
Subject: [PATCH v2] kbuild: Move
 -Wenum-{compare-conditional,enum-conversion} into W=1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-disable-extra-clang-enum-warnings-v2-1-ba529ec15f95@kernel.org>
X-B4-Tracking: v=1; b=H4sIAN6Y52UC/42NQQ6CMBBFr0Jm7RigIMGV9zAsSjuFiVjMFBFDu
 LuVxL3L9/Pz3gqBhCnAOVlBaObAo4+QHxIwvfYdIdvIkKd5kaq0QMtBtwMhLZNoNEP8IPnnHV9
 aPPsuYOvKqjCVqWtnIXoeQo6XvXFtIvccplHee3LOvuvPXv5hnzPM8KRrRU5ZVTp3uZF4Go6jd
 NBs2/YBXLCGXdMAAAA=
To: masahiroy@kernel.org
Cc: nicolas@fjasle.eu, ndesaulniers@google.com, morbo@google.com, 
 justinstitt@google.com, arnd@arndb.de, yonghong.song@linux.dev, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
 stable@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3729; i=nathan@kernel.org;
 h=from:subject:message-id; bh=N5O70PGnzmD3xUniJzo2PH4go3liMuaPdzZZCuwIteU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKnPZzxr3X+c7+39LLYryz0uW1znrSy8uM9+zXGnqq18R
 lc5pjUt7ShlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATEbRgZFjex+7h6/zVbE5A
 v8+BSXcSk53O1WcpLRWdz7ghWpR5vQTD/1rN04yS21cqz5Vj+fTqyXROI+ZluuwcJ89tmsRhNNM
 9kQUA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Clang enables -Wenum-enum-conversion and -Wenum-compare-conditional
under -Wenum-conversion. A recent change in Clang strengthened these
warnings and they appear frequently in common builds, primarily due to
several instances in common headers but there are quite a few drivers
that have individual instances as well.

  include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
    508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
        |                            ~~~~~~~~~~~~~~~~~~~~~ ^
    509 |                            item];
        |                            ~~~~

  drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c:955:24: warning: conditional expression between different enumeration types ('enum iwl_mac_beacon_flags' and 'enum iwl_mac_beacon_flags_v1') [-Wenum-compare-conditional]
    955 |                 flags |= is_new_rate ? IWL_MAC_BEACON_CCK
        |                                      ^ ~~~~~~~~~~~~~~~~~~
    956 |                           : IWL_MAC_BEACON_CCK_V1;
        |                             ~~~~~~~~~~~~~~~~~~~~~
  drivers/net/wireless/intel/iwlwifi/mvm/mac-ctxt.c:1120:21: warning: conditional expression between different enumeration types ('enum iwl_mac_beacon_flags' and 'enum iwl_mac_beacon_flags_v1') [-Wenum-compare-conditional]
   1120 |                                                0) > 10 ?
        |                                                        ^
   1121 |                         IWL_MAC_BEACON_FILS :
        |                         ~~~~~~~~~~~~~~~~~~~
   1122 |                         IWL_MAC_BEACON_FILS_V1;
        |                         ~~~~~~~~~~~~~~~~~~~~~~

Doing arithmetic between or returning two different types of enums could
be a bug, so each of the instance of the warning needs to be evaluated.
Unfortunately, as mentioned above, there are many instances of this
warning in many different configurations, which can break the build when
CONFIG_WERROR is enabled.

To avoid introducing new instances of the warnings while cleaning up the
disruption for the majority of users, disable these warnings for the
default build while leaving them on for W=1 builds.

Cc: stable@vger.kernel.org
Closes: https://github.com/ClangBuiltLinux/linux/issues/2002
Link: https://github.com/llvm/llvm-project/commit/8c2ae42b3e1c6aa7c18f873edcebff7c0b45a37e
Acked-by: Yonghong Song <yonghong.song@linux.dev>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Changes in v2:
- Only disable the warning for the default build, leave it on for W=1 (Arnd)
- Add Yonghong's ack, as the warning is still disabled for the default
  build.
- Link to v1: https://lore.kernel.org/r/20240305-disable-extra-clang-enum-warnings-v1-1-6a93ef3d35ff@kernel.org
---
 scripts/Makefile.extrawarn | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index a9e552a1e910..2f25a1de129d 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -132,6 +132,8 @@ KBUILD_CFLAGS += $(call cc-disable-warning, pointer-to-enum-cast)
 KBUILD_CFLAGS += -Wno-tautological-constant-out-of-range-compare
 KBUILD_CFLAGS += $(call cc-disable-warning, unaligned-access)
 KBUILD_CFLAGS += $(call cc-disable-warning, cast-function-type-strict)
+KBUILD_CFLAGS += -Wno-enum-compare-conditional
+KBUILD_CFLAGS += -Wno-enum-enum-conversion
 endif
 
 endif

---
base-commit: 90d35da658da8cff0d4ecbb5113f5fac9d00eb72
change-id: 20240304-disable-extra-clang-enum-warnings-bf574c7c99fd

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


