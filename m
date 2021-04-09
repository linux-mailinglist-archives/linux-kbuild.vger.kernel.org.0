Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA73D35927A
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Apr 2021 05:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232662AbhDIDId (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Apr 2021 23:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232831AbhDIDId (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Apr 2021 23:08:33 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08AC7C061762
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Apr 2021 20:08:20 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id p12so2808813pgj.10
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Apr 2021 20:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qBMvo8evKNRC1mxrN/i7ZVaEgG6elSKJhlY8HtxFtHo=;
        b=NgeQId413/TWMsJRKMQzt4AMwYyCF3vnpS8DNOnr5M9IlgSa+6pklDgCshooKKqU9c
         ybAs87qAUg8YkXygY0a8syQePjVbaDcLRyn3BBBwIY5JngGyXAQ3UN8l0IIBbu5Lo5Vn
         ZGUP6yO8JgEtHdKcMLnH/3YQjlxOOZP8f/lso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qBMvo8evKNRC1mxrN/i7ZVaEgG6elSKJhlY8HtxFtHo=;
        b=AQO+1dNq2PcBvlAY9ak0EEpAZloShSwGxn1JDvlFt0gxpzn9KulghxR2yzU8TlB1Xa
         6qiXIqqsKxrlOec8pvVtW3XZ/mdmzFvyEyv+UadCYYkLQwMrGtgwpPOC6xcCcpZPeqSO
         awlpHbvz7xKxj2f9BHgxUFzvuUGg2wolH7dyfHoC1LvaQ4PXNeK7s1lRfp/fAYDC5iPi
         Ks6TeUUeXax0091Y5stPcMcXS4NcOCHlJ0d/ul5Lij01pHOr7V1JEzOnZyE+25DX4BKV
         EVqpHI31P9RQHhe78EP67P6RZdlN7YPwYPe5E5XB3e/XdzLcj8YXnu67sYAXCwTw2mHJ
         qnDA==
X-Gm-Message-State: AOAM531AfOwN1c8UOF21HCY79y6GOev9NbAp2t8pN41JSk7wMF1DEOnC
        4zxCtcYIxITsLiTC6DEagMMcrA==
X-Google-Smtp-Source: ABdhPJyHo1TPCLI+4uWyuTbfK5+Vodl/lmd7z9H7XsnC6ze0ivUxnfzHT+a9JH2slM6oVprHwdDR8g==
X-Received: by 2002:a65:4d4c:: with SMTP id j12mr10846262pgt.346.1617937700544;
        Thu, 08 Apr 2021 20:08:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x2sm676590pfx.41.2021.04.08.20.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 20:08:19 -0700 (PDT)
Date:   Thu, 8 Apr 2021 20:08:18 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 09/20] kbuild: arm64: use common install script
Message-ID: <202104082007.88622E72F@keescook>
References: <20210407053419.449796-1-gregkh@linuxfoundation.org>
 <20210407053419.449796-10-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407053419.449796-10-gregkh@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 07, 2021 at 07:34:08AM +0200, Greg Kroah-Hartman wrote:
> The common scripts/install.sh script will now work for arm65, no changes

nit: arm64

> needed so convert the arm64 boot Makefile to call it instead of the
> arm64-only version of the file and remove the now unused file.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

With that fixed:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
