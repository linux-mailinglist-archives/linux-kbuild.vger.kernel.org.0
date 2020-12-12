Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28C772D8333
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Dec 2020 01:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391635AbgLLAEn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Dec 2020 19:04:43 -0500
Received: from ms.lwn.net ([45.79.88.28]:48070 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393137AbgLLAEc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Dec 2020 19:04:32 -0500
X-Greylist: delayed 11692 seconds by postgrey-1.27 at vger.kernel.org; Fri, 11 Dec 2020 19:04:32 EST
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B39E67C0;
        Sat, 12 Dec 2020 00:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B39E67C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1607731432; bh=o++ZPZqcqfuEVZJsJirVpVOijN/mx4tZnsSRtY15qIk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qBh0TvjL2YDOaZBh9ywPwJCPKqhfTLFImC/0QxbXsfldcSbB/waTdnk2GRSV7JqWC
         6Sz1G8nL8rGZMDCI1aE6iEjsM6rdnmfkPojETyrSKina6bX00opP9MqIGIsUHXl2gj
         MgWv+LzF913n+ZzFPJ+f+mRA6SmPZESH8iKSrGyv02Ew2TxlXh91/6x0PE3OM8Q0f+
         W2iiM+WgTqRdMiihOq/V6x0WfvEbfEo3VGnyYqD+UFkn+v+Jwu+PpqRGOiu0wWJ953
         Qj/9UrT+WXrLzJBBbRAlTFftCl9v13x+x3bKKlWWIPufSRHuFGDeGG55oLsTp1mLlr
         PF0Hkf3Nb9Q5w==
Date:   Fri, 11 Dec 2020 17:03:50 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH RFC v2] docs: experimental: build PDF with rst2pdf
Message-ID: <20201211170350.4f27ad8d@lwn.net>
In-Reply-To: <20201212005435.0e1a0871@coco.lan>
References: <20201210172938.3b3086b6@coco.lan>
        <b73c93c6946ab324443608fac62333b7e327a7e4.1607675494.git.mchehab+huawei@kernel.org>
        <20201211134859.5ab8e0c2@lwn.net>
        <20201212005435.0e1a0871@coco.lan>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, 12 Dec 2020 00:54:35 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> I'm not an usual python programmer, so, don't know much about its 
> specifics... Yet, I would be expecting that something like this:
> 
> 	try:
> 	    extensions.append("rst2pdf.pdfbuilder")
> 	except:
> 	    sys.stderr.write('rst2pdf extension not available.\n')
> 	
> 
> Would avoid it to crash, if the extension is not available.
> Silly me :-)

No, that's not going to do it, for a couple of reasons.  First being that
all it's doing is appending a string to a list, which pretty much always
succeeds.  The attempt to actually import the module happens later.

...and you won't catch that either because it isn't actually throwing an
exception, it's just noting the problem and giving up.

The right solution is probably something like this:

	try:
	    import rst2pdf
	    extensions.append('rst2pdf.pdfbuilder')
	except ModuleNotFoundError:
	    pass # no rst2pdf for you

This is totally untested, of course.

[Incidentally, a blank "except:" clause like the one you had is, in my
experience, a bad idea.  That will catch *anything*, leading to hiding all
kinds of bugs.  Not that I've ever committed such a faux pas and suffered
the consequences myself...no...never...honest...]

I'll mess with this a bit more later.

Thanks,

jon
