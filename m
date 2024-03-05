Return-Path: <linux-kbuild+bounces-1175-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B024F8725D4
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 18:43:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FDD11F21924
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 17:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D81F17555;
	Tue,  5 Mar 2024 17:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIRW9gzq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483EFBE4D;
	Tue,  5 Mar 2024 17:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709660582; cv=none; b=Py5pTH9EZpejl1KvaR8BOjEi2eJ2Uy7N1wgRaI0meY4qEP2HyuBa5C8Oru0RhlquZe9hwkYX66Ysvq5wjW46K8EAaDdbtTeaolR+4lLtH5lH/mojvbN4hPzlAWqCsJGI2NleH4/yu8siaDRIfJ8Y2CjkvIHBYSo8HGFN7stPz0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709660582; c=relaxed/simple;
	bh=oVW3xti/oddK+lHR7km/I+gcOqSZgwQguCcVLgi7iQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VPYzxGd0rqtPo1Oh0a/oWQYfpfbLQE71HfUbBKJd5K65wy6IlpwTdnqLUhozvV1FBV4Lh4co6u36kH/YyOsBBFzDyTYxjOAsyOuAOZR84V/6suRfqXa6PA/RC+i3bYsMg4hvPfVJSeblrXOKGkvehqcjS1jgQCrS6ajZ7RezNhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIRW9gzq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1771FC433C7;
	Tue,  5 Mar 2024 17:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709660581;
	bh=oVW3xti/oddK+lHR7km/I+gcOqSZgwQguCcVLgi7iQ8=;
	h=From:Date:Subject:To:Cc:From;
	b=kIRW9gzq4jKNT7Z1GAadTz+GbpnBPW/O80H3suGrswIK7olLKDNd1QNDRBv1ACxfB
	 Rw3OJlysQLqKOHivUsJvk38AcxhlQTl3TXlcJaAobh5tEUbFM5IT4QW1bYL0rLpMsZ
	 +jFWB8bAQvcAlseJmAZllZBGADV0QbJ466ywkNs5NIvYugIs8qWK7A7osrt3HwYBex
	 ZTPRIRML7oNYZjIbXeZpAmc8i9JFjrdzhEb4VSuw/+iXh5/w4UALAQyhgSF49jN8ai
	 cZZO5mdJDEmSEUtMYGPb4SQM7zU51HdPL5U1TTKGWV3MjjwYoEJ66sNz96StQAb8Di
	 luGol5SeEfwPA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 05 Mar 2024 10:42:50 -0700
Subject: [PATCH] kbuild: Disable two Clang specific enumeration warnings
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-disable-extra-clang-enum-warnings-v1-1-6a93ef3d35ff@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJlZ52UC/x2NywqDMBAAf0X23IWoKWJ/pfQQk41dsGvZ9QXiv
 zf0ODDMnGCkTAaP6gSljY1nKVDfKojvICMhp8LQuMa71nlMbGGYCOlYNGCcioMk6wf3oMIyGg7
 53vnYxb7PCUrnq5T5+D+er+v6ARre46NzAAAA
To: masahiroy@kernel.org
Cc: nicolas@fjasle.eu, ndesaulniers@google.com, morbo@google.com, 
 justinstitt@google.com, arnd@arndb.de, yonghong.song@linux.dev, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
 stable@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3911; i=nathan@kernel.org;
 h=from:subject:message-id; bh=oVW3xti/oddK+lHR7km/I+gcOqSZgwQguCcVLgi7iQ8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKnPI5c0rNBNXppi3vty7mbjafkHuCbLxD2p/76SV3qn1
 erDy/Yu6ChlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATcZjAyNAzzUX+dsCjVZuU
 I3+p9nEEHTcv3H9F7O6loH5RlqikybYM/10DD7Il7pXoscg8ymbS0/jaterLYbFyzeQKc8OCIG8
 bFgA=
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

While doing arithmetic with different types of enums may be potentially
problematic, inspecting several instances of the warning does not reveal
any obvious problems. To silence the warnings at the source level, an
integral cast must be added to each mismatched enum (which is incredibly
ugly when done frequently) or the value must moved out of the enum to a
macro, which can remove the type safety offered by enums in other
places, such as assignments that would trigger -Wenum-conversion.

As the warnings do not appear to have a high signal to noise ratio and
the source level silencing options are not sustainable, disable the
warnings unconditionally, as they will be enabled with -Wenum-conversion
and are supported in all versions of clang that can build the kernel.

Cc: stable@vger.kernel.org
Closes: https://github.com/ClangBuiltLinux/linux/issues/2002
Link: https://github.com/llvm/llvm-project/commit/8c2ae42b3e1c6aa7c18f873edcebff7c0b45a37e
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/Makefile.extrawarn | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index a9e552a1e910..6053aa22b8f5 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -81,6 +81,14 @@ KBUILD_CFLAGS += $(call cc-option,-Werror=designated-init)
 
 # Warn if there is an enum types mismatch
 KBUILD_CFLAGS += $(call cc-option,-Wenum-conversion)
+ifdef CONFIG_CC_IS_CLANG
+# Clang enables these extra warnings under -Wenum-conversion but the kernel
+# performs arithmetic using or has conditionals returning enums of different
+# types in several different places, which is rarely a bug in the kernel's
+# case, so disable the warnings.
+KBUILD_CFLAGS += -Wno-enum-compare-conditional
+KBUILD_CFLAGS += -Wno-enum-enum-conversion
+endif
 
 #
 # W=1 - warnings which may be relevant and do not occur too often

---
base-commit: 90d35da658da8cff0d4ecbb5113f5fac9d00eb72
change-id: 20240304-disable-extra-clang-enum-warnings-bf574c7c99fd

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


