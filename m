Return-Path: <linux-kbuild+bounces-7178-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1B1ABDF50
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 17:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78AAF1885E13
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 15:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5BB2571D7;
	Tue, 20 May 2025 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tDMTw39n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC9124BC14;
	Tue, 20 May 2025 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747755642; cv=none; b=iJlKkUSCsInpVpEMO/E04MZw8SzsYAmZCFR9xQR6x+v+Ku+4EHf51CRweIW/crefO3GkFMdV4yGbGeGMjpNHEF2pDS2l1jEPh9F3A26rNRcDVB1FQaprVNk6vmkwQlMnL1Q1FIB3I+8YKuI+Us6fXppySIg3JUB2yYI21M6wNY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747755642; c=relaxed/simple;
	bh=cjlil9G8JByys0gJ+2GwXu4Q4GO7unka4kGteTA7xdc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G8EeezTv9l2ecIKnm1ZiYCwrWp/A/GzHf906OJbI1VYVP1FYQftMe4RqAQfk43Y3HYuQc2ozSTNc7HVEDGEG5bYYj7ku1EXBbT4ipU3Hh+uFRhMxs+RG2upDOePgUNMKSUOgRuQqwyuKOvrLPVTGh5GWYdSK6xUdDehfkWZUus0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tDMTw39n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80BA5C4CEE9;
	Tue, 20 May 2025 15:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747755642;
	bh=cjlil9G8JByys0gJ+2GwXu4Q4GO7unka4kGteTA7xdc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tDMTw39nrPOPNILCsmUbXg9K+21z/s0dt+uExMsXy6Zm33Cf33SpFolaLr0qtexZR
	 NGS5ll/ioml+RM8PIRCDaskg1GDcqibmUB/d19XPRfwnN18WDssc7Qy8KEBuKQWNME
	 cjYdj4ZP9wr8YN+gUhhlVOuydFVCTJ/L4UbkdW/zV/RRc8/7kjv58U2jy5GxC2P+U0
	 eql6zkdQVbGVjljI7JV+zzLLDaIdwHUNEOtaJ+ci3MPkOu9nwXc94lhpp+3ePEsINp
	 MNIyvJkQUyn8U13BXejspOLv1Mta1+/5JeU1c2igSLpRMn0wJUt64c+F6YTkDPvqte
	 AdUdh8oYhg7Rw==
Date: Tue, 20 May 2025 17:40:35 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Akira Yokosawa <akiyks@gmail.com>,
 Nicolas Schier <nicolas.schier@linux.dev>, Randy Dunlap
 <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kees Cook
 <kees@kernel.org>, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] docs: kerneldoc.py: add try/except blocks for
 kernel-doc class errors
Message-ID: <20250520174035.5f193ec3@sal.lan>
In-Reply-To: <20250520165024.7447a107@sal.lan>
References: <cover.1747747695.git.mchehab+huawei@kernel.org>
	<064bac2f462c13f56154891d8f3fb788db94f325.1747747695.git.mchehab+huawei@kernel.org>
	<aCyQIwBnSiPLPrDo@smile.fi.intel.com>
	<20250520165024.7447a107@sal.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 20 May 2025 16:50:24 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Tue, 20 May 2025 17:22:27 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:
