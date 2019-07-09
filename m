Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E60BF63966
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 18:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbfGIQaw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 12:30:52 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:52084 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfGIQaw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 12:30:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ej1dfMmYgr1AeGBtidA9OPAlkakgtWyk3TTGIlbufEI=; b=uhffFkUxVvxFaB/v6QyUur77Q
        olqgQsIPbIEejaz1ecbet0SKmytp9fST5h5LmNrUAm/YXR7n6AlURLiMJi2KmhDLcrvLBhKRS9dnn
        phd/Z7e/kRIEB3DK+MqiY/P9xGwQQCCFjOAEOLL9ITH4GQl8a1xBYSXfKjmpLh6ctvgw/qub9TuR7
        Pn4aUejvO7EXMICnKVC7dxfjXJXRFs7V2B43kp4BUqSz78dAWVPfaQHBpq5kn26IWfcEe5Siy1NCV
        n/uq9NbhPhpb2eRfjQXattspJPi1zQLdRLwjppjITSJhwWSmmA8Pjj9UH/SjbJRM0AW1RRkNuE6q8
        75/MpZVug==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hkt0s-0000bh-Mi; Tue, 09 Jul 2019 16:30:42 +0000
Date:   Tue, 9 Jul 2019 09:30:42 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: Inform user to pass ARCH= for make mrproper
Message-ID: <20190709163042.GA28716@infradead.org>
References: <20190709132639.26802-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190709132639.26802-1-geert@linux-m68k.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Is there any chance we could save ARCH in .config?  That would make
cross compile builds so much easier..  Same for CROSS_COMPILE.
