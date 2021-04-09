Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7864359296
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Apr 2021 05:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233268AbhDIDJv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Apr 2021 23:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233281AbhDIDJj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Apr 2021 23:09:39 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F5FC061760
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Apr 2021 20:09:26 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id n38so3304691pfv.2
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Apr 2021 20:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xyh6BxCHlq1iAwIp2l2ghcJeSru17U4VrmKNujzabBo=;
        b=gaXW1ByvnpXDvy03WBlHEsOpeWqkl+IMPsH9g76iioXRz1z8bPmJz4pHR8er87VGOs
         q0j4D3xA42fFaBaC+Wc2bGUPy1vG2qs9g6xx+m39/3sSmmeAkPOBruRqiytUt7lFIXOx
         ECEY4zWHM/F00YNNKP1MFuyBuH0f1h2YJ+vNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xyh6BxCHlq1iAwIp2l2ghcJeSru17U4VrmKNujzabBo=;
        b=GHpzRsziaYqjWtP0tZWvPfJmoWth3V5ueND+z1c9UWV548XTv7oM/zA8vP+ScTHDx6
         4ZAyNwI+hD9mYLJTxDYvmL+LCwYuNQ8c0/h81lZ+yfPTVjx/PU2WwKEYjs4btJTzZBTC
         qItCgvg+PJQzHkWa+JFdJxc0AvCFj+f7sUPxqP5CtdrP7z1kyotpEOU8kO95RYkqCcsN
         IxHDyTYrE7V/gswP7dcE9Qm+OYzN0IuVa6TLX6hpagvcl8FNsfXLR03IZwBBxsOV3DFF
         opkURx5Upinp1BsgdIs5IfEY63YPDqCAKkDqQCAacjliarxPEd0Y9Kl9SGr7tRM6xH0U
         coQQ==
X-Gm-Message-State: AOAM5312pZMcCnbRv70iikcfCTelY6lp96XmHkEAvKn/bDyZOxXujO7k
        W6LYxuaeQzU9Loe5ZX4Ouv9VPg==
X-Google-Smtp-Source: ABdhPJwqsQQCEFuyz+SVMPOLde4MIRXWpWw0fPXSj4UDkVgy7Ze/NK3Erv5r4Bn81Bjqmi2BOa8+qQ==
X-Received: by 2002:a63:3644:: with SMTP id d65mr10908485pga.49.1617937766156;
        Thu, 08 Apr 2021 20:09:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 7sm698015pfv.97.2021.04.08.20.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 20:09:25 -0700 (PDT)
Date:   Thu, 8 Apr 2021 20:09:24 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Subject: Re: [PATCH 19/20] kbuild: sparc: use common install script
Message-ID: <202104082009.39B8056B0@keescook>
References: <20210407053419.449796-1-gregkh@linuxfoundation.org>
 <20210407053419.449796-20-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407053419.449796-20-gregkh@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 07, 2021 at 07:34:18AM +0200, Greg Kroah-Hartman wrote:
> The common scripts/install.sh script will now work for sparc, all that
> is needed is to add it to the list of arches that do not put the version
> number in the installed file name.
> 
> With that we can remove the sparc-only version of the install script.
> 
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: sparclinux@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
