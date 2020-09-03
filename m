Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB8025BB99
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Sep 2020 09:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgICH0L (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Sep 2020 03:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbgICH0J (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Sep 2020 03:26:09 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E7DDC061244;
        Thu,  3 Sep 2020 00:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=EWWIQsf92AsnU1wPkPRiPneOKZo+tZ8XWBgHZRi0+Tg=; b=Zpge4Rik4xQ8PHD/H81Z0KUgus
        e6iZwR6i/7TybtEAEIH+7NNGUShuxwdggzsRJoQjpoZDU4MeNGGqYF2TnAGbOAuirvU0SbWopPC44
        GvXR5IjCczpB0uhrz69i46kykSlWOstwDDfWIPgZMuLYTrbDQCjm8hHt9t1KxvWQFhSX69Nh/YtBH
        JU6bIF5VTZoRTArjnz1zP/kiUL1lN9dur4YTjbJyQkK7BkeXl6Sre6O+0mraPXZiTkFJriDg4G0oB
        i35oLQLO+6Jow0moGRyeCb1krvNt9DRYhhZRkNlFr9ETsx8Z8SUkiKzTvLCIUq8VWSo4AcrBfibPG
        xgYuu1dw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kDjdG-0000U9-7I; Thu, 03 Sep 2020 07:26:06 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DD4D9300F7A;
        Thu,  3 Sep 2020 09:26:04 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id C799F2007E86C; Thu,  3 Sep 2020 09:26:04 +0200 (CEST)
Date:   Thu, 3 Sep 2020 09:26:04 +0200
From:   peterz@infradead.org
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH -v2] scipts/tags.sh: Add custom sort order
Message-ID: <20200903072604.GT1362448@hirez.programming.kicks-ass.net>
References: <20200805102550.GO2674@hirez.programming.kicks-ass.net>
 <20200806120438.GG35926@hirez.programming.kicks-ass.net>
 <CAK7LNAQE2jPUQJUa1yi7+=w--Jj-wwnGVR2hyPQZxR7Yp9odBA@mail.gmail.com>
 <20200902162649.GL1362448@hirez.programming.kicks-ass.net>
 <CAK7LNAS+0QtvgX1b77Y51cuMQ-eK4cKb8rebTQ=Ug3F2rkjP2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAS+0QtvgX1b77Y51cuMQ-eK4cKb8rebTQ=Ug3F2rkjP2g@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 03, 2020 at 11:07:28AM +0900, Masahiro Yamada wrote:

> Contributors stop caring after their code is merged,
> but maintaining it is tiring.

This seems to hold in general :/

> Will re-implementing your sorting logic
> in bash look cleaner?

Possibly, I can try, we'll see.

> Or, in hindsight, we should have used python or perl?

I don't speak either :-/.

I googled to see if there is a python/perl ctags implementation we can
'borrow' and found https://github.com/universal-ctags/ctags instead.
That seems to be a continuation of exhuberant ctags, I can also try if
they're interested in --sort-kinds or something like that.
