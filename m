Return-Path: <linux-kbuild+bounces-10679-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6008D3A7E6
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 13:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B8A530380CC
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 12:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30250359719;
	Mon, 19 Jan 2026 12:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KoB9JclS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A48320CCD;
	Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824317; cv=none; b=NEq9yWvfoAk2JjgkRm2UH5gJ0d/xfsj6s065m4UG5UGQQF5dMkD4euWVlPVPP1aAWtPaw3c8PWx4hmodSeBRQOYw3bKeIVZDeDG5oAG7wsPYBkbOh0/VZhuxd2by2/2SP/FMT3XyoDAERb1qUBqS4JzZrDXXBwFNJ+e1ohDqHUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824317; c=relaxed/simple;
	bh=y5iZGxGixN2k9HnEvZMtqvRXtngWsH3N6Ec9onhRymc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jHnTZIjdVsaZPtSsvAxmL/CH5U/2S9RNn0UXTMTsnp7MFp7d54R2NzOVqyF3DNOuJSQYkhvl7EXCpRZ1UWTNGqjAqPH33iCvY4wwdFCQO1ebVHo+4MI3Ajypm5UZo11F/oSqUHFsch+cdO9D39kWEGSfEtZAqqn9f+QupoFt3vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KoB9JclS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8407C4AF0C;
	Mon, 19 Jan 2026 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768824316;
	bh=y5iZGxGixN2k9HnEvZMtqvRXtngWsH3N6Ec9onhRymc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KoB9JclSl2SERqOuHQPj5OWv2vJ0D2IgpAiiq76po1yxaLjUg6ccWM88joknbGGrO
	 rkzWB0HdiAIbhFww4fZVwi4fiGze4qT2dfHkbQBB4nDpTcBTJlPwvr+QjL5rSKy+4a
	 oAedl2z6+YasaC8XBDqtHeaMt8mfmebhM60valfqIDTTSm+1xXyQn9GT/Tj1ruNMnl
	 80+BAU9G3Evl/l5woyEEP2gVGv5CGUdCHiXNS+CvvJHDa5Y6jR9k2PjHDtoHv0p9ro
	 sFAuNwh1GhM9zgg1Y8rVA/35EKKeDcyK9KYSUdd/Lw0PDVURzyvdRpfMUBJa5KPQu1
	 rH9SM3aIkAi7w==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vho0Q-00000001ZjQ-3epy;
	Mon, 19 Jan 2026 13:05:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 5/9] docs: kdoc: remove support for an external kernel-doc from sphinx
Date: Mon, 19 Jan 2026 13:05:00 +0100
Message-ID: <a97a8361546648906344457a7e92e4db533048a9.1768823489.git.mchehab+huawei@kernel.org>
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

From: Jonathan Corbet <corbet@lwn.net>

The ability to build the docs with an external kernel-doc program involves
some truly confusing logic and complicates the task of moving kernel-doc
out of scripts/.  But this feature is not useful for normal documentation
builds, and the external kernel-doc can always be run by hand when it needs
debugging.  So just remove that feature and make life easier.

There is still a bunch of logic to build a command line that we never use;
the idea is to be able to output it, but I'm not sure if that is worth
keeping.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kerneldoc.py | 53 ++++---------------------------
 1 file changed, 6 insertions(+), 47 deletions(-)

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index d8cdf068ef35..afbab458550a 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -190,35 +190,7 @@ class KernelDocDirective(Directive):
 
         return cmd
 
-    def run_cmd(self, cmd):
-        """
-        Execute an external kernel-doc command.
-        """
-
-        env = self.state.document.settings.env
-        node = nodes.section()
-
-        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
-        out, err = p.communicate()
-
-        out, err = codecs.decode(out, 'utf-8'), codecs.decode(err, 'utf-8')
-
-        if p.returncode != 0:
-            sys.stderr.write(err)
-
-            logger.warning("kernel-doc '%s' failed with return code %d"
-                                % (" ".join(cmd), p.returncode))
-            return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
-        elif env.config.kerneldoc_verbosity > 0:
-            sys.stderr.write(err)
-
-        filenames = self.parse_args["file_list"]
-        for filename in filenames:
-            self.parse_msg(filename, node, out, cmd)
-
-        return node.children
-
-    def parse_msg(self, filename, node, out, cmd):
+    def parse_msg(self, filename, node, out):
         """
         Handles a kernel-doc output for a given file
         """
@@ -244,7 +216,7 @@ class KernelDocDirective(Directive):
 
         self.do_parse(result, node)
 
-    def run_kdoc(self, cmd, kfiles):
+    def run_kdoc(self, kfiles):
         """
         Execute kernel-doc classes directly instead of running as a separate
         command.
@@ -258,23 +230,17 @@ class KernelDocDirective(Directive):
         filenames = self.parse_args["file_list"]
 
         for filename, out in kfiles.msg(**self.msg_args, filenames=filenames):
-            self.parse_msg(filename, node, out, cmd)
+            self.parse_msg(filename, node, out)
 
         return node.children
 
     def run(self):
-        global kfiles
-
         cmd = self.handle_args()
         if self.verbose >= 1:
             logger.info(cmd_str(cmd))
 
         try:
-            if kfiles:
-                return self.run_kdoc(cmd, kfiles)
-            else:
-                return self.run_cmd(cmd)
-
+            return self.run_kdoc(kfiles)
         except Exception as e:  # pylint: disable=W0703
             logger.warning("kernel-doc '%s' processing failed with: %s" %
                            (cmd_str(cmd), pformat(e)))
@@ -286,15 +252,8 @@ class KernelDocDirective(Directive):
 
 def setup_kfiles(app):
     global kfiles
-
-    kerneldoc_bin = app.env.config.kerneldoc_bin
-
-    if kerneldoc_bin and kerneldoc_bin.endswith("kernel-doc.py"):
-        print("Using Python kernel-doc")
-        out_style = RestFormat()
-        kfiles = KernelFiles(out_style=out_style, logger=logger)
-    else:
-        print(f"Using {kerneldoc_bin}")
+    out_style = RestFormat()
+    kfiles = KernelFiles(out_style=out_style, logger=logger)
 
 
 def setup(app):
-- 
2.52.0


