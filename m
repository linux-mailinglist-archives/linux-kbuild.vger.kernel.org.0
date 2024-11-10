Return-Path: <linux-kbuild+bounces-4607-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB539C3052
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 02:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B77FC1F217B3
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 01:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F98214A092;
	Sun, 10 Nov 2024 01:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MvF7QobB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52796145A03;
	Sun, 10 Nov 2024 01:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731202625; cv=none; b=khUQovASV1jneTmcyxfmzqjWJzomgiKos7374wxavS8L7vw4Q4XQCz3ynVKg6HBSQW6toVn1KeE1h1594gtcoTzlKuRiK8sAOTH6Vng/6cyl1Zq59PzNMInzIN6VNEJhFPfq/4WQNAq1DrU3b0TAVU1i0oNRk8Se67YDdn3T5/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731202625; c=relaxed/simple;
	bh=4+lPEWVcZF6MP4lqk4tN8WFRUEgGMvVQurcrEWRHgtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aDrkGszD/Flfgxco5H1Il7z/T06ZHogyUeNQdyX3SLKqK/NB+myDsJ29TapstaIanewbsA/LGj6KN12l90TtOg/RSi+sSwKh4yfb1PyJp0IF9BGf5Bu+IRXCafyao77ZQeQWh71yPYcE4yrN31wJf9176CK9tY9//hGAKPxtlJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MvF7QobB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B35C4CECE;
	Sun, 10 Nov 2024 01:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731202624;
	bh=4+lPEWVcZF6MP4lqk4tN8WFRUEgGMvVQurcrEWRHgtY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MvF7QobBQqDTettWvOayNRcLsy9jjZBQiENvg66pi2Oxfa8Y9pHRF3u1DNVz9dLPp
	 KQm4EZ8ON3K1KsirtFtw0HXcGxBY92FIieCYsMF+7f3MKVxGW7IU8cN9tqVnm9JOud
	 Dv5fFMwhNT7s/iuHMzboXeNcR3/aG5hLBlcON2JBuIhfQYsqnyWxJxOdNrRLQi8MQx
	 NPndGurbb44z6An+viiTYhNMGSPAlt9CfEujkpeC5Q21vD1B2hi65DXI1V5X7SYX79
	 J/LBuOCLX3R0/VNjAdNCIAkIJKRA5e4lUWL/LVs+2d/4JT1ycqkOVdVxgefoNW7XWb
	 VM4OU/SHm7yUQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	cocci@inria.fr,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2 04/11] kbuild: use 'output' variable to create the output directory
Date: Sun, 10 Nov 2024 10:34:32 +0900
Message-ID: <20241110013649.34903-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241110013649.34903-1-masahiroy@kernel.org>
References: <20241110013649.34903-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

$(KBUILD_OUTPUT) specifies the output directory of kernel builds.

Use a more generic name, 'output', to better reflect this code hunk in
the context of external module builds.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
---

(no changes since v1)

 Makefile | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index deb3f01863f8..cf1d55560ae2 100644
--- a/Makefile
+++ b/Makefile
@@ -176,18 +176,20 @@ export KBUILD_EXTRA_WARN
 # The O= assignment takes precedence over the KBUILD_OUTPUT environment
 # variable.
 
-# Do we want to change the working directory?
 ifeq ("$(origin O)", "command line")
   KBUILD_OUTPUT := $(O)
 endif
 
-ifneq ($(KBUILD_OUTPUT),)
+output := $(KBUILD_OUTPUT)
+
+# Do we want to change the working directory?
+ifneq ($(output),)
 # $(realpath ...) gets empty if the path does not exist. Run 'mkdir -p' first.
-$(shell mkdir -p "$(KBUILD_OUTPUT)")
+$(shell mkdir -p "$(output)")
 # $(realpath ...) resolves symlinks
-abs_output := $(realpath $(KBUILD_OUTPUT))
-$(if $(abs_output),,$(error failed to create output directory "$(KBUILD_OUTPUT)"))
-endif # ifneq ($(KBUILD_OUTPUT),)
+abs_output := $(realpath $(output))
+$(if $(abs_output),,$(error failed to create output directory "$(output)"))
+endif
 
 ifneq ($(words $(subst :, ,$(abs_srctree))), 1)
 $(error source directory cannot contain spaces or colons)
-- 
2.43.0


