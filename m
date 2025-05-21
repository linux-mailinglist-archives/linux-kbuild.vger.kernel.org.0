Return-Path: <linux-kbuild+bounces-7191-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B53ABEC92
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 08:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABB433B9684
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 06:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FAA72343BE;
	Wed, 21 May 2025 06:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRw0jEyi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F9623372E;
	Wed, 21 May 2025 06:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747810786; cv=none; b=AQpzb6M41d2m/FlDb+NMnXXeIDDCoBHpGqDpbYZWusxaclVE6KScLCj+q6bRN59q5Vx/Okxs4iA8WdFVrnf1nXN1hUnHYh1/wxBVrYbr75bk3lVpMQvrYbUfTH4fq3yKoPArN1uiRzihdHWgiAn8n+39O4sOIxLzxpNwgsCUuUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747810786; c=relaxed/simple;
	bh=QmqgEQ8bcs2MU/3P3b2x9mP+Nq70CbfNSXA3jCaK9lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YcqI2TszoxOL4tSpQIV3Z1oqxK8TXJzveia0PrZ1lg4FE9J3R3M7/xqai+CphPjLnNb95DpoR5DuHt2NvbNFamKLfS43jpqxguG95FHhB/sqHeLNacDYSdC5fP93eFJhGzCQxU/sWH06homb7bzTF11y/+2kLZInjfQzzIgWVpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRw0jEyi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A212C4AF09;
	Wed, 21 May 2025 06:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747810785;
	bh=QmqgEQ8bcs2MU/3P3b2x9mP+Nq70CbfNSXA3jCaK9lo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GRw0jEyi/eITQSjF4y089HbrrSDUYJhZ/6lCr78qfPf06LqiWesdMMQzjJ3KGeO0X
	 YrDiBZ3DnkR3DYt/u19mUdvZFL/hZ69arx+UvbR9vTk+Q+bZu9nScCzfpGsrcP2BMv
	 GGYEhhcQW4vDv6k90z43a9FC+7xvT+PlH7y4lryIOIio3eAVTCgWosuLl7LilJ6r9l
	 S5kWvkI63qySLDqGlQa8vQMaRHd7m9SdQTQZqD6kUzBTjV75gthrRRq6/f0ahHEVDx
	 G/6aa3rwuwifQblU2w3otPKnFN/Hf/IJ+VkH5LcMobFFG9bQzPimRjROklj4HhczEm
	 gBQSgE/wpwe5A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHdQV-00000006IG2-36Di;
	Wed, 21 May 2025 08:59:43 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	"Masahiro Yamada" <mchehab+huawei@kernel.org>,
	"Nathan Chancellor" <mchehab+huawei@kernel.org>,
	"Nicolas Schier" <nicolas.schier@linux.dev>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	"Stephen Rothwell" <sfr@canb.auug.org.au>,
	Kees Cook <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] docs: kerneldoc.py: simplify exception handling logic
Date: Wed, 21 May 2025 08:59:32 +0200
Message-ID: <e93e6459a76c10ddf22181ae1cfc19731d6b93ea.1747810691.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747810691.git.mchehab+huawei@kernel.org>
References: <cover.1747810691.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Get rid of logger.verbose() which is causing the logger to not
work.

Also, instead of having try/except everywhere, place them on a
common place.

While here, get rid of some bogus logs.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kerneldoc.py | 108 +++++++++++++-----------------
 1 file changed, 45 insertions(+), 63 deletions(-)

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index b713a2c4a615..b818d4c77924 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -40,6 +40,7 @@ from docutils.parsers.rst import directives, Directive
 import sphinx
 from sphinx.util.docutils import switch_source_input
 from sphinx.util import logging
+from pprint import pformat
 
 srctree = os.path.abspath(os.environ["srctree"])
 sys.path.insert(0, os.path.join(srctree, "scripts/lib/kdoc"))
@@ -49,7 +50,7 @@ from kdoc_output import RestFormat
 
 __version__  = '1.0'
 kfiles = None
