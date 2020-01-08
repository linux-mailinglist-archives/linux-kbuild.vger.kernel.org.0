Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B52B3134680
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jan 2020 16:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbgAHPoI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Jan 2020 10:44:08 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:32772 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgAHPoI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jan 2020 10:44:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=RYC0L/1SMwgYk6wXk0aDr7brdNKcxmstrJntjhD4+po=; b=IxLb/HbkOja5rnvJTVbrCpF65
        UgSiv47EmvwEQ9whZz+A/GU/irB5t84FnikD/saJaoUABMWOm6LyT313C2OWECNWPNF7FSIlgwNTi
        PsgG0+APuZ7t8P3fP3tevBbGcoTW+aMtXOwjZY9f9AlmmXDaQ0Zz/P+m8Urx6jFGcNIUZ4Jn+qrnn
        sYPp7Qj1WGvqrgLmU7NgkO6zW3WmyJ1ApH6v63mdwbIUljLsln1+EkZuQ4xIWU1sX5yLe+2z3nkNU
        rhAcefyk8A7zRNq1SjLaVxGXG7+UFpftPRpX4yFxV/gC8fkMuU0JXQPw3KfFN/5fWBiUBndfLp9Nf
        JyE+kOekw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ipDV8-0006SP-Ol; Wed, 08 Jan 2020 15:44:06 +0000
Date:   Wed, 8 Jan 2020 07:44:06 -0800
From:   Christoph Hellwig <hch@infradead.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Fumiya Shigemitsu <shfy1014@gmail.com>,
        Yongxin Liu <yongxin.liu@windriver.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] kbuild: allow modules to link *.a archives
Message-ID: <20200108154406.GA21695@infradead.org>
References: <20200106032324.3147-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106032324.3147-1-masahiroy@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 06, 2020 at 12:23:24PM +0900, Masahiro Yamada wrote:
> Since commit 69ea912fda74 ("kbuild: remove unneeded link_multi_deps"),
> modules cannot link *.a archives.
> 
> I do not see such a usecase in the upstream code, but multiple people
> reported this issue, so it seems to be a desired feature for external
> modules.

Kernel policy is to not keep around infrastructure not used upstream.
And linking archives in the kernel doesn't really make any sense, so
this shouldn't go in in any form.
