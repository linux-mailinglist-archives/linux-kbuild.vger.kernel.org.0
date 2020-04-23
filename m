Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 850301B5EC2
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Apr 2020 17:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729068AbgDWPLv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Apr 2020 11:11:51 -0400
Received: from pb-smtp2.pobox.com ([64.147.108.71]:56841 "EHLO
        pb-smtp2.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728928AbgDWPLv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 11:11:51 -0400
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id A52406367B;
        Thu, 23 Apr 2020 11:11:48 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=liUy51BXPagKlCpsxsU30mmCCug=; b=B+EA2M
        QyUzFiSAqoYAraOIp3H40AD73D0C4Tobz7XWGQjCz0nUpgHcTMrSzaXIztWtxrT/
        GC+Rc8QJvC5DmljlmmT397odad9V22Qh0yNVArwcRZ/uETpdSm17o+W7MV7FHfgV
        WV7JsA/cdm4QR0+vUtZv+aszhzdRqtZkFCEcE=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp2.pobox.com (Postfix) with ESMTP id 96FBD6367A;
        Thu, 23 Apr 2020 11:11:48 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=sgOUu7eN/fZaL+hHaitw7ZcpUu4hOm/EaIXLM4l/NWY=; b=XM6IO9W1P4XTOEkPCHeNSEh0evLSN/mxgeAFKpbS+9j5iBWGTYUrUuMCegQSMtZfLbX0I/3kO+hyy0pBdPeGqOlsdSzXN2rtn0NSfR0rubiHS2vXyGPTJBg36GoTo1adjeVe7FnDe1xAEKSqYVfm8gS3poCWcphGgECndwVn1d0=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp2.pobox.com (Postfix) with ESMTPSA id C829F63679;
        Thu, 23 Apr 2020 11:11:47 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id B5CAE2DA0C34;
        Thu, 23 Apr 2020 11:11:46 -0400 (EDT)
Date:   Thu, 23 Apr 2020 11:11:46 -0400 (EDT)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Jason Gunthorpe <jgg@ziepe.ca>
cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Saeed Mahameed <saeedm@mellanox.com>,
        "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "Laurent.pinchart@ideasonboard.com" 
        <Laurent.pinchart@ideasonboard.com>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "jonas@kwiboo.se" <jonas@kwiboo.se>,
        "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
        "leon@kernel.org" <leon@kernel.org>
Subject: Re: [RFC PATCH 1/2] Kconfig: Introduce "uses" keyword
In-Reply-To: <20200423150556.GZ26002@ziepe.ca>
Message-ID: <nycvar.YSQ.7.76.2004231109500.2671@knanqh.ubzr>
References: <CAK7LNATmPD1R+Ranis2u3yohx8b0+dGKAvFpjg8Eo9yEHRT6zQ@mail.gmail.com> <87v9lu1ra6.fsf@intel.com> <45b9efec57b2e250e8e39b3b203eb8cee10cb6e8.camel@mellanox.com> <nycvar.YSQ.7.76.2004210951160.2671@knanqh.ubzr> <62a51b2e5425a3cca4f7a66e2795b957f237b2da.camel@mellanox.com>
 <nycvar.YSQ.7.76.2004211411500.2671@knanqh.ubzr> <871rofdhtg.fsf@intel.com> <nycvar.YSQ.7.76.2004221649480.2671@knanqh.ubzr> <940d3add-4d12-56ed-617a-8b3bf8ef3a0f@infradead.org> <nycvar.YSQ.7.76.2004231059170.2671@knanqh.ubzr>
 <20200423150556.GZ26002@ziepe.ca>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: C05F543C-8574-11EA-8AB0-D1361DBA3BAF-78420484!pb-smtp2.pobox.com
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 23 Apr 2020, Jason Gunthorpe wrote:

> On Thu, Apr 23, 2020 at 11:01:40AM -0400, Nicolas Pitre wrote:
> > On Wed, 22 Apr 2020, Randy Dunlap wrote:
> > 
> > > On 4/22/20 2:13 PM, Nicolas Pitre wrote:
> > > > On Wed, 22 Apr 2020, Jani Nikula wrote:
> > > > 
> > > >> On Tue, 21 Apr 2020, Nicolas Pitre <nico@fluxnic.net> wrote:
> > > >>> This is really a conditional dependency. That's all this is about.
> > > >>> So why not simply making it so rather than fooling ourselves? All that 
> > > >>> is required is an extension that would allow:
> > > >>>
> > > >>> 	depends on (expression) if (expression)
> > > >>>
> > > >>> This construct should be obvious even without reading the doc, is 
> > > >>> already used extensively for other things already, and is flexible 
> > > >>> enough to cover all sort of cases in addition to this particular one.
> > > >>
> > > >> Okay, you convinced me. Now you only need to convince whoever is doing
> > > >> the actual work of implementing this stuff. ;)
> > > > 
> > > > What about this:
> > > > 
> > > > Subject: [PATCH] kconfig: allow for conditional dependencies
> > > > 
> > > > This might appear to be a strange concept, but sometimes we want
> > > > a dependency to be conditionally applied. One such case is currently
> > > > expressed with:
> > > > 
> > > > 	depends on FOO || !FOO
> > > > 
> > > > This pattern is strange enough to give one's pause. Given that it is
> > > > also frequent, let's make the intent more obvious with some syntaxic 
> > > > sugar by effectively making dependencies optionally conditional.
> > > > This also makes the kconfig language more uniform.
> > > > 
> > > > Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
> > > 
> > > Hi,
> > > 
> > > If we must do something here, I prefer this one.
> > > 
> > > Nicolas, would you do another example, specifically for
> > > CRAMFS_MTD in fs/cramfs/Kconfig, please?
> > 
> > I don't see how that one can be helped. The MTD dependency is not 
> > optional.
> 
> Could it be done as 
> 
> config MTD
>    depends on CRAMFS if CRAMFS_MTD
> 
> ?

No. There is no logic in restricting MTD usage based on CRAMFS or 
CRAMFS_MTD.


Nicolas
