Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0ACE1B950D
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2020 04:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgD0CKx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 26 Apr 2020 22:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726084AbgD0CKx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 26 Apr 2020 22:10:53 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 308CCC061A0F;
        Sun, 26 Apr 2020 19:10:53 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id m18so23639915otq.9;
        Sun, 26 Apr 2020 19:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4N0tzn6HxWCVKhbcP3iPrPzqWqbdVMDQSlnfjcrFqNo=;
        b=Hl5k9q5ukoi3szf18rgUOm17uhLI9srrE7wVvHse+gpzS+zBzRST8NQCHhV5LvGtKM
         FuJRIQlamx0E48HcHe6y8OIsWlt46/5MGyHVSa9+FtTO5p1zQVDDWiHSYXxlB6SjitK9
         nt/a+y5ZgdHXhYOh3+ChcRoHW3tM0HQuqS/IKFlXquKuRrBAL1gyA7t09BMAhdZWoCKc
         yNIvBR9DevGIMOe33mjjW1Sij6Nidm3IHW/MSkSq4oSaYvhk7ydRLgr+jX4LWgpwDY+H
         lYV5O4QfbF0ena7beBiIGjmeOhhQ5xo7VFIM+dDlKgpwJEsp8Z6iKQJ1j1LXgWrxmCwU
         rhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4N0tzn6HxWCVKhbcP3iPrPzqWqbdVMDQSlnfjcrFqNo=;
        b=PCusTttDt3v/6Ovgr2NrBTWcKgWHBwwMYetcEXvpJJEr8rmetiCAnu2kJxSBo6XJ5O
         vKhlRZr98o2u254RhO+k/NDZOPp2PydYkeNZb86qT7nC+FbgWpOL1MgowTrJ3nf6e9Yj
         HsViDhi6yYYZa04+K7jUUvIgypBZst3YUVpJ9yptzYUr96KYxHrxoVvSIeM7vceOZVR1
         D5zw+sjJp1yabxU+xRVnztL4XOshwLBdEGNOE7UL56pXjfR3QElwCOszf7+CxD6HjMYf
         YdtKXhvn135J4DZ4NEoA1cd0/fJPW/lSvXgunIqzCfum8Ep+SQ8unSMUiWsqKuW54HOn
         ZFpg==
X-Gm-Message-State: AGi0PuYoVdSSaRv6kVnIW/F1NW+d/K5QPfa3FJIHGrC7jOJTZv0qr0C9
        yHI9SS/roP3pFipzhZdG5rk=
X-Google-Smtp-Source: APiQypJrYOdevGlvw/kgcnt9kU19pHmd/u7nQtNhqmbnRNON7LpqS2Fr1a/gxig/Gh3i9GdvpiRZUQ==
X-Received: by 2002:aca:c6ca:: with SMTP id w193mr14030066oif.165.1587953452299;
        Sun, 26 Apr 2020 19:10:52 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id s10sm3589988otd.69.2020.04.26.19.10.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Apr 2020 19:10:51 -0700 (PDT)
Date:   Sun, 26 Apr 2020 19:10:50 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nathan Huckleberry <nhuck15@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: remove unused AS assignment
Message-ID: <20200427021050.GA27787@ubuntu-s3-xlarge-x86>
References: <20200427003019.2401592-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427003019.2401592-1-masahiroy@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 27, 2020 at 09:30:19AM +0900, Masahiro Yamada wrote:
> $(AS) is not used anywhere, hence commit aa824e0c962b ("kbuild: remove
> AS variable") killed it.
> 
> Remove the left-over code in arch/{arm,arm64}/Makefile.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
