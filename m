Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12F7967681
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jul 2019 00:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbfGLW1Q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Jul 2019 18:27:16 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51968 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727245AbfGLW1Q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jul 2019 18:27:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=VM9qpAs/ICtRYE/ZKsbasB/7+epYpXQ7+ZIhOINoByw=; b=DDBNzD6VGixx85DQB7GNNTwUG
        TgheVxDJciYE2Cw6b0dnj+nuPh8uJ+yOD0d92QK6C3Vlc68vY7sfziXp/iHi0Fw3NhuCeB8xVLO5E
        0c5OJlqZiR+snFsxI80l1yDkTv0awzdROQNDrLtvKu7PLxawZ2E1pbSuUnM6gueAXOIGLeBjP7R1p
        Vrbdgvx9ImdNLiC4AGZ56unjhBZ+uthWlUj5OSgC4gZlWR4IfCOtqxITmLFMlgowLt1saZu9bkb/H
        eyLbLI1yCaIfG1/VWUtMeVzik4TD+JRYVxpk0gj0d2ba56Z4dvkMKx+iO8KEDIYKYR3m+3hPfJlRc
        pd6C7TlPA==;
Received: from [186.213.242.57] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hm40U-0004ss-Gc; Fri, 12 Jul 2019 22:27:10 +0000
Date:   Fri, 12 Jul 2019 19:27:05 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Heiko Carstens <heiko.carstens@de.ibm.com>,
        Hannes Reinecke <hare@suse.com>, linux-kbuild@vger.kernel.org,
        Jens Axboe <axboe@kernel.dk>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
        linux-doc@vger.kernel.org, Omar Sandoval <osandov@fb.com>
Subject: Re: [PATCH 0/5] PDF output fixes
Message-ID: <20190712192705.71b97717@coco.lan>
In-Reply-To: <20190712141921.7f8a1d02@lwn.net>
References: <cover.1562696797.git.mchehab+samsung@kernel.org>
        <20190712141921.7f8a1d02@lwn.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Em Fri, 12 Jul 2019 14:19:21 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Tue,  9 Jul 2019 15:33:18 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> 
