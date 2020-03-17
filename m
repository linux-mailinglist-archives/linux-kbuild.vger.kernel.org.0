Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67A22187878
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2020 05:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbgCQEcv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Mar 2020 00:32:51 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:35524 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbgCQEcv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Mar 2020 00:32:51 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 569C080478;
        Tue, 17 Mar 2020 05:32:48 +0100 (CET)
Date:   Tue, 17 Mar 2020 05:32:46 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: linux-kbuild missing from lore?
Message-ID: <20200317043246.GA27518@ravnborg.org>
References: <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=1XWaLZrsAAAA:8
        a=VwQbUJbxAAAA:8 a=2m1c3jq2_yOygsOEk7MA:9 a=CjuIK1q_8ugA:10
        a=2U6uBZS8ZvMA:10 a=AjGcO6oz07-iQ99wixmX:22
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 16, 2020 at 06:06:20PM -0700, Randy Dunlap wrote:
> On 3/16/20 5:47 PM, Masahiro Yamada wrote:
> > Hi Nick,
> > 
> > On Tue, Mar 17, 2020 at 8:22 AM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> >>
> >> Hi Masahiro,
> >> I noticed that linux-kbuild@vger.kernel.org seems to be missing from
> >> https://lore.kernel.org/lists.html.  Is that intentional or
> >> accidental?
> >> --
> >> Thanks,
> >> ~Nick Desaulniers
> > 
> > 
> > Thanks for letting me know this.
> > I guess it is accidental.
> > 
> > In fact, I do not know what to do
> > to take good care of the kbuild ML.
> 
> Maybe ask Sam Ravnborg or Michal Marek if they have kbuild ML archives.

I do the zero-inbox thing, and delete mails when processed.
So sorry, I have no local archieve.

	Sam
