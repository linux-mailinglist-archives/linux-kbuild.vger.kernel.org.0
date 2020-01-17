Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E74C6140D14
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Jan 2020 15:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbgAQOvB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Jan 2020 09:51:01 -0500
Received: from ms.lwn.net ([45.79.88.28]:50850 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726827AbgAQOvB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Jan 2020 09:51:01 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 87C251E5;
        Fri, 17 Jan 2020 14:51:00 +0000 (UTC)
Date:   Fri, 17 Jan 2020 07:50:59 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] kconfig: fix documentation typos
Message-ID: <20200117075059.28cf842c@lwn.net>
In-Reply-To: <CAK7LNASYynBVaaGROEjy1PC7+9xatO7gf2LTRGG1UOpiXtzENw@mail.gmail.com>
References: <20200113232212.138327-1-helgaas@kernel.org>
        <CAK7LNASYynBVaaGROEjy1PC7+9xatO7gf2LTRGG1UOpiXtzENw@mail.gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 17 Jan 2020 11:17:15 +0900
Masahiro Yamada <masahiroy@kernel.org> wrote:

> > -all errors appear to involve one or more select's and one or more "depends on".
> > +all errors appear to involve one or more "selects" and one or more "depends on".  
> 
> 
> I think "selects" is strange here.
> 
> "select" is a Kconfig keyword.
> select's is intentional, I guess.
> 
> Keep it as-is, or perhaps change it into "select" (singular) ?

Apostrophe abuse is one of those ways to annoy a certain percentage of
your reader's :)

It could be as Bjorn made it, or:

	"select" statements
	``select``s

jon
