Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58F1520E52D
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 00:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391021AbgF2Vdr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jun 2020 17:33:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:60660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728630AbgF2Sk6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jun 2020 14:40:58 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0686723E1D;
        Mon, 29 Jun 2020 14:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593442006;
        bh=gtLos1SihbPLlOxuUhEKyPPNAS9h34pNrgwseJQvyrU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SiBkBgNqXJiyUfisE5n7rATDfcw+dWksEbHjJGEB4JXjEc7yI3aba21RyrogW2CQW
         5RI5/RuKgKz3dDW5w+ajvwER16uZzXQWnPWHB04eBbOk6Z8/cns5mGWoOyZprC7Njq
         uA6ALc0L9PbPUuKleMDfJTlhg0or5tgKZ9MZDyf4=
Date:   Mon, 29 Jun 2020 16:46:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Maxim Levitsky <mlevitsk@redhat.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v2 0/5] Fix split view search and debug info navigation
Message-ID: <20200629164643.5e087da0@coco.lan>
In-Reply-To: <649f4c040c2f6dd2d83e984a88343917d498b4ad.camel@redhat.com>
References: <cover.1593423060.git.mchehab+huawei@kernel.org>
        <649f4c040c2f6dd2d83e984a88343917d498b4ad.camel@redhat.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Em Mon, 29 Jun 2020 15:23:49 +0300
Maxim Levitsky <mlevitsk@redhat.com> escreveu:

> On Mon, 2020-06-29 at 11:35 +0200, Mauro Carvalho Chehab wrote:
> > This series fixes some issues with search while on split view and fix the
> > broken hyperlink navigation.
> > 
> > The first patches restore the pre-Qt5 conversion behavior. The last
> > one implements navigation on a different way. I opted to keep this one
> > in separate, as this one is a new feature.
> > 
> > Mauro Carvalho Chehab (5):
> >   kconfig: qconf: cleanup includes
> >   kconfig: qconf: ensure that only one item will be highlighted
> >   kconfig: qconf: make search fully work again on split mode
> >   kconfig: qconf: make debug links work again
> >   kconfig: qconf: navigate menus on hyperlinks
> > 
> >  scripts/kconfig/qconf.cc | 120 +++++++++++++++++++++++++++++----------
> >  scripts/kconfig/qconf.h  |  15 ++---
> >  2 files changed, 98 insertions(+), 37 deletions(-)
> >   
> I tested the series, and it works really well here.
> Thanks a lot for the patch 5, I indeed noted that 
> I am not sure it ever worked like that but it does now, 
> and it is a very good improvement in terms of usability.
> 
> There is still a tiny issue in patch 5 - sometimes already
> selected items remain selected like it was in the search (now fixed).

Yeah, I noticed that it was keeping something selected sometimes.
that's why I sent a followup patch:

	Date: Mon, 29 Jun 2020 12:57:45 +0200
	Subject: [PATCH] kconfig: qconf: re-implement setSelected()

Not sure why, but this one is not on lore yet.

> 
> Also I found another bug - clicking on '..' menu doesn't work:

I don't think that this is a bug. See below.

> For example select 'input device support', then 'keyboards' on the right,
> then you can't get back. It also might be something that never worked,
> and it doesn't bother me, I just note this for reference.

The logic at:

	void ConfigList::mouseReleaseEvent(QMouseEvent* e)

Which calls:

	emit parentSelected();

event when the "<-" button is pressed. This is used for the
configList when on singleMode, which makes sense:

	connect(configList, SIGNAL(parentSelected()),
		SLOT(goBack()));

There's no connect for menuList. So, this event is silently
ignored on split mode.

I guess the main question here is: what kind of action this were
supposed to do?

I mean, the "menuView" should always contain the leaf nodes,
as the rest of the menu hierarchy is at the configView.

So, what kind of action could be done in this case?

That's said, when looking into it, I noticed some dead code,
and some things that could be simplified.

I'll likely send a cleanup patch removing the dead code.

Thanks,
Mauro