> 
> > On Tue, May 20, 2025 at 03:33:08PM +0200, Mauro Carvalho Chehab wrote:
> > > Replicate the same behavior as what's done with kernel-doc.pl:
> > > continue building docs even when there are exceptions.  
> > 
> > ...
> > 
> > > +            logger.warning("kernel-doc '%s' processing failed with: %s" %
> > > +                           (cmd_str(cmd), str(e)))  
> > 
> > > +                logger.warning("kernel-doc '%s' processing failed with: %s" %
> > > +                               (cmd_str(cmd), str(e)))  
> > 
> > The prefix of the message is the same for different (semantically) places.
> > Is it okay? (I would expect them to slightly differ, but I dunno if
> > cmd here is the same, perhaps that's enough for distinguishing the two.)
> 
> I guess it should be OK, as the "%s" variables are the ones that will
> actually help to provide a hint about the issue. See, in practice, if
> one wants to check what crashed, the procedure would likely be to run 
> the command line, given by "cmd_str(cmd)" and see what output was produced.

On a second thought, the try/except logic there is too complex. We
need just one to cover all cases. Also, "str(e)" is not the best,
as it doesn't really show the error. "pformat(e)" works a lot better:

	$ make htmldocs
	Using alabaster theme
	Using Python kernel-doc
	Cannot find file ./drivers/gpio/gpiolib-acpi.c
	Cannot find file ./drivers/gpio/gpiolib-acpi.c
	WARNING: kernel-doc './scripts/kernel-doc.py -rst -enable-lineno -export ./drivers/gpio/gpiolib-acpi.c' processing failed with: KeyError('./drivers/gpio/gpiolib-acpi.c')
	Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any toctree

See enclosed patch (to be applied after this series).

Regards,
Mauro

---

[PATCH] docs: kerneldoc.py: simplify exception handling logic

Instead of having try/except everywhere, place them on a common
place.

While here, get rid of some bogus logs.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index 833cb0285afc..3f9754b84566 100644
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
@@ -190,46 +191,35 @@ class KernelDocDirective(Directive):
 
         return cmd
 
-    def run_cmd(self):
+    def run_cmd(self, cmd):
         """
         Execute an external kernel-doc command.
         """
 
         env = self.state.document.settings.env
-        cmd = self.handle_args()
 
         if self.verbose >= 1:
-            print(cmd_str(cmd))
+            logger.info(cmd_str(cmd))
 
         node = nodes.section()
 
-        try:
-            logger.verbose("calling kernel-doc '%s'" % (" ".join(cmd)))
-
-            p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
-            out, err = p.communicate()
-
-            out, err = codecs.decode(out, 'utf-8'), codecs.decode(err, 'utf-8')
+        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+        out, err = p.communicate()
 
-            if p.returncode != 0:
-                sys.stderr.write(err)
+        out, err = codecs.decode(out, 'utf-8'), codecs.decode(err, 'utf-8')
 
-                logger.warning("kernel-doc '%s' failed with return code %d"
-                                    % (" ".join(cmd), p.returncode))
-                return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
-            elif env.config.kerneldoc_verbosity > 0:
-                sys.stderr.write(err)
+        if p.returncode != 0:
+            sys.stderr.write(err)
 
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
 
@@ -240,71 +230,62 @@ class KernelDocDirective(Directive):
 
         env = self.state.document.settings.env
 
-        try:
-            lines = statemachine.string2lines(out, self.tab_width,
-                                              convert_whitespace=True)
-            result = ViewList()
-
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
-
-            self.do_parse(result, node)
-
-        except Exception as e:  # pylint: disable=W0703
-            logger.warning("kernel-doc '%s' processing failed with: %s" %
-                                (cmd_str(cmd), str(e)))
-            return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
+        lines = statemachine.string2lines(out, self.tab_width,
+                                            convert_whitespace=True)
+        result = ViewList()
+
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
 
-        return None
+        self.do_parse(result, node)
 
-    def run_kdoc(self, kfiles):
+    def run_kdoc(self, cmd, kfiles):
         """
         Execute kernel-doc classes directly instead of running as a separate
         command.
         """
 
-        cmd = self.handle_args()
         env = self.state.document.settings.env
 
         node = nodes.section()
 
-        try:
-            kfiles.parse(**self.parse_args)
-            filenames = self.parse_args["file_list"]
-
-            msgs = kfiles.msg(**self.msg_args, filenames=filenames)
-            for filename, out in msgs:
-                if self.verbose >= 1:
-                    print(cmd_str(cmd))
+        kfiles.parse(**self.parse_args)
+        filenames = self.parse_args["file_list"]
 
-                ret = self.parse_msg(filename, node, out, cmd)
-                if ret:
-                    return ret
+        msgs = kfiles.msg(**self.msg_args, filenames=filenames)
+        for filename, out in msgs:
+            if self.verbose >= 1:
+                print(cmd_str(cmd))
 
-        except Exception as e:  # pylint: disable=W0703
-            logger.warning("kernel-doc '%s' processing failed with: %s" %
-                            (cmd_str(cmd), str(e)))
-            return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
+            self.parse_msg(filename, node, out, cmd)
 
         return node.children
 
     def run(self):
         global kfiles
 
-        if kfiles:
-            return self.run_kdoc(kfiles)
-        else:
-            return self.run_cmd()
+        cmd = self.handle_args()
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


