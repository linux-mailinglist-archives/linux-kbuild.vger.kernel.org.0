Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 409ED3BE6A5
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jul 2021 12:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbhGGKyC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Jul 2021 06:54:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231414AbhGGKyB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Jul 2021 06:54:01 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F41FC061762
        for <linux-kbuild@vger.kernel.org>; Wed,  7 Jul 2021 03:51:20 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id a8so2531278wrp.5
        for <linux-kbuild@vger.kernel.org>; Wed, 07 Jul 2021 03:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/aoTDXlXnALJMl9Wxd7xok1/Pwgg+4ujvLSoM7V+DME=;
        b=Mf4Rc4fSaIhy7Eb7pDQ7YGLzqNkfmoralCbm7Zj2Azo8hiYiZE6FuOpz79xUx991ss
         tFhmgWuP5R4VCalxaY8czCxgSE6mosNbW+b4fPjNUCY7jY7ILgAtzAJgQS11IXC3ndlz
         3mDUbW1IRvu3GVUIVPk077DLMLOX/x+udOCmRi00Eq9lTB88tNC6q6Wk/q+qRw4oCwQW
         MCm50XprqalFbKMZQTNlm9yDy+wDjHUn4SLPFZTHsdBD3vIvAWKUvM2Sep06DVYowuLK
         xyqfBPN3EAhwegTVObXFr2Z/51eaeSjMJRKFzyUCxaD0sxgxIHBMD+YFQPKeE5lgnrZk
         0LWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/aoTDXlXnALJMl9Wxd7xok1/Pwgg+4ujvLSoM7V+DME=;
        b=CJjjJ1cdpil46DAFtk7UsIYvIhh+oaaV/MK2DCqwjXH/7bizDuiEkmptJ3OrKIY+C8
         E+EpKfRlYQtbJGPgh5Rsz27SOb/lM6QnTZanVF4zaYpQsnA0S2cSggAwTsYsL23ha9UG
         jKSt/LdYJQka2bAJa0wjZ9JpezviBAWx9IpycadMPuAJGuxFp1Fz4fSVxqam3uA8p1+n
         DLlno9BdvAyNJfpXZBs1Z7dg74ZPTJ5mJ2m2YognB/+RzsMfJGKmfO8DlzEuDU39CTXr
         0LepbJ5oxoS7Oc7V+hvDjikA4+G6aW3T06+25AjSKrMSavP9UAsMu/7Yn/uQXhs8jBl6
         2RAQ==
X-Gm-Message-State: AOAM531/Be5dPKVU/XMDInq2H5tNjmHDI52DSxDCIGhjMAcFtp0Fc5lZ
        Ni1NJVJTPGugEl7DCMtaLnoZuA==
X-Google-Smtp-Source: ABdhPJw+vX2jEX6fI6DaJdUd0kdnpZdFibOW5bG0fWz9BRXFsHJ7OuCBi0RFXanBw4KcvNhXi9jVrw==
X-Received: by 2002:a5d:6dd1:: with SMTP id d17mr27175199wrz.344.1625655078685;
        Wed, 07 Jul 2021 03:51:18 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:15:13:396a:6bf2:9c33:26ce])
        by smtp.gmail.com with ESMTPSA id s17sm19500078wrt.58.2021.07.07.03.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 03:51:17 -0700 (PDT)
Date:   Wed, 7 Jul 2021 12:51:12 +0200
From:   Marco Elver <elver@google.com>
To:     ojeda@kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/17] Rust support
Message-ID: <YOWHIHcs5/sYr/Vr@elver.google.com>
References: <20210704202756.29107-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704202756.29107-1-ojeda@kernel.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 04, 2021 at 10:27PM +0200, ojeda@kernel.org wrote:
[...]
>   rust: add `alloc` crate
[...]

I think this patch never made it to the mailing list. b4 also doesn't
find it:

	ERROR: missing [7/17]
