Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 501E21B0D70
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Apr 2020 15:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbgDTNxR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Apr 2020 09:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726673AbgDTNxR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Apr 2020 09:53:17 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF893C061A10
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Apr 2020 06:53:16 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id b62so10550655qkf.6
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Apr 2020 06:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=o13LKn2rJ4UJRW2h0bHPO25xmhuYtNcawFVc7d+lgRo=;
        b=XZ0QzRtY25nEU44AD6pxDnkqb8l9QSmUK6ijcSmpjmSIiOt930jssLLchxgYVBCReC
         kvYOxln/nTnQQL7H2lKTWo6IXjD3qn+zcWML+FsuFwe/qTLF0+lzQRa4i76CpOezVmAT
         6hZftVtcfPfRamgioSFKBVcYiQO08xyeQ+qDvTH48MqKN7VflkvGm6h4Inti4Omg4pBU
         8S5JLyQ3B1HArKJ1F4j4BZ+Ze4inRaNI9T3ClS8676Q8+g9apTVesyJEzQupy1dc+tp5
         1tInQ3pj1/10OXIXsRtRMYg+qjDqrC8VjbnL0Vt6r2OvV6sFo96gKXHgQMZq/WcDGFla
         o0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=o13LKn2rJ4UJRW2h0bHPO25xmhuYtNcawFVc7d+lgRo=;
        b=C2EcoiDF8iY7/SINfiYcL1B03iSjkW4TBycMbdmaQlHQlSAJQbHqzEP4Kve1A7K1YC
         W64Aw4werE95+aI08zls5jaizr2VOWtUzOyPSE3JD6dy+UT7jg2l4g6ZaREXzUk9fDoH
         wJ4imfwN4n7DvfZYkUvxIqwS3EjxMdXgYKc8pK/qfJj3cTaiIcncPpnQWwxDZuZq/8Fv
         6QreDiJgjecC2aL4hu5HCqXjBaiLj93YoXRCA0ikknxg12ljIcCyQeF4/l8sOOE37E33
         qBcuBNFKigN6dQLSu14jGOWQrAmHi9YMend0spz79ArXqrcjJmOzAZgQxyDfJguRwrYA
         64jw==
X-Gm-Message-State: AGi0PuZ8f8Aaj2BfuWcBBcsaqsm7HP98jErWviyiEr9DBc33shmn4MWs
        JgyxjdkAvFePcP/yMt+atBHF8w==
X-Google-Smtp-Source: APiQypKAuhKh4rWPi/Nv88pFYcY1AEs9cY0OovBK26lllR60Dcz1ju17EnwdSoy7oIdUQy3ML9dWdQ==
X-Received: by 2002:a37:65c3:: with SMTP id z186mr15820182qkb.484.1587390796111;
        Mon, 20 Apr 2020 06:53:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id n124sm595348qkn.136.2020.04.20.06.53.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Apr 2020 06:53:14 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jQWrJ-0002Xf-Co; Mon, 20 Apr 2020 10:53:13 -0300
Date:   Mon, 20 Apr 2020 10:53:13 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Saeed Mahameed <saeedm@mellanox.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Nicolas Pitre <nico@fluxnic.net>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Leon Romanovsky <leon@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        jonas@kwiboo.se, David Airlie <airlied@linux.ie>,
        jernej.skrabec@siol.net,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Networking <netdev@vger.kernel.org>, linux-rdma@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] Kconfig: Introduce "uses" keyword
Message-ID: <20200420135313.GN26002@ziepe.ca>
References: <20200417011146.83973-1-saeedm@mellanox.com>
 <CAK7LNAQZd_LUyA2V_pCvMTr_201nSX1Nm0TDw5kOeNV64rOfpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQZd_LUyA2V_pCvMTr_201nSX1Nm0TDw5kOeNV64rOfpA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Apr 19, 2020 at 04:00:43AM +0900, Masahiro Yamada wrote:

> People would wonder, "what 'uses FOO' means?",
> then they would find the explanation in kconfig-language.rst:
> 
>   "Equivalent to: depends on symbol || !symbol
>   Semantically it means, if FOO is enabled (y/m) and has the option:
>   uses BAR, make sure it can reach/use BAR when possible."
> 
> To understand this correctly, people must study
> the arithmetic of (symbol || !symbol) anyway.

I think people will just cargo-cult copy it and not think too hard
about how kconfig works.

The descriptions in kconfig-language.rst can be improved to better
guide C people using kconfig without entirely understanding
it. Something like:

 BAR depends on FOO // BAR selects FOO: BAR requires functionality from
 FOO

 BAR uses FOO: BAR optionally consumes functionality from FOO using
 IS_ENABLED

 BAR implies FOO: BAR optionally consumes functionality from FOO using
 IS_REACHABLE

Now someone adding IS_ENABLED or IS_REACHABLE checks to C code knows
exactly what to put in the kconfig.

Jason
