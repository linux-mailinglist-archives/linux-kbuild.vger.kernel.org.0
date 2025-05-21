Return-Path: <linux-kbuild+bounces-7199-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C31ABEEFA
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 11:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EA637A6C5A
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 09:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8774D23958C;
	Wed, 21 May 2025 09:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPDlodbS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579AA238C0A;
	Wed, 21 May 2025 09:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818143; cv=none; b=VdPDJmMma2hKMJfAzpXjpNq+oZamsgZM5ATNreCnfuPdri3K1Z0xoaWH8dEE8jqaDjzQngJNObj8MEssndGRFoiJh8P/44fa2SBYPqb11/FgIHa4yUEKcWy9i2gmYcB9zab4J9LbppJ9N/utmVhpVXgycwFQb3xbuKO7J+F2EQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818143; c=relaxed/simple;
	bh=xdsIM/oX21o5e6WrNYvFNDZLSWw4Vwh1GOQuXz3gT5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=McKiW2bihsMFB04T7qtFX15mEKnKHwpze0qtwBykh8GZLJ08URNmHvf1ZU2Q1eY+pw+gflOPdB/3jmBv99BUoRrYDSqBPnaR9GfUZEJJfLmHXFbfaQXcD2kPzP5u4jxjgWdSXdyC/DDvbIJ1hHKbyrxNMTDXvnrl01CiDfObC+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPDlodbS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B744BC4CEED;
	Wed, 21 May 2025 09:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747818142;
	bh=xdsIM/oX21o5e6WrNYvFNDZLSWw4Vwh1GOQuXz3gT5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TPDlodbSxJmIaLx4y6M0Tdi4qR/UUjtsliRkx19kqOyVyhiMwt1Ilj0uwbXWz4Mg0
	 45+J5tyr6V761xJJxJFjuxahYZmqKwvkzOXw95M0tsrpxVvou3ytrf1WOLQ7ysy3T3
	 gl6XYuGSrcqZzLPkuBe4qkkKc9cRu61NG8B9UnQ/i12x0k5rCP+sFs3yhbjqXH/IkQ
	 NSAZD4SjADX9nIJtfbS/yIWmqHBCxyDtgQ0cBaC97GA93ZyLe8X42H3rJu2xOEhAaM
	 eU1bgzYREmZiAPh6orGGvci3wmK5jfUsHnGdWZU6jrNEkMoDSb83rMQooQVRmKTOko
	 UTRrJ1Zr3lBDQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHfLA-00000006L9e-3dnY;
	Wed, 21 May 2025 11:02:20 +0200
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
Subject: [PATCH v3 2/3] docs: kerneldoc.py: simplify exception handling logic
Date: Wed, 21 May 2025 11:02:14 +0200
Message-ID: <a2cc32d5d519ed343158a915c39e8dc536a8ddb7.1747817887.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747817887.git.mchehab+huawei@kernel.org>
References: <cover.1747817887.git.mchehab+huawei@kernel.org>
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
Acked-by: Akira Yokosawa <akiyks@gmail.com>
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


