Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03477C913B
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Oct 2019 20:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbfJBS5I (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Oct 2019 14:57:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:60992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726708AbfJBS5I (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Oct 2019 14:57:08 -0400
Received: from linux-8ccs (ip5f5ade65.dynamic.kabel-deutschland.de [95.90.222.101])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4AD5921A4C;
        Wed,  2 Oct 2019 18:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570042627;
        bh=WpF8Re3Eqymd/wJChhJPfnpiZTj0YSkk2z09XovLTCI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2uY+KMxa6EHzdWRG8yHRoNenUWG1VSFpPH30eTnifpIFT0PjnmazKkjUnTtCkFL+S
         e5pxahXIF0JieNXgs7N0PTxiqv/65wo9xzdiMLQuw6OfR48n/TkP1G2bJQpY2Nj7+x
         VO5KbJtIw0NrtVs6HxuXfVbeQIxXKLiR2t1AEW9Q=
Date:   Wed, 2 Oct 2019 20:57:02 +0200
From:   Jessica Yu <jeyu@kernel.org>
To:     Matthias Maennich <maennich@google.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Martijn Coenen <maco@android.com>,
        Will Deacon <will.deacon@arm.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] module: various bug-fixes and clean-ups for module
 namespace
Message-ID: <20191002185701.GA29041@linux-8ccs>
References: <20190927093603.9140-1-yamada.masahiro@socionext.com>
 <20190927134108.GC187147@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190927134108.GC187147@google.com>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.28-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+++ Matthias Maennich [27/09/19 14:41 +0100]:
>On Fri, Sep 27, 2019 at 06:35:56PM +0900, Masahiro Yamada wrote:
>>
>>I was hit by some problems caused by the module namespace feature
>>that was merged recently. At least, the breakage of
>>external module builds is a fatal one. I just took a look at the code
>>closer, and I noticed some more issues and improvements.
>>
>>I hope these patches are mostly OK.
>>The 4th patch might have room for argument since it is a trade-off
>>of "cleaner implermentation" vs "code size".
>>
>Thanks Masahiro for taking the time to improve the implementation of the
>symbol namespaces. These are all good points that you addressed!

Agreed, thanks Masahiro for fixing up all the rough edges! Your series
of fixes look good to me, I will queue this up on modules-next this
week with the exception of patch 4 - Matthias, you are planning to
submit a patch that would supercede patch 04/07, right?

Thanks!

Jessica
