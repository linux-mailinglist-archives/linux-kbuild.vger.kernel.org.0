Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25DFF5D4D7
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2019 18:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbfGBQyL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Jul 2019 12:54:11 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37862 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfGBQyJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Jul 2019 12:54:09 -0400
Received: by mail-pl1-f194.google.com with SMTP id bh12so683875plb.4
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jul 2019 09:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YOrD3L7+D3RpXOEWEmqtGQ4AmNUEkApY6aCdIXrEgrQ=;
        b=BFv71SBeG8l6/HWnTjNskf1n1SP8LlSsXw2u6O+8x6/9pd3cuE7Y1G5j29ueHBNhy8
         tm8Q20zcODk4NTg/feMq5Wvi17m41FI/dmfEqVHu9czAp1QyyG43DjRHN5sq0/DkUBQK
         Bnw2rITr1+Q/yJai9kbAe6wGlHWl2jlbV8UUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YOrD3L7+D3RpXOEWEmqtGQ4AmNUEkApY6aCdIXrEgrQ=;
        b=tYhBAFFtLAqnel/ztk8LVvglM9FLBjCLa3st5V+i+QeoDY6BLT0oPyjJALa6P6umio
         fX+jCoRL3odSfXssPt/jsaJoTWYUU0HgNegj8r9UyLGl11OKJ0vIwm8wu4PnJLJRzinC
         ygdV+WlqfS7Ih0GfKJScg9ZwiR/V6xTnCugjBnHKjYM80Hukh0I1plT3aw5SbfUvt7N8
         wKkHFvj2MA8xvaTKDhNK3ZsTZMEiaidkyWton/0C/zgYjoatX0e9o13Hdr7dS/y6WbT3
         Bjutyvj3LREm7bQUxMZkGb5ait0aMySk+Df605TeaROOQ7OLGLVBGntnS3A5EevMqTy0
         PW0g==
X-Gm-Message-State: APjAAAX55n1nEBv+ll/xUMXb0ahAx04zpFFSpxNgM4TIxhQw99HBTHu4
        0KtPMwqBsD3n0UnMqnMV8qjBDdqvyK4=
X-Google-Smtp-Source: APXvYqwOnSn4p4gc9nADX6fU8aROdR2ltn7O8xpjV3aZn4Lmnr47mVQ9H0Ozs1WomAeLwHs/wgs3wQ==
X-Received: by 2002:a17:902:f082:: with SMTP id go2mr38110074plb.25.1562086448544;
        Tue, 02 Jul 2019 09:54:08 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id s16sm14039729pfm.26.2019.07.02.09.54.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 02 Jul 2019 09:54:07 -0700 (PDT)
Date:   Tue, 2 Jul 2019 12:54:06 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] kheaders: remove meaningless -R option of 'ls'
Message-ID: <20190702165406.GD98338@google.com>
References: <20190701005845.12475-1-yamada.masahiro@socionext.com>
 <20190701005845.12475-6-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701005845.12475-6-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 01, 2019 at 09:58:43AM +0900, Masahiro Yamada wrote:
> The -R option of 'ls' is supposed to be used for directories.
> 
>        -R, --recursive
>               list subdirectories recursively
> 
> Since 'find ... -type f' only matches to regular files, we do not
> expect directories passed to the 'ls' command here.
> 
> Giving -R is harmless at least, but unneeded.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>

