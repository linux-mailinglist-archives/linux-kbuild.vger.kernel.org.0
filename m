Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 729376686A4
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jan 2023 23:14:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240526AbjALWN1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Jan 2023 17:13:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232816AbjALWM4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jan 2023 17:12:56 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B3F73B910
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jan 2023 14:06:51 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so22473092pjj.4
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jan 2023 14:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FnbKiO7ajEV7SWU0kUyNEcHLUgki6RWJkndix3Av1gE=;
        b=BfK7XPga9+5vXyUQP/v/aDW7Ka8vj9ZKyVNeKr+vpx+bcmPMsQuyUDO1oFuXEe6JG+
         rKdPLD7AC6VpKpBGiGrG+5uT+b+rkVYgt/1ErXvL76wmK9aiIrDKpRW4ymU8kWJfn73s
         ZVx7dMRxLaxDIBX+1sE9G0T/Pm4T9KAQw+UXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FnbKiO7ajEV7SWU0kUyNEcHLUgki6RWJkndix3Av1gE=;
        b=1fmzMp7GeGc7IL3g1SXa7Vtccz7FsmUKHnmcG1JPHvUDRMFrK/lsMrl7ID2NYEITL8
         ASLBZRomLZhM2LZx/mP2MBzHw6Ay5FWk76W/KQ7JSds6FZj01/s4D3SfMKfLZQjRGGX7
         s59ooGXX0epbWZ5cBk6peYjyKkLHGeaVeCICO+eO3twyh4vM5OiFlUOexpSxZqRTQ/d8
         rsFCWXuJ/Rv6Vw4Q2aP8kFIoCE9Bw3vI0Xq57v6kf0CSMBWCT5onRE86i9VCVF786upi
         ZIL2AL+KneV0/xA95qe3spLISExdL514e5a2tC/4IRO9HoJ42IjoX3QAWqv47uCOB2Oh
         L6Vw==
X-Gm-Message-State: AFqh2koRsVAxMQW1YwA2eSHKkc9j6ag5HzPHKY+VUXnvW3Fy/Y4xMpGf
        J9xQ2SoK42ESgwBPH1JCDL2vxQ==
X-Google-Smtp-Source: AMrXdXs8n0YkIxD05d524WSSC25s1n3FfRw1ADxQs7JTf7HSV70djM+27SyCQh2Rsa5KQa+0i78IpQ==
X-Received: by 2002:a17:902:6a87:b0:194:6d39:5911 with SMTP id n7-20020a1709026a8700b001946d395911mr490309plk.40.1673561210990;
        Thu, 12 Jan 2023 14:06:50 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t2-20020a170902e84200b001946a3f4d9csm226007plg.38.2023.01.12.14.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 14:06:50 -0800 (PST)
Date:   Thu, 12 Jan 2023 14:06:49 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, llvm@lists.linux.dev
Subject: Re: [PATCH] scripts: handle BrokenPipeError for python scripts
Message-ID: <202301121403.599806C597@keescook>
References: <20230112023006.1873859-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230112023006.1873859-1-masahiroy@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 12, 2023 at 11:30:06AM +0900, Masahiro Yamada wrote:
>     def main():
>         try:
>             # simulate large output (your code replaces this loop)
>             for x in range(10000):
>                 print("y")
>             # flush output here to force SIGPIPE to be triggered
>             # while inside this try block.
>             sys.stdout.flush()
>         except BrokenPipeError:
>             # Python flushes standard streams on exit; redirect remaining output
>             # to devnull to avoid another BrokenPipeError at shutdown
>             devnull = os.open(os.devnull, os.O_WRONLY)
>             os.dup2(devnull, sys.stdout.fileno())
>             sys.exit(1)  # Python exits with error code 1 on EPIPE

I still think this is wrong -- they should not continue piping, and
should just die with SIGPIPE. It should simply be:

signal(SIGPIPE, SIG_DFL);

Nothing else needed. No wasted CPU cycles, shell handling continues as
per normal.

>     if __name__ == '__main__':
>         main()
> 
>   Do not set SIGPIPE’s disposition to SIG_DFL in order to avoid
>   BrokenPipeError. Doing that would cause your program to exit
>   unexpectedly whenever any socket connection is interrupted while
>   your program is still writing to it.

This advise is for socket programs, not command-line tools.


-Kees

-- 
Kees Cook
