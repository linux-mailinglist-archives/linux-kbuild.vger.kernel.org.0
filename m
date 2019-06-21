Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 579634EE2B
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Jun 2019 19:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbfFURvk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Jun 2019 13:51:40 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:35140 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbfFURvj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Jun 2019 13:51:39 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 203FC80436;
        Fri, 21 Jun 2019 19:51:35 +0200 (CEST)
Date:   Fri, 21 Jun 2019 19:51:34 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] kbuild: compile-test global headers to ensure they are
 self-contained
Message-ID: <20190621175134.GB16409@ravnborg.org>
References: <20190621163931.19397-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621163931.19397-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=HbLmmMm3CJfoB4MaM3cA:9 a=CjuIK1q_8ugA:10
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro.

On Sat, Jun 22, 2019 at 01:39:31AM +0900, Masahiro Yamada wrote:
> Make as many headers self-contained as possible so that they can be
> included without relying on a specific include order.
It is very nice finally to get some infrastructure to validate header
files.

But to avoid too many conflicts while including more and more headers
that are selfcontained we really need something that is more
distributed.
So for example all header files in include/drm/* could be in one
Makefile, incl. sub-directories, but the same Makefile would not include
the files in include/soc/

If you just show how ot do it, others can follow-up with the
relevant directories.

	Sam
