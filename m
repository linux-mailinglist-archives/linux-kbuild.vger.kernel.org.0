Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 143EF126E40
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2019 20:53:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfLSTxF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Dec 2019 14:53:05 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:47976 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbfLSTxF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Dec 2019 14:53:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=qJw64LD7zJyT8BUXk7jEe7SP15JODV5psaJwB35+yl8=; b=M7RH+lIClBp3oVqj9u9ThFnLk
        Zn1ewN8entymF3LEt5wzeCLjFvy3RIAPabxVcUZevXG/5zig7Kp1GpYdwqqNH0gckDP6VnFKl+pA2
        jmmlt1VjPv+jPSdRphxADDGFyBfH0KxYeWaP9MOFjFNSdPrFRsoMyMxTqKu7yMEnJir/IyKhabZhN
        WGpX9A6gshFyZIrhsvqKkoHi6govGD29KUukNrWsIC2GuVepjqE/0pS/xM5JR0f5fm9IA1UmqkUF6
        WwsprIPUsmh5RLjwHTPwfoW29EtBKV9fUMY5I9LYFgO3ly+vmgDIqAJPPu6CGotg9knwbZJuHwRa9
        1h8k9bv8w==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ii1r4-00054h-Hl; Thu, 19 Dec 2019 19:53:02 +0000
Date:   Thu, 19 Dec 2019 11:53:02 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Johan Hovold <johan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: clarify the difference between obj-y and obj-m
 w.r.t. descending
Message-ID: <20191219195302.GG32169@bombadil.infradead.org>
References: <20191219115100.958-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191219115100.958-1-masahiroy@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 19, 2019 at 08:51:00PM +0900, Masahiro Yamada wrote:
> Kbuild descends into a directory by either 'y' or 'm', but there is an
> important difference.
> 
> Kbuild combines the built-in objects into built-in.a in each directory.
> The built-in.a in the directory visited by obj-y is merged into the
> built-in.a in the parent directory. This merge happens recursively when
> Kbuild is ascending back towards the top directory, so built-in objects
> are linked into vmlinux eventually. This works properly only when the
> Makefile that specifies obj-y is reachable by the chain of obj-y.
> 
> On the other hand, Kbuild does not take built-in.a from the directory
> visited by obj-m. This it, all the objects in that directory are supposed
> to be modular. If Kbuild descends into a directory by obj-m, but the
> Makefile in the sub-directory specifies obj-y, those objects are just
> left orphan.
> 
> The current statement "Kbuild only uses this information to decide that
> it needs to visit the directory" is misleading. Clarify the difference.

> +	Kbuild uses this information not only to decide that it needs to visit
> +	the directory, but also to decide whether or not to link objects from
> +	the directory into vmlinux.
> +
> +	When Kbuild descends into the directory with 'y', all built-in objects
> +	from that directory are combined into the built-in.a, which will be
> +	eventually linked into vmlinux.
> +
> +	When Kbuild descends into the directory with 'm', in contrast, nothing
> +	from that directory will be linked into vmlinux. If the Makefile in
> +	that directory specifies obj-y, those objects will be left orphan.
> +	It is very likely a bug of the Makefile or of dependencies in Kconfig.

Perhaps the implementation should be changed to match the documentation?
This seems like a very subtle point for people to know.
