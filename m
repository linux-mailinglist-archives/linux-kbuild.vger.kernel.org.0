Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6DD359292
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Apr 2021 05:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233278AbhDIDJf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Apr 2021 23:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233233AbhDIDJe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Apr 2021 23:09:34 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E497C061761
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Apr 2021 20:09:22 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id t140so2798240pgb.13
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Apr 2021 20:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=p6V7kMAr/qfNsP2NpJNwSvSLsZ0EwZ6E9deTk98f6UM=;
        b=FqMTU93Mb4VBYmWBa2xwQCeJSoQRjSTY0KwqA8yKLBzbU80L4YLdxutfRcXzPWwQ85
         4VnipuSuKCOjQyzBJR/sofD/eWTYEq0xJzfqojfCVDV09IfYbdrU53yuUlDkInGAcBnC
         RSckyjdC9LYXRL671NZRN0jiv/64YKKar5RHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p6V7kMAr/qfNsP2NpJNwSvSLsZ0EwZ6E9deTk98f6UM=;
        b=TyPrL81VzLGaJVa+ZnKT9MSde6tf0JQ9Xe2MJ0Hkk5MIALELRuXUT7NtaF4QYlThDX
         Q1zEVldxe5WzzfriSCBO/fAAiUMSMU9Engl3GPZTDHfObNSl39qWEHXx7o8v4i669rqh
         XauWPAIMkLsi5StfXuXhSVzED7JaVjOj4ZK2AOrbKP1OcRj2xL0Csu8EZKpTUOwpOgXp
         /rfomP0Cm/cx3iy0qwumGZYXGxxHZ+AorT1uNUb/Ep102It+ZxUhPQ8f6+z6xJxvTHou
         Co7Z8hP98iu3llzT7pCWoKenbht1LClHgBZHhpeiTMj5v2W6pr7er2Ptgf79qrAoVTm5
         Y7dQ==
X-Gm-Message-State: AOAM532BPlXHfNYfmEv0l/byXMvelPF1Rq8xBSFsaJERRpfHOqkhfetm
        YHqUhumq0akc+KqKW1Y3PblVSg==
X-Google-Smtp-Source: ABdhPJzk7Zl0O1lLvoWl18AE7wqoq81kr634C0TdGiP11qwod4pzWNf2ghvh6pnXAELrMZto7M9jVw==
X-Received: by 2002:a65:48c5:: with SMTP id o5mr10975475pgs.101.1617937761659;
        Thu, 08 Apr 2021 20:09:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i7sm649034pgq.16.2021.04.08.20.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 20:09:21 -0700 (PDT)
Date:   Thu, 8 Apr 2021 20:09:20 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org
Subject: Re: [PATCH 18/20] kbuild: sh: remove unused install script
Message-ID: <202104082009.D5774EDC4@keescook>
References: <20210407053419.449796-1-gregkh@linuxfoundation.org>
 <20210407053419.449796-19-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407053419.449796-19-gregkh@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 07, 2021 at 07:34:17AM +0200, Greg Kroah-Hartman wrote:
> The sh arch has a install.sh script, but no Makefile actually calls it.
> Remove it to keep anyone from accidentally calling it in the future.
> 
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: linux-sh@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
