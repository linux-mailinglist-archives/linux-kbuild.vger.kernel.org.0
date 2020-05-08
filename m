Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E13D1CB469
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 May 2020 18:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgEHQOl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 8 May 2020 12:14:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:38482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726922AbgEHQOl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 May 2020 12:14:41 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 29F0E206B9;
        Fri,  8 May 2020 16:14:40 +0000 (UTC)
Date:   Fri, 8 May 2020 12:14:38 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Changbin Du <changbin.du@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v4] streamline_config.pl: add LMC_KEEP to preserve some
 kconfigs
Message-ID: <20200508121438.21f36ecf@gandalf.local.home>
In-Reply-To: <20200508140047.rln4iogroxw7esxa@mail.google.com>
References: <20200503001141.9647-1-changbin.du@gmail.com>
        <CAK7LNATBt1NxRSWiv8Ab-pKBRemp43WUs96KWELTf+vFq_VPTA@mail.gmail.com>
        <20200507091807.0a789fbd@gandalf.local.home>
        <20200508140047.rln4iogroxw7esxa@mail.google.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 8 May 2020 22:00:47 +0800
Changbin Du <changbin.du@gmail.com> wrote:

> > I agree that spaces look better.
> >  
> I am okay with space. But what about ":" which is used by shell PATH and many
> others?

I'm OK with a ':'

-- Steve
