Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F70B27497B
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Sep 2020 21:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726662AbgIVTtB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Sep 2020 15:49:01 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:56772 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726448AbgIVTtB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Sep 2020 15:49:01 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id C15C78EE1C7;
        Tue, 22 Sep 2020 12:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1600804140;
        bh=xtZB65bSYqQFVHQhxCKKl1vgJsqqy4d0EJ+4EnMxffY=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=GgZvP6L7tEKcUbNxLDmlPbYb7VSWQPpTSAGyYuMZ5eXnLIyEYaL97bwaKIpoF0XM7
         faTyf/lP6BiK7uwHL6br+VBTDsucV1QqgI6/Xe0Tr98yAAVtqO+wYXvmNoSBxaDiPQ
         LwY9qNagJDEK9Y6P1HSbTQsy5zLGH+7XYv3Ic/T0=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vMBt-DUyFMIN; Tue, 22 Sep 2020 12:49:00 -0700 (PDT)
Received: from [153.66.254.174] (c-73-35-198-56.hsd1.wa.comcast.net [73.35.198.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 5D76A8EE0E0;
        Tue, 22 Sep 2020 12:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1600804140;
        bh=xtZB65bSYqQFVHQhxCKKl1vgJsqqy4d0EJ+4EnMxffY=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=GgZvP6L7tEKcUbNxLDmlPbYb7VSWQPpTSAGyYuMZ5eXnLIyEYaL97bwaKIpoF0XM7
         faTyf/lP6BiK7uwHL6br+VBTDsucV1QqgI6/Xe0Tr98yAAVtqO+wYXvmNoSBxaDiPQ
         LwY9qNagJDEK9Y6P1HSbTQsy5zLGH+7XYv3Ic/T0=
Message-ID: <7704adabb275b652a998ab01c626bbbc99ec6afc.camel@HansenPartnership.com>
Subject: Re: [PATCH 0/1] Add explicit error for missing CONFIG_ASN1
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 22 Sep 2020 12:48:59 -0700
In-Reply-To: <8a346ff9-21a4-db8b-1636-b9b2472b5b87@infradead.org>
References: <20200922155341.17906-1-James.Bottomley@HansenPartnership.com>
         <dfae4d4f-aa96-674d-93b1-d4c097e720e4@infradead.org>
         <260b4b85d714df822da259554ef8cc2873f3096f.camel@HansenPartnership.com>
         <36232f66-58b1-77a8-91a3-f9d3428fffb5@infradead.org>
         <15cc1edce12357799ae3caea3b89a3aad3a3bd07.camel@HansenPartnership.com>
         <8a346ff9-21a4-db8b-1636-b9b2472b5b87@infradead.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 2020-09-22 at 12:46 -0700, Randy Dunlap wrote:
> On 9/22/20 12:44 PM, James Bottomley wrote:
> > On Tue, 2020-09-22 at 12:38 -0700, Randy Dunlap wrote:
> > > On 9/22/20 12:19 PM, James Bottomley wrote:
> > > > On Tue, 2020-09-22 at 11:54 -0700, Randy Dunlap wrote:
> > > > > On 9/22/20 8:53 AM, James Bottomley wrote:
> > > > > > I recently ran into this as an error from 0day.  On x86
> > > > > > it's
> > > > > > pretty
> > > > > > much impossible to build a configuration where CONFIG_ASN1
> > > > > > isn't
> > > > > > set, so you rarely notice a problem using the ASN.1
> > > > > > compiler
> > > > > > because something else has selected it.  However, this
> > > > > > compiler
> > > > > > is
> > > > > > never built if CONFIG_ASN1 isn't set and the error you get
> > > > > > from
> > > > > > kbuild is particularly unhelpful:
> > > > > > 
> > > > > >    make[4]: *** No rule to make target
> > > > > > 'security/keys/trusted-
> > > > > > keys/tpm2key.asn1.o', needed by 'security/keys/trusted-
> > > > > > keys/built-
> > > > > > in.a'.
> > > > > >    make[4]: *** [scripts/Makefile.build:283:
> > > > > > security/keys/trusted-
> > > > > > keys/trusted_tpm2.o] Error 1
> > > > > >    make[4]: Target '__build' not remade because of errors.
> > > > > > 
> > > > > > This patch changes the above error to the much easier to
> > > > > > diagnose:
> > > > > > 
> > > > > >    scripts/Makefile.build:387: *** CONFIG_ASN1 must be
> > > > > > defined
> > > > > > for
> > > > > > the asn1_compiler.  Stop.
> > > > > >    make[3]: *** [scripts/Makefile.build:505:
> > > > > > security/keys/trusted-
> > > > > > keys] Error 2
> > > > > > 
> > > > > > James
> > > > > > 
> > > > > > ---
> > > > > > 
> > > > > > James Bottomley (1):
> > > > > >   Makefile.build: Add an explicit error for missing ASN.1
> > > > > > compiler
> > > > > > 
> > > > > >  scripts/Makefile.build | 5 +++++
> > > > > >  1 file changed, 5 insertions(+)
> > > > > 
> > > > > Is there a missing
> > > > > 	select ASN1
> > > > > somewhere?
> > > > 
> > > > You mean in the build used to produce the errors above?  Yes,
> > > > so the patch is to make the problem more explicit.
> > > 
> > > I appreciate that the message can be improved, but it seems
> > > possible that some Kconfig could also be improved.
> > 
> > I don't really see how.  To find the problem you have to identify a
> > conditional build in the Makefile that requires the asn1 compiler
> > but for which the config option doesn't have a select ASN1.  We
> > don't currently preserve the "what selected this symbol"
> > information in kconfig, which is what we'd need.
> 
> Well, if you have a failing .config file, I would be glad to take a
> look at it...

The original problem is already fixed.  The point of this patch is to
make 0day explicitly identify it if it ever occurs again.

James


