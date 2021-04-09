Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C094635929E
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Apr 2021 05:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233272AbhDIDKB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Apr 2021 23:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233006AbhDIDJz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Apr 2021 23:09:55 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73032C061761
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Apr 2021 20:09:43 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id i4so2192306pjk.1
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Apr 2021 20:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aGjpPdHjbikhUUHMN/hFWeNzd7WisbqRaJNjGgjQHk4=;
        b=f6XyQdchZKxJJHvj5afdCGghuryVbmtGteA9ENz/eIqYYPzKdD5v9v04MJTus4RJS/
         hMmqW0kcTy+qkM829/735O5HTeyc0/vCJuDPcZ06DWpD9AsUzEqMGBDbkAc3TqlHlTQd
         ETyMB3ICC1lDt3H4kHYCwr3ATSqfcv7cDk5K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aGjpPdHjbikhUUHMN/hFWeNzd7WisbqRaJNjGgjQHk4=;
        b=CUXDdyBj3hhuutLTrJidW0P/X1z1HjqEEIeuxvOXHt90ycjSJoNfxxiQHxiK9gBP5l
         wcO1zrFb5bc6dX4/tSSEtXjyWBAfdJNMGWuZFq9F11sPn88agOFYbjwyiJGnKb0Xw5Z7
         YyNkO/QwGl9sz3+D+2fueU4Srm3da9FG6tkHGqlzkLGBOzdBxUf0OqqPhsjXcyqUCkR1
         IPJ3Vax/dcylbUFpDuKU/m7/oxNKDn2BN4UaxTYQpiXF7/s7pa5KGrVfcSM7rvjP6ULG
         TV1j7chHMzBw/0H2qY5l+sNixJOaYet2236VW/AcYXbmdzECnAqMBgitTq0xNbrbMCcO
         VVpQ==
X-Gm-Message-State: AOAM533gzgMcg9Dsn5lxjXaxeNd7Uv8kzdRAzMfsBynJx2FPtm92q0/m
        6cCo5+EK8IgT5WB/IIf0B1Jrfw==
X-Google-Smtp-Source: ABdhPJyKtgFSKPJk1xkQBwFjg8Td3IauMVaVd48bNIAS1NFLnWN1JzZCJ0wGKi6CJMSgvcE3ZN2QFQ==
X-Received: by 2002:a17:90b:f04:: with SMTP id br4mr11796658pjb.99.1617937783065;
        Thu, 08 Apr 2021 20:09:43 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id em16sm621526pjb.43.2021.04.08.20.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 20:09:42 -0700 (PDT)
Date:   Thu, 8 Apr 2021 20:09:41 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 10/20] kbuild: arm: use common install script
Message-ID: <202104082009.5334E9CA@keescook>
References: <20210407053419.449796-1-gregkh@linuxfoundation.org>
 <20210407053419.449796-11-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407053419.449796-11-gregkh@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 07, 2021 at 07:34:09AM +0200, Greg Kroah-Hartman wrote:
> The common scripts/install.sh script will now work for arm, all that
> is needed is to add the compressed image type to it.  So add that file
> type check and the ability to call /sbin/loadmap after copying the
> kernel.  With that we can remove the arm-only version of the file.
> 
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
