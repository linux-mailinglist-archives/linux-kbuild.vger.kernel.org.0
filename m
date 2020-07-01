Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA54210FC0
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Jul 2020 17:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732138AbgGAPvt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Jul 2020 11:51:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:35816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731797AbgGAPvs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 11:51:48 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5E14D206C3;
        Wed,  1 Jul 2020 15:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593618708;
        bh=+yncuognjKF2dKEks+n4PgS80EbXhHzSqkYWpCMp8Ww=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SS7wS26IO2EOpMqEPJH59JD1WpPRaD5KcoGczER+JI4tFOxPFI3bwi5t6AyrYRqbi
         2TiK+jpFLtHrvl16Jdzu4qApQV2bHs5v2rClrvTPMpcQG3jrZ/8fus+iLfT1XFCng7
         QXGL+plBGIYKknEI3F4+X/yb2mWipGpEh4vmYspc=
Date:   Wed, 1 Jul 2020 17:51:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Maxim Levitsky <mlevitsk@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3.1 7/7] kconfig: qconf: navigate menus on hyperlinks
Message-ID: <20200701175144.501abc91@coco.lan>
In-Reply-To: <CAK7LNARjZWwKeFXMbDy76jYu21oCckz8qxkMSu7y1xmL+a3C3g@mail.gmail.com>
References: <cover.1593498345.git.mchehab+huawei@kernel.org>
        <6f7162e40f127e76c7169315d33a14946a85719a.1593498345.git.mchehab+huawei@kernel.org>
        <20200630084835.4db1331f@coco.lan>
        <CAK7LNARjZWwKeFXMbDy76jYu21oCckz8qxkMSu7y1xmL+a3C3g@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Em Thu, 2 Jul 2020 00:21:36 +0900
Masahiro Yamada <masahiroy@kernel.org> escreveu:

> On Tue, Jun 30, 2020 at 3:48 PM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Instead of just changing the helper window to show a
> > dependency, also navigate to it at the config and menu
> > widgets.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >
> >
> > ---
> >
> > I ended re-sending the same version as on patch series 2.  
> 
> Do you mean this one should substitute 7/7 in v3, right?

Yes.

> Applied to linux-kbuild.

Thank you!

Mauro
