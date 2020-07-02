Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86158212799
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Jul 2020 17:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729936AbgGBPSs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Jul 2020 11:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726117AbgGBPSs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Jul 2020 11:18:48 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07729C08C5C1
        for <linux-kbuild@vger.kernel.org>; Thu,  2 Jul 2020 08:18:48 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id j19so6752075pgm.11
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Jul 2020 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZoZRqj79509W+zskyZYR+5ZRtTQjElio5nf3SxUK6Lg=;
        b=i2/zLzcCZwqyCEyCmbGH0DgqG1xZii1BrbGzixiC6SqNv9zW9vtxMyduhe7cJVlM/S
         avL9+fyIy0AxlMy4jH+e6u2XYkc+K44JhOC5s3s0iGjNLnR7Y03lH+yYQ3rd0JARDNhw
         deuZfSDE7JrYDO0TOVYntZ/jxqBq4V2zFVjEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZoZRqj79509W+zskyZYR+5ZRtTQjElio5nf3SxUK6Lg=;
        b=NV7dRY+TmSJxFNuYxrt0rqKE/1YrIIjPVRP+uZElZNtymL+Z/xydtEddLmIz6wCYaR
         vStPi5DdAY7igO858IsB2KQjaFxfEB9jIXZd0A7nVopZc/0iyOTEUdFA6QCDMi888kKy
         gbvjqHmNak1Bgtk/dAaMYJO6LCBtweqadgNwHuTaRpdasHQxHquGrB6qDkd43Im1VtyY
         kujNmClURVN5xPohyG5Wlb4Q/B/lUR0moIgaLHgSO2xhWsuCsxYA8eJTEES1QhTKuTCc
         pks2Ph4zvvh/UrWyJTd849Nq6zHyJxRT34J5Q2TAT7nsyP/AnJ40rpHeD9AbyPiw8oin
         RbeA==
X-Gm-Message-State: AOAM533sB+wuHIw1iYJ0uHrtRQyfAoCoW5lmpD2w85F0GJwAbp6VzVEy
        FQuUHAVwhVwOCTduxmawHsHasQ==
X-Google-Smtp-Source: ABdhPJyDT39ApMmhu3R+RsMDMocrgz+h34f1a0sxmX8XLpY/OiD4ypQApRdsmsl674UurYNSKifffA==
X-Received: by 2002:a63:20d:: with SMTP id 13mr25094225pgc.166.1593703127475;
        Thu, 02 Jul 2020 08:18:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w1sm2384911pfc.55.2020.07.02.08.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 08:18:46 -0700 (PDT)
Date:   Thu, 2 Jul 2020 08:18:45 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Cc:     linux-kernel@vger.kernel.org,
        Nick Terrell <nickrterrell@gmail.com>,
        Nick Terrell <terrelln@fb.com>,
        Norbert Lange <nolange79@gmail.com>, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: Kernel compression benchmarks
Message-ID: <202007020818.87EA89106@keescook>
References: <1588791882.08g1378g67.none.ref@localhost>
 <1588791882.08g1378g67.none@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588791882.08g1378g67.none@localhost>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 01, 2020 at 10:35:48AM -0400, Alex Xu (Hello71) wrote:
> ZSTD compression patches have been sent in a number of times over the 
> past few years. Every time, someone asks for benchmarks. Every time, 
> someone is concerned about compression time. Sometimes, someone provides 
> benchmarks.

Where's the latest series for this, btw? I thought it had landed. :P It
seemed like it was done.

-- 
Kees Cook