-logger = logging.getLogger('kerneldoc')
+logger = logging.getLogger(__name__)
 
 def cmd_str(cmd):
     """
@@ -190,46 +191,31 @@ class KernelDocDirective(Directive):
 
         return cmd
 
-    def run_cmd(self):
+    def run_cmd(self, cmd):
         """
         Execute an external kernel-doc command.
         """
 
         env = self.state.document.settings.env
-        cmd = self.handle_args()
-
-        if self.verbose >= 1:
-            print(cmd_str(cmd))
-
         node = nodes.section()
 
-        try:
-            logger.verbose("calling kernel-doc '%s'" % (" ".join(cmd)))
+        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+        out, err = p.communicate()
 
-            p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
-            out, err = p.communicate()
+        out, err = codecs.decode(out, 'utf-8'), codecs.decode(err, 'utf-8')
 
-            out, err = codecs.decode(out, 'utf-8'), codecs.decode(err, 'utf-8')
+        if p.returncode != 0:
+            sys.stderr.write(err)
 
-            if p.returncode != 0:
-                sys.stderr.write(err)
-
-                logger.warning("kernel-doc '%s' failed with return code %d"
-                                    % (" ".join(cmd), p.returncode))
-                return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
-            elif env.config.kerneldoc_verbosity > 0:
-                sys.stderr.write(err)
-
-        except Exception as e:  # pylint: disable=W0703
-            logger.warning("kernel-doc '%s' processing failed with: %s" %
-                                (" ".join(cmd), str(e)))
+            logger.warning("kernel-doc '%s' failed with return code %d"
+                                % (" ".join(cmd), p.returncode))
             return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
+        elif env.config.kerneldoc_verbosity > 0:
+            sys.stderr.write(err)
 
         filenames = self.parse_args["file_list"]
         for filename in filenames:
-            ret = self.parse_msg(filename, node, out, cmd)
-            if ret:
-                return ret
+            self.parse_msg(filename, node, out, cmd)
 
         return node.children
 
@@ -240,40 +226,31 @@ class KernelDocDirective(Directive):
 
         env = self.state.document.settings.env
 
-        try:
-            lines = statemachine.string2lines(out, self.tab_width,
-                                              convert_whitespace=True)
-            result = ViewList()
+        lines = statemachine.string2lines(out, self.tab_width,
+                                            convert_whitespace=True)
+        result = ViewList()
 
-            lineoffset = 0;
-            line_regex = re.compile(r"^\.\. LINENO ([0-9]+)$")
-            for line in lines:
-                match = line_regex.search(line)
-                if match:
-                    # sphinx counts lines from 0
-                    lineoffset = int(match.group(1)) - 1
-                    # we must eat our comments since the upset the markup
-                else:
-                    doc = str(env.srcdir) + "/" + env.docname + ":" + str(self.lineno)
-                    result.append(line, doc + ": " + filename, lineoffset)
-                    lineoffset += 1
+        lineoffset = 0;
+        line_regex = re.compile(r"^\.\. LINENO ([0-9]+)$")
+        for line in lines:
+            match = line_regex.search(line)
+            if match:
+                # sphinx counts lines from 0
+                lineoffset = int(match.group(1)) - 1
+                # we must eat our comments since the upset the markup
+            else:
+                doc = str(env.srcdir) + "/" + env.docname + ":" + str(self.lineno)
+                result.append(line, doc + ": " + filename, lineoffset)
+                lineoffset += 1
 
-            self.do_parse(result, node)
+        self.do_parse(result, node)
 
-        except Exception as e:  # pylint: disable=W0703
-            logger.warning("kernel-doc '%s' processing failed with: %s" %
-                                (cmd_str(cmd), str(e)))
-            return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
-
-        return None
-
-    def run_kdoc(self, kfiles):
+    def run_kdoc(self, cmd, kfiles):
         """
         Execute kernel-doc classes directly instead of running as a separate
         command.
         """
 
-        cmd = self.handle_args()
         env = self.state.document.settings.env
 
         node = nodes.section()
@@ -282,22 +259,27 @@ class KernelDocDirective(Directive):
         filenames = self.parse_args["file_list"]
 
         for filename, out in kfiles.msg(**self.msg_args, filenames=filenames):
-            if self.verbose >= 1:
-                print(cmd_str(cmd))
-
-            ret = self.parse_msg(filename, node, out, cmd)
-            if ret:
-                return ret
+            self.parse_msg(filename, node, out, cmd)
 
         return node.children
 
     def run(self):
         global kfiles
 
-        if kfiles:
-            return self.run_kdoc(kfiles)
-        else:
-            return self.run_cmd()
+        cmd = self.handle_args()
+        if self.verbose >= 1:
+            logger.info(cmd_str(cmd))
+
+        try:
+            if kfiles:
+                return self.run_kdoc(cmd, kfiles)
+            else:
+                return self.run_cmd(cmd)
+
+        except Exception as e:  # pylint: disable=W0703
+            logger.warning("kernel-doc '%s' processing failed with: %s" %
+                           (cmd_str(cmd), pformat(e)))
+            return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
 
     def do_parse(self, result, node):
         with switch_source_input(self.state, result):
-- 
2.49.0


