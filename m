Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC8874C98
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2019 13:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391622AbfGYLNA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Jul 2019 07:13:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:34112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391544AbfGYLNA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 07:13:00 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 74CD021901;
        Thu, 25 Jul 2019 11:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564053178;
        bh=mMK5K4N5CvSqsQyZwq8b7MF3oNNFffuZ/tnEY4fz8L4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=giihKCF7flr5BvKT0yReP79jee0cRVpAJX4gJnP0LdBuiezXKQx3jmURgIjep7+ei
         M/cYgVP7IFKlcM95n8uRWIPifjDb/O5LT0fmHpocX0T/kWvqKYJb7Qd43Bi0OoB76i
         IfzIqG1pPP4WtKbpoCfNqsT9cMywnIFcBkwZyP9Y=
Date:   Thu, 25 Jul 2019 13:12:56 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: detect missing "WITH Linux-syscall-note" for
 uapi headers
Message-ID: <20190725111256.GA30958@kroah.com>
References: <20190725080513.4071-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190725080513.4071-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 25, 2019 at 05:05:13PM +0900, Masahiro Yamada wrote:
> UAPI headers licensed under GPL are supposed to have exception
> "WITH Linux-syscall-note" so that they can be included into non-GPL
> user space application code.
> 
> Unfortunately, people often miss to add it. Break 'make headers'
> when any of exported headers lacks the exception note so that the
> 0-day bot can easily catch it.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> This patch depends on the following:
> 
> https://lore.kernel.org/patchwork/patch/1105289/
> 
> I will turn on the error after all headers are fixed.

I've taken the dependancy here in the spdx tree and will send it to
Linus for 5.3-rc2.  I can also take this now through that tree, or you
can add it to yours afterward, which ever is easier for you.

thanks,

greg k-h