> > In order to be able to build all PDF books, besides the two patches I
> > already sent:
> > 
> >     docs: pdf: add all Documentation/*/index.rst to PDF output
> >     docs: automarkup.py: ignore exceptions when seeking for xrefs
> > 
> > A few others are needed:
> > 
> > - patch 1 removes nested tables for a few files I converted, as 
> >   Sphinx LaTeX builder doesn't support it;
> > - Patches 2 to 4 addresses some minor issues on some books,
> >   usually requiring some blank lines, extra whitespaces or some
> >   tag replacement;
> > - Patch 5 is required in order to be able to build the translations
> >   PDF book, as it adds Asian fonts support to XeLaTeX.  
> 
> So, modulo my one comment on the last patch the series seems OK, though I
> don't like having to work around limitations in PDF generation this way.

Yeah, I feel the pain. I didn't like writing those patches either.

> Can't you just make rst2pdf work instead? :)

Well, we can try. Last time we tried, there were lots of things missing
for it to work. 

Based on:

	https://pypi.org/project/rst2pdf/

The project got stuck back on Dec, 2012, up to the beginning of this
year. Maybe the issues we had in the past got fixed.

Also, right now, rst2pdf only supports Python 2.7.

I would wait for it to support Python 3.x before doing the actual
migration.

-

I don't remember the exact details, but when rst2pdf were
used with some documents, it didn't produce a valid PDF file, but perhaps
someone fixed it.

Assuming that rst2pdf works now, there are still several LaTeX specific
hacks on some files:

	$ git grep -l latex|grep rst|wc -l
	     28  

I guess almost all of them are related to the lack of proper support
at ReST markup language that would allow adjusting the output to fit
within the page limits. 

On media, we need two types of additional features:

1) Sphinx pdf builder uses two different LaTeX ways of producing a table.
(tabular x tabularx x longtable - don't remember anymore the exact
two dialects it uses).

One of the dialect allows a table to be on multiple pages; the other
one doesn't. The builder decides the dialect if a table has more than 30
columns, but there's a way to force longtable (by changing the css style).

Not sure if rst2pdf honors the same css style.

2) Table scaling / font resize. The Sphinx PDF builder doesn't scale
the fonts inside a table, nor the ReST dialect allows changing the font
size. So, we had to use raw LaTeX dialects for it to work.

Anyway, I'm enclosing an experimental patch that would enable rst2pdf.
It is not at production level.

It also shows some crashes like this one:

[ERROR] pdfbuilder.py:133 format not resolved, probably missing URL scheme or undefined destination target for 'Callback%20Registry'
Traceback (most recent call last):
  File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/rst2pdf/pdfbuilder.py", line 130, in write
    docwriter.write(doctree, destination)
  File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/docutils/writers/__init__.py", line 80, in write
    self.translate()
  File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/rst2pdf/pdfbuilder.py", line 633, in translate
    compressed=self.compressed)
  File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/rst2pdf/createpdf.py", line 664, in createPdf
    pdfdoc.multiBuild(elements)
  File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/reportlab/platypus/doctemplate.py", line 1154, in multiBuild
    self.canv.save()
  File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/reportlab/pdfgen/canvas.py", line 1242, in save
    self._doc.SaveToFile(self._filename, self)
  File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/reportlab/pdfbase/pdfdoc.py", line 215, in SaveToFile
    data = self.GetPDFData(canvas)
  File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/reportlab/pdfbase/pdfdoc.py", line 241, in GetPDFData
    return self.format()
  File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/reportlab/pdfbase/pdfdoc.py", line 423, in format
    IOf = IO.format(self)
  File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/reportlab/pdfbase/pdfdoc.py", line 871, in format
    fcontent = format(self.content, document, toplevel=1)   # yes this is at top level
  File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/reportlab/pdfbase/pdfdoc.py", line 80, in format
    f = element.format(document)
  File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/reportlab/pdfbase/pdfdoc.py", line 1608, in format
    return D.format(document)
  File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/reportlab/pdfbase/pdfdoc.py", line 679, in format
    L = [(format(PDFName(k),document)+b" "+format(dict[k],document)) for k in keys]
  File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/reportlab/pdfbase/pdfdoc.py", line 80, in format
    f = element.format(document)
  File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/reportlab/pdfbase/pdfdoc.py", line 1773, in format
    if f is None: raise ValueError("format not resolved, probably missing URL scheme or undefined destination target for '%s'" % self.name)
ValueError: format not resolved, probably missing URL scheme or undefined destination target for 'Callback%20Registry'
FAILED


> 
> I guess it makes sense for these to go with the big band-aid-removal patch
> set.

OK, I'll send it together with the big patchset.

> 
> Thanks,
> 
> jon
> 
> P.S. it seems that rst2pdf is actually being developed again:
> https://akrabat.com/rst2pdf-back-from-the-dead/ .  I wonder how far
> they'll get with it.

Thanks,
Mauro

[PATCH RFC] docs: experimental: build PDF with rst2pdf

Change the logic to use rst2pdf instead of LaTeX.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

diff --git a/Documentation/Makefile b/Documentation/Makefile
index e145e4db508b..cc913f96a66d 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -95,9 +95,10 @@ pdfdocs:
 
 else # HAVE_PDFLATEX
 
-pdfdocs: latexdocs
+pdfdocs:
 	@$(srctree)/scripts/sphinx-pre-install --version-check
-	$(foreach var,$(SPHINXDIRS), $(MAKE) PDFLATEX="$(PDFLATEX)" LATEXOPTS="$(LATEXOPTS)" -C $(BUILDDIR)/$(var)/latex || exit;)
+	mkdir -p $(BUILDDIR)/pdf
+	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,pdf,$(var),pdf,$(var)))
 
 endif # HAVE_PDFLATEX
 
diff --git a/Documentation/conf.py b/Documentation/conf.py
index fa0a42b47e62..4db8a62d7c6a 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -35,13 +35,14 @@ needs_sphinx = '1.3'
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
 # ones.
 extensions = ['kerneldoc', 'rstFlatTable', 'kernel_include', 'cdomain',
-              'kfigure', 'sphinx.ext.ifconfig', 'automarkup']
+              'kfigure', 'sphinx.ext.ifconfig', 'automarkup', 'rst2pdf.pdfbuilder']
 
-# The name of the math extension changed on Sphinx 1.4
-if (major == 1 and minor > 3) or (major > 1):
-    extensions.append("sphinx.ext.imgmath")
-else:
-    extensions.append("sphinx.ext.pngmath")
+# FIXME: when rst2pdf.pdfbuilder is added, the code below causes an error
+## The name of the math extension changed on Sphinx 1.4
+#if (major == 1 and minor > 3) or (major > 1):
+#    extensions.append("sphinx.ext.imgmath")
+#else:
+#    extensions.append("sphinx.ext.pngmath")
 
 # Add any paths that contain templates here, relative to this directory.
 templates_path = ['_templates']
@@ -564,12 +565,15 @@ epub_exclude_files = ['search.html']
 #
 # See the Sphinx chapter of http://ralsina.me/static/manual.pdf
 #
-# FIXME: Do not add the index file here; the result will be too big. Adding
-# multiple PDF files here actually tries to get the cross-referencing right
-# *between* PDF files.
-pdf_documents = [
-    ('kernel-documentation', u'Kernel', u'Kernel', u'J. Random Bozo'),
-]
+
+# Add all LaTeX files to PDF documents as well
+pdf_documents = []
+for l in latex_documents:
+    doc = l[0]
+    fn = l[1].replace("tex", "pdf")
+    name = l[2]
+    authors = l[3]
+    pdf_documents.append((doc, fn, name, authors))
 
 # kernel-doc extension configuration for running Sphinx directly (e.g. by Read
 # the Docs). In a normal build, these are supplied from the Makefile via command
diff --git a/Documentation/media/Makefile b/Documentation/media/Makefile
index d75d70f191bc..3050136ed489 100644
--- a/Documentation/media/Makefile
+++ b/Documentation/media/Makefile
@@ -53,12 +53,13 @@ $(BUILDDIR)/lirc.h.rst: ${UAPI}/lirc.h ${PARSER} $(SRC_DIR)/lirc.h.rst.exception
 
 # Media build rules
 
-.PHONY: all html epub xml latex
+.PHONY: all html epub xml latex pdf
 
 all: $(IMGDOT) $(BUILDDIR) ${TARGETS}
 html: all
 epub: all
 xml: all
+pdf: all
 latex: $(IMGPDF) all
 linkcheck:
 

