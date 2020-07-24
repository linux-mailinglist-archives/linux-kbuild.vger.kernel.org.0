Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA0922BB2B
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jul 2020 02:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbgGXA5F (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Jul 2020 20:57:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:33630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727783AbgGXA5F (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Jul 2020 20:57:05 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF6B12086A;
        Fri, 24 Jul 2020 00:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595552225;
        bh=r5WxFrMiDdKHTC3n7Eg5/S6BdCaIflcHYZos9cjnVOI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=A6VgWN4htxp/7jHEyuT/i8Rz/5PrRRJcbIlv5FoYcEQGIwgzxxxNP8mvELD6OpEmo
         fQFEb2RN093Ag/ZOmX8rPgE4StK8ZyCK18P3YSyEmevfo1QAufGZaeiOiltVe1G5l6
         /sbTQfMJ7T0UtIEnmBt9bfFSv6bfZqNc0jfKe8AU=
Date:   Thu, 23 Jul 2020 17:57:04 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Feng Tang <feng.tang@intel.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        andi.kleen@intel.com, ying.huang@intel.com,
        andriy.shevchenko@intel.com
Subject: Re: [RFC PATCH] makefile: add debug option to enable function
 aligned on 32 bytes
Message-Id: <20200723175704.44c4b890e76dc6dc68bf3674@linux-foundation.org>
In-Reply-To: <20200723062933.GA65362@shbuild999.sh.intel.com>
References: <1595475001-90945-1-git-send-email-feng.tang@intel.com>
        <20200722203919.8b7c9b35ff51d66550c3846c@linux-foundation.org>
        <20200723062933.GA65362@shbuild999.sh.intel.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 23 Jul 2020 14:29:33 +0800 Feng Tang <feng.tang@intel.com> wrote:

> > > gcc has an option '-falign-functions=n' to force text aligned, and with
> > > that option enabled, some of those performance changes will be gone,
> > > like [1][2][3].
> > > 
> > > Add this option so that developers and 0day can easily find performance
> > > bump caused by text alignment change,
> > 
> > Would they use it this way, or would they simply always enable the
> > option to reduce the variability?
> 
> I may mis-understood it in my last reply. If you are asking about how
> will developers and 0day use this option, for 0day, I've talked with
> 0day folks, they may just enable it by default, as 0day cares more about
> the performance delta caused by a commit (Adding Philip and Rong from
> 0day).

OK, thanks, I suspected as much.

The patch is so simple and probably-will-work, I guess we toss it in
there and see.

However it would be good if the 0day people could use it for a while
and then provide some feedback on whether it is actually proving
useful.  If not, we get to remove some stuff.
