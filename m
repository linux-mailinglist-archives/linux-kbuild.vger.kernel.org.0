Return-Path: <linux-kbuild+bounces-4606-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC4A9C3050
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 02:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5F921C206A2
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 01:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACF41487DD;
	Sun, 10 Nov 2024 01:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eIrvovJJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31259145B39;
	Sun, 10 Nov 2024 01:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731202623; cv=none; b=L5OljHYeTUNTuzgpkdkcC7IsDDV6ZCfA2jF6CIDNf2vB4FSZRav1hSvLBtPn7nWPGtDM9DLx9SyLC6Et+cepU0A+pwA4LMK1ImpFbgcbJoCm/Opfv9vAtG/gT8GDxsPyJh+Y8zWM8JuIsMY4cJUt+YTTL9epZnjJKgPUSX1y/7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731202623; c=relaxed/simple;
	bh=iCeqjzcVDDdoLZ9nZgMa6Iw5IDXnP0Lvgh2TSIu2WD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oarAkmiil9BiOnRjtqb6Ck602abssu+KjD4TiPLLlRcTf4+Zq8/MXOmryMUQwB+XcQ5ipqAXP2g0fRtaRw1QmLYQkJQ3BGwMn5il6sDwxLJCZAtkzsEBMqbt/dIRXw9VLDMhSNTirdd57S4qrEnkFUkFqjoiOw7mVNK3V57KgGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eIrvovJJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98BAEC4CED2;
	Sun, 10 Nov 2024 01:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731202622;
	bh=iCeqjzcVDDdoLZ9nZgMa6Iw5IDXnP0Lvgh2TSIu2WD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eIrvovJJ4eitOtZYlTjmKrd3/mINe+aHZaNaC9amwYwqn34fP4V9WsiBWhQytQCvd
	 TejFnusbblJS3ES9FDUk53jndG/8Ucdsh7GMP845PWwdG5THIUCEtUq58mlm62rn6q
	 Jksnm9XLgD0YyumgHtsq6+GHVUewVZVdulDOYNdBu7KfDevReKG7phUrBV04GG6WVh
	 qgntF0qk3pIQWr3E42vbYW4zXINh5jPdm9ltGHlcOdERvPEgfl9ELlayNmKZIC+YqE
	 csxr8hP420L+ElVWAKB0LlszcJ1Bhqfp1NmLwVfkawD8BHYO0cWPnSKNI/htgYVp4O
	 U4E1hut/47g1Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	cocci@inria.fr,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2 03/11] kbuild: rename abs_objtree to abs_output
Date: Sun, 10 Nov 2024 10:34:31 +0900
Message-ID: <20241110013649.34903-4-masahiroy@kernel.org>
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

'objtree' refers to the top of the output directory of kernel builds.

Rename abs_objtree to a more generic name, to better reflect its use in
the context of external module builds.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
---

(no changes since v1)

 Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 9b8f4f4cb01b..deb3f01863f8 100644
--- a/Makefile
+++ b/Makefile
@@ -40,7 +40,7 @@ __all:
 
 this-makefile := $(lastword $(MAKEFILE_LIST))
 abs_srctree := $(realpath $(dir $(this-makefile)))
-abs_objtree := $(CURDIR)
+abs_output := $(CURDIR)
 
 ifneq ($(sub_make_done),1)
 
@@ -185,8 +185,8 @@ ifneq ($(KBUILD_OUTPUT),)
 # $(realpath ...) gets empty if the path does not exist. Run 'mkdir -p' first.
 $(shell mkdir -p "$(KBUILD_OUTPUT)")
 # $(realpath ...) resolves symlinks
-abs_objtree := $(realpath $(KBUILD_OUTPUT))
-$(if $(abs_objtree),,$(error failed to create output directory "$(KBUILD_OUTPUT)"))
+abs_output := $(realpath $(KBUILD_OUTPUT))
+$(if $(abs_output),,$(error failed to create output directory "$(KBUILD_OUTPUT)"))
 endif # ifneq ($(KBUILD_OUTPUT),)
 
 ifneq ($(words $(subst :, ,$(abs_srctree))), 1)
@@ -197,7 +197,7 @@ export sub_make_done := 1
 
 endif # sub_make_done
 
-ifeq ($(abs_objtree),$(CURDIR))
+ifeq ($(abs_output),$(CURDIR))
 # Suppress "Entering directory ..." if we are at the final work directory.
 no-print-directory := --no-print-directory
 else
@@ -221,7 +221,7 @@ $(filter-out $(this-makefile), $(MAKECMDGOALS)) __all: __sub-make
 
 # Invoke a second make in the output directory, passing relevant variables
 __sub-make:
-	$(Q)$(MAKE) $(no-print-directory) -C $(abs_objtree) \
+	$(Q)$(MAKE) $(no-print-directory) -C $(abs_output) \
 	-f $(abs_srctree)/Makefile $(MAKECMDGOALS)
 
 else # need-sub-make
-- 
2.43.0


