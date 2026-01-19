Return-Path: <linux-kbuild+bounces-10682-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D0ED3A7F1
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 13:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BD1A3059EB4
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 12:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53136359F9D;
	Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WvOuF7hD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1E93596F9;
	Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824317; cv=none; b=Qehp/dWomLy522eFHpFJGLz3YEawfjRt/3PmrmMF+CSJN99evaQqXwWAL5TFoDAajVDIM9y8cud6cXVhdLt82FSQfRhcohq8nnLjSywMq+gT1ZGAWZgeQNkM3S+OfpW8fI5CgLQqhs6H7zNQB8+YSCsmsygCc5ViJbIn14VyyGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824317; c=relaxed/simple;
	bh=6HyC5gF4ScinHY1gGeYNGGYvsoRZQIoC1BWSJQdTkY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lb6cwegxGrTTUKPQJUJjwMVcFGi1K/nJFVu5D/EmTURwql0q/M20voBKV1Ez331+rjiiKrF16KTwv0SRpgfXhGNCz5ppCs2cb7Ki4vTLGEleUwPstNN0iUFMHpUursofrQRvaYkxcUwXvH9IYnGs96GK1kqtd0iZMUS7Tld4bP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WvOuF7hD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4FDFC2BC9E;
	Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768824316;
	bh=6HyC5gF4ScinHY1gGeYNGGYvsoRZQIoC1BWSJQdTkY4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WvOuF7hDdCBaQHihY9OW2YC1MzFJB74MOokdSvhwGI85VRZ6Ev5ixzSbIBVoGZb0/
	 AmbHlcUNZ2uPeFv1VnM9Qa7+zTcxklTBwakBGzeGuORRTwf/v0c317Hhqo3pHRQvA8
	 xN0ekp0C1rZw+mLt2vegSQ6so20BWtxxGtdy+loRJ5Q8MNLVrGGWAYazLjJon10GlF
	 g9EbikW4yrmdSyIR3ntYNzXo9x6GcoTddi06ePHkoshuq6hlkf1qMgLFNTit1g9/Rc
	 7z/wVoOni+N0u5k5pdd+YSlwDfNSmUkHEuPrq6WVsUrAwa34hFYy2oxu1hnL2sshDG
	 vxQE1+IuvzqjQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vho0Q-00000001Zjj-48cY;
	Mon, 19 Jan 2026 13:05:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 9/9] docs: conf.py: get rid of the now unused kerneldoc_bin env var
Date: Mon, 19 Jan 2026 13:05:04 +0100
Message-ID: <c0fa9f561c1dd4370f9096de4195a9214763c51c.1768823489.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768823489.git.mchehab+huawei@kernel.org>
References: <cover.1768823489.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

In the past, this contained the location of the binary file to parse
kernel-doc. Nowadays, it is used only for debugging purposes, inside
kerneldoc.py extension.

Move it to sphinx/kerneldoc.py, to avoid needing to handle with it
on several places.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/conf.py             | 4 ----
 Documentation/sphinx/kerneldoc.py | 7 +++++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 383d5e5b9d0a..65df81a9e414 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -579,10 +579,6 @@ pdf_documents = [
     ("kernel-documentation", "Kernel", "Kernel", "J. Random Bozo"),
 ]
 
-# kernel-doc extension configuration for running Sphinx directly (e.g. by Read
-# the Docs). In a normal build, these are supplied from the Makefile via command
-# line arguments.
-kerneldoc_bin = "../tools/docs/kernel-doc"  # Not used now
 kerneldoc_srctree = ".."
 
 def setup(app):
diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index afbab458550a..c1cadb4eb099 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -47,6 +47,10 @@ sys.path.insert(0, os.path.join(srctree, "tools/lib/python"))
 from kdoc.kdoc_files import KernelFiles
 from kdoc.kdoc_output import RestFormat
 
+# Used when verbose is active to show how to reproduce kernel-doc
+# issues via command line
+kerneldoc_bin = "tools/docs/kernel-doc"
+
 __version__  = '1.0'
 kfiles = None
 logger = logging.getLogger(__name__)
@@ -95,7 +99,7 @@ class KernelDocDirective(Directive):
     def handle_args(self):
 
         env = self.state.document.settings.env
-        cmd = [env.config.kerneldoc_bin, '-rst', '-enable-lineno']
+        cmd = [kerneldoc_bin, '-rst', '-enable-lineno']
 
         filename = env.config.kerneldoc_srctree + '/' + self.arguments[0]
 
@@ -257,7 +261,6 @@ def setup_kfiles(app):
 
 
 def setup(app):
-    app.add_config_value('kerneldoc_bin', None, 'env')
     app.add_config_value('kerneldoc_srctree', None, 'env')
     app.add_config_value('kerneldoc_verbosity', 1, 'env')
 
-- 
2.52.0


