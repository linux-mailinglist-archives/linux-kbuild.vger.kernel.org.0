Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7890888D9
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2019 08:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725372AbfHJGhj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Aug 2019 02:37:39 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:37174 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbfHJGhj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 02:37:39 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 389F0803E3;
        Sat, 10 Aug 2019 08:37:35 +0200 (CEST)
Date:   Sat, 10 Aug 2019 08:37:34 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] kbuild: stop compile-testing kernel headers by
 wildcard patterns
Message-ID: <20190810063734.GA13020@ravnborg.org>
References: <20190728173445.10954-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190728173445.10954-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=8jZT2MKTqi2P7qHRk4YA:9 a=CjuIK1q_8ugA:10
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro.

On Mon, Jul 29, 2019 at 02:34:44AM +0900, Masahiro Yamada wrote:
> This compile-test started from the strong belief that (almost) all
> headers should be able to be compiled as a standalone unit, but this
> requirement seems to be annoying.
> 
> I believe it is nice to compile-test all the exported headers. On the
> other hand, in-kernel headers are not necessarily always compilable.
> Actually, some headers are only included under a certain combination
> of CONFIG options, and that is definitely fine.
> 
> Currently, newly added headers are compile-tested by default. It
> sometimes catches (not fatal) bugs, but sometimes raises false
> positives.
The current set of include files in include/ may benefit from
a positive list only.

But we have ~7000 headers in drivers/ alone.
And new headers are added all the time.
So with a positive only approach this will be an afterthought
as most headers will not be added to header-test-y

It would be better to keep the possibility so we on a directory
basis can determine if we want a positive list only, or a negative list.

In this way we could in drivers/gpu/drm/ say that all headers must be
checked except foo.h and bar.h that are know buggy.
And in drivers/vidoe/ we only want to check vfoo.h and vbar.h as we do
not want to invest time in fixing the other 100 headers.

Therefore the removal of header-test-pattern-y should be left out.

And since things did not explode after -rc1 I dunno if we really
want to change it to a positive list only in include/??

That is did not explode is obviously because you have put a big
effort into creating a good negative list.

In other words - I am not fan of this patch.

	Sam
