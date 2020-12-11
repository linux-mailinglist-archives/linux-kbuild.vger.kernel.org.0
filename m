Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0248C2D82F7
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Dec 2020 00:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407187AbgLKXzj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Dec 2020 18:55:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:52758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404293AbgLKXzV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Dec 2020 18:55:21 -0500
Date:   Sat, 12 Dec 2020 00:54:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607730881;
        bh=SCz8bzPsELDUq0lGSB7IHwi2nUf6eCFNm8SUjmyOLOI=;
        h=From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZEHV91Um2wvOW33SMCUsi/9yIfdGDU2ugjj4kQyE0l1pnHF7WaR1ez/vGMvlRgJ5U
         LPn2ZHoZoSy951pnGE/4G9Rm6bCvVm/ebLXFcxHfWdjVjW/8/xG1hLQyNwWY5Ij0Da
         TIlEnlVIK7bsecL32JA/kUUv7nr1+8vehp6qPReUnWkSio5fgBAWHvGCRvp/WbKY61
         viCkMcHkeJvxHU7i2XIuZoqhOXJTLNYu7LoSMxKaXk22mOnN9lnijwJ0cW7h/WC9zo
         J4kg+jZVQQ2NeeODD88csRTTjIc+u3JzP/c2ORoBKaXEJrJuEN4Vaf6vNLD00mbuzR
         TE5gTw5Hm1rRA==
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH RFC v2] docs: experimental: build PDF with rst2pdf
Message-ID: <20201212005435.0e1a0871@coco.lan>
In-Reply-To: <20201211134859.5ab8e0c2@lwn.net>
References: <20201210172938.3b3086b6@coco.lan>
        <b73c93c6946ab324443608fac62333b7e327a7e4.1607675494.git.mchehab+huawei@kernel.org>
        <20201211134859.5ab8e0c2@lwn.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Em Fri, 11 Dec 2020 13:48:59 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> On Fri, 11 Dec 2020 09:33:32 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Add an experimental PDF builder using rst2pdf
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> > 
> > Please notice that 18 documents (of a total of 71) won't build with 
> > rst2pdf. There's an opened issue about that at:
> > 
> >     https://github.com/rst2pdf/rst2pdf/issues/958
> > 
> > v2: usage of SPHINXDIRS was fixed.
> > 
> > 
> >  Documentation/Makefile                     |  5 +++++
> >  Documentation/conf.py                      | 21 +++++++++++++++------
> >  Documentation/sphinx/load_config.py        | 12 ++++++++++++
> >  Documentation/userspace-api/media/Makefile |  1 +
> >  Makefile                                   |  4 ++--
> >  5 files changed, 35 insertions(+), 8 deletions(-)  
> 
> So I would dearly love to have rst2pdf working.
> 
> I applied this, then tried to see what would happen if I ran a build
> without having rst2pdf installed:
> 
> > 1108 meer kernel: make htmldocs
> >   SPHINX  htmldocs --> file:///stuff/k/git/kernel/Documentation/output
> > make[2]: Nothing to be done for 'html'.
> > WARNING: The kernel documentation build process
> >         support for Sphinx v3.0 and above is brand new. Be prepared for
> >         possible issues in the generated output.
> >         enabling CJK for LaTeX builder
> > 
> > Extension error:
> > Could not import extension rst2pdf.pdfbuilder (exception: No module named 'rst2pdf')
> > make[1]: *** [Documentation/Makefile:91: htmldocs] Error 2
> > make: *** [Makefile:1663: htmldocs] Error 2  
> 
> Methinks it's perhaps not quite ready for linux-next yet :)

Well, I haven't test this.

I'm not an usual python programmer, so, don't know much about its 
specifics... Yet, I would be expecting that something like this:

	try:
	    extensions.append("rst2pdf.pdfbuilder")
	except:
	    sys.stderr.write('rst2pdf extension not available.\n')
	

Would avoid it to crash, if the extension is not available.
Silly me :-)

Still, I suspect that it should not be hard to modify the above to
avoid the crash. 

I shouldn't be doing much development those days, as I'm taking
some vacations, after sending media stuff for 5.11. 

So, if you have a better idea about how to optionally probe an
extension, feel free to modify my patch.


> With rst2pdf installed I get a bunch of zero-length files, as promised.
> Pretty much none of the larger "books" make it through.  

Yeah. I guess one of the issues is with tables that don't fit into
a single page.

Yet, devicetree book is empty. That sounds really weird, as there are
few files on it, and I didn't see anything uncommon on the rst files.

> It's a start,
> though.  I'll happily apply this as a step forward once it doesn't break
> the docs build if rst2pdf is missing.

Sounds like a plan.

Thanks,
Mauro
