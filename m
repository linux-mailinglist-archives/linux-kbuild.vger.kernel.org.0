Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D1F2002FA
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Jun 2020 09:47:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730858AbgFSHrl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 19 Jun 2020 03:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729548AbgFSHrk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jun 2020 03:47:40 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F3AC06174E;
        Fri, 19 Jun 2020 00:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=eC3lCsQ0HKd4P3Obzi7QMiO3Tn6B/tCYfrG0AFO56UA=; b=ZODc/Z5Q567pQxBOisq5rhVdg/
        LsOL17piDjqoF8LCxCjyCW4w7+K/FqsWHYMdV8q6qb1KSidkq3Lp6nj1d5DCERQY7FGoFn7X9X/U/
        9VHoXyNVNkFewuOuUjOjna2fvKjvo+TUSVGVnH8xRgRfz4QkQgAR2dbgtbNlkJ9ae1KpHHx949R0E
        kYlzmIuNDbt6HD+TA/KtQI5GV09xdT7AuDVS9PrNmfKE3ql6p1HFIkLnwf8Ritfszpxq748h6i39I
        ViiTiwv/l66eczDvDOYP28sHFuYzJmNf6W7yL0ncKZlGgHtnr+Gm8MhbrDroxnADdEixIqQAwjy3a
        UaMamYZw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jmBkQ-0002bq-U3; Fri, 19 Jun 2020 07:47:38 +0000
Date:   Fri, 19 Jun 2020 00:47:38 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "Makefile: install modules.builtin even if
 CONFIG_MODULES=n"
Message-ID: <20200619074738.GB1427@infradead.org>
References: <20200619044823.863461-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200619044823.863461-1-masahiroy@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 19, 2020 at 01:48:23PM +0900, Masahiro Yamada wrote:
> This reverts commit e0b250b57dcf403529081e5898a9de717f96b76b.
> 
> Now that "make install" copies modules.builtin to $(INSTALL_MOD_PATH),
> it breaks systems that do not set INSTALL_MOD_PATH for "make install".
> 
> While modules.builtin is useful for CONFIG_MODULES=n, this way gives
> unexpected impact to existing systems. Maybe "make modules_install"
> can install modules.builtin irrespective of CONFIG_MODULES as Jonas
> originally suggested. Anyway, this commit should be reverted ASAP.

What is the "unexpected impact?  This commit log needs to explain
that.
