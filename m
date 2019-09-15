Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F958B2EF7
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Sep 2019 09:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727410AbfIOHYJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 15 Sep 2019 03:24:09 -0400
Received: from ms.lwn.net ([45.79.88.28]:43332 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727368AbfIOHYJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 15 Sep 2019 03:24:09 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id AD3A5738;
        Sun, 15 Sep 2019 07:24:07 +0000 (UTC)
Date:   Sun, 15 Sep 2019 01:24:03 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Ben Hutchings <ben@decadent.org.uk>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        ab@php.net
Subject: Re: [PATCH v2] Documentation: kbuild: Add document about
 reproducible builds
Message-ID: <20190915012403.7173b503@lwn.net>
In-Reply-To: <CAK7LNASCiu51GtqiSZ8kydmYfNCCUg06AtZR93Hfa6bKwYb4fg@mail.gmail.com>
References: <20190914112420.qift4wjk7llxg57x@decadent.org.uk>
        <CAK7LNASCiu51GtqiSZ8kydmYfNCCUg06AtZR93Hfa6bKwYb4fg@mail.gmail.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, 15 Sep 2019 12:24:49 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> On Sat, Sep 14, 2019 at 8:24 PM Ben Hutchings <ben@decadent.org.uk> wrote:
> >
> > In the Distribution Kernels track at Linux Plumbers Conference there
> > was some discussion around the difficulty of making kernel builds
> > reproducible.
> >
> > This is a solved problem, but the solutions don't appear to be
> > documented in one place.  This document lists the issues I know about
> > and the settings needed to ensure reproducibility.
> >
> > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>  
> 
> 
> Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>

I have applied this, thanks.

jon
