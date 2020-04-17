Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 379FC1ADF70
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Apr 2020 16:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730876AbgDQOHz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Apr 2020 10:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730852AbgDQOHx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Apr 2020 10:07:53 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6EAC061A0F
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Apr 2020 07:07:53 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id q73so921464qvq.2
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Apr 2020 07:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+LqhOO57sChESg9+cIngyrXtjaLelgEgf+v+L/tbLWk=;
        b=gy59aPv8zMj56Mv03vyLFGLBjHJ7J1u+UArIzN0R+rT72xnw/cutPk5HRKX2d/1xSE
         hKj5WfRwjwgNBiBwpu21u9UkwU1NN7FZGkJLCpxItWEKZUwsINzhO6JPR6PivXLj7MQo
         DzlEdqiF/kNV0iIENDraE2hef4Q3wXijNqzULS2WDLUwm63Q6O7Y1oO0EPjvaSWN7MD0
         AunwqeklzSrYcvc3UTO2x5yR3FPVWYFM74ybRxl3Xmx6E1s4oWCv/m8igVBmhfwOLa12
         kXgIX2z40DDQpn1mBfE7DJmt9RJZ1SuirkW4fEIj9HgNfMqTedHLx/oI8bh09LtR45/s
         R9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+LqhOO57sChESg9+cIngyrXtjaLelgEgf+v+L/tbLWk=;
        b=dvwtLDK6UMq1kdDtmsaa6kcc31S5PStNuBxxY/2gBqsLYw7zHiPs5RniiwMk8yUCMd
         KNcQ0B+vfEdwoBRfCt/6xLSaWV2wlehvAzvzT67t82jHrvFc+60QX8hXhBtnImoWpDFy
         nIUMVBJLbiwfamBuwBhXieGC3W4sQbzm0SCQ3ZbQ2gY1unXhqRWA5kkQp4wRsMjf4+M9
         fUSyC1+fOoUtanDJprBAcFfng2e2F0ZPHJMr3JJKDAcBtjMMZE+GPAk2GbDeUTWyrI4e
         /qBOVxWJxX9/LRICKQiy3EWLX+touSYz9YzReZz8qICin2pBJ3m1xLjJ+YyPYLKuL6pN
         osVA==
X-Gm-Message-State: AGi0Pua3jjZ0rs50jOH4XiK7S67fPYRzO0sN7Suug2+G30mW5bZahdWn
        2dQKVr/Qsk6GUgrsfGIVUt/6IA==
X-Google-Smtp-Source: APiQypKaGok3DQChb57xxsDjD/Iyacg7EOqm08DjV1CqcQ8BJaa7llQ5QiLWdRU37gbKKcQtu2odUg==
X-Received: by 2002:a0c:b790:: with SMTP id l16mr2844426qve.244.1587132472350;
        Fri, 17 Apr 2020 07:07:52 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id n190sm16749764qkb.93.2020.04.17.07.07.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 07:07:51 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jPReo-0000hP-VC; Fri, 17 Apr 2020 11:07:50 -0300
Date:   Fri, 17 Apr 2020 11:07:50 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Saeed Mahameed <saeedm@mellanox.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Nicolas Pitre <nico@fluxnic.net>, narmstrong@baylibre.com,
        Laurent.pinchart@ideasonboard.com, leon@kernel.org,
        kieran.bingham+renesas@ideasonboard.com, jonas@kwiboo.se,
        airlied@linux.ie, jernej.skrabec@siol.net,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-rdma@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC PATCH 1/2] Kconfig: Introduce "uses" keyword
Message-ID: <20200417140750.GF26002@ziepe.ca>
References: <20200417011146.83973-1-saeedm@mellanox.com>
 <87v9ly3a0w.fsf@intel.com>
 <20200417122827.GD5100@ziepe.ca>
 <87h7xi2oup.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h7xi2oup.fsf@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 17, 2020 at 05:01:18PM +0300, Jani Nikula wrote:
> On Fri, 17 Apr 2020, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > On Fri, Apr 17, 2020 at 09:23:59AM +0300, Jani Nikula wrote:
> >
> >> Which means that would have to split up to two. Not ideal, but
> >> doable.
> >
> > Why is this not ideal?
> >
> > I think the one per line is easier to maintain (eg for merge
> > conflicts) and easier to read than a giant && expression.
> >
> > I would not complicate things further by extending the boolean
> > language..
> 
> Fair enough. I only found one instance where the patch at hand does not
> cut it:
> 
> drivers/hwmon/Kconfig:  depends on !OF || IIO=n || IIO

Ideally this constraint would be expressed as:

   optionally depends on OF && IIO

And if the expression is n then IIO is not prevented from being y.

Ie the code is just doing:

#if defined(CONFIG_OF) && IS_ENABLED(CONFIG_IIO)

Jason
