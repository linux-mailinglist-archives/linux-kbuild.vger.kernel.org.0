Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3800D8B084
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2019 09:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbfHMHPZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Aug 2019 03:15:25 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:46740 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfHMHPZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 03:15:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=jQna6PHWwWISAI9eb8f5G01BTeDr0I8GheF/Eo+K8/4=; b=HTz9MlS4eT3VMZpcmwT6alFCT
        S6B+sPeURhnzdT9gdQ2qIknGRKVyc/vsAj6GbVui1feiDmVg14oV98/JNtlY3dGFHQFgEveSbbPyk
        fiIGYRHR2LKIbcaFpaGFPQ8EKmT4SB1Ikwu7wsAsmT5AdJ7pQ+C0RlGw0qyYkV5idobgwoDbkhBVe
        fBDwYp4oRybHYt2FONwYns16my6WWKgzNMl84Y5XoYfQLndRLj2YuLwdoJvJ2/TklCRJ0HtNwJNHx
        L3TH5r0zJyFMOBHlg27ISoAnCWMHUIJ/ptWCvMKJnU0f97Lr3AkWHOmZxotA7D+MqKypBxzt9SeLg
        MBj1hvlUQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hxR1c-0002g8-RL; Tue, 13 Aug 2019 07:15:20 +0000
Date:   Tue, 13 Aug 2019 00:15:20 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Nathan Huckleberry <nhuck@google.com>
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] kbuild: Change fallthrough comments to attributes
Message-ID: <20190813071520.GA5075@infradead.org>
References: <20190812214711.83710-1-nhuck@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812214711.83710-1-nhuck@google.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 12, 2019 at 02:47:11PM -0700, Nathan Huckleberry wrote:
> Clang does not support the use of comments to label
> intentional fallthrough. This patch replaces some uses
> of comments to attributesto cut down a significant number
> of warnings on clang (from ~50000 to ~200). Only comments
> in commonly used header files have been replaced.
> 
> Since there is still quite a bit of noise, this
> patch moves -Wimplicit-fallthrough to
> Makefile.extrawarn if you are compiling with
> clang.

That __attribute__ crap looks like a cat barfed over the keyboard.

Please fix up clang and keep the kernel source sane.

