Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 107C61B6046
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Apr 2020 18:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729407AbgDWQFU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Apr 2020 12:05:20 -0400
Received: from pb-smtp2.pobox.com ([64.147.108.71]:65029 "EHLO
        pb-smtp2.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729405AbgDWQFU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 12:05:20 -0400
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id 8871063C52;
        Thu, 23 Apr 2020 12:05:19 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=x7iIIy9VfnDBC05PB7qK8tTAn6w=; b=pdUg+u
        dN7SpEnmFLFGAfVoxGV9vA5dtbxzXff2THUvS/tLyx7+JyKmwrgNswqZjLaMtpIL
        O4U3Kb0ryWLGbbq+zoJ0cWxL0dcautz9v/cjPUivyCgEoFGVrrfNrkljZIIbkusA
        cbN6jBG/xZNCP3ZuhF79s4bq4Y1zbF/7Z2tgw=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id 7E6CA63C51;
        Thu, 23 Apr 2020 12:05:19 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=KQ9Xu37VoEpvg1eX+p+3+Sv3KMPQq2glfS0rMzNnloE=; b=OGT7qe6q3ByGjWJsEY/xNYLjegCIle/r3lrmRca+UadFYWXW6gScYrkzRXYecQwZZi8ijtDHnStUPxD5Sc1rCvxNNt2xaJBVHAHyVEaUBX+ZkUE2c32+a/J2uIMkooIIZ21TG2goiNAkQ8Yux8Mv4nohpw1nu9Imwdl3eI7BWZA=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp2.pobox.com (Postfix) with ESMTPSA id E719463C50;
        Thu, 23 Apr 2020 12:05:18 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id E58662DA0C9B;
        Thu, 23 Apr 2020 12:05:17 -0400 (EDT)
Date:   Thu, 23 Apr 2020 12:05:17 -0400 (EDT)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Jani Nikula <jani.nikula@linux.intel.com>
cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Saeed Mahameed <saeedm@mellanox.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kconfig: allow for conditional dependencies
In-Reply-To: <87imhqb3le.fsf@intel.com>
Message-ID: <nycvar.YSQ.7.76.2004231155060.2671@knanqh.ubzr>
References: <nycvar.YSQ.7.76.2004231102480.2671@knanqh.ubzr> <87imhqb3le.fsf@intel.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 3A5A1E32-857C-11EA-90B2-D1361DBA3BAF-78420484!pb-smtp2.pobox.com
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 23 Apr 2020, Jani Nikula wrote:

> On Thu, 23 Apr 2020, Nicolas Pitre <nico@fluxnic.net> wrote:
> > This might appear to be a strange concept, but sometimes we want
> > a dependency to be conditionally applied. One such case is currently
> > expressed with:
> >
> >         depends on FOO || !FOO
> >
> > This pattern is strange enough to give one's pause. Given that it is
> > also frequent, let's make the intent more obvious with some syntaxic
> > sugar by effectively making dependencies optionally conditional.
> >
> > This also makes the kconfig language more uniform.
> 
> Thanks, I prefer this over all the previous proposals. Versatile yet
> self-explanatory.
> 
> > Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
> >
> > diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> > index d0111dd264..0f841e0037 100644
> > --- a/Documentation/kbuild/kconfig-language.rst
> > +++ b/Documentation/kbuild/kconfig-language.rst
> > @@ -114,7 +114,7 @@ applicable everywhere (see syntax).
> >    This is a shorthand notation for a type definition plus a value.
> >    Optionally dependencies for this default value can be added with "if".
> >  
> > -- dependencies: "depends on" <expr>
> > +- dependencies: "depends on" <expr> ["if" <expr>]
> >  
> >    This defines a dependency for this menu entry. If multiple
> >    dependencies are defined, they are connected with '&&'. Dependencies
> > @@ -130,6 +130,16 @@ applicable everywhere (see syntax).
> >  	bool "foo"
> >  	default y
> >  
> > +  The dependency definition itself may be conditional by appending "if"
> > +  followed by an expression. If such expression is false (n) then this
> > +  dependency is ignored. One possible use case is:
> > +
> > +    config FOO
> > +	tristate
> > +	depends on BAZ if BAZ != n
> 
> I presume this is the same as
> 
> 	depends on BAZ if BAZ
> 
> which makes me wonder if that should be the example. At least current
> usage for select is predominantly
> 
> 	select FOO if BAR
> 
> without "!= n".

Yes, it is the same thing. I prefer making the documentation a little 
more explicit than necessary so the explanation is really obvious.


Nicolas
