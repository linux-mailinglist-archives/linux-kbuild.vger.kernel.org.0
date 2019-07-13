Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4C61677D1
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jul 2019 05:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727582AbfGMDlp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Jul 2019 23:41:45 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45302 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727466AbfGMDlo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jul 2019 23:41:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=wxkeRJfE2/hEEVu6X3mDVb6YMRNpiAfth1fv/A6zUCs=; b=jOC8kysK2wEM7eJbLkG9HNvWf
        Baxo7CSk9wtm6NgTOst9HVa0TE48xFJQACXCBi4AzcVhVuwV0/jv8FvXKSunx9uTuUg2LM7RPkpQ3
        anv2MKNDFRNl01ggJtGaClSlLgq7ZXLZVJlzjsCGUf7UiX7bNSCDaxDdewPFbY5RNyIs0kh7BE68X
        nUWQjsYqNpImO/De83V+3IeF6i8JxTXnxhSa8QD0q+45sKsZuxZiwi+NQtafuKmRlW10fHKxuiShU
        JL6V62xjEgrU49vwqyZ8muxiwIYI5vALyvcwtrtNUMQoLmDRDEevJeJEdKvSksMjhp+JJ5GmGlcBH
        FR6MKhucA==;
Received: from 201.86.163.160.dynamic.adsl.gvt.net.br ([201.86.163.160] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hm8ui-0007gK-2f; Sat, 13 Jul 2019 03:41:32 +0000
Date:   Sat, 13 Jul 2019 00:41:25 -0300
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
Message-ID: <20190713004125.6009b661@coco.lan>
In-Reply-To: <20190712192705.71b97717@coco.lan>
References: <cover.1562696797.git.mchehab+samsung@kernel.org>
        <20190712141921.7f8a1d02@lwn.net>
        <20190712192705.71b97717@coco.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Em Fri, 12 Jul 2019 19:27:05 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> Em Fri, 12 Jul 2019 14:19:21 -0600
> Jonathan Corbet <corbet@lwn.net> escreveu:
> 
> > On Tue,  9 Jul 2019 15:33:18 -0300
> > Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> >   
> > > In order to be able to build all PDF books, besides the two patches I
> > > already sent:
> > > 
> > >     docs: pdf: add all Documentation/*/index.rst to PDF output
> > >     docs: automarkup.py: ignore exceptions when seeking for xrefs
> > > 
> > > A few others are needed:
> > > 
> > > - patch 1 removes nested tables for a few files I converted, as 
> > >   Sphinx LaTeX builder doesn't support it;
> > > - Patches 2 to 4 addresses some minor issues on some books,
> > >   usually requiring some blank lines, extra whitespaces or some
> > >   tag replacement;
> > > - Patch 5 is required in order to be able to build the translations
> > >   PDF book, as it adds Asian fonts support to XeLaTeX.    
> > 
> > So, modulo my one comment on the last patch the series seems OK, though I
> > don't like having to work around limitations in PDF generation this way.  
> 
> Yeah, I feel the pain. I didn't like writing those patches either.
> 
> > Can't you just make rst2pdf work instead? :)  
> 
> Well, we can try. Last time we tried, there were lots of things missing
> for it to work. 
> 
> Based on:
> 
> 	https://pypi.org/project/rst2pdf/
> 
> The project got stuck back on Dec, 2012, up to the beginning of this
> year. Maybe the issues we had in the past got fixed.
> 
> Also, right now, rst2pdf only supports Python 2.7.
> 
> I would wait for it to support Python 3.x before doing the actual
> migration.
> 
> -
> 
> I don't remember the exact details, but when rst2pdf were
> used with some documents, it didn't produce a valid PDF file, but perhaps
> someone fixed it.
> 
> Assuming that rst2pdf works now, there are still several LaTeX specific
> hacks on some files:
> 
> 	$ git grep -l latex|grep rst|wc -l
> 	     28  
> 
> I guess almost all of them are related to the lack of proper support
> at ReST markup language that would allow adjusting the output to fit
> within the page limits. 
> 
> On media, we need two types of additional features:
> 
> 1) Sphinx pdf builder uses two different LaTeX ways of producing a table.
> (tabular x tabularx x longtable - don't remember anymore the exact
> two dialects it uses).
> 
> One of the dialect allows a table to be on multiple pages; the other
> one doesn't. The builder decides the dialect if a table has more than 30
> columns, but there's a way to force longtable (by changing the css style).
> 
> Not sure if rst2pdf honors the same css style.
> 
> 2) Table scaling / font resize. The Sphinx PDF builder doesn't scale
> the fonts inside a table, nor the ReST dialect allows changing the font
> size. So, we had to use raw LaTeX dialects for it to work.
> 
> Anyway, I'm enclosing an experimental patch that would enable rst2pdf.
> It is not at production level.
> 
> It also shows some crashes like this one:
> 
> [ERROR] pdfbuilder.py:133 format not resolved, probably missing URL scheme or undefined destination target for 'Callback%20Registry'
> Traceback (most recent call last):
>   File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/rst2pdf/pdfbuilder.py", line 130, in write
>     docwriter.write(doctree, destination)
>   File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/docutils/writers/__init__.py", line 80, in write
>     self.translate()
>   File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/rst2pdf/pdfbuilder.py", line 633, in translate
>     compressed=self.compressed)
>   File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/rst2pdf/createpdf.py", line 664, in createPdf
>     pdfdoc.multiBuild(elements)
>   File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/reportlab/platypus/doctemplate.py", line 1154, in multiBuild
>     self.canv.save()
>   File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/reportlab/pdfgen/canvas.py", line 1242, in save
>     self._doc.SaveToFile(self._filename, self)
>   File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/reportlab/pdfbase/pdfdoc.py", line 215, in SaveToFile
>     data = self.GetPDFData(canvas)
>   File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/reportlab/pdfbase/pdfdoc.py", line 241, in GetPDFData
>     return self.format()
>   File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/reportlab/pdfbase/pdfdoc.py", line 423, in format
>     IOf = IO.format(self)
>   File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/reportlab/pdfbase/pdfdoc.py", line 871, in format
>     fcontent = format(self.content, document, toplevel=1)   # yes this is at top level
>   File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/reportlab/pdfbase/pdfdoc.py", line 80, in format
>     f = element.format(document)
>   File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/reportlab/pdfbase/pdfdoc.py", line 1608, in format
>     return D.format(document)
>   File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/reportlab/pdfbase/pdfdoc.py", line 679, in format
>     L = [(format(PDFName(k),document)+b" "+format(dict[k],document)) for k in keys]
>   File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/reportlab/pdfbase/pdfdoc.py", line 80, in format
>     f = element.format(document)
>   File "/devel/v4l/docs/sphinx_1.7.9/lib/python2.7/site-packages/reportlab/pdfbase/pdfdoc.py", line 1773, in format
>     if f is None: raise ValueError("format not resolved, probably missing URL scheme or undefined destination target for '%s'" % self.name)
> ValueError: format not resolved, probably missing URL scheme or undefined destination target for 'Callback%20Registry'
> FAILED
> 
> 
> > 
> > I guess it makes sense for these to go with the big band-aid-removal patch
> > set.  
> 
> OK, I'll send it together with the big patchset.
> 
> > 
> > Thanks,
> > 
> > jon
> > 
> > P.S. it seems that rst2pdf is actually being developed again:
> > https://akrabat.com/rst2pdf-back-from-the-dead/ .  I wonder how far
> > they'll get with it.  
> 
> Thanks,
> Mauro
> 
> [PATCH RFC] docs: experimental: build PDF with rst2pdf

There are a few issues with the quick hack to use rst2pdf. The
enclosed one works better.

Yet, from the existing 70 books (on my experimental tree), rst2pdf breaks 
with 14 ones.

It seems that the problem is related to broken cross-references. The html
builder handles it nicely, but rst2pdf seems to crash when it can't solve
all references. That sounds somewhat similar to the bug we solved with the
automarkup extension.


Thanks,
Mauro



[PATCH] docs: experimental: build PDF with rst2pdf

Change the logic to use rst2pdf instead of LaTeX.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

diff --git a/Documentation/Makefile b/Documentation/Makefile
index e145e4db508b..a298bbcf6fa7 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -89,18 +89,22 @@ latexdocs:
 
 ifeq ($(HAVE_PDFLATEX),0)
 
-pdfdocs:
+oldpdfdocs:
 	$(warning The '$(PDFLATEX)' command was not found. Make sure you have it installed and in PATH to produce PDF output.)
 	@echo "  SKIP    Sphinx $@ target."
 
 else # HAVE_PDFLATEX
 
-pdfdocs: latexdocs
+oldpdfdocs: latexdocs
 	@$(srctree)/scripts/sphinx-pre-install --version-check
 	$(foreach var,$(SPHINXDIRS), $(MAKE) PDFLATEX="$(PDFLATEX)" LATEXOPTS="$(LATEXOPTS)" -C $(BUILDDIR)/$(var)/latex || exit;)
 
 endif # HAVE_PDFLATEX
 
+pdfdocs:
+	@$(srctree)/scripts/sphinx-pre-install --version-check
+	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,pdf,$(var),pdf,$(var)))
+
 epubdocs:
 	@$(srctree)/scripts/sphinx-pre-install --version-check
 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,epub,$(var),epub,$(var)))
@@ -126,6 +130,7 @@ dochelp:
 	@echo  '  htmldocs        - HTML'
 	@echo  '  latexdocs       - LaTeX'
 	@echo  '  oldpdfdocs      - PDF'
+	@echo  '  pdfdocs         - PDF, using experimental rst2pdf support'
 	@echo  '  epubdocs        - EPUB'
 	@echo  '  xmldocs         - XML'
 	@echo  '  linkcheckdocs   - check for broken external links (will connect to external hosts)'
diff --git a/Documentation/conf.py b/Documentation/conf.py
index fa0a42b47e62..f53ea57aebe3 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -43,6 +43,8 @@ if (major == 1 and minor > 3) or (major > 1):
 else:
     extensions.append("sphinx.ext.pngmath")
 
+extensions.append("rst2pdf.pdfbuilder")
+
 # Add any paths that contain templates here, relative to this directory.
 templates_path = ['_templates']
 
@@ -564,12 +566,15 @@ epub_exclude_files = ['search.html']
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
+    fn = l[1].replace(".tex", "")
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
 
diff --git a/Makefile b/Makefile
index 5bbaf5ee6f5b..99ae519fccf9 100644
--- a/Makefile
+++ b/Makefile
@@ -1562,7 +1562,7 @@ $(help-board-dirs): help-%:
 # Documentation targets
 # ---------------------------------------------------------------------------
 DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs \
-	       linkcheckdocs dochelp refcheckdocs
+	       linkcheckdocs dochelp refcheckdocs oldpdfdocs
 PHONY += $(DOC_TARGETS)
 $(DOC_TARGETS): scripts_basic FORCE
 	$(Q)$(MAKE) $(build)=Documentation $@

