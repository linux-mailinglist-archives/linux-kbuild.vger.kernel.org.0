Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8569B888DC
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2019 08:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbfHJGjQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Aug 2019 02:39:16 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:37268 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbfHJGjQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 02:39:16 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 893D0803E3;
        Sat, 10 Aug 2019 08:39:14 +0200 (CEST)
Date:   Sat, 10 Aug 2019 08:39:13 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] kbuild: detect missing header include guard
Message-ID: <20190810063913.GB13020@ravnborg.org>
References: <20190728173445.10954-1-yamada.masahiro@socionext.com>
 <20190728173445.10954-2-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190728173445.10954-2-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=c-n4J4-pAAAA:8
        a=7gkXJVJtAAAA:8 a=zYwEsTOd6an5bQMp77QA:9 a=CjuIK1q_8ugA:10
        a=L0NDqeB7ZLmQzAogN4cw:22 a=E9Po1WZjFZOl8hwRPBS3:22
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro

On Mon, Jul 29, 2019 at 02:34:45AM +0900, Masahiro Yamada wrote:
> Our convention is to surround the whole of the header content with an
> include guard. This avoids the same header being parsed over again in
> case it is included multiple times.
> 
> The include guard is missing in several places, or broken due to the
> mismatch between #ifndef and #define.
> 
> The recently added header-test-y syntax allows the comprehensive sanity
> checks of headers. This commit adds another check; if include guard is
> missing, the header will fail to build due to redefinition of something.
> 
> Some headers must be excluded from the test-coverage for now. I will
> let them in after they are fixed.

Smart and simple - nice.

> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
