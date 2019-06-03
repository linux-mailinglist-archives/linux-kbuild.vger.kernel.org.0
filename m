Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D153336D1
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jun 2019 19:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbfFCRdk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Jun 2019 13:33:40 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:44520 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbfFCRdk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Jun 2019 13:33:40 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 7E733806A0;
        Mon,  3 Jun 2019 19:33:35 +0200 (CEST)
Date:   Mon, 3 Jun 2019 19:33:28 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Jani Nikula <jani.nikula@intel.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        intel-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: [RFC 1/3] kbuild: add support for ensuring headers are
 self-contained
Message-ID: <20190603173328.GA11045@ravnborg.org>
References: <20190516194818.29230-1-jani.nikula@intel.com>
 <20190524174011.GA23737@ravnborg.org>
 <CAK7LNARY_L3Oyi7hhCZXVwNRAsf6ceSarTNDrzdfXQGj1tDFJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARY_L3Oyi7hhCZXVwNRAsf6ceSarTNDrzdfXQGj1tDFJw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=xbvA-TkhMh5VV6G_q3AA:9 a=CjuIK1q_8ugA:10
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro/Jani.

> 
> Following the obj-y pattern,
> I want to make header-test-y relative to $(obj).

I also considered this and agree this is better.

Otherwise we end up with a spaghetti of dependencies across the tree.

What I made just fit the purpose I had that day,
which is no excuse for bad design.

> I prefer this:
> 
> quiet_cmd_header_test = HDRTEST $@
>       cmd_header_test = echo "\#include \"$*.h\"" > $@
> 
> $(obj)/%.header_test.c:
>         $(call cmd,header_test)

Even better - good.

We call it HDRTEST - so why not just go for that name:

    hdrtest-y += headerfile.h

??

The current proposal with "header-test-y" hurts the eye a little with
two '-', and all other variables uses only one '-' as is today.
(generic-y, obj-y etc).

This is bikeshedding but is was itcing me a little.

	Sam
