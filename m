Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC9F43AA1B1
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Jun 2021 18:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbhFPQpi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Jun 2021 12:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbhFPQpg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Jun 2021 12:45:36 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4535C06175F
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Jun 2021 09:43:30 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id q15so2435347pgg.12
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Jun 2021 09:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LJ1OHgnR34ogOAEVHUpUGKUo8aum/tsPypBTkAfpFU8=;
        b=Pk+mS4DKUQ1J3BqFzsg9jT/dZ5rPDDAQonFTVQeHpjJqyRP1WKGgbZKfUKMsaHW5HH
         YH85LVmuR5elaXNQYOq3yzhE+GPT+tvz/NQLYXtzNwicAwNfi8DcNM6y70q8Ea2/s2dp
         Cz6rTQ92VUchxHiESeQpaxsWa2E4NRiLzr3IQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LJ1OHgnR34ogOAEVHUpUGKUo8aum/tsPypBTkAfpFU8=;
        b=HhU0amtUT+qce71DhykdZ8S8w8VCRBA8+hFT7ZenHoNAIAO5kW1YdCN9uaeong2sOO
         9IHwCkl9i84nwdmg/EWNfZdrj9HxwNT7Msa8w9jmYNHyk+buu3pYU54ZP9NYx2CBoPvB
         O4wCKOsK11aQW1bPlrpaUQcytdwYuhewqeDc8ky017NQiutjZBzQ8+q8E207AT7Qa+w8
         5qyLC0y5vwB4gtSGv7b7O5D2ASnbouTmAKEh94dTyNz4qCJO5KY+nd2RQYsO67YkThuF
         GhlR0B9BUgBzDls6OK9k1Tv964vCGBA0qwq+ceyEKMXXp4mkGebrLq87XIPCRDq54LAI
         Jeuw==
X-Gm-Message-State: AOAM532Al3YfQhM77LSH3sn25aSigW5MJg3jYwt+QrFQtd8FeKSfq3MB
        hIg72Ced3LU+06pn56OjPGzAmQ==
X-Google-Smtp-Source: ABdhPJxx8P6LudPS5rIEnTr/BUC6TgWMdgguqNoArRbYwmw7/JgkUI8vh3DGYEEyc1T9SjhYmMEWrA==
X-Received: by 2002:aa7:9118:0:b029:2eb:2ef3:f197 with SMTP id 24-20020aa791180000b02902eb2ef3f197mr576275pfh.27.1623861810210;
        Wed, 16 Jun 2021 09:43:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id ei23sm5895053pjb.57.2021.06.16.09.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 09:43:29 -0700 (PDT)
Date:   Wed, 16 Jun 2021 09:43:28 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc:     clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, nathan@kernel.org,
        ndesaulniers@google.com, samitolvanen@google.com,
        yj.chiang@mediatek.com
Subject: Re: [PATCH] kbuild: lto: fix module versionings mismatch in
 incremental build
Message-ID: <202106160942.A89674E54@keescook>
References: <202106150821.B4D3E02@keescook>
 <20210616080252.32046-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616080252.32046-1-lecopzer.chen@mediatek.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 16, 2021 at 04:02:52PM +0800, Lecopzer Chen wrote:
> Yes, We can imitate how CLANG_VERSION was implemented in Kconfig.
> 
> Accroding to GNU make release page[1], I've only tested for 3.81,
> 4.2 and 4.3.
> 4.2 was released in 2016, I think it's fine for LTO lowest version.

Okay, sounds good. Are you able to build a patch for this?

Thanks for figuring it out!

-- 
Kees Cook
