Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42C45274960
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Sep 2020 21:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgIVToi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Sep 2020 15:44:38 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:56702 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726563AbgIVToi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Sep 2020 15:44:38 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 0E76E8EE1C7;
        Tue, 22 Sep 2020 12:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1600803878;
        bh=kYlTO8H6AagG2aorzaAZO00yky/bvtjHhahb3sYJOmc=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=SQg3HNNMlD+d7GN6/d2zjuqfr7LO/aGJeEhn+88lQOiN6VRu/p99KJ1SDZbWkoCOy
         13Qmtoq0iEnbQy5koPnmRw8QfSuAddtfjOYau5eSeDY+/470qyD6jQbzQcoGR0qd07
         ty43KOlxFnCys1dZt6WFfz4n4qeJaZguItYdguCI=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 72KWGQX28fs4; Tue, 22 Sep 2020 12:44:37 -0700 (PDT)
Received: from [153.66.254.174] (c-73-35-198-56.hsd1.wa.comcast.net [73.35.198.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 239F18EE0E0;
        Tue, 22 Sep 2020 12:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1600803877;
        bh=kYlTO8H6AagG2aorzaAZO00yky/bvtjHhahb3sYJOmc=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=kK+JrDSrI2RxEO4c97KW5a/LBz0AcUzCbfurY62tGHIwh09UElzyIDQTj6Y3jcXMD
         4MnkYEaALJvNi+eR3vyKs8pL1+vNR3As0D6kxx8hI3Qd/LVf8IIMmwIkrDfTA0G3j4
         jfp94xLDVzulSuLZ1Co/v3T+/1m2cP1sFCYTk8nY=
Message-ID: <15cc1edce12357799ae3caea3b89a3aad3a3bd07.camel@HansenPartnership.com>
Subject: Re: [PATCH 0/1] Add explicit error for missing CONFIG_ASN1
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 22 Sep 2020 12:44:35 -0700
In-Reply-To: <36232f66-58b1-77a8-91a3-f9d3428fffb5@infradead.org>
References: <20200922155341.17906-1-James.Bottomley@HansenPartnership.com>
         <dfae4d4f-aa96-674d-93b1-d4c097e720e4@infradead.org>
         <260b4b85d714df822da259554ef8cc2873f3096f.camel@HansenPartnership.com>
         <36232f66-58b1-77a8-91a3-f9d3428fffb5@infradead.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 2020-09-22 at 12:38 -0700, Randy Dunlap wrote:
> On 9/22/20 12:19 PM, James Bottomley wrote:
> > On Tue, 2020-09-22 at 11:54 -0700, Randy Dunlap wrote:
> > > On 9/22/20 8:53 AM, James Bottomley wrote:
> > > > I recently ran into this as an error from 0day.  On x86 it's
> > > > pretty
> > > > much impossible to build a configuration where CONFIG_ASN1
> > > > isn't
> > > > set, so you rarely notice a problem using the ASN.1 compiler
> > > > because something else has selected it.  However, this compiler
> > > > is
> > > > never built if CONFIG_ASN1 isn't set and the error you get from
> > > > kbuild is particularly unhelpful:
> > > > 
> > > >    make[4]: *** No rule to make target 'security/keys/trusted-
> > > > keys/tpm2key.asn1.o', needed by 'security/keys/trusted-
> > > > keys/built-
> > > > in.a'.
> > > >    make[4]: *** [scripts/Makefile.build:283:
> > > > security/keys/trusted-
> > > > keys/trusted_tpm2.o] Error 1
> > > >    make[4]: Target '__build' not remade because of errors.
> > > > 
> > > > This patch changes the above error to the much easier to
> > > > diagnose:
> > > > 
> > > >    scripts/Makefile.build:387: *** CONFIG_ASN1 must be defined
> > > > for
> > > > the asn1_compiler.  Stop.
> > > >    make[3]: *** [scripts/Makefile.build:505:
> > > > security/keys/trusted-
> > > > keys] Error 2
> > > > 
> > > > James
> > > > 
> > > > ---
> > > > 
> > > > James Bottomley (1):
> > > >   Makefile.build: Add an explicit error for missing ASN.1
> > > > compiler
> > > > 
> > > >  scripts/Makefile.build | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > 
> > > Is there a missing
> > > 	select ASN1
> > > somewhere?
> > 
> > You mean in the build used to produce the errors above?  Yes, so
> > the
> > patch is to make the problem more explicit.
> 
> I appreciate that the message can be improved, but it seems possible
> that some Kconfig could also be improved.

I don't really see how.  To find the problem you have to identify a
conditional build in the Makefile that requires the asn1 compiler but
for which the config option doesn't have a select ASN1.  We don't
currently preserve the "what selected this symbol" information in
kconfig, which is what we'd need.

James

