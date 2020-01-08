Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE5001346A3
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jan 2020 16:48:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbgAHPsi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Jan 2020 10:48:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:44118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726186AbgAHPsh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jan 2020 10:48:37 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E3E4F2067D;
        Wed,  8 Jan 2020 15:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578498517;
        bh=ZSk0FHsAvkuMsSPninpuKhMudaTUG+Kc1Y7RjR7+1XQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zHJi4TTvjmOavWugKmlA/ISMIGZZdwTYuL6S4qq9+XsRdwKdE3a9VJXOA8Jv6MVfQ
         /sMUNHgYBOaCg/lAfTZ5Sc4IzOZ4otXTbzgFjoAk2X9u1g+NZCVEh7zY0jelAIgNbO
         PrXIRu96H+VElRWZIhbyT4fPz95F+LufxxsRvyp4=
Date:   Wed, 8 Jan 2020 16:48:35 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        Fumiya Shigemitsu <shfy1014@gmail.com>,
        Yongxin Liu <yongxin.liu@windriver.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: allow modules to link *.a archives
Message-ID: <20200108154835.GA2449518@kroah.com>
References: <20200106032324.3147-1-masahiroy@kernel.org>
 <20200108154406.GA21695@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108154406.GA21695@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 08, 2020 at 07:44:06AM -0800, Christoph Hellwig wrote:
> On Mon, Jan 06, 2020 at 12:23:24PM +0900, Masahiro Yamada wrote:
> > Since commit 69ea912fda74 ("kbuild: remove unneeded link_multi_deps"),
> > modules cannot link *.a archives.
> > 
> > I do not see such a usecase in the upstream code, but multiple people
> > reported this issue, so it seems to be a desired feature for external
> > modules.
> 
> Kernel policy is to not keep around infrastructure not used upstream.
> And linking archives in the kernel doesn't really make any sense, so
> this shouldn't go in in any form.

Yeah, I agree, it's just going to bit-rot and people really shouldn't be
doing stuff like this in their kernel modules.

If they want to, they need to figure out how to do it themselves :)

greg k-h
